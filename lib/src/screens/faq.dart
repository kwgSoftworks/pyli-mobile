import 'package:customerapp/src/resources/_resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: ListView(
        children: [
          Text(
            'Terms and Conditions',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: CColors.primary_dark
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ultrices egestas in augue volutpat dolor sociis in erat. Fermentum massa risus sit egestas eget velit tincidunt ut. Molestie sed tempus, leo arcu interdum tincidunt neque rhoncus ligula. Sagittis elementum lobortis vestibulum sapien. Risus eu pellentesque at enim nec id diam felis, vulputate. In curabitur feugiat odio mi enim sed scelerisque. Ultrices pulvinar congue gravida ridiculus imperdiet magna platea. Nullam sollicitudin lacus viverra id augue sed pellentesque. Neque risus senectus ut auctor vulputate turpis mauris nulla volutpat. Dictum tristique consequat nibh interdum et quisque posuere. Molestie mauris lacus sed proin ultricies nisi. Tellus commodo, proin mauris volutpat feugiat sociis. Ipsum sed luctus facilisi pellentesque eget mi. Quis sed tristique feugiat volutpat mi arcu pulvinar nec ultrices. Libero quam platea in odio orci. Sem amet, morbi pharetra tellus arcu pretium, leo, natoque. Varius sit vitae neque vitae cum risus. Volutpat nisi, turpis quisque sed a, sit neque. Cursus velit etiam donec egestas. Augue vitae purus id aliquet massa. Praesent nec viverra tincidunt lorem urna, diam eu curabitur suspendisse. Lectus ipsum phasellus mauris pellentesque mauris, bibendum placerat at. Sed tempor porttitor commodo vitae turpis nulla eleifend purus. Sit diam at id enim turpis. Et amet malesuada felis faucibus arcu in eget. Elementum mattis turpis nisi, blandit sagittis mauris sed donec viverra. Hac ipsum congue natoque morbi consequat nibh euismod. Sapien cum fermentum id tincidunt sit ut arcu nunc id. Elementum viverra egestas venenatis porta. Ut tortor turpis imperdiet amet rhoncus semper. Sem proin imperdiet turpis ac condimentum. Enim, pellentesque amet hac ut. Justo purus eget est euismod imperdiet eu erat. Fames porttitor auctor bibendum in ornare urna, lectus placerat. Mauris suspendisse cursus justo tincidunt lectus sed amet. Auctor imperdiet dapibus at sem ut dignissim. Tristique purus lectus elementum tempor porttitor et eu a proin. Adipiscing arcu amet amet purus amet consequat ut ultrices odio. Suspendisse egestas fusce sed elementum sit. Sed donec donec sed proin diam. Aliquam habitant ipsum, maecenas sed tempor id elementum in. Justo volutpat, pulvinar faucibus sed ultrices. Arcu integer eget cursus amet dolor vel, id dictum. Libero risus, consequat etiam et fermentum scelerisque lacus. Vestibulum ac scelerisque sed sollicitudin id interdum auctor nibh. Ultricies non cursus vitae semper lectus posuere lectus ac. Velit mauris a gravida nulla leo vel. Phasellus augue elementum pulvinar quam feugiat elit suscipit faucibus. Id tellus quam ut nec volutpat vitae enim, dui. Vel eu at nisl massa cursus iaculis. Ac fringilla tellus massa sollicitudin augue. Elementum molestie adipiscing massa donec cursus cursus massa et, velit. Nullam habitant eu, non lacus morbi eu in sed enim. Adipiscing gravida sapien tortor fermentum. Eget euismod at sociis pretium gravida volutpat posuere purus tincidunt. Odio ullamcorper dui morbi viverra magna. Mauris pretium ullamcorper eget purus. Et velit ornare aliquet morbi ultrices imperdiet in. Tristique vestibulum consequat elit nibh amet, imperdiet sagittis. Cursus ornare dolor, elementum sed magnis. Egestas id tellus faucibus purus dignissim iaculis. Enim congue mi et mauris et nec at est. Faucibus at sociis scelerisque quis libero diam. Condimentum facilisi ipsum morbi sed sed dui. Sit suspendisse fames scelerisque ornare dignissim tortor id sed ante. Leo arcu arcu leo feugiat tincidunt proin. Viverra eleifend arcu, vitae id sed sed ipsum adipiscing. Praesent adipiscing consequat, nisi tristique metus. Facilisis nisl tellus eget faucibus neque arcu. Tortor gravida lorem pharetra vulputate nibh viverra odio at elit. Velit dignissim nunc duis urna, vulputate. Elit netus felis nunc cursus felis, a. Aliquam tellus viverra mi morbi volutpat. Ut a feugiat lacus, quis id diam a sed. Ut maecenas quis eu augue nulla. At accumsan eget arcu arcu quisque leo, in. Faucibus et neque et, viverra cursus. Eget lacus, eu, leo tellus. Turpis libero mauris aliquam tellus gravida posuere. Velit scelerisque eget tristique nibh donec pretium, lectus. Risus volutpat placerat elit, a, tortor nisl. Tellus egestas fringilla sed dui nec. Vitae id turpis bibendum cursus. Dictum laoreet sit dolor, blandit tortor, leo sit. Euismod nunc pretium volutpat neque neque tortor, erat. Mauris, amet viverra pellentesque sagittis faucibus sapien pellentesque cras. Rhoncus lectus mauris a interdum ac. Magna nisi, lectus imperdiet eu tellus semper adipiscing lobortis eu. Porta enim eu eu pellentesque mi. Leo vitae fermentum quisque enim quam enim imperdiet dui. Id orci donec nulla et dui diam cursus amet tortor. Vitae ac a nam sit ut. Sed tincidunt viverra felis sed et, morbi platea sit aliquam. Non porta faucibus nisl sodales sit urna cursus. Leo vel lacus, in condimentum dictum dui magna imperdiet. Vel, volutpat faucibus faucibus id ornare. Semper interdum faucibus faucibus auctor venenatis nullam nisi. Mi, tortor augue massa mollis rutrum tristique rhoncus eu eleifend. Senectus lectus bibendum sed bibendum felis est.',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: CColors.black
            ),
          ),
        ],
      ),
    );
  }
}
