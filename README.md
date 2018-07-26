# BridgePF-infra
Install and configure the AWS Infrastructure for the BridgePF application.


## Initialize a new stack
1. Deploy the infrastructure to AWS.  The stack-name parameter should be $STACK_NAME-$ENVIRONMENT (example: bridgepf-develop).

```
# Update CF stacks with sceptre:
# sceptre launch-stack prod <stack_name>
```

The above should create the infrastructure required for BridgePF, it does not actually deploy the app it only installs
and configures the required AWS infrastructure for it.  The AWS appilcation health check is enabled therefore the EB
environment will start in an error state since the app has not been deployed.  The environment status should turn
green once the app is successfully deployed.

2. Check for additional bootstrapping steps in BridgePF repo[1]

3. Once the infrastructure for BridgePF app has been setup you can deploy the app file to the stack.  This can be done
by using either the AWS console[2] or using the AWS CLI[3][4].


## Continuous Integration
We have configured Travis to deploy CF template updates.  Travis deploys using
[sceptre](https://sceptre.cloudreach.com/latest/about.html)

# Contributions

## Issues
* https://sagebionetworks.jira.com/projects/BRIDGE

## Builds
* https://travis-ci.org/Sage-Bionetworks/BridgePF-infra

## Secrets
* We use the [AWS SSM](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-paramstore.html)
to store secrets for this project.  Sceptre retrieves the secrets using
a [sceptre ssm resolver](https://github.com/cloudreach/sceptre/tree/v1/contrib/ssm-resolver)
and passes them to the cloudformation stack on deployment.


# References

[1] https://github.com/Sage-Bionetworks/BridgePF/wiki

[2] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deploy-existing-version.html

[3] https://docs.aws.amazon.com/cli/latest/reference/elasticbeanstalk/create-application-version.html

[4] https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb3-deploy.html
\
