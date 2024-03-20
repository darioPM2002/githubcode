from fastapi import FastAPI
from routers import products

app = FastAPI();

app.include_router(products.router)

@app.get("/")
async def root():
    return "Hola desde api"

@app.get("/")
async def root():
    return "Hola desde api"