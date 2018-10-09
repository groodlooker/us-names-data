view: names_by_year {
    derived_table: {
      explore_source: names {
        column: name_count {}
        column: year {}
        column: name_count_female {}
        column: name_count_male {}
      }
    }
    dimension: name_count {
      type: number
    }
    dimension: year {
      hidden: yes
      primary_key: yes
      type: number
    }
    dimension: name_count_female {
      type: number
      hidden: yes
    }
    measure: total_count_female {
      type: max
      label: "Count Female per Year"
      sql: ${name_count_female} ;;
      view_label: "Augmented Data"
    }
    dimension: name_count_male {
      type: number
      hidden: yes
    }
    measure: total_count_male {
      type: max
      label: "Count Male per Year"
      sql: ${name_count_male} ;;
      view_label: "Augmented Data"
    }
}
