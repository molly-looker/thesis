view: platformz {
  derived_table: {
    sql:
    SELECT
  PK,
  platform
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(TRIM(Which_of_the_following_do_you_currently_use_,', '))) as  platform
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: platform {
    type:  string
    sql:  TRIM(${TABLE}.platform) ;;
    drill_fields: [PK]
  }
}
