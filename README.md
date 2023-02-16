<base target="_blank">

# tidder - a Reddit-clone web application.

The app is live at [tidder.eu](https://www.tidder.eu).

</br>
</br>
<div class="d-flex align-items-center">
  <img
    src="https://user-images.githubusercontent.com/108831121/219307211-47535c00-a5ac-4e53-a9f0-9b597b93d6ef.png"
    height="700"
    height="auto">
  <a class="d-flex align-items-center"
    href="https://vimeo.com/798677053"
    title="tidder demo"
    target="_blank"
   >
    <img
      src="https://user-images.githubusercontent.com/108831121/219307567-74f3a448-ce66-4000-8fa6-38650c161dfe.png"
      alt="MessageMate demo"
      height="650"
    />
  </a>

</div>
</br>
<div>
  <img src="https://user-images.githubusercontent.com/108831121/219307249-2d81a68d-a558-4bc1-baeb-e18fff61ddde.png" width="600" height="auto">
</div>
</br>
</br>

## Features
- A user can sign up and sign in. Email and password can be edited by the user at a later time.
- A user can create a new post.
- A user can upvote or downvote a post.
- A user can create a new comment on a post.
- A user can upvote or downvote a comment on a post.
- Secure authentication.
- Mobile responsiveness to ensure optimal user experience.

</br>

## Technologies
Tidder is built with [Ruby on Rails](https://rubyonrails.org/) on both backend and frontend. Data is stored in a PostgreSQL database and Cloudinary is used for cloud storage of the profile image files. Authentication is being handled with the [Devise gem](https://github.com/heartcombo/devise). This ensures the user to securely sign in and sign up to the application.


The application is additionally supported by Webpack, simple_form, act_as_votable, stimulus and bootstrap.

</br>

## Technical challenges
### Upvote and downvote
The inclusion of the renowned upvote and downvote system, which was first introduced by [Everything2](https://everything2.com/title/An+Introduction+to+Everything2) and later adopted by Reddit and other platforms, has become an essential feature in the development of a Reddit-like platform, as it has gained widespread popularity across various websites and applications. The first approach to achieve this feature was done by making everything from scratch with the appropriate database tables and making the logic in the controllers. After some research it was decided to go with the Ruby on Rails gem [acts_as_votable](https://github.com/ryanto/acts_as_votable) which was developed by [Ryan Toronto](https://github.com/ryanto).
</br>
At first glance, the acts_as_votable gem provides a straightforward solution to the upvote and downvote feature. However, it doesn't offer an immediate solution for displaying the votes in real-time to the user. To achieve this functionality, additional technologies such as AJAX  to be implemented.
</br>
First the databases are created according to the act_as_votable documentation. Then simply the terms "acts_as_voter" or "acts_as_votable" are added to the appropriate models. The voting logic is implemented in the controllers. For instance, in the posts controller, the upvote and downvote functions are defined. Whenever a user clicks the upvote or downvote button, the respective function is called, updating the post with the user's vote. The code for the upvote and downvote functions is similar for other controllers that utilize the voting feature. The code below is from the posts controller.

```.rb
# app/controllers/posts_controller.rb

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_up_on? @post
      @post.unvote_by current_user
    else
      @post.upvote_by current_user
    end
    redirect_to root_path

  end

  def downvote
    @post = Post.find(params[:id])
    if current_user.voted_down_on? @post
      @post.unvote_by current_user
    else
      @post.downvote_by current_user
    end
    redirect_to root_path
  end
```

</br>

Upvote and downvote in the views. Below shown by an example of upvote a post.

</br>

```.html
<!-- app/views/posts/_upvote_link.html.erb -->

<%= content_tag "div", id: "upvote-#{post.id}" do %>
  <%= link_to upvote_post_path(post), method: :patch, remote: true, data: { disable_with: "voting..." } do %>
    <% if current_user.voted_up_on? post %>
      <i class="fa-solid fa-arrow-up" style="color: green;"></i>
    <% else %>
      <i class="fa-solid fa-arrow-up"></i>
    <% end %>
  <% end %>
<% end %>
```

## Upcoming features
- Sort out authorization issues and dependencies.
- AJAX on upvote and downvote.
- Create a profile and add a profile picture.
- Search for a post.
- Save a post.
- Share a post.
