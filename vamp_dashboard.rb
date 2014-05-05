require "vertx"
include Vertx

logger = Vertx.logger
logger.info 'Starting Vamp Web Server'

webserver = Vertx::HttpServer.new

webserver.request_handler do |req|
  logger.info "got a request for #{req.uri}"
  if req.uri == "/"
    req.response.send_file('web/index.html')
  else
    req.response.send_file("web#{req.path}")
  end
end

logger.info 'creating SockJS server'

sjs_server = SockJSServer.new(webserver)
sjs_server.bridge({'prefix' => '/eventbus'}, [{}],[{}])

webserver.listen(80)
