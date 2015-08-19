# ## Schema Information
#
# Table name: `abilities`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`id`**             | `integer`          | `not null, primary key`
# **`created_at`**     | `datetime`         | `not null`
# **`updated_at`**     | `datetime`         | `not null`
# **`user_id`**        | `integer`          |
# **`attack_point`**   | `integer`          | `default(0), not null`
# **`defence_point`**  | `integer`          | `default(0), not null`
# **`heal_point`**     | `integer`          | `default(0), not null`
# **`enchant_point`**  | `integer`          | `default(0), not null`
#
# ### Indexes
#
# * `index_abilities_on_user_id`:
#     * **`user_id`**
#

class Ability < ActiveRecord::Base
  belongs_to :user

  scope :newer, -> { order(id: :desc) }
end
