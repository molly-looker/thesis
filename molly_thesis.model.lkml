connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: molly_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: molly_thesis_default_datagroup



explore: flow {
  label: "Spinner Demographics"


  join: props {
    view_label: "Props"
    sql_on:  ${flow.PK} = ${props.PK} ;;
    type: left_outer
    relationship: many_to_one

}

  join: relationships {
    view_label: "Relationship Status"
    type:  left_outer
    relationship: many_to_one
    sql_on: ${flow.PK} = ${relationships.PK} ;;
}

  join: religion {
    view_label: "Spinner Religions"
    type: left_outer
    relationship: many_to_one
    sql_on:  ${flow.PK} = ${religion.PK} ;;
  }

  join: ethnicities {
  view_label: "Spinner Ethnicity"
    type:  left_outer
    relationship: many_to_one
    sql_on: ${flow.PK} = ${ethnicities.PK} ;;
  }
}
