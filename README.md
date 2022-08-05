# Web API with Flask

An Web API that manages user information consisting of id and name.

## Deploy to Heroku

```
git push heroku main
```

## Run locally

```
pip install -r requirements.txt
python main.py
```

## Requests
### Create
```
curl -X POST -H "Content-type: application/json" -d '{"id": 1, "name": "mike"}' http://127.0.0.1:5000/v1/user
```

### Update
```
curl -X PUT -H "Content-type: application/json" -d '{"id": 1, "name": "ken"}' http://127.0.0.1:5000/v1/user
```

### Read
```
curl "http://127.0.0.1:5000/v1/user?id=1"
```

### delete
```
curl -X DELETE "http://127.0.0.1:5000/v1/user?id=1"
```
