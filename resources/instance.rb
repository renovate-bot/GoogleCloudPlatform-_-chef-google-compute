# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

# Add our google/ lib
$LOAD_PATH.unshift ::File.expand_path('../libraries', ::File.dirname(__FILE__))

require 'chef/resource'
require 'google/compute/network/delete'
require 'google/compute/network/get'
require 'google/compute/network/post'
require 'google/compute/network/put'
require 'google/compute/property/address_address'
require 'google/compute/property/boolean'
require 'google/compute/property/disk_selflink'
require 'google/compute/property/disktype_selflink'
require 'google/compute/property/enum'
require 'google/compute/property/instance_access_configs'
require 'google/compute/property/instance_alias_ip_ranges'
require 'google/compute/property/instance_disk_encryption_key'
require 'google/compute/property/instance_disks'
require 'google/compute/property/instance_guest_accelerators'
require 'google/compute/property/instance_initialize_params'
require 'google/compute/property/instance_network_interfaces'
require 'google/compute/property/instance_scheduling'
require 'google/compute/property/instance_service_accounts'
require 'google/compute/property/instance_source_image_encryption_key'
require 'google/compute/property/instance_tags'
require 'google/compute/property/integer'
require 'google/compute/property/machinetype_selflink'
require 'google/compute/property/namevalues'
require 'google/compute/property/network_selflink'
require 'google/compute/property/string'
require 'google/compute/property/string_array'
require 'google/compute/property/subnetwork_selflink'
require 'google/compute/property/zone_name'
require 'google/hash_utils'

module Google
  module GCOMPUTE
    # A provider to manage Google Compute Engine resources.
    # rubocop:disable Metrics/ClassLength
    class Instance < Chef::Resource
      resource_name :gcompute_instance

      property :can_ip_forward,
               kind_of: [TrueClass, FalseClass],
               coerce: ::Google::Compute::Property::Boolean.coerce, desired_state: true
      property :cpu_platform,
               String, coerce: ::Google::Compute::Property::String.coerce, desired_state: true
      property :creation_timestamp,
               String, coerce: ::Google::Compute::Property::String.coerce, desired_state: true
      # disks is Array of Google::Compute::Property::InstanceDisksArray
      property :disks,
               Array,
               coerce: ::Google::Compute::Property::InstanceDisksArray.coerce, desired_state: true
      # guest_accelerators is Array of Google::Compute::Property::InstanceGuestAcceleratorsArray
      property :guest_accelerators,
               Array,
               coerce: ::Google::Compute::Property::InstanceGuestAcceleratorsArray.coerce,
               desired_state: true
      property :id,
               Integer, coerce: ::Google::Compute::Property::Integer.coerce, desired_state: true
      property :label_fingerprint,
               String, coerce: ::Google::Compute::Property::String.coerce, desired_state: true
      property :metadata,
               [Hash, ::Google::Compute::Property::NameValues],
               coerce: ::Google::Compute::Property::NameValues.coerce, desired_state: true
      property :machine_type,
               [String, ::Google::Compute::Data::MachineTypeSelfLinkRef],
               coerce: ::Google::Compute::Property::MachineTypeSelfLinkRef.coerce,
               desired_state: true
      property :min_cpu_platform,
               String, coerce: ::Google::Compute::Property::String.coerce, desired_state: true
      property :i_label,
               String,
               coerce: ::Google::Compute::Property::String.coerce,
               name_property: true, desired_state: true
      # network_interfaces is Array of Google::Compute::Property::InstanceNetworkInterfacesArray
      property :network_interfaces,
               Array,
               coerce: ::Google::Compute::Property::InstanceNetworkInterfacesArray.coerce,
               desired_state: true
      property :scheduling,
               [Hash, ::Google::Compute::Data::InstanceScheduling],
               coerce: ::Google::Compute::Property::InstanceScheduling.coerce, desired_state: true
      # service_accounts is Array of Google::Compute::Property::InstanceServiceAccountsArray
      property :service_accounts,
               Array,
               coerce: ::Google::Compute::Property::InstanceServiceAccountsArray.coerce,
               desired_state: true
      property :status,
               String, coerce: ::Google::Compute::Property::String.coerce, desired_state: true
      property :status_message,
               String, coerce: ::Google::Compute::Property::String.coerce, desired_state: true
      property :tags,
               [Hash, ::Google::Compute::Data::InstanceTags],
               coerce: ::Google::Compute::Property::InstanceTags.coerce, desired_state: true
      property :zone,
               [String, ::Google::Compute::Data::ZoneNameRef],
               coerce: ::Google::Compute::Property::ZoneNameRef.coerce, desired_state: true

      property :credential, String, desired_state: false, required: true
      property :project, String, desired_state: false, required: true

      # TODO(alexstephen): Check w/ Chef how to not expose this property yet
      # allow the resource to store the @fetched API results for exports usage.
      property :__fetched, Hash, desired_state: false, required: false

      action :create do
        fetch = fetch_resource(@new_resource, self_link(@new_resource), 'compute#instance')
        if fetch.nil?
          converge_by "Creating gcompute_instance[#{new_resource.name}]" do
            # TODO(nelsonjr): Show a list of variables to create
            # TODO(nelsonjr): Determine how to print green like update converge
            puts # making a newline until we find a better way TODO: find!
            compute_changes.each { |log| puts "    - #{log.strip}\n" }
            create_req = ::Google::Compute::Network::Post.new(
              collection(@new_resource), fetch_auth(@new_resource),
              'application/json', resource_to_request
            )
            @new_resource.__fetched =
              wait_for_operation create_req.send, @new_resource
          end
        else
          @current_resource = @new_resource.clone
          @current_resource.can_ip_forward =
            ::Google::Compute::Property::Boolean.api_parse(fetch['canIpForward'])
          @current_resource.cpu_platform =
            ::Google::Compute::Property::String.api_parse(fetch['cpuPlatform'])
          @current_resource.creation_timestamp =
            ::Google::Compute::Property::String.api_parse(fetch['creationTimestamp'])
          @current_resource.guest_accelerators =
            ::Google::Compute::Property::InstanceGuestAcceleratorsArray.api_parse(
              fetch['guestAccelerators']
            )
          @current_resource.id = ::Google::Compute::Property::Integer.api_parse(fetch['id'])
          @current_resource.label_fingerprint =
            ::Google::Compute::Property::String.api_parse(fetch['labelFingerprint'])
          @current_resource.metadata =
            ::Google::Compute::Property::NameValues.api_parse(fetch['metadata'])
          @current_resource.machine_type =
            ::Google::Compute::Property::MachineTypeSelfLinkRef.api_parse(fetch['machineType'])
          @current_resource.min_cpu_platform =
            ::Google::Compute::Property::String.api_parse(fetch['minCpuPlatform'])
          @current_resource.i_label = ::Google::Compute::Property::String.api_parse(fetch['name'])
          @current_resource.network_interfaces =
            ::Google::Compute::Property::InstanceNetworkInterfacesArray.api_parse(
              fetch['networkInterfaces']
            )
          @current_resource.scheduling =
            ::Google::Compute::Property::InstanceScheduling.api_parse(fetch['scheduling'])
          @current_resource.service_accounts =
            ::Google::Compute::Property::InstanceServiceAccountsArray.api_parse(
              fetch['serviceAccounts']
            )
          @current_resource.status =
            ::Google::Compute::Property::String.api_parse(fetch['status'])
          @current_resource.status_message =
            ::Google::Compute::Property::String.api_parse(fetch['statusMessage'])
          @current_resource.tags =
            ::Google::Compute::Property::InstanceTags.api_parse(fetch['tags'])
          @new_resource.__fetched = fetch

          update
        end
      end

      action :delete do
        fetch = fetch_resource(@new_resource, self_link(@new_resource), 'compute#instance')
        unless fetch.nil?
          converge_by "Deleting gcompute_instance[#{new_resource.name}]" do
            delete_req = ::Google::Compute::Network::Delete.new(
              self_link(@new_resource), fetch_auth(@new_resource)
            )
            wait_for_operation delete_req.send, @new_resource
          end
        end
      end

      # TODO(nelsonjr): Add actions :manage and :modify

      def exports
        {
          self_link: __fetched['selfLink']
        }
      end

      private

      action_class do
        # rubocop:disable Metrics/AbcSize
        # rubocop:disable Metrics/MethodLength
        def resource_to_request
          request = {
            kind: 'compute#instance',
            canIpForward: new_resource.can_ip_forward,
            disks: new_resource.disks,
            guestAccelerators: new_resource.guest_accelerators,
            labelFingerprint: new_resource.label_fingerprint,
            metadata: new_resource.metadata,
            machineType: new_resource.machine_type,
            minCpuPlatform: new_resource.min_cpu_platform,
            name: new_resource.i_label,
            networkInterfaces: new_resource.network_interfaces,
            scheduling: new_resource.scheduling,
            serviceAccounts: new_resource.service_accounts,
            tags: new_resource.tags
          }.reject { |_, v| v.nil? }
          # Format request to conform with API endpoint
          request = encode_request(request)
          request.to_json
        end
        # rubocop:enable Metrics/MethodLength
        # rubocop:enable Metrics/AbcSize

        def update
          converge_if_changed do |_vars|
            # TODO(nelsonjr): Determine how to print indented like upd converge
            # TODO(nelsonjr): Check w/ Chef... can we print this in red?
            puts # making a newline until we find a better way TODO: find!
            compute_changes.each { |log| puts "    - #{log.strip}\n" }
            update_req =
              ::Google::Compute::Network::Put.new(self_link(@new_resource),
                                                  fetch_auth(@new_resource),
                                                  'application/json',
                                                  resource_to_request)
            wait_for_operation update_req.send, @new_resource
          end
        end

        def self.fetch_export(resource, type, id, property)
          return if id.nil?
          resource.resources("#{type}[#{id}]").exports[property]
        end

        # rubocop:disable Metrics/MethodLength
        def self.resource_to_hash(resource)
          {
            project: resource.project,
            name: resource.i_label,
            kind: 'compute#instance',
            can_ip_forward: resource.can_ip_forward,
            cpu_platform: resource.cpu_platform,
            creation_timestamp: resource.creation_timestamp,
            disks: resource.disks,
            guest_accelerators: resource.guest_accelerators,
            id: resource.id,
            label_fingerprint: resource.label_fingerprint,
            metadata: resource.metadata,
            machine_type: resource.machine_type,
            min_cpu_platform: resource.min_cpu_platform,
            network_interfaces: resource.network_interfaces,
            scheduling: resource.scheduling,
            service_accounts: resource.service_accounts,
            status: resource.status,
            status_message: resource.status_message,
            tags: resource.tags,
            zone: resource.zone
          }.reject { |_, v| v.nil? }
        end
        # rubocop:enable Metrics/MethodLength

        # Copied from Chef > Provider > #converge_if_changed
        def compute_changes
          properties = @new_resource.class.state_properties.map(&:name)
          properties = properties.map(&:to_sym)
          if current_resource
            compute_changes_for_existing_resource properties
          else
            compute_changes_for_new_resource properties
          end
        end

        # Collect the list of modified properties
        def compute_changes_for_existing_resource(properties)
          specified_properties = properties.select do |property|
            @new_resource.property_is_set?(property)
          end
          modified = specified_properties.reject do |p|
            @new_resource.send(p) == current_resource.send(p)
          end

          generate_pretty_green_text(modified)
        end

        def generate_pretty_green_text(modified)
          property_size = modified.map(&:size).max
          modified.map! do |p|
            properties_str = if @new_resource.sensitive
                               '(suppressed sensitive property)'
                             else
                               [
                                 @new_resource.send(p).inspect,
                                 "(was #{current_resource.send(p).inspect})"
                               ].join(' ')
                             end
            "  set #{p.to_s.ljust(property_size)} to #{properties_str}"
          end
        end

        # Write down any properties we are setting.
        def compute_changes_for_new_resource(properties)
          property_size = properties.map(&:size).max
          properties.map do |property|
            default = ' (default value)' \
              unless @new_resource.property_is_set?(property)
            next if @new_resource.send(property).nil?
            properties_str = if @new_resource.sensitive
                               '(suppressed sensitive property)'
                             else
                               @new_resource.send(property).inspect
                             end
            ["  set #{property.to_s.ljust(property_size)}",
             "to #{properties_str}#{default}"].join(' ')
          end.compact
        end

        def fetch_auth(resource)
          self.class.fetch_auth(resource)
        end

        def self.fetch_auth(resource)
          resource.resources("gauth_credential[#{resource.credential}]")
                  .authorization
        end

        def fetch_resource(resource, self_link, kind)
          self.class.fetch_resource(resource, self_link, kind)
        end

        def debug(message)
          Chef::Log.debug(message)
        end

        def self.collection(data)
          URI.join(
            'https://www.googleapis.com/compute/v1/',
            expand_variables(
              'projects/{{project}}/zones/{{zone}}/instances',
              data
            )
          )
        end

        def collection(data)
          self.class.collection(data)
        end

        def self.self_link(data)
          URI.join(
            'https://www.googleapis.com/compute/v1/',
            expand_variables(
              'projects/{{project}}/zones/{{zone}}/instances/{{name}}',
              data
            )
          )
        end

        def self_link(data)
          self.class.self_link(data)
        end

        # rubocop:disable Metrics/CyclomaticComplexity
        def self.return_if_object(response, kind, allow_not_found = false)
          raise "Bad response: #{response.body}" \
            if response.is_a?(Net::HTTPBadRequest)
          raise "Bad response: #{response}" \
            unless response.is_a?(Net::HTTPResponse)
          return if response.is_a?(Net::HTTPNotFound) && allow_not_found 
          return if response.is_a?(Net::HTTPNoContent)
          result = decode_response(response, kind)
          raise_if_errors result, %w[error errors], 'message'
          raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
          result
        end
        # rubocop:enable Metrics/CyclomaticComplexity

        def return_if_object(response, kind, allow_not_found = false)
          self.class.return_if_object(response, kind, allow_not_found)
        end

        def self.extract_variables(template)
          template.scan(/{{[^}]*}}/).map { |v| v.gsub(/{{([^}]*)}}/, '\1') }
                  .map(&:to_sym)
        end

        def self.expand_variables(template, var_data, extra_data = {})
          data = if var_data.class <= Hash
                   var_data.merge(extra_data)
                 else
                   resource_to_hash(var_data).merge(extra_data)
                 end
          extract_variables(template).each do |v|
            unless data.key?(v)
              raise "Missing variable :#{v} in #{data} on #{caller.join("\n")}}"
            end
            template.gsub!(/{{#{v}}}/, CGI.escape(data[v].to_s))
          end
          template
        end

        def expand_variables(template, var_data, extra_data = {})
          self.class.expand_variables(template, var_data, extra_data)
        end

        def fetch_resource(resource, self_link, kind)
          self.class.fetch_resource(resource, self_link, kind)
        end

        def async_op_url(data, extra_data = {})
          URI.join(
            'https://www.googleapis.com/compute/v1/',
            expand_variables(
              'projects/{{project}}/zones/{{zone}}/operations/{{op_id}}',
              data, extra_data
            )
          )
        end

        def wait_for_operation(response, resource)
          op_result = return_if_object(response, 'compute#operation')
          return if op_result.nil?
          status = ::Google::HashUtils.navigate(op_result, %w[status])
          fetch_resource(
            resource,
            URI.parse(::Google::HashUtils.navigate(wait_for_completion(status,
                                                                       op_result,
                                                                       resource),
                                                   %w[targetLink])),
            'compute#instance'
          )
        end

        def wait_for_completion(status, op_result, resource)
          op_id = ::Google::HashUtils.navigate(op_result, %w[name])
          op_uri = async_op_url(resource, op_id: op_id)
          while status != 'DONE'
            debug("Waiting for completion of operation #{op_id}")
            raise_if_errors op_result, %w[error errors], 'message'
            sleep 1.0
            raise "Invalid result '#{status}' on gcompute_instance." \
              unless %w[PENDING RUNNING DONE].include?(status)
            op_result = fetch_resource(resource, op_uri, 'compute#operation')
            status = ::Google::HashUtils.navigate(op_result, %w[status])
          end
          op_result
        end

        def raise_if_errors(response, err_path, msg_field)
          self.class.raise_if_errors(response, err_path, msg_field)
        end

        def self.encode_request(request)
          metadata_encoder(request[:metadata]) unless request[:metadata].nil?
          request
        end

        def encode_request(resource_request)
          self.class.encode_request(resource_request)
        end

        def self.decode_response(response, kind)
          response = JSON.parse(response.body)
          return response unless kind == 'compute#instance'

          metadata_decoder(response['metadata']) unless response['metadata'].nil?
          response
        end

        # Expose instance 'metadata' as a simple name/value pair hash. However the API
        # defines metadata as a NestedObject with the following layout:
        #
        # metadata {
        #   fingerprint: 'hash-of-last-metadata'
        #   items: [
        #     {
        #       key: 'metadata1-key'
        #       value: 'metadata1-value'
        #     },
        #     ...
        #   ]
        # }
        #
        # Fingerpint is an optimistic locking mechanism for updates, which requires
        # adding the 'fingerprint' of the last metadata to allow update.
        def self.metadata_encoder(metadata)
          items = metadata.map { |k, v| { key: k, value: v } }
          metadata.clear
          metadata[:items] = items
        end

        # Map metadata.items[]{key:,value:} => metadata[key]=value
        def self.metadata_decoder(metadata)
          metadata_items = metadata['items']
          metadata.clear
          metadata.merge!(Hash[metadata_items.map { |i| [i['key'], i['value']] }]) \
            unless metadata_items.nil?
        end

        def self.fetch_resource(resource, self_link, kind)
          get_request = ::Google::Compute::Network::Get.new(
            self_link, fetch_auth(resource)
          )
          return_if_object get_request.send, kind, true
        end

        def self.raise_if_errors(response, err_path, msg_field)
          errors = ::Google::HashUtils.navigate(response, err_path)
          raise_error(errors, msg_field) unless errors.nil?
        end

        def self.raise_error(errors, msg_field)
          raise IOError, ['Operation failed:',
                          errors.map { |e| e[msg_field] }.join(', ')].join(' ')
        end
      end
    end
    # rubocop:enable Metrics/ClassLength
  end
end
