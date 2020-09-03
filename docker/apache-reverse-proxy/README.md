# Apache Reverse Proxy

The Reverse Proxy runs as an Apache2 server within a docker container. When a new application is set up on the server and given a port, an endpoint should be configured for it.

## Warning!

Apache2 is a very difficult server to debug. Unless there is a specific reason for using it, use ngninx.

## Adding an Endpoint

To add an endpoint to the Reverse Proxy a few steps have to be taken

### Adding a Proxy Pass

First head to the file `./sites/server.conf` and add a Proxy at the bottom of the file before the `</VirtualHost>`.

Example Proxy Config:
```config
# Infrastructure Docs

ProxyPass /docs http://server.com:30080
ProxyPassReverse /docs http://server.com:30080

<Location /docs/*>
 Order allow,deny
 Allow from all
</Location>
```

**Note: If the app needs to be available on https as well, add the same configurations to `./sites/server-ssl.conf` file.

### Adding to the Site Directory

Add the new endpoint and site info in the index.html file so users can see whats available.

### Redeploy the Reverse Proxy

```
docker-compose up -d
```