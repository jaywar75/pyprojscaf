# Python base image
FROM python:3.12-slim

# Set work directory
WORKDIR /app

# Copy files
COPY pyproject.toml poetry.lock* /app/
RUN pip install --upgrade pip && pip install poetry && poetry install --no-root

# Copy project
COPY . /app

# Default command
CMD ["poetry", "run", "python", "src/main.py"]
