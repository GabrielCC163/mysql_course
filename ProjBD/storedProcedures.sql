CREATE TABLE `produto` (
  `CodProd` CHAR(3) NOT NULL,
  `NomeProd` CHAR(50) NOT NULL,
  `Cor` CHAR(20) DEFAULT NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY  (`CodProd`)
) ENGINE=INNODB;

INSERT INTO produto
VALUES (1, 'Produto A', 'Amarela', 125);

INSERT INTO produto
VALUES (2, 'Produto B', 'Amarela', 250);

INSERT INTO produto
VALUES (3, 'Produto C', 'Vermelha', 100);

INSERT INTO produto
VALUES (4, 'Produto D', 'Preta', 90);

INSERT INTO produto
VALUES (5, 'Produto E', 'Vermelha', 150);

SELECT * FROM produto;

CREATE TABLE `customers` (
  `customerNumber` INT NOT NULL,
  `customerName` CHAR(50) NOT NULL,
  `creditLimit` DECIMAL(8,2) NOT NULL,
  `country` CHAR(30) NOT NULL,
  `email` CHAR(30) NOT NULL,
  PRIMARY KEY  (`customerNumber`)
) ENGINE=INNODB;

INSERT INTO customers VALUES (1, 'Antonio Carlos', 150, 'USA', 'antonio@123.com');
INSERT INTO customers VALUES (2, 'Marisa Monte', 5650, 'Canada', 'marisa@123.com');
INSERT INTO customers VALUES (3, 'Fernanda Montenegro', 62150, 'Mexico', 'fernanda@123.com');
INSERT INTO customers VALUES (4, 'Leadnro Adam', 3000, 'Brasil', 'leandro@123.com');
INSERT INTO customers VALUES (5, 'Felipe Assis', 4000, 'USA', 'felipe@123.com');
INSERT INTO customers VALUES (6, 'João Carlos', 11500, 'Brasil', 'joao@123.com');


DELIMITER $$

USE `programacao`$$

DROP PROCEDURE IF EXISTS `Selecionar_Produtos`$$

CREATE PROCEDURE `Selecionar_Produtos`(IN qtde INT)
BEGIN
     	SELECT * FROM produto LIMIT 3;
END$$

DELIMITER ;

CALL selecionar_Produtos(3);




DELIMITER $$

USE `programacao`$$

DROP PROCEDURE IF EXISTS `Elevar_ao_Quadrado`$$

CREATE PROCEDURE `Elevar_ao_Quadrado`(INOUT numero INT)
BEGIN
     	SET numero = numero * numero;
END$$

DELIMITER ;

SET @valor = 8;

CALL Elevar_Ao_Quadrado(@valor);

SELECT @valor;




DELIMITER $$

USE `programacao`$$

DROP PROCEDURE IF EXISTS `Verificar_Quantidade_Produtos`$$

CREATE PROCEDURE `Verificar_Quantidade_Produtos`(OUT quantidade INT)
BEGIN
     	SELECT COUNT(*) INTO quantidade FROM produto;
     	
END$$
     	
DELIMITER ;

CALL Verificar_Quantidade_Produtos(@total);

SELECT @total;




DELIMITER $$

USE `programacao`$$

DROP PROCEDURE IF EXISTS `GetCustomerLevel`$$

CREATE PROCEDURE `GetCustomerLevel`(IN p_customerNumber INT, OUT p_customerLevel CHAR(10))
BEGIN
     DECLARE creditlim DOUBLE;
     
     SELECT creditlimit INTO creditlim 
     FROM customers
     WHERE customerNumber = p_customerNumber;
     
    IF creditlim > 50000 THEN
	SET p_customerLevel = 'PLATINUM';
    ELSEIF (creditlim <= 50000 AND creditlim >= 10000) THEN
        SET p_customerLevel = 'GOLD';
    ELSEIF creditlim < 10000 THEN
        SET p_customerLevel = 'SILVER';
    END IF;
     	
END$$
     	
DELIMITER ;

CALL getcustomerlevel(3, @level);

SELECT @level;




DELIMITER $$

USE `programacao`$$

DROP PROCEDURE IF EXISTS `GetCustomerShiping`$$

CREATE PROCEDURE `GetCustomerShiping`(IN p_customerNumber INT, OUT p_shiping CHAR(10))
BEGIN
     DECLARE customerCountry VARCHAR(50);
     
     SELECT country INTO customerCountry
     FROM customers
     WHERE customerNumber = p_customerNumber;
     
     CASE customerCountry
        WHEN 'USA' 
           THEN SET p_shiping = '2-day Shipping';
        WHEN 'Canada' 
           THEN SET p_shiping = '3-day Shipping';
     ELSE
        SET p_shiping = '5-day Shipping';
     END CASE;
     	
END$$
     	
DELIMITER ;


CALL getcustomershiping(1, @level);

SELECT @level;




DELIMITER $$

DROP PROCEDURE IF EXISTS WhileLoopProc$$

CREATE PROCEDURE WhileLoopProc ( ) 
BEGIN
    DECLARE X INT;
    DECLARE str CHAR (25);
    SET X = 1;
    SET str = '';
     WHILE X <= 5 DO 
        SET str = CONCAT(str,X,',');
        SET X = X + 1;
        
     END WHILE;
     SELECT str;
    
END$$
    
DELIMITER ;

CALL whileLoopProc();
   
   


DELIMITER $$

DROP PROCEDURE IF EXISTS RepeatLoopProc$$

CREATE PROCEDURE RepeatLoopProc ()
BEGIN

   DECLARE X INT;
   DECLARE str VARCHAR(255);
   SET X = 1;
   SET str = '';
   REPEAT 
        SET str = CONCAT(str,X,',');
        SET X = X + 1;
    UNTIL X > 5
    END REPEAT;
    
    SELECT str;
    
END$$
    
DELIMITER ; 

CALL repeatLoopproc();




-- missing


DELIMITER $$

DROP PROCEDURE IF EXISTS Build_Email_List$$

CREATE PROCEDURE Build_Email_List (INOUT email_list VARCHAR(500)) 
BEGIN

   DECLARE v_finished INT DEFAULT 0; 
   DECLARE v_email VARCHAR (100) DEFAULT '';

   DECLARE email_cursor CURSOR FOR 
      SELECT email FROM customers;
      
   DECLARE CONTINUE HANDLER 
      FOR NOT FOUND SET v_finished = 1;
      
   OPEN email_cursor;
   
   get_email: LOOP
      FETCH email_cursor INTO v_email;
      
      IF v_finished = 1 THEN
         LEAVE get_email;
      END IF;
      
      SET email_list = CONCAT(v_email, ',' , email_list);
   END LOOP get_email;
   
   CLOSE email_cursor;
       
END$$
    
DELIMITER ; 

SET @email_list = "";

CALL build_email_list(@email_list);

SELECT @email_list;




DELIMITER $$

CREATE
    FUNCTION `programacao`.`CustomerLevel`(p_creditLimit DOUBLE )
    RETURNS VARCHAR(10) 
    BEGIN
       DECLARE lvl VARCHAR (10);
       
       IF p_creditLimit > 50000 THEN
          SET lvl = 'PLATINUM';
       ELSEIF (p_creditLimit <= 50000 AND p_creditLimit >= 10000) THEN
          SET lvl = 'GOLD'; 
       ELSEIF p_creditLimit < 10000 THEN
          SET lvl = 'SILVER';
       END IF;
    
       RETURN (lvl);
       
    END$$

DELIMITER ;

SELECT customerName, CustomerLevel(creditLimit)
FROM customers;



DELIMITER $$

USE `programacao`$$

DROP PROCEDURE IF EXISTS `GetCustomerLevel2`$$

CREATE PROCEDURE `GetCustomerLevel2`(IN p_customerNumber INT, OUT p_customerLevel CHAR(10))
BEGIN
     DECLARE creditlim DOUBLE;
     
     SELECT creditlimit INTO creditlim 
     FROM customers
     WHERE customerNumber = p_customerNumber;
     
     SELECT customerlevel(creditlim) INTO p_customerLevel; 
     	
END$$
     	
DELIMITER ;

CALL getcustomerlevel2 (3, @level);

SELECT @level;




