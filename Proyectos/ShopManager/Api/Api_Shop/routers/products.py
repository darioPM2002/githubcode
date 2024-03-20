from fastapi import APIRouter, HTTPException, Query
from models.Product import Product
from DB.db_client import db_client

from DB.schemas.product_schema import product_schema, products_schema
from bson import ObjectId
from pymongo.collection import Collection
db:Collection =db_client.products
productosL = [
    Product(des="No",  name="Botella", origin="Coca cola", priceQ=[10], priceN=["Ch"], typep=1,id="4"),
    Product(des="No",  name="VASO", origin="Coca cola", priceQ=[10], priceN=["Ch"], typep=1,id="64"),
    Product(des="No",  name="cARRO", origin="Coca cola", priceQ=[10], priceN=["Ch"], typep=1,id="3"),
    Product(des="No",  name="Botella", origin="Coca cola", priceQ=[10], priceN=["Ch"], typep=1,id="76"),
    
    
    ]

router = APIRouter(prefix="/products", tags=["products"])
a =Product(des="No",  name="Botella", origin="Coca cola", priceQ=[10], priceN=["Ch"], typep=1)



def buscar_product (field: str, key, colection:Collection): # field es es la clave y key el valor {"field":"key"} para cusquedas personalizadas por clve y valor 
 
    #los resultaods #el tipo de dato de la lista es user y el filtro será id, y la lista será users_id
    try:
       
       product = product_schema( colection.find_one({field:key}))
       return Product(**product)
    except:
        return {"error": "No se ha encontrado el usuario"}




@router.get("/all")
async def products(): 
    return productosL

@router.post("/")
async def postProduct(product: Product):
    if type(buscar_product("name", product.name,db_client.products)) == Product: #comprobación denque el usuario no exista en la base de datos
        raise HTTPException(status_code= 404, detail="El producto ya está registrado en la base de datos con ese nombre")
    
    product_dict = dict(product)
    del product_dict["id"]
    id =  db_client.products.insert_one(product_dict).inserted_id
    db_client.find
    new_product = product_schema( db_client.products.find_one({"_id": id}))
    return Product(**new_product)

#
#@router.post("/c")
#async def postProduct(product: Product = Query(..., description="Datos del producto"), collection_name: str = Query(..., description="Nombre de la colección")):
#    collection: Collection = getattr(db_client.products, collection_name)
#
#    if type(buscar_product("name", collection )) == Product: #comprobación denque el usuario no exista en la base de datos
#        raise HTTPException(status_code= 404, detail="El producto ya está registrado en la base de datos con ese nombre")
#    
#    product_dict = dict(product)
#    del product_dict["id"]
#
#    id =  collection.insert_one(product_dict).inserted_id
#   
#    new_product = product_schema( collection.find_one({"_id": id}))
#    return Product(**new_product)
#

@router.post("/co")
async def postProduct(product: Product , collection_name: str ):
    collection: Collection = getattr(db_client.products, collection_name)

    if type(buscar_product("name", product.name ,collection )) == Product: #comprobación denque el usuario no exista en la base de datos
        raise HTTPException(status_code= 404, detail="El producto ya está registrado en la base de datos con ese nombre")
    
    product_dict = dict(product)
    del product_dict["id"]

    id =  collection.insert_one(product_dict).inserted_id
   
    new_product = product_schema( collection.find_one({"_id": id}))
    return Product(**new_product)