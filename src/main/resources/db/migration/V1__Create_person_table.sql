create table public.PERSON (
    ID serial not null
        constraint PERSON_pk
            primary key,
    NAME VARCHAR(100) not null
);