view: name_ranks {
    derived_table: {
      datagroup_trigger: us_names_data_default_datagroup
      indexes: ["name","gender","year"]
      explore_source: names {
        column: name {}
        column: gender {}
        column: year {}
        column: name_count {}
        derived_column: rank_by_gender_year {
          sql: RANK() OVER(PARTITION BY year, gender ORDER BY name_count DESC) ;;
        }
      }
    }
    dimension: pk {
      primary_key: yes
      sql: ${name} || ${gender} || cast(${year} as varchar) ;;
    }
    dimension: name {}
    dimension: gender {}
    dimension: year {
      type: number
    }
    dimension: name_count {
      type: number
    }
    dimension: rank_by_gender_year {
      view_label: "Augmented Data"
      type: number
    }
}
