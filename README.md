# aws-saml-tokens

Pair with `SAML to AWS STS Keys Conversion` Chrome extension and set it to save as `credentials.txt`. This script will read the credentials and feed values to `aws configure`.

```
aws set aws_access_key_id $key --profile saml
aws set aws_secret_access_key $value --profile saml
aws set aws_session_token $token --profile saml
```
