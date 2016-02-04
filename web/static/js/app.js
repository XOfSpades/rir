import {Socket} from "phoenix"

// let socket = new Socket("/ws")
// socket.connect()
// socket.join("topic:subtopic", {}).receive("ok", chan => {
// })

// $.getScript("add_news.js", function(){
//    console.log("loaded add_news file");
// });

//##############################################################################
//################################# AddArticle #################################
//##############################################################################

let AddArticle = React.createClass({
  propTypes: {
    articleAdded: React.PropTypes.func.isRequired
  },

  getInitialState() {
    return { header: "", content: "" }
  },

  handleClick() {
    this.props.articleAdded(this.state.header, this.state.content)
  },

  adaptHeader(event) {
    console.log(this.state.header)
    this.setState({header: event.target.value});
  },

  adaptContent(event) {
    console.log(this.state.content)
    this.setState({content: event.target.value});
  },

  render() {
    return(
      <div>
        <input onChange={this.adaptHeader}> Titel </input>
        <input onChange={this.adaptContent}> Artikel </input>
        <button onClick={this.handleClick}> Speichern </button>
      </div>
    )
  }
})

//##############################################################################
//################################ ArticleList #################################
//##############################################################################

let ArticleList = React.createClass({
  render() {
    return(
      <div>
        <p>foo</p>
      </div>
    )
  }
})

//##############################################################################
//############################# ArticleContainer ###############################
//##############################################################################


let ArticleContainer = React.createClass({
  componentDidMount() {
    this.loadArticles()
  },

  getInitialState() {
    return { articles: [] }
  },


  loadArticles() {
    var that = this
    $.ajax({
      url: "/api/aktuelles",
      type: "GET",
      contentType: 'application/json',
      dataType: 'json',
      success: function(response) {
        that.setState({articles: response.articles})
      },
      error: this.onErrorOccured
    })
  },

  articleAdded(header, content) {
    var that = this
    console.log(header)
    console.log(content)
    $.ajax({
      url: "/api/aktuelles",
      type: "POST",
      contentType: 'application/json',
      dataType: 'json',
      data: JSON.stringify({ header: header, content: content }),
      success: that.loadArticles(),
      error: console.log("An error occured")
    })
  },

  showNewArticleForm() {
    return <AddArticle articleAdded={this.articleAdded} />
  },

  showArticles() {
    return <ArticleList articles={this.state.articles} />
  },

  render() {
    //TODO: set loading indicator
    return(
      <div>
        <div className="new-articles-container">
          {this.showNewArticleForm()}
        </div>
        <div className="articles-container">
          {this.showArticles()}
        </div>
      </div>
    )
  }
})

ReactDOM.render(
  <ArticleContainer />, document.getElementById("articles-container")
)

let App = {

}

export default App

