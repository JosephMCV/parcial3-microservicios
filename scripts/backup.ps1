# backup.ps1



$DATE = Get-Date -Format "yyyyMMdd-HHmm"


$backupDir = "backups\backup-$DATE"
New-Item -ItemType Directory -Force -Path $backupDir | Out-Null


docker exec parcial_mongo mongodump --uri="mongodb://admin:admin123@mongo:27017" --out="/data/db/backup-$DATE"


docker cp parcial_mongo:/data/db/backup-$DATE .\$backupDir

Write-Host "✅ Backup guardado en $backupDir"
