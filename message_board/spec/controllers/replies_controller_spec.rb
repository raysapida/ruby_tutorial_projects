require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe RepliesController, type: :controller do
  let(:user) { User.create(email: "example@rails.com",
                           password: "password",
                           password_confirmation: "password") }
  let(:post) { Post.create(title: "Title", content: "content", user_id: user.id) }

  # This should return the minimal set of attributes required to create a valid
  # Reply. As you add validations to Reply, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { content: "Reply", post_id: post.id, user_id: user.id }
  }

  let(:invalid_attributes) {
    { content: nil, post_id: nil, user_id: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RepliesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all replies as @replies" do
      sign_in user
      reply = post.replies.create! valid_attributes
      get :index, {:post_id => post.id}, valid_session
      expect(assigns(:replies)).to eq([reply])
    end
  end

  describe "GET #show" do
    it "assigns the requested reply as @reply" do
      sign_in user
      reply = post.replies.create! valid_attributes
      get :show, {:id => reply.to_param, :post_id => post.id}, valid_session
      expect(assigns(:reply)).to eq(reply)
    end
  end

  describe "GET #new" do
    it "assigns a new reply as @reply" do
      sign_in user
      get :new, {:post_id => post.id}, valid_session
      expect(assigns(:reply)).to be_a_new(Reply)
    end
  end

  describe "GET #edit" do
    it "assigns the requested reply as @reply" do
      sign_in user
      reply = post.replies.create! valid_attributes
      get :edit, {:id => reply.to_param, :post_id => post.id}, valid_session
      expect(assigns(:reply)).to eq(reply)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Reply" do
        sign_in user
        expect {
          post :create, {:post_id => post.id, :reply => valid_attributes}, valid_session
        }.to change(Reply, :count).by(1)
      end

      it "assigns a newly created reply as @reply" do
        sign_in user
        post :create, {:post_id => post.id, :reply => valid_attributes}, valid_session
        expect(assigns(:reply)).to be_a(Reply)
        expect(assigns(:reply)).to be_persisted
      end

      it "redirects to the created reply" do
        sign_in user
        post :create, {:post_id => post.id, :reply => valid_attributes}, valid_session
        expect(response).to redirect_to(Reply.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved reply as @reply" do
        sign_in user
        post :create, {:post_id => post.id, :reply => invalid_attributes}, valid_session
        expect(assigns(:reply)).to be_a_new(Reply)
      end

      it "re-renders the 'new' template" do
        sign_in user
        post :create, {:post_id => post.id, :reply => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { content: "New content" }
      }

      it "updates the requested reply" do
        sign_in user
        reply = post.replies.create! valid_attributes
        put :update, {:id => reply.to_param, :reply => new_attributes, :post_id => post.id}, valid_session
        reply.reload
        expect(reply.content).to eq("New content")
      end

      it "assigns the requested reply as @reply" do
        sign_in user
        reply = post.replies.create! valid_attributes
        put :update, {:id => reply.to_param, :reply => valid_attributes, :post_id => post.id}, valid_session
        expect(assigns(:reply)).to eq(reply)
      end

      it "redirects to the reply" do
        sign_in user
        reply = post.replies.create! valid_attributes
        put :update, {:id => reply.to_param, :reply => valid_attributes, :post_id => post.id}, valid_session
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "assigns the reply as @reply" do
        sign_in user
        reply = post.replies.create! valid_attributes
        put :update, {:id => reply.to_param, :reply => invalid_attributes, :post_id => post.id}, valid_session
        expect(assigns(:reply)).to eq(reply)
      end

      it "re-renders the 'edit' template" do
        sign_in user
        reply = post.replies.create! valid_attributes
        put :update, {:id => reply.to_param, :reply => invalid_attributes, :post_id => post.id}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested reply" do
      sign_in user
      reply = post.replies.create! valid_attributes
      expect {
        delete :destroy, {:id => reply.to_param, :post_id => post.id}, valid_session
      }.to change(Reply, :count).by(-1)
    end

    it "redirects to the replies list" do
      sign_in user
      reply = post.replies.create! valid_attributes
      delete :destroy, {:id => reply.to_param, :post_id => post.id}, valid_session
      expect(response).to redirect_to(post)
    end
  end

end
