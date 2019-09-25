variable "deployment_name" {
  description = "Name of the deployment that will be create."
  default     = "alertmanager-webhook-servicenow"
}

variable "namespace" {
  description = "Namespace in which the module will be deployed."
  default     = "default"
}

variable "annotations" {
  description = "Additionnal annotations that will be merged on all resources."
  default     = {}
}

variable "deployment_annotations" {
  description = "Additionnal annotations that will be merged on the deployment."
  default     = {}
}

variable "labels" {
  description = "Additionnal labels that will be merged on all resources."
  default     = {}
}

variable "deployment_labels" {
  description = "Additionnal labels that will be merged on the deployment."
  default     = {}
}

variable "replicas" {
  description = "Number of replicas to deploy."
  default     = 2
}

variable "image_pull_policy" {
  description = "Image pull policy on the main container."
  default     = "IfNotPresent"
}

variable "service_name" {
  description = "Name of the service that will be create"
  default     = "alertmanager-webhook-servicenow"
}

variable "service_annotations" {
  description = "Additionnal annotations that will be merged for the service."
  default     = {}
}

variable "service_labels" {
  description = "Additionnal labels that will be merged for the service."
  default     = {}
}

variable "port" {
  description = "Port to be used for the service."
  default     = 80
}

variable "config_map_name" {
  description = "Name of the config map that will be created."
  default     = "alertmanager-webhook-servicenow"
}

variable "config_map_annotations" {
  description = "Additionnal annotations that will be merged for the config map."
  default     = {}
}

variable "config_map_labels" {
  description = "Additionnal labels that will be merged for the config map."
  default     = {}
}

variable "secret_name" {
  description = "Name of the secret that will be created."
  default     = "alertmanager-webhook-servicenow"
}

variable "secret_annotations" {
  description = "Additionnal annotations that will be merged for the secret."
  default     = {}
}

variable "secret_labels" {
  description = "Additionnal labels that will be merged for the secret."
  default     = {}
}

variable "enabled" {
  description = "Whether or not to enable this module."
  default     = true
}

variable "instance_name" {
  description = "Name of the service-now instance to connect to."
  type        = string
}

variable "user_name" {
  description = "Username to use when connecting to service-now."
  type        = string
}

variable "password" {
  description = "Password to use when connecting to service-now."
  type        = string
}

variable "configuration" {
  description = "Configuration to use for alertmanager-webhook-servicenow (must be a yaml string)."
  type        = string
}
