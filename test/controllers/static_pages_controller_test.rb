require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | SOA - Sistema de Orientação Acadêmica da Ufba!"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Ajuda | SOA - Sistema de Orientação Acadêmica da Ufba!"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "Sobre | SOA - Sistema de Orientação Acadêmica da Ufba!"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contato | SOA - Sistema de Orientação Acadêmica da Ufba!"
  end

  test "should get news" do
    get :news
    assert_response :success
    assert_select "title", "News | SOA - Sistema de Orientação Acadêmica da Ufba!"
  end

end
