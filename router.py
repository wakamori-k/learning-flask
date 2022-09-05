from flask import Blueprint
from flask import request
from flask import jsonify

from repository import UserRepository
from user import User

router_v1 = Blueprint('router', __name__, url_prefix='/v1')
repository = UserRepository()

@router_v1.route('/', methods=['GET'])
def index():
    return "This is index page."

@router_v1.route('/user', methods=['POST', 'PUT', 'GET', 'DELETE'])
def user():
    if request.method == 'POST' or request.method == 'PUT':
        request_json = request.json
        required = ('id', 'name')
        if not all(k in request_json for k in required):
            return jsonify({'message': 'missing values'}), 400
        
        user = User(int(request_json['id']), request_json['name'])

        if request.method == 'POST':
            if repository.create(user):
                return jsonify({'message': 'success'}), 201
            else:
                return jsonify({'message': 'fail'}), 400
        elif request.method == 'PUT':
            if repository.update(user):
                return jsonify({'message': 'success'}), 201
            else:
                return jsonify({'message': 'fail'}), 400

    if request.method == 'GET' or request.method == 'DELETE':
        id = int(request.args['id'])
        if id is None:
            return jsonify({'message': 'missing values'}), 400
        
        if request.method == 'GET':
            user = repository.read(id)
            if user:
                return jsonify({'message': 'success', 'id': user.id, 'name': user.name}), 200
            else:
                return jsonify({'message': 'fail'}), 404

        elif request.method == 'DELETE':
            if repository.delete(id):
                return jsonify({'message': 'success'}), 200
            else:
                return jsonify({'message': 'fail'}), 400
