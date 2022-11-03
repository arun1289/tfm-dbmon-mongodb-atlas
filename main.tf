terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
    }
  }
}

# ====================================================HOST==================================================
# When host is down 
# send if condition lasts 5 minutes
# resend after 120 minutes
resource "mongodbatlas_alert_configuration" "host_down" {
  project_id = var.atlas_projectid
  event_type = var.event_HostDown
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    interval_min  = var.host_down_interval_min
    delay_min     = var.host_down_delay_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }

}

#--------------ADD CORRECT INTERVAL AND DELAY ONCE IT'S PROVIDED---------------------
# Search process ran out of memory
# send if condition lasts: Undefined 
# resend after : undefined
resource "mongodbatlas_alert_configuration" "host_searchProcess" {
  project_id = var.atlas_projectid
  event_type = var.host_search_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    interval_min  = var.host_search_interval_min
    delay_min     = var.host_search_delay_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}
#---------------------------------------------------------------------------------------



# # When System: CPU (User) % is 95%
# # send if condition lasts 15 minutes
# # resend after 30 minutes
# resource "mongodbatlas_alert_configuration" "host_CPU" {
#   project_id = var.atlas_projectid
#   event_type = var.OUTSIDE_METRIC_THRESHOLD
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     interval_min  = var.host_CPU_interval_min
#     delay_min     = var.host_CPU_delay_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username      = var.username
#   }

#   metric_threshold_config {
#     metric_name = var.metric_name_CPU_user
#     operator    = var.operator_Greater
#     threshold   = var.threshold_Host_CPU
#     units       = var.unit_Raw
#     mode        = var.mode_average
# }
# }


# #--------------ADD CORRECT INTERVAL AND DELAY ONCE IT'S PROVIDED---------------------
# # When Replication Lag is above 2 hours
# # send if condition lasts: Undefined 
# # resend after : undefined
# resource "mongodbatlas_alert_configuration" "host_replication_lag" {
#   project_id = var.atlas_projectid
#   event_type = var.OUTSIDE_METRIC_THRESHOLD
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     # Delay and interval not specified on excel
#     # Error NONZERO_DELAY_REQUIRED if they aren't defined
#     delay_min     = var.host_Replication_delay_min
#     interval_min  = var.host_Replication_interval_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username         = var.username
#   }

#   metric_threshold_config {
#     metric_name = var.metric_replication_lag
#     operator    = var.operator_Greater
#     threshold   = var.threshold_replication_lag
#     units       = var.units_hours
# }
# }


# # When System: Memory usage % is 95%
# # send if condition lasts 15 minutes
# # resend after 30 minutes
# resource "mongodbatlas_alert_configuration" "memory_usage" {
#   project_id = "60e5b94dcc4ce8715d19f5f9"
#   event_type = "OUTSIDE_METRIC_THRESHOLD"
#   enabled    = true

#   notification {
#     type_name     = "GROUP"
#     interval_min  = 30
#     delay_min     = 15
#     sms_enabled   = false
#     email_enabled = true
#     username         = ["GROUP_OWNER"]
#   }

#   metric_threshold_config {
#     #metric_name = "NORMALIZED_FTS_PROCESS_CPU_USER"
#     operator    = "GREATER_THAN"
#     threshold   = 95.0
#     units       = "RAW"
#     mode        = "AVERAGE"
# }
# }

#------------------------------------------------------------
#------------------------REPLICA SET-------------------------
# When Replica set has no primary
# send if condition lasts 5 minutes
# resend after 30 minutes
resource "mongodbatlas_alert_configuration" "replica_Set_noPrimary" {
  project_id = var.atlas_projectid
  event_type = var.NO_PRIMARY
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    interval_min  = var.replica_noPrimary_interval_min
    delay_min     = var.replica_noPrimary_delay_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username         = var.username
  }
}

# Number of election events is above 2 
# send if condition lasts 1440 minutes (24 hours)
# resend after : NA
resource "mongodbatlas_alert_configuration" "replica_Set_election" {
  project_id = var.atlas_projectid
  event_type = var.TOO_MANY_ELECTIONS
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    interval_min  = var.replica_election_interval_min
    delay_min     = var.replica_election_delay_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username         = var.username
  }

  threshold_config {
    operator    = var.operator_Greater
    threshold   = var.threshold_replica_election
    units       = var.units_hours
  }
}


#--------------ADD CORRECT INTERVAL, DELAY, AND THRESHOLD ONCE IT'S PROVIDED---------------------
# Replication Oplog Window is below 2 hours
# send if condition lasts : undefined
# resend after : undefined
resource "mongodbatlas_alert_configuration" "replica_oplog_window" {
  project_id = var.atlas_projectid
  event_type = var.replica_oplog_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.replica_oplog_delay_min
    interval_min  = var.replica_oplog_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }

 threshold_config {
    operator    = var.operator_Less
    threshold   = var.threshold_replica_oplog
    units       = var.units_hours
  }
}
#-----------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------


#----------------------------------------------------------------
#------------------------SHARDED CLUSTER-------------------------


#--------------ADD CORRECT INTERVAL AND DELAY ONCE IT'S PROVIDED---------------------
# Cluster is missing an active mongos
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "CLUSTER_MONGOS_MISSING" {
  project_id = var.atlas_projectid
  event_type = var.cluster_mongos_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.cluster_mongos_delay_min
    interval_min  = var.cluster_mongos_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
  
}
#-----------------------------------------------------------------------------------------------------




#----------------------------------------------------------------
#------------------------CLOUD BACKUP----------------------------


#--------------ADD CORRECT INTERVAL AND DELAY ONCE IT'S PROVIDED---------------------
# Snapshot schedule fell behind
# send if condition lasts : more than (60 minutes) 2 hours
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "Backup_snapshot_behind" {
  project_id = var.atlas_projectid
  event_type = var.backup_snapshotBehind_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.backup_snapshotBehind_delay_min
    interval_min  = var.backup_snapshotBehind_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }

 threshold_config {
    operator    = var.operator_Greater
    threshold   = var.threshold_backup_snapshotBehind
    units       = var.units_hours
  }
}
#-----------------------------------------------------------------------------------------------------



#--------------ADD CORRECT INTERVAL AND DELAY ONCE IT'S PROVIDED---------------------
# Fallback snapshot taken
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "Backup_snapshot_taken" {
  project_id = var.atlas_projectid
  event_type = var.backup_snapshotTaken_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.backup_snapshotTaken_delay_min
    interval_min  = var.backup_snapshotTaken_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}
#-----------------------------------------------------------------------------------------------------


#--------------ADD CORRECT INTERVAL AND DELAY ONCE IT'S PROVIDED---------------------
# Fallback snapshot failed
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "Backup_snapshot_failed" {
  project_id = var.atlas_projectid
  event_type = var.backup_snapshotFailed_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.backup_snapshotFailed_delay_min
    interval_min  = var.backup_snapshotFailed_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}
#-----------------------------------------------------------------------------------------------------



#----------------------------------------------------------------
#-----------------------------USER-------------------------------
# User joined the project
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "User_joined" {
  project_id = var.atlas_projectid
  event_type = var.user_joined_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}


# User left the project
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "User_left" {
  project_id = var.atlas_projectid
  event_type = var.user_left_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}


# User had their role changed
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "User_role_change" {
  project_id = var.atlas_projectid
  event_type = var.user_roleChange_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}

#----------------------------------------------------------------
#----------------------------PROJECT-----------------------------
# # Users do not have multi-factor authentication enabled
# # send if condition lasts : UNDEFINED
# # resend after : UNDEFINED
# resource "mongodbatlas_alert_configuration" "project_auth" {
#   project_id = var.atlas_projectid
#   event_type = "USERS_WITHOUT_MULTIFACTOR_AUTH"
#   enabled    = var.config_enabled

#   notification {
#     type_name     = var.notif_user
#     delay_min     = var.project_auth_delay_min
#     interval_min  = var.project_auth_interval_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.Email_Enabled
#     username         = var.username
#   }
# }


#----------------------------------------------------------------
#-------------------------ENCRYPTION_KEY:------------------------
# GCP encryption key elapsed time since last rotation is...
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "Encryption_GCP" {
  project_id = var.atlas_projectid
  event_type = var.encryption_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.encryption_delay_min
    interval_min  = var.encryption_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
   threshold_config {
    operator    = var.operator_Greater
    threshold   = var.threshold_encryption
    units       = var.units_hours
  }
}

# AWS encryption key elapsed time since last rotation is 
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "Encryption_AWS" {
  project_id = var.atlas_projectid
  event_type = var.encryptionAWS_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.encryptionAWS_delay_min
    interval_min  = var.encryptionAWS_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
   threshold_config {
    operator    = var.operator_Greater
    threshold   = var.threshold_encryptionAWS
    units       = var.units_hours
  }
}

#----------------------------------------------------------------
#--------------------X.509 User Authentication:------------------
# X.509 User Authentication, Client Certificates Expiration Alert when days to expiration is...
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "User_auth_client_certificate" {
  project_id = var.atlas_projectid
  event_type = var.user_auth_client_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.user_auth_client_delay_min
    interval_min  = var.user_auth_client_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
   threshold_config {
    operator    = var.operator_Less
    threshold   = var.threshold_user_auth_client
    units       = var.units_days
  }
}


# X.509 User Authentication, Self-Managed CA Expiration Alert when days to expiration is...
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "User_auth_CA_certificate" {
  project_id = var.atlas_projectid
  event_type = var.user_auth_CA_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.user_auth_CA_delay_min
    interval_min  = var.user_auth_CA_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
   threshold_config{
    operator    = var.operator_Less
    threshold   = var.threshold_auth_CA_client
    units       = var.units_days
  }
}

# Backup restore suceeded 
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "Backup_restore_succeeded" {
  project_id = var.atlas_projectid
  event_type = var.backup_restoreSucceed_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.backup_restoreSucceed_delay_min
    interval_min  = var.backup_restoreSucceed_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}

# Backup restore failed
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "Backup_restore_failed" {
  project_id = var.atlas_projectid
  event_type = var.backup_restoreFailed_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.backup_restoreFailed_delay_min
    interval_min  = var.backup_restoreFailed_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}

# # Export snapshot failed
# # send if condition lasts : UNDEFINED
# # resend after : UNDEFINED
# resource "mongodbatlas_alert_configuration" "Export_snapshot_failed" {
#   project_id = var.atlas_projectid
#   event_type = var.export_snapshotFailed_eventType
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     delay_min     = var.export_snapshotFailed_delay_min
#     interval_min  = var.export_snapshotFailed_interval_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username      = var.username
#   }
# }

# Snapshot download request failed
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "Snapshot_download_failed" {
  project_id = var.atlas_projectid
  event_type = var.Snapshot_downloadFailed_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.Snapshot_downloadFailed_delay_min
    interval_min  = var.Snapshot_downloadFailed_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}

# # Cache : Dirty Bytes is 
# # send if condition lasts : UNDEFINED
# # resend after : UNDEFINED
# resource "mongodbatlas_alert_configuration" "host_dirty_bytes" {
#   project_id = var.atlas_projectid
#   event_type = var.OUTSIDE_METRIC_THRESHOLD
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     interval_min  = var.host_CPU_interval_min
#     delay_min     = var.host_CPU_delay_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username      = var.username
#   }

#   metric_threshold_config {
#     metric_name = var.metric_name_dirty_bytes
#     operator    = var.operator_Greater
#     threshold   = var.threshold_Host_CPU
#     units       = var.unit_Bytes
#     mode        = var.mode_average
# }
# }

# # Cache : Used Bytes is
# # send if condition lasts : UNDEFINED
# # resend after : UNDEFINED
# resource "mongodbatlas_alert_configuration" "host_used_bytes" {
#   project_id = var.atlas_projectid
#   event_type = var.OUTSIDE_METRIC_THRESHOLD
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     interval_min  = var.host_CPU_interval_min
#     delay_min     = var.host_CPU_delay_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username      = var.username
#   }

#   metric_threshold_config {
#     metric_name = var.metric_name_used_bytes
#     operator    = var.operator_Greater
#     threshold   = var.threshold_Host_CPU
#     units       = var.unit_Bytes
#     mode        = var.mode_average
# }
# }

# # Connection is
# # send if condition lasts : UNDEFINED
# # resend after : UNDEFINED
# resource "mongodbatlas_alert_configuration" "host_connection" {
#   project_id = var.atlas_projectid
#   event_type = var.OUTSIDE_METRIC_THRESHOLD
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     interval_min  = var.host_CPU_interval_min
#     delay_min     = var.host_CPU_delay_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username      = var.username
#   }

#   metric_threshold_config {
#     metric_name = var.metric_name_connection
#     operator    = var.operator_Greater
#     threshold   = var.threshold_connection
#     units       = var.unit_Raw
#     mode        = var.mode_average
# }
# }

# # Connection % of configured limit is 
# # send if condition lasts : UNDEFINED
# # resend after : UNDEFINED
# resource "mongodbatlas_alert_configuration" "host_connection_percen" {
#   project_id = var.atlas_projectid
#   event_type = var.OUTSIDE_METRIC_THRESHOLD
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     interval_min  = var.host_CPU_interval_min
#     delay_min     = var.host_CPU_delay_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username      = var.username
#   }

#   metric_threshold_config {
#     metric_name = var.metric_name_connection_percen
#     operator    = var.operator_Greater
#     threshold   = var.threshold_Host_CPU
#     units       = var.unit_Raw
#     mode        = var.mode_average
# }
# }

# Credit card is about to expire
# send if condition lasts : UNDEFINED
# resend after : UNDEFINED
resource "mongodbatlas_alert_configuration" "billing_creditCard" {
  project_id = var.atlas_projectid
  event_type = var.billing_creditCard_eventType
  enabled    = var.config_enabled

# the targets for Atlas to send notifications when an alert condition is detected
  notification {
    type_name     = var.notif_user
    delay_min     = var.billing_creditCard_delay_min
    interval_min  = var.billing_creditCard_interval_min
    sms_enabled   = var.SMS_Enabled
    email_enabled = var.email_enabled
    username      = var.username
  }
}

# # Daily amount billed ($) is...
# # send if condition lasts : UNDEFINED
# # resend after : UNDEFINED
# resource "mongodbatlas_alert_configuration" "billing_daily" {
#   project_id = var.atlas_projectid
#   event_type = var.user_billing_eventType
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     delay_min     = var.billing_monthly_delay_min
#     interval_min  = var.billing_monthly_interval_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username      = var.username
#   }
#    threshold_config {
#     operator    = var.operator_Greater
#     threshold   = var.threshold_billing_monthly
#     units       = var.unit_Raw
# }
# }

# # # # # # Queues : Readers is  
# # # # # resource "mongodbatlas_alert_configuration" "queues_readers" {
# # # # #   project_id = var.atlas_projectid
# # # # #   event_type = var.OUTSIDE_METRIC_THRESHOLD
# # # # #   enabled    = var.config_enabled 

# # # # # # the targets for Atlas to send notifications when an alert condition is detected
# # # # #   notification {
# # # # #     type_name     = var.notif_user
# # # # #     interval_min  = var.host_CPU_interval_min
# # # # #     delay_min     = var.host_CPU_delay_min
# # # # #     sms_enabled   = var.SMS_Enabled
# # # # #     email_enabled = var.email_enabled
# # # # #     username      = var.username
# # # # #   }

# # # # #   metric_threshold_config {
# # # # #     metric_name = var.metric_name_queues_readers
# # # # #     operator    = var.operator_Greater
# # # # #     threshold   = var.threshold_disk_partition_data2
# # # # #     units       = var.unit_Raw
# # # # #     mode        = var.mode_average
# # # # # }
# # # # # }

# # # # # Queues : Total is
# # # # resource "mongodbatlas_alert_configuration" "queues_total" {
# # # #   project_id = var.atlas_projectid
# # # #   event_type = var.OUTSIDE_METRIC_THRESHOLD
# # # #   enabled    = var.config_enabled 

# # # # # the targets for Atlas to send notifications when an alert condition is detected
# # # #   notification {
# # # #     type_name     = var.notif_user
# # # #     interval_min  = var.host_CPU_interval_min
# # # #     delay_min     = var.host_CPU_delay_min
# # # #     sms_enabled   = var.SMS_Enabled
# # # #     email_enabled = var.email_enabled
# # # #     username      = var.username
# # # #   }

# # # #   metric_threshold_config {
# # # #     metric_name = var.metric_name_queues_total
# # # #     operator    = var.operator_Greater
# # # #     threshold   = var.threshold_disk_partition_data2
# # # #     units       = var.unit_Raw
# # # #     mode        = var.mode_average
# # # # }
# # # # }

# # # # # Queues : Writers is 
# # # # resource "mongodbatlas_alert_configuration" "queues_writers" {
# # # #   project_id = var.atlas_projectid
# # # #   event_type = var.OUTSIDE_METRIC_THRESHOLD
# # # #   enabled    = var.config_enabled 

# # # # # the targets for Atlas to send notifications when an alert condition is detected
# # # #   notification {
# # # #     type_name     = var.notif_user
# # # #     interval_min  = var.host_CPU_interval_min
# # # #     delay_min     = var.host_CPU_delay_min
# # # #     sms_enabled   = var.SMS_Enabled
# # # #     email_enabled = var.email_enabled
# # # #     username      = var.username
# # # #   }

# # # #   metric_threshold_config {
# # # #     metric_name = var.metric_name_queues_writers
# # # #     operator    = var.operator_Greater
# # # #     threshold   = var.threshold_disk_partition_data2
# # # #     units       = var.unit_Raw
# # # #     mode        = var.mode_average
# # # # }
# # # # }

# # # # Effective Lock % is
# # # resource "mongodbatlas_alert_configuration" "effective_lock" {
# # #   project_id = var.atlas_projectid
# # #   event_type = var.OUTSIDE_METRIC_THRESHOLD
# # #   enabled    = var.config_enabled 

# # # # the targets for Atlas to send notifications when an alert condition is detected
# # #   notification {
# # #     type_name     = var.notif_user
# # #     interval_min  = var.host_CPU_interval_min
# # #     delay_min     = var.host_CPU_delay_min
# # #     sms_enabled   = var.SMS_Enabled
# # #     email_enabled = var.email_enabled
# # #     username      = var.username
# # #   }

# # #   metric_threshold_config {
# # #     metric_name = var.metric_name_effective_lock
# # #     operator    = var.operator_Greater
# # #     threshold   = var.threshold_disk_partition_data2
# # #     units       = var.unit_Raw
# # #     mode        = var.mode_average
# # # }
# # # }


# # # Page Fault Exceptions thrown : Total is 
# # resource "mongodbatlas_alert_configuration" "page_fault_exception_thrown" {
# #   project_id = var.atlas_projectid
# #   event_type = var.OUTSIDE_METRIC_THRESHOLD
# #   enabled    = var.config_enabled 

# # # the targets for Atlas to send notifications when an alert condition is detected
# #   notification {
# #     type_name     = var.notif_user
# #     interval_min  = var.host_CPU_interval_min
# #     delay_min     = var.host_CPU_delay_min
# #     sms_enabled   = var.SMS_Enabled
# #     email_enabled = var.email_enabled
# #     username      = var.username
# #   }

# #   metric_threshold_config {
# #     metric_name = var.metric_name_exception_thrown
# #     operator    = var.operator_Greater
# #     threshold   = var.threshold_disk_partition_data2
# #     units       = var.unit_Raw
# #     mode        = var.mode_average
# # }
# # }

# # Memory : Resident is 
# resource "mongodbatlas_alert_configuration" "memory_resident" {
#   project_id = var.atlas_projectid
#   event_type = var.OUTSIDE_METRIC_THRESHOLD
#   enabled    = var.config_enabled

# # the targets for Atlas to send notifications when an alert condition is detected
#   notification {
#     type_name     = var.notif_user
#     interval_min  = var.host_CPU_interval_min
#     delay_min     = var.host_CPU_delay_min
#     sms_enabled   = var.SMS_Enabled
#     email_enabled = var.email_enabled
#     username      = var.username
#   }

#   metric_threshold_config {
#     metric_name = var.metric_name_memory_resident
#     operator    = var.operator_Greater
#     threshold   = var.threshold_disk_partition_data2
#     units       = var.unit_Bytes
#     mode        = var.mode_average
# }
# }
