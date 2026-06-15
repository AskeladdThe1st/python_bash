import os

def scan_file_safety(file_name, badword):
    try:
        with open(file_name, "r") as file:
            text = file.read()
            print(text)
        if badword in text:
            print("DANGEROUS")
        else:
            print("SAFE")
    except FileNotFoundError:
        print("MISSING")       

scan_file_safety("ben.py", "password")
