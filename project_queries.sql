PGDMP         7                {            dbVetClinic    15.4    15.4 !    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    16815    dbVetClinic    DATABASE     �   CREATE DATABASE "dbVetClinic" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1254';
    DROP DATABASE "dbVetClinic";
                postgres    false            �            1259    16817    Hayvan    TABLE     2  CREATE TABLE public."Hayvan" (
    hayvan_id integer NOT NULL,
    cinsiyet character varying(10),
    chip_numarasi character varying(20),
    isim character varying(50),
    dogum_tarihi date,
    yas integer,
    irk character varying(50),
    kisirlik_durumu boolean,
    renk character varying(50)
);
    DROP TABLE public."Hayvan";
       public         heap    postgres    false            �            1259    16824    Hayvan Sahipleri    TABLE     �   CREATE TABLE public."Hayvan Sahipleri" (
    sahip_id integer NOT NULL,
    adi character varying(50),
    tc_kimlik_numarasi character varying(20),
    telefon_numarasi character varying(20),
    adres character varying(100)
);
 &   DROP TABLE public."Hayvan Sahipleri";
       public         heap    postgres    false            �            1259    16851    Personel    TABLE     �   CREATE TABLE public."Personel" (
    isim character varying,
    "doğum tarihi" date,
    "TCKN" integer NOT NULL,
    "maaş" integer,
    adres character varying
);
    DROP TABLE public."Personel";
       public         heap    postgres    false            �            1259    16845    Tedavi    TABLE     �   CREATE TABLE public."Tedavi" (
    muayene_id integer NOT NULL,
    hayvan_id integer,
    hekim_id integer,
    muayene_tarihi date,
    hastalik character varying(100),
    "teşhis" character varying(100),
    tedavi character varying(100)
);
    DROP TABLE public."Tedavi";
       public         heap    postgres    false            �            1259    16816    hayvan_hayvan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hayvan_hayvan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.hayvan_hayvan_id_seq;
       public          postgres    false    215            &           0    0    hayvan_hayvan_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.hayvan_hayvan_id_seq OWNED BY public."Hayvan".hayvan_id;
          public          postgres    false    214            �            1259    16823    hayvansahipleri_sahip_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hayvansahipleri_sahip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.hayvansahipleri_sahip_id_seq;
       public          postgres    false    217            '           0    0    hayvansahipleri_sahip_id_seq    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.hayvansahipleri_sahip_id_seq OWNED BY public."Hayvan Sahipleri".sahip_id;
          public          postgres    false    216            �            1259    16854    p_Genel Personel    TABLE     T   CREATE TABLE public."p_Genel Personel" (
    "görev tanımı" character varying
);
 &   DROP TABLE public."p_Genel Personel";
       public         heap    postgres    false            �            1259    16857    p_Veteriner Hekim    TABLE     I   CREATE TABLE public."p_Veteriner Hekim" (
    unvan character varying
);
 '   DROP TABLE public."p_Veteriner Hekim";
       public         heap    postgres    false            �            1259    16844    tedavi_muayene_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tedavi_muayene_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tedavi_muayene_id_seq;
       public          postgres    false    219            (           0    0    tedavi_muayene_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tedavi_muayene_id_seq OWNED BY public."Tedavi".muayene_id;
          public          postgres    false    218            �            1259    16860 	   Ürünler    TABLE     �   CREATE TABLE public."Ürünler" (
    "ürün türü" character varying,
    barkod integer NOT NULL,
    "ürün adı" character varying,
    adet integer
);
    DROP TABLE public."Ürünler";
       public         heap    postgres    false                       2604    16820    Hayvan hayvan_id    DEFAULT     v   ALTER TABLE ONLY public."Hayvan" ALTER COLUMN hayvan_id SET DEFAULT nextval('public.hayvan_hayvan_id_seq'::regclass);
 A   ALTER TABLE public."Hayvan" ALTER COLUMN hayvan_id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    16827    Hayvan Sahipleri sahip_id    DEFAULT     �   ALTER TABLE ONLY public."Hayvan Sahipleri" ALTER COLUMN sahip_id SET DEFAULT nextval('public.hayvansahipleri_sahip_id_seq'::regclass);
 J   ALTER TABLE public."Hayvan Sahipleri" ALTER COLUMN sahip_id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16848    Tedavi muayene_id    DEFAULT     x   ALTER TABLE ONLY public."Tedavi" ALTER COLUMN muayene_id SET DEFAULT nextval('public.tedavi_muayene_id_seq'::regclass);
 B   ALTER TABLE public."Tedavi" ALTER COLUMN muayene_id DROP DEFAULT;
       public          postgres    false    219    218    219                      0    16817    Hayvan 
   TABLE DATA           {   COPY public."Hayvan" (hayvan_id, cinsiyet, chip_numarasi, isim, dogum_tarihi, yas, irk, kisirlik_durumu, renk) FROM stdin;
    public          postgres    false    215   �$                 0    16824    Hayvan Sahipleri 
   TABLE DATA           h   COPY public."Hayvan Sahipleri" (sahip_id, adi, tc_kimlik_numarasi, telefon_numarasi, adres) FROM stdin;
    public          postgres    false    217   �$                 0    16851    Personel 
   TABLE DATA           S   COPY public."Personel" (isim, "doğum tarihi", "TCKN", "maaş", adres) FROM stdin;
    public          postgres    false    220   %                 0    16845    Tedavi 
   TABLE DATA           q   COPY public."Tedavi" (muayene_id, hayvan_id, hekim_id, muayene_tarihi, hastalik, "teşhis", tedavi) FROM stdin;
    public          postgres    false    219   "%                 0    16854    p_Genel Personel 
   TABLE DATA           ?   COPY public."p_Genel Personel" ("görev tanımı") FROM stdin;
    public          postgres    false    221   ?%                 0    16857    p_Veteriner Hekim 
   TABLE DATA           4   COPY public."p_Veteriner Hekim" (unvan) FROM stdin;
    public          postgres    false    222   \%                 0    16860 	   Ürünler 
   TABLE DATA           S   COPY public."Ürünler" ("ürün türü", barkod, "ürün adı", adet) FROM stdin;
    public          postgres    false    223   y%       )           0    0    hayvan_hayvan_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.hayvan_hayvan_id_seq', 1, false);
          public          postgres    false    214            *           0    0    hayvansahipleri_sahip_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.hayvansahipleri_sahip_id_seq', 1, false);
          public          postgres    false    216            +           0    0    tedavi_muayene_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tedavi_muayene_id_seq', 1, false);
          public          postgres    false    218            �           2606    16822    Hayvan hayvan_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Hayvan"
    ADD CONSTRAINT hayvan_pkey PRIMARY KEY (hayvan_id);
 >   ALTER TABLE ONLY public."Hayvan" DROP CONSTRAINT hayvan_pkey;
       public            postgres    false    215            �           2606    16829 %   Hayvan Sahipleri hayvansahipleri_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."Hayvan Sahipleri"
    ADD CONSTRAINT hayvansahipleri_pkey PRIMARY KEY (sahip_id);
 Q   ALTER TABLE ONLY public."Hayvan Sahipleri" DROP CONSTRAINT hayvansahipleri_pkey;
       public            postgres    false    217            �           2606    16850    Tedavi tedavi_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Tedavi"
    ADD CONSTRAINT tedavi_pkey PRIMARY KEY (muayene_id);
 >   ALTER TABLE ONLY public."Tedavi" DROP CONSTRAINT tedavi_pkey;
       public            postgres    false    219                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     