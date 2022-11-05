create table sg.failed_jobs
(
    id         bigint unsigned auto_increment
        primary key,
    uuid       varchar(255)                          not null,
    connection text                                  not null,
    queue      text                                  not null,
    payload    longtext                              not null,
    exception  longtext                              not null,
    failed_at  timestamp default current_timestamp() not null,
    constraint failed_jobs_uuid_unique
        unique (uuid)
)
    collate = utf8mb4_unicode_ci;

create table sg.filiais
(
    id         bigint unsigned auto_increment
        primary key,
    filial     varchar(30) not null,
    created_at timestamp   null,
    updated_at timestamp   null
)
    collate = utf8mb4_unicode_ci;

create table sg.fornecedores
(
    id         bigint unsigned auto_increment
        primary key,
    nome       varchar(50)  not null,
    site       varchar(150) null,
    created_at timestamp    null,
    updated_at timestamp    null,
    uf         varchar(2)   not null,
    email      varchar(150) not null,
    deleted_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table sg.migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table sg.motivo_contatos
(
    id             bigint unsigned auto_increment
        primary key,
    motivo_contato varchar(20) not null,
    created_at     timestamp   null,
    updated_at     timestamp   null
)
    collate = utf8mb4_unicode_ci;

create table sg.password_resets
(
    email      varchar(255) not null,
    token      varchar(255) not null,
    created_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create index password_resets_email_index
    on sg.password_resets (email);

create table sg.personal_access_tokens
(
    id             bigint unsigned auto_increment
        primary key,
    tokenable_type varchar(255)    not null,
    tokenable_id   bigint unsigned not null,
    name           varchar(255)    not null,
    token          varchar(64)     not null,
    abilities      text            null,
    last_used_at   timestamp       null,
    expires_at     timestamp       null,
    created_at     timestamp       null,
    updated_at     timestamp       null,
    constraint personal_access_tokens_token_unique
        unique (token)
)
    collate = utf8mb4_unicode_ci;

create index personal_access_tokens_tokenable_type_tokenable_id_index
    on sg.personal_access_tokens (tokenable_type, tokenable_id);

create table sg.site_contatos
(
    id             bigint unsigned auto_increment
        primary key,
    created_at     timestamp   null,
    updated_at     timestamp   null,
    nome           varchar(50) not null,
    telefone       varchar(20) not null,
    email          varchar(80) not null,
    motivo_contato int         not null,
    mensagem       text        not null
)
    collate = utf8mb4_unicode_ci;

create table sg.unidades
(
    id         bigint unsigned auto_increment
        primary key,
    unidade    varchar(5)  not null,
    descricao  varchar(30) not null,
    created_at timestamp   null,
    updated_at timestamp   null
)
    collate = utf8mb4_unicode_ci;

create table sg.produtos
(
    id         bigint unsigned auto_increment
        primary key,
    nome       varchar(100)    not null,
    descricao  text            null,
    peso       int             null,
    created_at timestamp       null,
    updated_at timestamp       null,
    unidade_id bigint unsigned not null,
    constraint produtos_unidade_id_foreign
        foreign key (unidade_id) references sg.unidades (id)
)
    collate = utf8mb4_unicode_ci;

create table sg.produto_detalhes
(
    id          bigint unsigned auto_increment
        primary key,
    produto_id  bigint unsigned not null,
    comprimento double(8, 2)    not null,
    largura     double(8, 2)    not null,
    altura      double(8, 2)    not null,
    created_at  timestamp       null,
    updated_at  timestamp       null,
    unidade_id  bigint unsigned not null,
    constraint produto_detalhes_produto_id_unique
        unique (produto_id),
    constraint produto_detalhes_produto_id_foreign
        foreign key (produto_id) references sg.produtos (id),
    constraint produto_detalhes_unidade_id_foreign
        foreign key (unidade_id) references sg.unidades (id)
)
    collate = utf8mb4_unicode_ci;

create table sg.produto_filiais
(
    id             bigint unsigned auto_increment
        primary key,
    filial_id      bigint unsigned not null,
    produto_id     bigint unsigned not null,
    preco_venda    decimal(8, 2)   not null,
    estoque_minimo int             not null,
    estoque_maximo int             not null,
    created_at     timestamp       null,
    updated_at     timestamp       null,
    constraint produto_filiais_filial_id_foreign
        foreign key (filial_id) references sg.filiais (id),
    constraint produto_filiais_produto_id_foreign
        foreign key (produto_id) references sg.produtos (id)
)
    collate = utf8mb4_unicode_ci;

create table sg.users
(
    id                bigint unsigned auto_increment
        primary key,
    name              varchar(255) not null,
    email             varchar(255) not null,
    email_verified_at timestamp    null,
    password          varchar(255) not null,
    remember_token    varchar(100) null,
    created_at        timestamp    null,
    updated_at        timestamp    null,
    constraint users_email_unique
        unique (email)
)
    collate = utf8mb4_unicode_ci;


