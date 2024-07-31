from fastapi import FastAPI


app = FastAPI()



@app.get("/")
def read_root():
    return {"Hello": "World"}

app.get('/about')
def about():
    return {"about": "This is a hello world from azure containerr"}    