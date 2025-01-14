PGDMP  0    .            	    |            postgres    16.4    16.4 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Ukrainian_Ukraine.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4833                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16404    courier    TABLE     �   CREATE TABLE public.courier (
    courier_id integer NOT NULL,
    type character varying NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.courier;
       public         heap    postgres    false            �            1259    16418    package    TABLE     z   CREATE TABLE public.package (
    package_id integer NOT NULL,
    weight integer NOT NULL,
    price integer NOT NULL
);
    DROP TABLE public.package;
       public         heap    postgres    false            �            1259    16483    receive    TABLE     �   CREATE TABLE public.receive (
    receiver_id integer NOT NULL,
    package_id integer NOT NULL,
    "when" timestamp with time zone NOT NULL
);
    DROP TABLE public.receive;
       public         heap    postgres    false            �            1259    16411    receiver    TABLE     �   CREATE TABLE public.receiver (
    receiver_id integer NOT NULL,
    money integer NOT NULL,
    address character varying NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.receiver;
       public         heap    postgres    false            �            1259    16468    send    TABLE     �   CREATE TABLE public.send (
    sender_id integer NOT NULL,
    package_id integer NOT NULL,
    "when" timestamp with time zone NOT NULL
);
    DROP TABLE public.send;
       public         heap    postgres    false            �            1259    16397    sender    TABLE     �   CREATE TABLE public.sender (
    sender_id integer NOT NULL,
    money integer NOT NULL,
    address character varying NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.sender;
       public         heap    postgres    false            �            1259    16498    take    TABLE     �   CREATE TABLE public.take (
    courier_id integer NOT NULL,
    package_id integer NOT NULL,
    "when" timestamp with time zone NOT NULL
);
    DROP TABLE public.take;
       public         heap    postgres    false            �          0    16404    courier 
   TABLE DATA           9   COPY public.courier (courier_id, type, name) FROM stdin;
    public          postgres    false    217   �#       �          0    16418    package 
   TABLE DATA           <   COPY public.package (package_id, weight, price) FROM stdin;
    public          postgres    false    219   �#       �          0    16483    receive 
   TABLE DATA           B   COPY public.receive (receiver_id, package_id, "when") FROM stdin;
    public          postgres    false    221   $       �          0    16411    receiver 
   TABLE DATA           E   COPY public.receiver (receiver_id, money, address, name) FROM stdin;
    public          postgres    false    218   W$       �          0    16468    send 
   TABLE DATA           =   COPY public.send (sender_id, package_id, "when") FROM stdin;
    public          postgres    false    220   �$       �          0    16397    sender 
   TABLE DATA           A   COPY public.sender (sender_id, money, address, name) FROM stdin;
    public          postgres    false    216   �$       �          0    16498    take 
   TABLE DATA           >   COPY public.take (courier_id, package_id, "when") FROM stdin;
    public          postgres    false    222   ]%       5           2606    16410    courier courier_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.courier
    ADD CONSTRAINT courier_pkey PRIMARY KEY (courier_id);
 >   ALTER TABLE ONLY public.courier DROP CONSTRAINT courier_pkey;
       public            postgres    false    217            9           2606    16422    package package_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (package_id);
 >   ALTER TABLE ONLY public.package DROP CONSTRAINT package_pkey;
       public            postgres    false    219            =           2606    16487    receive receive_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.receive
    ADD CONSTRAINT receive_pkey PRIMARY KEY (package_id);
 >   ALTER TABLE ONLY public.receive DROP CONSTRAINT receive_pkey;
       public            postgres    false    221            7           2606    16417    receiver receiver_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.receiver
    ADD CONSTRAINT receiver_pkey PRIMARY KEY (receiver_id);
 @   ALTER TABLE ONLY public.receiver DROP CONSTRAINT receiver_pkey;
       public            postgres    false    218            ;           2606    16472    send send_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.send
    ADD CONSTRAINT send_pkey PRIMARY KEY (package_id);
 8   ALTER TABLE ONLY public.send DROP CONSTRAINT send_pkey;
       public            postgres    false    220            3           2606    16403    sender sender_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.sender
    ADD CONSTRAINT sender_pkey PRIMARY KEY (sender_id);
 <   ALTER TABLE ONLY public.sender DROP CONSTRAINT sender_pkey;
       public            postgres    false    216            ?           2606    16502    take take_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.take
    ADD CONSTRAINT take_pkey PRIMARY KEY (package_id);
 8   ALTER TABLE ONLY public.take DROP CONSTRAINT take_pkey;
       public            postgres    false    222            B           2606    16493    receive r2p    FK CONSTRAINT     w   ALTER TABLE ONLY public.receive
    ADD CONSTRAINT r2p FOREIGN KEY (package_id) REFERENCES public.package(package_id);
 5   ALTER TABLE ONLY public.receive DROP CONSTRAINT r2p;
       public          postgres    false    4665    219    221            C           2606    16488    receive r2r    FK CONSTRAINT     z   ALTER TABLE ONLY public.receive
    ADD CONSTRAINT r2r FOREIGN KEY (receiver_id) REFERENCES public.receiver(receiver_id);
 5   ALTER TABLE ONLY public.receive DROP CONSTRAINT r2r;
       public          postgres    false    218    4663    221            @           2606    16478    send s2p    FK CONSTRAINT     t   ALTER TABLE ONLY public.send
    ADD CONSTRAINT s2p FOREIGN KEY (package_id) REFERENCES public.package(package_id);
 2   ALTER TABLE ONLY public.send DROP CONSTRAINT s2p;
       public          postgres    false    219    4665    220            A           2606    16473    send s2s    FK CONSTRAINT     q   ALTER TABLE ONLY public.send
    ADD CONSTRAINT s2s FOREIGN KEY (sender_id) REFERENCES public.sender(sender_id);
 2   ALTER TABLE ONLY public.send DROP CONSTRAINT s2s;
       public          postgres    false    220    216    4659            D           2606    16503    take t2c    FK CONSTRAINT     t   ALTER TABLE ONLY public.take
    ADD CONSTRAINT t2c FOREIGN KEY (courier_id) REFERENCES public.courier(courier_id);
 2   ALTER TABLE ONLY public.take DROP CONSTRAINT t2c;
       public          postgres    false    222    217    4661            E           2606    16508    take t2p    FK CONSTRAINT     t   ALTER TABLE ONLY public.take
    ADD CONSTRAINT t2p FOREIGN KEY (package_id) REFERENCES public.package(package_id);
 2   ALTER TABLE ONLY public.take DROP CONSTRAINT t2p;
       public          postgres    false    222    4665    219            �   B   x�3�L,-���O��I����ILQ�N,*���2���/�/J�L�I����/R(�LL������� Q�%      �      x�3�44�44�2�4�44����� �      �   7   x�3�4�4202�54�52P04�25�20�60�J@�,u-,�aR1z\\\ 2�
"      �   W   x�3�44��tJ-J-.I�,ή��Q01���IMW��/K�I����2�45�t�+���/�L�H�Q042��M�.��UN,˩������ �=�      �   ,   x�3�4�4202�54�54U04�26�20�60�J������� 1�
      �   S   x�3�440���/K�)ή�Q0�t���KT����/���2�4ʇ���T�Vg'�(�X&rz�%�)�VfW���e�s��qqq g�      �   1   x�3�4�4202�54�52T0��21�20�60�J�HY�B�b���� 1 
     