connection: "looker-private-demo"

include: "/views/**/*.view"


explore: stdout {
  label: "Product Orders"
  always_filter: {
    filters: [stdout.timestamp_time: "last 1 days"]
    filters: [stdout__resource.type: "k8s_container"]
    filters: [stdout__resource__labels.namespace_name: "default"]
    filters: [stdout__resource__labels.container_name: "server"]
  }
  join: stdout__resource {
    view_label: "Stdout: Resource"
    sql: LEFT JOIN UNNEST([${stdout.resource}]) as stdout__resource ;;
    relationship: one_to_one
  }

  join: stdout__resource__labels {
    view_label: "Stdout: Resource Labels"
    sql: LEFT JOIN UNNEST([${stdout__resource.labels}]) as stdout__resource__labels ;;
    relationship: one_to_one
  }

  join: stdout__labels {
    view_label: "Stdout: Labels"
    sql: LEFT JOIN UNNEST([${stdout.labels}]) as stdout__labels ;;
    relationship: one_to_one
  }

  join: stdout__json_payload {
    view_label: "Stdout: Jsonpayload"
    sql: LEFT JOIN UNNEST([${stdout.json_payload}]) as stdout__json_payload ;;
    relationship: one_to_one
  }

  join: stdout__http_request {
    view_label: "Stdout: Httprequest"
    sql: LEFT JOIN UNNEST([${stdout.http_request}]) as stdout__http_request ;;
    relationship: one_to_one
  }

  join: stdout__source_location {
    view_label: "Stdout: Sourcelocation"
    sql: LEFT JOIN UNNEST([${stdout.source_location}]) as stdout__source_location ;;
    relationship: one_to_one
  }

  join: stdout__operation {
    view_label: "Stdout: Operation"
    sql: LEFT JOIN UNNEST([${stdout.operation}]) as stdout__operation ;;
    relationship: one_to_one
  }
}



########
# EH Note: reason for 2 models: I couldn't get the extension of stdout working in the first model
# wanted to extend it with different always_filters geared towards orders and products
# but extension didn't work
