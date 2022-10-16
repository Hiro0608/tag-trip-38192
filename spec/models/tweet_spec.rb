require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end
  describe '新規投稿登録' do
    context '投稿ができる場合' do
      it "image,title,place,introductionが存在すれば登録できる" do
        expect(@tweet).to be_valid
      end
    end  
    context '投稿ができない場合' do
      it "写真が添付されていないと登録できない" do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end
      it "タイトルが入力されていなければ登録できない" do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end
      it "場所が入力されていなければ登録できない" do
        @tweet.place = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Place can't be blank")
      end
      it "投稿の説明が入力されていなければ登録できない" do
        @tweet.introduction = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Introduction can't be blank")
      end
      it "userが紐付いていない場合は登録できない" do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User must exist")
      end
    end
  end
end