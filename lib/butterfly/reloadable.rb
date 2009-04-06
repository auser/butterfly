module Reloadable
  # Force reload of this file
  module ClassMethods
    def reload_files!
      @reloading = true
      reloadable_files.each do |f|
        $LOADED_FEATURES.delete(f)
        ::Kernel.load f
      end
      @reloading = false
    end

    def require_reloadable_files *files
      files.each do |a| 
        fpath = File.expand_path(a.index(".rb") ? a : "#{a}.rb")
        reloadable_files << fpath 
        require fpath
      end
    end

    def reloadable_files
      @reloadable_files ||= []
    end
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
  end
  
end