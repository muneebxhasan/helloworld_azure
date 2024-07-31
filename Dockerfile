FROM python:3.12

LABEL maintainer = "muneebxhasan@gmail.com"


WORKDIR /CODE

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    protobuf-compiler \
    && rm -rf /var/lib/apt/lists/*

RUN pip install poetry

COPY . /CODE

RUN poetry config virtualenvs.create false
# Install any needed packages specified in requirements.txt
RUN poetry install
# Make port 8000 available to the world outside this container
EXPOSE 8000

CMD ["poetry", "run", "uvicorn", "quizapp.main:app","--host","0.0.0.0" ,"--port","8002","--reload"]
