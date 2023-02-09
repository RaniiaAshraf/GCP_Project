resource "google_service_account" "myinstance-sa" {
  account_id   = var.instance-sa-id 
  display_name = var.instance-sa-name 
}


resource "google_project_iam_binding" "my-instance-roles" {
project = var.project-id
role =  var.roles-instance

members = [
  "serviceAccount:${google_service_account.myinstance-sa.email}"
]
}


############################################################################

resource "google_service_account" "gke-sa" {
  account_id   = var.gke-sa-id 
  display_name = var.gke-sa-name 
}


resource "google_project_iam_binding" "gke-roles" {
project = var.project-id
role =  var.gkeroles

members = [
  "serviceAccount:${google_service_account.gke-sa.email}"
]
}