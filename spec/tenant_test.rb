# test.rb
require_dependency 'acts_as_tenant/test_tenant_middleware'

Rails.application.configure do
  config.middleware.use ActsAsTenant::TestTenantMiddleware
end