#open 
/etc/nginx/conf.d/fastcgi.conf

#paste /replace all


		fastcgi_cache_path /var/www/nginx-cache levels=1:2 keys_zone=microcache:100m max_size=1g inactive=24h;
		fastcgi_cache_key $scheme$host$request_uri$request_method;
		fastcgi_split_path_info ^(.+\.php)(/.+)$;
		fastcgi_cache microcache;
  		fastcgi_cache_valid 200 301 302 60m;
         	fastcgi_cache_use_stale updating error timeout invalid_header http_500 http_503;
         	fastcgi_pass_header Set-Cookie;
           	fastcgi_pass_header Cookie;
         	fastcgi_ignore_headers Cache-Control Expires Set-Cookie;
		add_header X-Cache $upstream_cache_status;
          	#fastcgi_pass unix:/var/run/php5-fpm.sock;
		fastcgi_index index.php;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		include fastcgi_params;
		fastcgi_buffers 16 16k;
		fastcgi_buffer_size 32k;
      
      
#buat folder nginx-cache

/var/www/nginx-cache

