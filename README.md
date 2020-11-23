# DataReverter
This code deploys the infrastructure for a lambda function, which reverses data from one s3 bucket and stores it in another s3 bucket.

Regarding the state file and the terraform-locks Dynamo_DB table: In order to address the chicken and egg problem caused by the fact that the terraform-lock table, as well as the remote state file should be included in the terraform code, but also have to exist prior to the first terraform init,both resources were created manually through the console and then imported, using the "terraform import" command. 
