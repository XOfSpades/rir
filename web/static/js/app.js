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
        <div>
          <span> Titel </span>
          <input id="new-article-header"/>
        </div>
        <div>
          <span> Text </span>
          <input id="new-article-content"/>
        </div>
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
    article: React.PropTypes.object.isRequired,
    deleteArticleCallback: React.PropTypes.func.isRequired
  },

  deleteArticle() {
    this.props.deleteArticleCallback(this.props.article.id)
  },

  render() {
    return(
      <div>
        <div className="article-header-container">
          <h3> {this.props.article.header} </h3>
        </div>
        <div className="article-content-container">
          {this.props.article.content}
        </div>
        <div className="article-creation-date-container">
          {this.props.article.inserted_at}
        </div>
        <div>
          <button className="btn-delete-article" onClick={this.deleteArticle}>
            Delete
          </button>
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
    articles: React.PropTypes.array.isRequired,
    deleteArticleCallback: React.PropTypes.func.isRequired
  },

  renderArticles: function() {
    var that = this
    return this.props.articles.map((function(article) {
      return <Article key={article.id}
                      article={article}
                      deleteArticleCallback={that.props.deleteArticleCallback} />;
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
    console.log("load article");
    var that = this
    $.ajax({
      url: "/api/aktuelles",
      type: "GET",
      contentType: 'application/json',
      dataType: 'json',
      success: function(response) {
        that.setState({articles: response.articles})
      },
      error: console.log("An error occured when loading")
    })
  },

  articleAdded(header, content) {
    console.log("add article");
    var that = this
    $.ajax({
      url: "/api/aktuelles",
      type: "POST",
      contentType: 'application/json',
      dataType: 'json',
      data: JSON.stringify({ header: header, content: content }),
      success: function(_response) {
        that.loadArticles()
      },
      error: console.log("An error occured when creating")
    })
  },

  deleteArticle(articleId) {
    console.log("delete article");
    var that = this
    $.ajax({
      url: "/api/aktuelles/" + articleId,
      type: "DELETE",
      contentType: 'application/json',
      dataType: 'json',
      success: function(_response){
        that.loadArticles()
      },
      error: console.log("An error occured when deleting")
    })
  },

  showNewArticleForm() {
    return <AddArticle articleAdded={this.articleAdded} />;
  },

  showArticles() {
    return <ArticleList articles={this.state.articles}
                        deleteArticleCallback={this.deleteArticle} />;
  },

  render() {
    console.log("render")
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

