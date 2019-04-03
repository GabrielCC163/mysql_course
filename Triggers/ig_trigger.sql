-- select * from Information_Schema.Triggers where Trigger_name = 'prevent_self_follows';
-- desc Information_Schema.Triggers;
DELIMITER $$

DROP TRIGGER IF EXISTS prevent_self_follows$$

create trigger or replace prevent_self_follows;

CREATE TRIGGER prevent_self_follows
    BEFORE INSERT ON follows FOR EACH ROW
    BEGIN
        IF NEW.follower_id = NEW.followee_id
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'You cannot follow yourself!';
        END IF;
    END;
$$

DELIMITER ;