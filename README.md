# 🎮 Rock Paper Scissors (ERC-20 Wager)

A decentralized **Rock Paper Scissors** game built with **Solidity** that lets two players compete by staking ERC-20 tokens.  
This project demonstrates how blockchain can power transparent, trustless gaming — no intermediaries, no cheating!

---

## 🧩 Project Description

This smart contract implements a **two-player wager system** where each participant locks in a certain number of ERC-20 tokens and chooses a move: Rock, Paper, or Scissors.  

Once both moves are submitted, the contract:
- Automatically determines the winner,
- Transfers the prize pool to them,  
- Or refunds both players if it’s a tie.  

The goal of this project is to teach **Solidity basics**, **ERC-20 interaction**, and **secure game logic** on the Ethereum network.  
It’s perfect for developers who want to learn how to build **simple blockchain games** or **token-based betting systems**.

---

## 🚀 What It Does

1. **Player 1** creates a game by specifying an opponent, wager amount, and their move.  
2. Tokens are transferred from Player 1 to the contract as a stake.  
3. **Player 2** joins the game, makes their move, and deposits the same wager.  
4. The contract automatically compares both moves:  
   - 🏆 Winner receives both wagers.  
   - 🤝 In case of a tie, both get their tokens back.  
5. Game results are stored transparently on-chain.

---

## 🌟 Features

- 🔒 **Secure ERC-20 Integration** — Uses `transferFrom` and `transfer` for safe token handling.  
- 🎯 **Fair Gameplay** — Logic ensures no cheating once moves are locked.  
- ⚙️ **Automated Resolution** — Contract autonomously decides the outcome.  
- 🧠 **Beginner-Friendly Solidity Example** — Clean, readable, and great for learning.  
- 📜 **Transparent Results** — All actions recorded immutably on the blockchain.  

---

## 📡 Deployed Smart Contract Link

**Contract Address:** 0x17653d520231b6881A8C3238C99ba09476f8DfD4

🧰 Tech Stack

Solidity ^0.8.20

Ethereum / EVM-compatible network

ERC-20 Token Standard

🪙 Example Use Case

Alice and Bob agree to play Rock Paper Scissors using 10 tokens each.

Alice starts the game and commits 10 tokens.

Bob joins and commits his 10 tokens.

The contract evaluates both moves and sends 20 tokens to the winner — automatically.

<img width="1366" height="768" alt="Screenshot (6)" src="https://github.com/user-attachments/assets/112aa034-56fe-4886-8ee0-fd51caf965aa" />



