view: props {
  derived_table: {
    sql:
    SELECT
  PK,
  prop_name
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(which_props_do_you_use_,',')) as prop_name

GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    primary_key: yes
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: prop {
    type:  string
    sql:  ${TABLE}.prop_name ;;
  }

  measure: count {
    type: count
    sql: ${TABLE}.prop_name ;;
  }
}
