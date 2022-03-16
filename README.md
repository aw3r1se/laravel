# Deploy
##Docker
- docker-compose build
- docker-compose up -d
##Внутри контейнера
- docker-compose exec app bash
- composer install
- cp .env.example .env
- php artisan key:generate
- php artisan storage:link
- php artisan migrate

