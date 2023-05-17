import { useState } from 'react'
import { client, useMount } from './utils'

interface Article {
  id: number
  title: string
  content: string
}

interface ListProps {
  articles: Article[]
}

const List = ({articles}: ListProps) => {
  return (
    <table>
      <thead>
      <tr>
        <th>id</th>
        <th>标题</th>
        <th>内容</th>
      </tr>
      </thead>
      <tbody>
      {
        articles.map(article => (
          <tr key={article.id}>
            <td>{article.id}</td>
            <td>{article.title}</td>
            <td>{article.content}</td>
          </tr>
        ))
      }
      </tbody>
    </table>
  )
}

interface SearchProps {
  articles: Article[]
  setArticles: (articles: SearchProps['articles']) => void
}

const Search =({setArticles}: SearchProps) => {
  const [param, setParam] = useState<string>('')

  const handleClick = () => {
    client({
      method: 'GET',
      url: '/article/search',
      params: {
        query: param
      }
    }).then((res) => {
      setArticles(res.data)
    })
  }

  return (
    <form>
      <input
        type="text"
        value={param}
        onChange={(evt) => {
          setParam(evt.target.value)
        }}
      />
      <button type="button" onClick={handleClick}>搜索</button>
    </form>
  )
}

function App() {
  const [articles, setArticles] = useState<Article[]>([])

  useMount(() => {
    client({
      method: 'GET',
      url: '/article/'
    }).then((res) => {
      setArticles(res.data)
    })
  })

  return (
    <>
      <Search articles={articles} setArticles={setArticles} />
      <List articles={articles} />
    </>
  )
}

export default App
