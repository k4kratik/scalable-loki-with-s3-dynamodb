## Terraform Infra Code

This Directory contains all the file to deploy our Infra.

We are using Modules to separate the code of Networking Resources from Compute Resources.

\- https://medium.com/@mitesh_shamra/module-in-terraform-920257136228

</br>
We are following some approach for file management for all modules including root modules.

**FYI** - It is not mandatory to follow any file management approach, you can define everything in main.tf file as well but to make code management easier you should separate those files logically.

</br>

`data.tf` - To Store all Data Resources

`backend.tf` - To Configure and  instruct TF to use oru S3 backend.

`main.tf` - main file where we have defined all resources.

`provider.tf` - To define the details of the Provider. (AWS)

`variables.tf` - To define variables to reuse them somewhere.

`versions.tf` - Defining some constraints around versions of Provider, Terraform itself, etc.

`outputs.tf` - To Define output variables.
**Note** - if you are defining output variables in child modules, `terraform output` command won't show in actual outputs, unless and untill you define those output variables in root module's outputs.

</br>


Ex - This is how I Defined the output in child module.

```
output "elastic-ip-addr" {
  value = aws_eip.elastic-ip.public_ip
}

```
Ex - This is how I Defined the output in root module to access the output of root module.
```
output "elastic-ip-addr" {
  value = module.networking.elastic-ip-addr
}
```