FROM python:2.7.15-alpine3.7
RUN pip install --upgrade google-api-python-client \
    && pip install --upgrade oauth2client \
    && pip install python-dateutil \
    && apk add --no-cache --virtual .build-deps curl git \
    && curl -O http://storage.googleapis.com/aju-sd-traffic/unzipped/Freeways-5Minaa2010-01-01_to_2010-02-15_test2.csv \
    && git clone https://github.com/GoogleCloudPlatform/cloud-pubsub-samples-python.git

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pull"]