import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_tracker_application/water_consume.dart';
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
      return _HomeScreenState();
  }


}

class _HomeScreenState extends State<HomeScreen>{

  final TextEditingController _glassCountTEController = TextEditingController();

  //int count=0;

  List<WaterConsume> WaterConsumeList=[]; //By default list ta empty thakbe


  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title: const Text('Water Tracker App'),
       ),
       body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child:  Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              //
               Center(
                 child: Column(
                   children: [
               //const Text('Tap Here to Water Consume'),
               //const SizedBox(height: 16,),
               _buildPressWaterConsumeButton(),

                     const SizedBox(height: 16,),

         SizedBox(
                 width: 80,
                 child: TextField(
                   controller: _glassCountTEController,
                   textAlign: TextAlign.center,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     labelText: 'No of glasses',
                     contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.purple.shade200,width: 2)
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.brown.shade200,width: 2)
                     )
                   ),
                 ),
               ),
    ],)),
               const SizedBox(height: 16,),
              // Text('Today\s water consume count: ${_getTotalWaterConsumeCount()}',style: const TextStyle(fontSize: 18),),
               const SizedBox(height: 16,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text('History',style: TextStyle(fontSize: 18),),
                   Text('Total: ${_getTotalWaterConsumeCount()}',style: TextStyle(fontSize: 18),),
                 ],
               ),

               //const SizedBox(height: 16,),
           const Divider(
             height: 20,
           ),   //divider diye alada ekta section start hobe  //horizontal line create kore
               ///Expanded(
                   //child:
               _buildWaterTrackListView()
             ],
           ),
         ),
       ));

  }

  Widget _buildPressWaterConsumeButton() {
    return GestureDetector(
               onTap: (){
                 _addWaterConsume();
               },
               child:Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(90),
                       border: Border.all(color: Colors.amber.shade300,width: 8)
                   ),
                   child: const Padding(
                     padding: EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Icon(Icons.water_drop,size: 32,),
                          Text('Tap Here')
                        ],
                      ),
                     )),);
  }

  Widget _buildWaterTrackListView() {
    return ListView.builder(
                 //reverse: true,
                   primary: false,
                   shrinkWrap: true,
                     itemCount: WaterConsumeList.length,
                     itemBuilder: (context,index){
                       return _buildSingleListItem(WaterConsumeList[index],index+1);
                     });
  }
//extract method
  Widget _buildSingleListItem(WaterConsume waterConsume,int serialNo) {
    return ListTile(
                         title: Text(DateFormat.yMEd().add_jms().format(waterConsume.time)),//.toString()),
                         leading: CircleAvatar(
                           child: Text('$serialNo'),
                         ),
                         trailing: Text(waterConsume.glassCount.toString()),
                       );
  }

void _addWaterConsume(){

    int glassCount = int.parse(_glassCountTEController.text) ?? 1;
    WaterConsume waterConsume=WaterConsume(time: DateTime.now(), glassCount: glassCount);
    WaterConsumeList.add(waterConsume);

    setState(() {

    });

}
int _getTotalWaterConsumeCount(){
    int totalCount = 0;

    for(WaterConsume waterConsume in WaterConsumeList){
      totalCount = totalCount+waterConsume.glassCount;
    }
    return totalCount;
  }

  @override
  void dispose(){
    super.dispose();
    _glassCountTEController.clear();


  }

}

