import {Socket} from "phoenix"

// let socket = new Socket("/ws")
// socket.connect()
// socket.join("topic:subtopic", {}).receive("ok", chan => {
// })

// $.getScript("add_news.js", function(){
//    console.log("loaded add_news file");
// });



let AddNews = React.createClass({
  onArticleAdded() {
    console.log("Yay")
  },

  onErrorOccured() {
    console.log("Oh no")
  },

  handleClick() {
    $.ajax({
      url: "/test",
      type: "POST",
      contentType: 'application/javascript',
      dataType: 'json',
      success: this.onArticleAdded,
      error: this.onErrorOccured
    })
  },

  render() {
    return(
      <div>
        <input> Titel </input>
        <input> Artikel </input>
        <button onClick={this.handleClick}> Speichern </button>
      </div>

    )
  }
})

ReactDOM.render(<AddNews />, document.getElementById("dashboard"))


let App = {

}

export default App

