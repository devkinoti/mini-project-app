# frozen_string_literal: true

class EnablePgExtensions < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    enable_extension 'pg_stat_statements'
  end
end
