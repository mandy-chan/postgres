include: "newyorkairbnb.view"

view: derived_table_previous_week {
  derived_table: {
#     sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from NOW()) / (12*60*60)) ;;
    sql:
;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    primary_key: yes
  }


}
