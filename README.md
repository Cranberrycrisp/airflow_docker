# Airflow Docker Env
Airflow env with :
- RabbitMQ
- Mysql
- Celery Flower
- Multiple Worker

## Mysql
```
docker run --name=mysql -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD='uD9bGfTqfHXngU8W' -e MYSQL_ROOT_HOST=% mysql/mysql-server:5.7
```
changes needed in Server
```
CREATE DATABASE airflow_db;
SET GLOBAL explicit_defaults_for_timestamp = 1;
```
## Airflow
Reuires Fernet Key
```bash
python -c "from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())"
```