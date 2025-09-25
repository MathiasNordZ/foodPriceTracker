from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def health_check():
    return "Hello World"

@app.get("/product/")
def get_product():
    return {}