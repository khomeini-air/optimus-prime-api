defmodule OptimusPrimeWeb.ErrorView do
  use OptimusPrimeWeb, :view

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("400.json", %{messages: messages}) do
    %{
      errors: %{
        detail: messages
      }
    }
  end
end
