variable "sc_token" {}

terraform {
  backend "local" {
    path = "./.tf-state"
  }
}

provider "scalingo" {
  api_token = "${var.sc_token}"
}

resource "scalingo_app" "sc_app" {
  name = "sc-terraform-notifiers"
}

data "scalingo_notification_platform" "slack_platform" {
  name = "slack"
}

resource "scalingo_notifier" "slack_notifier" {
  platform_id     = "${data.scalingo_notification_platform.slack_platform.id}"
  app             = "${scalingo_app.sc_app.id}"
  name            = "slack-notifier-deployments"
  webhook_url     = "https://example.com"
  selected_events = ["app_deployed", "app_restarted"]
}

data "scalingo_notification_platform" "email_platform" {
  name = "email"
}

resource "scalingo_notifier" "email_notifier" {
  platform_id     = "${data.scalingo_notification_platform.email_platform.id}"
  app             = "${scalingo_app.sc_app.id}"
  name            = "email-notifier-addons"
  emails          = ["user1@example.com", "user2@example.com"]
  selected_events = ["addon_provisioned", "addon_resumed", "addon_suspended", "addon_db_upgraded", "addon_deleted", "addon_plan_changed"]
}
