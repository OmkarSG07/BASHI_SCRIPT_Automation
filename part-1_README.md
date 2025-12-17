# Linux Backup Project – README

This project manages backup and restore operations on a Linux server. Below is a step-by-step explanation of each action performed.

---
📂 Step 1: Initial Directory Listing
```bash
ls /var/www/data/
```
- Lists the files inside /var/www/data/.
- Initially, the directory contained: file1.txt, file2.txt, file3.txt.
---
🗑️ Step 2: File Deletion
```bash
rm /var/www/data/file2.txt
```
- The rm command deletes file2.txt.
- Running ls again shows only file1.txt and file3.txt remaining.
---
📂 Step 3: Checking Backup Directory
```bash
ls /home/ubuntu/linux-backup-project/backup
```
- The backup directory contains multiple timestamped folders:
- 2025-12-17_10-47
- 2025-12-17_10-56
- 2025-12-17_10-57
---
🔄 Step 4: Restoring Deleted File with rsync
```bash
rsync -av /home/ubuntu/linux-backup-project/backup/2025-12-17_10-57/ /var/www/data/
```
- rsync restores files from the backup folder.
- Output shows file2.txt was restored.
- Now /var/www/data/ contains file1.txt, file2.txt, file3.txt.
---
🌳 Step 5: Project Structure Overview
```bash
tree -L 3
```
- Displays the project structure:
- backup/ contains multiple timestamped folders.
- scripts/ contains:
- backup.sh
- monitor.sh
- restore.sh
- logs/backup.log stores backup logs.
---
🔄 Step 6: Running rsync Again
```bash
rsync -av /home/ubuntu/linux-backup-project/backup/2025-12-17_10-57/ /var/www/data/
```
- Running rsync again performs an incremental sync.
- Only file2.txt was copied since other files were already up-to-date.
---
📝 Step 7: Running Backup Script
```bash
./scripts/backup.sh
```
- Executes the backup script.
- A new backup folder 2025-12-17_17-00 is created.
- This folder contains file1.txt, file2.txt, file3.txt.
---
🌳 Step 8: Final Project Structure
```bash
tree -L 3
```
- Final structure shows 6 backup folders:
- 2025-12-17_10-47
- 2025-12-17_10-56
- 2025-12-17_10-57
- 2025-12-17_16-58
- 2025-12-17_16-59
- 2025-12-17_17-00
- scripts/ contains backup, monitor, and restore scripts.
- logs/backup.log tracks operations.
---
📌 Usage Notes
- Be careful with rm – deleted files can only be recovered if backups exist.
- rsync is incremental – only changed files are copied.
- backup.sh saves the current state of /var/www/data/.
- Logs help track backup operations.
---
✅ Summary
- Delete: Used ```rm``` to remove a file.
- Restore: Used ```rsync``` to restore from backup.
- Backup: Used ```backup.sh``` to create a new backup.
- Verify: Used ```tree``` to confirm project structure
---
