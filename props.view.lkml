view: props {
  derived_table: {
    sql:
    SELECT
  PK,
  prop_name
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(LOWER(TRIM(which_props_do_you_use_,', ')))) as prop_name
WHERE {% condition prop_contains %} prop_name {% endcondition %} and prop_name is not null
--WHERE prop_name like {% parameter prop_contains %} and prop_name is not null
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: prop {
    type:  string
    sql:  ${TABLE}.prop_name;;
    drill_fields: [PK]
  }

  dimension: prop_image {
    sql: ${TABLE}.prop_name ;;
    html: <img src="http://aqueous-refuge-78065.herokuapp.com/api.php?q=object%25manipulation%25{{value | url_param_escape }}"  />
      ;; }


filter: prop_contains {
  type: string
  default_value: "%hoop%"
  sql: {% condition %} ${prop} {% endcondition %} ;;
}


}
