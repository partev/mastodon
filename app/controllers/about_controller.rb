# frozen_string_literal: true

class AboutController < ApplicationController
  layout 'public'

  before_action :set_body_classes, only: :show
  before_action :set_instance_presenter
  before_action :set_expires_in

  skip_before_action :check_user_permissions, only: [:more, :terms]

  def show; end

  def more
    flash.now[:notice] = I18n.t('about.instance_actor_flash') if params[:instance_actor]
  end

  def terms; end

  private

  def new_user
    User.new.tap do |user|
      user.build_account
      user.build_invite_request
    end
  end

  helper_method :new_user

  def set_instance_presenter
    @instance_presenter = InstancePresenter.new
  end

  def set_body_classes
    @hide_navbar = true
  end

  def set_expires_in
    expires_in 0, public: true
  end
end
