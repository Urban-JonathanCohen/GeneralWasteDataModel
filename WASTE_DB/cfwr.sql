-- SQL dump generated using DBML (dbml-lang.org)
-- Database: PostgreSQL
-- Generated at: 2021-07-23T12:00:23.593Z

CREATE TABLE "actor" (
  "actor_id" int UNIQUE PRIMARY KEY,
  "name" varchar,
  "part_of" int,
  "headquarter" boolean,
  "private" boolean,
  "public" boolean,
  "pct_pub_owned" int,
  "amount_members" int,
  "objective_descr" varchar,
  "budget_yr" int,
  "budget_month" int,
  "main_responsable" int,
  "responsable_econtact" varchar,
  "actor_url" varchar,
  "address" varchar,
  "street_name" varchar,
  "street_num" int,
  "zip_code" varchar,
  "city" varchar,
  "country" varchar,
  "longitude" int,
  "latitude" int,
  "geometry" varchar,
  "time_stamp" timestamp,
  "updated_by" varchar
);

CREATE TABLE "kpi" (
  "kpi_id" int PRIMARY KEY,
  "followed_by_id" int,
  "kpi_name" varchar,
  "kpi_anacronym" varchar,
  "kpi_value" int,
  "time_stamp" timestamp,
  "updated_by" varchar
);

CREATE TABLE "contract" (
  "contract_id" int UNIQUE PRIMARY KEY,
  "solicitor_id" int,
  "contractor_id" int,
  "controlled_by_id" int,
  "amount" int,
  "date_start" timestamp,
  "valid_until" timestamp,
  "job_description" varchar,
  "contract_url" varchar,
  "last_updated" timestamp,
  "updated_by" varchar
);

CREATE TABLE "message" (
  "message_id" int UNIQUE PRIMARY KEY,
  "sent_by_id" int,
  "to_by_id" int,
  "platform" varchar,
  "message" varchar,
  "date_issued" timestamp,
  "multimedia_url" varchar
);

CREATE TABLE "generator_actor" (
  "gen_id" int UNIQUE PRIMARY KEY,
  "actor" int,
  "q_members" int,
  "income" int,
  "activity_descr" int,
  "activity_code" varchar,
  "nace_code" varchar,
  "residential" boolean,
  "amount" int,
  "amount_unit" varchar,
  "waste_type" varchar,
  "low_code" varchar,
  "frequency_of_gen" varchar,
  "last_updated" timestamp,
  "updated_by" varchar
);

CREATE TABLE "waste_generated" (
  "placed_in" int,
  "filled_by" int,
  "regulated_by" int,
  "amount_gen" int,
  "amount_unit" varchar,
  "waste_type" varchar,
  "product" varchar,
  "product_url" varchar,
  "low_code" varchar,
  "contamination" boolean,
  "contamination_type" varchar,
  "frequency_of_gen" varchar,
  "gen_time_stamp" timestamp,
  "close_raw_material" varchar,
  "image" varchar,
  "date_gen_n_contain" timestamp
);

CREATE TABLE "waste_place" (
  "place_id" int PRIMARY KEY,
  "contaiers_in" int,
  "name" varchar,
  "street_name" varchar,
  "streeet_number" varchar,
  "street_id" int,
  "geom" int,
  "entrance_long" int,
  "entrance_lat" int,
  "open_time" int,
  "close_time" int,
  "open_days" varchar,
  "with_staff" boolean,
  "staff_quantity" int,
  "acceess_requirements" int,
  "web_site" varchar,
  "last_updated" timestamp,
  "updated_by" varchar
);

CREATE TABLE "container" (
  "container_id" int UNIQUE PRIMARY KEY NOT NULL,
  "longitude" int,
  "latitude" int,
  "address" varchar,
  "street_name" varchar,
  "street_num" int,
  "street_id" int,
  "color" int,
  "model" varchar,
  "producer" varchar,
  "producer_url" varchar,
  "capacity_vol" int,
  "capacity_vol_unit" varchar,
  "capacity_weight" int,
  "capacity_weight_unit" varchar,
  "waste_type" varchar,
  "hight" int,
  "width" int,
  "outdoors" boolean,
  "waste_desc" varchar,
  "waste_code" varchar,
  "model_url" varchar,
  "value" int,
  "image" varchar,
  "vandalized" boolean,
  "condition" varchar,
  "mobile_unit" boolean,
  "last_updated" timestamp,
  "updated_by" varchar
);

CREATE TABLE "deployment" (
  "contaiers_in" int,
  "time_attached" timestamp,
  "time_deattached" timestamp,
  "status" varchar
);

CREATE TABLE "iot_device" (
  "iot_device_id" in UNIQUE PRIMARY KEY,
  "attached_to" int,
  "model" varchar,
  "value" int,
  "mantained_by" varchar,
  "responsability_of" varchar,
  "producer" varcahr,
  "documenataiton" varchar,
  "time_installed" timestamp
);

CREATE TABLE "iot_report" (
  "iot_reporting_id" int,
  "report_id" int,
  "time_stamp" timestamp,
  "temp" int,
  "open_lid" boolean,
  "capacity" int,
  "humidity" int,
  "status" int,
  "weight" int,
  PRIMARY KEY ("iot_reporting_id", "report_id")
);

CREATE TABLE "mantainence_actor" (
  "mantain_id" int UNIQUE PRIMARY KEY,
  "actor" int,
  "scheduled" boolean,
  "type" varchar
);

CREATE TABLE "mantainence_job" (
  "job_id" int UNIQUE PRIMARY KEY,
  "job_time" timestamp,
  "ordered_by" int,
  "place_mantained" int,
  "done_with" int,
  "amount_unit" varchar,
  "waste_type" varchar,
  "low_code" varchar,
  "frequency_of_gen" varchar,
  "subject_of_law" varchar,
  "regulation_url" varchar,
  "image" varchar,
  "last_updated" timestamp,
  "updated_by" varchar
);

CREATE TABLE "transport_actor" (
  "transport_id" int UNIQUE PRIMARY KEY,
  "actor" int
);

CREATE TABLE "collection_routes" (
  "route_id" int PRIMARY KEY,
  "defined_by" int,
  "start_long" int,
  "start_lat" int,
  "end_long" int,
  "end_lat" int,
  "sequence" int
);

CREATE TABLE "service_zones" (
  "zone_id" int UNIQUE PRIMARY KEY,
  "defined_by" int,
  "geom" int
);

CREATE TABLE "public_office" (
  "pub_office_id" int UNIQUE PRIMARY KEY,
  "actor" int,
  "geom" int
);

CREATE TABLE "regulation" (
  "regulation_id" int UNIQUE PRIMARY KEY,
  "defined_by" int,
  "regulation_name" varchar,
  "regulation_url" varchar,
  "date_issued" timestamp,
  "valid_until" timestamp,
  "last_updated" timestamp,
  "updated_by" timestamp
);

CREATE TABLE "waste_transfer" (
  "collect_job_id" int PRIMARY KEY,
  "from_place" int,
  "to_place" int,
  "staff_id" int,
  "equip" int,
  "regulation" int,
  "mode" varchar,
  "job_name" varchar,
  "transfer_amount" int,
  "waste_type" int,
  "product" varchar,
  "product_url" varchar,
  "low_code" varchar,
  "arrival_time" timestamp,
  "departure_time" timestamp,
  "issue_reported" varchar
);

CREATE TABLE "staff" (
  "staff_id" int PRIMARY KEY,
  "employed_by" int,
  "formal" boolean,
  "salary_month" int,
  "bonus_per_job" int,
  "use_vehicle" boolean
);

CREATE TABLE "equipment" (
  "equip_id" int PRIMARY KEY,
  "belongs_to" int,
  "type" varchar,
  "purchase_date" timestamp,
  "producer" varchar,
  "producer_url" varchar,
  "model" varchar,
  "model_url" varchar,
  "price_paid" int
);

CREATE TABLE "vehicle" (
  "vehicle_id" int PRIMARY KEY,
  "is_part" int,
  "type" varchar,
  "description" varchar,
  "model" varchar,
  "producer" varachar,
  "model_url" varchar,
  "purched_on" timestamp,
  "last_mantaince" timestamp,
  "mantaince_job" varchar,
  "mounted_gps" boolean,
  "permite_ok" boolean,
  "last_inspection" timestamp,
  "last_updated" varchar,
  "updated_by" varchar
);

CREATE TABLE "gps_reporting" (
  "equip" int,
  "moment" timestamp,
  "longitude" int,
  "latitude" int,
  "scale_weight" int,
  "waste_type" varchar
);

CREATE TABLE "storage_actor" (
  "storage_id" [pk],
  "belongs_to" int,
  "name" varchar,
  "capcity" int,
  "waste_to_store" varchar,
  "cost_yr" int,
  "cost_mth" int,
  "place_description" varchar,
  "technology" varchar,
  "percentage_used" int,
  "last_updated" timestamp,
  "updated_by" varchar
);

CREATE TABLE "recycling_actor" (
  "recyle_id" [pk],
  "belongs_to" int,
  "regulated_by" int,
  "place" int,
  "name" varchar,
  "capcity" int,
  "method" varchar,
  "resource" varchar,
  "method_description" varchar,
  "method_url" varchar,
  "capacity_int" int,
  "low_used" varchar,
  "waste_used_descr" varchar,
  "resource_produced" varchar,
  "amount_resource" int
);

CREATE TABLE "resource" (
  "resource_id" int PRIMARY KEY,
  "recycle_by" int,
  "regulated_by" int,
  "amount" int,
  "value" int,
  "material_type" varchar,
  "created" timestamp
);

CREATE TABLE "ce_consumer_actor" (
  "user_id" [pk],
  "belongs_to" int,
  "name" varchar,
  "use_resource" int
);

ALTER TABLE "actor" ADD FOREIGN KEY ("part_of") REFERENCES "actor" ("actor_id");

ALTER TABLE "kpi" ADD FOREIGN KEY ("followed_by_id") REFERENCES "actor" ("actor_id");

ALTER TABLE "contract" ADD FOREIGN KEY ("solicitor_id") REFERENCES "actor" ("actor_id");

ALTER TABLE "contract" ADD FOREIGN KEY ("contractor_id") REFERENCES "actor" ("actor_id");

ALTER TABLE "contract" ADD FOREIGN KEY ("controlled_by_id") REFERENCES "actor" ("actor_id");

ALTER TABLE "message" ADD FOREIGN KEY ("sent_by_id") REFERENCES "actor" ("actor_id");

ALTER TABLE "message" ADD FOREIGN KEY ("to_by_id") REFERENCES "actor" ("actor_id");

ALTER TABLE "generator_actor" ADD FOREIGN KEY ("actor") REFERENCES "actor" ("actor_id");

ALTER TABLE "waste_generated" ADD FOREIGN KEY ("placed_in") REFERENCES "waste_place" ("place_id");

ALTER TABLE "waste_generated" ADD FOREIGN KEY ("filled_by") REFERENCES "generator_actor" ("gen_id");

ALTER TABLE "waste_generated" ADD FOREIGN KEY ("regulated_by") REFERENCES "regulation" ("regulation_id");

ALTER TABLE "container" ADD FOREIGN KEY ("container_id") REFERENCES "waste_place" ("contaiers_in");

ALTER TABLE "deployment" ADD FOREIGN KEY ("contaiers_in") REFERENCES "container" ("container_id");

ALTER TABLE "iot_device" ADD FOREIGN KEY ("attached_to") REFERENCES "container" ("container_id");

ALTER TABLE "iot_report" ADD FOREIGN KEY ("report_id") REFERENCES "iot_device" ("iot_device_id");

ALTER TABLE "mantainence_actor" ADD FOREIGN KEY ("actor") REFERENCES "actor" ("actor_id");

ALTER TABLE "mantainence_job" ADD FOREIGN KEY ("ordered_by") REFERENCES "mantainence_actor" ("mantain_id");

ALTER TABLE "mantainence_job" ADD FOREIGN KEY ("place_mantained") REFERENCES "waste_place" ("place_id");

ALTER TABLE "mantainence_job" ADD FOREIGN KEY ("done_with") REFERENCES "equipment" ("equip_id");

ALTER TABLE "transport_actor" ADD FOREIGN KEY ("actor") REFERENCES "actor" ("actor_id");

ALTER TABLE "collection_routes" ADD FOREIGN KEY ("defined_by") REFERENCES "transport_actor" ("transport_id");

ALTER TABLE "service_zones" ADD FOREIGN KEY ("defined_by") REFERENCES "transport_actor" ("transport_id");

ALTER TABLE "public_office" ADD FOREIGN KEY ("actor") REFERENCES "actor" ("actor_id");

ALTER TABLE "regulation" ADD FOREIGN KEY ("defined_by") REFERENCES "public_office" ("pub_office_id");

ALTER TABLE "waste_transfer" ADD FOREIGN KEY ("from_place") REFERENCES "waste_place" ("place_id");

ALTER TABLE "waste_transfer" ADD FOREIGN KEY ("to_place") REFERENCES "waste_place" ("place_id");

ALTER TABLE "waste_transfer" ADD FOREIGN KEY ("staff_id") REFERENCES "staff" ("staff_id");

ALTER TABLE "waste_transfer" ADD FOREIGN KEY ("equip") REFERENCES "equipment" ("equip_id");

ALTER TABLE "waste_transfer" ADD FOREIGN KEY ("regulation") REFERENCES "regulation" ("regulation_id");

ALTER TABLE "staff" ADD FOREIGN KEY ("employed_by") REFERENCES "transport_actor" ("transport_id");

ALTER TABLE "equipment" ADD FOREIGN KEY ("belongs_to") REFERENCES "transport_actor" ("transport_id");

ALTER TABLE "equipment" ADD FOREIGN KEY ("equip_id") REFERENCES "vehicle" ("is_part");

ALTER TABLE "gps_reporting" ADD FOREIGN KEY ("equip") REFERENCES "equipment" ("equip_id");

ALTER TABLE "actor" ADD FOREIGN KEY ("actor_id") REFERENCES "storage_actor" ("belongs_to");

ALTER TABLE "actor" ADD FOREIGN KEY ("actor_id") REFERENCES "recycling_actor" ("belongs_to");

ALTER TABLE "recycling_actor" ADD FOREIGN KEY ("regulated_by") REFERENCES "regulation" ("regulation_id");

ALTER TABLE "waste_place" ADD FOREIGN KEY ("place_id") REFERENCES "recycling_actor" ("place");

ALTER TABLE "resource" ADD FOREIGN KEY ("recycle_by") REFERENCES "recycling_actor" ("recyle_id");

ALTER TABLE "resource" ADD FOREIGN KEY ("regulated_by") REFERENCES "regulation" ("regulation_id");

ALTER TABLE "actor" ADD FOREIGN KEY ("actor_id") REFERENCES "ce_consumer_actor" ("belongs_to");

ALTER TABLE "resource" ADD FOREIGN KEY ("resource_id") REFERENCES "ce_consumer_actor" ("use_resource");


COMMENT ON TABLE "actor" IS 'This table contains information about the actor in the system. Attributes are general.';

COMMENT ON COLUMN "actor"."name" IS 'Name of the entity actor';

COMMENT ON COLUMN "actor"."part_of" IS 'Name parent enetity';

COMMENT ON COLUMN "actor"."headquarter" IS 'Primary office of operations';

COMMENT ON COLUMN "actor"."private" IS 'Boolean variable to indicate if its private';

COMMENT ON COLUMN "actor"."public" IS 'Boolean variable to indicate if its public';

COMMENT ON COLUMN "actor"."pct_pub_owned" IS 'Numeric variable that indicates the percentage of public ownership';

COMMENT ON COLUMN "actor"."amount_members" IS 'Variable that indicates the amount of memebers';

COMMENT ON COLUMN "actor"."objective_descr" IS 'Description of aim of actor';

COMMENT ON COLUMN "actor"."budget_yr" IS 'Yearly budget resources for opperations';

COMMENT ON COLUMN "actor"."budget_month" IS 'Monthly budget resources for opperations';

COMMENT ON COLUMN "actor"."main_responsable" IS 'Main point of contact. Full name';

COMMENT ON COLUMN "actor"."responsable_econtact" IS 'Mail of contact';

COMMENT ON COLUMN "actor"."actor_url" IS 'URL site of the actor';

COMMENT ON COLUMN "actor"."address" IS 'Full address of the actor location';

COMMENT ON COLUMN "actor"."street_name" IS 'Street name';

COMMENT ON COLUMN "actor"."street_num" IS 'Street number';

COMMENT ON COLUMN "actor"."zip_code" IS 'Zip code';

COMMENT ON COLUMN "actor"."city" IS 'City';

COMMENT ON COLUMN "actor"."country" IS 'Country';

COMMENT ON COLUMN "actor"."longitude" IS 'Longitude';

COMMENT ON COLUMN "actor"."latitude" IS 'Latitude';

COMMENT ON COLUMN "actor"."geometry" IS 'Geometry';

COMMENT ON COLUMN "actor"."time_stamp" IS 'Last time updated';

COMMENT ON COLUMN "actor"."updated_by" IS 'Name of institution responsible for providing information';

COMMENT ON TABLE "kpi" IS 'Table to keep track of KPIs and its values';

COMMENT ON COLUMN "kpi"."followed_by_id" IS 'Which actor is following the KPI';

COMMENT ON COLUMN "kpi"."kpi_name" IS 'Name of the KPI';

COMMENT ON COLUMN "kpi"."kpi_anacronym" IS 'Anacronym of the KPI';

COMMENT ON COLUMN "kpi"."kpi_value" IS 'Current value of KPIs';

COMMENT ON COLUMN "kpi"."time_stamp" IS 'Publication date of value';

COMMENT ON COLUMN "kpi"."updated_by" IS 'Name of institution responsible for its publication';

COMMENT ON COLUMN "message"."platform" IS 'Platform of distribution';

COMMENT ON COLUMN "message"."message" IS 'Message';

COMMENT ON COLUMN "message"."date_issued" IS 'Time stamp of message publication';

COMMENT ON COLUMN "message"."multimedia_url" IS 'URL to point at multimedia file';

COMMENT ON TABLE "generator_actor" IS 'Table to describe the role of generation by an actor';

COMMENT ON TABLE "waste_generated" IS 'Artificial table to represent waste that is being generated and put in containers, by agents';

COMMENT ON COLUMN "waste_place"."street_id" IS 'street link';

COMMENT ON TABLE "iot_device" IS 'One container can have many iot-devices. Documents information about iot device attached to a container';
