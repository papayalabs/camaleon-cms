Rails.application.config.to_prepare do
  CamaleonCms::CategoryDecorator.class_eval do
    def the_url(*args)
      args = args.extract_options!
      args[:category_id] = the_id
      args[:label] = I18n.t("routes.category", default: "category")
      args[:title] = the_title.parameterize.underscore.presence || the_slug
      args[:locale] = @_deco_locale unless args.include?(:locale)
      args[:format] = args[:format] || "html"
      as_path = args.delete(:as_path)
      h.cama_url_to_fixed("cama_category_#{as_path.present? ? "path" : "url"}", args)
    end
  end
end