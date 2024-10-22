/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     10/22/2024 10:33:49 PM                       */
/*==============================================================*/
create database To_Do;

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO') and o.name = 'FK_CO_CO_DANH_MUC')
alter table CO
   drop constraint FK_CO_CO_DANH_MUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO') and o.name = 'FK_CO_CO2_DANH_SAC')
alter table CO
   drop constraint FK_CO_CO2_DANH_SAC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO') and o.name = 'FK_CO_CO3_KHACH_HA')
alter table CO
   drop constraint FK_CO_CO3_KHACH_HA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHAC_NHO') and o.name = 'FK_NHAC_NHO_NHAC_DANH_SAC')
alter table NHAC_NHO
   drop constraint FK_NHAC_NHO_NHAC_DANH_SAC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO')
            and   name  = 'CO3_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO.CO3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO')
            and   name  = 'CO2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO.CO2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO')
            and   name  = 'CO_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO.CO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO')
            and   type = 'U')
   drop table CO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DANH_MUC_NHIEM_VU')
            and   type = 'U')
   drop table DANH_MUC_NHIEM_VU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DANH_SACH_NHIEM_VU')
            and   type = 'U')
   drop table DANH_SACH_NHIEM_VU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHACH_HANG')
            and   type = 'U')
   drop table KHACH_HANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHAC_NHO')
            and   name  = 'NHAC_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHAC_NHO.NHAC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHAC_NHO')
            and   type = 'U')
   drop table NHAC_NHO
go

/*==============================================================*/
/* Table: CO                                                    */
/*==============================================================*/
create table CO (
   MA_DANH_MUC_NV       int                  not null,
   MA_NHIEM_VU          int                  not null,
   MA_KH                int                  not null,
   constraint PK_CO primary key (MA_DANH_MUC_NV, MA_NHIEM_VU, MA_KH)
)
go

/*==============================================================*/
/* Index: CO_FK                                                 */
/*==============================================================*/
create index CO_FK on CO (
MA_DANH_MUC_NV ASC
)
go

/*==============================================================*/
/* Index: CO2_FK                                                */
/*==============================================================*/
create index CO2_FK on CO (
MA_NHIEM_VU ASC
)
go

/*==============================================================*/
/* Index: CO3_FK                                                */
/*==============================================================*/
create index CO3_FK on CO (
MA_KH ASC
)
go

/*==============================================================*/
/* Table: DANH_MUC_NHIEM_VU                                     */
/*==============================================================*/
create table DANH_MUC_NHIEM_VU (
   MA_DANH_MUC_NV       int                  IDENTITY(1,1) not null,
   TEN_DANH_MUC_NV      varchar(255)         null,
   GHI_CHU_DANH_MUC_NV  text                 null,
   constraint PK_DANH_MUC_NHIEM_VU primary key nonclustered (MA_DANH_MUC_NV)
)
go

/*==============================================================*/
/* Table: DANH_SACH_NHIEM_VU                                    */
/*==============================================================*/
create table DANH_SACH_NHIEM_VU (
   MA_NHIEM_VU          int                  IDENTITY(1,1) not null,
   TEN_NHIEM_VU         varchar(255)         null,
   MO_TA_NHIEM_VU       text                 null,
   TRANG_THAI_NHIEM_VU  varchar(50)          null,
   NGAY_HET_HAN_NHIEM_VU datetime             null,
   GHI_CHU_NHIEM_VU     text                 null,
   constraint PK_DANH_SACH_NHIEM_VU primary key nonclustered (MA_NHIEM_VU)
)
go

/*==============================================================*/
/* Table: KHACH_HANG                                            */
/*==============================================================*/
create table KHACH_HANG (
   MA_KH                int                  IDENTITY(1,1) not null,
   TEN_DANG_NHAP        varchar(255)         null,
   EMAIL                varchar(255)         null,
   MAT_KHAU             varchar(255)         null,
   GHI_CHU_KH           text                 null,
   constraint PK_KHACH_HANG primary key nonclustered (MA_KH)
)
go

/*==============================================================*/
/* Table: NHAC_NHO                                              */
/*==============================================================*/
create table NHAC_NHO (
   MA_NN                int                  IDENTITY(1,1) not null,
   MA_NHIEM_VU          int                  not null,
   THOI_GIAN_NHAC       datetime             null,
   TIN_NHAN_NHAC_NHO    text                 null,
   GHI_CHU_NN           text                 null,
   constraint PK_NHAC_NHO primary key nonclustered (MA_NN)
)
go

/*==============================================================*/
/* Index: NHAC_FK                                               */
/*==============================================================*/
create index NHAC_FK on NHAC_NHO (
MA_NHIEM_VU ASC
)
go

alter table CO
   add constraint FK_CO_CO_DANH_MUC foreign key (MA_DANH_MUC_NV)
      references DANH_MUC_NHIEM_VU (MA_DANH_MUC_NV)
go

alter table CO
   add constraint FK_CO_CO2_DANH_SAC foreign key (MA_NHIEM_VU)
      references DANH_SACH_NHIEM_VU (MA_NHIEM_VU)
go

alter table CO
   add constraint FK_CO_CO3_KHACH_HA foreign key (MA_KH)
      references KHACH_HANG (MA_KH)
go

alter table NHAC_NHO
   add constraint FK_NHAC_NHO_NHAC_DANH_SAC foreign key (MA_NHIEM_VU)
      references DANH_SACH_NHIEM_VU (MA_NHIEM_VU)
go
