# frozen_string_literal: true

class AwardWithBadgeService
  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
  end

  def award
    @badges = Badge.all
    @badges.each do |badge|
      if badge.rule == 'first_try'
        passages = TestPassage.where(
          test_id: @test_passage.test_id,
          user_id: @test_passage.user_id
        ).count

        @user.badges.push(badge) if passages == 1
      elsif badge.rule.start_with?('all_level:')
        level = badge.rule[10..-1].to_i
        tests = Test.where(level: level)
        @user.badges.push(badge) if (tests - @user.tests).empty?
      elsif badge.rule.start_with?('all_category:')
        category = badge.rule[12..-1]
        category = Category.find_by(title: category)
        tests    = Test.where(category: category)
        @user.badges.push(badge) if (tests - @user.tests).empty?
      end
    end
  end
end
