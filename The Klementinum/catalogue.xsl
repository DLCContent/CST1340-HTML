<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="style.xsl"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="UTF-8" />

<xsl:template match="/">
<html>
<head>
  <title>Bookstore</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }
    .header-nav {
	  position: fixed;
	  top: 0;
	  width: 100%;
	  background-color: #A08063;
	  backdrop-filter: blur(2px);
	  z-index: 1000;
	  display: flex;
	  justify-content: space-between;
	  align-items: center;
	  padding: 30px 32px;
	  transition: padding 0.3s ease-in-out;
	}

	body:has(.main-content:hover) .header-nav {
	  padding: 10px 32px;
	}
    .logo {
      font-family: "PlayfairDisplay-Medium", serif;
	  text-decoration: none;
      font-size: 24px;
      color: #fff;
      font-weight: 500;
      white-space: nowrap;
    }
	
    .nav-wrapper {
      display: flex;
      align-items: center;
      gap: 32px;
      margin-right: 60px;
    }
    .search-bar {
      display: flex;
      align-items: center;
      background-color: #ece6f0;
      border-radius: 28px;
      height: 48px;
      padding: 0 16px;
      gap: 8px;
    }
    .search-input {
      border: none;
      background: transparent;
      outline: none;
      font-size: 16px;
      color: #49454f;
    }
    .nav-links {
      display: flex;
      gap: 24px;
    }
    .nav-link {
      color: #fff;
      text-decoration: none;
      font-size: 18px;
      font-weight: 500;
    }
    .nav-link:hover {
      text-decoration: underline;
    }
    .shopping-cart {
      width: 24px;
      height: 24px;
      cursor: pointer;
    }
    .main-content {
      display: flex;
      margin-top: 120px;
    }
    .filter-sidebar {
      width: 220px;
      background-color: #fff;
      padding: 20px;
      border-right: 1px solid #ccc;
    }
    .products-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 80px;
      padding: 80px;
      flex-grow: 1;
    }
    .book-card {
      background-color: #eaeaea;
      padding: 60px;
      border-radius: 12px;
      text-align: center;
    }
    .book-card img {
      width: 100%;
      height: 500px;
      object-fit: cover;
      margin-bottom: 30px;
    }
	.book-card-link {
	  text-decoration: none;
	  color: inherit;
	  display: block;
	}

	.cart-btn {
	  position: relative;
	  z-index: 1; /* ensure button is clickable above the link */
	  pointer-events: auto;
      background-color: #333;
      color: white;
      border: none;
      padding: 8px 16px;
      border-radius: 4px;
      cursor: pointer;
    }
	.cart-btn:hover {
    background-color: #e65c00;
  }

  .cart-message {
    margin-top: 5px;
    font-size: 14px;
    font-weight: bold;
    color: green;
    display: none;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
  }

  .cart-btn:focus + .cart-message {
    display: block;
    opacity: 1;
    animation: showMessage 2s forwards;
  }

  @keyframes showMessage {
    0% { opacity: 1; }
    90% { opacity: 1; }
    100% { opacity: 0; display: none; }
  }
  
  /* Footer Section */
  .footer-container {
      background: #222;
      color: white;
      padding: 20px 0;
      text-align: center;
  }

  .footer-content {
      display: flex;
      justify-content: space-between;
      max-width: 1200px;
      margin: auto;
      padding: 20px;
      flex-wrap: wrap;
      text-align: left;
  }

  .footer-section {
      flex: 1;
      min-width: 250px;
      padding: 10px;
  }

  .footer-section h3 {
      margin-bottom: 10px;
      font-size: 18px;
  }

  .footer-section p, 
  .footer-section a {
      display: block;
      color: white;
      text-decoration: none;
      font-size: 16px;
      margin-bottom: 8px;
  }

  .footer-section a:hover {
      text-decoration: underline;
  }

  /* Social Media Styling */
	  .social-icon {
	display: block;
	}

  .footer-bottom {
      margin-top: 20px;
      font-size: 14px;
      opacity: 0.7;
  }

  /* Responsive Design */
  @media (max-width: 768px) {
      .footer-content {
          flex-direction: column;
          text-align: center;
      }

      .footer-section {
          margin-bottom: 20px;
      }
  }

  </style>
</head>

<body>

  <!-- Header -->
  <div class="header-container">
  <div class="header-nav">
    <div class="logo">
      <a href="index-m.html" class="logo">The Klementinum Library</a>
    </div>
    <div class="nav-wrapper">
      <div class="search-bar">
        <input class="search-input" type="text" placeholder="Search..."/>
      </div>
      <div class="nav-links">
        <a href="index-m.html" class="nav-link">Home</a>
        <a href="BookInfo.xml" class="nav-link">Catalog</a>
        <a href="aboutus.html" class="nav-link">About us</a>
        <img src="images/icons8-cart-24.png" class="shopping-cart"/>
      </div>
    </div>
  </div>
</div>

  <!-- Page Layout -->
  <div class="main-content">

    <!-- Filter Sidebar -->
    <div class="filter-sidebar">
  <h3>Filter Results</h3>

  <p><strong>Price</strong></p>
  <input type="range" min="0" max="50" value="25" step="1"/>
  <p style="font-size: 14px;">AED 0 - 50</p>

  <p><strong>Genre</strong></p> <!-- FOR STATIC WEBPAGE DEMONSTRATION PURPOSES, OTHER GENRES WILL BE DISABLED -->
<form action="thriller.xml" method="get">
  <label>
    <input type="checkbox" name="thriller" value="1"/> Thriller
  </label><br/>
  <label>
    <input type="checkbox" name="romance" value="1" disabled="disabled"/> Romance
  </label><br/>
  <label>
    <input type="checkbox" name="mystery" value="1" disabled="disabled"/> Mystery
  </label><br/>
  <label>
    <input type="checkbox" name="fiction" value="1" disabled="disabled"/> Fiction
  </label><br/>
  <label>
    <input type="checkbox" name="horror" value="1" disabled="disabled"/> Horror
  </label><br/><br/>

  <input type="submit" value="Apply Filters" class="cart-btn"/>
</form>

  <p><strong>Sort By</strong></p>
  <form>
    <label><input type="checkbox" disabled="disabled"/> New Release</label><br/>
    <label><input type="checkbox" disabled="disabled"/> Trending</label>
  </form>
</div>

		<!-- Products Grid -->
	<div class="products-grid">
	  <xsl:for-each select="bookstore/book">
		<div class="book-card">
		  <a href="{link}" class="book-card-link">
			<img>
			  <xsl:attribute name="src">
				<xsl:value-of select="image"/>
			  </xsl:attribute>
			  <xsl:attribute name="alt">
				<xsl:value-of select="title"/>
			  </xsl:attribute>
			</img>
			<h4><xsl:value-of select="title"/></h4>
			<p><xsl:value-of select="author"/></p>
			<p><xsl:value-of select="price"/></p>
		  </a>

		  <!-- This button is now separate and won't trigger the link -->
		  <button class="cart-btn" tabindex="0">Add To Cart</button>
		  <div class="cart-message">✔ Added to cart!</div>
		</div>
	  </xsl:for-each>
	</div>

  </div>

	<!-- Footer -->
	<div class="footer-container">
	  <div class="footer-content">
		<div class="footer-section">
		  <h3>Company</h3>
		  <p><strong>Location:</strong> UAE, Dubai</p>
            <a href="#">About Us</a>
            <a href="#">Careers</a>
		</div>
		<div class="footer-section">
		  <h3>Contact</h3>
		  <p><strong>Phone:</strong>+971 123 456 789</p>
		  <p><strong>Email:</strong>info@klementinum.com</p>
		</div>
		<div class="footer-section">
		  <h3>Follow Us</h3>
		  <div class="social-icon">
			<a href="#">Facebook</a>
			<a href="#">Twitter</a>
			<a href="#">Instagram</a>
		  </div>
		</div>
	  </div>
	  <div class="footer-bottom">
		 2025 The Klementinum Library. All rights reserved.
	  </div>
	</div>

</body>
</html>
</xsl:template>
</xsl:stylesheet>