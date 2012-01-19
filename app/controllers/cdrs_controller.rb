class CdrsController < ApplicationController
  layout 'application'
  def index
    @cdrs = Cdr.all
  end
end
