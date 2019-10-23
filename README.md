# ruby + Fargate + ECS Events

- Github API へ GET リクエストを投げてスターを付けたリポジトリの情報を取得する Ruby スクリプト
- ↑ のスクリプトの実行環境(Ruby2.6.5 on docker)
- AWS ECR に登録された Ruby スクリプトを実行する ECS タスクをローカルで実行する(docker-compose.ecs-local.yml)
- 作成済みの ECS クラスタへ ECSEvents を登録する CloudFormation テンプレート

## dev

```bash
$ docker-compose up -d
```

## logs

```bash
$ aws ecs describe-task-definition --task-definition rubyapp --query "taskDefinition.taskDefinitionArn" --output text
arn:aws:ecs:ap-northeast-1:8***********:task-definition/rubyapp:2

$ ecs-cli local up --task-def-remote arn:aws:ecs:ap-northeast-1:8***********::task-definition/rubyapp:2
INFO[0000] Reading task definition from rubyapp:2
```

```bash
$ ecs-cli local down
```

## create ECSEvents

```
$ aws cloudformation create-stack --stack-name rubyappevent --template-body file://templates/ecs-events.yml
```
