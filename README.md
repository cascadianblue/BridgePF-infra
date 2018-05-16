# BridgePF-infra
Install and configure the AWS Infrastructure for the BridgePF application.


## Initialize a new stack
1. Deploy the infrastructure to AWS.  The stack-name parameter should be $STACK_NAME-$ENVIRONMENT (example: bridgepf-develop).

```
pip install sceptre
export TRAVIS_BRANCH=develop
source env_vars && source env_vars.secret
sceptre --var "profile=bridge.prod.travis" --var "region=us-east-1" launch-env develop
```

The above should create the infrastructure required for BridgePF, it does not actually deploy the app it only installs
and configures the required AWS infrastructure for it.  The AWS appilcation health check is enabled therefore the EB
environment will start in an error state since the app has not been deployed.  The environment status should turn
green once the app is successfully deployed.

2. Check for additional bootstrapping steps in BridgePF repo[1]

3. Once the infrastructure for BridgePF app has been setup you can deploy the app file to the stack.  This can be done
by using either the AWS console[2] or using the AWS CLI[3][4].


# Contributions

## Issues
* https://sagebionetworks.jira.com/projects/BRIDGE

## Builds
* https://travis-ci.org/Sage-Bionetworks/BridgePF-infra

## Secrets
* We use git-crypt[5] to hide secrets for BridgePF.  Access to secrets is tightly controlled.  You will be required to
have your own GPG key[6] and you must request access by a maintainer of this project.



# References

[1] https://github.com/Sage-Bionetworks/BridgePF/wiki

[2] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deploy-existing-version.html

[3] https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/create-application-version.html

[4] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-deploy.html

[5] https://github.com/AGWA/git-crypt

[6] https://help.github.com/articles/generating-a-new-gpg-key
