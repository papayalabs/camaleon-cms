Rails.application.config.to_prepare do 
  CamaleonCms::Admin::PostTypeHelper.module_eval do
    def post_type_taxonomy_html_(categories, taxonomy="categories", name="categories", type="checkbox", values=[], class_cat="", required = false)
      return "#{t('camaleon_cms.admin.post_type.message.no_created_html', taxonomy: (taxonomy == "categories")? t('camaleon_cms.admin.table.categories') : t('camaleon_cms.admin.table.tags') )}" if categories.count < 1
      html = "<ul class='#{class_cat}'>"
      categories.decorate.each do |f|
        html += "<li>"
        html +=  "<label class='class_slug' data-post_link_edit='#{f.the_edit_url}'> "
        html +=  "<input data-error-place='#validation_error_list_#{name}' type='#{type}' name='#{name}[]' #{ values.include?(f.id) ? "checked" : ""} value='#{f.id}' class = '#{ "required" if required }' />"
        html += "#{f.the_title} </label> "
        html +=  post_type_html_inputs(f, "children" , name, type, values, "children")  if f.children.present?
        html += "</li>"
      end

      html += "</ul><div id='validation_error_list_#{name}'></div>"
      return html
    end
  end
end