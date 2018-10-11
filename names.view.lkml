view: names {
  sql_table_name: public.names ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: fake {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fake_date ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: gender_encode {
    type: number
    view_label: "Data Science Fields"
    sql: case ${gender}
          when 'M' then 1 else 0 end;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  measure: name_count_male {
    type: sum
    sql: ${number} ;;
    filters: {
      field: gender
      value: "M"
    }
    hidden: yes
  }

  measure: percentage_of_male {
    type: number
    sql: (1.0 * ${name_count}) / ${names_by_year.total_count_male} ;;
    value_format_name: percent_1
    hidden: no
  }

  measure: name_count_female {
    type: sum
    sql: ${number} ;;
    filters: {
      field: gender
      value: "F"
    }
    hidden: yes
  }

  measure: percentage_of_female {
    type: number
    sql: (1.0* ${name_count}) / ${names_by_year.total_count_female} ;;
    value_format_name: percent_1
    hidden: no
  }

  measure: percentage {
    type: number
    value_format_name: percent_1
    sql: case max(${gender})
          when 'M' then ${percentage_of_male}
          when 'F' then ${percentage_of_female}
          end;;
    view_label: "Augmented Data"
  }

  measure: name_count {
    type: sum
    sql: ${number} ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
