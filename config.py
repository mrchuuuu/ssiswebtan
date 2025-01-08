from os import getenv
import cloudinary

SECRET_KEY = getenv("SECRET_KEY")
DB_HOST = getenv("DB_HOST")
DB_USER = getenv("DB_USERNAME")  
DB_NAME = getenv("DB_NAME")
DB_PASSWORD = getenv("DB_PASSWORD")  

cloudinary.config(
  cloud_name = getenv("CLOUDINARY_CLOUD_NAME"),
  api_key = getenv("CLOUDINARY_API_KEY"),
  api_secret = getenv("CLOUDINARY_API_SECRET"),
  secure = True
)