# Log Archive Tool 🗄️

A simple CLI-based log archiving tool built using **Bash**.  
It compresses system logs into a `.tar.gz` archive with the current date and time, stores them in a separate directory, and keeps a record of archive operations.

This tool is useful for **log management**, **system cleanup**, and **DevOps automation** tasks.

---

## 🔗 Project URL

👉 https://github.com/adhithyan-31/log-archive-tool

---

## 🚀 Features

- Accepts a log directory as a command-line argument
- Compresses logs into a timestamped `.tar.gz` file
- Stores archives in a dedicated directory
- Maintains a log file with archive date and time
- Simple, lightweight, and fast
- Works on Unix/Linux-based systems

---

## 🛠️ Requirements

- Unix/Linux-based OS
- Bash shell
- `tar` utility (usually pre-installed)

---

## 📂 Project Structure

```text
log-archive
log_archives/
 ├── logs_archive_YYYYMMDD_HHMMSS.tar.gz
 └── archive.log
