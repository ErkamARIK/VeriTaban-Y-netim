create database school_library;

use school_library;

create table uyeler(
uyeNo int not null PRIMARY KEY identity(1,1),
uyeAdi nvarchar(50) not null,
uyeSoyadi nvarchar(50) not null,
cinsiyet char(2) not null,
telefon int,
ePosta nvarchar(50) not null,
adresNo int constraint FK_adresler_uyeler FOREIGN KEY(adresNo) references adresler(adresNo)
);

use school_library;

create table adresler(
adresNo int not null PRIMARY KEY identity(1,1),
sehir nvarchar(50) not null,
mahalle nvarchar(50) not null,
binaNo int,
cadde nvarchar(50) not null,
ulke nvarchar(50) not null,
postaKodu int
);

use school_library;

create table kutuphane(
KutuphaneNo int not null PRIMARY KEY identity(1,1),
kutuphaneIsmi nvarchar(50) not null,
aciklama nvarchar(50) not null,
adresNo int constraint FK_adresler_kutuphane FOREIGN KEY(adresNo) references adresler(adresNo)
);

use school_library;

create table kitaplar(
ISBN int not null PRIMARY KEY identity(1,1),
kitapAdi nvarchar(50) not null,
sayfaSayisi int not null,
yayinTarihi datetime,
kategoriNo int constraint FK_kategoriler_kitaplar FOREIGN KEY(kategoriNo) references kategoriler(kategoriNo),
yazarNo int constraint FK_yazarlar_kitaplar FOREIGN KEY(yazarNo) references yazarlar(yazarNo)
);

use school_library;

create table kategoriler(
kategoriNo int not null PRIMARY KEY identity(1,1),
kategoriAdi nvarchar(50)
);

use school_library;

create table yazarlar(
yazarNo int not null PRIMARY KEY identity(1,1),
yazarAdi nvarchar(50) not null,
yazarSoyadi nvarchar(50) not null
);

use school_library;

create table emanet(
emanetNo int not null PRIMARY KEY identity(1,1),
emanetTarihi datetime,
teslimTarihi datetime,
uyeNo int constraint FK_uyeler_emanet FOREIGN KEY(uyeNo) references uyeler(uyeNo),
kutuphaneNo int constraint FK_kutuphane_emanet FOREIGN KEY(kutuphaneNo) references kutuphane(kutuphaneNo),
ISBN int constraint FK_kitaplar_emanet FOREIGN KEY(ISBN) references kitaplar(ISBN)
);

use school_library;

create table kitaplarKategoriler(
kitaplarKategorilerNo int not null PRIMARY KEY identity(1,1),
ISBN int constraint FK_kitaplar_kitaplarKategoriler FOREIGN KEY(ISBN) references kitaplar(ISBN),
kategoriNo int constraint FK_kategoriler_kitaplarKategoriler FOREIGN KEY(kategoriNo) references kategoriler(kategoriNo)
);

use school_library;

create table kitaplarYazarlar(
kitaplarYazarlarNo int not null PRIMARY KEY identity(1,1),
ISBN int constraint FK_kitaplar_kitaplarYazarlar FOREIGN KEY(ISBN) references kitaplar(ISBN),
yazarNo int constraint FK_yazarlar_kitaplarYazarlar FOREIGN KEY(yazarNo) references yazarlar(yazarNo)
);

use school_library;

create table kitaplarKutuphane(
miktar int not null PRIMARY KEY identity(1,1),
ISBN int constraint FK_kitaplar_kitaplarKutuphane FOREIGN KEY(ISBN) references kitaplar(ISBN),
kutuphaneNo int constraint FK_kutuphane_kitaplarKutuphane FOREIGN KEY(kutuphaneNo) references kutuphane(kutuphaneNo)
);