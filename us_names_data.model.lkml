connection: "us_names"

# include all the views
include: "*.view"

datagroup: us_names_data_default_datagroup {
  sql_trigger: SELECT MAX(year) FROM names;;
  max_cache_age: "1 hour"
}

persist_with: us_names_data_default_datagroup

explore: names {
  join: names_by_year {
    sql_on: ${names.year} = ${names_by_year.year} ;;
    type: inner
    relationship: many_to_one
  }
  join: name_ranks {
    fields: [name_ranks.rank_by_gender_year]
    sql_on: ${names.year} = ${name_ranks.year}
    and ${names.gender} = ${name_ranks.gender}
    and ${names.name} = ${name_ranks.name};;
    type: inner
    relationship: many_to_one
  }
  join: name_encoding {
    fields: [name_encoding.name_encode]
    sql_on: ${names.name} = ${name_encoding.name}
    and ${names.gender} = ${name_encoding.gender};;
    type: inner
    relationship: many_to_one
  }
}
