#https://medium.com/@antelle/how-to-generate-a-self-signed-ssl-certificate-for-an-ip-address-f0dd8dddf754
# go does not support self-signed SSLs so this won't work without a LetsEncrypt SSL somewhere

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt -subj "/C=US/ST=MI/L=/O=/OU=/CN="