require 'cap_compute_engine/instance'

module CapComputeEngine
  class InstanceList
    def initialize(instances = [])
      @instances = instances
    end

    def self.get
      json = `gcloud compute instances list --format json`

      array = JSON.parse(json)
      InstanceList.new(array.map { |instance_hash| Instance.new(instance_hash) })
    end

    def with_tag(tag_name)
      InstanceList.new(@instances.select { |ins| ins.has_tag?(tag_name) })
    end

    def external_ips
      @instances.map(&:external_ip)
    end

    def authorize_cloud_sql(name)
      `gcloud sql instances patch #{name} --authorized-networks "#{external_ips.join(',')}"`
    end
  end
end
