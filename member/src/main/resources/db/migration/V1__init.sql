create table login_token
(
    id           bigint       not null auto_increment,
    created_date datetime(6)  not null,
    updated_date datetime(6)  not null,
    disabled     bit(1)       not null,
    member_id    varchar(8),
    token        varchar(255),
    primary key (id)
) engine = InnoDB;

create table member
(
    id                 varchar(8)   not null,
    created_date       datetime(6)  not null,
    updated_date       datetime(6)  not null,
    consent_by_member  bit(1)       not null,
    consent_by_privacy bit(1)       not null,
    address            varchar(100),
    password           varchar(255),
    primary key (id),
    unique (address)
) engine = InnoDB;

create table role
(
    id           bigint       not null auto_increment,
    created_date datetime(6)  not null,
    updated_date datetime(6)  not null,
    role_type    varchar(255),
    primary key (id),
    unique (role_type)
) engine = InnoDB;

create table member_roles
(
    member_id varchar(8) not null,
    role_id   bigint     not null
) engine = InnoDB;

alter table member_roles
    add constraint fk_member_roles_to_member
        foreign key (member_id)
            references member (id);

alter table member_roles
    add constraint fk_member_roles_to_role
        foreign key (role_id)
            references role (id);
