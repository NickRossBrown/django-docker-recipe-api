# Recipe API

## Technologies Used
- Docker
- Python
    - Django

### How to run the project on your computer

** Make sure docker is installed
```
docker -v
```
- Download the repo
```
git clone https://github.com/NickRossBrown/django-docker-api
```
- navigate to project directory
```
cd django-docker-api
```
- build and run the application
```
docker-compose up
```
create a superuser (so you can log into admin page)
    - enter in email + pw (I use test@test.com)
```
docker-compose run app sh -c "python manage.py createsuperuser"
```
- naviate to admin page in the url
    - http://localhost:8000/admin

#### Run unit tests

```
docker-compose run app sh -c "python manage.py test && flake8"
```
