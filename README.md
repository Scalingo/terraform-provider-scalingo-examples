# Scalingo Terraform Examples

## How to use this repository

In every directory there are some terraform examples to manipulate scalingo resources.
To use it, you just have to init it and provider a Scalingo API Token

```
terraform init
export TF_VAR_sc_token=tk-....
terraform plan
terraform apply
```

## Existing examples:

* `notifiers`: Creates how to create slack or emails notifiers
