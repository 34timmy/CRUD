
 
 
CREATE TABLE `test`.`user` (
`ID` INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`NAME` VARCHAR(25) NOT NULL,
`AGE` INT NOT NULL,
`IS_ADMIN` boolean NOT NULL DEFAULT false,
`CREATIONDATE` TIMESTAMP DEFAULT CURRENT_TIMESTAMP);




INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Kola 1', '21');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Kola 2', '24');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Kola 3', '25');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Kola4', '21');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Kola5', '24');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Kola6', '25');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Vasa 7', '23');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Vasa 8', '31');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Vasa 9', '32');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Vasa10', '23');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Vasa11', '31');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('Vasa12', '32');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User13', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User14', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User15', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User16', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User17', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User18', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User19', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User20', '56');
INSERT INTO `test`.`user` (`NAME`, `AGE`) VALUES ('User21', '56');
