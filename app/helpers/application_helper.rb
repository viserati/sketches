module ApplicationHelper

  # if on active page color = white
  # if not on active page color = regular
  # takes arguments: 'link', 'what page its on', 'url', 'change font color'
  def active_link_to (nav_link, contrl, action, url, style )
    if controller_name == contrl && action_name == action
      return link_to nav_link, url, id: style
    else
      return link_to nav_link, url, class:style
    end
  end

  def your_country
    countries = [   " ",
                    "Afghanistan",
                    "Albania",
                    "Algeria",
                    "Andorra",
                    "Angola",
                    "Antigua and Barbuda",
                    "Argentina",
                    "Armenia",
                    "Aruba",
                    "Australia",
                    "Austria",
                    "Azerbaijan", 
                    " "]
  countries.each do |country|
    my_country = "#{country}"


  end

    # my_country = options_for_select(['Country1', 'Country2', 'Country3', 'Country4'])
    return countries
  end




end
