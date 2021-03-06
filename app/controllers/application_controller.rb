class ApplicationController < ActionController::Base
    protect_from_forgery except: :receive_guest

    def current_or_guest_user
        if current_user
            if session[:guest_user_id] && session[:guest_user_id] != current_user.id
                logging_in
                guest_user(with_retry = false).reload.try(:destroy)
                session[:guest_user_id] = nil
            end
            current_user
        else
            guest_user
        end
    end

    def guest_user(with_retry = true)
        @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    rescue ActiveRecord::RecordNotFound
        session[:guest_user_id] = nil
        guest_user if with_retry
    end

    private

    def logging_in
    end

    def create_guest_user
        password = SecureRandom.hex(6)
        u = User.create(email: "guest_#{Time.now.to_i}#{rand(100)}@suyesh.com", password: password, password_confirmation: password)
        u.save!(validate: false)
        session[:guest_user_id] = u.id
        # Sample Task for the guest user
        u.todos.create(description: 'Hover to delete this sample task.', priority: 'High')
        u
    end
end
