import {useEffect, useState} from "react";
import {useDebounce} from "./utils.ts";
import * as qs from "qs"

interface Article {
  id: number
  title: string
  content: string
}

const apiUrl = 'http://localhost:8088'

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
  param: string
  setParam: (param: SearchProps['param']) => void
}

const Search =({param, setParam}: SearchProps) => {
  return (
    <form>
      <input
        type="text"
        value={param}
        onChange={(evt) => {
          setParam(
            evt.target.value
          )
        }}
      />
    </form>
  )
}

function App() {

  const [articles, setArticles] = useState([])

  const [param, setParam] = useState('')
  const debouncedParam = useDebounce(param, 200)

  // useMount(() => {
  //   fetch(`${apiUrl}/article/`).then(async response => {
  //     if (response.ok) {
  //       setArticles(await response.json())
  //     }
  //   })
  // })

  useEffect(() => {
    fetch(`${apiUrl}/article/search?query=${qs.stringify(debouncedParam)}`)
      .then((async (response) => {
        if (response.ok) {
          setArticles(await response.json())
        }
      }))
  }, [debouncedParam])

  return (
    <>
      <Search articles={articles} param={param} setParam={setParam} />
      <List articles={articles} />
    </>
  )
}

export default App
