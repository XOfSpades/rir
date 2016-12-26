defmodule ContactsControllerTest do
  use Rir.ConnCase, async: false
  alias Rir.Contact
  alias Rir.Session
  import Mock

  @valid_params %{
    first_name: "Esmeralda",
    last_name: "Densivilla",
    email: "some@mail.de",
    phone: "0190/123456",
    message: "some very complex issue",
    header: "problem in short"
  }

  test "GET /kontakt" do
    conn = get(build_conn(), "/kontakt")
    assert html_response(conn, 200) =~ "Sie haben Fragen? Kontaktieren Sie uns"
  end

  test "POST /contact" do
    conn = post(build_conn(), "/kontakt", %{contact: @valid_params})
    assert html_response(conn, 302)
    contacts = Rir.Repo.all(Contact)
    assert length(contacts) == 1
    [contact|_] = contacts
    assert contact.first_name == @valid_params[:first_name]
    assert contact.last_name == @valid_params[:last_name]
    assert contact.email == @valid_params[:email]
    assert contact.phone == @valid_params[:phone]
    assert contact.header == @valid_params[:header]
    assert contact.message == @valid_params[:message]
  end

  test "DELETE /contact/:id" do
    { :ok, contact } = Contact.changeset(
      %Contact{},
      @valid_params
    ) |> Rir.Repo.insert

    conn = delete(build_conn(), "/kontakt/#{contact.id}")
    assert html_response(conn, 401)
    with_mock Session, [logged_in?: fn(_params) -> true end] do
      conn = delete(build_conn(), "/kontakt/#{contact.id}")
      assert html_response(conn, 302)
      assert Rir.Repo.get(Contact, contact.id) == nil
    end
  end
end

# with_mock Rir.Session, [logged_in?: fn(_parameter) -> true end] do
#       conn = post(conn(), "/aktuelles/#{article.id}", %{ article: new_params})
#       assert html_response(conn, 302)

#       updated_article = Rir.Repo.get!(Rir.Article, article.id)
#       assert updated_article.header == "new content"
#       assert updated_article.content == "new content"
#       assert updated_article.hot_topic == true
#     end
