disable_mlock = true
cluster_addr  = "https://127.0.0.1:8201"
api_addr      = "https://127.0.0.1:8200"
ui = true

seal "awskms" {
region     = "us-east-1"
kms_key_id = "arn:aws:kms:us-east-1:657453443394:key/a59551a7-aa34-4fd7-810d-4638ceaf7a8d"
}

listener "tcp" {
    address = "127.0.0.1:8200"
    tls_disable = "true"
}

storage "file"{
	path="/home/uday/vault/data"
}

