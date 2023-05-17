package com.wjl.fts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author <a href="mailto:wlonestar@163.com">wjl</a>
 * @version 0.0.1
 * @time 2023/5/17 12:02
 */
@Repository
public interface ArticleRepository extends JpaRepository<Article, Long> {

  @Query(value = "select * from article where fts @@ to_tsquery(?1)", nativeQuery = true)
  List<Article> findByKeyword(String keyword);

}
