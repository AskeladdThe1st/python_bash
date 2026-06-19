FROM python:3.11-slim

WORKDIR /app

# Install dependencies (including uvicorn and fastapi/requests)
RUN pip install fastapi uvicorn requests --break-system-packages

# Copy your python files into the container
COPY security_scan.py test_app.py main.py ./

# EXPOSE the port your API runs on (usually 8000)
EXPOSE 8000

# Tell the container to start the Uvicorn server automatically
# Note: We drop "--reload" in production/Docker because it slows down the container
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]