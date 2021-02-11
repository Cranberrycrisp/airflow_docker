import mysql.connector
import time
db_connection = None
while not db_connection:
  try:
    db_connection = mysql.connector.connect(
      host= "mysql",
      user= "root",
      passwd= "uD9bGfTqfHXngU8W"
    )
  except:
    time.sleep(5)
db_cursor = db_connection.cursor()
db_cursor.execute("SET GLOBAL explicit_defaults_for_timestamp = 1")