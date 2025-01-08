from flask import render_template, redirect, url_for, flash, request
from . import program_bp
from .forms import ProgramForm
from ..models import Program, College

@program_bp.route("/program")
def index():
    programs = Program.get_all()
    form = ProgramForm()
    return render_template("program/index.html", programs=programs, form=form)


@program_bp.route("/program/add", methods=["POST"])
def add():
    form = ProgramForm()
    if form.validate_on_submit():
        program = Program(
            courseCode=form.courseCode.data,
            name=form.name.data,
            college=form.college.data,
        )
        if program.add():
            flash("Program added successfully!", "success")
        else:
            flash("Error adding program.", "danger")
    else:
        flash("Error adding program.", "danger")
    return redirect(url_for("program.index"))


@program_bp.route("/program/edit/<string:courseCode>", methods=["POST"])
def edit(courseCode):
    program = Program.get_by_courseCode(courseCode)
    if not program:
        flash("Program not found.", "danger")
        return redirect(url_for("program.index"))

    form = ProgramForm()
    if form.validate_on_submit():
        program.name = form.name.data
        program.college = form.college.data
        if program.update():
            flash("Program updated successfully!", "success")
        else:
            flash("Error updating program.", "danger")
    else:
        flash("Error updating program.", "danger")
    return redirect(url_for("program.index"))


@program_bp.route("/program/delete/<string:courseCode>", methods=["POST"])
def delete(courseCode):
    if Program.delete(courseCode):
        flash("Program deleted successfully!", "success")
    else:
        flash("Error deleting program.", "danger")
    return redirect(url_for("program.index"))