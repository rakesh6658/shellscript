#!/bin/bash
names=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
instance_type=""
imageid=ami-03265a0778a880afb
security_group=sg-03161170439f7f149
domain_name=lakshman.tech
for i in "${names[@]}"
do
echo "$i"

ipaddress=$(aws ec2 run-instances --image-id $imageid --instance-type $instance_type --security-group-ids $security_group  --tag-specifications "ResourceType=instance,Tags= [ {Key=Name,Value=$i}]"| jq -r '.Instances[0].PrivateIpAddress'
)

echo "instance $i created with ip address $ipaddress"
aws route53 change-resource-record-sets --hosted-zone-id Z04357831HTUC9WT90Z80 --change-batch '
{
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "'$i'.'$domain_name'",
                                    "Type": "A",
                                    "TTL": 300,
                                 "ResourceRecords": [{ "Value": "'$ipaddress'"}]
}}]
}
'
done

