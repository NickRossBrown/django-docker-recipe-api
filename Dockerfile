FROM python:3.7-alpine

# Tells Python to run in unbuffered mode 
# - Recommended when running Python within Docker containers
# - It avoids some complications and things like that with the Docker image when you're running your python application
ENV PYTHONUNBUFFERED 1


# --------------------------
#  Install our dependencies
# --------------------------

# COPY here copies Copy from the directory adjacent to the Docker file
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev  musl-dev zlib zlib-dev
RUN pip install -r /requirements.txt

# RUN here takes the requirements file that we've just copied and it installs it using pip into the Docker image
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# --------------------------
#  Set a working directory
# --------------------------

# RUN here makes an empty folder
RUN mkdir /app
# WORKDIR here switches to ./app as default directory
WORKDIR /app
# COPY here copies from our local machine the app folder to the into the docker image
COPY ./app /app

# --------------------------
#  Create a user
# --------------------------

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user