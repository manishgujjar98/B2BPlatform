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

<body>
    <section class="container">
        <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#media-modal">Profile Page Media Upload</button>
        <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#media-modal-image">Media with Image</button>
        <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#product-details-modal">Product Details Modal</button>
     </section>
    <!-- product modal-->
    <div class="modal fade modal-default" data-keyboard="false" data-backdrop="static" id="product-details-modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal">X</button>
                    <!-- product content -->
                    <div class="col-sm-7">
                        <div class="row">
                            <div class="fullwidth">
                                <div class="img-block custom-image">
                                    <img src="images/product2.jpg" class="img-responsive" alt="product image">
                                    <div class="tagged">
                                        <h1 class="product-title">Product Name</h1>
                                        <div class="product-price">$0.00</div>
                                    </div>
                                </div>
                                <div class="meta-data">
                                    <h1 class="meta-title">Product Name</h1>
                                    <h2 class="meta-title sub">Merchant Name</h2> </div>
                                <div class="product-block">
                                    <div class="col-xs-4">
                                        <a href=""><img src="images/product2.jpg" alt="product name" class="img-responsive"></a>
                                    </div>
                                    <div class="col-xs-4">
                                        <a href=""><img src="images/product2.jpg" alt="product name" class="img-responsive"></a>
                                    </div>
                                    <div class="col-xs-4">
                                        <a href=""><img src="images/product2.jpg" alt="product name" class="img-responsive"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-5 product-details">
                        <figure class="img-block">
                            <img src="images/merchant1.png" alt="merchantimage">
                            <figcaption>Mike Lowe</figcaption>
                        </figure>
                        <div class="product-options">
                            <ul class="list-unstyled comments">
                                <li><strong>@adfdafa</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, labore.</li>
                                <li><strong>@adfdafa</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, labore.</li>
                                <li><strong>@adfdafa</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, labore.</li>
                                <li><strong>@adfdafa</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, labore.</li>
                                <li><strong>@adfdafa</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis, labore.</li>
                            </ul>
                        </div>
                        <div class="form-group add-comment">
                            <i class="fa fa-fire fa-lg"></i>
                            <input type="text" placeholder="Add Comment">
                        </div>
                        <div class="product-description">
                            <strong>Product Description</strong>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio nobis explicabo repudiandae soluta recusandae, cumque quibusdam iste beatae ipsum maxime reiciendis necessitatibus, voluptatum dolorem hic natus! Repellendus eius quod, maiores.</p>
                        </div>
                        <div class="influenced">
                            <div class="influence-title">Influence:</div>
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
                                <li>
                                    <a href=""><img src="images/merchant1.png" alt=""></a>
                                </li>
                                <li>
                                    <a href=""><img src="images/merchant2.png" alt=""></a>
                                </li>
                                <li>
                                    <a href=""><img src="images/merchant3.png" alt=""></a>
                                </li>
                                <li>
                                    <a href=""><img src="images/merchant1.png" alt=""></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- ./product content -->
                </div>
            </div>
        </div>
    </div>
    <!-- ./product modal -->
    <!-- product details modal-->
    <div class="modal fade modal-default" id="media-modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="" class="modal-upload">
                        <div class="upload-section">
                            <input type="file" class="custom-file" data-name="Upload">
                        </div>
                        <div class="caption-section">
                            <textarea name="caption" class="form-control" rows="3" placeholder="Caption"></textarea>
                        </div>
                        <div class="footer-section">
                            <div class="social-section">
                                <span style="display:inline-block;float: left;"> Share To: </span>
                                <ul class="list-inline list-unstyled">
                                    <li><a href=""><i class="fa fa-twitter fa-lg twitter"></i></a></li>
                                    <li><a href=""><i class="fa fa-facebook fa-lg facebook"></i></a></li>
                                </ul>
                            </div>
                            <div class="action-section">
                                <button class="btn btn-default white" type="Submit" data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="Submit">Post</button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- ./product details modal -->
        <!-- product details with image modal-->
    <div class="modal fade modal-default" id="media-modal-image" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="" class="modal-upload">
                        <div class="upload-section" style="background: url(images/merchant.jpg) center center no-repeat; background-size: cover;">
                           <h1>Stock Photo</h1>
                        </div>
                        <div class="caption-section">
                            <textarea name="caption" class="form-control" rows="3" placeholder="Caption"></textarea>
                        </div>
                        <div class="footer-section">
                            <div class="social-section">
                                <span style="display:inline-block;float: left;"> Share To: </span>
                                <ul class="list-inline list-unstyled">
                                    <li><a href=""><i class="fa fa-twitter fa-lg twitter"></i></a></li>
                                    <li><a href=""><i class="fa fa-facebook fa-lg facebook"></i></a></li>
                                </ul>
                            </div>
                            <div class="action-section">
                                <button class="btn btn-default white" type="Submit" data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="Submit">Post</button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- ./product details image modal -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Material desig nscript -->
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
    <!-- owl carousel -->
    <script src="vendor/owl/owl.carousel.min.js"></script>
    <!-- wow -->
    <script src="js/wow.min.js"></script>
    <script src="js/app.js"></script>
</body>

</html>
