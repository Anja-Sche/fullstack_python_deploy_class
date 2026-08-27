# backend

# get image
FROM python:3.13-slim 

# everything in backend folder goes into /app older, which is created if it didn't exist before
COPY backend/ /app/

# install uv
RUN pip install --no-cache-dir uv

# changes working directory to /app
WORKDIR /app

# installs all dependencies in pyproject.toml without dev paskages
RUN uv sync --no-dev

# change working directory to where we have api.py
WORKDIR /app/src/backend

# 0.0.0.0 -> accept connections from local machine and external
CMD [ "uv" , "run", "uvicorn", "api:app", "--host", "0.0.0.0"]