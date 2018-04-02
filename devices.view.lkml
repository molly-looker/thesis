view: devices {
  derived_table: {
    sql:
    SELECT
  PK,
  device
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(TRIM(Which_of_the_following_do_you_own_,', '))) as  device
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: device {
    type:  string
    sql:  TRIM(${TABLE}.device) ;;
    drill_fields: [PK]
  }

}
