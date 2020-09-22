class PingController < ApplicationController
    def ping
        render plain: '###   Healthcheck OK   ###'
    end
end
