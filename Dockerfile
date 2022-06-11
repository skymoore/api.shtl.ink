FROM python:3.9 as shtl_ink
ENV PYTHONUNBUFFERED=1
RUN mkdir -p /opt/url-api/src/shtl_ink_api
COPY src/shtl_ink_api/* /opt/url-api/src/shtl_ink_api/
COPY src/setup.py /opt/url-api/src/setup.py
COPY README.md /opt/url-api/
COPY requirements.txt /opt/url-api/requirements.txt
WORKDIR /opt/url-api/src
RUN pip install -r ../requirements.txt
RUN python setup.py install
EXPOSE 8000
ENTRYPOINT [ "uvicorn","--host", "0.0.0.0", "--port", "8000",  "shtl_ink_api.app:app" ]