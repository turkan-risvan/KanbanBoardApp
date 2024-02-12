
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
    // BlocProvider kullanarak UserBloc'ü oluştur ve UserBloc'üne LoadUserEvent gönder
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      // Scaffold widget'ı ile sayfa yapısını oluştur
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Users Page"),
        ),
        // BlocBuilder ile UserBloc'ü izle ve state'e göre UI'ı güncelle
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            // Eğer UserLoadingState ise, yükleniyor göster
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // Eğer UserLoadedState ise, kullanıcı listesini göster
            if (state is UserLoadedState) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  // Her bir kullanıcı için bir Card oluştur
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Kullanıcıya tıklandığında detay sayfasına git
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                UserDetailPage(e: userList[index])));
                      },
                      child: Card(
                        color: const Color(0xff744BFC),
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            userList[index].firstname,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            userList[index].lastname,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(userList[index].avatar),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            // Eğer UserErrorState ise, hata mesajını göster
            if (state is UserErrorState) {
              return const Center(child: Text("Error"),);
            }

            // Eğer state başka bir şeyse, boş bir Container döndür
            return Container();
          },
        ),
      ),
    );
  }
}
