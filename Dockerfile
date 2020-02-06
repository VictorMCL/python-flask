# Here is the build image
FROM python:3.7.6-stretch as builder
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --user -r requirements.txt
COPY . /app
# Here is the production image
FROM python:3.7-alpine as app
COPY --from=builder /root/.local /root/.local
COPY --from=builder /app/src/logic/app.py /app/app.py
ENV PATH=/root/.local/bin:$PATH
WORKDIR /app
EXPOSE 5000

CMD ["python3.7", "app.py"]