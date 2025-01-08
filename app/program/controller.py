from flask import render_template, redirect, request, jsonify
from . import program_bp
@program_bp.route('/program')
def programs():
    return render_template('program/index.html')