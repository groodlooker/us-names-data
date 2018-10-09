connection: "us_names"

# include all the views
include: "*.view"

datagroup: us_names_data_default_datagroup {
  sql_trigger: SELECT MAX(year) FROM names;;
  max_cache_age: "1 hour"
}

persist_with: us_names_data_default_datagroup

explore: names {}
