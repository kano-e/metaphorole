# ## Schema Information
#
# Table name: `skill_set_items`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`id`**            | `integer`          | `not null, primary key`
# **`created_at`**    | `datetime`         | `not null`
# **`updated_at`**    | `datetime`         | `not null`
# **`skill_set_id`**  | `integer`          |
# **`skill_id`**      | `integer`          |
# **`number`**        | `integer`          |
#
# ### Indexes
#
# * `index_skill_set_items_on_skill_id`:
#     * **`skill_id`**
# * `index_skill_set_items_on_skill_set_id`:
#     * **`skill_set_id`**
#

class SkillSetItem < ActiveRecord::Base
  belongs_to :skill_set
  belongs_to :skill
end
