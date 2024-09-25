{{ if cookiecutter.db_engine=="MySQL" }}
CREATE DATABASE IF NOT EXISTS {{ cookiecutter.db_name }};
CREATE USER     IF NOT EXISTS {{ db_username}} IDENTIFIED BY '{{ db_password}}';
{{ elif cookiecutter.db_engine=="PostgreSQL" }}
SELECT 'CREATE DATABASE {{ cookiecutter.db_name }}'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '{{ cookiecutter.db_name }}')\gexec

CREATE USER {{ cookiecutter.db_username }} WITH PASSWORD '{{ cookiecutter.db_password }}' CREATEDB;
{{ endif }}
