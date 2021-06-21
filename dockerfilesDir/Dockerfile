FROM python:3.3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN virtualenv venv
RUN pip install requests
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN ls
CMD [ "python", "./runserver.py" ]
