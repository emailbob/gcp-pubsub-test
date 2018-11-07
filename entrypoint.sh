#!/bin/sh

# Check if topic exists
python /cloud-pubsub-samples-python/cmdline-pull/pubsub_sample.py ${PROJECT} \
list_topics | grep projects/${PROJECT}/topics/${TOPIC}

if [ $? -ne 0 ]
then
  python /cloud-pubsub-samples-python/cmdline-pull/pubsub_sample.py ${PROJECT} \
  create_topic ${TOPIC}
else
  echo "Topic ${TOPIC} exists"
fi

# Check if subscriptions exists
python /cloud-pubsub-samples-python/cmdline-pull/pubsub_sample.py ${PROJECT} \
list_subscriptions | grep projects/${PROJECT}/subscriptions/${TOPIC}

if [ $? -ne 0 ]
then
  python /cloud-pubsub-samples-python/cmdline-pull/pubsub_sample.py ${PROJECT} \
  create_subscription ${SUB} ${TOPIC}
else
  echo "Subscriptions ${SUB} exists"
fi

# Push test data
if [ "$@" = "push" ]
then
  echo "Test pushing messages"
  python /cloud-pubsub-samples-python/gce-cmdline-publisher/traffic_pubsub_generator.py \
  --filename 'Freeways-5Minaa2010-01-01_to_2010-02-15_test2.csv' \
  --topic projects/${PROJECT}/topics/${TOPIC} --replay
fi

# Pull messages from a subscription
if [ "$@" = "pull" ]
then
  echo "Test pulling messages"
  python /cloud-pubsub-samples-python/cmdline-pull/pubsub_sample.py ${PROJECT} \
  pull_messages ${SUB}
fi
