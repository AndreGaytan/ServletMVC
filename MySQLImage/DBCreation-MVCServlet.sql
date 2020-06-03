CREATE DATABASE CRUDMVC;
USE CRUDMVC;

CREATE TABLE USUARIO(
	UserID int NOT NULL,
    Nombre varchar(20) NOT NULL,
    Apellido varchar(20) NOT NULL,
    Email varchar(40) UNIQUE NULL,
    Telefono bigint UNSIGNED UNIQUE NOT NULL
);

ALTER TABLE USUARIO
ADD CONSTRAINT USUARIOS_PK PRIMARY KEY (UserID),
MODIFY UserID int AUTO_INCREMENT;


/*Stored Procedures*/
Delimiter ??
CREATE PROCEDURE createUsuario (IN nombre varchar(20), IN apellido varchar(20), IN email varchar(40), IN tel bigint UNSIGNED)
	BEGIN
		INSERT INTO USUARIO (Nombre, Apellido, Email, Telefono) VALUES (nombre, apellido, email, tel);
	END
??

CREATE PROCEDURE readUsuario (IN id int)
	BEGIN
		SELECT * 
		FROM USUARIO
		WHERE UserID = id;
	END
??

CREATE PROCEDURE readAllUsuarios ()
	BEGIN
		SELECT * 
		FROM USUARIO;
	END
??

CREATE PROCEDURE updateUsuario (IN id int, IN nombre varchar(20), IN apellido varchar(20), IN email varchar(40), IN tel bigint UNSIGNED)
	BEGIN
		UPDATE USUARIO
		SET Nombre=nombre,
			Apellido=apellido,
			Email=email,
			Telefono=tel
		WHERE UserID=id;
	END
??

CREATE PROCEDURE deleteUsuario (IN id int)
	BEGIN
		DELETE FROM USUARIO
		WHERE UserID=id;
	END
??

/*Prellenado*/
INSERT INTO USUARIO (Nombre, Apellido, Email, Telefono) VALUES('Andre', 'Gaytan', 'micorreo@dominio.com', 4774753616);
INSERT INTO USUARIO (Nombre, Apellido, Email, Telefono) VALUES('Cynthia', 'Luna', 'elcorreodecynthia@dominio.com', 4776313654);
INSERT INTO USUARIO (Nombre, Apellido, Email, Telefono) VALUES('Sofia', 'Lora', 'elcorreodesofia@dominio.com', 4771951028);
INSERT INTO USUARIO (Nombre, Apellido, Email, Telefono) VALUES('Carlos', 'Fonseca', 'elcorreodecarlos@dominio.com', 4773456789);
INSERT INTO USUARIO (Nombre, Apellido, Email, Telefono) VALUES('Andoni', 'González', 'elcorreodeandoni@dominio.com', 4770912342);

/*Testing Procedures*/
CALL createUsuario('Jose', 'Luna', 'correodejuan@dominioamuchito.com', 4777932400);
CALL updateUsuario(6, 'Juan', 'Luna', 'elcorreodejuan@dominio.com', 4777932400);

