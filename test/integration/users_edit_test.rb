require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:xyz123)
  end

  test "unsuccessful name edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              password:      "foo",
                                            password_confirmation:  "bar",
                                         security_question: "question",
                                         security_answer: "answer"  } }
    
    assert_template 'users/edit'
  end


  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:"xyz123",
                                              password: "",
                                              password_confirmation: "",
                                         security_question: "question",
                                         security_answer: "answer"  } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "abcdef"
    patch user_path(@user), params: { user: { name: name,
                                              password: "",
                                              password_confirmation: "",
                                         security_question: "question",
                                         security_answer: "answer"  } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
  end
end
