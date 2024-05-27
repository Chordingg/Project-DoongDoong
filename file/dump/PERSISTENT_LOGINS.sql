CREATE TABLE persistent_logins (
  username VARCHAR(64) NOT NULL,
  series VARCHAR(64) NOT NULL primary key,
  token VARCHAR(64) NOT NULL,
  last_used timestamp not null
);

drop table persistent_logins;

select * from persistent_logins;

commit;
