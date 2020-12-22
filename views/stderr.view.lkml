view: stderr {
  sql_table_name: `onlineboutique_default_namespace.stderr`
    ;;

  dimension: http_request {
    hidden: yes
    sql: ${TABLE}.httpRequest ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: json_payload {
    hidden: yes
    sql: ${TABLE}.jsonPayload ;;
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: log_name {
    type: string
    sql: ${TABLE}.logName ;;
  }

  dimension: operation {
    hidden: yes
    sql: ${TABLE}.operation ;;
  }

  dimension_group: receive_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.receiveTimestamp ;;
  }

  dimension: resource {
    hidden: yes
    sql: ${TABLE}.resource ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension: source_location {
    hidden: yes
    sql: ${TABLE}.sourceLocation ;;
  }

  dimension: span_id {
    type: string
    sql: ${TABLE}.spanId ;;
  }

  dimension: text_payload {
    type: string
    sql: ${TABLE}.textPayload ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: trace {
    type: string
    sql: ${TABLE}.trace ;;
  }

  dimension: trace_sampled {
    type: yesno
    sql: ${TABLE}.traceSampled ;;
  }

  measure: count {
    type: count
    drill_fields: [log_name]
  }
}

view: stderr__resource {
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
}

view: stderr__resource__labels {
  dimension: cluster_name {
    type: string
    sql: ${TABLE}.cluster_name ;;
  }

  dimension: container_name {
    type: string
    sql: ${TABLE}.container_name ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: namespace_name {
    type: string
    sql: ${TABLE}.namespace_name ;;
  }

  dimension: pod_name {
    type: string
    sql: ${TABLE}.pod_name ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
}

view: stderr__labels {
  dimension: k8s_pod_app {
    type: string
    sql: ${TABLE}.k8s_pod_app ;;
  }

  dimension: k8s_pod_istio_io_rev {
    type: string
    sql: ${TABLE}.k8s_pod_istio_io_rev ;;
  }

  dimension: k8s_pod_pod_template_hash {
    type: string
    sql: ${TABLE}.k8s_pod_pod_template_hash ;;
  }

  dimension: k8s_pod_security_istio_io_tlsmode {
    type: string
    sql: ${TABLE}.k8s_pod_security_istio_io_tlsmode ;;
  }

  dimension: k8s_pod_service_istio_io_canonical_name {
    type: string
    sql: ${TABLE}.k8s_pod_service_istio_io_canonical_name ;;
  }

  dimension: k8s_pod_service_istio_io_canonical_revision {
    type: string
    sql: ${TABLE}.k8s_pod_service_istio_io_canonical_revision ;;
  }
}

view: stderr__json_payload {
  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: pid {
    type: string
    sql: ${TABLE}.pid ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
}

view: stderr__http_request {
  dimension: cache_fill_bytes {
    type: number
    sql: ${TABLE}.cacheFillBytes ;;
  }

  dimension: cache_hit {
    type: yesno
    sql: ${TABLE}.cacheHit ;;
  }

  dimension: cache_lookup {
    type: yesno
    sql: ${TABLE}.cacheLookup ;;
  }

  dimension: cache_validated_with_origin_server {
    type: yesno
    sql: ${TABLE}.cacheValidatedWithOriginServer ;;
  }

  dimension: protocol {
    type: string
    sql: ${TABLE}.protocol ;;
  }

  dimension: referer {
    type: string
    sql: ${TABLE}.referer ;;
  }

  dimension: remote_ip {
    type: string
    sql: ${TABLE}.remoteIp ;;
  }

  dimension: request_method {
    type: string
    sql: ${TABLE}.requestMethod ;;
  }

  dimension: request_size {
    type: number
    sql: ${TABLE}.requestSize ;;
  }

  dimension: request_url {
    type: string
    sql: ${TABLE}.requestUrl ;;
  }

  dimension: response_size {
    type: number
    sql: ${TABLE}.responseSize ;;
  }

  dimension: server_ip {
    type: string
    sql: ${TABLE}.serverIp ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.userAgent ;;
  }
}

view: stderr__source_location {
  dimension: file {
    type: string
    sql: ${TABLE}.file ;;
  }

  dimension: function {
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: line {
    type: number
    sql: ${TABLE}.line ;;
  }
}

view: stderr__operation {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: first {
    type: yesno
    sql: ${TABLE}.first ;;
  }

  dimension: last {
    type: yesno
    sql: ${TABLE}.last ;;
  }

  dimension: producer {
    type: string
    sql: ${TABLE}.producer ;;
  }
}
