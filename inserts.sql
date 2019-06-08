insert into pakiet (id,nazwa,mozliwoscWejsciaOd,mozliwoscWejsciaDo)
values (0,"open",'00:00','00:00'),
		(1,"comfort",'00:00','16:00');
        
insert into klient (id,Imie,Nazwisko,dataUrodzenia)
values (0,"Maciej","Petrykowski",'1999-07-03'),
		(1,"Daniel","Petrykowski",'1996-02-29'),
        (2,"Barbara","Bis",'2000-02-11'),
        (3,"Adrianna","Kondraczuk",'1996-06-04');
        
insert into karnet (id,warznoscDo,Pakiet_id,Klient_id)
values (0,'2019-08-09',1,0),
		(1,'2019-07-26',0,1),
        (2,'2019-02-23',1,2),
        (3,'2019-09-16',0,3);
        
insert into placowka (id,Adres,godzinaOtwarcia,godzinaZamkniecia)
values (0,"Al.Jerozolimskie 181B",'00:00','00:00'),
		(1,"Dalanowska 46/U3",'06:00','23:00'),
        (2,"Nowoursynowska 154a",'04:00','22:00'),
        (3,"Stanisława Kostki Potockiego 2",'05:00','00:00');
        
insert into sala(id,nazwa)
values (0,"crosfit"),
		(1,"wolne ciezary"),
        (2,"fitnes"),
        (3,"basen"),
        (4,"maszyny"),
        (5,"badminton");
        

        
insert into salewplacowce(Placowka_id,sala_id)
values (0,0),
		(0,1),
		(0,2),
		(0,3),
		(0,4),
		(1,0),
		(1,2),
		(1,3),
		(2,0),
		(2,2),
		(2,4),
		(3,4),
		(3,5),
		(3,2),
		(3,1);
        
insert into dodatkoweuslugi(id,usluga)
values(0,"zajecia fitness"),
		(1,"basen"),
        (2,"sauna"),
        (3,"trening personalny");
        
insert into uslugiwpakietach(Pakiet_id,DodatkoweUslugi_id)
values(0,0),
		(0,1),
		(0,2),
		(0,3),
		(1,0),
		(1,1);
        
insert into listawejsc(id,GodzinaWejscia,Placowka_id,Karnet_id)
values(0,'15:40',3,2),
		(1,'20:29',0,1),
        (2,'11.09',2,0),
        (3,'13:52',1,0),
        (4,'09:30',3,2);