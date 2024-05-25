is_running=$(systemctl status tor | grep running)
if [[ $is_running == "" ]]; then
  echo '{"text":"TOR","class":""} ' | jq --unbuffered --compact-output .
else
  echo '{"text":"TOR","class":"running"} ' | jq --unbuffered --compact-output .
fi
