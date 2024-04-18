-- ������ Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   ��ġ:        2024-02-21 16:41:03 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE SEQUENCE sq_seq_bbs START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sq_seq_buy_dtl START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sq_seq_buy_mst START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sq_seq_cst START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sq_seq_mng START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sq_seq_pay START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sq_seq_prd START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sq_seq_sle START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE sq_seq_sll START WITH 1 INCREMENT BY 1;

CREATE TABLE tb_bbs (
    seq_bbs        NUMBER(10) NOT NULL,
    seq_bbs_parent NUMBER(10),
    cd_bbs_type    NUMBER(3) NOT NULL,
    cd_bbs_tab     NUMBER(3),
    title          NVARCHAR2(128) NOT NULL,
    contents       NVARCHAR2(2000) NOT NULL,
    flg_top        CHAR(1),
    flg_delete     CHAR(1) NOT NULL,
    file_save      VARCHAR2(256),
    file_orig      VARCHAR2(64),
    dt_reg         DATE NOT NULL,
    register       NUMBER(10) NOT NULL,
    dt_upt         DATE,
    updater        NUMBER(10)
)
LOGGING;

COMMENT ON COLUMN tb_bbs.seq_bbs IS
    '�Խ��� �Ϸù�ȣ';

COMMENT ON COLUMN tb_bbs.seq_bbs_parent IS
    '������ �Ϸù�ȣ';

COMMENT ON COLUMN tb_bbs.cd_bbs_type IS
    '�Խ��� ����(���� ����: 1, ���� ã�� ����: 2, �� ����: 3)';

COMMENT ON COLUMN tb_bbs.cd_bbs_tab IS
    '�Խ��� ��(1:��ǰ, 2:����, 3:����)';

COMMENT ON COLUMN tb_bbs.title IS
    '����';

COMMENT ON COLUMN tb_bbs.contents IS
    '����';

COMMENT ON COLUMN tb_bbs.flg_top IS
    '�ֻ��� ����';

COMMENT ON COLUMN tb_bbs.flg_delete IS
    '���� ����';

COMMENT ON COLUMN tb_bbs.file_save IS
    '���� ���ϸ�(���� ��ġ ����)';

COMMENT ON COLUMN tb_bbs.file_orig IS
    '���� ���ϸ�';

COMMENT ON COLUMN tb_bbs.dt_reg IS
    '��� �Ͻ�';

COMMENT ON COLUMN tb_bbs.register IS
    '�����';

COMMENT ON COLUMN tb_bbs.dt_upt IS
    '���� �Ͻ�';

COMMENT ON COLUMN tb_bbs.updater IS
    '������';

CREATE INDEX ix1_bbs ON
    tb_bbs (
        title
    ASC )
        LOGGING;

CREATE INDEX ix2_bbs ON
    tb_bbs (
        contents
    ASC )
        LOGGING;

ALTER TABLE tb_bbs ADD CONSTRAINT pk_bbs PRIMARY KEY ( seq_bbs );

CREATE TABLE tb_buy_dtl (
    seq_buy_dtl NUMBER(19) NOT NULL,
    seq_buy_mst NUMBER(19) NOT NULL,
    seq_prd     NUMBER(10) NOT NULL,
    seq_sle     NUMBER(10) NOT NULL,
    price       NUMBER(10) NOT NULL,
    count       NUMBER(3) NOT NULL,
    dt_reg      DATE NOT NULL,
    register    NUMBER(10) NOT NULL
)
LOGGING;

COMMENT ON COLUMN tb_buy_dtl.seq_buy_dtl IS
    '���� �� �Ϸù�ȣ';

COMMENT ON COLUMN tb_buy_dtl.seq_buy_mst IS
    '���� �Ϸù�ȣ';

COMMENT ON COLUMN tb_buy_dtl.seq_prd IS
    '��ǰ �Ϸù�ȣ';

COMMENT ON COLUMN tb_buy_dtl.price IS
    '��ǰ ����';

COMMENT ON COLUMN tb_buy_dtl.count IS
    '��ǰ ����';

COMMENT ON COLUMN tb_buy_dtl.dt_reg IS
    '��� �Ͻ�';

COMMENT ON COLUMN tb_buy_dtl.register IS
    '�����';

CREATE INDEX ix1_buy_dtl ON
    tb_buy_dtl (
        seq_prd
    ASC )
        LOGGING;

ALTER TABLE tb_buy_dtl ADD CONSTRAINT pk_buy_dtl PRIMARY KEY ( seq_buy_dtl );

CREATE TABLE tb_buy_mst (
    seq_buy_mst       NUMBER(19) NOT NULL,
    seq_cst           NUMBER(10) NOT NULL,
    seq_sll           NUMBER(5) NOT NULL,
    buy_info          NVARCHAR2(128) NOT NULL,
    buy_t_count       NUMBER(3) NOT NULL,
    buy_t_price       NUMBER(10) NOT NULL,
    flg_delete        CHAR(1) NOT NULL,
    cd_state_pay      CHAR(1) NOT NULL,
    cd_state_delivery CHAR(1) NOT NULL,
    dt_reg            DATE NOT NULL,
    register          NUMBER(10) NOT NULL,
    dt_upt            DATE,
    updater           NUMBER(5)
)
LOGGING;

COMMENT ON COLUMN tb_buy_mst.seq_buy_mst IS
    '���� ������ �Ϸù�ȣ';

COMMENT ON COLUMN tb_buy_mst.seq_cst IS
    '������ �Ϸù�ȣ';

COMMENT ON COLUMN tb_buy_mst.seq_sll IS
    '�Ǹ��� �Ϸù�ȣ';

COMMENT ON COLUMN tb_buy_mst.buy_info IS
    '���� ����';

COMMENT ON COLUMN tb_buy_mst.buy_t_count IS
    '���� �� ����';

COMMENT ON COLUMN tb_buy_mst.buy_t_price IS
    '���� �� ����';

COMMENT ON COLUMN tb_buy_mst.flg_delete IS
    '���� ����(����: �κ� ��� �Ұ�)';

COMMENT ON COLUMN tb_buy_mst.cd_state_pay IS
    '���� ���� �ڵ�(���� ��:N, ���� �Ϸ�: Y, ���� ���:C)';

COMMENT ON COLUMN tb_buy_mst.cd_state_delivery IS
    '��� ����(P: �غ���, D:�����, Y: ��� �Ϸ�)';

COMMENT ON COLUMN tb_buy_mst.dt_reg IS
    '��� �Ͻ�';

COMMENT ON COLUMN tb_buy_mst.register IS
    '�����';

COMMENT ON COLUMN tb_buy_mst.dt_upt IS
    '���� �Ͻ�';

COMMENT ON COLUMN tb_buy_mst.updater IS
    '������';

ALTER TABLE tb_buy_mst ADD CONSTRAINT pk_buy_mst PRIMARY KEY ( seq_buy_mst );

CREATE TABLE tb_cst (
    seq_cst   NUMBER(10) NOT NULL,
    id        VARCHAR2(16) NOT NULL,
    passwd    VARCHAR2(64) NOT NULL,
    tc_state  NUMBER(3) NOT NULL,
    cst_nm    VARCHAR2(64) NOT NULL,
    phone     VARCHAR2(64) NOT NULL,
    postcode  VARCHAR2(32) NOT NULL,
    addr1     VARCHAR2(128) NOT NULL,
    addr2     VARCHAR2(128),
    cst_email VARCHAR2(128) NOT NULL,
    flg_sms   CHAR(1) NOT NULL,
    dt_sms    DATE NOT NULL,
    flg_email CHAR(1) NOT NULL,
    dt_email  DATE NOT NULL,
    dt_reg    DATE NOT NULL,
    register  NUMBER(10) NOT NULL,
    dt_upt    DATE,
    updater   NUMBER(10)
)
LOGGING;

COMMENT ON COLUMN tb_cst.seq_cst IS
    '������ �Ϸù�ȣ';

COMMENT ON COLUMN tb_cst.id IS
    '���̵�';

COMMENT ON COLUMN tb_cst.passwd IS
    '��й�ȣ(�ؽ� ��ȣȭ)';

COMMENT ON COLUMN tb_cst.tc_state IS
    '���� ���� �ڵ�(���:0, ���:1, Ż��:2, ����:3)';

COMMENT ON COLUMN tb_cst.cst_nm IS
    '����(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_cst.phone IS
    '����ó(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_cst.postcode IS
    '�����ȣ(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_cst.addr1 IS
    '�ּ�1(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_cst.addr2 IS
    '�ּ�2(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_cst.cst_email IS
    '�̸���(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_cst.flg_sms IS
    'SMS ���� ����';

COMMENT ON COLUMN tb_cst.dt_sms IS
    'SMS ���� ���� �Ͻ�';

COMMENT ON COLUMN tb_cst.flg_email IS
    '�̸��� ���� ����';

COMMENT ON COLUMN tb_cst.dt_email IS
    '�̸��� ���� ���� �Ͻ�';

COMMENT ON COLUMN tb_cst.dt_reg IS
    '��� �Ͻ�';

COMMENT ON COLUMN tb_cst.register IS
    '�����';

COMMENT ON COLUMN tb_cst.dt_upt IS
    '���� �Ͻ�';

COMMENT ON COLUMN tb_cst.updater IS
    '������';

ALTER TABLE tb_cst ADD CONSTRAINT pk_cst PRIMARY KEY ( seq_cst );

ALTER TABLE tb_cst ADD CONSTRAINT uq1_cst UNIQUE ( id );

CREATE TABLE tb_pay (
    seq_pay       NUMBER(10) NOT NULL,
    seq_buy_mst   NUMBER(19) NOT NULL,
    deal_num      VARCHAR2(32) NOT NULL,
    cd_pay_method VARCHAR2(8) NOT NULL,
    flg_success   CHAR(1),
    dt_reg        DATE NOT NULL,
    register      NUMBER(9) NOT NULL
)
LOGGING;

COMMENT ON COLUMN tb_pay.seq_pay IS
    '���� �Ϸù�ȣ';

COMMENT ON COLUMN tb_pay.seq_buy_mst IS
    '���� ������ �Ϸù�ȣ';

COMMENT ON COLUMN tb_pay.deal_num IS
    '�ŷ� ��ȣ(PG ����)';

COMMENT ON COLUMN tb_pay.cd_pay_method IS
    '���� ���� �ڵ�';

COMMENT ON COLUMN tb_pay.flg_success IS
    '����: Y, ����: N';

COMMENT ON COLUMN tb_pay.dt_reg IS
    '��� �Ͻ�';

COMMENT ON COLUMN tb_pay.register IS
    '�����';

ALTER TABLE tb_pay ADD CONSTRAINT pk_pay PRIMARY KEY ( seq_pay );

CREATE TABLE tb_prd (
    seq_prd      NUMBER(10) NOT NULL,
    prd_nm       NVARCHAR2(128) NOT NULL,
    seq_ctg      NUMBER(3),
    desces       NVARCHAR2(1024),
    price_cost   NUMBER(10),
    count_stack  NUMBER(10),
    flg_delete   CHAR(1) NOT NULL,
    cd_state_prd NUMBER(3) NOT NULL,
    dt_reg       DATE NOT NULL,
    register     NUMBER(5) NOT NULL,
    dt_upt       DATE,
    updater      NUMBER(5)
)
LOGGING;

COMMENT ON COLUMN tb_prd.seq_prd IS
    '��ǰ �Ϸù�ȣ';

COMMENT ON COLUMN tb_prd.prd_nm IS
    '��ǰ��';

COMMENT ON COLUMN tb_prd.seq_ctg IS
    'ī�װ� �Ϸù�ȣ';

COMMENT ON COLUMN tb_prd.desces IS
    '����';

COMMENT ON COLUMN tb_prd.price_cost IS
    '���� ����';

COMMENT ON COLUMN tb_prd.count_stack IS
    '��� ����';

COMMENT ON COLUMN tb_prd.flg_delete IS
    '���� ����';

COMMENT ON COLUMN tb_prd.cd_state_prd IS
    '��ǰ ���� �ڵ�(���:0, �����:1, ����:2)';

COMMENT ON COLUMN tb_prd.dt_reg IS
    '��� �Ͻ�';

COMMENT ON COLUMN tb_prd.register IS
    '�����';

COMMENT ON COLUMN tb_prd.dt_upt IS
    '���� �Ͻ�';

COMMENT ON COLUMN tb_prd.updater IS
    '������';

ALTER TABLE tb_prd ADD CONSTRAINT pk_prd PRIMARY KEY ( seq_prd );

CREATE TABLE tb_sle (
    seq_sle       NUMBER(10) NOT NULL,
    seq_prd       NUMBER(10) NOT NULL,
    sle_nm        NVARCHAR2(128) NOT NULL,
    cd_where      NUMBER(3),
    cd_ctg_where  VARCHAR2(64),
    img           VARCHAR2(256),
    desces        NVARCHAR2(1024),
    price_sale    NUMBER(10) NOT NULL,
    cd_state_sale NUMBER(3) NOT NULL,
    dt_sale_start DATE,
    dt_sale_end   DATE,
    dt_reg        DATE NOT NULL,
    register      NUMBER(5) NOT NULL,
    dt_upt        DATE,
    updater       NUMBER(5)
)
LOGGING;

COMMENT ON COLUMN tb_sle.seq_sle IS
    '�Ǹ� �Ϸù�ȣ';

COMMENT ON COLUMN tb_sle.seq_prd IS
    '��ǰ �Ϸù�ȣ';

COMMENT ON COLUMN tb_sle.sle_nm IS
    '�ǸŸ�';

COMMENT ON COLUMN tb_sle.cd_where IS
    '�Ǹ�ó �ڵ�';

COMMENT ON COLUMN tb_sle.cd_ctg_where IS
    'ī�װ� �ڵ�(�Ǹ�ó ����)';

COMMENT ON COLUMN tb_sle.img IS
    '�̹���';

COMMENT ON COLUMN tb_sle.desces IS
    '����';

COMMENT ON COLUMN tb_sle.price_sale IS
    '�Ǹ� ����';

COMMENT ON COLUMN tb_sle.cd_state_sale IS
    '�Ǹ� ���� �ڵ�(0: �Ǹ� ���, 1:�Ǹ���, 2:�Ǹ� ����)';

COMMENT ON COLUMN tb_sle.dt_sale_start IS
    '�Ǹ� ���� �Ͻ�';

COMMENT ON COLUMN tb_sle.dt_sale_end IS
    '�Ǹ� ���� �Ͻ�';

COMMENT ON COLUMN tb_sle.dt_reg IS
    '��� �Ͻ�';

COMMENT ON COLUMN tb_sle.register IS
    '�����';

COMMENT ON COLUMN tb_sle.dt_upt IS
    '���� �Ͻ�';

COMMENT ON COLUMN tb_sle.updater IS
    '������';

ALTER TABLE tb_sle ADD CONSTRAINT pk_sle PRIMARY KEY ( seq_sle );

CREATE TABLE tb_sll (
    seq_sll       NUMBER(5) NOT NULL,
    id            VARCHAR2(16) NOT NULL,
    passwd        VARCHAR2(64) NOT NULL,
    tc_state      NUMBER(3) NOT NULL,
    corp_nm       NVARCHAR2(64) NOT NULL,
    corp_num      VARCHAR2(64) NOT NULL,
    ceo           VARCHAR2(64) NOT NULL,
    corp_postcode VARCHAR2(16) NOT NULL,
    corp_addr1    NVARCHAR2(64) NOT NULL,
    corp_addr2    NVARCHAR2(64),
    corp_email    VARCHAR2(128) NOT NULL,
    corp_intro    NVARCHAR2(1024),
    dt_reg        DATE NOT NULL,
    register      NUMBER(5) NOT NULL,
    dt_upt        DATE,
    updater       NUMBER(5)
)
LOGGING;

COMMENT ON COLUMN tb_sll.seq_sll IS
    '�Ǹ��� �Ϸù�ȣ';

COMMENT ON COLUMN tb_sll.id IS
    '���̵�';

COMMENT ON COLUMN tb_sll.passwd IS
    '��й�ȣ(�ؽ� ��ȣȭ)';

COMMENT ON COLUMN tb_sll.tc_state IS
    '���� ���� �ڵ�(���:0, ���:1, Ż��:2, ����:3)';

COMMENT ON COLUMN tb_sll.corp_nm IS
    '�����';

COMMENT ON COLUMN tb_sll.corp_num IS
    '����� ��� ��ȣ(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_sll.ceo IS
    '��ǥ�ڸ�(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_sll.corp_postcode IS
    '����� �����ȣ';

COMMENT ON COLUMN tb_sll.corp_addr1 IS
    '����� �ּ�1';

COMMENT ON COLUMN tb_sll.corp_addr2 IS
    '����� �ּ�2';

COMMENT ON COLUMN tb_sll.corp_email IS
    '����� �̸���(��ĪŰ ��ȣȭ)';

COMMENT ON COLUMN tb_sll.corp_intro IS
    '�Ұ�';

COMMENT ON COLUMN tb_sll.dt_reg IS
    '��� �Ͻ�';

COMMENT ON COLUMN tb_sll.register IS
    '�����';

COMMENT ON COLUMN tb_sll.dt_upt IS
    '���� �Ͻ�';

COMMENT ON COLUMN tb_sll.updater IS
    '������';

ALTER TABLE tb_sll ADD CONSTRAINT pk_sll PRIMARY KEY ( seq_sll );

ALTER TABLE tb_sll ADD CONSTRAINT uq1_sll UNIQUE ( id );

ALTER TABLE tb_buy_dtl
    ADD CONSTRAINT fk1_buy_dtl FOREIGN KEY ( seq_buy_mst )
        REFERENCES tb_buy_mst ( seq_buy_mst )
    NOT DEFERRABLE;

ALTER TABLE tb_buy_mst
    ADD CONSTRAINT fk1_buy_mst FOREIGN KEY ( seq_cst )
        REFERENCES tb_cst ( seq_cst )
    NOT DEFERRABLE;

ALTER TABLE tb_pay
    ADD CONSTRAINT fk1_pay FOREIGN KEY ( seq_buy_mst )
        REFERENCES tb_buy_mst ( seq_buy_mst )
    NOT DEFERRABLE;

ALTER TABLE tb_sle
    ADD CONSTRAINT fk1_sle FOREIGN KEY ( seq_prd )
        REFERENCES tb_prd ( seq_prd )
    NOT DEFERRABLE;

ALTER TABLE tb_buy_dtl
    ADD CONSTRAINT fk2_buy_dtl FOREIGN KEY ( seq_prd )
        REFERENCES tb_prd ( seq_prd )
    NOT DEFERRABLE;

ALTER TABLE tb_buy_dtl
    ADD CONSTRAINT fk3_sle FOREIGN KEY ( seq_sle )
        REFERENCES tb_sle ( seq_sle )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler ��� ����: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             3
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          9
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
