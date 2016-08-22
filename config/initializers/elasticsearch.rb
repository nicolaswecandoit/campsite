case
when defined?(::Kaminari)
  Elasticsearch::Model::Response::Response.__send__ :include, Elasticsearch::Model::Response::Pagination::Kaminari
when defined?(::WillPaginate)
  Elasticsearch::Model::Response::Response.__send__ :include, Elasticsearch::Model::Response::Pagination::WillPaginate
end
