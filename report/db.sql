CREATE FUNCTION delete_reservations() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            DELETE FROM reservations WHERE OLD.id = client_id;
        RETURN OLD;
        END $$;

CREATE FUNCTION delete_rooms() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            DELETE FROM rooms WHERE OLD.id = hotel_id;
        RETURN OLD;
        END $$;

CREATE TABLE clients (
    id integer NOT NULL,
    identity character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    street character varying(255),
    street_number integer,
    zip_code character varying(255),
    city character varying(255),
    credit_card_number character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE hotels (
    id integer NOT NULL,
    name character varying(255),
    street character varying(255),
    street_number integer,
    zip_code character varying(255),
    city character varying(255),
    rating integer,
    construction_year integer,
    renovation_year integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


CREATE SEQUENCE hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE TABLE reservations (
    id integer NOT NULL,
    hotel_id integer,
    room_id integer,
    client_id integer,
    arrival_date date,
    departure_date date,
    payment_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

CREATE SEQUENCE reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE rooms (
    id integer NOT NULL,
    hotel_id integer,
    room_type character varying(255),
    price integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);

CREATE VIEW upcoming_reservations AS
 SELECT reservations.id,
    reservations.arrival_date,
    reservations.departure_date,
    reservations.created_at,
    reservations.updated_at,
    clients.first_name,
    clients.last_name,
    hotels.name,
    rooms.room_type
   FROM (((reservations
   JOIN clients ON ((reservations.client_id = clients.id)))
   JOIN hotels ON ((reservations.hotel_id = hotels.id)))
   JOIN rooms ON ((reservations.room_id = rooms.id)))
  WHERE (reservations.arrival_date > ('now'::text)::date)
  ORDER BY reservations.arrival_date;

CREATE VIEW upcoming_reservations_updatable AS
 SELECT reservations.id,
    reservations.hotel_id,
    reservations.room_id,
    reservations.client_id,
    reservations.arrival_date,
    reservations.departure_date,
    reservations.payment_type,
    reservations.created_at,
    reservations.updated_at
   FROM reservations
  WHERE (reservations.departure_date > ('now'::text)::date)
  ORDER BY reservations.arrival_date;



ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);

ALTER TABLE ONLY hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);

ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


CREATE TRIGGER delete_client_reservations BEFORE DELETE ON clients FOR EACH ROW EXECUTE PROCEDURE delete_reservations();

CREATE TRIGGER delete_hotel_rooms BEFORE DELETE ON hotels FOR EACH ROW EXECUTE PROCEDURE delete_rooms();

