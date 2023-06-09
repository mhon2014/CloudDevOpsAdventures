terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~> 4.37.0"
        }
    }
}

provider "google" {
    project = var.gcp_project_id
}

#Google Kubernetes Engine
resource "google_container_cluster" "primary" {
    name = "kubernetes-cluster"
    location = var.gcp_region
    initial_node_count = 1
    enable_autopilot = true
    ip_allocation_policy {
    
    }
}

# Cloud SQL
resource "google_sql_database_instance" "dbinstance" {
    name = "sql-database-instance"
    region = var.gcp_region
    database_version = "MYSQL_8_0"
    settings {
        tier = "db-f1-micro"
    }
    deletion_protection = true
}

resource "google_sql_database" "sqldatabase" {
    name = "sql-database"
    instance = google_sql_database_instance.dbinstance.name
}