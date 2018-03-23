require 'rails_helper'

describe UsersController do
#Tesing GET methods    
    describe "GET #index" do
        it "populates an array of users" do
            user = FactoryGirl.create(:user)
            get :index
            assigns(:users).should eq([user])
        end
        it "renders the :index template" do
            get :index
            expect(response).to render_template :index
        end
    end
    
    describe "GET #show" do
        it "assigns the requested user to @user" do
            user = FactoryGirl.create(:user)
            get :show, id: user
            assigns(:user).should eq(user)
        end
        
        it "renders the :show template" do
            get :show, id: FactoryGirl.create(:user)
            expect(response).to render_template :show
        end
    end
    
    describe "GET #new" do
        it "assigns a new user to @user" do
            get :new
            assigns(:user).should be_a_new(User)
        end
        
        it "renders the :new template" do
            get :new
            expect(response).to render_template :new
        end
    end
    
    describe "GET#edit" do
        it "assigns the requested user to @user" do
            user = FactoryGirl.create(:user)
            get :show, id: user
            assigns(:user).should eq(user)
        end
        it "renders the :edit template" do
            get :edit, id: FactoryGirl.create(:user)
            expect(response).to render_template :edit
        end
    end
    
#Testing POST methods
    describe "POST#create" do
        context "with valid attributes" do
            it "creates a new user" do
                expect{
                    post :create, user: FactoryGirl.attributes_for(:user)
                }.to change(User,:count).by(1)
            end
            it "redirects to the new user" do
                post :create, user: FactoryGirl.attributes_for(:user)
                response.should redirect_to User.last
            end
        end
        context "with invalid attributes" do
            it "does not save the new user" do
                expect{
                    post :create, user: FactoryGirl.attributes_for(:invalid_user)
                }.to_not change(User,:count)
            end
            it "re-renders the new methods" do
                post :create, user: FactoryGirl.attributes_for(:invalid_user)
                response.should render_template :new
            end
        end
    end

end