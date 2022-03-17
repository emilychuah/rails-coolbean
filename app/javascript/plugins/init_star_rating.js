import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
  $('#review_rating').css("display", "none")
};

export { initStarRating };
