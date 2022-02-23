#!/usr/bin/bash

# Pre-requisites
# - You've got heroku CLI installed somehow

heroku login
heroku apps:create --region us
git push heroku main
APP_NAME=`git remote -v | grep 'heroku.*(fetch)$' | sed 's/.*\///' | sed 's/\.git.*//'`

heroku addons:destroy heroku-postgresql --confirm "${APP_NAME}"
heroku addons:create redistogo:nano
heroku addons:create jawsdb-maria:kitefin

echo "Sleeping for a moment"
sleep 15

NEW_DB_URL=`heroku config:get JAWSDB_MARIA_URL | sed 's/mysql\:\/\//mysql+pymysql\:\/\//'`
heroku config:set DATABASE_URL="${NEW_DB_URL}"

REDIS_URL=`heroku config:get REDISTOGO_URL`
heroku config:set REDIS_URL="${REDIS_URL}"

echo "\n\n\n\n\n"
echo "Job's done - app is at the link below. After initial deploy, let the app sit for 10 minutes or so while it shits itself. Should start working after that."
echo "https://${APP_NAME}.herokuapp.com"
echo "When you're ready to start paying for scalabiltiy, change the dyno type in the heroku panel and also consider upgrading the DB and redis addon."
echo "Maybe chuck it behind a CDN like cloudflare on free tier."