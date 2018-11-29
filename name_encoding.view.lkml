view: name_encoding {
    derived_table: {
      datagroup_trigger: us_names_data_default_datagroup
      indexes: ["name"]
      explore_source: names {
        column: name {}
        column: gender {}
        derived_column: name_encode {
          sql: ROW_NUMBER() OVER(ORDER BY name asc, gender asc) ;;
        }
      }
    }
    dimension: name {
    }
    dimension: gender {
    }
    dimension: name_encode {
      type: number
      view_label: "Data Science Fields"
    }
  }
