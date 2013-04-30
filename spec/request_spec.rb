# coding: utf-8
require 'spec_helper'

include Staticman

class ProxyRequestTest
  include ProxyRequest
end

describe ProxyRequest do
  describe '#request_context' do
    context 'host is config value' do
      let(:request) { ProxyRequestTest.new.request_context }
      it { request.should be_kind_of ActionDispatch::TestRequest }
      it { request.host.should be_eql 'example.com' }
    end
  end
end
