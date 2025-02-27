 /*
    -- ATENCIÓN NO USE DROP TABLE CON SUS TABLAS REALES
    -- YA QUE DROP TABLE BORRARÁ SUS DATOS
    -- DROP TABLE SE USA AQUÍ SÓLO PARA PODER PROBAR LOS DATOS 
    */ 

    SET FOREIGN_KEY_CHECKS=0; 
    
    DROP TABLE IF EXISTS personas_20171106;
    DROP TABLE IF EXISTS ciudades_20171106;

    SET FOREIGN_KEY_CHECKS=1; 

    /* NO COPIE LA SENTENCIA ^ DROP TABLE ^ EN SUS DATOS REALES */

    CREATE TABLE IF NOT EXISTS ciudades_20171106 
    (
        ciudad_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
        ciudad_nom VARCHAR(50),
        INDEX (ciudad_nom)
    )ENGINE=INNODB;


    CREATE TABLE IF NOT EXISTS personas_20171106 
    (
        persona_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
        persona_nom VARCHAR(70),
        ciudad_id INT,
        FOREIGN KEY fk_ciudad(ciudad_id) REFERENCES ciudades_20171106(ciudad_id)
        ON DELETE SET NULL -- cambiar para hacer pruebas ... CASCADE, SET NULL, RESTRICT, NO ACTION 
        
    )ENGINE=INNODB;


    INSERT INTO ciudades_20171106 (ciudad_nom)
        VALUES 
            ('Galilea'),
            ('Betsaida'),
            ('Patmos'),
            ('Jerusalén')

    ;

	INSERT INTO personas_20171106 (persona_nom, ciudad_id)
        VALUES 
        ('Pedro',1),
        ('Santiago',2),
        ('Juan',3),
        ('Andrés',1)
    ;


    SELECT * FROM personas_20171106 ORDER BY persona_id;
    SELECT * FROM ciudades_20171106 ORDER BY ciudad_id;

    DELETE FROM ciudades_20171106 WHERE ciudad_id=1;

    -- DELETE FROM personas_20171106 WHERE ciudad_id=4;

    -- Consultas después de la acción de borrado
    SELECT * FROM personas_20171106 ORDER BY persona_id;
    SELECT * FROM ciudades_20171106 ORDER BY ciudad_id;