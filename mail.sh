To_address=$1
Team_name=$2
body=$3
alert_type=$4
echo "all attributes : $@"
message=$(sed -e "s|TEAM_NAME|$Team_name|" -e "s|ALERT_TYPE|$alert_type|" -e "s|MESSAGE|$body|" mail.html)
echo -e "$message" | mail -s "$alert_type \nContent-Type: text/html" "$To_address"

#mailx -s "$(echo -e "Newsletter issue 3\nContent-Type: text/html")"