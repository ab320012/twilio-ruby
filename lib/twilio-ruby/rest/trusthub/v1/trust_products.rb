##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Trusthub
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Trusthub < TrusthubBase
            class V1 < Version
                class TrustProductsList < ListResource
                    ##
                    # Initialize the TrustProductsList
                    # @param [Version] version Version that contains the resource
                    # @return [TrustProductsList] TrustProductsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/TrustProducts"
                        
                    end
                    ##
                    # Create the TrustProductsInstance
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] email The email address that will receive updates when the Customer-Profile resource changes status.
                    # @param [String] policy_sid The unique string of a policy that is associated to the Customer-Profile resource.
                    # @param [String] status_callback The URL we call to inform your application of status changes.
                    # @return [TrustProductsInstance] Created TrustProductsInstance
                    def create(
                        friendly_name: nil, 
                        email: nil, 
                        policy_sid: nil, 
                        status_callback: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Email' => email,
                            'PolicySid' => policy_sid,
                            'StatusCallback' => status_callback,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        TrustProductsInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists TrustProductsInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Status] status The verification status of the Customer-Profile resource.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] policy_sid The unique string of a policy that is associated to the Customer-Profile resource.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(status: :unset, friendly_name: :unset, policy_sid: :unset, limit: nil, page_size: nil)
                        self.stream(
                            status: status,
                            friendly_name: friendly_name,
                            policy_sid: policy_sid,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Status] status The verification status of the Customer-Profile resource.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] policy_sid The unique string of a policy that is associated to the Customer-Profile resource.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(status: :unset, friendly_name: :unset, policy_sid: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            status: status,
                            friendly_name: friendly_name,
                            policy_sid: policy_sid,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields TrustProductsInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of TrustProductsInstance records from the API.
                    # Request is executed immediately.
                    # @param [Status] status The verification status of the Customer-Profile resource.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] policy_sid The unique string of a policy that is associated to the Customer-Profile resource.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of TrustProductsInstance
                    def page(status: :unset, friendly_name: :unset, policy_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Status' => status,
                            'FriendlyName' => friendly_name,
                            'PolicySid' => policy_sid,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        TrustProductsPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of TrustProductsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of TrustProductsInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    TrustProductsPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Trusthub.V1.TrustProductsList>'
                    end
                end


                class TrustProductsContext < InstanceContext
                    ##
                    # Initialize the TrustProductsContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The unique string that we created to identify the Customer-Profile resource.
                    # @return [TrustProductsContext] TrustProductsContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/TrustProducts/#{@solution[:sid]}"

                        # Dependents
                        @trust_products_channel_endpoint_assignment = nil
                        @trust_products_entity_assignments = nil
                        @trust_products_evaluations = nil
                    end
                    ##
                    # Delete the TrustProductsInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the TrustProductsInstance
                    # @return [TrustProductsInstance] Fetched TrustProductsInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        TrustProductsInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the TrustProductsInstance
                    # @param [Status] status 
                    # @param [String] status_callback The URL we call to inform your application of status changes.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] email The email address that will receive updates when the Customer-Profile resource changes status.
                    # @return [TrustProductsInstance] Updated TrustProductsInstance
                    def update(
                        status: :unset, 
                        status_callback: :unset, 
                        friendly_name: :unset, 
                        email: :unset
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                            'StatusCallback' => status_callback,
                            'FriendlyName' => friendly_name,
                            'Email' => email,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        TrustProductsInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the trust_products_channel_endpoint_assignment
                    # @return [TrustProductsChannelEndpointAssignmentList]
                    # @return [TrustProductsChannelEndpointAssignmentContext] if sid was passed.
                    def trust_products_channel_endpoint_assignment(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return TrustProductsChannelEndpointAssignmentContext.new(@version, @solution[:sid],sid )
                        end

                        unless @trust_products_channel_endpoint_assignment
                            @trust_products_channel_endpoint_assignment = TrustProductsChannelEndpointAssignmentList.new(
                                @version, trust_product_sid: @solution[:sid], )
                        end

                     @trust_products_channel_endpoint_assignment
                    end
                    ##
                    # Access the trust_products_entity_assignments
                    # @return [TrustProductsEntityAssignmentsList]
                    # @return [TrustProductsEntityAssignmentsContext] if sid was passed.
                    def trust_products_entity_assignments(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return TrustProductsEntityAssignmentsContext.new(@version, @solution[:sid],sid )
                        end

                        unless @trust_products_entity_assignments
                            @trust_products_entity_assignments = TrustProductsEntityAssignmentsList.new(
                                @version, trust_product_sid: @solution[:sid], )
                        end

                     @trust_products_entity_assignments
                    end
                    ##
                    # Access the trust_products_evaluations
                    # @return [TrustProductsEvaluationsList]
                    # @return [TrustProductsEvaluationsContext] if sid was passed.
                    def trust_products_evaluations(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return TrustProductsEvaluationsContext.new(@version, @solution[:sid],sid )
                        end

                        unless @trust_products_evaluations
                            @trust_products_evaluations = TrustProductsEvaluationsList.new(
                                @version, trust_product_sid: @solution[:sid], )
                        end

                     @trust_products_evaluations
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.TrustProductsContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.TrustProductsContext #{context}>"
                    end
                end

                class TrustProductsPage < Page
                    ##
                    # Initialize the TrustProductsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TrustProductsPage] TrustProductsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TrustProductsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TrustProductsInstance] TrustProductsInstance
                    def get_instance(payload)
                        TrustProductsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Trusthub.V1.TrustProductsPage>'
                    end
                end
                class TrustProductsInstance < InstanceResource
                    ##
                    # Initialize the TrustProductsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this TrustProducts
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TrustProductsInstance] TrustProductsInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'policy_sid' => payload['policy_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'status' => payload['status'],
                            'valid_until' => Twilio.deserialize_iso8601_datetime(payload['valid_until']),
                            'email' => payload['email'],
                            'status_callback' => payload['status_callback'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [TrustProductsContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = TrustProductsContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Customer-Profile resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Customer-Profile resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string of a policy that is associated to the Customer-Profile resource.
                    def policy_sid
                        @properties['policy_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format when the resource will be valid until.
                    def valid_until
                        @properties['valid_until']
                    end
                    
                    ##
                    # @return [String] The email address that will receive updates when the Customer-Profile resource changes status.
                    def email
                        @properties['email']
                    end
                    
                    ##
                    # @return [String] The URL we call to inform your application of status changes.
                    def status_callback
                        @properties['status_callback']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Customer-Profile resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] The URLs of the Assigned Items of the Customer-Profile resource.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the TrustProductsInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the TrustProductsInstance
                    # @return [TrustProductsInstance] Fetched TrustProductsInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the TrustProductsInstance
                    # @param [Status] status 
                    # @param [String] status_callback The URL we call to inform your application of status changes.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] email The email address that will receive updates when the Customer-Profile resource changes status.
                    # @return [TrustProductsInstance] Updated TrustProductsInstance
                    def update(
                        status: :unset, 
                        status_callback: :unset, 
                        friendly_name: :unset, 
                        email: :unset
                    )

                        context.update(
                            status: status, 
                            status_callback: status_callback, 
                            friendly_name: friendly_name, 
                            email: email, 
                        )
                    end

                    ##
                    # Access the trust_products_channel_endpoint_assignment
                    # @return [trust_products_channel_endpoint_assignment] trust_products_channel_endpoint_assignment
                    def trust_products_channel_endpoint_assignment
                        context.trust_products_channel_endpoint_assignment
                    end

                    ##
                    # Access the trust_products_entity_assignments
                    # @return [trust_products_entity_assignments] trust_products_entity_assignments
                    def trust_products_entity_assignments
                        context.trust_products_entity_assignments
                    end

                    ##
                    # Access the trust_products_evaluations
                    # @return [trust_products_evaluations] trust_products_evaluations
                    def trust_products_evaluations
                        context.trust_products_evaluations
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.TrustProductsInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.TrustProductsInstance #{values}>"
                    end
                end

            end
        end
    end
end
