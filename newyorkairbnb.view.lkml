view: newyorkairbnb {
  sql_table_name: public.newyorkairbnb ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: availability_365 {
    type: number
    sql: ${TABLE}."availability_365" ;;
    html: <a href="https://goop.looker.com/explore/site/fact_session?qid=ZNMjEHoWE989pzN5WYglQD">GOOP TESTING</a>;;
  }

  dimension: calculated_host_listings_count {
    type: number
    sql: ${TABLE}."calculated_host_listings_count";;
  }

  dimension_group: last_review_concatenate {
    type: time
    timeframes: []
    convert_tz: no
    datatype: date
    sql: ${TABLE}."last_review" + INTERVAL'1' days * ${calculated_host_listings_count};;
  }

  dimension: host_id {
    type: string
    sql: ${TABLE}."host_id" ;;
  }

  dimension: host_name {
    type: string
    sql: ${TABLE}."host_name" ;;
  }

  dimension_group: last_review {
    type: time
    timeframes: []
    convert_tz: no
    datatype: date
    sql: ${TABLE}."last_review" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."latitude" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."longitude" ;;
  }

  dimension: minimum_nights {
    type: number
    sql: ${TABLE}."minimum_nights" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: neighbourhood {
    type: string
    sql: ${TABLE}."neighbourhood" ;;
  }

  dimension: neighbourhood_group {
    type: string
    sql: ${TABLE}."neighbourhood_group" ;;
  }

  dimension: number_of_reviews {
    type: number
    sql: ${TABLE}."number_of_reviews" ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}."price" ;;
  }

  dimension: reviews_per_month {
    type: number
    sql: ${TABLE}."reviews_per_month" ;;
  }

  dimension: room_type {
    type: string
    sql: ${TABLE}."room_type" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, host_name]
  }
}
