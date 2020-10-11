import psycopg2
import os


ENVIRONMENT = os.environ

DATABASE_NAME = ENVIRONMENT['DBNAME']
USERNAME = ENVIRONMENT['DBUSER']
PASSWORD = ENVIRONMENT['USERPASS']
HOST = 'localhost'
PORT = 5432


conn = psycopg2.connect(dbname=DATABASE_NAME, user=USERNAME, password=PASSWORD, host=HOST, port=PORT)
cursor = conn.cursor()

schema_creation_query = """CREATE SCHEMA {};"""
cursor.execute(schema_creation_query.format('test'))
conn.commit()

table_creation_query = """CREATE TABLE test.customers(id serial, customer_name varchar(256), customer_type varchar(256));"""
cursor.execute(table_creation_query)
conn.commit()

insert_query = """INSERT INTO test.customers (customer_name,customer_type) VALUES ('Ivanov Ivan Ivanovich', 'client')"""
cursor.execute(insert_query)
conn.commit()

