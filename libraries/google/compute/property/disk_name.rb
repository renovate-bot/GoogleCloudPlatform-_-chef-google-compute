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


module Google
  module Compute
    module Data
      # Base class for ResourceRefs
      # Imports name from disk
      class DiskNameRef
        include Comparable

        def ==(other)
          return false unless other.is_a? DiskNameRef
          return false if resource != other.resource
          true
        end

        def <=>(other)
          resource <=> other.resource
        end

        # Overriding inspect method ensures that Chef logs only the
        # fetched value to the console
        def inspect
          "'#{resource}'"
        end
      end

      # A class to fetch the resource value from a referenced block
      # Will return the value exported from a different Chef resource
      class DiskNameRefCatalog < DiskNameRef
        def initialize(title, parent_resource)
          @title = title
          @parent_resource = parent_resource
        end

        # Chef requires the title for autorequiring
        def autorequires
          [@title]
        end

        def to_s
          resource.to_s
        end

        def to_json(_arg = nil)
          return if resource.nil?
          resource.to_json
        end

        def resource
          Chef.run_context.resource_collection.each do |entry|
            return entry.exports[:name] if entry.name == @title
          end

          raise ArgumentError, "gcompute_disk[#{@title}] required"
        end
      end

      # A class to manage a JSON blob from GCP API
      # Will immediately return value from JSON blob without changes
      class DiskNameRefApi < DiskNameRef
        attr_reader :resource

        def initialize(resource)
          @resource = resource
        end

        def to_s
          @resource.to_s
        end

        def to_json(_arg = nil)
          @resource.to_json
        end
      end
    end

    module Property
      # A class to manage fetching name from a disk
      class DiskNameRef
        def self.coerce
          ->(parent_resource, value) { ::Google::Compute::Property::DiskNameRef.catalog_parse(value, parent_resource) }
        end

        def catalog_parse(value, parent_resource = nil)
          return if value.nil?
          self.class.catalog_parse(value, parent_resource)
        end

        def self.catalog_parse(value, parent_resource = nil)
          return if value.nil?
          return value if value.is_a? Data::DiskNameRef
          Data::DiskNameRefCatalog.new(value, parent_resource)
        end

        # Used for fetched JSON values
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::DiskNameRef
          Data::DiskNameRefApi.new(value)
        end
      end
    end
  end
end
