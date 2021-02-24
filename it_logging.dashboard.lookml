- dashboard: it_logging__observability_overview
  title: IT Logging & Observability Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Latency by Method
    name: Latency by Method
    model: erolson_online_boutique
    explore: stdout
    type: looker_scatter
    fields: [stdout.timestamp_time, stdout__json_payload.http_req_method, stdout__json_payload.max_http_response_time]
    pivots: [stdout__json_payload.http_req_method]
    filters:
      stdout__labels.k8s_pod_app: frontend
      stdout__resource__labels.container_name: server
      stdout.timestamp_time: 1 days
      stdout__json_payload.message: request complete
    sorts: [stdout__json_payload.http_req_method, stdout.timestamp_time desc]
    limit: 5000
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${stdout__json_payload.http_resp_took_ms}\
          \ * 1", value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number, is_disabled: true}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    y_axes: [{label: '', orientation: left, series: [{axisId: stdout__json_payload.max_http_response_time,
            id: GET - stdout__json_payload.max_http_response_time, name: GET}, {axisId: stdout__json_payload.max_http_response_time,
            id: POST - stdout__json_payload.max_http_response_time, name: POST}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#000000",
        line_value: '1000', label: SLO}]
    hidden_fields: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Timestamp Date: stdout.timestamp_date
    row: 19
    col: 0
    width: 24
    height: 9
  - name: Latency
    type: text
    title_text: Latency
    subtitle_text: This chart highlights requests that exceeded our response time
      service line objective of 1000ms (1s)
    body_text: ''
    row: 17
    col: 0
    width: 24
    height: 2
  - title: Avg Latency (ms)
    name: Avg Latency (ms)
    model: erolson_online_boutique
    explore: stdout
    type: single_value
    fields: [stdout.timestamp_date, stdout__json_payload.avg_http_response_time]
    fill_fields: [stdout.timestamp_date]
    filters:
      stdout.timestamp_time: 2 days
    sorts: [stdout.timestamp_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_2, label: Calculation 2, expression: 'concat(round(${stdout__json_payload.avg_http_response_time},0),
          " (ms)")', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: string}, {table_calculation: from_yesterday, label: from yesterday,
        expression: "(${stdout__json_payload.avg_http_response_time} - offset(${stdout__json_payload.avg_http_response_time},\
          \ 1)) / offset(${stdout__json_payload.avg_http_response_time}, 1)", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [stdout__json_payload.avg_http_response_time]
    listen: {}
    row: 0
    col: 12
    width: 6
    height: 4
  - title: Errors
    name: Errors
    model: erolson_online_boutique
    explore: stdout
    type: single_value
    fields: [stdout.timestamp_date, stdout.error_count]
    fill_fields: [stdout.timestamp_date]
    filters:
      stdout.timestamp_time: 2 days
    sorts: [stdout.timestamp_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: from_yesterday, label: from yesterday, expression: "(${stdout.error_count}\
          \ - offset(${stdout.error_count}, 1)) / offset(${stdout.error_count}, 1)",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 0
    col: 6
    width: 6
    height: 4
  - title: Availability / Uptime
    name: Availability / Uptime
    model: erolson_online_boutique
    explore: stdout
    type: single_value
    fields: [stdout.timestamp_date, stdout.availability_percent]
    fill_fields: [stdout.timestamp_date]
    filters:
      stdout.timestamp_time: 2 days
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
    sorts: [stdout.timestamp_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_2, label: Calculation 2, expression: 'concat(round(${stdout__json_payload.avg_http_response_time},0),
          "(ms)")', value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: string}, {table_calculation: from_yesterday,
        label: from yesterday, expression: "(${stdout.availability_percent} - offset(${stdout.availability_percent},\
          \ 1)) / offset(${stdout.availability_percent}, 1)", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Availability / Uptime Trend
    name: Availability / Uptime Trend
    model: erolson_online_boutique
    explore: stdout
    type: looker_line
    fields: [stdout.timestamp_minute5, stdout.availability_percent]
    filters:
      stdout.timestamp_time: 3 hours
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
    sorts: [stdout.timestamp_minute5 desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_2, label: Calculation 2, expression: 'concat(round(${stdout__json_payload.avg_http_response_time},0),
          "(ms)")', value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: string}, {table_calculation: from_yesterday,
        label: from yesterday, expression: "(${stdout.requests_per_second} - offset(${stdout.requests_per_second},\
          \ 1)) / offset(${stdout.requests_per_second}, 1)", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: stdout.availability_percent,
            id: stdout.availability_percent, name: Availability Percent}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: log}]
    series_types: {}
    trend_lines: []
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    ordering: none
    show_null_labels: false
    title_hidden: true
    listen:
      Timestamp Date: stdout.timestamp_date
    row: 4
    col: 0
    width: 6
    height: 3
  - title: Latency Trend
    name: Latency Trend
    model: erolson_online_boutique
    explore: stdout
    type: looker_line
    fields: [stdout.timestamp_minute5, stdout__json_payload.max_http_response_time]
    filters:
      stdout.timestamp_time: 3 hours
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
    sorts: [stdout.timestamp_minute5 desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_2, label: Calculation 2, expression: 'concat(round(${stdout__json_payload.avg_http_response_time},0),
          "(ms)")', value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: string}, {table_calculation: from_yesterday,
        label: from yesterday, expression: "(${stdout.requests_per_second} - offset(${stdout.requests_per_second},\
          \ 1)) / offset(${stdout.requests_per_second}, 1)", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: stdout__json_payload.max_http_response_time,
            id: stdout__json_payload.max_http_response_time, name: HTTP Response (Max)}],
        showLabels: false, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: log}]
    series_types: {}
    trend_lines: []
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    ordering: none
    show_null_labels: false
    title_hidden: true
    listen:
      Timestamp Date: stdout.timestamp_date
    row: 4
    col: 12
    width: 6
    height: 3
  - title: Error Trend
    name: Error Trend
    model: erolson_online_boutique
    explore: stdout
    type: looker_line
    fields: [stdout.error_count, stdout.timestamp_minute5]
    fill_fields: [stdout.timestamp_minute5]
    filters:
      stdout.timestamp_time: 3 hours
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: stdout.error_count,
            id: stdout.error_count, name: Error Count}], showLabels: false, showValues: true,
        minValue: !!null '', unpinAxis: true, tickDensity: default, tickDensityCustom: 0,
        type: linear}]
    series_types: {}
    trend_lines: []
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    ordering: none
    show_null_labels: false
    title_hidden: true
    listen:
      Timestamp Date: stdout.timestamp_date
    row: 4
    col: 6
    width: 6
    height: 3
  - name: 'Availability '
    type: text
    title_text: 'Availability '
    subtitle_text: Availability and Errors are inversely correlated. An increase in
      errors may cause a decrease in availability
    body_text: ''
    row: 7
    col: 0
    width: 24
    height: 3
  - title: Availability last 7 days
    name: Availability last 7 days
    model: erolson_online_boutique
    explore: stdout
    type: looker_column
    fields: [stdout.availability_percent, stdout.timestamp_date]
    fill_fields: [stdout.timestamp_date]
    filters:
      stdout.timestamp_time: 7 days
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
    sorts: [stdout.timestamp_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: stdout.availability_percent,
            id: stdout.availability_percent, name: Availability Percent}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: log}]
    series_types: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0.995', value_format: "#.00%"}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 10
    col: 0
    width: 12
    height: 7
  - title: Errors by Status last 7 days
    name: Errors by Status last 7 days
    model: erolson_online_boutique
    explore: stdout
    type: looker_column
    fields: [stdout.timestamp_date, stdout.error_count, stdout__json_payload.http_resp_status]
    pivots: [stdout__json_payload.http_resp_status]
    fill_fields: [stdout.timestamp_date]
    filters:
      stdout.timestamp_time: 7 days
      stdout__labels.k8s_pod_app: frontend
      stdout__json_payload.message: request complete
      stdout__json_payload.is_error: 'Yes'
    sorts: [stdout.timestamp_date desc, stdout__json_payload.http_resp_status]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: stdout.availability_percent,
            id: stdout.availability_percent, name: Availability Percent}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: log}, {label: !!null '', orientation: right, series: [{axisId: stdout.error_count,
            id: stdout.error_count, name: Error Count}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      404.0 - stdout.error_count: "#EA4335"
      405.0 - stdout.error_count: "#FBBC04"
      500.0 - stdout.error_count: "#EA8600"
    label_color: ["#"]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 7
  - title: Orders
    name: Orders
    model: product_orders
    explore: stdout
    type: single_value
    fields: [stdout.timestamp_date, stdout.order_count]
    fill_fields: [stdout.timestamp_date]
    filters:
      stdout.timestamp_time: 2 days
      stdout__resource.type: k8s_container
      stdout__resource__labels.namespace_name: default
      stdout__resource__labels.container_name: server
    sorts: [stdout.timestamp_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_2, label: Calculation 2, expression: 'concat(round(${stdout__json_payload.avg_http_response_time},0),
          "(ms)")', value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: string}, {table_calculation: from_yesterday,
        label: from yesterday, expression: "(${stdout.order_count} - offset(${stdout.order_count},\
          \ 1)) / offset(${stdout.order_count}, 1)", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 4
  - title: Order Trend
    name: Order Trend
    model: product_orders
    explore: stdout
    type: looker_line
    fields: [stdout.timestamp_minute5, stdout.order_count]
    filters:
      stdout.timestamp_time: 3 hours
      stdout.timestamp_date: 3 hours
      stdout__resource.type: k8s_container
      stdout__resource__labels.namespace_name: default
      stdout__resource__labels.container_name: server
    sorts: [stdout.timestamp_minute5 desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_2, label: Calculation 2, expression: 'concat(round(${stdout__json_payload.avg_http_response_time},0),
          "(ms)")', value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: string}, {table_calculation: from_yesterday,
        label: from yesterday, expression: "(${stdout.requests_per_second} - offset(${stdout.requests_per_second},\
          \ 1)) / offset(${stdout.requests_per_second}, 1)", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: stdout.requests_per_second,
            id: stdout.requests_per_second, name: RPS (Requests per second)}], showLabels: false,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    trend_lines: []
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    ordering: none
    show_null_labels: false
    title_hidden: true
    listen: {}
    row: 4
    col: 18
    width: 6
    height: 3
  filters:
  - name: Timestamp Date
    title: Timestamp Date
    type: field_filter
    default_value: 3 hour
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: erolson_online_boutique
    explore: stdout
    listens_to_filters: []
    field: stdout.timestamp_date
