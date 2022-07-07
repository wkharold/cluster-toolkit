/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "deployment_name" {
  description = "Name of the deployment, used for the job_id"
  type        = string
}

variable "project_id" {
  description = "Project in which the HPC deployment will be created"
  type        = string
}

variable "region" {
  description = "The region in which to create the login node"
  type        = string
}

variable "labels" {
  description = "Labels to add to the login node. List key, value pairs"
  type        = any
}

variable "instance_template" {
  description = "Login VM instance template self-link"
  type        = string
}

variable "job_template_contents" {
  description = "The contents of the Cloud Batch job template"
  type        = string
}

variable "job_filename" {
  description = "The filename of the generated job template file"
  type        = string
}

variable "job_id" {
  description = "An id for the Cloud Batch job. Used for output instructions"
  type        = string
}

variable "gcloud_version" {
  description = "The version of the gcloud cli being used. Used for output instructions. Valid inputs are `\"alpha\"`, `\"beta\"` and \"\" (empty string for default version)"
  type        = string
  default     = "alpha"

  validation {
    condition     = contains(["alpha", "beta", ""], var.gcloud_version)
    error_message = "Allowed values for gcloud_version are 'alpha', 'beta', or '' (empty string)."
  }
}

variable "batch_job_directory" {
  description = "The path of the directory on the login node in which to place the Cloud Batch job template"
  type        = string
  default     = "/home/batch-jobs"
}
