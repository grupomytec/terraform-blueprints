# ECS Task Execution Role
data "aws_iam_policy_document" "ecs_tasks_execution_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "ecs-tasks.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "ecs_tasks_execution_role" {
  name               = "${local.name}-ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_execution_role.json
}

resource "aws_iam_role" "ecs_tasks_role" {
  count = var.task_role_arn == null ? 1 : 0

  name               = "${local.name}-ecsTaskRole"
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_execution_role.json
}

# Policy
data "aws_iam_policy_document" "ecs_policy" {
  statement {
    sid       = "ParameterStore"
    effect    = "Allow"
    actions   = ["ssm:GetParameters"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ecs_tasks_policy" {
  count = var.task_role_arn == null ? 1 : 0

  statement {
    sid    = "AllowSSMExec"
    effect = "Allow"
    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel",
      "logs:DescribeLogGroups",
      "logs:CreateLogStream",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "ecs_policy" {
  name   = "${local.name}-ecs-policy"
  role   = aws_iam_role.ecs_tasks_execution_role.id
  policy = data.aws_iam_policy_document.ecs_policy.json
}

resource "aws_iam_role_policy" "ecs_tasks_policy" {
  count = var.task_role_arn == null ? 1 : 0

  name   = "${local.name}-ecs-tasks-policy"
  role   = aws_iam_role.ecs_tasks_role[0].id
  policy = data.aws_iam_policy_document.ecs_tasks_policy[0].json
}

resource "aws_iam_role_policy_attachment" "ecs_tasks_execution_role" {
  role       = aws_iam_role.ecs_tasks_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
