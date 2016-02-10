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

  handleClick() {
    var header = document.getElementById('new-article-header').value;
    var content = document.getElementById('new-article-content').value;
    this.props.articleAdded(header, content);
  },

  render() {
    return(
      <div>
        Titel <input id="new-article-header"/>
        Article <input id="new-article-content"/>
        <button onClick={this.handleClick}> Speichern </button>
      </div>
    )
  }
})

//##############################################################################
//################################## Article ###################################
//##############################################################################

let Article = React.createClass({
  propTypes: {
    article: React.PropTypes.object.isRequired
  },

  render() {
    return(
      <div>
        <div className="article-header-container">
          {this.props.article.header}
        </div>
        <div className="article-content-container">
          {this.props.article.content}
        </div>
        <div className="article-creation-date-container">
          {this.props.article.inserted_at}
        </div>
      </div>
    )
  }
})

//##############################################################################
//################################ ArticleList #################################
//##############################################################################

let ArticleList = React.createClass({
  propTypes: {
    articles: React.PropTypes.array.isRequired
  },

  renderArticles: function() {
    return this.props.articles.map((function(article) {
    //   return function(article) {
      return <Article key={article.id} article={article} />;
    //   };
    }))
  },

  render() {
    return(
      <div>
        {this.renderArticles()}
      </div>
    )
  }
})

//##############################################################################
//############################# ArticleContainer ###############################
//##############################################################################


let ArticleContainer = React.createClass({
  componentDidMount() {
    this.loadArticles();
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
    return <AddArticle articleAdded={this.articleAdded} />;
  },

  showArticles() {
    return <ArticleList articles={this.state.articles} />;
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

