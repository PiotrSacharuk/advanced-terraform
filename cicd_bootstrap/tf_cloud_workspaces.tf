# Try to use existing OAuth client first
data "tfe_oauth_client" "existing" {
    count            = var.create_oauth_client ? 0 : 1
    organization     = var.tf_cloud_organization
    service_provider = "github"
}

# Create new OAuth client if needed
resource "tfe_oauth_client" "new" {
    count            = var.create_oauth_client ? 1 : 0
    organization     = var.tf_cloud_organization
    api_url          = "https://api.github.com/"
    http_url         = "https://github.com"
    oauth_token      = var.github_oauth_token
    service_provider = "github"
}

locals {
    oauth_token_id = var.create_oauth_client ? tfe_oauth_client.new[0].oauth_token_id : data.tfe_oauth_client.existing[0].oauth_token_id
}

resource "tfe_workspace" "dev" {
    name                  = "app-dev"
    organization          = var.tf_cloud_organization
    tag_names             = ["app", "dev-environment"]
    allow_destroy_plan    = true
    auto_apply            = true
    queue_all_runs        = false
    file_triggers_enabled = false
    vcs_repo {
        identifier     = var.vcs-identifier
        branch         = var.dev-main-branch
        oauth_token_id = local.oauth_token_id
    }
}

resource "tfe_workspace" "qa" {
    name                  = "app-qa"
    organization          = var.tf_cloud_organization
    tag_names             = ["app", "qa-environment"]
    allow_destroy_plan    = true
    auto_apply            = true
    queue_all_runs        = false
    file_triggers_enabled = false
    vcs_repo {
        identifier     = var.vcs-identifier
        branch         = var.qa-main-branch
        oauth_token_id = local.oauth_token_id
    }
}