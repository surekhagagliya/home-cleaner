require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "booking_successfully" do
    mail = UserMailer.booking_successfully
    assert_equal "Booking successfully", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
