module Themes::HomeoTheme::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  def homeo_theme_settings(theme)
    # callback to save custom values of fields added in my_theme/views/admin/settings.html.erb
  end

  # callback called after theme installed
  def homeo_theme_on_install_theme(theme)
    unless current_site.the_post_types.first.get_field_groups.where(slug: "section").any?
      group = current_site.the_post_types.first.add_field_group({name: "Sections", slug: "section"}, 'Post')
      group.add_field({"name"=>"Sections", "slug"=>"home_sections"},{field_key: "select", multiple_options: [
        {title: "Normal", value: "normal", default: true},
        {title: "Mustread", value: "mustread"},
        {title: "Highlight", value: "highlight"},
        {title: "Popular", value: "popular"},
        {title: "Editor Pick", value: "editor_pick"},
      ]})
    end
    unless current_site.the_post_types.first.get_field_groups.where(slug: "_group-post-date").any?
      group = current_site.the_post_types.first.add_field_group({name: "Post Date", slug: "_group-post-date"}, 'Post')
      group.add_field({"name"=>"Post Date", "slug"=>"post-date"},{field_key: "date", required: true})
    end
     
    # # Sample Custom Field
    # unless theme.get_field_groups.where(slug: "fields").any?
    #   group = theme.add_field_group({name: "Main Settings", slug: "fields", description: ""})
    #   group.add_field({"name"=>"Background color", "slug"=>"bg_color"},{field_key: "colorpicker"})
    #   group.add_field({"name"=>"Links color", "slug"=>"links_color"},{field_key: "colorpicker"})
    #   group.add_field({"name"=>"Background image", "slug"=>"bg"},{field_key: "image"})
    # end

    # # Sample Meta Value
    # theme.set_meta("installed_at", Time.current.to_s) # save a custom value
  end

  # callback executed after theme uninstalled
  def homeo_theme_on_uninstall_theme(theme)
  end
end
