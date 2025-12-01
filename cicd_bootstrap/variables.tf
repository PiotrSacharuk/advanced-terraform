variable "tf_cloud_token" {

}

variable "tf_cloud_organization" {

}

variable "github_oauth_token" {

}

variable "dev-project-id" {
    type = string
}

variable "qa-project-id" {
    type = string
}

variable "vcs-identifier" {

}

variable "enabled_services" {
    type = list
    default = [
        "iam.googleapis.com",
        "cloudresourcemanager.googleapis.com",
        "compute.googleapis.com",
        "redis.googleapis.com",
    ]
}

variable "dev-main-branch" {
    type = string
    default = "master"
}

variable "qa-main-branch" {
    type = string
    default = "master_qa"
}