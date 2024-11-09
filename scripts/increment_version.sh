#!/bin/bash

#Github action sh script based on this locally tested script.


#Retrieve current version form pom.xml file using mvn commands
app_project_current_version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
echo "Current version from pom.xml file is: $app_project_current_version"

# Split the string into an array named project_version_parts by using '.' as a delimiter
IFS='.' read -r -a project_version_parts <<< "$app_project_current_version"

# Increment the last index by 1
((project_version_parts[2]++))

app_project_new_version="${project_version_parts[0]}.${project_version_parts[1]}.${project_version_parts[2]}"
echo "Before updateing pom.xml file, new version: $app_project_new_version"
mvn versions:set -DnewVersion=$app_project_new_version

#Validate project version was updated.
new_project_version_validation=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
if [[ "$new_project_version_validation" != "$app_project_new_version" ]]; then
    echo "Failed to update version"
    exit 1
else
    echo "Successfully updated version to: $new_project_version_validation"
    exit 0
fi