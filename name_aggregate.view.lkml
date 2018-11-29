view: name_aggregate {
    derived_table: {
      datagroup_trigger: us_names_data_default_datagroup
      indexes: ["name","gender","year"]
      explore_source: names {
        column: name_count {}
        column: year {}
        column: name {}
        column: gender {}
      }
    }
    dimension: name_count {
      type: number
    }
    measure: total_count {
      type: max
      sql: ${name_count} ;;
    }
    dimension: year {
      hidden: yes
      type: number
    }
    dimension: name {}
    dimension: gender {}
  }
