provider "google" {
  credentials = "${file("~/account.json")}" // put the path to your service account file
  project     = "phonic-command-291302"
  zone        = "us-central1-a"
}
