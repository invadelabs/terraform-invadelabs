resource "google_service_account" "secret_reader" {
  account_id   = "secret-reader"
  display_name = "Service Account to read from Secrets Manager"
}

resource "google_project_iam_member" "secretmanager_secretaccessor" {
  #project = google_project.invadelabs.name
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.secret_reader.email}"
}
