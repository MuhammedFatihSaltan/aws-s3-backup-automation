AWS S3 Otomatik Yedekleme Otomasyonu
Bu proje, bir Linux sunucusu (AWS EC2) üzerindeki kritik uygulama verilerinin her gece otomatik olarak paketlenip, 
güvenli bir şekilde bulut depolama alanına (AWS S3) yedeklenmesini sağlayan bir DevOps otomasyon çözümüdür.

*** Projenin Amacı ve Özellikleri ***
Bu çalışma, manuel yedekleme süreçlerini ortadan kaldırarak veri kaybı riskini minimize etmek 
ve güvenlik standartlarına uygun bir yedekleme mimarisi oluşturmak amacıyla geliştirilmiştir.

Sıfır Müdahale (Automation): Cron Job kullanılarak yedekleme işleminin her gece saat 02:00'de otomatik çalışması sağlanmıştır.

Güvenli Erişim (IAM Role): AWS Access Key/Secret Key gibi hassas bilgileri script içinde saklamak yerine,
EC2 sunucusuna atanan IAM Role üzerinden şifresiz ve güvenli bağlantı kurulmuştur.

Depolama Yönetimi: Veriler tar.gz formatında sıkıştırılarak depolama maliyetlerinden tasarruf sağlanmış 
ve her yedek dosyasına benzersiz bir tarih damgası eklenmiştir.

İzlenebilirlik: Süreçteki tüm adımlar ve olası hatalar bir log dosyasına (backup.log) 
kaydedilerek sistemin durumu takip edilebilir hale getirilmiştir.

🛠️ Kullanılan Teknolojiler
Bulut Platformu: AWS (EC2, S3, IAM)

İşletim Sistemi: Linux (Amazon Linux 2023)

Betik Dili: Bash Scripting

Zamanlayıcı: Cron

📂 Dosya Yapısı
yedekleme_scripti.sh: Yedekleme mantığını içeren ana betik.

.gitignore: Gereksiz log ve geçici dosyaların versiyon kontrolüne girmesini engeller.

⚙️ Kurulum ve Kullanım
Script dosyasını sunucunuza indirin ve çalıştırma yetkisi verin: chmod +x yedekleme_scripti.sh

AWS IAM üzerinden EC2 sunucunuza S3 yazma yetkisi olan bir rol atayın.

crontab -e komutu ile zamanlayıcıyı kurun:
Bash -> 0 2 * * * /home/ec2-user/yedekleme_scripti.sh >> /home/ec2-user/backup.log 2>&1
