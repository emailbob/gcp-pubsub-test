# gcp-pubsub-test
Container that will create a pubsub topic and subscription and push and pull data from it

This is meant to be run from a GCE instance to verify that the service account has the correct permissions.

The container uses some sample scripts from https://github.com/GoogleCloudPlatform/cloud-pubsub-samples-python

A pubsub topic and subscription will be created if it does not already exist

### Docker Build

```bash
docker build -t gcp-pubsub-test .
```

### Docker Run

Example for running a container to pull messages

```bash
docker run --rm -ti -e PROJECT={YOUR_PROJECT_ID} -e TOPIC={YOUR_PUBSUB_TOPIC} -e SUB={YOUR_PUBSUB_SUBSCRIPTION} gcp-pubsub-test pull
```

Example for running a container to push messages

```bash
docker run --rm -ti -e PROJECT={YOUR_PROJECT_ID} -e TOPIC={YOUR_PUBSUB_TOPIC} -e SUB={YOUR_PUBSUB_SUBSCRIPTION} gcp-pubsub-test pull
```

### Environment variables
```
PROJECT      GCP project id

TOPIC        Pub/Sub Topic

SUB          Pub/Sub Subscription
```
