server {
        listen 80;
        server_name docker.revanthreddych.com;
                return 301 https://$server_name$request_uri;

        location / {
                proxy_pass http://localhost:8090;
                include proxy_params;
        }

}

server {
        listen 443 ssl;
        server_name docker.revanthreddych.com;
        ssl_certificate /etc/letsencrypt/live/revanthreddych.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/revanthreddych.com/privkey.pem;

        location / {
                proxy_pass http://localhost:8090;
                include proxy_params;
        }
}
