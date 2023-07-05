##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Chat
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Chat < ChatBase
            class V2 < Version
                class ServiceContext < InstanceContext
                class ChannelContext < InstanceContext

                     class MemberList < ListResource
                    ##
                    # Initialize the MemberList
                    # @param [Version] version Version that contains the resource
                    # @return [MemberList] MemberList
                    def initialize(version, service_sid: nil, channel_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, channel_sid: channel_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Members"
                        
                    end
                    ##
                    # Create the MemberInstance
                    # @param [String] identity The `identity` value that uniquely identifies the new resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more info.
                    # @param [String] role_sid The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) to assign to the member. The default roles are those specified on the [Service](https://www.twilio.com/docs/chat/rest/service-resource).
                    # @param [String] last_consumed_message_index The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read. This parameter should only be used when recreating a Member from a backup/separate source.
                    # @param [Time] last_consumption_timestamp The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for the Member within the [Channel](https://www.twilio.com/docs/chat/channels).
                    # @param [Time] date_created The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was created. The default value is the current time set by the Chat service.  Note that this parameter should only be used when a Member is being recreated from a backup/separate source.
                    # @param [Time] date_updated The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was last updated. The default value is `null`. Note that this parameter should only be used when a Member is being recreated from a backup/separate source and where a Member was previously updated.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @param [MemberEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [MemberInstance] Created MemberInstance
                    def create(
                        identity: nil, 
                        role_sid: :unset, 
                        last_consumed_message_index: :unset, 
                        last_consumption_timestamp: :unset, 
                        date_created: :unset, 
                        date_updated: :unset, 
                        attributes: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'Identity' => identity,
                            'RoleSid' => role_sid,
                            'LastConsumedMessageIndex' => last_consumed_message_index,
                            'LastConsumptionTimestamp' => Twilio.serialize_iso8601_datetime(last_consumption_timestamp),
                            'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                            'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                            'Attributes' => attributes,
                        })

                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        MemberInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            channel_sid: @solution[:channel_sid],
                        )
                    end

                
                    ##
                    # Lists MemberInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Array[String]] identity The [User](https://www.twilio.com/docs/chat/rest/user-resource)'s `identity` value of the Member resources to read. See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more details.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(identity: :unset, limit: nil, page_size: nil)
                        self.stream(
                            identity: identity,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Array[String]] identity The [User](https://www.twilio.com/docs/chat/rest/user-resource)'s `identity` value of the Member resources to read. See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more details.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(identity: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            identity: identity,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields MemberInstance records from the API.
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
                    # Retrieve a single page of MemberInstance records from the API.
                    # Request is executed immediately.
                    # @param [Array[String]] identity The [User](https://www.twilio.com/docs/chat/rest/user-resource)'s `identity` value of the Member resources to read. See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more details.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of MemberInstance
                    def page(identity: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Identity' =>  Twilio.serialize_list(identity) { |e| e },
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        MemberPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of MemberInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of MemberInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    MemberPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Chat.V2.MemberList>'
                    end
                end


                class MemberContext < InstanceContext
                    ##
                    # Initialize the MemberContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) to update the Member resource in.
                    # @param [String] channel_sid The SID of the [Channel](https://www.twilio.com/docs/chat/channels) the Member resource to update belongs to. This value can be the Channel resource's `sid` or `unique_name`.
                    # @param [String] sid The SID of the Member resource to update. This value can be either the Member's `sid` or its `identity` value.
                    # @return [MemberContext] MemberContext
                    def initialize(version, service_sid, channel_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, channel_sid: channel_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Members/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the MemberInstance
                    # @param [MemberEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the MemberInstance
                    # @return [MemberInstance] Fetched MemberInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        MemberInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            channel_sid: @solution[:channel_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the MemberInstance
                    # @param [String] role_sid The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) to assign to the member. The default roles are those specified on the [Service](https://www.twilio.com/docs/chat/rest/service-resource).
                    # @param [String] last_consumed_message_index The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) that the Member has read within the [Channel](https://www.twilio.com/docs/chat/channels).
                    # @param [Time] last_consumption_timestamp The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for the Member within the [Channel](https://www.twilio.com/docs/chat/channels).
                    # @param [Time] date_created The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was created. The default value is the current time set by the Chat service.  Note that this parameter should only be used when a Member is being recreated from a backup/separate source.
                    # @param [Time] date_updated The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was last updated.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @param [MemberEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [MemberInstance] Updated MemberInstance
                    def update(
                        role_sid: :unset, 
                        last_consumed_message_index: :unset, 
                        last_consumption_timestamp: :unset, 
                        date_created: :unset, 
                        date_updated: :unset, 
                        attributes: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'RoleSid' => role_sid,
                            'LastConsumedMessageIndex' => last_consumed_message_index,
                            'LastConsumptionTimestamp' => Twilio.serialize_iso8601_datetime(last_consumption_timestamp),
                            'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                            'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                            'Attributes' => attributes,
                        })

                        headers = Twilio::Values.of({ 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        MemberInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            channel_sid: @solution[:channel_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V2.MemberContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V2.MemberContext #{context}>"
                    end
                end

                class MemberPage < Page
                    ##
                    # Initialize the MemberPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [MemberPage] MemberPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of MemberInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [MemberInstance] MemberInstance
                    def get_instance(payload)
                        MemberInstance.new(@version, payload, service_sid: @solution[:service_sid], channel_sid: @solution[:channel_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Chat.V2.MemberPage>'
                    end
                end
                class MemberInstance < InstanceResource
                    ##
                    # Initialize the MemberInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Member
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [MemberInstance] MemberInstance
                    def initialize(version, payload , service_sid: nil, channel_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'channel_sid' => payload['channel_sid'],
                            'service_sid' => payload['service_sid'],
                            'identity' => payload['identity'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'role_sid' => payload['role_sid'],
                            'last_consumed_message_index' => payload['last_consumed_message_index'] == nil ? payload['last_consumed_message_index'] : payload['last_consumed_message_index'].to_i,
                            'last_consumption_timestamp' => Twilio.deserialize_iso8601_datetime(payload['last_consumption_timestamp']),
                            'url' => payload['url'],
                            'attributes' => payload['attributes'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'channel_sid' => channel_sid  || @properties['channel_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [MemberContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = MemberContext.new(@version , @params['service_sid'], @params['channel_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Member resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Member resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Channel](https://www.twilio.com/docs/chat/channels) the Member resource belongs to.
                    def channel_sid
                        @properties['channel_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/chat/rest/service-resource) the Member resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The application-defined string that uniquely identifies the resource's [User](https://www.twilio.com/docs/chat/rest/user-resource) within the [Service](https://www.twilio.com/docs/chat/rest/service-resource). See [access tokens](https://www.twilio.com/docs/chat/create-tokens) for more info.
                    def identity
                        @properties['identity']
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
                    # @return [String] The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) assigned to the member.
                    def role_sid
                        @properties['role_sid']
                    end
                    
                    ##
                    # @return [String] The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) in the [Channel](https://www.twilio.com/docs/chat/channels) that the Member has read.
                    def last_consumed_message_index
                        @properties['last_consumed_message_index']
                    end
                    
                    ##
                    # @return [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for the Member within the [Channel](https://www.twilio.com/docs/chat/channels).
                    def last_consumption_timestamp
                        @properties['last_consumption_timestamp']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Member resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The JSON string that stores application-specific data. If attributes have not been set, `{}` is returned.
                    def attributes
                        @properties['attributes']
                    end
                    
                    ##
                    # Delete the MemberInstance
                    # @param [MemberEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        context.delete(
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Fetch the MemberInstance
                    # @return [MemberInstance] Fetched MemberInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the MemberInstance
                    # @param [String] role_sid The SID of the [Role](https://www.twilio.com/docs/chat/rest/role-resource) to assign to the member. The default roles are those specified on the [Service](https://www.twilio.com/docs/chat/rest/service-resource).
                    # @param [String] last_consumed_message_index The index of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) that the Member has read within the [Channel](https://www.twilio.com/docs/chat/channels).
                    # @param [Time] last_consumption_timestamp The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp of the last [Message](https://www.twilio.com/docs/chat/rest/message-resource) read event for the Member within the [Channel](https://www.twilio.com/docs/chat/channels).
                    # @param [Time] date_created The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was created. The default value is the current time set by the Chat service.  Note that this parameter should only be used when a Member is being recreated from a backup/separate source.
                    # @param [Time] date_updated The date, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, to assign to the resource as the date it was last updated.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @param [MemberEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [MemberInstance] Updated MemberInstance
                    def update(
                        role_sid: :unset, 
                        last_consumed_message_index: :unset, 
                        last_consumption_timestamp: :unset, 
                        date_created: :unset, 
                        date_updated: :unset, 
                        attributes: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        context.update(
                            role_sid: role_sid, 
                            last_consumed_message_index: last_consumed_message_index, 
                            last_consumption_timestamp: last_consumption_timestamp, 
                            date_created: date_created, 
                            date_updated: date_updated, 
                            attributes: attributes, 
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V2.MemberInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V2.MemberInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


