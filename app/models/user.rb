class User < ApplicationRecord

 def test_by_level(level)
    Test.joins('JOIN passed_tests ON tests.id = passed_tests.test_id')
        .where('passed_tests.user_id = ? AND tests.level = ?', id, level)
  end
end
