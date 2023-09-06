#!/bin/bash
names=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
instance_type=""
imageid=ami-03265a0778a880afb
security_group=sg-03161170439f7f149
domain_name=lakshman.tech
for i in "${names[@]}"
do
echo "$i"
if [[$i == mongodb || $i == mysql]]
then
instance_type="t3.medium"
else
instance_type="t2.micro"
ipaddress=$(aws ec2 run-instances --image-id $imageid --instance-type $instance_type --security-group-ids $security_group  --tag-specifications "ResourceType=instance,Tags= [ {Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress'
)
fi
echo "instance 
done

