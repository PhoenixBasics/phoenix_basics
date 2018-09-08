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
    link(to: schedule_path(conn, :index, schedule_path_params(conn, date))) do
      date_link_content(date)
    end
  end

  def schedule_path_params(conn, date) do
    []
    |> Keyword.put(:date, Timex.format!(date, "%Y-%m-%d", :strftime))
    |> schedule_path_params(conn, :category)
    |> schedule_path_params(conn, :audience)
  end
  def schedule_path_params(keys, %{assigns: %{current_schedule_params: %{categories: categories}}}, :category) do
    Keyword.put(keys, :category, Enum.map(categories, fn(%{slug: slug}) -> slug end))
  end
  def schedule_path_params(keys, %{assigns: %{current_schedule_params: %{audiences: audiences}}}, :audience) do
    Keyword.put(keys, :audience, Enum.map(audiences, fn(%{slug: slug}) -> slug end))
  end
  def schedule_path_params(keys, _, _), do: keys

  def date_link_class(conn, date) do
    conn.assigns.current_schedule_params[:day]
    |> Timex.format!("%a %e", :strftime)
    |> Kernel.==(Timex.format!(date, "%a %e", :strftime))
    |> if(do: " active")
  end

  defp date_link_content(date) do
    [
      content_tag(:div, Timex.format!(date, "%a", :strftime), class: "dates__name smalltext"),
      content_tag(:div, Timex.format!(date, "%e", :strftime), class: "dates__number")
    ]
  end

  def yesterday_link(%{assigns: %{current_schedule_params: params}} = conn) do
    cond do
      is_nil params[:last_day] -> ""
      Enum.count(params[:all_dates]) <= 2 -> ""
      true ->
        link(to: schedule_path(conn, :index, date: Timex.format!(params[:last_day], "%Y-%m-%d", :strftime))) do
          [content_tag(:i, "", class: "fas fa-arrow-left")]
        end
    end
  end

  def tomorrow_link(%{assigns: %{current_schedule_params: params}} = conn) do
    cond do
      is_nil params[:next_day] -> ""
      Enum.count(params[:all_dates]) <= 2 -> ""
      true ->
        link(to: schedule_path(conn, :index, date: Timex.format!(params[:next_day], "%Y-%m-%d", :strftime))) do
          [content_tag(:i, "", class: "fas fa-arrow-right")]
        end
    end
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

  def build_index_params(%Category{slug: slug}), do: [category: [slug]]
  def build_index_params(%Audience{slug: slug}), do: [audience: [slug]]

  def filter_tags(%{assigns: %{current_schedule_params: params}} = conn) do
    filter_tags(params, :category) ++ filter_tags(params, :audience)
  end

  def filter_tags(%{categories: categories}, :category) do
    for category <- categories do
      content_tag(:span, "+ #{category.name}")
    end
  end
  def filter_tags(%{audiences: audiences}, :audience) do
    for audience <- audiences do
      content_tag(:span, "+ #{audience.name}")
    end
  end
  def filter_tags(_, _), do: []
end
