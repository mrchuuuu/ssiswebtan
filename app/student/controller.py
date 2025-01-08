from flask import render_template, redirect, request, jsonify

from . import student_bp

@student_bp.route('/student')
@student_bp.route('/')
def index():
    return render_template('student/index.html')