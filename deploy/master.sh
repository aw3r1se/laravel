# переходим в папку проекта
cd projects/ekaterinarinar/www

# обновляем из git - ветка master
git reset --hard
git pull origin master

# выходим если не смогли обновится
if [[ $? -ne 0 ]] ; then
  exit 1;
fi

# собираем vendor
composer install

# накатываем миграции laravel
php artisan migrate

# собираем front
npm install
npm run dev

# Очистка лары
php artisan optimize:clear
