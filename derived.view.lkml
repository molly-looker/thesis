
view: derived {

  derived_table: {
  sql: select * from SpinnerDemo.spin ;;
  persist_for: "8 minutes"
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
