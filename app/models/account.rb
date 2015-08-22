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

  # 認証情報からAccountインスタンスを特定する
  #
  # @param [AuthHash] auth
  #   see https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
  # @return [Account] 認証したAccountインスタンス(保存されていない)
  def self.authenticate(auth)
    by_uid(auth.provider, auth.uid).first_or_initialize do |a|
      a.token = auth.credentials.token
      a.secret = auth.credentials.secret
      a.nickname = auth.info.nickname
      a.name = auth.info.name
      a.image_url = auth.info.image
      a.profile_url = auth.info.urls.fetch(auth.provider.to_s.camelize)
      if auth.credentials.expires_at
        a.expires_at = Time.zone.at(auth.credentials.expires_at)
      end
    end
  end
end
