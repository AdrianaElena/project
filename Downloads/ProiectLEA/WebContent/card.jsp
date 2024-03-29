<%-- 
    Document   : card
    Created on : Feb 20, 2019, 7:36:20 PM
    Author     : adria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Card Page</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="cardGroups.css">
    </head>

    <body>

        <div class="container">
            <div class="card-deck">
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x280" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">1 Card title</h4>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x280" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">2 Card title</h4>
                        <p class="card-text">This is a longer card with supporting text below as a natural leal content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="w-100 d-none d-sm-block d-md-none"><!-- wrap every 2 on sm--></div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x280" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">3 Card title</h4>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="w-100 d-none d-md-block d-lg-none"><!-- wrap every 3 on md--></div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x280" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">4 Card title</h4>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="w-100 d-none d-sm-block d-md-none"><!-- wrap every 2 on sm--></div>
                <div class="w-100 d-none d-lg-block d-xl-none"><!-- wrap every 4 on lg--></div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x280" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">5 Card title</h4>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="w-100 d-none d-xl-block"><!-- wrap every 5 on xl--></div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x300" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">6 Card title</h4>
                        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="w-100 d-none d-sm-block d-md-none"><!-- wrap every 2 on sm--></div>
                <div class="w-100 d-none d-md-block d-lg-none"><!-- wrap every 3 on md--></div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x270" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">7 Card title</h4>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x300" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">8 Card title</h4>
                        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="w-100 d-none d-sm-block d-md-none"><!-- wrap every 2 on sm--></div>
                <div class="w-100 d-none d-lg-block d-xl-none"><!-- wrap every 4 on lg--></div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x270" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="w-100 d-none d-md-block d-lg-none"><!-- wrap every 3 on md--></div>
                <div class="card mb-4">
                    <img class="card-img-top img-fluid" src="//placehold.it/500x270" alt="Card image cap">
                    <div class="card-body">
                        <h4 class="card-title">10 Card title</h4>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
