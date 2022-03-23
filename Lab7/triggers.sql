CREATE SEQUENCE part_number_seq START WITH 50000;

CREATE LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION partnum()
RETURNS "trigger" AS
$BODY$
BEGIN
NEW.part_number := nextval('part_number_seq');
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER parttrigger BEFORE INSERT
ON part_nyc FOR EACH ROW
EXECUTE PROCEDURE partnum();
