defmodule Rir.ContactsController do
  use Timex
  use Rir.Web, :controller
  alias Rir.Contact

  def index(conn, _params) do
    if Rir.Session.logged_in?(conn) do
      timezone = Timex.timezone("Europe/Berlin", Timex.DateTime.today)
      contacts = Rir.Repo.all(Contact)
      |> Enum.map(
      fn (contact) ->
        dt = Timex.Timezone.convert(contact.inserted_at, timezone)
        IO.inspect contact.inserted_at
        IO.inspect dt
          Map.put(contact, "inserted_at", dt
                      )
        end)

      render conn, "index.html", contacts: contacts
    else
      render conn, "form.html"
    end
  end

  def create(conn, %{"contact" => contact_params}) do
    { :ok, _contact } = Contact.changeset(
      %Contact{},
      contact_params
    ) |> Rir.Repo.insert

    redirect(conn, to: "/kontakt")
  end

  def delete(conn, params) do
    if Rir.Session.logged_in?(conn) do
      {contact_id, ""} = Integer.parse(params["id"])
      { status, responded_contact } = Contact.destroy(contact_id)

      if status == :error do
        conn = put_status(conn, 404)
      end
    else
      conn = put_status(conn, 401)
    end
    redirect(conn, to: "/kontakt")
  end
end
