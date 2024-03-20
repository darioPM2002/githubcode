def product_schema(product) -> dict:
    return {
        "id": str(product["_id"]), #esto para asegurar que el id será un string
        "name": product["name"],
        "price": product["price"],
        "typep": product["typep"],
        "des": product["des"],
        "origin": product["origin"],

        
           }

def products_schema(products) -> list:
   return[product_schema(products) for product in products] #aqui recibimos la información de la base de datos y lo convertimos a una lsita de 

