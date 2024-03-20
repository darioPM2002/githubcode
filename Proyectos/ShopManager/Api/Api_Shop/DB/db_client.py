from pymongo import MongoClient

#base de datos en la nube mongo database
#link que proporciona la pagina mongodb+srv://test:<password>@prueba.dqxcw9e.mongodb.net/?retryWrites=true&w=majority
cliente_remoto = MongoClient(
    "mongodb+srv://test:test@prueba.dqxcw9e.mongodb.net/?retryWrites=true&w=majority").test #test es la base de datos que vamos a trabajar
#base de datos local 
cliente_local = MongoClient().local

#definir que clieente será db_cliente será el que utilizaremos en el código
db_client = cliente_remoto