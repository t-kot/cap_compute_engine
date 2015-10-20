require 'cap_compute_engine/instance'

module CapComputeEngine
  class InstanceList
    def initialize(*args)
      @instances = []
    end

    def get
      json = `gcloud compute instances list --format json`

      list = JSON.parse(json)

      list.each do |instance_hash|
        @instances << Instance.new(instance_hash)
      end

      self
    end

    def with_tag(tag_name)
      @instances.select { |ins| ins.has_tag?(tag_name) }
    end
  end
end
