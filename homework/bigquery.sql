--- Get locationid for unknown borough
SELECT * FROM `atomic-voice-338721.production.taxi_zone_lookup` where borough='Unknown';

--- Get all fhv trips with unknown pickup location id
SELECT Borough, COUNT(*) FROM `atomic-voice-338721.production.stg_fhv_tripdata` as fhv
 inner join `atomic-voice-338721.production.taxi_zone_lookup` as pickup_zone
 on pickup_zone.locationid=fhv.pickup_locationid
 group by pickup_zone.Borough;

--- Question 3: What is the count of records in the model stg_fhv_tripdata after running all models with the test run variable disabled
SELECT COUNT(*) FROM `atomic-voice-338721.production.stg_fhv_tripdata`;

--- Question 4: What is the count of records in the model fact_fhv_trips after running all dependencies with the test run variable disabled
SELECT COUNT(*) FROM `atomic-voice-338721.production.fact_fhv_trips`;