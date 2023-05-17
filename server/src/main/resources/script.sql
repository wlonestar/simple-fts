create extension pg_jieba;

DROP TABLE IF EXISTS article;
CREATE TABLE article (
  id      serial PRIMARY KEY,
  title   varchar(40) not null,
  content text not null
);

INSERT INTO article(id, title, content)
VALUES
  (1, 'PostgreSQL 全文搜索', 'PostgreSQL 全文搜索对于中文支持非常好，可以实现中文全文检索。'),
  (2, '数据库管理工具', '数据库管理员可以使用各种工具来管理数据库，例如 PGAdmin、Navicat、SQLyog等。'),
  (3, 'OLAP分析技术', 'OLAP（联机分析处理）是一种用于在大型数据集上执行复杂的多维分析的技术。'),
  (4, '数据库设计原则', '数据库设计必须遵循一些原则，例如范式、数据完整性、关系等。');

alter table article
  add column fts tsvector;

update article
set fts = setweight(to_tsvector('jiebacfg', title), 'A') || setweight(to_tsvector('jiebacfg', content), 'B');
create index article_fts_gin_index on article using gin(fts);

drop trigger if exists trig_article_insert_update on article;
create trigger trig_article_insert_update
  before insert or update of title, "content" on article
  for each row
  execute procedure tsvector_update_trigger(fts, 'public.jiebacfg', title, content);

insert into article
values (5, '数据库安全性', '数据库管理员必须确保数据库的安全性，例如设置强密码、访问控制、备份和恢复等。');

select title from article where fts @@ to_tsquery('搜索');
select title from article where fts @@ to_tsquery('技术 & 数据');
select title from article where fts @@ to_tsquery('搜索 | 数据 | 处理');
