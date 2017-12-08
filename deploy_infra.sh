#!/usr/bin/env bash

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --output text --query 'Account')

S3_TARGET_DIR="s3://bridge-cloudformation-artifacts-$AWS_ACCOUNT_ID/$STACK_NAME/"
echo "Uploading cf_templates to $S3_TARGET_DIR"
aws s3 cp --recursive cf_templates $S3_TARGET_DIR

TEMPLATE_URL="https://s3.amazonaws.com/bridge-cloudformation-artifacts-$AWS_ACCOUNT_ID/$STACK_NAME/eb_bridgepf.yml"
echo "Validating CF template $TEMPLATE_URL"
aws cloudformation validate-template --template-url $TEMPLATE_URL

echo "Deploying CF template $TEMPLATE_URL"
# Handle message that shouldn't be an error, https://github.com/hashicorp/terraform/issues/5653
message=$(./update_cf_stack.sh $TEMPLATE_URL 2>&1 1>/dev/null)
error_code=$(echo $?)
if [[ $error_code -ne 0 && $message =~ .*"No updates are to be performed".* ]]; then
  echo "No stack changes detected. An update is not required."
  exit 0
fi
echo $message
exit $error_code
