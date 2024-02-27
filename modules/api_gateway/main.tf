resource "aws_api_gateway_rest_api" "spotmusic_api" {
  name    = var.project_name + "-api"
  description = "API Gateway para SpotMusic"
  stage_name = var.api_gateway_stage_name

  # CORS configuration
  # TODO Adicionar regras de CORS no futuro

  # Deployment settings
  # TODO Adicionar Deployment Settings

  # API Gateway resources and methods

  resource "aws_api_gateway_resource" "spotmusic_api_root" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    path_part    = "/"
  }

  # Playlists

  resource "aws_api_gateway_resource" "spotmusic_api_playlist" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    parent_id   = aws_api_gateway_resource.spotmusic_api_root.id
    path_part   = var.api_gateway_resource_paths["playlists"]
  }

  resource "aws_api_gateway_method" "spotmusic_api_playlist_create" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    resource_id = aws_api_gateway_resource.spotmusic_api_playlist.id
    http_method = var.api_gateway_method_integrations["playlists_create"]["http_method"]
    authorization = var.api_gateway_method_integrations["playlists_create"]["authorization"]
    integration {
      uri = var.api_gateway_method_integrations["playlists_create"]["uri"]
    }
  }

  resource "aws_api_gateway_method" "spotmusic_api_playlist_list" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    resource_id = aws_api_gateway_resource.spotmusic_api_playlist.id
    http_method = var.api_gateway_method_integrations["playlists_list"]["http_method"]
    authorization = var.api_gateway_method_integrations["playlists_list"]["authorization"]
    integration {
      uri = var.api_gateway_method_integrations["playlists_list"]["uri"]
    }
  }

  resource "aws_api_gateway_method" "spotmusic_api_playlist_get" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    resource_id = aws_api_gateway_resource.spotmusic_api_playlist.id
    http_method = var.api_gateway_method_integrations["playlists_get"]["http_method"]
    authorization = var.api_gateway_method_integrations["playlists_get"]["authorization"]
    integration {
      uri = var.api_gateway_method_integrations["playlists_get"]["uri"]
    }
  }

  resource "aws_api_gateway_method" "spotmusic_api_playlist_update" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    resource_id = aws_api_gateway_resource.spotmusic_api_playlist.id
    http_method = var.api_gateway_method_integrations["playlists_update"]["http_method"]
    authorization = var.api_gateway_method_integrations["playlists_update"]["authorization"]
    integration {
      uri = var.api_gateway_method_integrations["playlists_update"]["uri"]
    }
  }

  resource "aws_api_gateway_method" "spotmusic_api_playlist_delete" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    resource_id = aws_api_gateway_resource.spotmusic_api_playlist.id
    http_method = var.api_gateway_method_integrations["playlists_delete"]["http_method"]
    authorization = var.api_gateway_method_integrations["playlists_delete"]["authorization"]
    integration {
      uri = var.api_gateway_method_integrations["playlists_delete"]["uri"]
    }
  }

  # Playlist Songs
  resource "aws_api_gateway_resource" "spotmusic_api_playlist_songs" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    parent_id   = aws_api_gateway_resource.spotmusic_api_playlist.id
    path_part   = var.api_gateway_resource_paths["playlists/{playlist_id}"]["songs"]
  }

  resource "aws_api_gateway_method" "spotmusic_api_playlist_songs_add" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    resource_id = aws_api_gateway_resource.spotmusic_api_playlist_songs.id
    http_method = var.api_gateway_method_integrations["playlists_songs_add"]["http_method"]
    authorization = var.api_gateway_method_integrations["playlists_songs_add"]["authorization"]
    integration {
      uri = var.api_gateway_method_integrations["playlists_songs_add"]["uri"]
    }
  }

  resource "aws_api_gateway_method" "spotmusic_api_playlist_songs_list" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    resource_id = aws_api_gateway_resource.spotmusic_api_playlist_songs.id
    http_method = var.api_gateway_method_integrations["playlists_songs_list"]["http_method"]
    authorization = var.api_gateway_method_integrations["playlists_songs_list"]["authorization"]
    integration {
      uri = var.api_gateway_method_integrations["playlists_songs_list"]["uri"]
    }
  }

  resource "aws_api_gateway_resource" "spotmusic_api_playlist_song" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    parent_id   = aws_api_gateway_resource.spotmusic_api_playlist_songs.id
    path_part   = var.api_gateway_resource_paths["playlists/{playlist_id}"]["songs"] + "/{song_id}"
  }

  resource "aws_api_gateway_method" "spotmusic_api_playlist_song_delete" {
    rest_api_id = aws_api_gateway_rest_api.spotmusic_api.id
    resource_id = aws_api_gateway_resource.spotmusic_api_playlist_song.id
    http_method = var.api_gateway_method_integrations["playlists_songs_delete"]["http_method"]
    authorization = var.api_gateway_method_integrations["playlists_songs_delete"]["authorization"]
    integration {
      uri = var.api_gateway_method_integrations["playlists_songs_delete"]["uri"]
    }
  }
}