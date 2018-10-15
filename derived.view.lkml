
view: derived {

  derived_table: {
  sql: select * from SpinnerDemo.spin ;;
  sql_trigger_value: SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP()) ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }


  dimension: PK {
    primary_key: yes
    type: number
    sql: ${TABLE}.PK ;;
  }
}


explore: derived {}
