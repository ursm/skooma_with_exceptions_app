Rails.application.config.exceptions_app = ->(env) {
  [
    418,
    {'content-type' => 'application/json'},
    [{message: "I'm a teapot"}.to_json]
  ]
}
