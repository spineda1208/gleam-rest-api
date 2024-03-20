import gleam/io
import gleam/bytes_builder
import gleam/http/response.{type Response}
import gleam/http/request.{type Request}
import mist.{type ResponseData}

pub fn test_service(_req: Request(t)) -> Response(ResponseData) {
  let body = bytes_builder.from_string("Hello motha foca !!")
  io.debug("200: Request Received")
  response.new(200)
  |> response.set_body(mist.Bytes(body))
}

pub fn main() {
  mist.new(test_service)
  |> mist.port(8080)
  |> mist.start_http
}
