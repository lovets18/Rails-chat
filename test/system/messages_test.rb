require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  setup do
    @message = messages(:one)
  end

  test "visiting the index" do
    visit messages_url
    assert_selector "h1", text: "Messages"
  end

  test "message sending" do
    visit users_url
    click_on "New User"

    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    fill_in "Username", with: 'userString'
    click_on "Create User"
    visit root_url
    click_on 'Log In'
    fill_in "Password", with: 'secret'
    fill_in "Username", with: 'userString'
    click_on 'Login'
    assert_text "Logged in as"
    #visit messages_url
    #click_on "New Message"

    fill_in "message_content", with: @message.content
    #fill_in "User", with: @message.user_id
    click_on "Send message"
    assert_text "MyText"

    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
    #click_on "Back"
  end

  test "message delivering" do
    visit users_url
    click_on "New User"

    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    fill_in "Username", with: 'userString2'
    click_on "Create User"
    visit root_url
    click_on 'Log In'
    fill_in "Password", with: 'secret'
    fill_in "Username", with: 'userString2'
    click_on 'Login'
    assert_text "Logged in as"
    #visit messages_url
    #click_on "New Message"

    #fill_in "message_content", with: @message.content
    #fill_in "User", with: @message.user_id
    #click_on "Send message"
    assert_text "MyText"

    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end


end
