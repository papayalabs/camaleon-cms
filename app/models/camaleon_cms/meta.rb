module CamaleonCms
  class Meta < CamaleonRecord
    self.table_name = "#{PluginRoutes.static_system_info['db_prefix']}metas"
    self.primary_key = :id if PluginRoutes.static_system_info['use_uuid']
    # attr_accessible :objectid, :key, :value, :object_class
  end
end
