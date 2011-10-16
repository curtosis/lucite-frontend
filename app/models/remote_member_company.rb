class RemoteMemberCompany < ActiveResource::Base
  self.site = "http://localhost:3000/"
  self.format = :json
  self.element_name = "member_companies"
end