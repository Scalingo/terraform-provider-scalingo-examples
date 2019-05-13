# Scalingo Terraform Examples

## How to use this repository

In every directory there are some Terraform examples to manipulate Scalingo resources.
To use it, you just have to initialize it and provide a Scalingo API Token:

```
terraform init
export TF_VAR_sc_token=tk-....
terraform plan
terraform apply
```

## Existing examples:

* `notifiers`: how to create Slack or email notifiers
