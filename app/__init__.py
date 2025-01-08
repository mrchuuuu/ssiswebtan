from flask import Flask
from flask_mysqldb import MySQL
from config import SECRET_KEY
from flask_wtf.csrf import CSRFProtect
from config import DB_HOST, DB_USER, DB_NAME,DB_PASSWORD
from flask_bootstrap import Bootstrap
import cloudinary
import cloudinary.uploader
from cloudinary.utils import cloudinary_url


mysql = MySQL()
bootstrap = Bootstrap()


def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    cloudinary.config( 
    cloud_name = "dn7w3ilsi", 
    api_key = "827156484948784", 
    api_secret = "Rj03wmantcuZfW1CrlHGGG-VJzY", 
    secure=True
)

    app.config.from_mapping(
        SECRET_KEY=SECRET_KEY,
        MYSQL_HOST=DB_HOST,
        MYSQL_USER=DB_USER,
        MYSQL_DB=DB_NAME,        
        MYSQL_PASSWORD=DB_PASSWORD
    )
    bootstrap.init_app(app)
    mysql.init_app(app)
    CSRFProtect(app)

    from .student import student_bp
    from .program import program_bp
    from .college import college_bp
    app.register_blueprint(student_bp)
    app.register_blueprint(program_bp)
    app.register_blueprint(college_bp)

    
    return app