#!/bin/bash
aws deploy --profile sandbox create-deployment \
--application-name CI_api_gseanalytics \
--deployment-config-name CodeDeployDefault.OneAtATime \
--deployment-group-name CI_api_gseanalytics_Deployment_Group \
--description "Main Api GSE Analytics Deployment" \
--ignore-application-stop-failures \
--github-location repository=jcmijas/codedeploy,commitId=$(git rev-parse HEAD)
