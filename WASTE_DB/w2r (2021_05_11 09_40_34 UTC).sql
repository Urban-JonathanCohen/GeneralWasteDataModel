-- SQL dump generated using DBML (dbml-lang.org)
-- Database: PostgreSQL
-- Generated at: 2021-05-04T12:12:42.421Z

CREATE TYPE "geom_enum" AS ENUM (
  'Point',
  'LineString',
  'CircularString',
  'CompoundCurve',
  'Polygon',
  'CurvePolygon',
  'MultiPoint',
  'MultiLineString',
  'MultiPolygon',
  'GeometryCollection'
);

CREATE TYPE "frequency" AS ENUM (
  'Onece per year',
  'Once every half year',
  'Once every 3 months',
  'Monthly',
  'Weekly'
);

CREATE TYPE "week_day" AS ENUM (
  'Monday',
  'Tuesday',
  '...'
);

CREATE TABLE "agent" (
  "agent_id" SERIAL UNIQUE PRIMARY KEY,
  "name" varchar,
  "size" int,
  "agent_activity" varchar,
  "nace_code" varchar,
  "type_of_agent" varchar,
  "oublic" varchar,
  "membership_name" varchar,
  "membership_id" int,
  "income" int,
  "latitude" int,
  "longitude" int,
  "address" varchar,
  "geom" geom_enum,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "generator" (
  "gen_id" int PRIMARY KEY,
  "agent_id" int,
  "waste_id" int,
  "resource_used" varchar,
  "q_resource" int,
  "resource_freq" frequency,
  "process_name" varchar,
  "process_description" varchar,
  "process_url" varchar,
  "capital_used" varchar,
  "total_cost" int,
  "cost_unit" int,
  "cost_t_unit" frequency,
  "waste_low" varchar,
  "q_waste" int,
  "waste_description" varchar,
  "waste_frequency" frequency,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "consumer" (
  "cons_id" int PRIMARY KEY,
  "agent_id" int,
  "resource_type" int,
  "resource_qty" int,
  "resource_p" int,
  "resource_frq" frequency,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "storer" (
  "store_id" int PRIMARY KEY,
  "agent_id" int,
  "total_capacity" int,
  "type_of_waste" varchar,
  "capactiy_in_use" int,
  "operation_cost" int,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "recycler" (
  "trans_id" int PRIMARY KEY,
  "agent_id" int,
  "waste_type" int,
  "waste_qty" int,
  "waste_frq" frequency,
  "resource_type" int,
  "resource_qty" int,
  "resource_p" int,
  "resource_frq" frequency,
  "process_url" varchar,
  "process_description" varchar,
  "process_type" varchar,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "transporter" (
  "transport_id" int PRIMARY KEY,
  "agent_id" int,
  "waste_type" int,
  "waste_capacity" int,
  "travel_mode" int,
  "capacity" int,
  "vehicle_brand" varchar,
  "vehicle_model" varchar,
  "vehicle_url" varchar,
  "age" int,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "waste" (
  "waste_id" SERIAL UNIQUE PRIMARY KEY,
  "type_of_waste" varchar,
  "waste_qty" int,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "route" (
  "route_id" int PRIMARY KEY,
  "transport_id" int,
  "latitude" int,
  "longitude" int,
  "sequence" int,
  "frequency" frequency,
  "day_of_the_week" week_day,
  "moment" timestamp,
  "job_type" varchar,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "gps" (
  "gps_id" int PRIMARY KEY,
  "vehicle_id" int,
  "latitude" int,
  "longitude" int
);

CREATE TABLE "process" (
  "process_id" int,
  "waste_id" int,
  "resource_id" int,
  "process_name" varchar,
  "process_description" varchar,
  "process_url" varchar,
  "capital_used" varchar,
  "model" varchar,
  "year" int,
  "total_cost" int,
  "cost_unit" int,
  "cost_t_unit" frequency,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "waste_unit" (
  "waste_id" int PRIMARY KEY,
  "agent_id" int,
  "contain_id" int,
  "moment_of_operaton" timestamp,
  "waste_type" varchar,
  "low_code" varchar,
  "quantity" int,
  "contamination" boolean,
  "contamination_desc" varchar
);

CREATE TABLE "resource_log" (
  "resource_log_id" int PRIMARY KEY,
  "agent_id" int,
  "created" timestamp,
  "res_type" varchar,
  "res_code" varchar,
  "quantity" int,
  "res_desc" varchar
);

CREATE TABLE "container" (
  "cont_id" SERIAL PRIMARY KEY,
  "latitude" int,
  "longitude" int,
  "capacity" int,
  "material" varchar,
  "model" varchar,
  "model_url" varchar,
  "designed2contain" varchar,
  "status" varchar,
  "container_image" varchar,
  "iot_device" boolean,
  "iot_function" varchar,
  "date_updated" timestamp,
  "data_source" varchar
);

CREATE TABLE "zones" (
  "zones_id" SERIAL UNIQUE PRIMARY KEY,
  "part_of" int,
  "agent_id" int,
  "container_id" int
);

CREATE TABLE "kpi" (
  "kpi_id" SERIAL UNIQUE PRIMARY KEY,
  "zones_id" int
);

CREATE TABLE "resource" (
  "res_id" SERIAL UNIQUE PRIMARY KEY,
  "resource_log_id" int,
  "resource_type" varchar,
  "res_qty" int,
  "resource_p" int,
  "price_tag_source" varchar,
  "date_updated" timestamp,
  "data_source" varchar
);

ALTER TABLE "agent" ADD FOREIGN KEY ("membership_id") REFERENCES "agent" ("agent_id");

ALTER TABLE "generator" ADD FOREIGN KEY ("agent_id") REFERENCES "agent" ("agent_id");

ALTER TABLE "waste" ADD FOREIGN KEY ("waste_id") REFERENCES "generator" ("waste_id");

ALTER TABLE "consumer" ADD FOREIGN KEY ("agent_id") REFERENCES "agent" ("agent_id");

ALTER TABLE "storer" ADD FOREIGN KEY ("agent_id") REFERENCES "agent" ("agent_id");

ALTER TABLE "recycler" ADD FOREIGN KEY ("agent_id") REFERENCES "agent" ("agent_id");

ALTER TABLE "transporter" ADD FOREIGN KEY ("agent_id") REFERENCES "agent" ("agent_id");

ALTER TABLE "transporter" ADD FOREIGN KEY ("transport_id") REFERENCES "route" ("transport_id");

ALTER TABLE "transporter" ADD FOREIGN KEY ("transport_id") REFERENCES "gps" ("vehicle_id");

ALTER TABLE "process" ADD FOREIGN KEY ("waste_id") REFERENCES "waste" ("waste_id");

ALTER TABLE "process" ADD FOREIGN KEY ("resource_id") REFERENCES "resource" ("res_id");

ALTER TABLE "waste_unit" ADD FOREIGN KEY ("agent_id") REFERENCES "agent" ("agent_id");

ALTER TABLE "container" ADD FOREIGN KEY ("cont_id") REFERENCES "waste_unit" ("contain_id");

ALTER TABLE "resource_log" ADD FOREIGN KEY ("agent_id") REFERENCES "agent" ("agent_id");

ALTER TABLE "zones" ADD FOREIGN KEY ("zones_id") REFERENCES "zones" ("part_of");

ALTER TABLE "agent" ADD FOREIGN KEY ("agent_id") REFERENCES "zones" ("agent_id");

ALTER TABLE "container" ADD FOREIGN KEY ("cont_id") REFERENCES "zones" ("container_id");

ALTER TABLE "zones" ADD FOREIGN KEY ("zones_id") REFERENCES "kpi" ("zones_id");

ALTER TABLE "resource" ADD FOREIGN KEY ("resource_log_id") REFERENCES "resource_log" ("resource_log_id");

COMMENT ON TABLE "agent" IS 'Spatial class that contains shared information between the stakeholder related to waste and resources';

COMMENT ON COLUMN "generator"."process_url" IS 'url of procees';

COMMENT ON TABLE "transporter" IS 'Describing the asset that make the movemnet of waste happen';

COMMENT ON TABLE "waste" IS 'This table contains information about the secondary resource present in the system';

COMMENT ON COLUMN "process"."process_url" IS 'url of procees';

COMMENT ON COLUMN "process"."total_cost" IS 'cost of the process. Res2Waste or Waste2Res';

COMMENT ON TABLE "container" IS 'This table contains information about the containers in the system';

COMMENT ON COLUMN "container"."container_image" IS 'This is a file for an image of the container';

COMMENT ON TABLE "resource" IS 'This table contains information about resource present in the system';

COMMENT ON COLUMN "resource"."price_tag_source" IS 'url of price';
