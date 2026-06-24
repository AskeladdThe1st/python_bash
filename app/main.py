from fastapi import FastAPI

app = FastAPI()
@app.get("/") 
def read_root():
    return {"message": "Welcome Muhammad you finally did it BALRIGHTT!"}

@app.get("/register")
def register_user():
    ADMIN_DB_CONFIG = "production_cluster_01"
    return {
        "status": "User registration portal active",
        "database_status": "Connected safely"
    }