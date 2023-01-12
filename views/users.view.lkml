view: users {
  sql_table_name: `orders.users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${first_name}," ",${last_name}) ;;
  }

  dimension: length_user_name {
    type: string
    sql: length(${full_name}) ;;
  }

  dimension: len_user_name_without_spaces{
    type: string
    sql: length(${full_name})-1 ;;
  }

  dimension: decade_grouping {
    type: tier
    tiers: [1,10,20,30,40,50,60,70,80,90,100]
    style: integer
    sql: ${age} ;;
  }

  measure: average_of_age {
    type: average
    sql: ${age} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, orders.count]
  }
}
