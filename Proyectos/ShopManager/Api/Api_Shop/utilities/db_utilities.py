from pymongo import MongoClient, collection
from DB.schemas.product_schema import product_schema, products_schema
from models import Product

def buscar_product (field: str, key, products_collection: collection.Collection): # field es es la clave y key el valor {"field":"key"} para cusquedas personalizadas por clve y valor 
 
    #los resultaods #el tipo de dato de la lista es user y el filtro será id, y la lista será users_id
    try:
       product = product_schema( products_collection.find_one({field:key}))
       return Product(**product)
    except:
        return {"error": "No se ha encontrado el usuario"}

