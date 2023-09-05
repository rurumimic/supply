# Certs

## Make my certs

- letsencrypt: [Making and trusting your own certificates](https://letsencrypt.org/docs/certificates-for-localhost/#making-and-trusting-your-own-certificates)

```bash
openssl req -x509 -out localhost.crt -keyout localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <( \
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
```

### PEM to DER

```bash
openssl x509 -outform der -in localhost.crt -out localhost.der
openssl x509 -outform der -in localhost.pem -out localhost.der
```

### DER to PEM

```bash
openssl x509 -inform der -in localhost.der -out localhost.pem
```

### Decrypt

```bash
openssl x509 -in localhost.crt -text -noout
openssl x509 -in localhost.pem -text -noout
openssl x509 -in localhost.der -text -noout
```

