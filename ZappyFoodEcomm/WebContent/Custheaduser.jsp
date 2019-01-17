 <%	
String count = (String)request.getAttribute(" count"); %>
<div class="organic_food_wrapper">
                <!--Header start-->
                <header class="header sticky-header">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="header_wrapper_inner">
                                   
                                    <div class="logo col-xs-12">
                                        <a href="index.html">
                                            <img src="assets/img/zappy-logo.png" alt="">
                                        </a>
                                    </div>
                                    
                                    
                                    <div class="main_menu_inner">
                                      
                                        <div class="menu">
                                            <nav>
                                                <ul>
                                                    <li class="active"><a href="index.jsp">Home <i class="fa fa-angle-down"></i></a>
                                                        <ul class="sub_menu">
                                                            <li><a href="Adminindex.jsp">Admin</a></li>
                                                            
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">about us </a> </li>
                                                    <li><a href="./view_cartservlet">cart</a>  </li>
                                                    <li><a href="custlogout.jsp">logout</a>  </li>
                                                    <li><a href="myAccountDetail">My Account</a>  </li>
                                                    
                                            
                                            </nav>
                                        </div>
                                        
                                        <div class="mobile-menu d-lg-none">
                                            <nav>
                                                 <ul>
                                                    <li class="active"><a href="index1.jsp">Home</a>
                                                        <ul>
                                                            <li><a href="Adminindex.jsp">Home Version 1</a></li>
                                                            
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">about us </a> </li>
                                                    <li><a href="./view_cartservlet">cart</a>  </li>
                                                    <li><a href="custlogout.jsp">logout</a>  </li>
                                                    <li><a href="myAccountDetail">My Account</a>  </li>
                                                  
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                    <div class="header_right_info d-flex">
                                        <div class="search_box">
                                            <div class="search_inner">
                                                <form action="#">
                                                    <input type="text" placeholder="Search our catalog">
                                                    <button type="submit"><i class="ion-ios-search"></i></button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="mini__cart">
                                            <div class="mini_cart_inner">
                                                <div class="cart_icon">
                                                    <a href="view_cartservlet">
                                                        <span class="cart_icon_inner">
                                                            <i class="ion-android-cart"></i>
                                                            <span class="cart_count">${count}</span>
                                                        </span>
                                                        <span class="item_total">rs</span>
                                                    </a>
                                                </div>
                                                <!--Mini Cart Box-->
                                                
                                                <!--Mini Cart Box End -->
                                            </div>
                                        </div>
                                        
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                </div>