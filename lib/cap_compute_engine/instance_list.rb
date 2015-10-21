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
      list = InstanceList.new
      list.instances = @instances.select { |ins| ins.has_tag?(tag_name) }
      list
    end

    def external_ips
      @instances.map(&:external_ip)
    end

    def authorize_cloud_sql(name)
      `gcloud sql instances patch #{name} --authorized-networks "#{external_ips.join(',')}"`
    end
  end
end
