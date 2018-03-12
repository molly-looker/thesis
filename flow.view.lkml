view: flow {
  sql_table_name: SpinnerDemo.spin ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: PK {
    primary_key: yes
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: are_you_more_likely_to {
    type: string
    sql: ${TABLE}.Are_you_more_likely_to ;;
  }

  dimension: average_income__yearly_ {
    type: string
    sql: ${TABLE}.Average_Income__yearly_ ;;
  }

  dimension: birth_order {
    type: string
    sql: ${TABLE}.Birth_Order ;;
  }

  dimension: diet {
    type: string
    sql: ${TABLE}.Diet ;;
  }

  dimension: do_you_prefer_i_os_or_android_ {
    type: string
    sql: ${TABLE}.Do_you_prefer_iOS_or_Android_ ;;
  }

  dimension: do_you_work_in_the_flow_arts_professionally_ {
    type: yesno
    sql: ${TABLE}.Do_you_work_in_the_flow_arts_professionally_ ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.Ethnicity ;;
  }

  dimension: for_your_primary_prop__what_skill_level_would_you_classify_yourself_as_ {
    type: number
    sql: ${TABLE}.For_your_primary_prop__what_skill_level_would_you_classify_yourself_as_ ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: have_you_downloaded_a_mobile_app_in_the_past_year_ {
    type: yesno
    sql: ${TABLE}.Have_you_downloaded_a_mobile_app_in_the_past_year_ ;;
  }

  dimension: have_you_in_the_past_year_ {
    type: string
    sql: ${TABLE}.Have_you_in_the_past_year_ ;;
  }

  dimension: highest_level_of_education_attained {
    type: string
    sql: ${TABLE}.Highest_level_of_education_attained ;;
  }

  dimension: how_do_you_discover_videos_ {
    type: string
    sql: ${TABLE}.How_do_you_discover_videos_ ;;
  }

  dimension: how_many_hours_a_week_do_you_spend_practicing_your_prop_s__ {
    type: string
    sql: ${TABLE}.How_many_hours_a_week_do_you_spend_practicing_your_prop_s__ ;;
  }

  dimension: how_many_hours_per_month_do_you_spend_receiving_instruction_ {
    type: string
    sql: ${TABLE}.How_many_hours_per_month_do_you_spend_receiving_instruction_ ;;
  }

  dimension: how_many_online_flow_arts_related_videos_do_you_watch_per_month_ {
    type: string
    sql: ${TABLE}.How_many_online_flow_arts_related_videos_do_you_watch_per_month_ ;;
  }

  dimension: how_many_spin_jams_do_you_attend_per_month_ {
    type: string
    sql: ${TABLE}.How_many_spin_jams_do_you_attend_per_month_ ;;
  }

  dimension: how_many_years_have_you_been_spinning_overall_ {
    type: string
    sql: ${TABLE}.How_many_years_have_you_been_spinning_overall_ ;;
  }

  dimension: i_am_more_likely_to_attend {
    type: string
    sql: ${TABLE}.I_am_more_likely_to_attend ;;
  }

  dimension: number_of_children {
    type: string
    sql: ${TABLE}.Number_of_Children ;;
  }

  dimension: number_of_clothing_items_relating_to_flow_arts_purchased_in_the_past_year {
    type: string
    sql: ${TABLE}.Number_of_clothing_items_relating_to_flow_arts_purchased_in_the_past_year ;;
  }

  dimension: number_of_festivals_attended_in_the_past_year {
    type: string
    sql: ${TABLE}.Number_of_festivals_attended_in_the_past_year ;;
  }

  dimension: number_of_in_person_lessons_taken_in_the_past_year__outside_the_fire_flow_festivals_ {
    type: string
    sql: ${TABLE}.Number_of_in_person_lessons_taken_in_the_past_year__outside_the_fire_flow_festivals_ ;;
  }

  dimension: number_of_instructional_dvds_purchased_in_the_past_year {
    type: string
    sql: ${TABLE}.Number_of_instructional_DVDs_purchased_in_the_past_year ;;
  }

  dimension: number_of_props_purchased_in_the_past_year {
    type: string
    sql: ${TABLE}.Number_of_props_purchased_in_the_past_year ;;
  }

  dimension: number_of_siblings {
    type: string
    sql: ${TABLE}.Number_of_Siblings ;;
  }

  dimension: number_of_workshops_attended_in_the_past_year__fire_flow_festivals_or_traveling_teacher_ {
    type: string
    sql: ${TABLE}.Number_of_workshops_attended_in_the_past_year__fire_flow_festivals_or_traveling_teacher_ ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.Occupation ;;
  }

  dimension: political_leaning {
    type: number
    sql: ${TABLE}.Political_Leaning ;;
  }

  dimension: preferred_os {
    type: string
    sql: ${TABLE}.Preferred_OS ;;
  }

  dimension: relationship_status {
    type: string
    sql: ${TABLE}.Relationship_Status ;;
  }

  dimension: religion {
    type: string
    sql: ${TABLE}.Religion ;;
  }

  dimension: sexual_orientation {
    type: string
    sql: ${TABLE}.Sexual_Orientation ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Timestamp ;;
  }

  dimension: what_are_the_biggest_improvements_in_flow_arts_hardware_you_d_like_to_see_ {
    type: string
    sql: ${TABLE}.What_are_the_biggest_improvements_in_flow_arts_hardware_you_d_like_to_see_ ;;
  }

  dimension: what_are_the_biggest_improvements_you_d_like_to_see_in_fire_flow_festivals_ {
    type: string
    sql: ${TABLE}.What_are_the_biggest_improvements_you_d_like_to_see_in_fire_flow_festivals_ ;;
  }

  dimension: what_are_the_biggest_improvements_you_d_like_to_see_in_online_forums_ {
    type: string
    sql: ${TABLE}.What_are_the_biggest_improvements_you_d_like_to_see_in_online_forums_ ;;
  }

  dimension: what_are_the_biggest_improvements_you_d_like_to_see_in_online_videos_ {
    type: string
    sql: ${TABLE}.What_are_the_biggest_improvements_you_d_like_to_see_in_online_videos_ ;;
  }

  dimension: what_criteria_do_you_use_in_determining_if_you_ll_go_to_a_fire_flow_festival_ {
    type: string
    sql: ${TABLE}.What_criteria_do_you_use_in_determining_if_you_ll_go_to_a_fire_flow_festival_ ;;
  }

  dimension: what_criteria_do_you_use_to_determine_whether_you_ll_purchase_a_given_tool_ {
    type: string
    sql: ${TABLE}.What_criteria_do_you_use_to_determine_whether_you_ll_purchase_a_given_tool_ ;;
  }

  dimension: what_do_you_consider_to_be_your_primary_prop_ {
    type: string
    sql: ${TABLE}.What_do_you_consider_to_be_your_primary_prop_ ;;
  }

  dimension: what_elements_are_most_important_for_you_in_whether_you_watch_a_video_or_not_ {
    type: string
    sql: ${TABLE}.What_elements_are_most_important_for_you_in_whether_you_watch_a_video_or_not_ ;;
  }

  dimension: what_future_flow_arts_resource_would_you_be_most_excited_to_see_ {
    type: string
    sql: ${TABLE}.What_future_flow_arts_resource_would_you_be_most_excited_to_see_ ;;
  }

  dimension: what_is_your_primary_method_for_learning_with_your_prop_ {
    type: string
    sql: ${TABLE}.What_is_your_primary_method_for_learning_with_your_prop_ ;;
  }

  dimension: what_is_your_primary_platform_for_learning_and_exploring_with_your_prop_ {
    type: string
    sql: ${TABLE}.What_is_your_primary_platform_for_learning_and_exploring_with_your_prop_ ;;
  }

  dimension: when_learning__what_elements_of_instruction_are_most_useful_for_you_ {
    type: string
    sql: ${TABLE}.When_learning__what_elements_of_instruction_are_most_useful_for_you_ ;;
  }

  dimension: where_do_you_live_ {
    type: string
    sql: ${TABLE}.Where_do_you_live_ ;;
  }

  dimension: which_of_the_following_do_you_currently_use_ {
    type: string
    sql: ${TABLE}.Which_of_the_following_do_you_currently_use_ ;;
  }

  dimension: which_of_the_following_do_you_own_ {
    type: string
    sql: ${TABLE}.Which_of_the_following_do_you_own_ ;;
  }

  dimension: which_props_do_you_use_ {
    type: string
    sql: ${TABLE}.Which_props_do_you_use_ ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
