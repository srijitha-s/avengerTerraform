# use lightweight python 3.7 image
# https://hub.docker.com/_/python
From python:3.7-slim

#copy local code to the conatainer image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

#Install production dependencies
RUN pip install Flask gunicorn

# Run the web service on container startup. Here we are using gunicorn
# Webserver, with one worker process and 8 threads.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app