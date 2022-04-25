class RanksController < ApplicationController

def rank
  # 投稿のいいね数ランキング
  @post_like_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id).limit(5))
  @post_comment_ranks = Post.find(PostComment.group(:post_id).order('count(post_id) desc').pluck(:post_id))
end

end
