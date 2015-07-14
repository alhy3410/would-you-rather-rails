require 'rails_helper'

describe "it will go to the questions page of the site" do
  it "will verify there are questions there" do
    visit questions_path
    expect(page).to have_content "Question 1"
  end
end

describe "the add a question process" do
  it "will add a question" do
    visit questions_path
    click_on 'Add another set of questions'
    fill_in 'Question 1', :with => "Testing with Question 1"
    fill_in 'Question 2', :with => "Testing with Question 2"
    click_on 'Create Question'
    expect(page).to have_content "Testing with Question 1"
  end
end
