# Recipe API

## Technologies Used
- Docker
- Python
    - Django


### 

docker-compose run app sh -c "django-admin startproject app ."


docker-compose run app sh -c "python manage.py startapp core"

docker-compose run app sh -c "python manage.py makemigrations core"

docker-compose run app sh -c "python manage.py test"

docker-compose run app sh -c "python manage.py test && flake8"