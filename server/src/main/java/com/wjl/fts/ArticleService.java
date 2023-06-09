package com.wjl.fts;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * @author <a href="mailto:wlonestar@163.com">wjl</a>
 * @version 0.0.1
 * @time 2023/5/17 12:09
 */
@Service
public class ArticleService {

  @Resource
  private ArticleRepository articleRepository;

  public List<Article> findAll() {
    return articleRepository.findAll();
  }

  public List<Article> searchByKeyword(String keyword) {
    if (keyword.trim().isEmpty()) {
      return articleRepository.findAll();
    } else {
      return articleRepository.findByKeyword(keyword);
    }
  }

}
