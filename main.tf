resource "aws_glue_job" "glue-job" {
  name = "${var.job-name}"
  description = "${var.description}"
  role_arn = "${var.glue-arn}"
  max_retries = "${var.max-retries}"
  timeout = "${var.timeout}"
  worker_type = "${var.worker_type}"
  number_of_workers = "${var.number_of_workers}"
  tags = var.tags

  command {
    script_location = "s3://${var.bucket-name}/scripts/${var.file-name}"
    python_version = "${var.job-version}"
  }

  default_arguments = merge({
    "--job-bookmark-option" = "${var.job_bookmark_option}"
    "--enable-spark-ui" = "${var.enable_spark_ui}"
    "--enable-metrics"  = "${var.enable_metrics}"
    "--spark-event-logs-path" = "s3://${var.bucket-name}/spark-logs/"
    "--enable-continuous-cloudwatch-log" = "${var.enable_continuous_cloudwatch_log}"
    "--TempDir" = "s3://${var.bucket-name}/temporary/"
    "--enable-glue-datacatalog" = "${var.enable_glue_datacatalog}"
    "--enable-observability-metrics" = "${var.enable_observability_metrics}"
    "--enable-job-insights" = "${var.enable_job_insights}"
    "--enable-auto-scaling" = "${var.enable_auto_scaling}"
    "--extra-py-files" = "${var.python_library}" # Specify your Python library path
    "--extra-jars" = "${var.jar_library}"     # Dependent JARs path
    "--extra-files" = "${var.referenced_library}"   # Referenced files path
  }, {for k, v in var.job_parameters: "--${k}" => v})


  notification_property {
    notify_delay_after = 30 # Delay notification threshold in minutes
  }

  execution_property {
    max_concurrent_runs = "${var.max-concurrent-runs}"
  }

  glue_version = "${var.glue-version}"
  connections = [
    aws_glue_connection.connection.name
  ]
}

resource "aws_glue_connection" "connection" {
  connection_properties = {
    JDBC_CONNECTION_URL = "${var.connection-url}"
    PASSWORD            = "password"
    USERNAME            = "root"
  }

  name = "${var.connection-name}"

  physical_connection_requirements {
    availability_zone      = "${var.availability_zone}"
    security_group_id_list = [var.security_group_id]
    subnet_id              = "${var.subnet_id}"
  }
}
