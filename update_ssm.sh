#!/usr/bin/env bash
set -e

# double interpolate vars from travis
eval export "BridgeHealthcodeRedisKey=\$BridgeHealthcodeRedisKey_$TRAVIS_BRANCH"
eval export "EmailUnsubscribeToken=\$EmailUnsubscribeToken_$TRAVIS_BRANCH"
eval export "HibernateConnectionPassword=\$HibernateConnectionPassword_y_$TRAVIS_BRANCH"
eval export "HibernateConnectionUrl=\$HibernateConnectionUrl_$TRAVIS_BRANCH"
eval export "HibernateConnectionUsername=\$HibernateConnectionUsername_$TRAVIS_BRANCH"
eval export "SynapseApiKey=\$SynapseApiKeyy_$TRAVIS_BRANCH"
eval export "SynapseUser=\$SynapseUser_$TRAVIS_BRANCH"

# CF does not support SecureString, update with AWS CLI instead.
# !!Important!! - this only adds, it does not cleanup.  Make sure to cleanup using the AWS console or CLI (delete-parameter command)
KMS_KEY_ID="alias/bridgepf-$TRAVIS_BRANCH/KmsKey"
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/BRIDGE_HEALTHCODE_REDIS_KEY" --value "$BridgeHealthcodeRedisKey" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/EMAIL_UNSUBSCRIBE_TOKEN" --value "$EmailUnsubscribeToken" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/HIBERNATE_CONNECTION_PASSWORD" --value "$HibernateConnectionPassword" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/HIBERNATE_CONNECTION_URL" --value "$HibernateConnectionUrl" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/HIBERNATE_CONNECTION_USERNAME" --value "$HibernateConnectionUsername" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/SYNAPSE_API_KEY" --value "$SynapseApiKey" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
aws ssm put-parameter --name "/bridgepf-$TRAVIS_BRANCH/SYNAPSE_USER" --value "$SynapseUser" --type "SecureString" --key-id "$KMS_KEY_ID" --overwrite
