import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List images = [
  {
    'image': 'https://mlu7douffs21.i.optimole.com/mQUgI_M.pGPy~264a5/w:1024/h:904/q:auto/https://www.cptransfers.com/wp-content/uploads/2019/07/traveltourpageimage.png',
    'name': 'Add Package'
  },
  {
    'image':
        'https://th.bing.com/th/id/OIP.82VobEiG7hdu9KkrASax6wHaHa?pid=ImgDet&w=200&h=200&c=7&dpr=1.3',
    'name': 'Advertisement'
  },
  {
    'image':
        'https://thumbs.dreamstime.com/b/online-travel-booking-vector-concept-web-banner-website-page-illustration-tour-operator-flight-search-air-tickets-hotel-165089395.jpg',
    'name': 'Search'
  },
  {
    'image':
        'https://seovillas.com/wp-content/uploads/2022/03/enterprise-seo-services.jpg',
    'name': 'Revenue'
  },
];
class cutom_agencysButtons extends StatelessWidget {
  const cutom_agencysButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2.8,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images[index]['image']),
                  fit: BoxFit.contain,
    
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "${images[index]['name']}",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        textStyle: Theme.of(context)
                            .textTheme
                            .displayLarge,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
