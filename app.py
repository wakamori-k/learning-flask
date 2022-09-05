import os
from flask import Flask
from database import db

def create_app():
    app = Flask(__name__)

    import router
    app.register_blueprint(router.router_v1)

    app.config['SQLALCHEMY_DATABASE_URI'] = os.environ['DATABASE_URL'].replace("postgres:", "postgresql:")
    db.init_app(app)

    with app.app_context():
        db.create_all()

    return app

app = create_app()

if __name__=="__main__":
    app.run()
