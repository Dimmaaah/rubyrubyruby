// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$i: $cards-quantity;
@while $i > 0 {
 #slide-card-#{$i} {
   animation-name: cardslide-#{$i};
 }

 @-webkit-keyframes cardslide-#{$i} {

   // Creating percentages based on cards quantity
   $j: $cards-quantity;
   $moved: false;
   @while $j > 0 {
     $percentage: (100 / $cards-quantity) * ($cards-quantity - $j);

     @if $moved == false {
       #{$percentage}% {
         transform: translateX(- $card-total-width * ($cards-quantity - $j));
       }
       @if ($cards-quantity - $j) == $i {
         #{$percentage + 0.01}% {
           transform: translateX($card-total-width * ($cards-quantity - ($cards-quantity - $j)));
         }
         $moved: true;
       }
     } @else {
       #{$percentage}% {
         transform: translateX($card-total-width * $j);
       }
     }

     $j: $j - 1;
   }
   @if $i == $cards-quantity {
     99.99% {
       transform: translateX(- $cards-quantity * $card-total-width);
     }
   }

   100% {
     transform: translateX(0);
   }
 }

 $i: $i - 1;
}
