// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Rock Paper Scissors (ERC-20 wager)
interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract RPS {
    enum Move { None, Rock, Paper, Scissors }

    struct Game {
        address player1;
        address player2;
        uint256 wager;
        Move player1Move;
        Move player2Move;
        bool finished;
    }

    IERC20 public immutable token;
    uint256 public gameCount;
    mapping(uint256 => Game) public games;

    constructor(address _token) {
        require(_token != address(0), "Invalid token");
        token = IERC20(_token);
    }

    /// Player 1 creates a new game and stakes tokens
    function createGame(address _opponent, uint256 _wager, Move _move) external returns (uint256 gameId) {
        require(_opponent != address(0) && _opponent != msg.sender, "Invalid opponent");
        require(_move != Move.None, "Invalid move");
        require(_wager > 0, "Wager must be > 0");

        require(token.transferFrom(msg.sender, address(this), _wager), "Transfer failed");

        gameCount++;
        games[gameCount] = Game({
            player1: msg.sender,
            player2: _opponent,
            wager: _wager,
            player1Move: _move,
            player2Move: Move.None,
            finished: false
        });

        return gameCount;
    }

    /// Player 2 joins and plays
    function joinGame(uint256 _gameId, Move _move) external {
        Game storage g = games[_gameId];
        require(msg.sender == g.player2, "Not invited");
        require(!g.finished, "Game finished");
        require(g.player2Move == Move.None, "Already played");
        require(_move != Move.None, "Invalid move");

        require(token.transferFrom(msg.sender, address(this), g.wager), "Transfer failed");
        g.player2Move = _move;

        address winner = _determineWinner(g.player1, g.player2, g.player1Move, g.player2Move);
        g.finished = true;

        uint256 pot = g.wager * 2;
        if (winner == address(0)) {
            token.transfer(g.player1, g.wager);
            token.transfer(g.player2, g.wager);
        } else {
            token.transfer(winner, pot);
        }
    }

    function _determineWinner(address p1, address p2, Move m1, Move m2) internal pure returns (address) {
        if (m1 == m2) return address(0);
        if (
            (m1 == Move.Rock && m2 == Move.Scissors) ||
            (m1 == Move.Paper && m2 == Move.Rock) ||
            (m1 == Move.Scissors && m2 == Move.Paper)
        ) return p1;
        return p2;
    }
}
