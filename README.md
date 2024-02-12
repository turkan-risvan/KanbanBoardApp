


Proje Dökümantasyonu
	
Bu dökümantasyon, tasarlanan ve geliştirilen bir proje için adım adım ilerleme sürecini anlatmaktadır. Proje, Flutter kullanılarak geliştirilmiş bir kanban uygulamasıdır. Uygulamada, kullanıcılar iş veya projelerini düzenlemek ve takip etmek için listeler oluşturulur ve bu listeler içerisinde cards kullanılır. 

   
Adım 1: Board Ekran Tasarımı ve İşlevselliği

Proje başlangıcında, board ekranının tasarımı için belirtilen görsel tasarımı kullanarak bir kullanıcı arayüzü oluşturdum. Board oluşturma, liste ekleme ve liste içerisinde kartları taşıma işlemi yaptım.

![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/527ea7a9-72dd-4369-a940-3965ed5dc7fe)
![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/40a5e94e-7fba-449f-b44a-a8eade2ef630)
![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/5c6c44c1-2485-4354-8605-58a3df015ed9)



İlk Adımlar:
 1. Board ekranının tasarımı için gerekli widget'lar ve bileşenler oluşturuldu.
2. Board oluşturma, liste ekleme ve kartları taşıma işlevselliği için gerekli sınıfları tasarladım.
3. Kullanıcı etkileşimleri (örneğin, kartları sürükleme) için gerekli durumları yapmakla başladım.
     
![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/a47f49f8-6706-485a-b261-f45b5df066b0)
![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/4d784818-89b3-4c27-9a39-296594e0d91b)
![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/df0b5862-c203-4e7c-9875-85de6396e69c)


 Adım 2: Model ve Interfaceler

Uygulamada kullanılacak veri nesneleri için model sınıfları oluşturuldum. Ayrıca, bu modeller üzerinde çalışabilmek için gerekli interfaces tasarlandım. 


                                                                Adım 3: Veritabanı Yönetimi

Uygulama, verileri yerel bir veritabanında saklamak için SQLite veritabanını kullandım. Bu adımda şu işlemler gerçekleştirildi:
1. SQLite veritabanına erişim sağlamak için `sqflite` paketi kullandım.
2. Kanban, Card içierisindeki  veri modelleri için uygun SQLite tabloları tasarladım.
3. Veritabanına erişim ve sorgulama işlemlerini gerçekleştirdim.

![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/ff573f90-8eac-41eb-953d-f98f672e8846)
![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/97e8ae88-9f17-4415-9b55-4bb1786f848a)


   





Adım 4: API Entegrasyonu

Proje, uzak bir servisten veri çekmek ve göndermek için bir RESTful API kullandım. API entegrasyonu için gerekli adımlar şunlardı:
1. Dart dilindeki HTTP isteklerini yönetmek için `http` paketi kullandım.
2. API tarafından sunulan hizmetlere erişmek için fonksiyonlar ve sınıflar tasarladım.
3. Projenin Users sayfasında kullanılacak genel API çağrıları için bir servis sınıfı oluşturuldum.
4. Bu Users’ı getirmek için Bloc uyguladım. Bloc kullanımı için üç ayrı dart sayfası oluşturdum. Bunlar blocs, events ve states olarak oluşturdum. Böylece projemin bu kısmında flutter_bloc paketini kullanmak için importumu ekledim.
  
![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/90cb21da-c1e3-40ce-ba87-9a69c7e1dfa7)
![image](https://github.com/turkan-risvan/KanbanBoardApp/assets/78659151/2eee5254-4a4e-4c57-b5d0-6fa56198c237)



Sonuç

Bu adımların tamamlanmasıyla birlikte, tasarlanan kanban uygulaması, kullanıcıların projelerini ve görevlerini etkili bir şekilde yönetmelerine olanak tanıyan bir yapıya sahip oldu. Proje gelecekteki güncellemeler ve eklemeler kolayca entegre edilebilir hale getirildi.

