from flask import Flask
import router

def create_app():
    app = Flask(__name__)

    app.register_blueprint(router.router_v1)

    return app

app = create_app()

if __name__=="__main__":
    app.run()