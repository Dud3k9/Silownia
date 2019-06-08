-- sprawdzenie któży klienci maja nie ważny karnet
select klient.Imie,klient.Nazwisko,karnet.warznoscDo from klient
inner join karnet on karnet.Klient_id = klient.id
where karnet.warznoscDo<now();

-- lista wejsc na wszystkie siłownie wszystkich klientów
select *from klient,listawejsc
inner join karnet on karnet.id =listawejsc.Karnet_id
where karnet.Klient_id =klient.id;

-- sprawdzenie do kiedy Daniel Petrykowski ma warzny karnet
select klient.Imie,klient.Nazwisko, karnet.warznoscDo from klient
inner join karnet on karnet.Klient_id=klient.id
where klient.Imie="Daniel" and klient.Nazwisko="Petrykowski";

-- sprawdzenie która z placówek jest obecnie otwarta
select Adres,godzinaOtwarcia,godzinaZamkniecia from placowka
where godzinaOtwarcia<now() and godzinaZamkniecia>now();

-- uslugi dodatkowe z kturych moze korzystac dany klient 
select klient.Imie, klient.Nazwisko,dodatkoweuslugi.usluga from klient
inner join karnet on karnet.Klient_id=klient.id
inner join pakiet on pakiet.id=karnet.Pakiet_id
inner join uslugiwpakietach on uslugiwpakietach.Pakiet_id=pakiet.id
inner join dodatkoweuslugi on dodatkoweuslugi.id=uslugiwpakietach.DodatkoweUslugi_id;

-- lista wejsc z godzinami
select klient.Imie, klient.Nazwisko, GodzinaWejscia from klient 
inner join karnet on karnet.Klient_id=klient.id
inner join listawejsc on listawejsc.Karnet_id=karnet.id;

-- lista placowek w kturych dostepny jest basen lub fitnes
select placowka.Adres, sala.nazwa from placowka
inner join salewplacowce on salewplacowce.Placowka_id=placowka.id
inner join sala on sala.id=salewplacowce.sala_id
where sala.nazwa='basen' or sala.nazwa='fitnes';

-- ilosc wejsc przed 16:00
select count(*)'listaWejsc' from listawejsc
where GodzinaWejscia<='16:00';

-- ilosc klientow z waznym karnetrm
select count(*)'klient' from klient 
inner join karnet on karnet.Klient_id=klient.id
where warznoscDo>now();

-- ilosc wykupionych karnetow open
select pakiet.nazwa, count(*)'karnt' from pakiet
inner join karnet on karnet.Pakiet_id=pakiet.id
where pakiet.nazwa='open';