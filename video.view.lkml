view: video {
  derived_table: {
    sql:
    SELECT
  PK,
  video_criteria
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(TRIM(What_elements_are_most_important_for_you_in_whether_you_watch_a_video_or_not_,', '))) as  video_criteria
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: video_criteria {
    type:  string
    sql:  TRIM(${TABLE}.video_criteria) ;;
    drill_fields: [PK]
  }

}
