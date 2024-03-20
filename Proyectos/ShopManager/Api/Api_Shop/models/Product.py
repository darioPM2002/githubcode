from pydantic import BaseModel
from typing import Optional, Dict


""" 
Clase producto:
id     : id de base de datos único
name   : nombre del producto
price  : es un mapa de str: float, porque un producto, puede tener un precio o varios eejmplo chico, mediano grande
typep  : int, depende el numero es el tipo, sirve para organizar
des    : descripcion del producto
origin : nombre de la persona empresa que lo creó
"""
class Product(BaseModel):
    id    : Optional[int] = None
    name  : str
    priceQ : list[float] #Lista de precios cantidad
    priceN :list[str]; #Lista de precios nombre
    typep : int
    des   : str
    origin: str



