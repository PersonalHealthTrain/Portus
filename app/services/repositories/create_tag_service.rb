# frozen_string_literal: true

module Repositories
  class CreateTagService < ::BaseService
    attr_accessor :error

    ## Creates a new tag by name on the repository
    def execute(repository, old_tag_name, new_tag_name)
      Repository.create_new_tag(repository, old_tag_name, new_tag_name)
    end
  end
end
