
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanbanboardapp/src/blocs/app_blocs.dart';
import 'package:kanbanboardapp/src/blocs/app_events.dart';
import 'package:kanbanboardapp/src/blocs/app_states.dart';
import 'package:kanbanboardapp/src/model/user_model.dart';
import 'package:kanbanboardapp/src/repo/repositories.dart';
import 'package:kanbanboardapp/src/view/user_detail_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
      RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("The Bloc App"),
          ),
      
      body:BlocBuilder<UserBloc,UserState>(
        builder: (context,state) {

        if(state is UserLoadingState){
          return const Center(child: CircularProgressIndicator(),
          );
        }
        if(state is UserLoadedState){
         List<UserModel> userList = state.users;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (_, index){
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDetailPage(e:userList[index])));
              },
               child: Card(
                color: const Color(0xff744BFC),
                elevation: 4,
                child: ListTile(
                    title: Text(userList[index].firstname, style: const TextStyle(color: Colors.white),),
                  subtitle: Text(userList[index].lastname,style: const TextStyle(color: Colors.white),),
                 trailing: CircleAvatar(
                  backgroundImage: NetworkImage(userList[index].avatar),
                 ),
                  
                  )
               ),
             ),
           ); 
          });
        }

        if(state is UserErrorState ){
          return const Center(child: Text("Error"),);
        }
        return Container();
      },)
      )
      );
  }
}
