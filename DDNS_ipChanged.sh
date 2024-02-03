#!/bin/bash
dns_lookup=$(nslookup DDNS_Urn.sn.mynetname.net)
ip_add=$(echo "$dns_lookup" | grep Address | tr '\n' ' ' | cut -d ' ' -f 3)
real_ip="X.X.X.X"
if [ "$real_ip" != "$ip_add" ] ; then
    date >> ~/log1
    echo "no" >> ~/log1
    curl -X POST \
    https://api.ghasedak.me/v2/sms/send/simple \
    -H 'apikey: Api_Key' \
    -H 'cache-control: no-cache' \
    -H 'content-type: application/x-www-form-urlencoded' \
    -d 'message=ip_changed&receptor=Reciptor_Number&linenumber=300002525'
else
    date >> ~/log1
    echo "yes" >> ~/log1
fi
