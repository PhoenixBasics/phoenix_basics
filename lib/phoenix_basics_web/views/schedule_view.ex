defmodule BasicsWeb.ScheduleView do
  use BasicsWeb, :view
  alias Basics.Schedule.Category
  alias Basics.Schedule.Audience

  @doc """
  Ok - this bit is a little advanced.

  `link/1` (like more html helpers) will accept a block as it's inner_html content
  in lieu of having the linked context as teh first parameter of `link/2`.

  In the block we can place a list of strings - in this case the results of a
  pair of content_tags.  This method returns a list but once the view finnishes
  rendering it'll be an HTML string... somthing like:

    <a href="/schedule?date=2018-09-06">
      <div class="dates__name smalltext">Thu</div>
      <div class="dates__number"> 6</div>
    </a>
  """
  def date_link(conn, date) do
    link(to: schedule_path(conn, :index, date: Timex.format!(date, "%Y-%m-%d", :strftime))) do
      date_link_content(date)
    end
  end

  defp date_link_content(date) do
    [
      content_tag(:div, Timex.format!(date, "%a", :strftime), class: "dates__name smalltext"),
      content_tag(:div, Timex.format!(date, "%e", :strftime), class: "dates__number")
    ]
  end

  def meta_links(conn, items, type) when is_list items do
    for item <- items do
      link item.name, to: schedule_path(conn, :index, build_index_params(item)),
                      class: "btn talk__#{type}"
    end
  end

  def full_name(speakers) do
    speakers
    |> Enum.map(fn(%{first: first, last: last}) -> "#{first} #{last}" end)
    |> Enum.join(" && ")
  end

  def build_index_params(%Category{slug: slug}), do: [category: slug]
  def build_index_params(%Audience{slug: slug}), do: [audience: slug]
end
