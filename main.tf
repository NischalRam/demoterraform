terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "nischal"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "demo_db_1" {
  name    = "DEMO_DB_1"
  comment = "Database for Snowflake Terraform demo"
}


resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}


resource "snowflake_database" "Hospital" {
  name    = "Hospital"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_database" "Diseases" {
  name    = "Diseases"
  comment = "Database for Snowflake Terraform demo"
}

