view: props {
  derived_table: {
    sql:
    SELECT
  PK,
  prop_name
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(LOWER(TRIM(which_props_do_you_use_,', ')))) as prop_name
WHERE {% condition prop %} prop_name {% endcondition %}
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
    sql:  ${TABLE}.prop_name;;
    drill_fields: [PK]
  }


  measure: count {
    type: count
  }
}
