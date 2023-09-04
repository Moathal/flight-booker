require "test_helper"

class TicketMailerTest < ActionMailer::TestCase
  test "booking_confirmed" do
    mail = TicketMailer.booking_confirmed
    assert_equal "Booking confirmed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "booking_rejected" do
    mail = TicketMailer.booking_rejected
    assert_equal "Booking rejected", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
