require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  it "raise an exception" do
    expect{FactoryBot.create(:chess_piece)}.to raise_error(ActiveRecord::RecordInvalid)
  end

end
