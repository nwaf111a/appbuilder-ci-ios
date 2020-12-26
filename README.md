[![Board Status](https://a-f-almalki.visualstudio.com/d96385bd-3ed0-4ee5-bebf-1717dbf62e74/fc38d75d-0bec-43eb-a290-2f2846700235/_apis/work/boardbadge/f8d63ebe-9e88-4ac7-9e23-44b1fde891e1)](https://a-f-almalki.visualstudio.com/d96385bd-3ed0-4ee5-bebf-1717dbf62e74/_boards/board/t/fc38d75d-0bec-43eb-a290-2f2846700235/Microsoft.RequirementCategory)
# appbuilder-ci-ios

## Description

The `appbuilder-ci-ios` is a CI build description for the Scriptoria project. This project provides a way for iOS apps to be be remotely signed after they have been built by `appbuilder-buildengine-api` on AWS CodeBuild using `docker-appbuilder-agent`.

## Travis CI

To trigger a build using [Travis](https://travis-ci.org), clone this repo and [Trigger a build using the Travis API](https://docs.travis-ci.com/user/triggering-builds/).

### Sample Request

#### URL

https://api.travis-ci.org/repo/sillsdev%2Fappbuilder-ci-ios/requests

#### HEADER

```
Content-Type: application/json
Accept: application/json
Travis-API-Version: 3
Authorization: token $TOKEN
```

#### BODY

```
{
  "request" : {
    "branch":"master",
    "message":"Build Message",
    "config" : {
      "merge_mode" : "deep_merge_prepend",
      "env": {
        "global" : [
          "APPBUILDER_ASSET=WEB-1.4.ipa",
          "APPBUILDER_ASSET_DOWNLOAD_PATH=s3://sil-stg-aps-files/stg/jobs/build_scriptureappbuilder_0/1",
          "APPBUILDER_ASSET_RESULT_PATH=s3://sil-stg-aps-files/stg/jobs/build_scriptureappbuilder_0/1/signed",
          "APPBUILDER_SECRETS_PATH=s3://sil-stg-aps-secrets/jenkins/build/apple_app_store/bluevire"
        ]
      }
    }
  }
}
```

## Circle CI

To trigger a build using [Circle CI](https://circleci.com), clone this repo and [Trigger a Job using the Circle CI API](https://circleci.com/docs/2.0/api-job-trigger/) and [Injecting Environment Variables with the API](https://circleci.com/docs/2.0/env-vars/#injecting-environment-variables-with-the-api).

### Sample Request

#### URL

https://circleci.com/api/v1.1/project/github/sillsdev/appbuilder-ci-ios/tree/master?circle-token=$TOKEN

#### HEADERS

```
Content-Type: application/json
```

#### BODY

```
{
  "build_parameters": {
    "APPBUILDER_ASSET": "WEB-1.4.ipa",
    "APPBUILDER_ASSET_DOWNLOAD_PATH": "s3://sil-stg-aps-files/stg/jobs/build_scriptureappbuilder_0/1",
    "APPBUILDER_ASSET_RESULT_PATH": "s3://sil-stg-aps-files/stg/jobs/build_scriptureappbuilder_0/1/signed",
    "APPBUILDER_SECRETS_PATH": "s3://sil-stg-aps-secrets/jenkins/build/apple_app_store/bluevire"
  }
}
```
