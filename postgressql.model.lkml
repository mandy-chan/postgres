connection: "postgressql_testing"

# include all the views
include: "*.view"

datagroup: postgressql_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: postgressql_default_datagroup

explore: newyorkairbnb {

  join: derived_table_subquery {
    relationship: one_to_one
    type: left_outer
    sql_on: ${newyorkairbnb.host_id} = ${derived_table_subquery.host_id} ;;
  }
}

explore: derived_table_subquery {}

explore: derived_table_previous_week {}
