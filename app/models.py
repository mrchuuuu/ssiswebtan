from app import mysql
import cloudinary
import cloudinary.uploader

class Student(object):
    def __init__(
        self, id, name, yearlevel, enrollmentStatus, program, programName=None, public_id=None
    ):
        self.id = id
        self.name = name
        self.yearlevel = yearlevel
        self.enrollmentStatus = enrollmentStatus
        self.program = program
        self.programName = programName
        self.public_id = public_id

    @classmethod
    def get_all_students(cls):
        try:
            cursor = mysql.connection.cursor()
            sql = """SELECT s.*, p.name as programName
                     FROM student s 
                     LEFT JOIN program p ON s.program = p.courseCode"""
            cursor.execute(sql)
            results = cursor.fetchall()
            students = []
            print(results)
            for result in results:
                student = Student(
                    id=result[0],
                    name=result[1],
                    yearlevel=result[2],
                    enrollmentStatus=result[3],
                    program=result[4],
                    programName=result[6],
                    public_id=result[5],
                )
                student.image = cls.get_image_url(student.public_id)
                students.append(student)
            return students
        except Exception as e:
            print(f"Error fetching students: {e}")
            return []

    @classmethod
    def get_student_by_id(cls, student_id):
        try:
            cursor = mysql.connection.cursor()
            sql = "SELECT * from student WHERE id = %s"
            cursor.execute(sql, (student_id,))
            result = cursor.fetchone()
            if result:
                student = cls(*result)
                student.image = cls.get_image_url(student.public_id)
                return student
            else:
                return None
        except Exception as e:
            print(f"Error fetching student by ID: {e}")
            return None

    @classmethod
    def get_image_url(cls, public_id):
        if public_id:
            transform_options = {
                'width': 320,
                'height': 320,
                'crop': 'fill',  
                'gravity': 'center',  
            }
            return cloudinary.CloudinaryImage(public_id).build_url(**transform_options)
        else:
            return None  # Or a default image URL if no image is associated
    def add(self, image_file):
        try:
            upload_result = cloudinary.uploader.upload(image_file)
            public_id = upload_result['public_id']
            cursor = mysql.connection.cursor()
            sql = "INSERT INTO student (id, name, yearlevel, enrollmentStatus, program, image) VALUES (%s, %s, %s, %s, %s, %s)"
            cursor.execute(
                sql,
                (
                    self.id,
                    self.name,
                    self.yearlevel,
                    self.enrollmentStatus,
                    self.program,
                    public_id  
                ),
            )
            mysql.connection.commit()
            return True
        except Exception as e:
            if e.args[0] == 1062:  # Duplicate entry error code
                return {"error": "Duplicate entry for student ID.", "code": 400}
            else:
                return {"error": f"Error adding student: {str(e)}", "code": 500}


    @classmethod
    def update_student(cls, student_id, student_data, image_file=None):
        try:
            cursor = mysql.connection.cursor()

            # Check if a new image is provided
            if image_file:
                # Upload the new image to Cloudinary
                upload_result = cloudinary.uploader.upload(image_file)
                public_id = upload_result['public_id']

                # If there's an old image, delete it from Cloudinary
                if student_data['old_image']:
                    cloudinary.uploader.destroy(student_data['old_image'])
            else:
                public_id = student_data.get('old_image')

            sql = """UPDATE student 
                    SET id = %s, name = %s, yearlevel = %s, enrollmentStatus = %s, program = %s, image = %s
                    WHERE id = %s"""
            cursor.execute(
                sql,
                (
                    student_data["id"],
                    student_data["name"],
                    student_data["yearLevel"],
                    student_data["enrollmentStatus"],
                    student_data["program"],
                    public_id,
                    student_id,
                ),
            )
            mysql.connection.commit()
            return True
        except Exception as e:
            print(f"Error updating student: {e}")
            if e.args[0] == 1062:
                error = {"error": "Duplicate entry for student ID.", "code": 400}
            else:
                error = {"error": f"Error updating student: {str(e)}", "code": 500}
            return error
    
    @classmethod
    def delete_student(cls, student_id):
        try:
            # Fetch the student first to get the image's public ID
            student = cls.get_student_by_id(student_id)
            if not student:
                return False

            cursor = mysql.connection.cursor()
            sql = "DELETE FROM student WHERE id = %s"
            cursor.execute(sql, (student_id,))
            mysql.connection.commit()

            # Delete the associated image from Cloudinary
            if student.public_id:
                cloudinary.uploader.destroy(student.public_id)

            return True
        except Exception as e:
            print(f"Error deleting student: {e}")
            return False



class College(object):
    def __init__(self, id=None, name=None):
        self.id = id
        self.name = name

    def add(self):
        try:
            cursor = mysql.connection.cursor()
            sql = "INSERT INTO college (name) VALUES (%s)"
            cursor.execute(sql, (self.name,))
            mysql.connection.commit()
            return True
        except Exception as e:
            print(f"Error adding college: {e}")
            return False

    @classmethod
    def get_all(cls):
        try:
            cursor = mysql.connection.cursor()
            sql = "SELECT * FROM college"
            cursor.execute(sql)
            results = cursor.fetchall()
            colleges = []
            for result in results:
                college = College(id=result[0], name=result[1])
                colleges.append(college)
            return colleges
        except Exception as e:
            print(f"Error fetching colleges: {e}")
            return []

    @classmethod
    def get_by_id(cls, id):
        try:
            cursor = mysql.connection.cursor()
            sql = "SELECT * FROM college WHERE id = %s"
            cursor.execute(sql, (id,))
            result = cursor.fetchone()
            if result:
                return College(id=result[0], name=result[1])
            return None
        except Exception as e:
            print(f"Error fetching college: {e}")
            return None

    def update(self):
        try:
            cursor = mysql.connection.cursor()
            sql = "UPDATE college SET name = %s WHERE id = %s"
            cursor.execute(sql, (self.name, self.id))
            mysql.connection.commit()
            return True
        except Exception as e:
            print(f"Error updating college: {e}")
            return False

    @classmethod
    def delete(cls, id):
        try:
            cursor = mysql.connection.cursor()
            sql = "DELETE FROM college WHERE id = %s"
            cursor.execute(sql, (id,))
            mysql.connection.commit()
            return True
        except Exception as e:
            print(f"Error deleting college: {e}")
            return False


class Program:
    def __init__(self, courseCode=None, name=None, college=None):
        self.courseCode = courseCode
        self.name = name
        self.college = college

    def add(self):
        try:
            cursor = mysql.connection.cursor()
            sql = "INSERT INTO program (courseCode, name, college) VALUES (%s, %s, %s)"
            cursor.execute(sql, (self.courseCode, self.name, self.college))
            mysql.connection.commit()
            return True
        except Exception as e:
            print(f"Error adding program: {e}")
            return False

    @classmethod
    def get_all(cls):
        try:
            cursor = mysql.connection.cursor()
            sql = "SELECT p.courseCode, p.name, c.name AS college_name FROM program p LEFT JOIN college c ON p.college = c.id"
            cursor.execute(sql)
            results = cursor.fetchall()
            programs = []
            for result in results:
                program = Program(
                    courseCode=result[0], name=result[1], college=result[2]
                )
                programs.append(program)
            return programs
        except Exception as e:
            print(f"Error fetching programs: {e}")
            return []

    @classmethod
    def get_by_courseCode(cls, courseCode):
        try:
            cursor = mysql.connection.cursor()
            sql = "SELECT * FROM program WHERE courseCode = %s"
            cursor.execute(sql, (courseCode,))
            result = cursor.fetchone()
            if result:
                return Program(courseCode=result[0], name=result[1], college=result[2])
            return None
        except Exception as e:
            print(f"Error fetching program: {e}")
            return None

    def update(self):
        try:
            cursor = mysql.connection.cursor()
            sql = "UPDATE program SET name = %s, college = %s WHERE courseCode = %s"
            cursor.execute(sql, (self.name, self.college, self.courseCode))
            mysql.connection.commit()
            return True
        except Exception as e:
            print(f"Error updating program: {e}")
            return False

    @classmethod
    def delete(cls, courseCode):
        try:
            cursor = mysql.connection.cursor()
            sql = "DELETE FROM program WHERE courseCode = %s"
            cursor.execute(sql, (courseCode,))
            mysql.connection.commit()
            return True
        except Exception as e:
            print(f"Error deleting program: {e}")
            return False

