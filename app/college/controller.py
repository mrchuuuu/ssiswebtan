from flask import render_template
from . import college_bp

@college_bp.route('/college')
def college():
    return render_template('college/index.html')