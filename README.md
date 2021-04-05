# Tweets scheduler

This project is dockerized 

```
docker-compose build
docker-compose up
```
## Login into heroku CLI
```
 heroku login
```

## Add heroku to remote git in case you dont have it already
```
heroku git:remote -a tweets-scheduler
```

## Now you can sign into Container Registry.

```
 heroku container:login
```

## Push your Docker-based app

Build the Dockerfile in the current directory and push the Docker image.

```
heroku container:push web
```

## Push to heroku for deploying
```

git push heroku master
```
