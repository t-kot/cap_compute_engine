module CapComputeEngine
  class Instance
    def initialize(hash)
      @hash = hash.with_indifferent_access
    end

    def tags
      @hash[:tags][:items] || []
    end

    def external_ip
      @hash[:networkInterfaces].first[:accessConfigs].first[:natIP]
    end

    def has_tag?(tag_name)
      tags.include?(tag_name)
    end
  end
end
