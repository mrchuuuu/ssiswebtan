from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField
from wtforms.validators import DataRequired
from app.college.controller import College


class ProgramForm(FlaskForm):
    courseCode = StringField("Course Code", validators=[DataRequired()])
    name = StringField("Program Name", validators=[DataRequired()])
    college = SelectField("College", coerce=int, validators=[DataRequired()])
    submit = SubmitField("Submit")

    def __init__(self, *args, **kwargs):
        super(ProgramForm, self).__init__(*args, **kwargs)
        self.college.choices = [
            (college.id, college.name) for college in College.get_all()
        ]