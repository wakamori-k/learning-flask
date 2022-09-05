# Web API with Flask

An Web API that manages user information consisting of id and name.

## Deploy to Heroku

```
heroku create flask-sample-$(whoami)
git remote add heroku https://git.heroku.com/flask-sample-$(whoami).git

# add postgres addon
heroku addons:create heroku-postgresql:hobby-dev --app flask-sample-$(whoami)

# deploy
git push heroku main
heroku logs --tail
```

## Run locally

```
# settings
export DATABASE_URL="postgresql://$(whoami)@localhost:5432/$(whoami)"
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# run
heroku local
# or
python app.py
```

## Requests
### Create
```
# heroku
curl -X POST -H "Content-type: application/json" -d '{"id": 1, "name": "mike"}' https://flask-sample-$(whoami).herokuapp.com/v1/user

# local
curl -X POST -H "Content-type: application/json" -d '{"id": 1, "name": "mike"}' http://localhost:5000/v1/user
```

### Update
```
# heroku
curl -X PUT -H "Content-type: application/json" -d '{"id": 1, "name": "ken"}' https://flask-sample-$(whoami).herokuapp.com/v1/user
# local
curl -X PUT -H "Content-type: application/json" -d '{"id": 1, "name": "ken"}' http://localhost:5000/v1/user
```

### Read
```
# heroku
curl "https://flask-sample-$(whoami).herokuapp.com/v1/user?id=1"
# local
curl "http://localhost:5000/v1/user?id=1"
```

### delete
```
# heroku
curl -X DELETE "https://flask-sample-$(whoami).herokuapp.com/v1/user?id=1"
# local
curl -X DELETE "http://localhost:5000/v1/user?id=1"
```

## Test
```
./test.sh
```
