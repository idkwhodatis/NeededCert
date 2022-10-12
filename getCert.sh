if [ $# != 1 ]
then
    echo "Please run script with one argument."
else
    url=$1
    filename=${url//./-}
    openssl s_client -showcerts -servername $url -connect $url:443 </dev/null 2>/dev/null | sed -n -e '/BEGIN\ CERTIFICATE/,/END\ CERTIFICATE/ p'  > $filename.pem
fi

# To add certificate globally run:
# cat git-mycompany-com.pem | sudo tee -a /etc/ssl/certs/ca-certificates.crt
