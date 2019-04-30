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
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
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

# RUN here creates a user
# -D here says the user is going to be used for running applications only
RUN adduser -D boots
# USER here switches to that user
USER boots