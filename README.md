

##Proje Açıklaması: Flutter Kanban Uygulaması

1. Proje Tanımı:
   Flutter kullanarak geliştirdiğim kanban uygulaması, ana sayfada bulunan dört farklı liste ile kullanıcılara görevleri organize etme imkanı sunar. Her bir liste üzerinden "Ekle" butonuna tıklayarak kartlar ekleyebilir, bu kartları sürükleyip bırakarak istenilen sıraya yerleştirebilirsiniz.

2. Kart İşlemleri:
   - Kart içeriğini güncelleme: Her bir kartın içeriğini düzenleyebilir, güncel bilgileri ekleyebilirsiniz.
   - Kartları sürükleyip bırakma: Listeler arasında kartları taşıyabilir, öncelik belirleyebilirsiniz.
   - Kartları silme: İstediğiniz kartları tek tek veya toplu olarak silebilirsiniz.

3. Arama ve Detay Sayfası:
   - Arama özelliği: Arama butonu ile istediğiniz kartları hızlıca bulabilirsiniz.
   - Kart detayları: Kartın detay sayfasına giderek, kartı liste içine eklemenin yanı sıra yeni kartlar ekleyebilirsiniz.

4. Veritabanı ve Depolama:
   - SQLite kullanımı: Verileri yerel olarak SQLite veritabanında depoluyorum, bu sayede kullanıcıların verileri güvenli bir şekilde saklanır.
   - Ayarlar ve Veri Nijaya Git: Ayarlar ve "Word Nijaya Git" butonları ile kullanıcılar sayfasına yönlendirme yapılmakta. Bu sayfada API kullanarak kullanıcı bilgilerini çekip listeliyor ve detay sayfalarını görüntüleme imkanı sunuyor.

5. Bloc Yapısı:
   - Bloc kullanımı: Kullanıcılar sayfasında Bloc yapısını kullanarak, veri yönetimi ve durum yönetimini etkili bir şekilde sağlıyorum. Bu sayede uygulama daha düzenli ve performanslı çalışmaktadır.




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

