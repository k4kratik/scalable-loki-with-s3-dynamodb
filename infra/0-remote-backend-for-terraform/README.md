## Remote Backend For Terraform

We are using Remote Backend (Type: S3) for storing our Terraform State File.
https://www.terraform.io/docs/language/settings/backends/s3.html

\+

We are using DynamoDB as a locking mechanism.

*"DynamoDB can be used as a locking mechanism to remote storage backend S3 to store state files. The DynamoDB table is keyed on “LockID” which is set as a bucketName/path, so as long as we have a unique combination of this we don’t have any problem in acquiring locks and running everything in a safe way."*

https://medium.com/@mitesh_shamra/state-management-with-terraform-9f13497e54cf


This approach is very helpful in collaborative environments.
https://medium.com/@itsmattburgess/why-you-should-be-using-remote-state-in-terraform-2fe5d0f830e8



So  before starting anything, You have to setup your s3 backend.

```
terraform init

terraform apply
```
