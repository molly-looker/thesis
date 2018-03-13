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
  }

explore: props {
  label: "Props"
  join: flow {
    type: left_outer
    relationship: many_to_one
    sql_on:  ${flow.PK} = ${props.PK} ;;
  }
}
  explore: religion {
    label: "Spinner Religions"
    join: flow {
      type: left_outer
      relationship: many_to_one
      sql_on:  ${flow.PK} = ${religion.PK} ;;
    }
  }

explore: relationships {
  label: "Relationship Status"
  join: flow {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${flow.PK} = ${relationships.PK} ;;
  }
}
