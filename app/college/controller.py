from flask import render_template, redirect, url_for, flash, request
from . import college_bp
from .forms import CollegeForm
from ..models import College


@college_bp.route("/college")
def index():
    colleges = College.get_all()
    form = CollegeForm()
    return render_template("college/index.html", colleges=colleges, form=form)


@college_bp.route("/college/add", methods=["POST"])
def add():
    form = CollegeForm()
    if form.validate_on_submit():
        college = College(name=form.name.data)
        if college.add():
            flash("College added successfully!", "success")
        else:
            flash("Error adding college.", "danger")
    else:
        flash("Invalid college name", "danger")
    return redirect(url_for("college.index"))


@college_bp.route("/college/edit/<int:id>", methods=["POST"])
def edit(id):
    college = College.get_by_id(id)
    if not college:
        flash("College not found.", "danger")
        return redirect(url_for("college.index"))

    form = CollegeForm()
    if form.validate_on_submit():
        college.name = form.name.data
        if college.update():
            flash("College updated successfully!", "success")
        else:
            flash("Error updating college.", "danger")
    else:
        flash("Invalid college name", "danger")

    return redirect(url_for("college.index"))


@college_bp.route("/college/delete/<int:id>", methods=["POST"])
def delete(id):
    if College.delete(id):
        flash("College deleted successfully!", "success")
    else:
        flash("Error deleting college.", "danger")
    return redirect(url_for("college.index"))