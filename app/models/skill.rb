# ## Schema Information
#
# Table name: `skills`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`id`**             | `integer`          | `not null, primary key`
# **`created_at`**     | `datetime`         | `not null`
# **`updated_at`**     | `datetime`         | `not null`
# **`label`**          | `string`           | `not null`
# **`attack_point`**   | `integer`          | `default(0), not null`
# **`defence_point`**  | `integer`          | `default(0), not null`
# **`heal_point`**     | `integer`          | `default(0), not null`
# **`enchant_point`**  | `integer`          | `default(0), not null`
#

class Skill < ActiveRecord::Base
  has_many :skill_set_items
end
