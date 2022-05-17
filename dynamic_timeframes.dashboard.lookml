- dashboard: dynamic_timeframes_and_crossfiltering
  title: Dynamic Timeframes and Cross-filtering
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: OkTldG6JTRCE9jed5Qauqq
  elements:
  - title: Summary
    name: Summary
    model: erolson_online_boutique
    explore: dynamic_timeframes
    type: looker_line
    fields: [dynamic_timeframes.dynamic_timeframe_summary_time, dynamic_timeframes.count]
    filters:
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
    sorts: [dynamic_timeframes.dynamic_timeframe_summary_time desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: dynamic_timeframes.count,
            id: dynamic_timeframes.count, name: Count (Frontend Requests)}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Summarizes events based on timeframe the user filters on
    listen:
      Date Filter: dynamic_timeframes.date_filter
    row: 3
    col: 0
    width: 12
    height: 7
  - title: Detail
    name: Detail
    model: erolson_online_boutique
    explore: dynamic_timeframes
    type: looker_line
    fields: [dynamic_timeframes.dynamic_timeframe_detail_time, dynamic_timeframes.count]
    filters:
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
    sorts: [dynamic_timeframes.dynamic_timeframe_detail_time desc]
    limit: 1500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: dynamic_timeframes.count,
            id: dynamic_timeframes.count, name: Count (Frontend Requests)}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Same data as "Summary" tile but in a finer time granularity
    listen:
      Date Filter: dynamic_timeframes.date_filter
    row: 3
    col: 12
    width: 12
    height: 7
  - name: All Frontend Requests
    type: text
    title_text: All Frontend Requests
    subtitle_text: ''
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 1
  - title: Latency
    name: Latency
    model: erolson_online_boutique
    explore: dynamic_timeframes
    type: looker_scatter
    fields: [stdout__json_payload.max_http_response_time, stdout__json_payload.http_resp_exceeds_slo_target,
      stdout__json_payload.slo, dynamic_timeframes.dynamic_timeframe_detail_time]
    pivots: [stdout__json_payload.http_resp_exceeds_slo_target]
    fill_fields: [stdout__json_payload.http_resp_exceeds_slo_target]
    filters:
      stdout__labels.k8s_pod_app: frontend
      stdout__resource__labels.container_name: server
      stdout__json_payload.message: request complete
    sorts: [stdout__json_payload.http_resp_exceeds_slo_target, dynamic_timeframes.dynamic_timeframe_detail_time
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${stdout__json_payload.http_resp_took_ms}\
          \ * 1", value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    y_axes: [{label: '', orientation: left, series: [{axisId: stdout__json_payload.max_http_response_time,
            id: No - stdout__json_payload.max_http_response_time, name: Low Latency},
          {axisId: stdout__json_payload.slo, id: No - stdout__json_payload.slo, name: 'No
              - Stdout: Jsonpayload Slo'}, {axisId: stdout__json_payload.max_http_response_time,
            id: Yes - stdout__json_payload.max_http_response_time, name: SLO Exceeded},
          {axisId: stdout__json_payload.slo, id: Yes - stdout__json_payload.slo, name: 'Yes
              - Stdout: Jsonpayload Slo'}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: log}]
    hidden_series: []
    series_types:
      No - stdout__json_payload.slo: area
      Yes - stdout__json_payload.slo: area
    series_colors:
      No - stdout__json_payload.max_http_response_time: "#E8EAED"
      No - stdout__json_payload.slo: "#4285F4"
      Yes - stdout__json_payload.slo: "#4285F4"
      Yes - stdout__json_payload.max_http_response_time: "#B31412"
    series_labels:
      No - stdout__json_payload.max_http_response_time: Low Latency
      Yes - stdout__json_payload.max_http_response_time: SLO Exceeded
    reference_lines: []
    trend_lines: []
    hidden_fields: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: All requests that fall above the user-input SLO are shown in red
    listen:
      Date Filter: dynamic_timeframes.date_filter
      HTTP Resp Latency SLO: stdout__json_payload.http_resp_latency_slo
    row: 20
    col: 0
    width: 24
    height: 10
  - title: Requests by Error Code/Status
    name: Requests by Error Code/Status
    model: erolson_online_boutique
    explore: dynamic_timeframes
    type: looker_column
    fields: [dynamic_timeframes.count, stdout__json_payload.http_resp_status, dynamic_timeframes.dynamic_timeframe_summary_time]
    pivots: [stdout__json_payload.http_resp_status]
    filters:
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
    sorts: [stdout__json_payload.http_resp_status, dynamic_timeframes.dynamic_timeframe_summary_time
        desc]
    limit: 1500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      200.0 - dynamic_timeframes.count: "#4af29d"
      301.0 - dynamic_timeframes.count: "#51c7aa"
      302.0 - dynamic_timeframes.count: "#559961"
      404.0 - dynamic_timeframes.count: "#c4313a"
      405.0 - dynamic_timeframes.count: "#e34b3b"
      500.0 - dynamic_timeframes.count: "#ffa29f"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date Filter: dynamic_timeframes.date_filter
    row: 10
    col: 0
    width: 24
    height: 10
  - title: Request Details
    name: Request Details
    model: erolson_online_boutique
    explore: dynamic_timeframes
    type: looker_grid
    fields: [stdout__json_payload.api, stdout__json_payload.http_req_id, stdout__json_payload.http_req_method,
      stdout__json_payload.http_resp_bytes, stdout__json_payload.http_resp_status,
      stdout__json_payload.http_resp_took_ms, stdout__json_payload.message, dynamic_timeframes.timestamp_second]
    filters:
      stdout__json_payload.message: "-NULL"
      stdout__labels.k8s_pod_app: frontend
    sorts: [dynamic_timeframes.timestamp_second desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Filter: dynamic_timeframes.date_filter
    row: 30
    col: 0
    width: 24
    height: 11
  - name: Dynamic Timeframes
    type: text
    title_text: Dynamic Timeframes
    subtitle_text: ''
    body_text: This dashboard leverages dynamic timeframes that automatically size
      to fit what the user filters on. There is a Summary timeframe and Detail timeframe.
      This feature is common in other logging tools, such as Kibana.
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Date Filter
    title: Date Filter
    type: field_filter
    default_value: 3 hour
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: erolson_online_boutique
    explore: dynamic_timeframes
    listens_to_filters: []
    field: dynamic_timeframes.date_filter
  - name: HTTP Resp Latency SLO
    title: HTTP Resp Latency SLO
    type: field_filter
    default_value: '250'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: erolson_online_boutique
    explore: dynamic_timeframes
    listens_to_filters: []
    field: stdout__json_payload.http_resp_latency_slo
