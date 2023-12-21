import 'package:flutter/material.dart';

final List<Color> backgroundGradient = [
  Colors.teal.shade800,
  Colors.green.shade800,
];
const whiteColor = Colors.white;

final List<Color> background2Gradient = [
  Colors.cyan.shade800,
  Colors.green.shade800,
]; //C

Image googleLogo = Image.network(
    "https://cdn1.iconfinder.com/data/icons/logos-brands-in-colors/544/Google__G__Logo-128.png");
Image facebookLogo = Image.network(
    "https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Facebook_colored_svg_copy-256.png");
Image twitterLogo = Image.network(
    "https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Twitter3_colored_svg-256.png");

final brandslist = [
  "https://imgs.search.brave.com/bjg7gykpPdjFGVXKGknTGjfA-5NvsXwCPKttyFv6XKw/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zc2xp/bWFnZXMuc2hvcHBl/cnNzdG9wLmNvbS9z/eXMtbWFzdGVyL3Jv/b3QvaGJjL2g3Yi8z/MDY0ODgyMTY0NTM0/Mi9TaG9wcGVycy1T/dG9wLVNlbGVjdHMt/V2ViLWthc2hpc2gt/Xy1oYXV0Y3Vycnlf/MTIwODIzLmpwZw",
  "https://imgs.search.brave.com/CAmLawPwdmej02L0Z_dAQwVoDz70jelm9cxg85eD_V4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zc2xp/bWFnZXMuc2hvcHBl/cnNzdG9wLmNvbS9z/eXMtbWFzdGVyL3Jv/b3QvaGY1L2hkMC8z/MDY0ODgyMjAzODU1/OC9TaG9wcGVycy1T/dG9wLVNlbGVjdHMt/V2ViLUluc2Vuc2Ut/Xy1BbHRsaWZlXzEy/MDgyMy5qcGc",
  "https://imgs.search.brave.com/DcDWbT0j-8LllSK3rzTTAYKAP8EiOB6A0GXyf_Jp5sY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zc2xp/bWFnZXMuc2hvcHBl/cnNzdG9wLmNvbS9z/eXMtbWFzdGVyL3Jv/b3QvaDhhL2g4NS8z/MDY0ODgyMTkwNzQ4/Ni9TaG9wcGVycy1T/dG9wLVNlbGVjdHMt/V2ViLWxpZmUtXy1p/bmZ1c2VfMTIwODIz/LmpwZw",
  "https://imgs.search.brave.com/pxGURPZM0SrTzsj5e5M2JrKIUj3QTgFlrhrv5L2by54/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zc2xp/bWFnZXMuc2hvcHBl/cnNzdG9wLmNvbS9z/eXMtbWFzdGVyL3Jv/b3QvaGM0L2hkNi8y/OTI1OTE3ODYwNjYy/Mi9GcmFncmFuY2Ut/RmluZGVyLVdlYl91/anRyZnNnaHJ0Y3Zj/YnYuanBn",
];
final brandList2 = [
  "https://imgs.search.brave.com/k2bqwPyp2RTismaIEKuiDP8HCJtLxUJOll59E6O-pqU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jLm5k/dHZpbWcuY29tLzIw/MjMtMTEvbXVkdmJk/bG9fcmlnaHRfNjI1/eDMwMF8yNF9Ob3Zl/bWJlcl8yMy5wbmc",
  "https://imgs.search.brave.com/Z_4MYpIgxM-pSGF6qr-K6HRaWB0CHqmqxDJzwpEyfzE/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9oaXBz/LmhlYXJzdGFwcHMu/Y29tL2htZy1wcm9k/L2ltYWdlcy9zaG9w/cGluZy1iYWdzLTE0/NzM4ODgxMzkuanBn/P2Nyb3A9MC44OTF4/dzoxLjAweGg7MC4w/NTU0eHcsMCZyZXNp/emU9MTIwMDoq",
  "https://imgs.search.brave.com/B44SINETHWAvITlSP_7uZIHwQi-ysIdUTFnWMUYUxvI/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zdHls/ZWNhc3Rlci5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMjMv/MDQvYW1hem9uLXNw/cmluZy1tYXhpLWRy/ZXNzLmpwZz93PTk2/MCZoPTU0MCZjcm9w/PTE",
  "https://imgs.search.brave.com/d-bwIbIXYt4IdstFDHO0QyGOzPTye21-zwOcwFhhrCY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/Y2hpY21vZXkuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIw/LzA5L01ha2V1cC1T/YWxlcy1EZWFscy1U/aGlzLVdlZWstNzY1/eDQ1MC5qcGc"
];



final brandList3 = [
  "https://imgs.search.brave.com/tR083SmOKcXDHCaTJhDK16UC40Fr36qdKOqqpavmEBA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTM0/MTI3MzkyNi9waG90/by9nby1zaG9wcGlu/Zy1zdHlsaXNoLXdv/bWFuLWhvdC1zYWxl/LWhvbGlkYXkuanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPWRk/LXZhM3d5QTBxamh4/ZEtWTVBKc0hicE5u/enB4Z2M3N3lZcldi/M1MtWjQ9",
  "https://imgs.search.brave.com/QIu8PO5_QV-aviwMQ95OmITAz2AOQHIcoi2hAA9PkzY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLmV0/c3lzdGF0aWMuY29t/LzMyNDc3MzA2L2Mv/MjAwMC8xNTg5LzAv/Mjk5L2lsL2Y4YTBl/Mi81NDE0MDA1OTgw/L2lsXzM0MHgyNzAu/NTQxNDAwNTk4MF9v/aDE4LmpwZw",
  "https://imgs.search.brave.com/tSWTGsEbWgPqBeRnCDWjnN2zjM2oX0VGB39B6VGr-jQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtYWthLmphcmVk/LmNvbS9qYXJlZC9l/ZHVjYXRpb24vb25s/aW5lX2VuZ2FnZW1l/bnRfc2hvcHBpbmcv/aGFsby5qcGc",
  "https://imgs.search.brave.com/Q5b2b4fMU379Cq5KGxVMhJmC3_4mohis-P1Wx3H5Hk4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzA4LzFi/L2EzLzA4MWJhM2Q5/YWFjZTgwZGFjMjU5/ZWE2NDgyOGU5MjIy/LmpwZw",
];

final product2 = [
  "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/21209326/2023/1/11/ef0dbde1-af80-4465-8b7b-6025cdb867c41673437032164-kasee-Embellished-Beads-and-Stones-Saree-8081673437031391-1.jpg",
  "https://www.realmenrealstyle.com/wp-content/uploads/2023/07/How-To-Wear-A-Suit-In-Hot-Weather.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr9MF7pUesLDjE7p-sxUGSL30OABFJB3PbrQ&usqp=CAU",
  "https://img.freepik.com/premium-photo/pink-display-cosmetics-including-brand-name-brand_948735-65027.jpg",
  "https://rukminim2.flixcart.com/image/850/1000/ku8pbbk0/role-play-toy/d/z/q/doctor-set-toy-for-2-10-years-old-kids-multicolor-pack-of-1-150-original-imag7enuqsnkkwbe.jpeg?q=20",
  "https://imgs.search.brave.com/3J8NT3ZhgZJ4ewPiM9GwshbduSTTt7dVSrfG7E8bsR8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/Y25ldC5jb20vYS9p/bWcvcmVzaXplLzAw/MjJmM2UxOWQ0MzNj/MTdhNDYxOTM2MzFj/ZjBhYjRmZjU0ZTA3/MjUvaHViLzIwMjAv/MDMvMjMvYjljYWEz/ZmEtY2RhNy00ZDUz/LWI0MzctN2I5NjRj/MjQxZDZhL2JpcmQt/b2YtcGFyYWRpc2Ut/a2l0Y2hlbmFpZC1z/dGFuZC1taXhlcnMt/a3NtMTUwcHNwaC00/MC02MDAuanBnP2F1/dG89d2VicCZ3aWR0/aD0xMjAw",
  "https://www.tradeindia.com/_next/image/?url=https%3A%2F%2Ftiimg.tistatic.com%2Ffp%2F1%2F008%2F532%2Fnri-gold-jewellery-213.jpg&w=750&q=75",
  "https://www.digitaltrends.com/wp-content/uploads/2022/08/iPhone-SE-2022-Starlight-Back-in-Hand.jpg?resize=625%2C417&p=1",
  "https://m.media-amazon.com/images/I/51cfbiWYd3S._AC_UF1000,1000_QL80_DpWeblab_.jpg",
];
final productName2 = [
  "Women Dress",
  "Men Fashion",
  "Computer",
  "Makeup",
  "Kids & Toys",
  "Appliances",
  "Jeweller",
  "Cellphone & Tab",
  "Furniture",
];


final profileButtonList = [
  "My Orders",
  "My Wishlist",
];
final profileButtonIcon = [
  Icons.clear_all,
  Icons.clear_all_rounded,
];

class LoadingIndicator {
  loadingIndicator() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
    );
  }
}

const paymentMethodList = [
  "https://www.mediainfoline.com/wp-content/uploads/2020/10/PhonePe.jpg",
  "https://lh3.googleusercontent.com/sLOqRZU_8S8C9xMIyc7kD74pyIuJWUi5zBsopj95PZ6C78PFRxwaLN0mMfDbQhKM0F9VEsM-L_0wt-q-HAJwDr3phCjzNjASyjSL",
  "https://static.vecteezy.com/system/resources/previews/010/595/642/original/cod-cash-on-delivery-truck-car-graphic-free-vector.jpg"
];
const paymentMethodName = ["PhonePe", "Google", "Cash on delivery"];
final colors = [
  Colors.teal,
  Colors.blue,
  Colors.green,
  Colors.pink,
  Colors.purple,
  Colors.indigo,
  Colors.yellow,
  Colors.red,
  Colors.orange,
];
const popMenuTitles = ["Featured", "Edit", "Remove"];
const popMenuIcon = [Icons.featured_play_list, Icons.edit, Icons.delete];

const totalImage = [
  "https://assets.ajio.com/medias/sys_master/root/20231011/gr2p/6526a4cdafa4cf41f53b940b/aask_red_women_fit_%26_flare_dress_with_puff_sleeves.jpg",
  "https://www.soosi.co.in/cdn/shop/products/WhatsAppImage2023-03-25at1.32.38AM_1200x1200.jpg?v=1679739030",
  "https://dmgml9qd9iax4.cloudfront.net/media/catalog/product/cache/a18019ae8a78fbef3e14b2651624404f/d/u/dusty-golden-embellished-chiffon-saree-prf192102.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSLntkMvMdlccYrnqwbyZmoi34xN3BrfMfTw&usqp=CAU",
  "https://ik.imagekit.io/wb2spwtue/kreeva/tr:h-430,w-315,q-80,cm-pad_resize/media/catalog/product/0/0/002_4.jpg",
  "https://images-static.nykaa.com/media/catalog/product/e/4/e40d7eansn50_nyr2_48.jpeg?tr=w-500,pr-true",
  "https://www.foreverkidz.in/cdn/shop/products/Inthegardenfff_1_590x.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuHMUMbwIWg6VgE8IPaC9lfexE4QCX-8Pt3A&usqp=CAU",
  "https://img.perniaspopupshop.com/catalog/product/c/h/CHOBT082201_1.jpg?impolicy=detailimageprod",
  "https://i.etsystatic.com/29432240/r/il/88ae64/3821214339/il_570xN.3821214339_cjnx.jpg",
  "https://i.etsystatic.com/26961857/r/il/d31eb4/4778876037/il_fullxfull.4778876037_lznh.jpg",
  "https://rukminim2.flixcart.com/image/450/500/xif0q/clutch/8/7/5/-original-imaggbwdqtzbnncp.jpeg?q=90&crop=false",
];
const totalName = [
  "Women's Dresses",
  "Gold Plated Watch",
  "Clearance Sale on Sarees",
  "Peach Color Lip Balm",
  "Indian Gown dress ",
  "Gold Plated Necklace",
  "Party Modern Kids Dress",
  "Pencil Heels ",
  "Embroidered Lehenga Set ",
  "Flower Girls Shoes",
  "Girls Formal Dresses",
  "Ladies Purse",
];

const totalPrice = [
  "400",
  "800",
  "1000",
  "900",
  "500",
  "700",
  "1100",
  "450",
  "2500",
  "1500",
  "790",
  "600",
];
const fleshImage = [
  "https://getketchadmin.getketch.com/product/8905040234014/300/LMSH014284_1.webp",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8lZypYfeGh--d9RrVKQ9U4Ceg0ovk0wnBiw&usqp=CAU",
  "https://images.meesho.com/images/products/209435695/56avp_512.webp",
  "https://image.made-in-china.com/2f0j00LVeoTZUyhrcI/White-Fashion-Slippers-Comfortable-Casual-Flats-Men-and-Women-Shoes-Slippers.webp",
  "https://i.pinimg.com/736x/62/b4/b7/62b4b79ceb80fd4dc0a905e8ee339795.jpg",
  "https://img.etimg.com/thumb/width-640,height-480,imgsize-35708,resizemode-75,msid-98897778/top-trending-products/mobile-phones/6-latest-mobile-phones-with-12gb-ram-in-india-in-2023-starting-at-rs-29999/6-latest-mobile-phones-with-12gb-ram-in-india.jpg",
  "https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/61uOK5owU0L.jpg",
  "https://marscosmetics.in/cdn/shop/products/EL03-4W_grande.jpg?v=1647930734",
  "https://rukminim1.flixcart.com/image/850/1000/xif0q/ring/d/h/w/adjustable-1-mkr188-ring-myki-original-imagphkncyefvfyk.jpeg?q=90",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-n86zvhIFZqhe8nV_bUW0BmUvg0LZF7PJBA&usqp=CAU",
  "https://images.meesho.com/images/products/159957379/fzdt8_512.jpg",
  "https://rukminim2.flixcart.com/image/850/1000/xif0q/earring/o/j/d/na-s1-floral-kundan-bright-colors-jhumka-earrings-tanlooms-original-imaggttwcsyuj3fc.jpeg?q=90",
];
const fleshName = [
  "Men Clothing ",
  "Women Dresses",
  "Kids Dress",
  "Women Shoes Slippers ",
  "Boys Clothing",
  "Xiaomi",
  "Perfume for Men",
  "Black Liquid Eyeliner",
  "Rose Gold Rings",
  "Women Sunglasses",
  "Boys Sneaker",
  "Jhumka Earrings",
];
const fleshPrice = [
  "600",
  "1100",
  "500",
  "550",
  "900",
  "12000",
  "800",
  "1300",
  "1800",
  "400",
  "1500",
  "700",
];
const brandname = [
  "https://i.pinimg.com/736x/fd/8c/d2/fd8cd276b86211220ddc65c0bd2ce69c.jpg",
  "https://1000logos.net/wp-content/uploads/2019/06/Adidas-Logo-1991.jpg",
  "https://media.designrush.com/inspiration_images/134805/conversions/_1512076803_93_Nike-mobile.jpg",
  "https://www.hm.com/entrance/assets/bundle/img/HM-Share-Image.jpg",
  "https://www.imagesbof.in/wp-content/uploads/2023/06/Louis-Philippe.jpg",
  "https://i.pinimg.com/originals/03/fc/9e/03fc9ea117d97ac227d8dfae27106ddd.jpg",
  "https://qph.cf2.quoracdn.net/main-qimg-46e4cf54e93ad179ff19843dde22f4d6-lq",
  "https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/article3180.jpg",
  "https://media.designrush.com/inspiration_images/292255/conversions/levi_logo_4_82250bd000e1-mobile.jpg",
  "https://assets.designhill.com/design-blog/wp-content/uploads/2023/07/5-1.jpg",
  "https://thumbs.dreamstime.com/z/high-clothing-fashion-brand-logo-italy-15574803.jpg",
  "https://i.pinimg.com/originals/2f/5a/8c/2f5a8c55d6f34094fe44b7d9125ee074.png",
  "https://www.shutterstock.com/image-vector/samsung-logo-icon-south-korean-260nw-2269709285.jpg",
  "https://static.brandirectory.com/logos/chal004_chanel_logo.png",
  "https://thumbs.dreamstime.com/b/vector-logos-collection-most-famous-fashion-brands-world-format-available-illustrator-ai-twinset-logo-231625794.jpg",
  "https://1000logos.net/wp-content/uploads/2019/11/Givenchy-Logo.jpg",
  "https://www.dondup.com/images/dondup/logo.jpg",
  "https://i.pinimg.com/1200x/ae/1b/29/ae1b29c58f064bf3572290cf6eadcbd6.jpg",
  "https://i.pinimg.com/736x/66/70/e3/6670e3d671398b842511a522ae879a0a.jpg",
  "https://static.wikia.nocookie.net/littlemix/images/0/0f/Maybelline-Logo.jpg/revision/latest?cb=20210617184603"
];

const saleImage = [
  "https://image.suratwholesaleshop.com/data/2022y/November/36505/Wedding-Wear-Pink-Embroidery-Work-Net-Pakistani-Suit-9109A.jpg",
  "https://i.pinimg.com/736x/31/10/54/311054558a2d82844abd1683bd2f99cf.jpg",
  "https://5.imimg.com/data5/SELLER/Default/2021/10/WB/KD/HE/14263365/3107-500x500.jpeg",
  "https://www.sareetag.com/wp-content/uploads/2021/05/ACS5151.jpg",
  "https://cdn.stylecaret.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/5/2/52244906224_b590e7a372_o.jpg",
  "https://www.jomso.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/r/t/rtc-001.jpg",
  "https://i.pinimg.com/736x/c1/e4/83/c1e483966bfccf0551d2f09b460b9e0f.jpg",
  "https://www.koskii.com/cdn/shop/files/koskii-brown-sequins-net-designer-gown-gnrm0030193_brown_2_400x.jpg?v=1687955178",
  "https://cdn0.weddingwire.in/article/9476/original/1280/jpg/86749-engagement-outfits-dolly-j-latest-designer-engagement-gowns.jpeg",
  "https://i.pinimg.com/originals/1f/7b/ae/1f7baea231702bef0fd1711792436307.jpg",
  "https://www.wedabout.com/blog/wp-content/uploads/2023/05/green-and-yellow-kanjeevaram-south-indian-wedding-saree.jpg",
  "https://www.stylesgap.com/wp-content/uploads/2019/11/Indian-Wedding-Formal-Saree-Latest-Designs-18.jpg",
];
const saleName = [
  "Wear Pink Embroidery Pakistani Suit ",
  "Pakistani Dress Patterns",
  "Party Wear Sarees",
  "Salwar Suit",
  "Georgette Salwar Suit",
  "Anarkali Salwar Suit",
  "Evening Dress",
  "Western Gown ",
  "Engagement Dresses",
  "Wedding Dresses",
  "Wedding Sarees",
  "Formal Saree",
];
const salePrice = [
  "4000",
  "2500",
  "2000",
  "1500",
  "2300",
  "2100",
  "3000",
  "5000",
  "6000",
  "10000",
  "4500",
  "3500",
];
