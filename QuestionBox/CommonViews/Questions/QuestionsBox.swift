//
//  QuestionsBox.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 23.06.2024.
//

import Foundation

struct Soru {
    let id: Int
    let soruMetni: String
}

// Kategori Modeli
struct Kategori {
    let id: Int
    let isim: String
    let renk: String
    let iconType: IconTypes
    var sorular: [Soru]
}

let flortSorular: [Soru] = [
    Soru(id: 1, soruMetni: "Hiç Online Dating denedin mi?"),
    Soru(id: 2, soruMetni: "Tinder, Lovoo, Bumble - hangisini tercih edersin?"),
    Soru(id: 3, soruMetni: "En kötü flört deneyimin neydi?"),
    Soru(id: 4, soruMetni: "En iyi ilk buluşman hangisiydi?"),
    Soru(id: 5, soruMetni: "Hiç ilk buluşmada seks yaptın mı?"),
    Soru(id: 6, soruMetni: "Hiç ilk buluşmada birini öptün mü?"),
    Soru(id: 7, soruMetni: "En uzun ilişkin ne kadar sürdü?"),
    Soru(id: 8, soruMetni: "Şimdiye kadar kaç tane ciddi ilişkin oldu?"),
    Soru(id: 9, soruMetni: "Hiç partnerinle birlikte yaşadın mı?"),
    Soru(id: 10, soruMetni: "En kötü ayrılığın hangisiydi?"),
    Soru(id: 11, soruMetni: "Hiç karşılıksız aşk yaşadın mı?"),
    Soru(id: 12, soruMetni: "Aşkındaki en romantik an neydi?"),
    Soru(id: 13, soruMetni: "Evlilik hakkında ne düşünüyorsun?"),
    Soru(id: 14, soruMetni: "Hiç ilgi duyduğun biri için olduğun kişiyi değiştirmeye çalıştın mı?"),
    Soru(id: 15, soruMetni: "Tanıdığın en mutlu çift hangisi?"),
    Soru(id: 16, soruMetni: "İlk görüşte aşka inanır mısın?"),
    Soru(id: 17, soruMetni: "(Eski) partnerinle nasıl tanıştın?"),
    Soru(id: 18, soruMetni: "İlgini çeken şeyler ne?"),
    Soru(id: 19, soruMetni: "En utanç verici seks hikayen ne?"),
    Soru(id: 20, soruMetni: "İlk seferin nasıldı?"),
    Soru(id: 21, soruMetni: "En büyük hayalin ne?"),
    Soru(id: 22, soruMetni: "Kendinle ilgili gurur duyduğun şey ne?"),
    Soru(id: 23, soruMetni: "Yaşadığın ülke için nasıl bir gelecek düşlüyorsun?"),
    Soru(id: 24, soruMetni: "Bugüne kadar yaptığın en spontane şey ne?"),
    Soru(id: 25, soruMetni: "Ailene ne kadar bağlısın?"),
    Soru(id: 26, soruMetni: "Hayatındaki en önemli kişi kim?"),
    Soru(id: 27, soruMetni: "Birine hediye alırken neye dikkat edersin?"),
    Soru(id: 28, soruMetni: "Asla affetmeyeceğin şey nedir?"),
    Soru(id: 29, soruMetni: "Yalnız kalmak sana ne hissettirir?"),
    Soru(id: 30, soruMetni: "Ölmeden önce görülecek yerler listende nereler var?"),
    Soru(id: 31, soruMetni: "Hangi hobileri seversin?"),
    Soru(id: 32, soruMetni: "Ömrünün sonuna kadar tek bir film izleyecek olsan, bu hangisi olurdu?"),
    Soru(id: 33, soruMetni: "Hayattaki önceliklerin neler?"),
    Soru(id: 34, soruMetni: "Sıfırdan öğrenmek istediğin bir şey var mı?"),
    Soru(id: 35, soruMetni: "Hayalindeki iş ne?"),
    Soru(id: 36, soruMetni: "Hiç para kazanmak zorunda olmasan, hayatını nasıl geçirirdin?"),
    Soru(id: 37, soruMetni: "Çocukluk arkadaşlarında hala görüşüyor musun?"),
    Soru(id: 38, soruMetni: "Bugüne kadar okuduğun en iyi kitap hangisiydi?"),
    Soru(id: 39, soruMetni: "Başından geçen en ilginç olay neydi?"),
    Soru(id: 40, soruMetni: "Hiç garip huyun veya takıntın var mı?"),
    Soru(id: 41, soruMetni: "Boş zamanlarında en çok ne yapmaktan hoşlanırsın?"),
    Soru(id: 42, soruMetni: "En sevdiğin kitap, film veya müzik türü nedir?"),
    Soru(id: 43, soruMetni: "Birlikte yeni bir şey denemek ister misin? Ne önerirsin?"),
    Soru(id: 44, soruMetni: "Hayatında seni en çok etkileyen an ne?"),
    Soru(id: 45, soruMetni: "İlkokulda en sevdiğin anı ne?"),
    Soru(id: 46, soruMetni: "Hayatta en çok neye değer veriyorsun?"),
    Soru(id: 47, soruMetni: "İdeal bir günün nasıl geçer?"),
    Soru(id: 48, soruMetni: "Hayatta başarmak istediğin büyük bir hedefin var mı?"),
    Soru(id: 49, soruMetni: "Eğer bir süper gücün olsaydı, ne olmasını isterdin?"),
    Soru(id: 50, soruMetni: "En son güldüğün şey ne?"),
    Soru(id: 51, soruMetni: "Eğlenceli bir anını paylaşabilir misin?"),
    Soru(id: 52, soruMetni: "Aşk hakkındaki düşüncelerin neler?"),
    Soru(id: 53, soruMetni: "En çok takdir ettiğin insan özelliği ne?"),
    Soru(id: 54, soruMetni: "İdeal bir ilişkide senin için en önemli olan şey ne?"),
    Soru(id: 55, soruMetni: "Beş yıl sonra kendini nerede görüyorsun?"),
    Soru(id: 56, soruMetni: "Hayalini kurduğun iş veya kariyer ne?"),
    Soru(id: 57, soruMetni: "Benimle birlikte yapmayı hayal ettiğin bir şey var mı?"),
    Soru(id: 58, soruMetni: "Gününün en iyi ve en zor anları neler?"),
    Soru(id: 59, soruMetni: "Sabahları nasıl uyanırsın? Bir sabah rutinini paylaşabilir misin?"),
    Soru(id: 60, soruMetni: "En sevdiğin yemek ne?"),
    Soru(id: 61, soruMetni: "Dünya’da var olmuş herhangi bir insanı akşam yemeğine davet edebilecek olsaydın, bu kim olurdu?"),
    Soru(id: 62, soruMetni: "Ünlü olmak ister miydin? Ne tür bir ünlü olmak isterdin?"),
    Soru(id: 63, soruMetni: "Bir telefon görüşmesi yapmadan önce, neler söyleyeceğin üzerinde prova yapar mısın, yoksa direk açar mısın? Yaparsan, neden?"),
    Soru(id: 64, soruMetni: "Senin için “kusursuz/harika” bir gün nasıl geçmelidir?"),
    Soru(id: 65, soruMetni: "En son kendi kendine ne zaman şarkı söyledin? Peki ya bir başkasına en son ne zaman şarkı söyledin?"),
    Soru(id: 66, soruMetni: "Eğer ki 90 yaşına kadar yaşayabilecek olsaydın ve hayatının son 60 yılında, ya 30 yaşındaki zihnini, ya 30 yaşındaki vücudunu seçmen gerekseydi, hangisini isterdin?"),
    Soru(id: 67, soruMetni: "Nasıl öleceğine dair bir tahminin var mı?"),
    Soru(id: 68, soruMetni: "Sen ve partnerin arasında ortak olan 3 özelliği say."),
    Soru(id: 69, soruMetni: "Hayatında en çok minnettar olduğun şey nedir?"),
    Soru(id: 70, soruMetni: "Eğer ki çocukluğundaki yetiştirilme biçiminde değiştirebileceğin tek bir şey olsaydı, bu ne olurdu?"),
    Soru(id: 71, soruMetni: "4 dakikayı dolduracak şekilde, hayat hikayeni olabildiğince detaylı bir şekilde anlat."),
    Soru(id: 72, soruMetni: "Eğer ki yarın yeni bir özellik ya da yetenek kazanmış şekilde uyanabilecek olsaydın, bu ne olurdu?"),
    Soru(id: 73, soruMetni: "Eğer kristal bir top seninle, yaşamınla, geleceğinle ya da herhangi bir diğer konu hakkında sana tek bir gerçeği söyleyebilecek olsaydı, neyi bilmek isterdin?"),
    Soru(id: 74, soruMetni: "Uzun bir süredir yapmanın hayalini kurduğun herhangi bir şey var mı? Neden bugüne kadar yapmadın?"),
    Soru(id: 75, soruMetni: "Hayatındaki en büyük başarı nedir?"),
    Soru(id: 76, soruMetni: "Arkadaşlıkta en değer verdiğin şey nedir?"),
    Soru(id: 77, soruMetni: "Geçmişinde en değer verdiğin anın nedir?"),
    Soru(id: 78, soruMetni: "En kötü anın nedir?"),
    Soru(id: 79, soruMetni: "Eğer ki 1 yıl içerisinde aniden öleceğini bilseydin, şu anki yaşama biçiminde herhangi bir şeyi değiştirir miydin? Neden?"),
    Soru(id: 80, soruMetni: "Arkadaşlık senin için ne ifade ediyor?"),
    Soru(id: 81, soruMetni: "Aşk ve şefkat hayatında nasıl bir role sahip?"),
    Soru(id: 82, soruMetni: "Diyelim ki karşılıklı paylaşım senin partnerinde pozitif olarak değerlendirdiğin bir özellik. Partnerinle hangi 5 şeyi paylaşırdın?"),
    Soru(id: 83, soruMetni: "Ailen birbirine ne kadar yakın ve sıcaktır?"),
    Soru(id: 84, soruMetni: "Çocukluğunun diğer birçok insandan daha mutlu geçtiğini düşünüyor musun?"),
    Soru(id: 85, soruMetni: "Annenle ilişkin hakkında ne düşünüyorsun?"),
    Soru(id: 86, soruMetni: "Bu cümleyi tamamlayın: “Şunu paylaşacağım biri olsun isterdim: …”"),
    Soru(id: 87, soruMetni: "Eğer ki partnerinizle yakın bir arkadaş olacaksanız, lütfen onun bilmesi gerektiğini düşündüğünüz bir şeyi söyleyin."),
    Soru(id: 88, soruMetni: "Partnerinize, onda sevdiğiniz hangi özelliğin olduğunu söyleyin. Bu sefer aşırı dürüst olun."),
    Soru(id: 89, soruMetni: "Gerçekte sevmediğiniz veya henüz yeni tanıştığınız birine söylemeyeceğiniz şeyleri sevdiğinizi söylemekten kaçının."),
    Soru(id: 90, soruMetni: "Partnerinize, hayatınızda utanç duyduğunuz bir anınızı anlatın."),
    Soru(id: 91, soruMetni: "Başka bir insan önünde en son ne zaman ağladınız? Kendi kendinize en son ne zaman ağladınız?"),
    Soru(id: 92, soruMetni: "Partnerinize, onda çoktan sevdiğiniz özelliğin hangisi olduğunu söyleyin."),
    Soru(id: 93, soruMetni: "Hangi konu, hakkında şaka yapılamayacak kadar ciddidir? (eğer böyle bir konu varsa)"),
    Soru(id: 94, soruMetni: "Bu akşam, hiç kimseyle irtibata geçemeden ölecek olsaydınız, birine söylemediğiniz için pişmanlık olacağını şey nedir Bu şeyi neden o kişiye çoktan söylemediniz?"),
    Soru(id: 95, soruMetni: "Eviniz, içinde sahip olduğunuz her şeyle birlikte yanıyor! Sevdiğiniz kişileri ve hayvanları (ve diğer canlıları) kurtardıktan sonra, sadece 1 objeyi kurtarabilecek kadar vaktiniz olduğunu fark ediyorsunuz. Neyi kurtarırdınız? Neden?"),
    Soru(id: 96, soruMetni: "Ailenizdeki tüm kişiler arasında, kimin ölümünün fikri size en rahatsızlık verici geliyor? Neden?"),
    Soru(id: 97, soruMetni: "Kişisel bir sorununuzdan bahsedin ve partnerinizin bu sorunla nasıl başa çıkacağıyla ilgili tavsiyelerde bulunmasını isteyin. Ayrıca partnerinizden, bu sorunu halletmeye çalışırken dışarıya neler yansıttığınızı (dışarıya nasıl göründüğünüzü) anlatmasını isteyin.")
]

let sevgiliyeRomantik: [Soru] = [
    Soru(id: 1, soruMetni: "İlk buluşmamızı hatırlıyor musun? O gün ne hissettin?"),
    Soru(id: 2, soruMetni: "İlk aşkın ne zaman oldu ve hissettiklerini bana anlatır mısın?"),
    // Diğer sorular buraya eklenebilir...
]

let sevgiliyeKomik: [Soru] = [
    Soru(id: 1, soruMetni: "Eğer bir penguen olsaydın, dondurma ya da pizza yer miydin?"),
    Soru(id: 2, soruMetni: "Dünya dışı bir varlık olsaydın, en sevdiğin renk ne olurdu?"),
    // Diğer sorular buraya eklenebilir...
]

let kategori1 = Kategori(id: 1, isim: "Flört", renk: "FFD6F1", iconType: .flort, sorular: flortSorular)
let kategori2 = Kategori(id: 4, isim: "Sevgiliye Komik", renk: "AEE034", iconType: .darlingFunny, sorular: sevgiliyeKomik)
let kategori3 = Kategori(id: 3, isim: "Sevgiliye Romantik", renk: "FFCA28", iconType: .darlingLove, sorular: sevgiliyeRomantik)

let kategoriler = [kategori1, kategori2, kategori3]
