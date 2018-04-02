view: ethnicities {
  derived_table: {
    sql:
    SELECT
  PK,
  ethnicityy
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(LOWER(TRIM(ethnicity, ', ')))) as ethnicityy
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: ethnicity {
    type:  string
    sql:  TRIM(${TABLE}.ethnicityy) ;;
    drill_fields: [PK]
  }

  dimension: ethnicitybucket {
    type:  string
    sql:  case when ${TABLE}.ethnicityy like "%native american/first nations%" then "American Indian or Native Alaskan"
        when ${TABLE}.ethnicityy like "% asian%" or ${TABLE}.ethnicityy like "asian%"or ${TABLE}.ethnicityy like "%japanese" or ${TABLE}.ethnicityy="chinese"then "Asian"
        when ${TABLE}.ethnicityy like "%black/african american%" then "Black/African American"
        when ${TABLE}.ethnicityy like "%hispanic%" or ${TABLE}.ethnicityy like "%(latina)%" then "Hispanic or Latino"
        when ${TABLE}.ethnicityy is null or ${TABLE}.ethnicityy = "german" or ${TABLE}.ethnicityy like "%jewish%" or ${TABLE}.ethnicityy like "norwegian%" or ${TABLE}.ethnicityy = "sapmien" or ${TABLE}.ethnicityy like " serbian%" or ${TABLE}.ethnicityy = "white/caucasian" then "White"
        else "Mix" end;;
    drill_fields: [PK, ethnicity]
  }


 dimension: staticgeodata {
    type: string
    sql: case when ${ethnicitybucket}="American Indian or Native Alaskan" then "0.00%"
    when ${ethnicitybucket}="Asian" then "5.99%"
    when ${ethnicitybucket}="Black/African American" then "13.81%"
    when ${ethnicitybucket}="Hispanic or Latino" then "18.05%"
    when ${ethnicitybucket}="White" then "76.16%"
    else "0.00%" end;;

  }


  measure: pct_spinners {
    label: "% of Spinners"
    type: number
    value_format_name: percent_2
    sql: ${flow.count}/999;;
    }
#     measure: pct_hispanic_spinners {
#       label: "% of Hispanic Spinners"
#       type: number
#       value_format_name: percent_2
#       sql: ${flow.count}/999;;
#
#       }
#       measure: pct_black_spinners {
#         label: "% of Black/African American Spinners"
#         type: number
#         value_format_name: percent_2
#         sql: ${flow.count}/999;;
#
#         }
#         measure: pct_asian_spinners {
#           label: "% of Asian Spinners"
#           type: number
#           value_format_name: percent_2
#           sql: ${flow.count}/999;;
#
#           }
#           measure: pct_native_spinners {
#             label: "% of American Indian or Native Alaskan Spinners"
#             type: number
#             value_format_name: percent_2
#             sql: ${flow.count}/999;;
#
#             }
#             measure: pct_mix_spinners {
#               label: "% of Mixed Race Spinners"
#               type: number
#               value_format_name: percent_2
#               sql: ${flow.count}/999;;
#
#  }
#
}
