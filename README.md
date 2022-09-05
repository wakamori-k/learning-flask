# Web API with Flask

An Web API that manages user information consisting of id and name.

## Deploy to Heroku

```
git push heroku main
```

## Run locally

```
export DATABASE_URL="postgresql://$(whoami)@localhost:5432/$(whoami)"

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
heroku local
# or
python app.py
```

## Requests
### Create
```
curl -X POST -H "Content-type: application/json" -d '{"id": 1, "name": "mike"}' http://localhost:5000/v1/user
```

### Update
```
curl -X PUT -H "Content-type: application/json" -d '{"id": 1, "name": "ken"}' http://localhost:5000/v1/user
```

### Read
```
curl "http://localhost:5000/v1/user?id=1"
```

### delete
```
curl -X DELETE "http://localhost:5000/v1/user?id=1"
```
