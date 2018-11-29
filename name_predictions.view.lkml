view: name_predictions {
  sql_table_name: public.name_predictions ;;

  dimension: data_science_fields_gender_encode {
    type: number
    sql: ${TABLE}."Data Science Fields Gender Encode" ;;
  }

  dimension: data_science_fields_name_encode {
    type: number
    sql: ${TABLE}."Data Science Fields Name Encode" ;;
  }

  dimension: linear_reg_prediction {
    type: number
    sql: ${TABLE}.linear_reg_prediction ;;
  }

  dimension: names_name_count {
    type: number
    sql: ${TABLE}."Names Name Count" ;;
  }

  dimension: names_year {
    type: number
    sql: ${TABLE}."Names Year" ;;
  }

  dimension: predictions_2 {
    type: number
    sql: ${TABLE}.predictions_2 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
