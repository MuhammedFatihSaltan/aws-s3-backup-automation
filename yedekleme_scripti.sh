#!/bin/bash
#Değişkenler
BUCKET_NAME="my-app-backup-devops-2026"
BACKUP_DIR="/home/ec2-user/app/data"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
DEST_FILE="/tmp/yedek_$TIMESTAMP.tar.gz"

echo "Yedekleme basliyor: $TIMESTAMP"

# 1. Verileri sıkıştır
tar -czf $DEST_FILE $BACKUP_DIR

# 2. S3'e yükle
aws s3 cp $DEST_FILE s3://$BUCKET_NAME/backups/

# 3. Yerel geçici dosyayı temizle 
rm $DEST_FILE

echo "Yedekleme basariyla tamamlandi ve S3'e gonderildi."
