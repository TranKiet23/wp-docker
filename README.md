## Pre installtion and set up

### Install docker
- Ref: [Install Docker Engine](https://docs.docker.com/engine/install/)

### Clone gitlab project
```
git clone https://gitlab.mkt6s.com/hsing/wp-docker-local.git
```

### Deploy wp docker compose
```
docker compose up -d
```
- Using wp cli
```
docker compose run --rm wp-cli
```
- Using wp cli as alias
```
alias wp="docker compose run --rm wp-cli"
```
- Active all plugins
```
wp plugin activate --all
```
- Active all themens
```
wp theme activate oceanwp
wp theme activate flatsome
wp theme activate flatsome-child
```

- Note: Run with the command above that docker wil take the default compose file name `docker-compose.yml`, if you want to run with special compose file then let Specifying a path to a single Compose file with `-f` flag.
- Ref: [docker compose](https://docs.docker.com/reference/cli/docker/compose/)

## Checking compose work well
### Access to localhost domain
- Traefik portal
```
http://proxy.localhost
+ User/pass: admin/Admin@123
```
- Wordpress admin

```
http://wp.localhost/wp-admin
```
- Wordpress site
```
http://wp.localhost
```
- Phpmyadmin for maintenance DB
```
http://phpadmin.localhost
```
- Note:
    + Your wp site content will store/moute in [`wp-html`](wp-html) folder on your local as we declare in volume of wordpress service
    + Your MySQL data will store/mount in [`mysql`](mysql) folder on your local as we declare in volume of database service

```tree services
├── treafik
│   ├── logs
│
├── mysql
│   ├── mysql
│   ├── .env
│
├── phpmyadmin
│   ├── .env
│
├── wordpress
│   ├── wp-html
│   ├── .env
│
```


## plugins:
=> Plugin down on wp store
- Wp-file-manager -ok
- Elementor -ok
- Elementor pro -ok
- Elementor header - footer -ok
- Litespeed cache - ok
- Official startCounter -ok
- Redirect 404 Homepage -ok
- Schema & Structured data for WP & AMP -ok
- Yoast SEO -ok

=> Plugin internal
- All-in-one 6.7 -ok
- permalink-manager-pro -ok
- wordpress-seo-premium -ok (Yoast SEO premium)
- Kadence blocks - Pro extention -ok
- Kadence blocks - Gutenberg blocks for page builder features - ok


#### ----> Now let create your first home page with [Wordpress admin](http://wp.localhost/wp-admin) <----
