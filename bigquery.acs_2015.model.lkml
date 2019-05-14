connection: "lookerdata_publicdata"

# include all the BQ view files
include: "*.explore"


# include all the views
include: "*.view"

# include all the dashboards
#include: "*.dashboard"

datagroup: molly_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: molly_thesis_default_datagroup



explore: bq_block_group_facts {
  label: "Demographic Facts"
  }
