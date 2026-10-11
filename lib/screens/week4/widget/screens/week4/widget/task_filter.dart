import 'package:flutter/material.dart';
import 'package:project1/models/to_do_model_draft.dart';


class TaskFilter extends StatelessWidget {

  const TaskFilter({
    super.key,
    required this.stateModel,
    required this.currentState,
    required this.onChanged,
  });


  final List<StateModel> stateModel;
  final int currentState;
  final Function(int) onChanged;



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(

        width: double.infinity,
        height: 75,

        clipBehavior: Clip.antiAlias,

        decoration: BoxDecoration(

          border: BorderDirectional(
            top: BorderSide(
              width: 1,
              color: Colors.deepPurple,
            ),

            start: BorderSide(
              width: 1,
              color: Colors.deepPurple,
            ),

            end: BorderSide(
              width: 1,
              color: Colors.deepPurple,
            ),
          ),


          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),

        ),



        child: Row(

          children: List.generate(
            stateModel.length,

                (index){

              return Expanded(

                child: GestureDetector(

                  onTap: (){
                    onChanged(index);
                  },


                  child: Container(

                    color: currentState == index
                        ? Colors.white
                        : stateModel[index].state.color,


                    child: Center(

                      child: Text(
                        stateModel[index].state.title,
                      ),

                    ),

                  ),

                ),

              );

            },

          ),

        ),

      ),
    );

  }

}