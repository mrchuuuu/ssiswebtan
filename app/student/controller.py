from flask import render_template, redirect, request, jsonify, url_for, flash
import app.models as models
from .forms import StudentForm
from app.program.controller import Program

from . import student_bp


@student_bp.route("/student")
@student_bp.route("/")
def index():
    form = StudentForm()
    data = models.Student.get_all_students()
    students = []
    for student in data:
        students.append(
            {
                "id": student.id,
                "name": student.name,
                "yearlevel": student.yearlevel,
                "enrollmentStatus": student.enrollmentStatus,
                "program": student.program,
                "programName": student.programName,
                "image": student.image,
            }
        )
    return render_template("student/index.html", students=students, form=form)


@student_bp.route("/student/add", methods=["POST"])
def add_student():
    form = StudentForm()
    form.program.choices = [
        (program.courseCode, program.name) for program in Program.get_all()
    ]

    if form.validate_on_submit():
        id = form.idYear.data + " - " + form.idNumber.data
        image_file = form.image.data
        try:
            student = models.Student(
                id=id,
                name=form.name.data,
                yearlevel=form.yearLevel.data,
                enrollmentStatus=form.enrollmentStatus.data,
                program=form.program.data,
            )
            result = student.add(image_file)

            # Correctly check if the result is a dictionary and if it contains an error
            if isinstance(result, dict) and result.get("error"):
                flash(f"Error: {result['error']}", "danger")
            elif result:
                flash("Student Added Successfully", "success")
            else:
                flash("Error adding student.", "danger")

            return redirect(url_for("student.index"))
        except Exception as e:
            print(e)
            flash(f"An unexpected error occurred: {str(e)}", "danger")
            return redirect(url_for("student.index"))

    # If form validation fails
    flash("Form validation failed. Please check the inputs.", "danger")
    return redirect(url_for("student.index"))

@student_bp.route("/student/<string:id>/edit", methods=["POST"])
def edit_student(id):
    form = StudentForm()
    # Repopulate choices
    form.program.choices = [(program.courseCode, program.name) for program in Program.get_all()]

    try:
        student = models.Student.get_student_by_id(id)
        if not student:
            flash("Student not found.", "danger")
            return redirect(url_for("student.index"))

        # Split the ID into year and number parts
        id_parts = student.id.split(" - ")
        id_year = id_parts[0] if len(id_parts) > 0 else ""
        id_number = id_parts[1] if len(id_parts) > 1 else ""

    except Exception as e:
        flash(f"Error fetching student data: {e}", "danger")
        return redirect(url_for("student.index"))

    if form.validate_on_submit():
        # Combine `idYear` and `idNumber` for the new ID
        new_id = form.idYear.data + " - " + form.idNumber.data
        image_file = form.image.data

        student_data = {
            "id": new_id,
            "name": form.name.data,
            "yearLevel": form.yearLevel.data,
            "enrollmentStatus": form.enrollmentStatus.data,
            "program": form.program.data,
            "old_image": student.public_id,
        }

        try:
            result = models.Student.update_student(id, student_data, image_file)
            if result == True:
                flash("Student updated successfully.", "success")
                return redirect(url_for("student.index"))
            elif result["code"] == 400:
                flash(f"Error: {result['error']}", "danger")
            else:
                flash(f"An unexpected error occurred: {str(e)}", "danger")
        except Exception as e:
            flash(f"An error occurred: {str(e)}", "danger")

        return redirect(url_for("student.index"))
    else:
        # Populate the form fields with current student data
        form.idYear.data = id_year
        form.idNumber.data = id_number
        form.name.data = student.name
        form.yearLevel.data = student.yearlevel
        form.enrollmentStatus.data = student.enrollmentStatus
        form.program.data = student.program

        return render_template("student/index.html", form=form, student=student)
@student_bp.route("/student/<string:id>/delete", methods=["POST"])
def delete_student(id):
    try:
        result = models.Student.get_student_by_id(id)
        if not result:
            flash("Student not found.", "danger")
            return redirect(url_for("student.index"))

        delete_result = models.Student.delete_student(id)
        if delete_result:
            flash("Student deleted successfully.", "success")
        else:
            flash("Failed to delete student. Please try again.", "danger")
    except Exception as e:
        flash(f"An error occurred while deleting the student: {e}", "danger")
    return redirect(url_for("student.index"))