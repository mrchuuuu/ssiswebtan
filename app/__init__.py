from flask import Flask
from config import SECRET_KEY
def create_app(test_config=None):
    app = Flask(__name__)
    app.config.from_mapping(
        SECRET_KEY=SECRET_KEY
    )

    from .student import student_bp
    from .program import program_bp
    from .college import college_bp
    app.register_blueprint(student_bp)
    app.register_blueprint(program_bp)
    app.register_blueprint(college_bp)

    return app