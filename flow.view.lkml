view: flow {
  sql_table_name: SpinnerDemo.spin ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [0, 18, 25, 35, 50, 64, 100]
    style: integer
    sql: ${age} ;;
  }

  dimension: PK {
    primary_key: yes
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: city {
    type: string
    sql:  ${TABLE}.city ;;
  }

  dimension: state {
    map_layer_name: us_states
    sql:  case when UPPER(${TABLE}.state)="D.C." then "DC" else UPPER(${TABLE}.state) end ;;
  }

  dimension: country {
    map_layer_name: countries
    sql:  Case when UPPER(${TABLE}.country)="PHILLIPINES" then "PHILIPPINES"
              when (UPPER(${TABLE}.country)="UNITES STATES" or UPPER(${TABLE}.country)="U.S.A." or UPPER(${TABLE}.country)="UNITED STATES" or UPPER(${TABLE}.country)="UNITED STATES OF AMERICA" or UPPER(${TABLE}.country)="UNITED STATES " or UPPER(${TABLE}.country)="US") then "USA"
              else UPPER(${TABLE}.country) end;;
  }

  dimension: are_you_more_likely_to {
    type: string
    description: "Software Preference"
    sql: ${TABLE}.Are_you_more_likely_to ;;
  }

  dimension: average_income__yearly_ {
    type: string
    sql: ${TABLE}.Average_Income__yearly_ ;;
  }

#uncleaned birth order
  dimension: b_o_og {
    type: string
    sql:  LOWER(${TABLE}.Birth_Order) ;;
  }

  dimension: birth_order {
    type: string
    sql: case when (${b_o_og} like '%old%' or ${b_o_og} like '%first%'  or ${b_o_og} like '%1%') or
    (LOWER(${TABLE}.Birth_Order) like '%only%') or (LOWER(${TABLE}.Birth_Order) like '%eldest%')
    then "Oldest"
    when (LOWER(${TABLE}.Birth_Order) like  '%young%' and (LOWER(${TABLE}.Birth_Order) not like '%second%')
    and (LOWER(${TABLE}.Birth_Order) not like '%2nd%') and (LOWER(${TABLE}.Birth_Order) not like '%3rd%') )
    or (LOWER(${TABLE}.Birth_Order) like '%baby&') then "Youngest"
    else "Middle" end;;
  }

  dimension: diet {
    type: string
    sql: case when (${TABLE}.Diet like '%egetar%') then "Vegetarian"
              when (${TABLE}.Diet like '%arnivore%') then "Carnivore"
              when (${TABLE}.Diet like '%Dairy-free%') then "Dairy Free"
              when (${TABLE}.Diet like '%luten-free%') then "Gluten Free"
              when (${TABLE}.Diet like '%No dietary%') then "No Restrictions"
              when (${TABLE}.Diet like '%aleo%') then "Paleo"
              when (LOWER(${TABLE}.Diet) like '%pesc%') then "Pescaterian"
              when (${TABLE}.Diet like '%egan%') then "Vegan"
              else ${TABLE}.Diet end;;
  }

  dimension: ios_or_android {
    type: string
    sql: ${TABLE}.Do_you_prefer_iOS_or_Android_ ;;
  }

  dimension: professional_flow_artist {
    type: yesno
    sql: ${TABLE}.Do_you_work_in_the_flow_arts_professionally_ ;;
  }

  dimension: skill_level {
    type: number
    sql: case when ${TABLE}.For_your_primary_prop__what_skill_level_would_you_classify_yourself_as_ is null
    then 0 else ${TABLE}.For_your_primary_prop__what_skill_level_would_you_classify_yourself_as_ end;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: app_user {
    description: "Have you downloaded a mobile app in the past year?"
    type: yesno
    sql: ${TABLE}.Have_you_downloaded_a_mobile_app_in_the_past_year_ ;;
  }

  dimension: highest_level_of_education_attained {
    type: string
    sql: ${TABLE}.Highest_level_of_education_attained ;;
  }

  dimension: practice_hours {
    description: "How many hours per week do you practice your props?"
    type: number
    sql: ${TABLE}.How_many_hours_a_week_do_you_spend_practicing_your_prop_s__ ;;
  }

  dimension: instruction_hours {
    type: number
    sql: ${TABLE}.How_many_hours_per_month_do_you_spend_receiving_instruction_ ;;
  }

  dimension: flow_videos {
    description: "How may online flow arts-related videos do you watch per month?"
    type: string
    sql: case when ${TABLE}.How_many_online_flow_arts_related_videos_do_you_watch_per_month_ is null then "None" else
    ${TABLE}.How_many_online_flow_arts_related_videos_do_you_watch_per_month_ end;;
  }

  dimension: years_of_spinning {
    label: "Years of Spinning"
    type: number
    value_format: "0.##"
    sql: case when ${TABLE}.How_many_years_have_you_been_spinning_overall_ is null then 0 else ${TABLE}.How_many_years_have_you_been_spinning_overall_ end;;
  }

  dimension: experience_tier {
    type: tier
    tiers: [1, 3, 5, 8, 10, 15, 20, 40, 60]
    style: integer
    sql: ${years_of_spinning} ;;
  }

  dimension: more_likely_to_attend {
    description: "What kind of festival are you more like to attend?"
    type: string
    sql: ${TABLE}.I_am_more_likely_to_attend ;;
  }

  dimension: number_of_children {
    type: string
    sql: case when(LOWER(${TABLE}.Number_of_Children) like 'n%' or ${TABLE}.Number_of_Children="0" or ${TABLE}.Number_of_Children is null) then "None" else ${TABLE}.Number_of_Children end ;;
  }

  dimension: clothing_purchased {
    description: "Number of clothing items relating to flow arts purchased in the past year"
    type: number
    sql: case when ${TABLE}.Number_of_clothing_items_relating_to_flow_arts_purchased_in_the_past_year is null
    then 0 else ${TABLE}.Number_of_clothing_items_relating_to_flow_arts_purchased_in_the_past_year end;;
  }

  dimension: number_of_festivals {
    description: "Number of festivals attended in the past year"
    type: string
    sql: case when ${TABLE}.Number_of_festivals_attended_in_the_past_year is null
    then "None" else ${TABLE}.Number_of_festivals_attended_in_the_past_year end;;
  }

  dimension: number_of_lessons {
    type: number
    sql: case when ${TABLE}.Number_of_in_person_lessons_taken_in_the_past_year__outside_the_fire_flow_festivals_ is null
    then 0 else ${TABLE}.Number_of_in_person_lessons_taken_in_the_past_year__outside_the_fire_flow_festivals_ end;;
  }

  dimension: number_of_props_purchased_in_the_past_year {
    type: number
    sql: case when ${TABLE}.Number_of_props_purchased_in_the_past_year is null then 0 else ${TABLE}.Number_of_props_purchased_in_the_past_year end ;;
  }

  dimension: number_of_siblings {
    type: number
    sql: case when ${TABLE}.Number_of_Siblings is null then 0 else ${TABLE}.Number_of_Siblings end ;;
  }

  dimension: number_of_workshops_attended_in_the_past_year {
    type: string
    sql: case when(${TABLE}.Number_of_workshops_attended_in_the_past_year__fire_flow_festivals_or_traveling_teacher_ is null) then "None"
    when (${TABLE}.Number_of_workshops_attended_in_the_past_year__fire_flow_festivals_or_traveling_teacher_="Too many to count") then "16+"
    else ${TABLE}.Number_of_workshops_attended_in_the_past_year__fire_flow_festivals_or_traveling_teacher_ end
    ;;
  }

#needs cleaning
  dimension: occupation {
    type: string
    sql: LOWER(${TABLE}.Occupation) ;;
  }

  dimension: political_leaning {
    type: number
    sql: ${TABLE}.Political_Leaning ;;
  }

  dimension: preferred_os {
    type: string
    sql: ${TABLE}.Preferred_OS ;;
  }

 dimension: sexual_orientation {
    type: string
    sql: LOWER(TRIM(${TABLE}.Sexual_Orientation)) ;;
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

  dimension: primary_method_for_learning {
    type: string
    sql: ${TABLE}.What_is_your_primary_method_for_learning_with_your_prop_ ;;
  }

  dimension: primary_platform_for_learning {
    type: string
    sql: ${TABLE}.What_is_your_primary_platform_for_learning_and_exploring_with_your_prop_ ;;
  }


  measure: count {
    type: count
  }

  measure: surveyanswerers {
    type: number
    sql:${count}/320,098,094 ;;
  }

  measure: percent_of_spinners {
    type: number
    value_format_name: percent_2
    sql: ${count}/999 ;;
  }

  measure: countUSA {
    type: count
    filters: {
      field: country
      value: "USA"
    }
  }

   measure: spinnerspercapita{
     label: "Spinners Per Capita"
     type:  number
    value_format_name: percent_2
     sql:  ${countUSA}/${bq_logrecno_bg_map.count};;
   }

  measure: avg_practice_hours{
    type: average
    sql: ${practice_hours} ;;
  }

  measure: percent_spinners_65_older {
    type: number
    sql: sum(case when ${TABLE}.age>=65 then 1 else 0 end)/${count} ;;
    value_format_name: percent_2
  }

  measure: percent_spinners_18_to_64 {
    type: number
    sql: sum(case when (${TABLE}.age>=18 and ${TABLE}.age<=64) then 1 else 0 end)/${count} ;;
    value_format_name: percent_2
  }

  measure: percent_spinners_under_18 {
    type: number
    sql: sum(case when ${TABLE}.age<=17 then 1 else 0 end)/${count} ;;
    value_format_name: percent_2
  }
}


#i don't care about this metric
#   dimension: number_of_instructional_dvds {
#     type: number
#     sql: case when(LOWER(${TABLE}.Number_of_instructional_DVDs_purchased_in_the_past_year) like 'n%' or ${TABLE}.Number_of_instructional_DVDs_purchased_in_the_past_year="0") then "None" else ${TABLE}.Number_of_instructional_DVDs_purchased_in_the_past_year end ;;
#   }

#turned into its own table
#   dimension: ethnicity {
#     type: string
#     sql: ${TABLE}.Ethnicity ;;
#   }

# turned into its own table
#   dimension: prof_events {
#     description: "Have you taught or performed in the past year?"
#     type: string
#     sql: ${TABLE}.Have_you_in_the_past_year_ ;;
#   }

#turned into a table
#   dimension: relationship_status {
#     type: string
#     sql: ${TABLE}.Relationship_Status ;;
#   }

# replaced by religion view
#   dimension: religion {
#     type: string
#     sql: ${TABLE}.Religion ;;
#   }

#   dimension: pkey {
#     sql: ${timestamp_raw} ;;
#   }

#free text, no good for analysis
#   dimension: what_are_the_biggest_improvements_in_flow_arts_hardware_you_d_like_to_see_ {
#     type: string
#     sql: ${TABLE}.What_are_the_biggest_improvements_in_flow_arts_hardware_you_d_like_to_see_ ;;
#   }
#

#either its own table or don't care
#   dimension: how_do_you_discover_videos_ {
#     type: string
#     sql: ${TABLE}.How_do_you_discover_videos_ ;;
#   }

#   dimension: what_are_the_biggest_improvements_you_d_like_to_see_in_fire_flow_festivals_ {
#     type: string
#     sql: ${TABLE}.What_are_the_biggest_improvements_you_d_like_to_see_in_fire_flow_festivals_ ;;
#   }
#
#   dimension: what_are_the_biggest_improvements_you_d_like_to_see_in_online_forums_ {
#     type: string
#     sql: ${TABLE}.What_are_the_biggest_improvements_you_d_like_to_see_in_online_forums_ ;;
#   }
#
#   dimension: what_are_the_biggest_improvements_you_d_like_to_see_in_online_videos_ {
#     type: string
#     sql: ${TABLE}.What_are_the_biggest_improvements_you_d_like_to_see_in_online_videos_ ;;
#   }

#new table
#   dimension: what_criteria_do_you_use_in_determining_if_you_ll_go_to_a_fire_flow_festival_ {
#     type: string
#     sql: ${TABLE}.What_criteria_do_you_use_in_determining_if_you_ll_go_to_a_fire_flow_festival_ ;;
#   }

#new table
#   dimension: what_criteria_do_you_use_to_determine_whether_you_ll_purchase_a_given_tool_ {
#     type: string
#     sql: ${TABLE}.What_criteria_do_you_use_to_determine_whether_you_ll_purchase_a_given_tool_ ;;
#   }

#i don't know if i care about this
#   dimension: what_do_you_consider_to_be_your_primary_prop_ {
#     type: string
#     sql: ${TABLE}.What_do_you_consider_to_be_your_primary_prop_ ;;
#   }

#new table
#   dimension: what_elements_are_most_important_for_you_in_whether_you_watch_a_video_or_not_ {
#     type: string
#     sql: ${TABLE}.What_elements_are_most_important_for_you_in_whether_you_watch_a_video_or_not_ ;;
#   }

#free text, no good for analysis
#   dimension: what_future_flow_arts_resource_would_you_be_most_excited_to_see_ {
#     type: string
#     sql: ${TABLE}.What_future_flow_arts_resource_would_you_be_most_excited_to_see_ ;;
#   }

#new table
#   dimension: when_learning__what_elements_of_instruction_are_most_useful_for_you_ {
#     type: string
#     sql: ${TABLE}.When_learning__what_elements_of_instruction_are_most_useful_for_you_ ;;
#   }

#new table
#   dimension: platforms_you_use {
#     type: string
#     sql: ${TABLE}.Which_of_the_following_do_you_currently_use_ ;;
#   }

#new table
#   dimension: devices_you_own_ {
#     type: string
#     sql: ${TABLE}.Which_of_the_following_do_you_own_ ;;
#   }

# extracted into props view
#   dimension: which_props_do_you_use_ {
#     type: string
#     sql: ${TABLE}.Which_props_do_you_use_ ;;
#   }
