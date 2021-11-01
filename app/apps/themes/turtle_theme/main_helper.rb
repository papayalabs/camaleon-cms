module Themes::TurtleTheme::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  def turtle_theme_settings(theme)
    # callback to save custom values of fields added in my_theme/views/admin/settings.html.erb
  end

  # callback called after theme installed
  def turtle_theme_on_install_theme(theme)
    # # Sample Custom Field
    unless theme.get_field_groups.where(slug: "fields").any?
       group = theme.add_field_group({name: "Slider Settings", is_repeat: true, slug: "fields", description: ""})
       group.add_field({"name"=>"Title", "slug"=>"home_slider_title"},{field_key: "text_box"})
       group.add_field({"name"=>"Description", "slug"=>"home_slider_description"},{field_key: "text_box"})
       group.add_field({"name"=>"Display Button", "slug"=>"home_slider_display_button"},{field_key: "checkbox"})
       group.add_field({"name"=>"Button Description", "slug"=>"home_slider_button_description"},{field_key: "text_box"})
       group.add_field({"name"=>"Button URL", "slug"=>"home_slider_button_url"},{field_key: "url"})
       group.add_field({"name"=>"Background image", "slug"=>"home_slider_bg_image"},{field_key: "image"})
     end

    # # Sample Meta Value
    # theme.set_meta("installed_at", Time.current.to_s) # save a custom value
  end

  # callback executed after theme uninstalled
  def turtle_theme_on_uninstall_theme(theme)
  end
end
