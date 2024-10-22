/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/22/2024 10:30:05 PM                       */
/*==============================================================*/

drop table if exists CO;

drop table if exists DANH_MUC_NHIEM_VU;

drop table if exists DANH_SACH_NHIEM_VU;

drop table if exists KHACH_HANG;

drop table if exists NHAC_NHO;

/*==============================================================*/
/* Table: CO                                                    */
/*==============================================================*/
create table CO
(
   MA_DANH_MUC_NV       int not null,
   MA_NHIEM_VU          int not null,
   MA_KH                int not null,
   primary key (MA_DANH_MUC_NV, MA_NHIEM_VU, MA_KH)
);

/*==============================================================*/
/* Table: DANH_MUC_NHIEM_VU                                     */
/*==============================================================*/
create table DANH_MUC_NHIEM_VU
(
   MA_DANH_MUC_NV       int not null,
   TEN_DANH_MUC_NV      varchar(255),
   GHI_CHU_DANH_MUC_NV  text,
   primary key (MA_DANH_MUC_NV)
);

/*==============================================================*/
/* Table: DANH_SACH_NHIEM_VU                                    */
/*==============================================================*/
create table DANH_SACH_NHIEM_VU
(
   MA_NHIEM_VU          int not null,
   TEN_NHIEM_VU         varchar(255),
   MO_TA_NHIEM_VU       text,
   TRANG_THAI_NHIEM_VU  varchar(50),
   NGAY_HET_HAN_NHIEM_VU datetime,
   GHI_CHU_NHIEM_VU     text,
   primary key (MA_NHIEM_VU)
);

/*==============================================================*/
/* Table: KHACH_HANG                                            */
/*==============================================================*/
create table KHACH_HANG
(
   MA_KH                int not null,
   TEN_DANG_NHAP        varchar(255),
   EMAIL                varchar(255),
   MAT_KHAU             varchar(255),
   GHI_CHU_KH           text,
   primary key (MA_KH)
);

/*==============================================================*/
/* Table: NHAC_NHO                                              */
/*==============================================================*/
create table NHAC_NHO
(
   MA_NN                int not null,
   MA_NHIEM_VU          int not null,
   THOI_GIAN_NHAC       datetime,
   TIN_NHAN_NHAC_NHO    text,
   GHI_CHU_NN           text,
   primary key (MA_NN)
);

alter table CO add constraint FK_CO foreign key (MA_DANH_MUC_NV)
      references DANH_MUC_NHIEM_VU (MA_DANH_MUC_NV) on delete restrict on update restrict;

alter table CO add constraint FK_CO2 foreign key (MA_NHIEM_VU)
      references DANH_SACH_NHIEM_VU (MA_NHIEM_VU) on delete restrict on update restrict;

alter table CO add constraint FK_CO3 foreign key (MA_KH)
      references KHACH_HANG (MA_KH) on delete restrict on update restrict;

alter table NHAC_NHO add constraint FK_NHAC foreign key (MA_NHIEM_VU)
      references DANH_SACH_NHIEM_VU (MA_NHIEM_VU) on delete restrict on update restrict;

