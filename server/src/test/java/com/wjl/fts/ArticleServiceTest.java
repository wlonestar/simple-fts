package com.wjl.fts;

import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
class ArticleServiceTest {

  @Resource
  ArticleService articleService;

  @Test
  public void searchByKeyword() {
    articleService.searchByKeyword("数据库").forEach(System.out::println);
  }

}
