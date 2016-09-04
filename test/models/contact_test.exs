defmodule Rir.ContactTest do
  use Rir.ModelCase, async: false

  alias Rir.Contact

  @valid_attrs %{
    header: "some content",
    message: "some content",
    first_name: "Esmeralda",
    last_name: "Densivilla",
    email: "E@d.com",
    phone: "0190/666 666"
  }

  test "changeset with valid attributes" do
    changeset = Contact.changeset(%Contact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    keys = [:header, :message, :first_name, :last_name, :email, :phone]
    for key <- keys do
      changeset = Contact.changeset(%Contact{}, Map.delete(@valid_attrs, key))
      refute changeset.valid?
    end
  end

  test "delete an existing contact" do
    {:ok, contact} = (Contact.changeset(%Contact{}, @valid_attrs)
      |> Rir.Repo.insert)
    {status, response} = Contact.destroy(contact.id)

    fields = [
      :message,
      :header,
      :inserted_at,
      :updated_at,
      :id,
      :first_name,
      :last_name,
      :phone,
      :email
    ]

    assert status == :ok
    assert Map.take(response, fields) == Map.take(contact, fields)
  end

  test "return an error when an contact doesn't exist" do
    {status, response} = Contact.destroy(1234567)

    assert status == :error
    assert response == nil
  end
end
