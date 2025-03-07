PGDMP  $    8    
            {            Bakari    16.0    16.0 1    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17321    Bakari    DATABASE     |   CREATE DATABASE "Bakari" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE "Bakari";
                postgres    false            U           1247    17324    tetkik    TYPE     t   CREATE TYPE public.tetkik AS (
	"röntgen" character varying(30),
	"radyoloji_çıktısı" character varying(30)
);
    DROP TYPE public.tetkik;
       public          postgres    false            �            1259    17325    alır    TABLE     T   CREATE TABLE public."alır" (
    "çip_numarası" integer,
    tetkikid integer
);
    DROP TABLE public."alır";
       public         heap    postgres    false            �            1259    17328 	   aşılama    TABLE     �   CREATE TABLE public."aşılama" (
    hekimid integer,
    "çip_numarası" integer,
    "aşı_dozu" character varying(10) NOT NULL,
    "aşı_adı" character varying(20) NOT NULL,
    "aşılama_tarihi" date NOT NULL
);
    DROP TABLE public."aşılama";
       public         heap    postgres    false            �            1259    17331    personel    TABLE     �   CREATE TABLE public.personel (
    tckn bigint NOT NULL,
    ismi character varying(30) NOT NULL,
    "doğum_tarihi" date NOT NULL,
    "maaşı" integer NOT NULL,
    adresi character varying(50) NOT NULL
);
    DROP TABLE public.personel;
       public         heap    postgres    false            �            1259    17334    genel_personel    TABLE     o   CREATE TABLE public.genel_personel (
    "görev_tanımı" character varying(30)
)
INHERITS (public.personel);
 "   DROP TABLE public.genel_personel;
       public         heap    postgres    false    218            �            1259    17337    hayvan    TABLE     �  CREATE TABLE public.hayvan (
    "çip_numarası" integer NOT NULL,
    isim character varying(15) NOT NULL,
    cinsiyet character varying(1) NOT NULL,
    "hayvan_türü" character varying(20) NOT NULL,
    "doğum_tarihi" date NOT NULL,
    "yaşı" integer NOT NULL,
    renk character varying(20) NOT NULL,
    "kısırlık_durum" boolean NOT NULL,
    "ırk" character varying(20) NOT NULL
);
    DROP TABLE public.hayvan;
       public         heap    postgres    false            �            1259    17340    hayvan_sahipleri    TABLE     �   CREATE TABLE public.hayvan_sahipleri (
    tckn bigint NOT NULL,
    "adı" character varying(30) NOT NULL,
    telefon_no bigint,
    adres_bilgileri character varying(70) NOT NULL
);
 $   DROP TABLE public.hayvan_sahipleri;
       public         heap    postgres    false            �            1259    17343    satın_alır    TABLE     p   CREATE TABLE public."satın_alır" (
    tckn bigint,
    barkod integer,
    "satış_tarihi" date NOT NULL
);
 "   DROP TABLE public."satın_alır";
       public         heap    postgres    false            �            1259    17346    tedavi    TABLE     �   CREATE TABLE public.tedavi (
    tetkikid integer NOT NULL,
    "teşhis" character varying(30) NOT NULL,
    "hastalık" character varying(50) NOT NULL,
    uygulanan_tedavi character varying(20) NOT NULL,
    laboratuvar_tetkikleri public.tetkik
);
    DROP TABLE public.tedavi;
       public         heap    postgres    false    853            �            1259    17351    tedavi_tetkikid_seq    SEQUENCE     �   CREATE SEQUENCE public.tedavi_tetkikid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tedavi_tetkikid_seq;
       public          postgres    false    223            �           0    0    tedavi_tetkikid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tedavi_tetkikid_seq OWNED BY public.tedavi.tetkikid;
          public          postgres    false    224            �            1259    17352    verir    TABLE     I   CREATE TABLE public.verir (
    hekimid integer,
    tetkikid integer
);
    DROP TABLE public.verir;
       public         heap    postgres    false            �            1259    17355    veteriner_hekimi    TABLE     �   CREATE TABLE public.veteriner_hekimi (
    hekimid integer NOT NULL,
    unvan character varying(20)
)
INHERITS (public.personel);
 $   DROP TABLE public.veteriner_hekimi;
       public         heap    postgres    false    218            �            1259    17358    veteriner_hekimi_hekimid_seq    SEQUENCE     �   CREATE SEQUENCE public.veteriner_hekimi_hekimid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.veteriner_hekimi_hekimid_seq;
       public          postgres    false    226                        0    0    veteriner_hekimi_hekimid_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.veteriner_hekimi_hekimid_seq OWNED BY public.veteriner_hekimi.hekimid;
          public          postgres    false    227            �            1259    17359 	   Ürünler    TABLE     �   CREATE TABLE public."Ürünler" (
    barkod integer NOT NULL,
    "ürün_adı" character varying(30) NOT NULL,
    "ürün_türü" character varying(20) NOT NULL,
    "ürün_adedi" integer NOT NULL
);
    DROP TABLE public."Ürünler";
       public         heap    postgres    false            G           2604    17362    tedavi tetkikid    DEFAULT     r   ALTER TABLE ONLY public.tedavi ALTER COLUMN tetkikid SET DEFAULT nextval('public.tedavi_tetkikid_seq'::regclass);
 >   ALTER TABLE public.tedavi ALTER COLUMN tetkikid DROP DEFAULT;
       public          postgres    false    224    223            H           2604    17363    veteriner_hekimi hekimid    DEFAULT     �   ALTER TABLE ONLY public.veteriner_hekimi ALTER COLUMN hekimid SET DEFAULT nextval('public.veteriner_hekimi_hekimid_seq'::regclass);
 G   ALTER TABLE public.veteriner_hekimi ALTER COLUMN hekimid DROP DEFAULT;
       public          postgres    false    227    226            �          0    17325    alır 
   TABLE DATA           =   COPY public."alır" ("çip_numarası", tetkikid) FROM stdin;
    public          postgres    false    216   �:       �          0    17328 	   aşılama 
   TABLE DATA           p   COPY public."aşılama" (hekimid, "çip_numarası", "aşı_dozu", "aşı_adı", "aşılama_tarihi") FROM stdin;
    public          postgres    false    217   ;       �          0    17334    genel_personel 
   TABLE DATA           k   COPY public.genel_personel (tckn, ismi, "doğum_tarihi", "maaşı", adresi, "görev_tanımı") FROM stdin;
    public          postgres    false    219   �;       �          0    17337    hayvan 
   TABLE DATA           �   COPY public.hayvan ("çip_numarası", isim, cinsiyet, "hayvan_türü", "doğum_tarihi", "yaşı", renk, "kısırlık_durum", "ırk") FROM stdin;
    public          postgres    false    220   �<       �          0    17340    hayvan_sahipleri 
   TABLE DATA           U   COPY public.hayvan_sahipleri (tckn, "adı", telefon_no, adres_bilgileri) FROM stdin;
    public          postgres    false    221   >       �          0    17331    personel 
   TABLE DATA           R   COPY public.personel (tckn, ismi, "doğum_tarihi", "maaşı", adresi) FROM stdin;
    public          postgres    false    218   $?       �          0    17343    satın_alır 
   TABLE DATA           H   COPY public."satın_alır" (tckn, barkod, "satış_tarihi") FROM stdin;
    public          postgres    false    222   A?       �          0    17346    tedavi 
   TABLE DATA           l   COPY public.tedavi (tetkikid, "teşhis", "hastalık", uygulanan_tedavi, laboratuvar_tetkikleri) FROM stdin;
    public          postgres    false    223   �?       �          0    17352    verir 
   TABLE DATA           2   COPY public.verir (hekimid, tetkikid) FROM stdin;
    public          postgres    false    225   SA       �          0    17355    veteriner_hekimi 
   TABLE DATA           j   COPY public.veteriner_hekimi (tckn, ismi, "doğum_tarihi", "maaşı", adresi, hekimid, unvan) FROM stdin;
    public          postgres    false    226   �A       �          0    17359 	   Ürünler 
   TABLE DATA           ]   COPY public."Ürünler" (barkod, "ürün_adı", "ürün_türü", "ürün_adedi") FROM stdin;
    public          postgres    false    228   �B                  0    0    tedavi_tetkikid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tedavi_tetkikid_seq', 10, true);
          public          postgres    false    224                       0    0    veteriner_hekimi_hekimid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.veteriner_hekimi_hekimid_seq', 10, true);
          public          postgres    false    227            L           2606    17365    hayvan hayvan_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.hayvan
    ADD CONSTRAINT hayvan_pkey PRIMARY KEY ("çip_numarası");
 <   ALTER TABLE ONLY public.hayvan DROP CONSTRAINT hayvan_pkey;
       public            postgres    false    220            N           2606    17367 &   hayvan_sahipleri hayvan_sahipleri_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.hayvan_sahipleri
    ADD CONSTRAINT hayvan_sahipleri_pkey PRIMARY KEY (tckn);
 P   ALTER TABLE ONLY public.hayvan_sahipleri DROP CONSTRAINT hayvan_sahipleri_pkey;
       public            postgres    false    221            J           2606    17369    personel personel_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.personel
    ADD CONSTRAINT personel_pkey PRIMARY KEY (tckn);
 @   ALTER TABLE ONLY public.personel DROP CONSTRAINT personel_pkey;
       public            postgres    false    218            P           2606    17371    tedavi tedavi_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tedavi
    ADD CONSTRAINT tedavi_pkey PRIMARY KEY (tetkikid);
 <   ALTER TABLE ONLY public.tedavi DROP CONSTRAINT tedavi_pkey;
       public            postgres    false    223            R           2606    17373 &   veteriner_hekimi veteriner_hekimi_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.veteriner_hekimi
    ADD CONSTRAINT veteriner_hekimi_pkey PRIMARY KEY (hekimid);
 P   ALTER TABLE ONLY public.veteriner_hekimi DROP CONSTRAINT veteriner_hekimi_pkey;
       public            postgres    false    226            T           2606    17375    Ürünler Ürünler_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Ürünler"
    ADD CONSTRAINT "Ürünler_pkey" PRIMARY KEY (barkod);
 F   ALTER TABLE ONLY public."Ürünler" DROP CONSTRAINT "Ürünler_pkey";
       public            postgres    false    228            U           2606    17376    alır alır_tetkikid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."alır"
    ADD CONSTRAINT "alır_tetkikid_fkey" FOREIGN KEY (tetkikid) REFERENCES public.tedavi(tetkikid);
 G   ALTER TABLE ONLY public."alır" DROP CONSTRAINT "alır_tetkikid_fkey";
       public          postgres    false    216    223    4688            V           2606    17381    alır alır_çip_numarası_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."alır"
    ADD CONSTRAINT "alır_çip_numarası_fkey" FOREIGN KEY ("çip_numarası") REFERENCES public.hayvan("çip_numarası");
 M   ALTER TABLE ONLY public."alır" DROP CONSTRAINT "alır_çip_numarası_fkey";
       public          postgres    false    4684    220    216            W           2606    17386     aşılama aşılama_hekimid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."aşılama"
    ADD CONSTRAINT "aşılama_hekimid_fkey" FOREIGN KEY (hekimid) REFERENCES public.veteriner_hekimi(hekimid);
 N   ALTER TABLE ONLY public."aşılama" DROP CONSTRAINT "aşılama_hekimid_fkey";
       public          postgres    false    226    4690    217            X           2606    17391 '   aşılama aşılama_çip_numarası_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."aşılama"
    ADD CONSTRAINT "aşılama_çip_numarası_fkey" FOREIGN KEY ("çip_numarası") REFERENCES public.hayvan("çip_numarası");
 U   ALTER TABLE ONLY public."aşılama" DROP CONSTRAINT "aşılama_çip_numarası_fkey";
       public          postgres    false    220    217    4684            Y           2606    17396 %   satın_alır satın_alır_barkod_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."satın_alır"
    ADD CONSTRAINT "satın_alır_barkod_fkey" FOREIGN KEY (barkod) REFERENCES public."Ürünler"(barkod);
 S   ALTER TABLE ONLY public."satın_alır" DROP CONSTRAINT "satın_alır_barkod_fkey";
       public          postgres    false    228    222    4692            Z           2606    17401 #   satın_alır satın_alır_tckn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."satın_alır"
    ADD CONSTRAINT "satın_alır_tckn_fkey" FOREIGN KEY (tckn) REFERENCES public.hayvan_sahipleri(tckn);
 Q   ALTER TABLE ONLY public."satın_alır" DROP CONSTRAINT "satın_alır_tckn_fkey";
       public          postgres    false    222    4686    221            [           2606    17406    verir verir_tckn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.verir
    ADD CONSTRAINT verir_tckn_fkey FOREIGN KEY (hekimid) REFERENCES public.veteriner_hekimi(hekimid);
 ?   ALTER TABLE ONLY public.verir DROP CONSTRAINT verir_tckn_fkey;
       public          postgres    false    226    225    4690            \           2606    17411    verir verir_tetkikid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.verir
    ADD CONSTRAINT verir_tetkikid_fkey FOREIGN KEY (tetkikid) REFERENCES public.tedavi(tetkikid);
 C   ALTER TABLE ONLY public.verir DROP CONSTRAINT verir_tetkikid_fkey;
       public          postgres    false    4688    225    223            �   N   x����@��R1��|N/鿎u�"@������s�R��U�!hz;�57���Ͷ�\5t��e�n�z��H��u,      �   �   x�u�1
AE��^`d�L����+�,�X�XyK[=����"cx���VWc �����4N��p�,�8�!�h�:p�!A� ؊��aKd^iq���x]ɬ�	��svA�T4�:([�]��'R��M���
N����=(�9 ��4�=��7(��xk�m��8~;�e�F�7��i�      �     x���=N1�k�)�F�����EH@�Dc$K��:�]�HW�����$Jm$W�>��!v>Xb�b���R&�h��	@�oC�u�>����r��e% [��s�_���5Γ�,��H�}�9v}!�dB3K�Fp��M�1/�Z�-O���}Z瓮�w��c�NC�����Ejs������e"��MfB`�`6j1�1_X�P��e�XK�����C!��m�*�H9�c4R�~5�9���wrGYT�۟e{XI&"��}�����Ӡ,      �   ,  x�}�AN�0E�����N���� !�+�ƴ�XIc����3t�Z�Ř����7�����tn�A�z�)��~ *.�K	�й��}�^��K_��tf���+�
&�\ƕ �	4?[�؆u�@�Y�lV��G�D�9��^�B��7����`��G�?�d|�R<o�"V�aSH��q(3ͯt�1VKf����y��0��h���b�_�O���2�"�$�hzS�E�~�}�ӘV
��q���~"M��Y�B���[���%mG��S��tFF��]�o���˟���W��c�Tv��      �   �   x�U��m1Ekr
O�x��T�� � ҸP#�ظ�^$mIgd�P�Ԩ�(�� a�~L�F�Ț��2�i�r]�M�tDLYe�����H�� 8'C�;i��]���EHA-l1)L]|X���`2���G�����s��\���*�ҝա�;�Og��A���C��')�/��ڬbI;Ը��K@�u9�h�����Nd���=���oΞL]��@z���6�/�#3�=1�?��n      �      x������ � �      �   �   x�e��1C��.��`Hv��s��N�z�I"�gpF.����Oө�g�P}��lS]�J�e�$㖵.�Vp1��s��O�1��ۋ�[�	�F�]E�ÜӢ��	�S�g�-Ǵ�m��_k�����He�����f��@[�M�/� ��9�      �   U  x����N�0�g�)N�ZQ!
��XTR@ ��X.��ZN��v*�/��k�0u��^�m�J���'���0�nk�3��2sV�{9!�yUH6��'�e�`�~/:g�Fh�$������U��RM����R"�	
gs��<aA�6C���2�9u�ͷҔ���#���*%$�w6%�eJPa���Y�1M���I���α8)3� ��Z���Yi�e��p����|�lԬB���,�cR<0��ޙ���\�{�[���=�"AF�e����
�9�ޏ��=@p\��Ծ�3�ac@ӁNn0�r���͡n�dp��[�%*�>|�e�Aarg�����Q� d' �      �   /   x��I   �����(��:H���'�Ų(7���r� ������      �   $  x�u�KJ�@�וS�-U�J�rĥ�R�����<2�0^�3x���M0�i!����ﯿb�$W>%��_��| yo��+"D��m
Cٞ�sI���.LoH1K}�J���Ꚕ��0�#��P�4I�0�c�MԢe�a���g����v,�
�Z��q9�z��g�z����L[��M��V���Nm���2ڻ*�p\^�a/���XP�mw�5x,����#����js�:���p�Ȫ�-ʊ�NlMZ��!�#,���;�M,�<7܅�`�K������7EQ�����      �   �   x�}�=�0�g�9���IG����%�(T��g��(�"��b���޳���`�ĸ�E�6��Ѐ&t�+����;Ԝu��7�S�
�b�HO�)GJ�Tq�P��֡�;�\��!6��q�@sN�� �p��]8T껼50�2X�z�Ev˾KwNh����տNG�X���h$����l     