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

require 'google/compute/property/array'
module Google
  module Compute
    module Data
      # A class to manage data for NetworkInterfaces for instance.
      class InstancNetworkInterfa
        include Comparable

        attr_reader :access_configs
        attr_reader :alias_ip_ranges
        attr_reader :name
        attr_reader :network
        attr_reader :network_ip
        attr_reader :subnetwork

        def to_json(_arg = nil)
          {
            'accessConfigs' => access_configs,
            'aliasIpRanges' => alias_ip_ranges,
            'name' => name,
            'network' => network,
            'networkIP' => network_ip,
            'subnetwork' => subnetwork
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            access_configs: ['[',
                             access_configs.map(&:to_json).join(', '),
                             ']'].join(' '),
            alias_ip_ranges: ['[',
                              alias_ip_ranges.map(&:to_json).join(', '),
                              ']'].join(' '),
            name: name.to_s,
            network: network.to_s,
            network_ip: network_ip.to_s,
            subnetwork: subnetwork.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstancNetworkInterfa
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstancNetworkInterfa
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        def inspect
          to_json
        end

        private

        def compare_fields(other)
          [
            { self: access_configs, other: other.access_configs },
            { self: alias_ip_ranges, other: other.alias_ip_ranges },
            { self: name, other: other.name },
            { self: network, other: other.network },
            { self: network_ip, other: other.network_ip },
            { self: subnetwork, other: other.subnetwork }
          ]
        end
      end

      # Manages a InstancNetworkInterfa nested object
      # Data is coming from the GCP API
      class InstancNetworkInterfaApi < InstancNetworkInterfa
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @access_configs =
            Google::Compute::Property::InstancAccessConfigsArray.api_parse(
              args['accessConfigs']
            )
          @alias_ip_ranges =
            Google::Compute::Property::InstaAliasIpRangeArray.api_parse(
              args['aliasIpRanges']
            )
          @name = Google::Compute::Property::String.api_parse(args['name'])
          @network = Google::Compute::Property::NetwoSelfLinkRef.api_parse(
            args['network']
          )
          @network_ip =
            Google::Compute::Property::String.api_parse(args['networkIP'])
          @subnetwork = Google::Compute::Property::SubneSelfLinkRef.api_parse(
            args['subnetwork']
          )
        end
        # rubocop:enable Metrics/MethodLength
      end

      # Manages a InstancNetworkInterfa nested object
      # Data is coming from the Chef catalog
      class InstancNetworkInterfaCatalog < InstancNetworkInterfa
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @access_configs =
            Google::Compute::Property::InstancAccessConfigsArray.catalog_parse(
              args[:access_configs]
            )
          @alias_ip_ranges =
            Google::Compute::Property::InstaAliasIpRangeArray.catalog_parse(
              args[:alias_ip_ranges]
            )
          @name = Google::Compute::Property::String.catalog_parse(args[:name])
          @network = Google::Compute::Property::NetwoSelfLinkRef.catalog_parse(
            args[:network]
          )
          @network_ip =
            Google::Compute::Property::String.catalog_parse(args[:network_ip])
          @subnetwork =
            Google::Compute::Property::SubneSelfLinkRef.catalog_parse(
              args[:subnetwork]
            )
        end
        # rubocop:enable Metrics/MethodLength
      end
    end

    module Property
      # A class to manage input to NetworkInterfaces for instance.
      class InstancNetworkInterfa
        def self.coerce
          lambda do |x|
            ::Google::Compute::Property::InstancNetworkInterfa.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::InstancNetworkInterfa
          Data::InstancNetworkInterfaCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::InstancNetworkInterfa
          Data::InstancNetworkInterfaApi.new(value)
        end
      end

      # A Chef property that holds an integer
      class InstancNetworkInterfaArray < Google::Compute::Property::Array
        def self.coerce
          lambda do |x|
            type = ::Google::Compute::Property::InstancNetworkInterfaArray
            type.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return InstancNetworkInterfa.catalog_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstancNetworkInterfa.catalog_parse(v) }
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return InstancNetworkInterfa.api_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstancNetworkInterfa.api_parse(v) }
        end
      end
    end
  end
end
