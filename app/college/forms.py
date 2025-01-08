from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired


class CollegeForm(FlaskForm):
    name = StringField("College Name", validators=[DataRequired()])
    submit = SubmitField("Submit")