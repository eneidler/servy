defmodule Servy.Conv do
    defstruct method: "", 
                path: "", 
                resp_body: "", 
                status: nil, 
                params: %{}

    def full_status(conv) do
        "#{conv.status} #{status_reason(conv.status)}"
    end

    defp status_reason(code) do
        %{
          200 => "OK",
          201 => "Created",
          401 => "Unauthorized",
          403 => "Forbidden",
          404 => "Not Found",
          500 => "Internal Server Error"
        }[code]
      end

end

"""
defp status_reason(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }[code]
  end

  The keys are numbers, not atoms, so we need to use the square-bracket syntax to access the reason associated with the code.
  
  Alternatively, you could use a temporary variable for the map, like so:
  
  defp status_reason(code) do
    codes = %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }
    codes[code]
  end
  """