package com.wjl.fts;

import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * article controller
 *
 * @author <a href="mailto:wlonestar@163.com">wjl</a>
 * @version 0.0.1
 * @time 2023/5/17 12:11
 */
@RestController
@RequestMapping(path = "/article")
public class ArticleController {

  @Resource
  private ArticleService articleService;

  /**
   * find all articles
   *
   * @return list of articles
   */
  @RequestMapping(method = RequestMethod.GET, path = "/")
  public List<Article> findAll() {
    return articleService.findAll();
  }

  /**
   * search articles by keyword
   *
   * @param keyword keyword to match article's title and content
   * @return list of articles
   */
  @RequestMapping(method = RequestMethod.GET, path = "/search")
  public List<Article> searchByKeyword(@RequestParam(name = "query") String keyword) {
    return articleService.searchByKeyword(keyword);
  }

}
