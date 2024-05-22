variable "glue" {
  type = map(object({
    job-name = string
    description = string
    job-language = string
    job-version = string
    timeout = string
    max-retries = string
    bucket-name = string
    glue-arn = string 
    worker_type = string
    number_of_workers = number
    file-name         = string
    connection-url = string
    connection-name = string
    availability_zone = string
    subnet_id = string
    security_group_id = string
    job_bookmark_option = string
    max-concurrent-runs = number
    glue-version = number
    enable_spark_ui = bool
    enable_metrics = bool
    enable_continuous_cloudwatch_log = bool
    enable_glue_datacatalog = bool
    enable_observability_metrics = bool
    enable_job_insights = bool
    enable_auto_scaling = bool
    python_library = string
    jar_library = string
    job_parameters = map(string)
    tags = map(string)
  }))
  default = {
    glue = {
        aws-glue-poc = {
            job-name = "aws-glue-poc"
            description = "This is script to create large files from small files"
            job-language = "python"
            job-version = "3"
            timeout = "2880"
            max-retries = "1"
            bucket-name = "aws-glue-assets-366751107728-us-east-1"
            glue-arn = "arn:aws:iam::366751107728:role/CustomGlueServiceRoleWide"
            worker_type = "G.1X"
            number_of_workers = "2"
            file-name = "rawlayer_ingauge_HeavY_tables_jobs.py"
            connection-url = "jdbc:mysql://nonprod-hotel-rds-new-cluster.cluster-cvvwqxxa3xvq.us-west-2.rds.amazonaws.com:3306/in_gauge_2018"
            connection-name = "dp-nonprod-mysql-poc"
            availability_zone = "us-east-1a"
            subnet_id = "subnet-0e49589f96b86e78d"
            security_group_id = "sg-0d38219b92381b497"
            job_bookmark_option = "job-bookmark-disable"
            max-concurrent-runs = "2"
            glue-version = "4.0"
            enable_spark_ui = true
            enable_metrics = true
            enable_continuous_cloudwatch_log = true
            enable_glue_datacatalog = true
            enable_observability_metrics = false
            enable_job_insights = false
            enable_auto_scaling = false
            python_library = ""
            jar_library = ""
            referenced_library = ""
            job_parameters = {
                "bucket_name" = "uat-rawlayer-ingauge"
                "cc_email" = "[\"samane@frontlinepg.com\",\"ku@frontlinepg.com\",\"amane.shubham@accionlabs.com\"]"
                "config_file_name" = "hotel_uat"
                "database_name" = "rawlayer_ingauges"
                "email_host" = "smtp.office365.com"
                "email_password" = "djMBR*sEBF8F0P8l1D"
                "email_port" = "587"
                "email_recipient" = "[\"samane@frontlinepg.com\",\"ku@frontlinepg.com\"]"
                "email_sender" = "devsparkalerts@frontlinepg.com"
                "env" = "UAT"
                "region_name" = "us-east-1"
                "secret_name" = "non-prod/hotel-db"
                "sub_folder" = "dl_uat"
            }
            tags = {
                "bucket_name" = "uat-rawlayer-ingauge"
                "database_name" = "rawlayer_ingauge"
            }   
        }   
    }
  }
}
