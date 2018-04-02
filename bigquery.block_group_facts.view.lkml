view: bq_block_group_facts {
  sql_table_name: `lookerdata.acs_fast_facts.fast_facts` ;;

  dimension: logrecno_bg_map_block_group {
    hidden: yes
    type: string
    sql: ${TABLE}.logrecno_bg_map_block_group ;;
    primary_key: yes
  }

  measure: total_population {
    description: "Total Population"
    type: sum
    sql: ${TABLE}.total_population ;;
    drill_fields: [group*]
  }

  # Household Measures
  measure: housing_units {
    type: sum
    group_label: "Households"
    sql: ${TABLE}.housing_units ;;
    drill_fields: [group*]
  }
  measure: avg_persons_house {
    type: number
    group_label: "Households"
    label: "Average Persons per Household"
    sql: ${total_population}/NULLIF(${housing_units}, 0) ;;
    value_format_name: decimal_2
    drill_fields: [group*]
  }

  # Income Measure
  measure: aggregate_income {
  #  hidden: yes
    type: sum
    group_label: "Households"
    sql: ${TABLE}.aggregate_income ;;
    drill_fields: [group*]
  }

  measure: avg_income_house {
    type: number
    group_label: "Households"
    label: "Average Income per Household"
    sql: ${aggregate_income}/NULLIF(${housing_units}, 0) ;;
    value_format_name: usd_0
    drill_fields: [group*]
  }

  # Sex Measures
  measure: female_population {
    type: sum
    sql: ${TABLE}.female ;;
    group_label: "Sex"
    drill_fields: [group*]
  }
  measure: male_population {
    type: sum
    sql: ${TABLE}.male ;;
    group_label: "Sex"
    drill_fields: [group*]
  }
  measure:  pct_male{
    type: number
    label: "Male % of Population"
    group_label: "Sex"
    sql: ${male_population}/NULLIF(${total_population}, 0) ;;
    value_format_name: percent_2
    drill_fields: [group*]
  }
  measure:  pct_female{
    type: number
    label: "Female % of Population"
    group_label: "Sex"
    sql: ${female_population}/NULLIF(${total_population}, 0) ;;
    value_format_name: percent_2
    drill_fields: [group*]
  }

  # Racial Measures

  measure: white_alone_or_in_combo {
    label: "White Population (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.white_alone_or_in_combo;;
    drill_fields: [group*]
  }
  measure: black_alone_or_in_combo {
    label: "Black or African American Population (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.black_alone_or_in_combo ;;
    drill_fields: [group*]
  }
  measure: amind_alone_or_in_combo {
    label: "American Indian or Native Alaskan Population (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.amind_alone_or_in_combo ;;
    drill_fields: [group*]
  }
  measure: asian_alone_or_in_combo {
    label: "Asian Population (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.asian_alone_or_in_combo ;;
    drill_fields: [group*]
  }
  measure: nat_haw_alone_or_in_combo {
    label: "Native Hawaiian or Other Pacific Islander (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.nat_haw_alone_or_in_combo ;;
    drill_fields: [group*]
  }
  measure: white_non_hisp {
    label: "White, Non-Hispanic Population"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.white_non_hisp ;;
    drill_fields: [group*]
  }
  measure: pct_white {
    label: "White % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${white_alone_or_in_combo}/NULLIF(${total_population}, 0) ;;
    drill_fields: [group*]
  }
  measure: pct_black {
    label: "Black/African American % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${black_alone_or_in_combo}/NULLIF(${total_population}, 0) ;;
    drill_fields: [group*]
  }
  measure: pct_asian {
    label: "Asian % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${asian_alone_or_in_combo}/NULLIF(${total_population}, 0) ;;
    drill_fields: [group*]
  }
  measure: pct_amind {
    label: "American Indian or Native Alaskan % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${amind_alone_or_in_combo}/NULLIF(${total_population}, 0) ;;
    drill_fields: [group*]
  }
  measure: pct_nathaw {
    label: "Native Hawaiian or Other Pacific Islander % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${nat_haw_alone_or_in_combo}/NULLIF(${total_population}, 0) ;;
    drill_fields: [group*]
  }
#   measure: pct_white_nh {
#     label: "White, Non-Hispanic % of Population"
#     group_label: "Race"
#     type: number
#     value_format_name: percent_2
#     sql: ${white_non_hisp}/NULLIF(${total_population}, 0) ;;
#     drill_fields: [group*]
#   }

  measure: hispanic_or_latino {
    label: "Hispanic or Latino Population (Any Race)"
    type: sum
    sql: ${TABLE}.hispanic_or_latino ;;
    group_label: "Race"
    drill_fields: [group*]
  }
  measure: pct_hispanic_or_latino {
    label: "Hispanic or Latino % of Population (Any Race)"
    type: number
    sql: ${hispanic_or_latino}/NULLIF(${total_population}, 0) ;;
    group_label: "Race"
    value_format_name: percent_2
    drill_fields: [group*]
  }

  measure: under_18 {
    label: "Population 17 years and younger"
    type: sum
    sql: ${TABLE}.under_18 ;;
    group_label: "Age"
    drill_fields: [group*]
  }
  measure: eighteen_to_64 {
    label: "Population 18 to 64 years"
    type: sum
    sql: ${TABLE}.eighteen_to_64 ;;
    group_label: "Age"
    drill_fields: [group*]
  }
  measure: sixty_five_and_over {
    label: "Population 65 years and older"
    type: sum
    sql: ${TABLE}.sixty_five_and_over ;;
    group_label: "Age"
    drill_fields: [group*]
  }
  measure: pct_under_18 {
    label: "% of Population 17 years and younger"
    type: number
    sql: ${under_18}/NULLIF(${total_population}, 0) ;;
    group_label: "Age"
    value_format_name: percent_2
    drill_fields: [group*]
  }
  measure: pct_18_64 {
    label: "% of Population 18 and 64 years"
    type: number
    sql: ${eighteen_to_64}/NULLIF(${total_population}, 0) ;;
    group_label: "Age"
    value_format_name: percent_2
    drill_fields: [group*]
  }
  measure: pct_65_over {
    label: "% of Population 65 and older"
    type: number
    sql: ${sixty_five_and_over}/NULLIF(${total_population}, 0) ;;
    group_label: "Age"
    value_format_name: percent_2
    drill_fields: [group*]
  }

  set: group {
    fields: [logrecno_bg_map_block_group]
  }
}
