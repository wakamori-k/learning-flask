# RESTful API sample

A RESTful API that manages user information consisting of id and name.

## run

```
pip install -r requirements.txt
python main.py
```


## requests

```
# create
curl -X POST -H "Content-type: application/json" -d '{"id": 1, "name": "mike"}' http://127.0.0.1:5000/v1/user

# update
curl -X PUT -H "Content-type: application/json" -d '{"id": 1, "name": "mike"}' http://127.0.0.1:5000/v1/user

# read
curl "http://127.0.0.1:5000/v1/user?id=1"

# delete
curl -X DELETE "http://127.0.0.1:5000/v1/user?id=1"
```