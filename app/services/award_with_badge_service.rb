# frozen_string_literal: true

class AwardWithBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def award
    @badges = Badge.all
    @badges.each do |badge|
      @user.badges.push(badge) if send("#{badge.rule}_passed?", badge.rule_value)
    end
  end

  def first_try_passed?
    passages = TestPassage.where(
        test_id: @test_passage.test_id,
        user_id: @test_passage.user_id
    ).count

    passages == 1
  end

  def all_level_passed?(level_number)
    tests = Test.where(level: level_number)
    (tests - @user.tests).empty?
  end

  def all_category_passed?(category_name)
    category = Category.find_by(title: category_name)
    tests    = Test.where(category: category)
    (tests - @user.tests).empty?
  end
end
