FROM python:3.9-slim

# Install pip, setuptools, wheel (no need for distutils)
RUN apt-get update && \
    apt-get install -y python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip setuptools wheel && pip install django==3.2

# Expose the port
EXPOSE 8000

# Start Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

