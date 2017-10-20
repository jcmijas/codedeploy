#!/bin/bash
aws deploy --profile sandbox create-deployment \
--application-name api_gseanalytics \
--deployment-config-name CodeDeployDefault.OneAtATime \
--deployment-group-name api_gseanalytics_gn \
--description "Main Api GSE Analytics Deployment" \
--ignore-application-stop-failures \
--github-location repository=jcmijas/codedeploy,commitId=$(git rev-parse HEAD)
