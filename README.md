# Deploy
### Docker
- docker-compose build
- docker-compose up -d
- docker-compose exec app bash

### Внутри контейнера
- composer install
- cp .env.example .env
- php artisan key:generate
- php artisan storage:link
- php artisan migrate

