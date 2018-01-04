<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>TrendSetr</title>
    <link rel="shortcut icon" href="">
    <!-- Material design icons -->
    <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.red-purple.min.css">
    <link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css" />
    <!-- Material design fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="vendor/owl/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="vendor/owl/assets/owl.theme.default.min.css">
    <!-- animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- custom styles -->
    <link rel="stylesheet" href="css/app.css">
    <!--[if IE]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="bglightgray user-profile">
    <!-- header -->
 <%@include file="customerNavigation.jsp"%>
    <!-- ./header -->
    <!-- user-feed-block -->
    <section id="user-feed" style="background-image:url(images/merchantbanner1.png);" class="col-xs-12 wow">
        <section class="row">
            <div class="profile">
                <div class="user-feed-image">
                    <a href="#" class="dropdown edit-image">
                        <img src="images/profile2.png" alt="profile image">
                        <div class="overlay">
                            <span>Change <br>  profile <br>image</span>
                            <i class="fa fa-camera fa-lg"></i>
                        </div>
                    </a>
                </div>
                <ul class="upload-menu list-unstyled">
                    <li><a href="#">Upload Profile Photo</a></li>
                    <li><a href="#">Upload Banner Photo</a></li>
                </ul>
                <div class="user-feed-name">
                    <span>Mike Lowe</span>
                    <span>@mikelowe</span>
                </div>
            </div>
            <div class="feed-strip tint">
                <div class="followers-strip">
                    <div>278 Followers</div>
                    <div>678 Following</div>
                </div>
                <div class="custom-nav-tabs">
                    <ul class="nav nav-tabs">
                        <li><a href="">Feed</a></li>
                        <li class="active"><a href="">Media</a></li>
                        <li><a href="#">Likes</a></li>
                    </ul>
                </div>
            </div>
        </section>
    </section>
    <!-- user-feed-block -->
    <!-- content wrapper -->
    <section class="col-xs-12">
        <section class="row">
            <section class="wrapper mt20">
                <!-- products for you -->
                <aside class="aside left-side">
                    <div class="inner-block">
                    </div>
                </aside>
                <!-- products for you -->
                <!-- people you may know -->
                <aside class="aside right-aside">
                </aside>
                <!-- people you many know -->
                <!-- main content -->
                <article class="main">
                    <div class="col-xs-12 likes">
                        <div class="row">
                            <ul id="media-container" class="list-unstyled list-inline">
                                <li class="grid-item truck-container">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-camera truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Upload Photo</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                        <li class="message-block"><span class="message">If you want to upload a photo to TrendSetr try out our mobile App!</span></li>
                                    </ul>
                                </li>
                                <li class="grid-item truck-container">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-camera truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Upload Photo</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                        <li class="message-block"><span class="message">If you want to upload a photo to TrendSetr try out our mobile App!</span></li>
                                    </ul>
                                    <footer>
                                        <span>Ready!</span>
                                    </footer>
                                </li>
                                <li class="grid-item">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <footer>
                                        <div class="influenced">
                                            <ul class="list-inline list-unstyled mb0">
                                                <li>
                                                    <a href=""><img src="images/merchant1.png" alt=""></a>
                                                </li>
                                                <li>
                                                    <a href=""><img src="images/merchant2.png" alt=""></a>
                                                </li>
                                                <li>
                                                    <a href=""><img src="images/merchant3.png" alt=""></a>
                                                </li>
                                               
                                            </ul>
                                        </div>
                                    </footer>
                                </li>
                                <li class="grid-item camera-container">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-truck fa-flip-horizontal truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Track Your Order</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                    </ul>
                                    <footer>
                                        <span>On The Way</span>
                                    </footer>
                                </li>
                                <li class="grid-item truck-container">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-camera truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Upload Photo</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                        <li class="message-block"><span class="message">If you want to upload a photo to TrendSetr try out our mobile App!</span></li>
                                    </ul>
                                </li>
                                <li class="grid-item truck-container">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-camera truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Upload Photo</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                        <li class="message-block"><span class="message">If you want to upload a photo to TrendSetr try out our mobile App!</span></li>
                                    </ul>
                                </li>
                                <li class="grid-item truck-container">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-camera truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Upload Photo</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                        <li class="message-block"><span class="message">If you want to upload a photo to TrendSetr try out our mobile App!</span></li>
                                    </ul>
                                </li>
                                <li class="grid-item truck-container">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-camera truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Upload Photo</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                        <li class="message-block"><span class="message">If you want to upload a photo to TrendSetr try out our mobile App!</span></li>
                                    </ul>
                                </li>
                                <li class="grid-item truck-container">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-camera truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Upload Photo</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                        <li class="message-block"><span class="message">If you want to upload a photo to TrendSetr try out our mobile App!</span></li>
                                    </ul>
                                </li>
                                <li class="grid-item">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <a href="#" class="block overlay truck">
                                        <div class="fullwidth">
                                            <i class="fa fa-camera truck-image"></i>
                                        </div>
                                    </a>
                                    <ul class="upload-popup list-unstyled">
                                        <li><a href="">Upload Photo</a></li>
                                        <li><a href="">Post Stock Photo</a></li>
                                        <li class="message-block"><span class="message">If you want to upload a photo to TrendSetr try out our mobile App!</span></li>
                                    </ul>
                                </li>
                                <li class="grid-item">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <footer>
                                        <div class="influenced">
                                            <ul class="list-inline list-unstyled mb0">
                                                <li>
                                                    <a href=""><img src="images/merchant1.png" alt=""></a>
                                                </li>
                                                <li>
                                                    <a href=""><img src="images/merchant2.png" alt=""></a>
                                                </li>
                                                <li>
                                                    <a href=""><img src="images/merchant3.png" alt=""></a>
                                                </li>
                                               
                                            </ul>
                                        </div>
                                    </footer>
                                </li>
                                <li class="grid-item">
                                    <div class="main-image">
                                        <img src="http://lorempixel.com/280/300/" alt="image" class="img-responsive">
                                    </div>
                                    <footer>
                                        <div class="influenced">
                                            <ul class="list-inline list-unstyled mb0">
                                                <li>
                                                    <a href=""><img src="images/merchant1.png" alt=""></a>
                                                </li>
                                                <li>
                                                    <a href=""><img src="images/merchant2.png" alt=""></a>
                                                </li>
                                                <li>
                                                    <a href=""><img src="images/merchant3.png" alt=""></a>
                                                </li>
                                               
                                            </ul>
                                        </div>
                                    </footer>
                                </li>
                            </ul>
                        </div>
                    </div>
                </article>
            </section>
        </section>
    </section>
    <!-- ./content wrapper -->
   <!-- ./product details image modal -->
	<!-- Add Java Scripts here -->
	<%@include file="customerFooter.jsp"%>
	<!-- ./Add Java Scripts here -->
	<script>
    $(document).ready(function() {
        // when ever user clicks on the truck or image show popup
        $('.truck').on('click', function(e) {
            e.preventDefault();
            $(this).next('.upload-popup').fadeToggle();
        });



        function setMansonary() {
            $col = 2;
            $space = 1;
            $width = $(window).width();

            if ($width < 600) {
                $col = 2;
            } else if ($width > 600 && $width < 992) {
                $col = 3;
            } else if ($width > 992) {
                $col = 4;
            }

            var $grid = $('#media-container');
            new MasonryHybrid($grid, {
                col: $col,
                space: $space
            });

        };
        setMansonary();
    });
    </script>
</body>

</html>
