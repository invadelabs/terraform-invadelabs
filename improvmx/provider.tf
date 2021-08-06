provider "improvmx" {
  token = data.terraform_remote_state.gcp.outputs.improvmx_api_key
}
