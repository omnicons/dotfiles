is_running=$(systemctl status openvpn-client@* | grep running)
if [[ $is_running == "" ]]; then
  echo '{"text":"VPN","class":""} ' | jq --unbuffered --compact-output .
else
  echo '{"text":"VPN","class":"running"} ' | jq --unbuffered --compact-output .
fi
