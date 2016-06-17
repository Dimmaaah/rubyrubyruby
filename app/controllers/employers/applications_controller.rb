class Employers::ApplicationsController < ApplicationController
  before_action :authenticate_employer!
end
