> **Uyarı:** Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

# Flutter Arayüz: Animasyonlar ve Geçişler — Pekiştirme Soruları

**Mobil Programlama I · 6. Takım (TeamAnimators)** · Konu: Animations & transitions (`Animation<T>`, `AnimationController`, `Tween`, `CurvedAnimation`, `AnimatedWidget`, `AnimatedBuilder`, `ImplicitlyAnimatedWidget`, `Hero`, `PageRouteBuilder`, `SpringSimulation`, `Staggered Animations`, `Ticker`)

Bu dokümanda, [docs.flutter.dev/ui/animations](https://docs.flutter.dev/ui/animations) resmi dokümantasyon çevirisine sadık kalınarak hazırlanmış üniversite lisans seviyesinde **2 adet çoktan seçmeli (test)** ve **2 adet açık uçlu (klasik)** pekiştirme sorusu ile kapsamlı teknik çözümleri yer almaktadır.

## İçindekiler

- [Bölüm 1: Çoktan Seçmeli Sorular (Test)](#bölüm-1-çoktan-seçmeli-sorular-test)
  - [Soru 1 (AnimatedBuilder Mimarisi ve Alt Ağaç Optimizasyonu)](#soru-1-animatedbuilder-mimarisi-ve-alt-ağaç-optimizasyonu)
  - [Soru 2 (AnimationController, CurvedAnimation ve Tween Sınıf Hiyerarşisi)](#soru-2-animationcontroller-curvedanimation-ve-tween-sınıf-hiyerarşisi)
- [Bölüm 2: Açık Uçlu (Klasik) Sorular](#bölüm-2-açık-uçlu-klasik-sorular)
  - [Soru 3 (Hero Animasyonlarının Perde Arkası ve Radyal Dönüşüm)](#soru-3-hero-animasyonlarının-perde-arkası-ve-radyal-dönüşüm)
  - [Soru 4 (Ticker Senkronizasyonu ve Kademeli Animasyonlarda Interval Yapısı)](#soru-4-ticker-senkronizasyonu-ve-kademeli-animasyonlarda-interval-yapısı)

---

## Bölüm 1: Çoktan Seçmeli Sorular (Test)

### Soru 1 (AnimatedBuilder Mimarisi ve Alt Ağaç Optimizasyonu)

Aşağıdaki `GrowTransition` sınıfında `child` parametresi hem `AnimatedBuilder` kurucusuna (constructor) doğrudan bir argüman olarak verilmiş hem de isimsiz `builder: (context, child)` geri çağırma işlevine (callback) parametre olarak geçirilip `SizedBox` içinde kullanılmıştır:

```dart
class GrowTransition extends StatelessWidget {
  const GrowTransition({
    required this.child,
    required this.animation,
    super.key,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
```

Dokümantasyondaki **"AnimatedBuilder ile yeniden yapılandırma"** ve **"Sayfa Geçişini Canlandırma (`PageRouteBuilder`)"** bölümlerine göre, `child` referansının bu şekilde dışarıdan `AnimatedBuilder`'a verilip kapanış işlevi (closure) üzerinden teslim alınmasının temel mimari amacı aşağıdakilerden hangisidir?

- **A)** `AnimatedBuilder` sınıfının `StatefulWidget` yerine `ImplicitlyAnimatedWidget` sınıfından türetilmiş olması nedeniyle alt widget'ın durumunu (state) sıfırlamak.
- **B)** `animation` nesnesinin ürettiği değerlerin `0.0` ile `1.0` aralığı dışına çıkmasını engelleyerek `SizedBox` sınırlarını korumak.
- **C)** `AnimatedBuilder`'ı widget ağacında iki widget arasına yerleştirirken, animasyonun her adımında (tick) statik olan `child` alt ağacının gereksiz yere yeniden oluşturulmasını (rebuild edilmesini) önlemek.
- **D)** `SingleTickerProviderStateMixin` kullanılmadığı durumlarda `child` widget'ının kendi `Ticker` nesnesini otomatik olarak üretmesini sağlamak.
- **E)** `addStatusListener()` geri çağırma işlevinin her karede `setState()` yöntemini tetiklemesini zorunlu kılmak.

**Doğru Cevap:** **C**

> **Teknik Açıklama:**  
> Dokümantasyonda belirtildiği üzere, `child` öğesine yapılan dış referans `AnimatedBuilder`'a (veya `PageRouteBuilder` içindeki `transitionsBuilder`'a) aktarılır; o da bu hazır widget örneğini isimsiz `builder` kapanış işlevine (closure) iletir. Böylece geçiş süresince yalnızca boyutu değişen `SizedBox` yeniden oluşturulur; altında yer alan ve geçiş boyunca değişmeyen statik `child` alt ağacı (örneğin `LogoWidget` veya hedef sayfa içeriği) animasyonun her karesinde (tick) tekrar tekrar `build()` edilmekten kurtarılır.

---

### Soru 2 (AnimationController, CurvedAnimation ve Tween Sınıf Hiyerarşisi)

Flutter'ın animasyon kütüphanesindeki temel sınıfların davranışları ve miras (inheritance) ilişkileri hakkında aşağıda verilen ifadelerden hangisi **doğrudur**?

- **A)** Bir `AnimationController` nesnesinin değerleri `fling()` ile sürülse bile `lowerBound` ve `upperBound` (varsayılan olarak `0.0` ve `1.0`) aralığında kalır; ancak bir `CurvedAnimation` (örneğin `Curves.elasticIn` eğrisiyle), üst denetleyicisi bu aralıkta kalsa dahi `0.0` ile `1.0` aralığını aşabilir (overshoot/undershoot).
- **B)** `Tween<T>` sınıfı doğrudan `Animation<T>` soyut sınıfından miras alır ve animasyonun o anki ilerleme durumunu (`AnimationStatus`) kendi içinde takip eder.
- **C)** Doğrusal olmayan bir hız eğrisi uygulamak için `CurvedAnimation` kullanmak yerine `AnimationController` sınıfından yeni bir alt sınıf (subclass) türetilmesi zorunludur.
- **D)** Bir `Tween` nesnesi üzerinde çağrılan `animate()` yöntemi geriye bir `Animation<T>` değil, yalnızca `evaluate()` ile okunabilen bir `Animatable<T>` nesnesi döndürür.
- **E)** `controller.stop()` yöntemi çağrıldığında animasyonun durumu anında `AnimationStatus.dismissed` olarak değişir ve tüm `addStatusListener` dinleyicilerine bildirim gönderilir.

**Doğru Cevap:** **A**

> **Teknik Açıklama:**  
> - **A şıkkı doğrudur:** Dokümantasyonun `AnimationController` bölümündeki özel notta vurgulandığı üzere, bir denetleyicinin değerleri `fling()` ile kontrol edildiğinde dahi `lowerBound` ve `upperBound` sınırları içinde kalır. Buna karşın `CurvedAnimation`, seçilen eğriye bağlı olarak (örneğin `Curves.elasticIn`) girişinden daha geniş bir çıktı aralığına sahip olabilir ve `0.0` – `1.0` aralığını önemli ölçüde aşabilir veya altına inebilir.  
> - **Diğer şıkların hatalı olma nedenleri:**  
>   - *(B)* `Tween<T>`, `Animation<T>`'den değil `Animatable<T>`'den miras alır ve animasyon ilerleyişini takip etmez.  
>   - *(C)* Eğri uygulamak için `AnimationController`'ın alt sınıfı oluşturulmaz; `CurvedAnimation` değiştirdiği nesneyi sarar (decorator/wrapper).  
>   - *(D)* `animate()` yöntemi bir `Animatable` değil, bir `Animation` döndürür.  
>   - *(E)* `stop()` yöntemini çağırmak animasyonun durumunu (`AnimationStatus`) değiştirmez, dolayısıyla durum dinleyicilerini (`statusListeners`) bilgilendirmez.

---

## Bölüm 2: Açık Uçlu (Klasik) Sorular

### Soru 3 (Hero Animasyonlarının Perde Arkası ve Radyal Dönüşüm)

Flutter'da sayfalar (rotalar) arası paylaşılan öğe geçişlerini (shared element transitions) sağlayan `Hero` animasyonlarıyla ilgili aşağıdaki iki soruyu yanıtlayınız:

1. `Navigator` yığınına yeni bir rota eklendiğinde (`push`), geçişin başladığı `t = 0.0` anında, uçuş sırasında ve uçuş tamamlandığında Flutter çerçevesinin **kaynak Hero**, **hedef Hero** ve **uygulama üst katmanı (`Overlay`)** üzerinde gerçekleştirdiği işlemleri adım adım açıklayınız.
2. Dairesel bir şekilden dikdörtgen bir şekle dönüşen **radyal Hero animasyonlarında** (`ClipOval` ve `ClipRect` kesişimi kullanılırken), varsayılan uçuş yolu olan `MaterialRectArcTween` yerine neden `MaterialRectCenterArcTween` kullanılmalıdır?

**Cevap:**

1. **Hero Geçişinin Perde Arkası (`Overlay` ve Rota Yönetimi):**
   - **Geçiş Öncesi:** Kaynak Hero, kaynak rotanın widget ağacında bekler. Hedef rota henüz mevcut değildir ve uygulama üst katmanı (`Overlay`) boştur.
   - **`t = 0.0` Anı (Geçiş Başlangıcı):** `Navigator`'a bir rota eklendiğinde (`push`) Flutter;
     1. Material hareket spesifikasyonundaki kavisli hareketi kullanarak hedef Hero'nun ekran dışındaki (offscreen) varış yolunu hesaplar.
     2. **Hedef Hero'yu**, kaynak Hero ile aynı konum ve boyutta uygulama üst katmanına (`Overlay`) yerleştirir. Hero'nun üst katmana eklenmesi **Z-sırasını (Z-order)** değiştirir; böylece Hero her iki rotanın da üzerinde görünür.
     3. **Kaynak Hero'yu** ekran dışına (offscreen) taşır.
   - **Uçuş Sırasında:** Hero üst katmanda (`Overlay`) uçarken dikdörtgen sınırları `createRectTween` özelliğinde belirtilen `Tween<Rect>` kullanılarak başlangıç noktasından bitiş noktasına doğru (boyut ve konum enterpolasyonuyla) canlandırılır; bu sırada hedef rota (Hero hariç) yavaşça görünür hale gelir.
   - **Uçuş Tamamlandığında (`t = 1.0`):** Flutter, Hero widget'ını üst katmandan (`Overlay`) hedef rotaya taşır (üst katman tekrar boşalır). Hedef Hero hedef rotadaki son konumunda görünür ve kaynak Hero kendi rotasına geri yüklenir.

2. **`MaterialRectArcTween` Yerine `MaterialRectCenterArcTween` Tercih Edilmesinin Nedeni:**
   - Bir Hero animasyonu için varsayılan uçuş yolu olan `MaterialRectArcTween`, dikdörtgenin **karşılıklı köşelerini** kullanarak kavisli bir yol boyunca ara değerleri (tween) enterpolasyon yoluyla hesaplar.
   - Ancak radyal dönüşümde (`RadialExpansion` içinde `ClipOval`'ın `minRadius`'tan `maxRadius`'a büyürken `ClipRect`'in sabit boyutta kaldığı kesişimde) köşeler üzerinden yapılan enterpolasyon, uçuş sırasında **Hero'nun en-boy oranını (aspect ratio) bozar**.
   - `MaterialRectCenterArcTween` ise tween enterpolasyonunu köşeler yerine **her bir Hero'nun merkez noktasını** kullanarak gerçekleştirir. Böylece Hero'nun uçuş yolu yine bir yay (arc) izlerken, görüntünün **en-boy oranı uçuş boyunca sabit korunur**.

---

### Soru 4 (Ticker Senkronizasyonu ve Kademeli Animasyonlarda Interval Yapısı)

Flutter'ın animasyon mimarisi ve zamanlama mekanizmasıyla ilgili aşağıdaki iki soruyu yanıtlayınız:

1. İki kare adımı (`tick`) arasındaki farklı milisaniyelerde üç ayrı `Ticker` nesnesi başlatıldığını varsayalım. Bu `Ticker` nesnelerinin zaman kayması yaşamadan birbirleriyle nasıl tam olarak senkronize (eşzamanlı / lockstep) çalıştığını `SchedulerBinding.scheduleFrameCallback()` ve `Ticker`'ın geçen süreyi hesaplama prensibi üzerinden açıklayınız.
2. Tek bir `AnimationController` tarafından sürülen **kademeli bir animasyonda (staggered animation)**, toplam süresi 2000 ms olan bir zaman çizelgesinin yalnızca `250 ms` ile `500 ms` arasındaki diliminde `50.0`'dan `150.0`'a yumuşatılmış (`Curves.ease`) olarak genişleyen bir `width` animasyonunun nasıl tanımlanacağını kod veya matematiksel aralık (`Interval`) mantığıyla açıklayınız.

**Cevap:**

1. **`SchedulerBinding` ve `Ticker` Senkronizasyon Mekanizması:**
   - Ekranda yeni bir karenin (frame) gösterilmesi gereken her seferde Flutter motoru bir *"kareye başla (begin frame)"* geri çağırma işlevi tetikler ve tekil (singleton) `SchedulerBinding` sınıfı bunu `scheduleFrameCallback()` ile kayıtlı tüm dinleyicilere çoğullar (multiplex).
   - Bu geri çağırma işlevlerinin tamamına, keyfi bir başlangıç zamanından (epoch) itibaren `Duration` biçiminde **karenin aynı resmi zaman damgası (timestamp)** verilir. Dolayısıyla geri çağırmaların yürütülmesi birkaç milisaniye sürse bile hepsi aynı zaman değerini referans alır.
   - `Ticker` sınıfı `scheduleFrameCallback()` mekanizmasına bağlanır ve geçen süreyi (`elapsed time`) çağrıldığı ana göre değil, **her zaman başlatılmasından sonraki ilk adıma (`first tick`) göre göreceli olarak** hesaplar. Bu nedenle iki `tick` arasında farklı anlarda başlatılan üç `Ticker`, tıpkı bir otobüs durağında bekleyen insanların aynı otobüse binerek aynı anda harekete geçmesi gibi, zamanı saymaya başlamak için bir sonraki düzenli `tick` olayını bekler; aynı başlangıç zamanıyla senkronize olur ve sonrasında eşzamanlı (lockstep) olarak ilerler.

2. **Kademeli Animasyonda `Interval` Hesaplaması ve Tanımı:**
   - Kademeli animasyonlarda gerçek zamanlı süre ne olursa olsun `AnimationController`'ın değerleri `0.0` ile `1.0` (dahil) arasında normalize edilir ve her alt animasyon bu zaman çizelgesi üzerinde `0.0` ile `1.0` arasında yüzdelik bir `Interval(begin, end)` kullanır.
   - Toplam süre `2000 ms` olduğundan:
     - Başlangıç oranı: `250 ms / 2000 ms = 0.125` (%12.5)
     - Bitiş oranı: `500 ms / 2000 ms = 0.250` (%25.0)
   - Bu aralık, `CurvedAnimation` nesnesinin `curve` özelliğine `Interval(0.125, 0.250, curve: Curves.ease)` olarak verilir ve `Tween<double>(begin: 50, end: 150).animate(...)` ile bağlanır:
     ```dart
     final Animation<double> width = Tween<double>(begin: 50, end: 150).animate(
       CurvedAnimation(
         parent: controller,
         curve: const Interval(0.125, 0.250, curve: Curves.ease),
       ),
     );
     ```
