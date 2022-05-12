connection: "looker-private-demo"

# include all the views
include: "/views/**/*.view"

datagroup: erolson_online_boutique_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: erolson_online_boutique_default_datagroup



explore: stdout {
  label: "Frontend Service Monitoring"
  always_filter: {
    filters: [stdout.timestamp_time: "last 1 days"]
    filters: [stdout__labels.k8s_pod_app: "frontend"]
    filters: [stdout__json_payload.message: "request complete"]
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


  query: last_30_minutes {
          dimensions: [
            stdout__json_payload.api,
            stdout__json_payload.http_req_id,
            stdout__json_payload.http_req_method,
            stdout__json_payload.http_resp_bytes,
            stdout__json_payload.http_resp_status,
            stdout__json_payload.http_resp_took_ms,
            stdout__json_payload.message,
            timestamp_second
          ]
          filters: [
            stdout.timestamp_time: "30 minutes",
            stdout__json_payload.message: "-NULL",
            stdout__labels.k8s_pod_app: "frontend"
          ]
          limit: 500
        }
}

explore: dynamic_timeframes {
  from: stdout
  sql_always_where: {% condition dynamic_timeframes.date_filter %} dynamic_timeframes.timestamp  {% endcondition %} ;;
  always_filter: {
    filters: [dynamic_timeframes.date_filter: "last 1 days"]
    filters: [stdout__labels.k8s_pod_app: "frontend"]
    filters: [stdout__json_payload.message: "request complete"]
  }
  join: stdout__resource {
    view_label: "Stdout: Resource"
    sql: LEFT JOIN UNNEST([${dynamic_timeframes.resource}]) as stdout__resource ;;
    relationship: one_to_one
  }

  join: stdout__resource__labels {
    view_label: "Stdout: Resource Labels"
    sql: LEFT JOIN UNNEST([${stdout__resource.labels}]) as stdout__resource__labels ;;
    relationship: one_to_one
  }

  join: stdout__labels {
    view_label: "Stdout: Labels"
    sql: LEFT JOIN UNNEST([${dynamic_timeframes.labels}]) as stdout__labels ;;
    relationship: one_to_one
  }

  join: stdout__json_payload {
    view_label: "Stdout: Jsonpayload"
    sql: LEFT JOIN UNNEST([${dynamic_timeframes.json_payload}]) as stdout__json_payload ;;
    relationship: one_to_one
  }

  join: stdout__http_request {
    view_label: "Stdout: Httprequest"
    sql: LEFT JOIN UNNEST([${dynamic_timeframes.http_request}]) as stdout__http_request ;;
    relationship: one_to_one
  }

  join: stdout__source_location {
    view_label: "Stdout: Sourcelocation"
    sql: LEFT JOIN UNNEST([${dynamic_timeframes.source_location}]) as stdout__source_location ;;
    relationship: one_to_one
  }

  join: stdout__operation {
    view_label: "Stdout: Operation"
    sql: LEFT JOIN UNNEST([${dynamic_timeframes.operation}]) as stdout__operation ;;
    relationship: one_to_one
  }
}


explore: clouderrorreporting_googleapis_com_insights {
  join: clouderrorreporting_googleapis_com_insights__resource {
    view_label: "Clouderrorreporting Googleapis Com Insights: Resource"
    sql: LEFT JOIN UNNEST([${clouderrorreporting_googleapis_com_insights.resource}]) as clouderrorreporting_googleapis_com_insights__resource ;;
    relationship: one_to_one
  }

  join: clouderrorreporting_googleapis_com_insights__resource__labels {
    view_label: "Clouderrorreporting Googleapis Com Insights: Resource Labels"
    sql: LEFT JOIN UNNEST([${clouderrorreporting_googleapis_com_insights__resource.labels}]) as clouderrorreporting_googleapis_com_insights__resource__labels ;;
    relationship: one_to_one
  }

  join: clouderrorreporting_googleapis_com_insights__jsonpayload_v1beta1_insight {
    view_label: "Clouderrorreporting Googleapis Com Insights: Jsonpayload V1beta1 Insight"
    sql: LEFT JOIN UNNEST([${clouderrorreporting_googleapis_com_insights.jsonpayload_v1beta1_insight}]) as clouderrorreporting_googleapis_com_insights__jsonpayload_v1beta1_insight ;;
    relationship: one_to_one
  }

  join: clouderrorreporting_googleapis_com_insights__jsonpayload_v1beta1_insight__errorevent__servicecontext {
    view_label: "Clouderrorreporting Googleapis Com Insights: Jsonpayload V1beta1 Insight Errorevent Servicecontext"
    sql: LEFT JOIN UNNEST([${clouderrorreporting_googleapis_com_insights__jsonpayload_v1beta1_insight__errorevent.servicecontext}]) as clouderrorreporting_googleapis_com_insights__jsonpayload_v1beta1_insight__errorevent__servicecontext ;;
    relationship: one_to_one
  }

  join: clouderrorreporting_googleapis_com_insights__jsonpayload_v1beta1_insight__errorevent {
    view_label: "Clouderrorreporting Googleapis Com Insights: Jsonpayload V1beta1 Insight Errorevent"
    sql: LEFT JOIN UNNEST([${clouderrorreporting_googleapis_com_insights__jsonpayload_v1beta1_insight.errorevent}]) as clouderrorreporting_googleapis_com_insights__jsonpayload_v1beta1_insight__errorevent ;;
    relationship: one_to_one
  }

  join: clouderrorreporting_googleapis_com_insights__http_request {
    view_label: "Clouderrorreporting Googleapis Com Insights: Httprequest"
    sql: LEFT JOIN UNNEST([${clouderrorreporting_googleapis_com_insights.http_request}]) as clouderrorreporting_googleapis_com_insights__http_request ;;
    relationship: one_to_one
  }

  join: clouderrorreporting_googleapis_com_insights__source_location {
    view_label: "Clouderrorreporting Googleapis Com Insights: Sourcelocation"
    sql: LEFT JOIN UNNEST([${clouderrorreporting_googleapis_com_insights.source_location}]) as clouderrorreporting_googleapis_com_insights__source_location ;;
    relationship: one_to_one
  }

  join: clouderrorreporting_googleapis_com_insights__operation {
    view_label: "Clouderrorreporting Googleapis Com Insights: Operation"
    sql: LEFT JOIN UNNEST([${clouderrorreporting_googleapis_com_insights.operation}]) as clouderrorreporting_googleapis_com_insights__operation ;;
    relationship: one_to_one
  }
}

explore: stderr {
  join: stderr__resource {
    view_label: "Stderr: Resource"
    sql: LEFT JOIN UNNEST([${stderr.resource}]) as stderr__resource ;;
    relationship: one_to_one
  }

  join: stderr__resource__labels {
    view_label: "Stderr: Resource Labels"
    sql: LEFT JOIN UNNEST([${stderr__resource.labels}]) as stderr__resource__labels ;;
    relationship: one_to_one
  }

  join: stderr__labels {
    view_label: "Stderr: Labels"
    sql: LEFT JOIN UNNEST([${stderr.labels}]) as stderr__labels ;;
    relationship: one_to_one
  }

  join: stderr__json_payload {
    view_label: "Stderr: Jsonpayload"
    sql: LEFT JOIN UNNEST([${stderr.json_payload}]) as stderr__json_payload ;;
    relationship: one_to_one
  }

  join: stderr__http_request {
    view_label: "Stderr: Httprequest"
    sql: LEFT JOIN UNNEST([${stderr.http_request}]) as stderr__http_request ;;
    relationship: one_to_one
  }

  join: stderr__source_location {
    view_label: "Stderr: Sourcelocation"
    sql: LEFT JOIN UNNEST([${stderr.source_location}]) as stderr__source_location ;;
    relationship: one_to_one
  }

  join: stderr__operation {
    view_label: "Stderr: Operation"
    sql: LEFT JOIN UNNEST([${stderr.operation}]) as stderr__operation ;;
    relationship: one_to_one
  }
}
