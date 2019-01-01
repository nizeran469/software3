/*================================================
[  Table of contents  ]
==================================================
 1. Mobile Menu Activation
 2 Checkout Page Activation
 3. NivoSlider Activation
 4. Collection Activation
 5. Parallax Activation
 6. Related Product Activation
 7. Top Product Activation
 8. Brand Banner Activation
 9. Blog Activation
 10. WOW Js Activation
 11. ScrollUp Activation
 12. Sticky-Menu Activation
 13. Price Slider Activation
================================================*/

(function ($) {
    "use Strict";

    /*----------------------------
    1. Mobile Menu Activation
    -----------------------------*/
    jQuery('.mobile-menu nav').meanmenu({
        meanScreenWidth: "991",
    });

    /*----------------------------
    2 Checkout Page Activation
    -----------------------------*/
    $('#ship-box').on('click', function () {
        $('#ship-box-info').slideToggle();
    });

    /*----------------------------
    3. NivoSlider Activation
    -----------------------------*/
    $('#slider').nivoSlider({
        effect: 'random',
        animSpeed: 300,
        pauseTime: 5000,
        directionNav: false,
        manualAdvance: true,
        controlNavThumbs: false,
        pauseOnHover: true,
        controlNav: true,
        prevText: "<i class='zmdi zmdi-chevron-left'></i>",
        nextText: "<i class='zmdi zmdi-chevron-right'></i>"
    });

    /*----------------------------------------------------
    6. Related Product Activation
    -----------------------------------------------------*/
    $('.kiosk-related-product').owlCarousel({
        loop: false,
        nav: true,
        dots: false,
        smartSpeed: 1000,

        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        margin: 30,
        responsive: {
            0: {
                items: 1,
                autoplay: true
            },
            480: {
                items: 2
            },
            768: {
                items: 2
            },
            1000: {
                items: 3
            },
            1200: {
                items: 4
            }
        }

    })

    /*----------------------------------------------------
    7. Top Product Activation
    -----------------------------------------------------*/
    $('.kiosk-top-active').owlCarousel({
        loop: false,
        nav: true,
        dots: false,
        smartSpeed: 1200,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        margin: 30,
        responsive: {
            0: {
                items: 1,
                // autoplay:true
            },
            480: {
                items: 2,
                autoplay: true
            },
            768: {
                items: 3,
                autoplay: true
            },
            992: {
                items: 3,
                autoplay: true
            },
            1200: {
                items: 5,
                autoplay:true
            }
        }
    })

    /*----------------------------------------------------
    8. Brand Banner Activation
    -----------------------------------------------------*/
    $('.kiosk-brand').on('changed.owl.carousel initialized.owl.carousel', function (event) {
        $(event.target)

            .find('.owl-item').removeClass('last')
            .eq(event.item.index + event.page.size - 1).addClass('last');

        $(event.target)
            .find('.owl-item').removeClass('first')
            .eq(event.item.index).addClass('first')


    }).owlCarousel({
        loop: false,
        nav: false,
        dots: false,
        smartSpeed: 1200,
        margin: 1,
        responsive: {
            0: {
                items: 1,
                autoplay: true
            },
            480: {
                items: 3
            },
            768: {
                items: 4
            },
            1000: {
                items: 5
            }
        }
    })

    /*----------------------------------------------------
    9. Blog Activation
    -----------------------------------------------------*/
    $('.kiosk-blog').owlCarousel({
        loop: false,
        nav: true,
        dots: false,
        smartSpeed: 1000,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        margin: 30,
        responsive: {
            0: {
                items: 1,
                autoplay: true
            },
            768: {
                items: 2
            },
            1000: {
                items: 3
            }
        }
    })

    /*----------------------------
    10. WOW Js Activation
    -----------------------------*/
    new WOW().init();

    /*----------------------------
    11. ScrollUp Activation
    -----------------------------*/


    /*----------------------------
    12. Sticky-Menu Activation
    ------------------------------ */
    $(window).on('scroll', function () {
        if ($(this).scrollTop() > 150) {
            $('.header-sticky').addClass("sticky");
        } else {
            $('.header-sticky').removeClass("sticky");
        }
    })});
