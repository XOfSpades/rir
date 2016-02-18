defmodule Rir.Authenticate.Password do
@doc """
  Handles the encryption of Passwords and the comparison of them
"""
  def salt_and_hash(password) do
    String.valid?(password)
    Comeonin.Bcrypt.hashpwsalt(password)
  end

  def is_password(input, password_hash) do
    String.valid?(input)
    String.valid?(password_hash)
    Comeonin.Bcrypt.checkpw(input, password_hash)
  end
end
