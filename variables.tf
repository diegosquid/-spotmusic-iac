variable "region" {
  type = string
  default = "us-west-2"
}

variable "project_name" {
  type = string
  default = "spotmusic"
}

variable "ecr_repository_name" {
  type = string
  default = "spotmusic-ecr"
}

variable "ecs_cluster_name" {
  type = string
  default = "spotmusic-cluster"
}

variable "dynamodb_table_name" {
  type = string
  default = "spotmusic-table"
}

# Variáveis para API Gateway
variable "api_gateway_stage_name" {
  type = string
  default = "dev"
}

variable "api_gateway_resource_paths" {
  type = map(string)
  default = {
    "playlists" = "/playlists",
    "playlists/{playlist_id}" = "/playlists/:playlist_id",
    "playlists/{playlist_id}/songs" = "/playlists/:playlist_id/songs",
    "playlists/{playlist_id}/songs/{song_id}" = "/playlists/:playlist_id/songs/:song_id",
  }
}

variable "api_gateway_method_integrations" {
  type = map(string)
  default = {
    "playlists_create" = "POST /playlists",
    "playlists_list" = "GET /playlists",
    "playlists_get" = "GET /playlists/{playlist_id}",
    "playlists_update" = "PUT /playlists/{playlist_id}",
    "playlists_delete" = "DELETE /playlists/{playlist_id}",
    "playlists_songs_add" = "POST /playlists/{playlist_id}/songs",
    "playlists_songs_list" = "GET /playlists/{playlist_id}/songs",
    "playlists_songs_delete" = "DELETE /playlists/{playlist_id}/songs/{song_id}",
  }
}

