Requirements
----------------
 first of all you have to install terraform on your machine  
  
linux 32: https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_linux_386.zip  
linux 64: https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_linux_amd64.zip  
  
Mac OSX: https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_darwin_amd64.zip  
Windows 32: https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_windows_386.zip  
Windows 64: https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_windows_amd64.zip  
  
on linux and mac place the binary file on /usr/local/bin and you can execute terraform from anywhere  
on Windows have to uncompress the file and add the folder to the PATH variable  
  
another requirment it's AWS access and secret key  
  
  
How to use
-----------  
for security reasons I dont included the variables for the secret and access key on the files to avoid any issue  
but you can use Environment variables like this:  
export AWS_ACCESS_KEY_ID=  
export AWS_SECRET_ACCESS_KEY=  
export AWS_DEFAULT_REGION=us-east-1  
  
also it's possible to create a file with those lines and when required just source the file like this:  
source .envFile  
-or-  
. .envFile  
  
with that you are ready to run: terraform plan  
when you run the command it's going to ask you some values like subnet, key name, hosted zone, etc... if you dont  
want to be asked by the bvalues every time you run terraform you can export the variables in this way:  
export TF_variable_name=value  
  
when you provide all the information required terraform it's going to show you what it's going to build, instances, ELBs, records but  
is not going too create anything since it's just a `plan`  
  
if you like whats going to be builded you just need to run: terraform apply  
and it's going to begin the creation of each resource listed on the terraform plan output  
  
  
What create this repo
---------------------  
3 EC2 instances (prod, staging and dev)  
3 ELB (prod, staging and dev)  
3 Route53 records (prod, staging and dev)  
6 Security Groups (3 for EC2 and 3 for ELB) by default just open port 80 443 and 22 for EC2 and 80 and 443 for ELB  
