# Expense EC2 Module

** Inputs: **
* ami_id(Optional): String value, default value is devops-practice AMI ID
* sg_id(Mandatory): User must supply sg_id
* instance_type(Optional): t3.micro is default value. But user can provide t3.small or t3.medium
* tags(Optional): Default is empty. But user can provide input in map structure

** Outputs: **
* public_ip: Public IP of the instance created
* private_ip: Private IP of the instance created