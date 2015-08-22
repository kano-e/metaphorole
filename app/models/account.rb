# ## Schema Information
#
# Table name: `accounts`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
# **`user_id`**      | `integer`          | `not null`
# **`provider`**     | `string`           | `not null`
# **`uid`**          | `string`           | `not null`
# **`token`**        | `text`             |
# **`secret`**       | `text`             |
# **`nickname`**     | `string`           |
# **`name`**         | `string`           |
# **`image_url`**    | `text`             |
# **`profile_url`**  | `text`             |
#
# ### Indexes
#
# * `index_accounts_on_provider_and_uid` (_unique_):
#     * **`provider`**
#     * **`uid`**
# * `index_accounts_on_user_id_and_provider` (_unique_):
#     * **`user_id`**
#     * **`provider`**
#

class Account < ActiveRecord::Base
  belongs_to :user

  scope :by, ->(provider_name){ where(provider: provider_name) }
  scope :by_uid, ->(provider_name, uid){ by(provider_name).where(uid: uid) }
end
