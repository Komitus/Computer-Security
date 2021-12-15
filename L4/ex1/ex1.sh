#!/usr/bin/bash  

# pass = 1234
# generate A-key and CSR for it
openssl genrsa  -aes192 -out privkeyA.pem 
openssl req -new -key privkeyA.pem -out certA.csr < data_certA_csr.txt

# become CA by self-signing
openssl genrsa  -aes192 -out privkeyB.pem 
openssl req -new -x509 -key privkeyB.pem -out CAcert.crt -days 30 < data_CA_crt.txt

# with B-key and its crt sign CSR (certificate sign request) of A-key
openssl x509 -req -days 45 -in certA.csr -CA CAcert.crt -CAkey privkeyB.pem -set_serial 01 -out certA.crt

# for decrypting
openssl rsa -in privkeyA.pem -out keyA.unencrypted.pem -passin pass:1234
