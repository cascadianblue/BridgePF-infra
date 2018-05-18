#!/usr/bin/env bash
set -e

# CF does not support SecureString, update with AWS CLI instead.
# !!Important!! - this only adds, it does not cleanup.  Make sure to cleanup using the AWS console or CLI (delete-parameter command)
KMS_KEY_ID="alias/bridgepf-$TRAVIS_BRANCH/KmsKey"
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/BRIDGE_HEALTHCODE_REDIS_KEY" --value "$BridgeHealthcodeRedisKey_$TRAVIS_BRANCH" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/EMAIL_UNSUBSCRIBE_TOKEN" --value "$EmailUnsubscribeToken_$TRAVIS_BRANCH" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/HIBERNATE_CONNECTION_PASSWORD" --value "$HibernateConnectionPassword_$TRAVIS_BRANCH" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/HIBERNATE_CONNECTION_URL" --value "$HibernateConnectionUrl_$TRAVIS_BRANCH" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/HIBERNATE_CONNECTION_USERNAME" --value "$HibernateConnectionUsername_$TRAVIS_BRANCH" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/SYNAPSE_API_KEY" --value "$SynapseApiKey_$TRAVIS_BRANCH" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/SYNAPSE_USER" --value "$SynapseUser_$TRAVIS_BRANCH" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
