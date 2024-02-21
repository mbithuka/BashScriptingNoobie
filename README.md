1. Installed ssmtp
command sudo apt update && apt install ssmtp 

2. Updated configuration file at /etc/ssmtp/ssmtp.conf

command sudo nano /etc/ssmtp/ssmtp.conf

 mailhub=smtp.gmail.com:587
 UseSTARTTLS=YES
 AuthUser=myemail@gmail.com
 AuthPass=XXXXXXXXXXXXXXX
 TLS_CA_File=/etc/pki/tls/certs/ca-bundle.crt

For AuthPass add app password by enabling TFA in gmail security settings.
Gmail auto generates the app password, copy and paste it AuthPass=paste here

3. Wrote bash script sendMail.sh
4. change permission of script to executable
chmod u+x sendMail.sh
5. To run the script
./sendMail.sh

