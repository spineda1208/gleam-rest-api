import gleam/io
import gleam/bytes_builder.{type BytesBuilder}
import gleam/http/elli
import gleam/http/response.{type Response}
import gleam/http/request.{type Request}

pub fn test_service(req: Request(t)) -> Response(BytesBuilder) {
  let body = bytes_builder.from_string("Hello motha foca !!")
  io.debug(req.method)
  response.new(200)
  |> response.set_body(body)
}

pub fn main() {
  elli.become(test_service, on_port: 8080)
}
