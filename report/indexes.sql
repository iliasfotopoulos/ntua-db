CREATE INDEX index_reservations_on_client_id ON reservations USING btree (client_id);

CREATE INDEX index_reservations_on_hotel_id ON reservations USING btree (hotel_id);

CREATE INDEX index_reservations_on_room_id ON reservations USING btree (room_id);

CREATE INDEX index_rooms_on_hotel_id ON rooms USING btree (hotel_id);

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);
