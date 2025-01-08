from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField,SelectField, validators, SubmitField
from wtforms.validators import ValidationError
from app.program.controller import Program

class StudentForm(FlaskForm):
    idYear = StringField('ID Year', [validators.DataRequired(), validators.length(max=4)] )
    idNumber = StringField('ID Number', [validators.DataRequired(), validators.length(max=4)])
    name = StringField('Name', [validators.DataRequired()])
    yearLevel = SelectField('Year Level', choices=[('First Year', 'First Year'), ('Second Year', 'Second Year'), ('Third Year', 'Third Year'), ('Fourth Year', 'Fourth Year')])
    enrollmentStatus = SelectField('Enrollment Status', choices=[('Enrolled', 'Enrolled'), ('Not Enrolled', 'Not Enrolled')])
    program = SelectField('Program', choices=[])
    submit = SubmitField("Submit")

    def __init__(self, *args, **kwargs):
        super(StudentForm, self).__init__(*args, **kwargs)
        self.program.choices = [
            (program.courseCode, program.name) for program in Program.get_all()
        ]