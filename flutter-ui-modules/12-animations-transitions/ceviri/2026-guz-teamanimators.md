> **Uyarı:** Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

# Flutter Arayüz: Animasyonlar ve Geçişler (Animations & Transitions)

**Mobil Programlama I · 6. Takım (TeamAnimators)** · Konu: Animations & transitions

Bu belge, [docs.flutter.dev](https://docs.flutter.dev/ui/animations) dokümantasyonunun ilgili bölümlerinin Türkçe çevirisidir.

## İçindekiler

1. [Animasyonlara Giriş](#animasyonlara-giriş)
   - [Bir yaklaşım seçme](#bir-yaklaşım-seçme)
   - [Animasyonlara derinlemesine bakış](#animasyonlara-derinlemesine-bakış)
   - [Örtük ve açık animasyonlar](#örtük-ve-açık-animasyonlar)
   - [Animasyon türleri](#animasyon-türleri)
   - [Yaygın animasyon kalıpları](#yaygın-animasyon-kalıpları)
   - [Temel animasyon kavramları ve sınıfları](#temel-animasyon-kavramları-ve-sınıfları)
   - [Codelab'lar, öğreticiler ve makaleler](#codelablar-öğreticiler-ve-makaleler)
   - [Diğer kaynaklar](#diğer-kaynaklar)
2. [Animasyon Öğreticisi](#animasyon-öğreticisi)
   - [Animasyonların işlenmesi](#animasyonların-işlenmesi)
   - [AnimatedWidget ile basitleştirme](#animatedwidget-ile-basitleştirme)
   - [Animasyonun ilerleyişini izleme](#animasyonun-ilerleyişini-izleme)
   - [AnimatedBuilder ile yeniden yapılandırma](#animatedbuilder-ile-yeniden-yapılandırma)
   - [Eşzamanlı animasyonlar](#eşzamanlı-animasyonlar)
   - [Sonraki adımlar](#sonraki-adımlar)
3. [Örtük Animasyonlar](#örtük-animasyonlar)
   - [Belgeler](#belgeler)
   - [Flutter in Focus videoları](#flutter-in-focus-videoları)
   - [The Boring Show](#the-boring-show)
   - [Haftanın Widget'ı videoları](#haftanın-widgetı-videoları)
4. [Bir Container'ın Özelliklerini Canlandırma](#bir-containerın-özelliklerini-canlandırma)
   - [1. Varsayılan özelliklere sahip bir StatefulWidget oluşturun](#1-varsayılan-özelliklere-sahip-bir-statefulwidget-oluşturun)
   - [2. Özellikleri kullanarak bir AnimatedContainer oluşturun](#2-özellikleri-kullanarak-bir-animatedcontainer-oluşturun)
   - [3. Yeni özelliklerle yeniden oluşturarak animasyonu başlatın](#3-yeni-özelliklerle-yeniden-oluşturarak-animasyonu-başlatın)
   - [Etkileşimli örnek](#etkileşimli-örnek)
5. [Bir Widget'ı Yavaşça Gösterip Gizleme](#bir-widgetı-yavaşça-gösterip-gizleme)
   - [1. Görünür ve görünmez hale gelecek bir kutu oluşturun](#1-görünür-ve-görünmez-hale-gelecek-bir-kutu-oluşturun)
   - [2. Bir StatefulWidget tanımlayın](#2-bir-statefulwidget-tanımlayın)
   - [3. Görünürlüğü değiştiren bir düğme görüntüleyin](#3-görünürlüğü-değiştiren-bir-düğme-görüntüleyin)
   - [4. Kutuyu yavaşça görünür ve görünmez hale getirin](#4-kutuyu-yavaşça-görünür-ve-görünmez-hale-getirin)
   - [Etkileşimli örnek](#etkileşimli-örnek-1)
6. [Hero Animasyonları](#hero-animasyonları)
   - [Hero animasyon stilleri](#hero-animasyon-stilleri)
   - [Hero animasyonunun temel yapısı](#hero-animasyonunun-temel-yapısı)
   - [Perde arkası](#perde-arkası)
   - [Standart Hero animasyonları](#standart-hero-animasyonları)
   - [Radyal Hero animasyonları](#radyal-hero-animasyonları)
   - [Örnekleri çalıştırma](#örnekleri-çalıştırma)
7. [Sayfa Geçişini Canlandırma](#sayfa-geçişini-canlandırma)
   - [1. Bir PageRouteBuilder ayarlayın](#1-bir-pageroutebuilder-ayarlayın)
   - [2. Bir Tween oluşturun](#2-bir-tween-oluşturun)
   - [3. Bir AnimatedWidget kullanın](#3-bir-animatedwidget-kullanın)
   - [4. Bir CurveTween kullanın](#4-bir-curvetween-kullanın)
   - [5. İki Tween'i birleştirin](#5-iki-tweeni-birleştirin)
   - [Etkileşimli örnek](#etkileşimli-örnek-2)
8. [Fizik Simülasyonu Kullanarak Bir Widget'ı Canlandırma](#fizik-simülasyonu-kullanarak-bir-widgetı-canlandırma)
   - [Adım 1: Bir animasyon denetleyicisi kurun](#adım-1-bir-animasyon-denetleyicisi-kurun)
   - [Adım 2: Hareketleri kullanarak widget'ı hareket ettirin](#adım-2-hareketleri-kullanarak-widgetı-hareket-ettirin)
   - [Adım 3: Widget'ı canlandırın](#adım-3-widgetı-canlandırın)
   - [Adım 4: Yaylanma hareketini simüle etmek için hızı hesaplayın](#adım-4-yaylanma-hareketini-simüle-etmek-için-hızı-hesaplayın)
   - [Etkileşimli örnek](#etkileşimli-örnek-3)
9. [Kademeli Animasyonlar](#kademeli-animasyonlar)
   - [Kademeli bir animasyonun temel yapısı](#kademeli-bir-animasyonun-temel-yapısı)
10. [Kademeli Bir Menü Animasyonu Oluşturma](#kademeli-bir-menü-animasyonu-oluşturma)
    - [Animasyon içermeyen menüyü oluşturun](#animasyon-içermeyen-menüyü-oluşturun)
    - [Animasyonlar için hazırlık](#animasyonlar-için-hazırlık)
    - [Liste öğelerini ve düğmeyi canlandırın](#liste-öğelerini-ve-düğmeyi-canlandırın)
    - [Etkileşimli örnek](#etkileşimli-örnek-4)
11. [Animasyon API'sine Genel Bakış](#animasyon-apisine-genel-bakış)
    - [Animation](#animation)
    - [AnimationController](#animationcontroller-1)
    - [Tween'ler](#tweenler)
    - [Mimari](#mimari)
12. [Kaynaklar](#kaynaklar)

---

## Animasyonlara Giriş

*Kaynak: <https://docs.flutter.dev/ui/animations>*

İyi tasarlanmış animasyonlar, kullanıcı arayüzünü daha sezgisel hale getirir, özenle hazırlanmış bir uygulamanın akıcı görünümüne ve hissine katkıda bulunur ve kullanıcı deneyimini iyileştirir. Flutter'ın animasyon desteği, çeşitli animasyon türlerini uygulamayı kolaylaştırır. Birçok widget, özellikle de [Material widget'ları](https://docs.flutter.dev/ui/widgets/material), tasarım spesifikasyonlarında tanımlanmış standart hareket efektleriyle birlikte gelir, ancak bu efektleri özelleştirmek de mümkündür.

### Bir yaklaşım seçme

Flutter'da animasyon oluştururken izleyebileceğiniz farklı yaklaşımlar vardır. Sizin için doğru yaklaşım hangisidir? Karar vermenize yardımcı olması için [Sizin için doğru Flutter Animasyon Widget'ını nasıl seçersiniz?](https://www.youtube.com/watch?v=GXIJJkq_H8g) başlıklı videoyu izleyin. (Ayrıca [_eşlik eden bir makale_](https://blog.flutter.dev/how-to-choose-which-flutter-animation-widget-is-right-for-you-79ecfb7e72b5) olarak da yayınlanmıştır.)

[▶ Video: Kullanım durumunuza en uygun Flutter animasyon widget'ını nasıl seçersiniz?](https://www.youtube.com/watch?v=GXIJJkq_H8g)

(Karar verme sürecini daha ayrıntılı incelemek için, Flutter Europe'da sunulan [Flutter'da Doğru Yapılmış Animasyonlar](https://www.youtube.com/watch?v=wnARLByOtKA&t=3s) videosunu izleyin.)

Videoda gösterildiği gibi, aşağıdaki karar ağacı, bir Flutter animasyonu uygularken hangi yaklaşımı kullanacağınıza karar vermenize yardımcı olur:

![Animasyon karar ağacı](https://docs.flutter.dev/assets/images/docs/ui/animations/animation-decision-tree.png)

### Animasyonlara derinlemesine bakış

Flutter'da animasyonların nasıl çalıştığını daha iyi anlamak için [Animasyonlara derinlemesine bakış](https://www.youtube.com/watch?v=PbcILiN8rbo&list=PLjxrf2q8roU2v6UqYlt_KPaXlnjbYySua&index=5) videosunu izleyin. (Ayrıca [_eşlik eden bir makale_](https://blog.flutter.dev/animation-deep-dive-39d3ffea111f) olarak da yayınlanmıştır.)

[▶ Video: Flutter animasyonlarını derinlemesine inceleyin](https://www.youtube.com/watch?v=PbcILiN8rbo)

### Örtük ve açık animasyonlar

#### Hazır örtük animasyonlar

Önceden hazırlanmış örtük bir animasyon (uygulaması en kolay animasyon türü) ihtiyaçlarınızı karşılıyorsa, [Örtük animasyonlarla animasyon temelleri](https://www.youtube.com/watch?v=IVTjpW3W33s&list=PLjxrf2q8roU2v6UqYlt_KPaXlnjbYySua&index=1) videosunu izleyin. (Ayrıca [_eşlik eden bir makale_](https://blog.flutter.dev/flutter-animation-basics-with-implicit-animations-95db481c5916) olarak da yayınlanmıştır.)

[▶ Video: Flutter örtük animasyon temelleri](https://www.youtube.com/watch?v=IVTjpW3W33s)

#### Özel örtük animasyonlar

Özel bir örtük animasyon oluşturmak için [TweenAnimationBuilder ile kendi özel örtük animasyonlarınızı oluşturma](https://www.youtube.com/watch?v=6KiPEqzJIKQ&feature=youtu.be) videosunu izleyin. (Ayrıca [_eşlik eden bir makale_](https://blog.flutter.dev/custom-implicit-animations-in-flutter-with-tweenanimationbuilder-c76540b47185) olarak da yayınlanmıştır.)

[▶ Video: TweenAnimationBuilder ile özel örtük animasyonlar oluşturma](https://www.youtube.com/watch?v=6KiPEqzJIKQ)

#### Yerleşik açık animasyonlar

Açık bir animasyon oluşturmak için (çerçevenin animasyonu kontrol etmesine izin vermek yerine, animasyonu kendiniz kontrol ettiğiniz), yerleşik açık animasyon sınıflarından birini kullanmayı düşünün. Daha fazla bilgi edinmek için [Yerleşik açık animasyonlarla ilk yönlü animasyonlarınızı oluşturma](https://www.youtube.com/watch?v=CunyH6unILQ&list=PLjxrf2q8roU2v6UqYlt_KPaXlnjbYySua&index=3) videosunu izleyin. (Ayrıca [_eşlik eden bir makale_](https://blog.flutter.dev/directional-animations-with-built-in-explicit-animations-3e7c5e6fbbd7) olarak da yayınlanmıştır.)

[▶ Video: Yerleşik açık animasyonlarla ilk yönlü animasyonlarınızı oluşturma](https://www.youtube.com/watch?v=CunyH6unILQ)

#### Açık animasyonlar

Sıfırdan bir açık animasyon oluşturmanız gerekiyorsa, [AnimatedBuilder ve AnimatedWidget ile özel açık animasyonlar oluşturma](https://www.youtube.com/watch?v=fneC7t4R_B0&list=PLjxrf2q8roU2v6UqYlt_KPaXlnjbYySua&index=4) videosunu izleyin. (Ayrıca [_eşlik eden bir makale_](https://blog.flutter.dev/when-should-i-useanimatedbuilder-or-animatedwidget-57ecae0959e8) olarak da yayınlanmıştır.)

[▶ Video: AnimatedBuilder ve AnimatedWidget ile özel açık animasyonlar oluşturma](https://www.youtube.com/watch?v=fneC7t4R_B0)

### Animasyon türleri

Genel olarak, animasyonlar ya tween (ara değer) tabanlı ya da fizik tabanlıdır. Aşağıdaki bölümlerde bu terimlerin anlamları açıklanmakta ve daha fazla bilgi edinebileceğiniz kaynaklara yönlendirilmektedir.

#### Tween animasyonu

_"In-betweening"_ (ara kareleme / ara değer hesaplama) teriminin kısaltmasıdır. Tween animasyonunda, başlangıç ve bitiş noktaları ile zaman çizelgesi ve geçişin zamanlamasını ve hızını tanımlayan bir eğri belirlenir. Çerçeve (framework), başlangıç noktasından bitiş noktasına nasıl geçiş yapılacağını hesaplar.

* Örneklerde tween kullanılan [Animasyon öğreticisine](https://docs.flutter.dev/ui/animations/tutorial) bakın.

* [`Tween`](https://api.flutter.dev/flutter/animation/Tween-class.html), [`CurveTween`](https://api.flutter.dev/flutter/animation/CurveTween-class.html) ve [`TweenSequence`](https://api.flutter.dev/flutter/animation/TweenSequence-class.html) için API belgelerine başvurun.

#### Fizik tabanlı animasyon

Fizik tabanlı animasyonda, hareket gerçek dünyadaki davranışa benzeyecek şekilde modellenir. Örneğin, bir topu fırlattığınızda, topun nereye ve ne zaman düşeceği, ne kadar hızlı fırlatıldığına ve yerden ne kadar uzakta olduğuna bağlıdır. Benzer şekilde, bir yaya bağlı bir topu düşürdüğünüzde, bir ipe bağlı bir topu düşürdüğünüzden farklı şekilde düşer (ve zıplar).

* [Fizik simülasyonu kullanarak bir widget'ı canlandırın](https://docs.flutter.dev/cookbook/animation/physics-simulation): Flutter yemek kitabının (cookbook) animasyonlar bölümünde yer alan bir tarif.

* [`AnimationController.animateWith`](https://api.flutter.dev/flutter/animation/AnimationController/animateWith.html) ve [`SpringSimulation`](https://api.flutter.dev/flutter/physics/SpringSimulation-class.html) için API belgelerine başvurun.

### Yaygın animasyon kalıpları

Çoğu UX veya hareket tasarımcısı, bir kullanıcı arayüzü tasarlarken belirli animasyon kalıplarının tekrar tekrar kullanıldığını fark eder. Bu bölümde, yaygın olarak kullanılan bazı animasyon kalıpları listelenmekte ve daha fazla bilgi edinebileceğiniz kaynaklar belirtilmektedir.

#### Animasyonlu liste veya ızgara

Bu kalıp, bir listeye veya ızgaraya (grid) öğelerin eklenmesinin veya çıkarılmasının canlandırılmasını içerir.

* [`AnimatedList` örneği](https://github.com/flutter/samples/blob/main/animations): [Örnek uygulama kataloğundaki](https://github.com/flutter/samples) bu demo, bir listeye öğe eklenmesini veya seçilen bir öğenin kaldırılmasını nasıl canlandıracağınızı gösterir. Kullanıcı artı (+) ve eksi (-) düğmelerini kullanarak listeyi değiştirdikçe, dahili Dart listesi senkronize edilir.

#### Paylaşılan öğe geçişi

Bu kalıpta, kullanıcı sayfadan bir öğe&mdash;genellikle bir resim&mdash;seçer ve kullanıcı arayüzü, seçilen öğeyi daha fazla ayrıntı içeren yeni bir sayfaya animasyonlu bir şekilde taşır. Flutter'da, `Hero` widget'ını kullanarak rotalar (sayfalar) arasında paylaşılan öğe geçişleri uygulayabilirsiniz.

* [Hero animasyonları](https://docs.flutter.dev/ui/animations/hero-animations) — İki farklı Hero animasyonu stilini oluşturma:
  * Hero, konumunu ve boyutunu değiştirerek bir sayfadan diğerine uçar.
  * Hero, bir sayfadan diğerine uçarken sınırının şekli daireden kareye dönüşür.

* [`Hero`](https://api.flutter.dev/flutter/widgets/Hero-class.html), [`Navigator`](https://api.flutter.dev/flutter/widgets/Navigator-class.html) ve [`PageRoute`](https://api.flutter.dev/flutter/widgets/PageRoute-class.html) sınıfları için API belgelerine başvurun.

#### Kademeli animasyon (Staggered animation)

Bir kısmının geciktirildiği, daha küçük hareketlere bölünmüş animasyonlardır. Bu küçük animasyonlar sıralı olabilir veya kısmen ya da tamamen üst üste binebilir.

* [Kademeli Animasyonlar](https://docs.flutter.dev/ui/animations/staggered-animations)

### Temel animasyon kavramları ve sınıfları

Flutter'daki animasyon sistemi, tipli (typed) [`Animation`](https://api.flutter.dev/flutter/animation/Animation-class.html) nesnelerine dayanır. Widget'lar, bu animasyonları mevcut değerlerini okuyarak ve durum değişikliklerini dinleyerek doğrudan `build()` işlevlerine dahil edebilir veya animasyonları, diğer widget'lara aktardıkları daha ayrıntılı animasyonların temeli olarak kullanabilirler.

#### Animation\<double\>

Flutter'da bir `Animation` nesnesi, ekranda görüntülenenlerden bağımsızdır. `Animation`, mevcut değerini ve durumunu (`dismissed`, `forward`, `reverse` veya `completed`) dışarıya açan soyut bir sınıftır. En yaygın kullanılan animasyon türlerinden biri `Animation<double>`'dır.

Bir `Animation` nesnesi, belirli bir süre boyunca iki değer arasında enterpolasyonlu sayıları sırayla üretir. Bir `Animation` nesnesinin çıktısı doğrusal, bir eğri, bir basamak fonksiyonu veya oluşturabileceğiniz başka herhangi bir eşleme olabilir. `Animation` nesnesinin nasıl kontrol edildiğine bağlı olarak, ters yönde çalışabilir veya hatta ortada yön değiştirebilir.

Animasyonlar, `double` dışında `Animation<Color>` veya `Animation<Size>` gibi diğer türleri de enterpolasyon yoluyla hesaplayabilir.

Bir `Animation` nesnesinin durumu (state) vardır. Mevcut değeri her zaman `.value` getter'ında bulunur.

Bir `Animation` nesnesi, ekrana çizim (rendering) veya `build()` işlevlerini yönetmez.

#### CurvedAnimation

Bir [`CurvedAnimation`](https://api.flutter.dev/flutter/animation/CurvedAnimation-class.html), animasyonun ilerlemesini doğrusal olmayan bir eğri olarak tanımlar.

```dart
animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
```

`CurvedAnimation` ve `AnimationController` (sonraki bölümlerde açıklanacaktır) her ikisi de `Animation<double>` türündedir, bu nedenle bunları birbirinin yerine kullanabilirsiniz. `CurvedAnimation`, değiştirdiği nesneyi sarar (wrap eder)&mdash;bir eğri uygulamak için `AnimationController`'ın alt sınıfını oluşturmazsınız.

[`Curves`](https://api.flutter.dev/flutter/animation/Curves-class.html) sınıfını `CurvedAnimation` ile birlikte kullanabilirsiniz. `Curves` sınıfı, yaygın olarak kullanılan birçok eğriyi tanımlar; ayrıca `transformInternal()` yöntemini geçersiz kılarak (override ederek) kendi eğrilerinizi de oluşturabilirsiniz. Örneğin:

```dart
import 'dart:math';

class ShakeCurve extends Curve {
  @override
  double transformInternal(double t) => t + sin(t * pi * 4) * 0.2;
}
```

Bir `Tween`'e animasyon eğrisi uygulamak istiyorsanız, [`CurveTween`](https://api.flutter.dev/flutter/animation/CurveTween-class.html) kullanmayı düşünün.

#### AnimationController

[`AnimationController`](https://api.flutter.dev/flutter/animation/AnimationController-class.html), donanım yeni bir kareye (frame) hazır olduğunda her seferinde yeni bir değer üreten özel bir `Animation` nesnesidir. Varsayılan olarak, bir `AnimationController` belirli bir süre boyunca 0.0 ile 1.0 arasındaki sayıları doğrusal olarak üretir. Örneğin, bu kod bir `Animation` nesnesi oluşturur, ancak çalıştırmaz:

```dart
controller = AnimationController(
  duration: const Duration(seconds: 2),
  vsync: this,
);
```

`AnimationController`, `Animation<double>` sınıfından türetilmiştir, bu nedenle bir `Animation` nesnesinin gerekli olduğu her yerde kullanılabilir. Ancak, `AnimationController`'ın animasyonu kontrol etmek için ek yöntemleri vardır. Örneğin, bir animasyonu `.forward()` yöntemiyle başlatabilirsiniz. Sayıların üretilmesi, ekran yenileme hızına bağlıdır (genellikle saniyede 60 ila 120 kare). Her sayı üretildikten sonra, her `Animation` nesnesi eklenmiş dinleyici (listener) geri çağırma işlevlerini çağırır. Her alt öğe (child) için özel bir görüntüleme listesi oluşturmak üzere [`RepaintBoundary`](https://api.flutter.dev/flutter/widgets/RepaintBoundary-class.html) sınıfına bakın.

Bir `AnimationController` oluştururken, ona bir `vsync` argümanı geçirirsiniz. `vsync`'in varlığı, ekran dışı (offscreen) animasyonların gereksiz kaynak tüketmesini önler. Sınıf tanımına `SingleTickerProviderStateMixin` ekleyerek durum bilgisi içeren (stateful) nesnenizi `vsync` olarak kullanabilirsiniz. Bunun bir örneğini GitHub'daki [animate1](https://github.com/flutter/website/tree/main/examples/animation/animate1) projesinde bulabilirsiniz.

> **Not:**
>
> Bir denetleyicinin değerleri, `fling()` ile sürülse bile `lowerBound` ve `upperBound` (varsayılan olarak 0.0 ve 1.0) aralığında kalır.
>
> Bununla birlikte, bir `CurvedAnimation`, üst denetleyicisi olan `AnimationController` bu aralığın dışına çıkmasa bile 0.0 ile 1.0 aralığını aşabilir. Seçilen eğriye bağlı olarak, `CurvedAnimation`'ın çıktısı, girdisinden daha geniş bir aralığa sahip olabilir. Örneğin, `Curves.elasticIn` gibi elastik eğriler, varsayılan aralığı önemli ölçüde aşar (overshoot) veya altında kalır (undershoot).

#### Tween

Varsayılan olarak, `AnimationController` nesnesi 0.0 ile 1.0 arasında değişir. Farklı bir aralık veya farklı bir veri türüne ihtiyacınız varsa, [`Tween`](https://api.flutter.dev/flutter/animation/Tween-class.html) kullanarak bir animasyonu farklı bir aralığa veya veri türüne enterpolasyon yapacak şekilde yapılandırabilirsiniz. Örneğin, aşağıdaki `Tween` -200.0 ile 0.0 arasında değişir:

```dart
tween = Tween<double>(begin: -200, end: 0);
```

Bir `Tween`, bir giriş aralığından bir çıkış aralığına eşleme tanımlar. Giriş aralığı genellikle 0.0 ile 1.0 arasındadır, ancak bu bir zorunluluk değildir.

Bir `Tween`, `Animation<T>`'den değil, `Animatable<T>`'den miras alır. Bir `Animatable`, `Animation` gibi, çıktı olarak `double` türü vermek zorunda değildir. Örneğin, `ColorTween` iki renk arasındaki geçişi belirtir.

```dart
colorTween = ColorTween(begin: Colors.transparent, end: Colors.black54);
```

Bir `Tween`, değiştirilebilir (mutable) `begin` ve `end` değerlerini depolar, ancak animasyonun ilerleyişini takip etmez. Bunun yerine, `transform` işlevini kullanarak animasyonun geçerli değerini (0.0 ile 1.0 arasında) gerçek animasyon değerine eşleyen [`evaluate(Animation<double> animation)`](https://api.flutter.dev/flutter/animation/Animatable/evaluate.html) yöntemini sağlar.

`Animation` nesnesinin mevcut değeri `.value` getter'ından alınabilir. Animasyon değerleri sırasıyla 0.0 ve 1.0 olduğunda, tween sırasıyla `begin` ve `end` değerlerini döndürür.

##### Tween.animate

Bir `Tween` nesnesini kullanmak için, `Tween` üzerinde `animate()` yöntemini çağırın ve denetleyici nesnesini parametre olarak geçirin. Örneğin, aşağıdaki kod 500 ms boyunca 0 ile 255 arasındaki tamsayı değerlerini üretir.

```dart
final AnimationController controller = AnimationController(
  duration: const Duration(milliseconds: 500),
  vsync: this,
);
final Animation<int> alpha = IntTween(
  begin: 0,
  end: 255,
).animate(controller);
```

> **Not:**
>
> `animate()` yöntemi, bir [`Animatable`](https://api.flutter.dev/flutter/animation/Animatable-class.html) değil, bir [`Animation`](https://api.flutter.dev/flutter/animation/Animation-class.html) döndürür.

Aşağıdaki örnek bir denetleyici, bir eğri ve bir `Tween` gösterir:

```dart
final AnimationController controller = AnimationController(
  duration: const Duration(milliseconds: 500),
  vsync: this,
);
final Animation<double> curve = CurvedAnimation(
  parent: controller,
  curve: Curves.easeOut,
);
final Animation<int> alpha = IntTween(begin: 0, end: 255).animate(curve);
```

#### Animasyon bildirimleri

Bir [`Animation`](https://api.flutter.dev/flutter/animation/Animation-class.html) nesnesi, `addListener()` ve `addStatusListener()` ile kaydedilmiş dinleyicilere ve durum dinleyicilerine sahip olabilir. Animasyonun değeri her değiştiğinde bir dinleyici çağrılır. Bir dinleyicinin en yaygın davranışı, yeniden oluşturmayı (rebuild) tetiklemek için `setState()` yöntemini çağırmaktır. Bir durum dinleyicisi, `AnimationStatus` içinde tanımlandığı gibi animasyon başladığında, bittiğinde, ileri gittiğinde veya geri gittiğinde çağrılır.

### Codelab'lar, öğreticiler ve makaleler

Aşağıdaki kaynaklar, Flutter animasyon çerçevesini öğrenmeye başlamak için iyi birer başlangıç noktasıdır. Bu belgelerin her biri, animasyon kodunun nasıl yazılacağını gösterir.

* [Flutter'da Animasyonlar codelab'ı](https://codelabs.developers.google.com/advanced-flutter-animations): Çoktan seçmeli bir bilgi yarışması oyunu oluştururken örtük ve açık animasyonlar hakkında bilgi edinin.

* [Animasyon öğreticisi](https://docs.flutter.dev/ui/animations/tutorial): Animasyon API'lerinin farklı yönlerini kullanarak tween animasyonlarının aşamalarını adım adım gösterirken, Flutter animasyon paketindeki temel sınıfları (denetleyiciler, `Animatable`, eğriler, dinleyiciler, oluşturucular) açıklar. Bu öğretici, kendi özel açık animasyonlarınızı nasıl oluşturacağınızı gösterir.

* [Flutter ile Sıfırdan Bir'e, 1. bölüm](https://flutter.dev/blog/zero-to-one-with-flutter) ve [2. bölüm](https://flutter.dev/blog/zero-to-one-with-flutter-part-two): Tweening kullanarak animasyonlu bir grafik oluşturmayı gösteren Flutter blog yazıları.

* [Gündelik oyunlar araç seti (Casual games toolkit)](https://docs.flutter.dev/resources/games-toolkit/): Flutter animasyonlarının nasıl kullanılacağına dair örnekler içeren oyun şablonlarının bulunduğu bir araç seti.

### Diğer kaynaklar

Aşağıdaki bağlantılardan Flutter animasyonları hakkında daha fazla bilgi edinebilirsiniz:

* pub.dev üzerinde, `Container` dönüşümleri, ortak eksen geçişleri, fade through geçişleri ve fade geçişleri dahil olmak üzere yaygın olarak kullanılan desenler için önceden oluşturulmuş animasyonlar içeren çeşitli [animasyon paketleri](https://pub.dev/packages?q=topic%3Aanimation) mevcuttur.

* [Örnek uygulama kataloğundan](https://github.com/flutter/samples) [animasyon örnekleri](https://github.com/flutter/samples/tree/main/animations#animation-samples).

* Flutter yemek kitabından [animasyon tarifleri](https://docs.flutter.dev/cookbook/animation).

* Flutter YouTube kanalından [animasyon videoları](https://www.youtube.com/@flutterdev/search?query=animation).

* [Animasyonlar: genel bakış](https://docs.flutter.dev/ui/animations/overview): Animasyon kütüphanesindeki bazı önemli sınıflara ve Flutter'ın animasyon mimarisine genel bir bakış.

* [Animasyon ve hareket widget'ları](https://docs.flutter.dev/ui/widgets/animation): Flutter API'lerinde sağlanan bazı animasyon widget'larının kataloğu.

* [Flutter API belgelerindeki](https://api.flutter.dev) [animasyon kütüphanesi](https://api.flutter.dev/flutter/animation/animation-library.html): Flutter çerçevesi için animasyon API'si. Bu bağlantı sizi kütüphanenin teknik genel bakış sayfasına yönlendirir.

---

## Animasyon Öğreticisi

*Kaynak: <https://docs.flutter.dev/ui/animations/tutorial>*

> **Neler öğreneceksiniz**
>
> * Animasyon kütüphanesindeki temel sınıfları kullanarak bir widget'a nasıl animasyon ekleneceğini.
> * `AnimatedWidget` ile `AnimatedBuilder` arasında ne zaman seçim yapmanız gerektiğini.

Bu öğretici, Flutter'da açık animasyonların nasıl oluşturulacağını gösterir. Örnekler birbirini tamamlayarak, animasyon kütüphanesinin farklı yönlerini tanıtır. Öğretici, [Animasyonlara Giriş](https://docs.flutter.dev/ui/animations) bölümünde öğrenebileceğiniz animasyon kütüphanesindeki temel kavramlar, sınıflar ve yöntemler üzerine kurulmuştur.

Flutter SDK'sı ayrıca [`FadeTransition`](https://api.flutter.dev/flutter/widgets/FadeTransition-class.html), [`SizeTransition`](https://api.flutter.dev/flutter/widgets/SizeTransition-class.html) ve [`SlideTransition`](https://api.flutter.dev/flutter/widgets/SlideTransition-class.html) gibi yerleşik açık animasyonlar da sunar. Bu widget'lar, genellikle bir `AnimationController` tarafından yönlendirilen bir `Animation` nesnesini alır ve değeri değiştikçe kullanıcı arayüzünü günceller. Bu widget'lar, bu öğreticide açıklanan özel açık animasyonlara kıyasla daha az kod gerektirir.

Aşağıdaki bölümlerde çeşitli animasyon örnekleri adım adım ele alınmaktadır. Her bölümde, ilgili örneğin kaynak koduna bir bağlantı bulunmaktadır.

### Animasyonların işlenmesi

> **Bunun amacı nedir?**
>
> * `addListener()` ve `setState()` kullanılarak bir widget'a temel animasyonun nasıl ekleneceği.
> * `Animation` her yeni sayı ürettiğinde, `addListener()` ile kaydedilen geri çağırma işlevi `setState()` işlevini çağırır.
> * Gerekli `vsync` parametresiyle bir `AnimationController`'ın nasıl tanımlanacağı.
> * `..addListener` içinde `..` sözdiziminin nasıl kullanılacağı; bu, Dart'ın _basamaklı notasyonu (cascade notation)_ olarak da bilinir.

Bir `Animation` nesnesi, zaman içinde bir sayı dizisi üretir, ancak ekrana hiçbir şey çizmez. Bir `Animation` nesnesiyle çizim yapmak için, `Animation` nesnesini widget'ınızın bir üyesi olarak saklayın, ardından nasıl çizileceğine karar vermek için bu nesnenin değerini kullanın.

Animasyon olmadan Flutter logosunu çizen aşağıdaki uygulamayı inceleyin:

```dart
import 'package:material_ui/material_ui.dart';

void main() => runApp(const LogoApp());

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 300,
        width: 300,
        child: const FlutterLogo(),
      ),
    );
  }
}
```

**Uygulama kaynağı:** [animate0](https://github.com/flutter/website/tree/main/examples/animation/animate0)

Aşağıda, logonun sıfırdan tam boyuta kadar büyüyecek şekilde canlandırılması için değiştirilmiş aynı kod gösterilmektedir. Bir `AnimationController` tanımlarken, bir `vsync` nesnesi geçmeniz gerekir. `vsync` parametresi, [`AnimationController` bölümünde](https://docs.flutter.dev/ui/animations#animationcontroller) açıklanmaktadır.

Animasyon içermeyen örneğe göre yapılan değişiklikler vurgulanmıştır:

```diff
- class _LogoAppState extends State<LogoApp> {
+ class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
+   late Animation<double> animation;
+   late AnimationController controller;
+
+   @override
+   void initState() {
+     super.initState();
+     controller = AnimationController(
+       duration: const Duration(seconds: 2),
+       vsync: this,
+     );
+     animation = Tween<double>(begin: 0, end: 300).animate(controller)
+       ..addListener(() {
+         setState(() {
+           // The state that has changed here is the animation object's value.
+         });
+       });
+     controller.forward();
+   }
+
    @override
    Widget build(BuildContext context) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
-         height: 300,
-         width: 300,
+         height: animation.value,
+         width: animation.value,
          child: const FlutterLogo(),
        ),
      );
    }
+
+   @override
+   void dispose() {
+     controller.dispose();
+     super.dispose();
+   }
  }
```

**Uygulama kaynağı:** [animate1](https://github.com/flutter/website/tree/main/examples/animation/animate1)

`addListener()` ile kaydedilen geri çağırma işlevi `setState()` yöntemini çağırır; böylece `Animation` her yeni bir sayı ürettiğinde, widget yeniden oluşturulmak üzere işaretlenir. `build()` yönteminde, container'ın boyutu değişir çünkü yüksekliği ve genişliği artık sabit kodlanmış bir değer yerine `animation.value` değerini kullanır. Bellek sızıntılarını önlemek için, `State` nesnesi atıldığında denetleyiciyi de sonlandırın (`dispose`).

Bu birkaç değişiklikle, Flutter'da ilk animasyonunuzu oluşturdunuz.

> **İpucu – Dart dilinde bir püf noktası:**
>
> Dart'ın basamaklı notasyonuna (cascade notation)&mdash;yani `..addListener()` içindeki iki noktaya&mdash;aşina olmayabilirsiniz. Bu sözdizimi, `addListener()` yönteminin `animate()` yönteminden dönen değer üzerinden çağrıldığı anlamına gelir. Aşağıdaki örneği inceleyin:
> ```dart
> animation = Tween<double>(begin: 0, end: 300).animate(controller)
>   ..addListener(() {
>     // ···
>   });
> ```
>
> Bu kod şuna eşdeğerdir:
> ```dart
> animation = Tween<double>(begin: 0, end: 300).animate(controller);
> animation.addListener(() {
>     // ···
>   });
> ```
>
> Basamaklı notasyon hakkında daha fazla bilgi edinmek için [Dart dil belgelerindeki](https://dart.dev/language) [Cascade notation](https://dart.dev/language/operators#cascade-notation) bölümüne göz atın.

### AnimatedWidget ile basitleştirme

> **Bunun amacı nedir?**
>
> * Animasyonlu bir widget oluşturmak için (`addListener()` ve `setState()` yerine) [`AnimatedWidget`](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html) yardımcı sınıfının nasıl kullanılacağı.
> * Yeniden kullanılabilir bir animasyon gerçekleştiren bir widget oluşturmak için `AnimatedWidget` kullanın. Geçişi widget'tan ayırmak için, [AnimatedBuilder ile yeniden yapılandırma](#animatedbuilder-ile-yeniden-yapılandırma) bölümünde gösterildiği gibi bir `AnimatedBuilder` kullanın.
> * Flutter API'sindeki `AnimatedWidget` widget'larına örnekler: `AnimatedBuilder`, `AnimatedModalBarrier`, `DecoratedBoxTransition`, `FadeTransition`, `PositionedTransition`, `RelativePositionedTransition`, `RotationTransition`, `ScaleTransition`, `SizeTransition`, `SlideTransition`.

`AnimatedWidget` temel sınıfı, temel widget kodunu animasyon kodundan ayırmanıza olanak tanır. `AnimatedWidget`, kendi `State` nesnesini ve animasyon dinleyicisini yönetir; bu nedenle bunları alt sınıfınızda uygulamanıza gerek yoktur. Aşağıdaki `AnimatedLogo` sınıfını ekleyin:

```dart
class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
    : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}
```

`AnimatedLogo`, kendini çizerken `animation`'ın geçerli değerini kullanır.

`LogoApp`, hâlâ `AnimationController` ve `Tween` nesnelerini yönetmekte olup `Animation` nesnesini `AnimatedLogo`'ya aktarmaktadır:

```diff
  void main() => runApp(const LogoApp());

+ class AnimatedLogo extends AnimatedWidget {
+   const AnimatedLogo({super.key, required Animation<double> animation})
+     : super(listenable: animation);
+
+   @override
+   Widget build(BuildContext context) {
+     final animation = listenable as Animation<double>;
+     return Center(
+       child: Container(
+         margin: const EdgeInsets.symmetric(vertical: 10),
+         height: animation.value,
+         width: animation.value,
+         child: const FlutterLogo(),
+       ),
+     );
+   }
+ }
+
  class LogoApp extends StatefulWidget {
    // ...
  }

  class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
    // ...

    @override
    void initState() {
      super.initState();
      controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );
-     animation = Tween<double>(begin: 0, end: 300).animate(controller)
-       ..addListener(() {
-         setState(() {
-           // The state that has changed here is the animation object's value.
-         });
-       });
+     animation = Tween<double>(begin: 0, end: 300).animate(controller);
      controller.forward();
    }

    @override
-   Widget build(BuildContext context) {
-     return Center(
-       child: Container(
-         margin: const EdgeInsets.symmetric(vertical: 10),
-         height: animation.value,
-         width: animation.value,
-         child: const FlutterLogo(),
-       ),
-     );
-   }
+   Widget build(BuildContext context) => AnimatedLogo(animation: animation);

    // ...
  }
```

**Uygulama kaynağı:** [animate2](https://github.com/flutter/website/tree/main/examples/animation/animate2)

### Animasyonun ilerleyişini izleme

> **Bunun amacı nedir?**
>
> * Animasyonun durumundaki değişiklikler (başlama, son noktaya ulaşma veya yönün tersine dönmesi gibi) hakkında bildirim almak için `addStatusListener()` kullanın.
> * Animasyon tamamlandığında veya başlangıç durumuna döndüğünde yönü tersine çevirerek ya da `controller.repeat(reverse: true)` yöntemini çağırarak bir animasyonu sonsuz döngüde çalıştırın.

Animasyonun bittiği, ilerlediği veya yönünün tersine döndüğü gibi durum değişikliklerini bilmek genellikle yararlıdır. `addStatusListener()` ile bu konuda bildirimler alabilirsiniz. Aşağıdaki kod, önceki örneği durum değişikliğini dinleyecek ve bir güncelleme yazdıracak şekilde değiştirir. Vurgulanan satır değişikliği gösterir:

```dart
class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) => debugPrint('$status'));
    controller.forward();
  }
  // ...
}
```

Bu kodu çalıştırdığınızda şu çıktı elde edilir:

```console
AnimationStatus.forward
AnimationStatus.completed
```

Ardından, animasyonu başlangıçta veya sonda tersine çevirmek için `addStatusListener()` kullanın. Bu, bir "nefes alma" efekti yaratır:

```diff
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
-   animation = Tween<double>(begin: 0, end: 300).animate(controller);
+   animation = Tween<double>(begin: 0, end: 300).animate(controller)
+     ..addStatusListener((status) {
+       if (status == AnimationStatus.completed) {
+         controller.reverse();
+       } else if (status == AnimationStatus.dismissed) {
+         controller.forward();
+       }
+     })
+     ..addStatusListener((status) => debugPrint('$status'));
    controller.forward();
  }
```

**Uygulama kaynağı:** [animate3](https://github.com/flutter/website/tree/main/examples/animation/animate3)

> **İpucu – Animasyonu tekrarlamak:**
>
> `addStatusListener()`, durum değişikliklerine tepki vermek için kullanışlı olsa da, tek amacınız bir animasyonu tek veya her iki yönde sürekli olarak döngüye sokmaksa, bir durum dinleyicisinde `forward()` ve `reverse()` yöntemlerini manuel olarak değiştirip durmak yerine [`controller.repeat(reverse: true)`](https://api.flutter.dev/flutter/animation/AnimationController/repeat.html) yöntemini çağırabilirsiniz. `stop()` yöntemini çağırmak animasyonun durumunu değiştirmez, dolayısıyla durum dinleyicilerini bilgilendirmez.

### AnimatedBuilder ile yeniden yapılandırma

> **Bunun amacı nedir?**
>
> * Bir [`AnimatedBuilder`](https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html), geçişi animasyon uygulanan widget'tan ayırır.
> * Bir `AnimatedBuilder`, widget'ın kendisini ekrana çizmez (render etmez) ve `Animation` nesnesini de yönetmez.
> * Bir animasyonu başka bir widget için `build()` yönteminin bir parçası olarak tanımlamak üzere `AnimatedBuilder` kullanın. Yeniden kullanılabilir bir animasyona sahip bir widget tanımlamak için, [AnimatedWidget ile basitleştirme](#animatedwidget-ile-basitleştirme) bölümünde gösterildiği gibi bir `AnimatedWidget` kullanın.
> * Flutter API'sinde `AnimatedBuilder` kullanan widget örnekleri: `BottomSheet`, `ExpansionTile`, `PopupMenu`, `ProgressIndicator`, `RefreshIndicator`, `Scaffold`, `SnackBar`, `TabBar`, `TextField`.

[animate3](https://github.com/flutter/website/tree/main/examples/animation/animate3) örneğindeki kodla ilgili bir sorun, animasyonu değiştirmek için logoyu çizen widget'ı değiştirmek zorunda kalınmasıdır. Daha iyi bir çözüm, sorumlulukları farklı sınıflara ayırmaktır:

* Logoyu ekrana çizmek
* `Animation` nesnesini tanımlamak
* Geçişi ekrana çizmek

Bu ayrımı, `AnimatedBuilder` sınıfı (veya genel amaçlı karşılığı olan [`ListenableBuilder`](https://api.flutter.dev/flutter/widgets/ListenableBuilder-class.html)) yardımıyla gerçekleştirebilirsiniz. Bir `AnimatedBuilder`, widget ağacında ayrı bir widget'tır. `AnimatedWidget` gibi, `AnimatedBuilder` da `Animation` nesnesinden gelen bildirimleri otomatik olarak dinler ve gerektiğinde widget ağacını yeniden oluşturulmak üzere (dirty olarak) işaretler; böylece `addListener()` yöntemini çağırmanıza gerek kalmaz.

[animate4](https://github.com/flutter/website/tree/main/examples/animation/animate4) örneğinin widget ağacı şu şekildedir:

![AnimatedBuilder widget ağacı](https://docs.flutter.dev/assets/images/docs/ui/AnimatedBuilder-WidgetTree.png)

Widget ağacının en altından başlayarak, logoyu çizmeye yönelik kod oldukça basittir:

```dart
class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  // Leave out the height and width so it fills the animating parent.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}
```

Şemadaki ortadaki üç blok, aşağıda gösterilen `GrowTransition` içindeki `build()` yönteminde oluşturulur. `GrowTransition` widget'ının kendisi durum bilgisi içermez (stateless) ve geçiş animasyonunu tanımlamak için gerekli `final` değişkenler kümesini barındırır. `build()` yöntemi, isimsiz `builder` geri çağırma işlevini ve `LogoWidget` nesnesini parametre olarak alan `AnimatedBuilder` nesnesini oluşturur ve döndürür. Geçişi çizme işi aslında isimsiz `builder` geri çağırma işlevinde gerçekleşir; bu işlev, `LogoWidget` öğesini sığacak şekilde küçülmeye zorlamak üzere uygun boyutta bir `SizedBox` (şemada `Container` olarak etiketlenmiştir) oluşturur.

Aşağıdaki koddaki kafa karıştırıcı olabilecek bir nokta, alt öğenin (`child`) iki kez belirtilmiş gibi görünmesidir. Burada olan şey şudur: `child` öğesine yapılan dış referans `AnimatedBuilder`'a aktarılır; o da bunu isimsiz kapanış işlevine (closure) aktarır ve bu işlev de söz konusu nesneyi kendi alt öğesi olarak kullanır. Net sonuç olarak, `AnimatedBuilder` widget ağacındaki iki widget arasına eklenir ve animasyon adımları (ticks) statik `child` alt ağacını yeniden oluşturmaz.

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

Son olarak, animasyonu başlatmak için kullanılan kod, [animate2](https://github.com/flutter/website/tree/main/examples/animation/animate2) örneğine çok benzemektedir. `initState()` yöntemi, bir `AnimationController` ve bir `Tween` oluşturur, ardından bunları `animate()` ile bağlar. Ardından, `build()` yöntemi, alt öğesi olarak bir `LogoWidget` içeren bir `GrowTransition` nesnesi ve geçişi yönlendirecek bir animasyon nesnesi döndürür. Bunlar, yukarıdaki madde işaretlerinde listelenen üç öğedir.

```diff
  void main() => runApp(const LogoApp());

+ class LogoWidget extends StatelessWidget {
+   const LogoWidget({super.key});
+
+   // Leave out the height and width so it fills the animating parent.
+   @override
+   Widget build(BuildContext context) {
+     return Container(
+       margin: const EdgeInsets.symmetric(vertical: 10),
+       child: const FlutterLogo(),
+     );
+   }
+ }
+
+ class GrowTransition extends StatelessWidget {
+   const GrowTransition({
+     required this.child,
+     required this.animation,
+     super.key,
+   });
+
+   final Widget child;
+   final Animation<double> animation;
+
+   @override
+   Widget build(BuildContext context) {
+     return Center(
+       child: AnimatedBuilder(
+         animation: animation,
+         builder: (context, child) {
+           return SizedBox(
+             height: animation.value,
+             width: animation.value,
+             child: child,
+           );
+         },
+         child: child,
+       ),
+     );
+   }
+ }

  class LogoApp extends StatefulWidget {
    // ...
  }

  class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
    // ...

    @override
-   Widget build(BuildContext context) => AnimatedLogo(animation: animation);
+   Widget build(BuildContext context) {
+     return GrowTransition(animation: animation, child: const LogoWidget());
+   }

    // ...
  }
```

**Uygulama kaynağı:** [animate4](https://github.com/flutter/website/tree/main/examples/animation/animate4)

### Eşzamanlı animasyonlar

> **Bunun amacı nedir?**
>
> * [`Curves`](https://api.flutter.dev/flutter/animation/Curves-class.html) sınıfı, bir [`CurvedAnimation`](https://api.flutter.dev/flutter/animation/CurvedAnimation-class.html) ile kullanabileceğiniz yaygın olarak kullanılan eğrilerden oluşan bir dizi tanımlar.

Bu bölümde, `AnimatedWidget` kullanarak sürekli olarak büyüyüp küçülen [Animasyonun ilerleyişini izleme](https://docs.flutter.dev/ui/animations/tutorial#monitoring) ([animate3](https://github.com/flutter/website/tree/main/examples/animation/animate3)) örneğini temel alacaksınız. Opaklık şeffaftan opağa doğru canlanırken aynı zamanda büyüyüp küçülme animasyonu gerçekleştirmek istediğiniz durumu ele alalım.

> **Not:**
>
> Bu örnek, aynı animasyon denetleyicisi üzerinde her bir tween'in animasyondaki farklı bir efekti yönettiği birden fazla tween'in nasıl kullanılacağını gösterir. Bu örnek yalnızca açıklama amaçlıdır. Üretim kodundaki (production code) opaklık animasyonları için, her karede widget'ların yeniden oluşturulmasını önlemek amacıyla [`FadeTransition`](https://api.flutter.dev/flutter/widgets/FadeTransition-class.html) kullanmayı tercih edin. Boyut değişiklikleri için, bir alt öğenin ne kadarının görünür hale geleceğini canlandırmak istediğinizde [`SizeTransition`](https://api.flutter.dev/flutter/widgets/SizeTransition-class.html) kullanmayı düşünün.

Her bir tween, animasyonun bir yönünü yönetir. Örneğin:

```dart
controller = AnimationController(
  duration: const Duration(seconds: 2),
  vsync: this,
);
sizeAnimation = Tween<double>(begin: 0, end: 300).animate(controller);
opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller);
```

Boyutu `sizeAnimation.value` ile ve opaklığı `opacityAnimation.value` ile elde edebilirsiniz. Ancak, `AnimatedLogo` zaten denetleyicinin animasyonunu dinlemektedir; bu nedenle, her iki değeri de bu tek animasyondan hesaplayabilir.

`AnimatedLogo`'yu kendi `Tween` nesnelerini kapsülleyecek şekilde değiştirin; böylece `build()` yöntemi, gerekli boyut ve opaklık değerlerini hesaplamak için üst nesnenin animasyon nesnesi üzerinde `Tween.evaluate()` yöntemini çağırır. Aşağıdaki kodda yapılan değişiklikler gösterilmiştir:

```dart
class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
    : super(listenable: animation);

  // Make the tweens static because they don't change.
  static final Tween<double> _opacityTween = Tween(begin: 0.1, end: 1);
  static final Tween<double> _sizeTween = Tween(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
```

**Uygulama kaynağı:** [animate5](https://github.com/flutter/website/tree/main/examples/animation/animate5)

### Sonraki adımlar

Bu öğretici, Flutter'da tween'leri kullanarak açık animasyonlar oluşturmak için bir temel sağlar, ancak keşfedilebilecek başka birçok animasyon API'si de vardır:

* Bir `AnimationController` yönetmeyi gerektirmeyen daha basit animasyonlar için [örtük animasyonlar](https://docs.flutter.dev/ui/animations/implicit-animations) ve [`TweenAnimationBuilder`](https://api.flutter.dev/flutter/widgets/TweenAnimationBuilder-class.html).
* [`ColorTween`](https://api.flutter.dev/flutter/animation/ColorTween-class.html), [`RectTween`](https://api.flutter.dev/flutter/animation/RectTween-class.html) ve [`IntTween`](https://api.flutter.dev/flutter/animation/IntTween-class.html) gibi özelleşmiş [`Tween`](https://api.flutter.dev/flutter/animation/Tween-class.html) alt sınıfları.
* Sıralı veya üst üste binen hareketleri koordine etmek için [kademeli animasyonlar](https://docs.flutter.dev/ui/animations/staggered-animations).
* Rotalar arasında paylaşılan öğe geçişleri için [Hero animasyonları](https://docs.flutter.dev/ui/animations/hero-animations).
* Gerçek dünya fiziğine göre modellenmiş hareketler için [fizik simülasyonları](https://docs.flutter.dev/cookbook/animation/physics-simulation) ve [`fling()`](https://api.flutter.dev/flutter/animation/AnimationController/fling.html) yöntemleri.
* Flutter'ın animasyon mimarisine daha derinlemesine bir bakış için [`ReverseAnimation`](https://api.flutter.dev/flutter/animation/ReverseAnimation-class.html) ve [Animasyonlara genel bakış](https://docs.flutter.dev/ui/animations/overview).

---

## Örtük Animasyonlar

*Kaynak: <https://docs.flutter.dev/ui/animations/implicit-animations>*

Flutter'ın [animasyon kütüphanesi](https://api.flutter.dev/flutter/animation/animation-library.html) ile kullanıcı arayüzünüzdeki widget'lara hareket ekleyebilir ve görsel efektler oluşturabilirsiniz. Kütüphanenin bir parçası, animasyonları sizin yerinize yöneten çeşitli widget'lardan oluşur. Bu widget'lar topluca _örtük animasyonlar (implicit animations)_ veya _örtük olarak canlandırılan widget'lar_ olarak adlandırılır; adlarını, uyguladıkları [`ImplicitlyAnimatedWidget`](https://api.flutter.dev/flutter/widgets/ImplicitlyAnimatedWidget-class.html) sınıfından alırlar.

Örtük animasyonlarda, bir `AnimationController` veya `Ticker` yönetmenize gerek yoktur. Bunun yerine, `AnimatedOpacity` gibi örtük olarak canlandırılan bir widget'a bir `duration` ve isteğe bağlı bir `curve` değeri aktarırsınız. Widget'ı yeni bir hedef değerle güncellediğinizde (örneğin, `setState()` çağrısından sonra), widget otomatik olarak o değere doğru canlanır:

```dart
import 'package:material_ui/material_ui.dart';

class FadeBoxDemo extends StatefulWidget {
  const FadeBoxDemo({super.key});

  @override
  State<FadeBoxDemo> createState() => _FadeBoxDemoState();
}

class _FadeBoxDemoState extends State<FadeBoxDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: const FlutterLogo(size: 100),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => setState(() => _visible = !_visible),
          child: const Text('Toggle opacity'),
        ),
      ],
    );
  }
}
```

**Uygulama kaynağı:** [örtük animasyon örneği](https://github.com/flutter/website/tree/main/examples/animation/implicit)

Canlandırmak istediğiniz özelliği kapsayan yerleşik bir örtük animasyonlu widget yoksa, [`TweenAnimationBuilder`](https://api.flutter.dev/flutter/widgets/TweenAnimationBuilder-class.html) ile özel bir örtük animasyon oluşturabilirsiniz.

Aşağıdaki kaynaklar kümesi, Flutter'daki örtük animasyonlar hakkında bilgi edinmenin birçok yolunu sunar.

### Belgeler

* **[Flutter'da Animasyonlar codelab'ı](https://codelabs.developers.google.com/advanced-flutter-animations):** Örtük ve açık animasyonlar hakkında bilgi edinin ve eksiksiz bir Flutter uygulamasına örtük animasyonlar ekleme konusunda pratik deneyim kazanın.

* **[`AnimatedContainer` örneği](https://docs.flutter.dev/cookbook/animation/animated-container):** [`AnimatedContainer`](https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html) örtük animasyonlu widget'ını kullanmak için adım adım bir tarif.

* **[Bir widget'ı yavaşça gösterip gizleme](https://docs.flutter.dev/cookbook/animation/opacity-animation):** [`AnimatedOpacity`](https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html) kullanarak bir widget'ı nasıl yavaşça görünür ve görünmez hale getirebileceğinizi gösteren bir yemek kitabı (cookbook) tarifi.

* **[`TweenAnimationBuilder`](https://api.flutter.dev/flutter/widgets/TweenAnimationBuilder-class.html) API sayfası:** Bir `Tween` ve bir `builder` geri çağırma işlevini kullanarak herhangi bir özellik için özel örtük animasyonlar oluşturun.

* **[`ImplicitlyAnimatedWidget`](https://api.flutter.dev/flutter/widgets/ImplicitlyAnimatedWidget-class.html) API sayfası:** Tüm örtük animasyonlar `ImplicitlyAnimatedWidget` sınıfını genişletir (extend eder).

### Flutter in Focus videoları

Flutter in Focus videoları, her Flutter geliştiricisinin baştan sona bilmesi gereken teknikleri ele alan, gerçek kod içeren 5-10 dakikalık öğreticiler sunar. Aşağıdaki videolar, örtük animasyonlarla ilgili konuları ele almaktadır.

[▶ Video: Flutter örtük animasyon temelleri](https://www.youtube.com/watch?v=IVTjpW3W33s)

[▶ Video: TweenAnimationBuilder ile özel örtük animasyonlar oluşturma](https://www.youtube.com/watch?v=6KiPEqzJIKQ)

### The Boring Show

Google mühendislerinin Flutter'da sıfırdan uygulama geliştirmelerini takip etmek için Boring Show'u izleyin. Aşağıdaki bölümde, bir haber toplama uygulamasında örtük animasyonların kullanımı ele alınmaktadır.

[▶ Video: Haber uygulamasına örtük animasyonlar ekleme](https://www.youtube.com/watch?v=8ehlWchLVlQ)

### Haftanın Widget'ı videoları

Her biri belirli bir widget'ın önemli özelliklerini gösteren haftalık kısa animasyonlu video serisi. Yaklaşık 60 saniye içinde, her widget için gerçek kodu ve nasıl çalıştığına dair bir demo göreceksiniz. Aşağıdaki Haftanın Widget'ı (Widget of the Week) videoları, örtük animasyonlu widget'ları ele almaktadır:

* [▶ Video: AnimatedOpacity - Haftanın Flutter widget'ı](https://www.youtube.com/watch?v=QZAvjqOqiLY)
* [▶ Video: AnimatedPadding - Haftanın Flutter widget'ı](https://www.youtube.com/watch?v=PY2m0fhGNz4)
* [▶ Video: AnimatedPositioned - Haftanın Flutter widget'ı](https://www.youtube.com/watch?v=hC3s2YdtWt8)
* [▶ Video: AnimatedSwitcher - Haftanın Flutter widget'ı](https://www.youtube.com/watch?v=2W7POjFb88g)

---

## Bir Container'ın Özelliklerini Canlandırma

*Kaynak: <https://docs.flutter.dev/cookbook/animation/animated-container>*

[`Container`](https://api.flutter.dev/flutter/widgets/Container-class.html) sınıfı; genişlik, yükseklik, arka plan rengi, iç boşluk (padding), kenarlıklar ve daha fazlası gibi belirli özelliklere sahip bir widget oluşturmak için kullanışlı bir yol sunar.

Basit animasyonlar genellikle bu özelliklerin zaman içinde değiştirilmesini içerir. Örneğin, bir öğenin kullanıcı tarafından seçildiğini belirtmek için arka plan rengini griden yeşile animasyonlu bir şekilde değiştirmek isteyebilirsiniz.

Bu özellikleri canlandırmak için Flutter, [`AnimatedContainer`](https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html) widget'ını sunar. `Container` widget'ı gibi, `AnimatedContainer` da genişlik, yükseklik, arka plan renkleri ve daha fazlasını tanımlamanıza olanak tanır. Ancak, `AnimatedContainer` yeni özelliklerle yeniden oluşturulduğunda, eski ve yeni değerler arasında otomatik olarak bir animasyon gerçekleştirir. Flutter'da bu tür animasyonlara "örtük animasyonlar (implicit animations)" denir.

Bu tarifte, kullanıcı bir düğmeye dokunduğunda boyut, arka plan rengi ve kenarlık yarıçapını (border radius) canlandırmak için bir `AnimatedContainer`'ın nasıl kullanılacağı aşağıdaki adımlarla açıklanmaktadır:

1. Varsayılan özelliklere sahip bir `StatefulWidget` oluşturun.
2. Özellikleri kullanarak bir `AnimatedContainer` oluşturun.
3. Yeni özelliklerle yeniden oluşturarak animasyonu başlatın.

### 1. Varsayılan özelliklere sahip bir StatefulWidget oluşturun

Başlangıç olarak, [`StatefulWidget`](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) ve [`State`](https://api.flutter.dev/flutter/widgets/State-class.html) sınıflarını oluşturun. Zamanla değişen özellikleri tanımlamak için özel `State` sınıfını kullanın. Bu örnekte bunlar genişlik, yükseklik, renk ve kenarlık yarıçapını içerir. Ayrıca her özelliğin varsayılan değerini de tanımlayabilirsiniz.

Bu özellikler, kullanıcı bir düğmeye dokunduğunda güncellenebilmeleri için özel bir `State` sınıfına aittir.

```dart
class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
  }
}
```

### 2. Özellikleri kullanarak bir AnimatedContainer oluşturun

Ardından, önceki adımda tanımlanan özellikleri kullanarak `AnimatedContainer`'ı oluşturun. Ayrıca, animasyonun ne kadar süreyle çalışacağını tanımlayan bir `duration` sağlayın.

```dart
AnimatedContainer(
  // Use the properties stored in the State class.
  width: _width,
  height: _height,
  decoration: BoxDecoration(
    color: _color,
    borderRadius: _borderRadius,
  ),
  // Define how long the animation should take.
  duration: const Duration(seconds: 1),
  // Provide an optional curve to make the animation feel smoother.
  curve: Curves.fastOutSlowIn,
)
```

### 3. Yeni özelliklerle yeniden oluşturarak animasyonu başlatın

Son olarak, `AnimatedContainer`'ı yeni özelliklerle yeniden oluşturarak (rebuild ederek) animasyonu başlatın. Yeniden oluşturma nasıl tetiklenir? [`setState()`](https://api.flutter.dev/flutter/widgets/State/setState.html) yöntemini kullanın.

Uygulamaya bir düğme ekleyin. Kullanıcı düğmeye dokunduğunda, bir `setState()` çağrısı içinde özellikleri yeni genişlik, yükseklik, arka plan rengi ve kenarlık yarıçapı değerleriyle güncelleyin.

Gerçek bir uygulama genellikle sabit değerler arasında geçiş yapar (örneğin, gri bir arka plandan yeşil bir arka plana). Bu uygulama için, kullanıcı düğmeye her dokunduğunda yeni değerler üretin.

```dart
FloatingActionButton(
  // When the user taps the button
  onPressed: () {
    // Use setState to rebuild the widget with new values.
    setState(() {
      // Create a random number generator.
      final random = Random();

      // Generate a random width and height.
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      // Generate a random color.
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );

      // Generate a random border radius.
      _borderRadius = BorderRadius.circular(
        random.nextInt(100).toDouble(),
      );
    });
  },
  tooltip: 'Animate',
  child: const Icon(Icons.play_arrow),
)
```

### Etkileşimli örnek

```dartpad
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const AnimatedContainerApp());

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedContainer Demo')),
        body: Center(
          child: AnimatedContainer(
            // Use the properties stored in the State class.
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            // Define how long the animation should take.
            duration: const Duration(seconds: 1),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // When the user taps the button
          onPressed: () {
            // Use setState to rebuild the widget with new values.
            setState(() {
              // Create a random number generator.
              final random = Random();

              // Generate a random width and height.
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              // Generate a random color.
              _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              // Generate a random border radius.
              _borderRadius = BorderRadius.circular(
                random.nextInt(100).toDouble(),
              );
            });
          },
          tooltip: 'Animate',
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
```

<noscript>
  <img src="/assets/images/docs/cookbook/animated-container.webp" alt="AnimatedContainer demo showing a box growing and shrinking in size while changing color and border radius" />
</noscript>

---

## Bir Widget'ı Yavaşça Gösterip Gizleme

*Kaynak: <https://docs.flutter.dev/cookbook/animation/opacity-animation>*

Kullanıcı arayüzü (UI) geliştiricilerinin genellikle ekrandaki öğeleri gösterip gizlemesi gerekir. Ancak, öğelerin ekranda aniden belirip kaybolması son kullanıcılar için sarsıcı hissettirebilir. Bunun yerine, akıcı bir deneyim yaratmak için öğeleri bir opaklık animasyonuyla yavaşça görünür (fade in) ve görünmez (fade out) hale getirin.

[`AnimatedOpacity`](https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html) widget'ı, opaklık animasyonlarını gerçekleştirmeyi kolaylaştırır. Bu tarifte aşağıdaki adımlar kullanılır:

1. Görünür ve görünmez hale gelecek bir kutu oluşturun.
2. Bir `StatefulWidget` tanımlayın.
3. Görünürlüğü değiştiren bir düğme görüntüleyin.
4. Kutuyu yavaşça görünür ve görünmez hale getirin.

### 1. Görünür ve görünmez hale gelecek bir kutu oluşturun

Öncelikle, yavaşça görünür ve görünmez hale getirilecek bir öğe oluşturun. Bu örnekte, ekrana yeşil bir kutu çizin.

```dart
Container(width: 200, height: 200, color: Colors.green)
```

### 2. Bir StatefulWidget tanımlayın

Artık canlandıracağınız yeşil bir kutunuz olduğuna göre, kutunun görünür olup olmaması gerektiğini bilmenin bir yoluna ihtiyacınız vardır. Bunu gerçekleştirmek için bir [`StatefulWidget`](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) kullanın.

Bir `StatefulWidget`, bir `State` nesnesi oluşturan bir sınıftır. `State` nesnesi, uygulama hakkında bazı verileri tutar ve bu verileri güncellemek için bir yol sağlar. Verileri güncellerken, Flutter'dan bu değişikliklerle kullanıcı arayüzünü yeniden oluşturmasını da isteyebilirsiniz.

Bu durumda, tek bir veri parçanız vardır: yeşil kutunun görünür olup olmadığını temsil eden bir boolean değeri.

Bir `StatefulWidget` inşa etmek için iki sınıf oluşturun: Bir `StatefulWidget` ve buna karşılık gelen bir `State` sınıfı. Profesyonel ipucu: Android Studio ve VS Code için Flutter eklentileri, bu kodu hızlı bir şekilde oluşturmak üzere `stful` kod parçacığını (snippet) içerir.

```dart
// The StatefulWidget's job is to take data and create a State class.
// In this case, the widget takes a title, and creates a _MyHomePageState.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// The State class is responsible for two things: holding some data you can
// update and building the UI using that data.
class _MyHomePageState extends State<MyHomePage> {
  // Whether the green box should be visible.
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    // The green box goes here with some other Widgets.
  }
}
```

### 3. Görünürlüğü değiştiren bir düğme görüntüleyin

Artık yeşil kutunun görünür olup olmayacağını belirleyecek bazı verileriniz olduğuna göre, bu verileri güncellemenin bir yoluna ihtiyacınız vardır. Bu örnekte, kutu görünür durumdaysa onu gizleyin. Kutu gizliyse onu gösterin.

Bunu ele almak için bir düğme görüntüleyin. Kullanıcı düğmeye bastığında, boolean değerini `true`'dan `false`'a veya `false`'tan `true`'ya çevirin. Bu değişikliği, `State` sınıfındaki bir yöntem olan [`setState()`](https://api.flutter.dev/flutter/widgets/State/setState.html) kullanarak yapın. Bu, Flutter'a widget'ı yeniden oluşturmasını söyler.

Kullanıcı girdileriyle çalışma hakkında daha fazla bilgi edinmek için yemek kitabının [Gestures (Hareketler)](https://docs.flutter.dev/cookbook/gestures) bölümüne başvurun.

```dart
FloatingActionButton(
  onPressed: () {
    // Call setState. This tells Flutter to rebuild the
    // UI with the changes.
    setState(() {
      _visible = !_visible;
    });
  },
  tooltip: 'Toggle Opacity',
  child: const Icon(Icons.flip),
)
```

### 4. Kutuyu yavaşça görünür ve görünmez hale getirin

Ekranda yeşil bir kutunuz ve görünürlüğü `true` veya `false` olarak değiştiren bir düğmeniz var. Kutuyu nasıl yavaşça görünür ve görünmez hale getirebilirsiniz? Bir [`AnimatedOpacity`](https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html) widget'ı ile.

`AnimatedOpacity` widget'ı üç argüman gerektirir:

- `opacity`: 0.0 (görünmez) ile 1.0 (tamamen görünür) arasında bir değer.
- `duration`: Animasyonun tamamlanması için gereken süre.
- `child`: Canlandırılacak widget. Bu durumda, yeşil kutu.

```dart
AnimatedOpacity(
  // If the widget should be visible, animate to 1.0 (fully visible).
  // If the widget should be hidden, animate to 0.0 (invisible).
  opacity: _visible ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 500),
  // The green box must be a child of the AnimatedOpacity widget.
  child: Container(width: 200, height: 200, color: Colors.green),
)
```

### Etkileşimli örnek

```dartpad
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Opacity Demo';
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

// The StatefulWidget's job is to take data and create a State class.
// In this case, the widget takes a title, and creates a _MyHomePageState.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// The State class is responsible for two things: holding some data you can
// update and building the UI using that data.
class _MyHomePageState extends State<MyHomePage> {
  // Whether the green box should be visible
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: AnimatedOpacity(
          // If the widget should be visible, animate to 1.0 (fully visible).
          // If the widget should be hidden, animate to 0.0 (invisible).
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widget.
          child: Container(width: 200, height: 200, color: Colors.green),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
```

<noscript>
  <img src="/assets/images/docs/cookbook/fade-in-out.webp" alt="Fade In and Out Demo" />
</noscript>

---

## Hero Animasyonları

*Kaynak: <https://docs.flutter.dev/ui/animations/hero-animations>*

> **Neler öğreneceksiniz**
>
> * _Hero_, ekranlar arasında uçan widget'ı ifade eder.
> * Flutter'ın `Hero` widget'ını kullanarak bir Hero animasyonu oluşturun.
> * Hero'yu bir ekrandan diğerine uçurun.
> * Hero'yu bir ekrandan diğerine uçururken şeklinin daireselden dikdörtgene dönüşümünü canlandırın.
> * Flutter'daki `Hero` widget'ı, yaygın olarak _paylaşılan öğe geçişleri (shared element transitions)_ veya _paylaşılan öğe animasyonları_ olarak bilinen bir animasyon stilini uygular.

Hero animasyonlarını muhtemelen birçok kez görmüşsünüzdür. Örneğin, bir ekranda satışa sunulan ürünleri temsil eden küçük resimlerden (thumbnails) oluşan bir liste görüntülenir. Bir öğenin seçilmesi, onu daha fazla ayrıntı ve bir **Satın Al (Buy)** düğmesi içeren yeni bir ekrana uçurur. Bir görüntüyü bir ekrandan diğerine uçurmaya Flutter'da _Hero animasyonu_ denir, ancak aynı hareket bazen _paylaşılan öğe geçişi_ olarak da adlandırılır.

`Hero` widget'ını tanıtan bu bir dakikalık videoyu izlemek isteyebilirsiniz:

[▶ Video: Hero | Haftanın Flutter widget'ı](https://www.youtube.com/watch?v=Be9UH1kXFDw)

Bu kılavuzda, standart Hero animasyonlarının yanı sıra, uçuş sırasında görüntüyü dairesel bir şekilden kare şekle dönüştüren Hero animasyonlarının nasıl oluşturulacağı gösterilmektedir.

> **Örnekler**
>
> Bu kılavuz, her bir Hero animasyon stiline ilişkin örnekleri adım adım açıklamaktadır:
>
> * [Standart Hero animasyonları](#standart-hero-animasyonları)
> * [Radyal Hero animasyonları](#radyal-hero-animasyonları)
>
> Örnekleri kendiniz çalıştırmak istiyorsanız, [Örnekleri çalıştırma](#örnekleri-çalıştırma) bölümündeki adımları izleyin.

> **Flutter'da yeni misiniz?**
>
> Bu sayfada, Flutter'ın widget'larını kullanarak bir yerleşim düzeni (layout) oluşturmayı bildiğiniz varsayılmaktadır. Daha fazla bilgi edinmek için [Flutter'da Düzen Oluşturma](https://docs.flutter.dev/ui/layout) sayfasını ziyaret edin.

> **İpucu – Terminoloji:**
>
> Bir [_Route (Rota)_](https://docs.flutter.dev/cookbook/navigation/navigation-basics), bir Flutter uygulamasındaki bir sayfayı veya ekranı tanımlar.

### Hero animasyon stilleri

Flutter'da `Hero` widget'larını kullanarak Hero animasyonları oluşturabilirsiniz. Hero kaynak rotadan hedef rotaya doğru canlanırken, hedef rota (Hero hariç) yavaşça görünür hale gelir. Genellikle Hero'lar, her iki rotanın da ortak olarak sahip olduğu resimler gibi kullanıcı arayüzünün küçük parçalarıdır. Kullanıcının bakış açısından Hero, rotalar arasında "uçar". Bu kılavuzda aşağıdaki Hero animasyonlarının nasıl oluşturulacağı gösterilmektedir:

#### Standart animasyonlar

Bir _standart Hero animasyonu_, Hero'yu bir rotadan yeni bir rotaya uçurur; Hero genellikle farklı bir konuma ve farklı bir boyutta iner.

Aşağıdaki video (yavaş hızda kaydedilmiştir) tipik bir örneği göstermektedir. Rotanın ortasındaki paletlere (flippers) dokunulduğunda, bunlar daha küçük bir boyutta yeni, mavi bir rotanın sol üst köşesine uçar. Mavi rotadaki paletlere dokunulduğunda (veya cihazın önceki rotaya dönme hareketi kullanıldığında) paletler orijinal rotaya geri uçar.

[▶ Video: Flutter'da standart Hero animasyonu](https://www.youtube.com/watch?v=CEcFnqRDfgw)

#### Radyal animasyonlar

Bir _radyal Hero animasyonunda_, Hero rotalar arasında uçarken şekli daireselden dikdörtgene dönüşüyormuş gibi görünür.

Aşağıdaki video (yavaş hızda kaydedilmiştir), radyal bir Hero animasyonu örneğini göstermektedir. Başlangıçta, rotanın alt kısmında üç dairesel görüntüden oluşan bir satır görünür. Dairesel görüntülerden herhangi birine dokunulduğunda, o görüntü kare bir şekille görüntülenen yeni bir rotaya uçar. Kare görüntüye dokunulduğunda ise Hero, dairesel bir şekille görüntülenen orijinal rotaya geri uçar.

[▶ Video: Flutter'da radyal Hero animasyonu](https://www.youtube.com/watch?v=LWKENpwDKiM)

[Standart](#standart-hero-animasyonları) veya [radyal](#radyal-hero-animasyonları) Hero animasyonlarına özgü bölümlere geçmeden önce, Hero animasyonu kodunu nasıl yapılandıracağınızı öğrenmek için [Hero animasyonunun temel yapısı](#hero-animasyonunun-temel-yapısı) bölümünü ve Flutter'ın bir Hero animasyonunu nasıl gerçekleştirdiğini anlamak için [perde arkası](#perde-arkası) bölümünü okuyun.

### Hero animasyonunun temel yapısı

> **Bunun amacı nedir?**
>
> * Animasyonu uygulamak için farklı rotalarda ancak eşleşen etiketlere (`tag`) sahip iki Hero widget'ı kullanın.
> * `Navigator`, uygulamanın rotalarını içeren bir yığını (stack) yönetir.
> * `Navigator` yığınına bir rota eklemek (`push`) veya yığından bir rota çıkarmak (`pop`) animasyonu tetikler.
> * Flutter çerçevesi, Hero kaynak rotadan hedef rotaya uçarken sınırlarını tanımlayan bir dikdörtgen tween'i olan [`RectTween`](https://api.flutter.dev/flutter/animation/RectTween-class.html) sınıfını hesaplar. Uçuşu sırasında Hero, her iki rotanın da üzerinde görünmesi için bir uygulama üst katmanına (overlay) taşınır.

> **İpucu – Terminoloji:**
>
> Tween veya tweening kavramları size yeni geliyorsa, [Flutter'da Animasyonlar öğreticisini](https://docs.flutter.dev/ui/animations/tutorial) ziyaret edin.

Hero animasyonları iki [`Hero`](https://api.flutter.dev/flutter/widgets/Hero-class.html) widget'ı kullanılarak uygulanır: biri kaynak rotadaki widget'ı, diğeri ise hedef rotadaki widget'ı tanımlar. Kullanıcının bakış açısından Hero paylaşılıyormuş gibi görünür ve bu uygulama ayrıntısını yalnızca programcının anlaması gerekir. Hero animasyonu kodu aşağıdaki yapıya sahiptir:

1. _Kaynak Hero (source hero)_ olarak adlandırılan bir başlangıç `Hero` widget'ı tanımlayın. Hero, grafiksel temsilini (genellikle bir resim) ve tanımlayıcı bir etiketi (`tag`) belirtir ve kaynak rota tarafından tanımlandığı şekilde o anda görüntülenen widget ağacında bulunur.
2. _Hedef Hero (destination hero)_ olarak adlandırılan bir bitiş `Hero` widget'ı tanımlayın. Bu Hero da kendi grafiksel temsilini ve kaynak Hero ile aynı etiketi (`tag`) belirtir. **Her iki Hero widget'ının da aynı etiketle oluşturulması çok önemlidir**; bu etiket genellikle altta yatan verileri temsil eden bir nesnedir. En iyi sonuçlar için Hero'ların neredeyse aynı widget ağaçlarına sahip olması gerekir.
3. Hedef Hero'yu içeren bir rota oluşturun. Hedef rota, animasyonun sonunda var olan widget ağacını tanımlar.
4. Hedef rotayı `Navigator` yığınına ekleyerek (`push`) animasyonu tetikleyin. `Navigator` ekleme (`push`) ve çıkarma (`pop`) işlemleri, kaynak ve hedef rotalarda eşleşen etiketlere sahip her bir Hero çifti için bir Hero animasyonunu tetikler.

Flutter, `Hero` widget'ının sınırlarını başlangıç noktasından bitiş noktasına (boyut ve konumu enterpolasyon yoluyla hesaplayarak) canlandıran tween'i hesaplar ve animasyonu bir üst katman (overlay) içinde gerçekleştirir.

Bir sonraki bölümde Flutter'ın süreci daha ayrıntılı olarak açıklanmaktadır.

### Perde arkası

Aşağıda, Flutter'ın bir rotadan diğerine geçişi nasıl gerçekleştirdiği açıklanmaktadır.

![Geçişten önce kaynak Hero, kaynak rotada görünür](https://docs.flutter.dev/assets/images/docs/ui/animations/hero-transition-0.png)

Geçişten önce kaynak Hero, kaynak rotanın widget ağacında bekler. Hedef rota henüz mevcut değildir ve üst katman (overlay) boştur.

---

![Geçiş başlar](https://docs.flutter.dev/assets/images/docs/ui/animations/hero-transition-1.png)

`Navigator`'a bir rota eklemek (`push`) animasyonu tetikler. `t=0.0` anında Flutter şunları yapar:

* Material hareket spesifikasyonunda açıklandığı gibi kavisli hareketi kullanarak, hedef Hero'nun yolunu ekran dışında (offscreen) hesaplar. Flutter artık Hero'nun nereye varacağını bilir.

* Hedef Hero'yu, _kaynak_ Hero ile aynı konum ve boyutta üst katmana (overlay) yerleştirir. Bir Hero'yu üst katmana eklemek Z-sırasını (Z-order) değiştirir, böylece tüm rotaların üzerinde görünür.

* Kaynak Hero'yu ekran dışına taşır.

---

![Hero, üst katmanda son konumuna ve boyutuna doğru uçar](https://docs.flutter.dev/assets/images/docs/ui/animations/hero-transition-2.png)

Hero uçarken, dikdörtgen sınırları `Hero` widget'ının [`createRectTween`](https://api.flutter.dev/flutter/widgets/CreateRectTween.html) özelliği tarafından belirtilen [`Tween<Rect>`](https://api.flutter.dev/flutter/animation/Tween-class.html) kullanılarak canlandırılır. Varsayılan olarak Flutter, dikdörtgenin karşılıklı köşelerini kavisli bir yol boyunca canlandıran bir [`MaterialRectArcTween`](https://pub.dev/documentation/material_ui/latest/material_ui/MaterialRectArcTween-class.html) örneği kullanır. (Farklı bir `Tween` animasyonu kullanan bir örnek için [Radyal Hero animasyonları](#radyal-hero-animasyonları) bölümüne bakın.)

---

![Geçiş tamamlandığında, Hero üst katmandan hedef rotaya taşınır](https://docs.flutter.dev/assets/images/docs/ui/animations/hero-transition-3.png)

Uçuş tamamlandığında:

* Flutter, Hero widget'ını üst katmandan (overlay) hedef rotaya taşır. Üst katman artık boştur.

* Hedef Hero, hedef rotadaki son konumunda görünür.

* Kaynak Hero, kendi rotasına geri yüklenir.

---

Rotayı yığından çıkarmak (`pop`) da aynı işlemi gerçekleştirir ve Hero'yu kaynak rotadaki boyutuna ve konumuna geri canlandırır.

#### Temel sınıflar

Bu kılavuzdaki örneklerde, Hero animasyonlarını uygulamak için aşağıdaki sınıflar kullanılır:

* **[`Hero`](https://api.flutter.dev/flutter/widgets/Hero-class.html):** Kaynak rotadan hedef rotaya uçan widget. Kaynak rota için bir `Hero` ve hedef rota için bir tane daha tanımlayın ve her birine aynı etiketi (`tag`) atayın. Flutter, eşleşen etiketlere sahip Hero çiftlerini canlandırır.

* **[`InkWell`](https://pub.dev/documentation/material_ui/latest/material_ui/InkWell-class.html):** Hero'ya dokunulduğunda ne olacağını belirtir. `InkWell` widget'ının `onTap()` geri çağırma işlevi, yeni rotayı oluşturur ve bunu `Navigator` yığınına ekler (`push`).

* **[`Navigator`](https://api.flutter.dev/flutter/widgets/Navigator-class.html):** `Navigator`, rotalardan oluşan bir yığını yönetir. `Navigator` yığınına bir rota eklemek veya yığından bir rota çıkarmak animasyonu tetikler.

* **[`Route`](https://api.flutter.dev/flutter/widgets/Route-class.html):** Bir ekranı veya sayfayı belirtir. En temel uygulamalar dışındaki çoğu uygulamada birden fazla rota bulunur.

### Standart Hero animasyonları

> **Bunun amacı nedir?**
>
> * [`MaterialPageRoute`](https://pub.dev/documentation/material_ui/latest/material_ui/MaterialPageRoute-class.html), [`CupertinoPageRoute`](https://pub.dev/documentation/cupertino_ui/latest/cupertino_ui/CupertinoPageRoute-class.html) kullanarak bir rota belirtin veya [`PageRouteBuilder`](https://api.flutter.dev/flutter/widgets/PageRouteBuilder-class.html) kullanarak özel bir rota oluşturun. Bu bölümdeki örneklerde `MaterialPageRoute` kullanılmaktadır.
> * Hedefin görüntüsünü bir `SizedBox` içine sararak geçişin sonunda görüntünün boyutunu değiştirin.
> * Hedefin görüntüsünü bir yerleşim düzeni (layout) widget'ına yerleştirerek görüntünün konumunu değiştirin. Bu örneklerde `Container` kullanılmaktadır.

#### Neler oluyor?

Bir görüntüyü bir rotadan diğerine uçurmak, Flutter'ın `Hero` widget'ı kullanılarak kolayca uygulanabilir. Yeni rotayı belirtmek için `MaterialPageRoute` kullanıldığında, görüntü [Material Design hareket spesifikasyonunda](https://m2.material.io/design/motion/understanding-motion.html#principles) açıklandığı gibi kavisli bir yol boyunca uçar.

Bu bölüm için eksiksiz kod ve görseller [standart Hero animasyonu örneğinde](https://github.com/flutter/website/tree/main/examples/animation/hero_animation) yer almaktadır. Animasyonu kendiniz keşfetmek için [örneği kurup çalıştırın](#örnekleri-çalıştırma), ardından aşağıdakileri deneyin:

* Görüntüyü farklı bir konumda ve ölçekte aynı fotoğrafı gösteren yeni bir rotaya uçurmak için ana sayfa rotasındaki fotoğrafa dokunun.
* Görüntüye dokunarak veya cihazın önceki rotaya dönme hareketini kullanarak önceki rotaya geri dönün.
* [`timeDilation`](https://api.flutter.dev/flutter/scheduler/timeDilation.html) değerini artırarak geçişi daha da yavaşlatın.

#### PhotoHero sınıfı

Özel `PhotoHero` sınıfı; Hero'yu ve dokunulduğunda boyutunu, görüntüsünü ve davranışını korur. `PhotoHero`, aşağıdaki widget ağacını oluşturur:

![PhotoHero sınıfı widget ağacı](https://docs.flutter.dev/assets/images/docs/ui/animations/photohero-class.png)

İşte kod:

```dart
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:material_ui/material_ui.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    required this.width,
  });

  final String photo;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(photo, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
```

Önemli bilgiler:

* `HeroAnimation` uygulamanın `home` özelliği olarak sağlandığında, başlangıç rotası `MaterialApp` tarafından örtük olarak eklenir (`push`).
* Bir `InkWell` görüntüyü sararak hem kaynak hem de hedef Hero'lara dokunma hareketi eklemeyi kolaylaştırır.
* `Material` widget'ını şeffaf bir renkle tanımlamak, görüntünün hedefine doğru uçarken arka plandan "öne çıkmasını" sağlar.
* `SizedBox`, animasyonun başlangıcında ve sonunda Hero'nun boyutunu belirtir.
* `Image` widget'ının `fit` özelliğini `BoxFit.contain` olarak ayarlamak, görüntünün en-boy oranını değiştirmeden geçiş sırasında mümkün olduğunca büyük olmasını sağlar.

#### HeroAnimation sınıfı

`HeroAnimation` sınıfı, kaynak ve hedef `PhotoHero` widget'larını oluşturur ve geçişi ayarlar.

İşte kod:

```dart
class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Hero Animation')),
      body: Center(
        child: PhotoHero(
          photo: 'images/flippers.png',
          width: 300,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(title: const Text('Flippers Page')),
                    body: Container(
                      // Set background to blue to emphasize that it's a new route.
                      color: Colors.lightBlueAccent,
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.topLeft,
                      child: PhotoHero(
                        photo: 'images/flippers.png',
                        width: 100,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  timeDilation = 5; // 1 means normal animation speed.
  runApp(const MaterialApp(home: HeroAnimation()));
}
```

Önemli bilgiler:

* Kullanıcı kaynak Hero'yu içeren `InkWell`'e dokunduğunda, kod `MaterialPageRoute` kullanarak hedef rotayı oluşturur. Hedef rotanın `Navigator` yığınına eklenmesi (`push`) animasyonu tetikler.
* `Container`, `PhotoHero`'yu hedef rotanın sol üst köşesinde, `AppBar`'ın altına konumlandırır.
* Hedef `PhotoHero` için `onTap()` yöntemi, `Navigator` yığınından rotayı çıkararak (`pop`) `Hero`'yu orijinal rotaya geri uçuran animasyonu tetikler.
* Hata ayıklama sırasında geçişi yavaşlatmak için `timeDilation` özelliğini kullanın.

---

### Radyal Hero animasyonları

> **Bunun amacı nedir?**
>
> * Bir _radyal dönüşüm_, dairesel bir şekli kare bir şekle dönüştürerek canlandırır.
> * Radyal bir _Hero_ animasyonu, Hero'yu kaynak rotadan hedef rotaya uçururken radyal bir dönüşüm gerçekleştirir.
> * `MaterialRectCenterArcTween`, tween animasyonunu tanımlar.
> * `PageRouteBuilder` kullanarak hedef rotayı oluşturun.

Bir Hero'yu dairesel bir şekilden dikdörtgen bir şekle dönüşürken bir rotadan diğerine uçurmak, `Hero` widget'larını kullanarak uygulayabileceğiniz kayda değer bir görsel efekttir. Bunu gerçekleştirmek için kod, iki kırpma (clip) şeklinin&mdash;bir daire ve bir kare&mdash;kesişimini canlandırır. Animasyon boyunca daire kırpması (ve görüntü) `minRadius`'tan `maxRadius`'a ölçeklenirken, kare kırpma sabit boyutunu korur. Aynı zamanda görüntü, kaynak rotadaki konumundan hedef rotadaki konumuna doğru uçar. Bu geçişin görsel örnekleri için Material hareket spesifikasyonundaki [Radyal dönüşüm](https://web.archive.org/web/20180223140424/https://material.io/guidelines/motion/transforming-material.html) bölümüne başvurun.

> **İpucu – Profesyonel ipucu:**
>
> Radyal Hero animasyonu, yuvarlak bir şeklin kare bir şekille kesişmesini içerir. Animasyonu `timeDilation` ile yavaşlatsanız bile bunu görmek zor olabilir; bu nedenle geliştirme sırasında [`debugPaintSizeEnabled`](https://docs.flutter.dev/tools/devtools/inspector#debugging-layout-issues-visually) bayrağını etkinleştirmeyi düşünebilirsiniz.

#### Neler oluyor?

Aşağıdaki şemada, animasyonun başlangıcındaki (`t = 0.0`) ve sonundaki (`t = 1.0`) kırpılmış görüntü gösterilmektedir.

![Başlangıçtan sona doğru radyal dönüşüm](https://docs.flutter.dev/assets/images/docs/ui/animations/radial-hero-animation.png)

Mavi gradyan (görüntüyü temsil eder), kırpma şekillerinin nerede kesiştiğini gösterir. Geçişin başlangıcında, kesişimin sonucu dairesel bir kırpmadır ([`ClipOval`](https://api.flutter.dev/flutter/widgets/ClipOval-class.html)). Dönüşüm sırasında, `ClipOval` `minRadius`'tan `maxRadius`'a ölçeklenirken, [`ClipRect`](https://api.flutter.dev/flutter/widgets/ClipRect-class.html) sabit bir boyutu korur. Geçişin sonunda, dairesel ve dikdörtgen kırpmaların kesişimi, Hero widget'ıyla aynı boyutta bir dikdörtgen verir. Başka bir deyişle, geçişin sonunda görüntü artık kırpılmamaktadır.

Bu sayfada gösterilmeyen rota kurulumu da dahil olmak üzere, bu bölüm için eksiksiz kod ve görseller [radyal Hero animasyonu örneğinde](https://github.com/flutter/website/tree/main/examples/animation/radial_hero_animation) yer almaktadır. Animasyonu kendiniz keşfetmek için [örneği kurup çalıştırın](#örnekleri-çalıştırma), ardından aşağıdakileri deneyin:

* Görüntüyü orijinal rotayı gizleyen yeni bir rotanın ortasında konumlandırılmış daha büyük bir kareye canlandırmak için üç dairesel küçük resimden birine dokunun.
* Görüntüye dokunarak veya cihazın önceki rotaya dönme hareketini kullanarak önceki rotaya geri dönün.
* [`timeDilation`](https://api.flutter.dev/flutter/scheduler/timeDilation.html) değerini artırarak geçişi daha da yavaşlatın.

#### Photo sınıfı

`Photo` sınıfı, görüntüyü tutan widget ağacını oluşturur:

```dart
class Photo extends StatelessWidget {
  const Photo({super.key, required this.photo, this.onTap});

  final String photo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withValues(alpha: 0.25),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(photo, fit: BoxFit.contain),
      ),
    );
  }
}
```

Önemli bilgiler:

* `InkWell`, dokunma hareketini yakalar. Çağıran işlev, `onTap()` işlevini `Photo` kurucusuna (constructor) aktarır.
* Uçuş sırasında `InkWell`, dalgalanma efektini (splash) ilk `Material` atasının üzerine çizer.
* `Material` widget'ı hafifçe opak bir renge sahiptir, bu nedenle görüntünün şeffaf kısımları renkli olarak çizilir. Bu, şeffaflık içeren görüntülerde bile daireden kareye geçişin kolayca görülebilmesini sağlar.
* `Photo` sınıfı, widget ağacında `Hero`'yu içermez. Animasyonun çalışması için Hero, `RadialExpansion` widget'ını sarar.

#### RadialExpansion sınıfı

Demonun temelini oluşturan `RadialExpansion` widget'ı, geçiş sırasında görüntüyü kırpan widget ağacını oluşturur. Kırpılan şekil, (uçuş sırasında büyüyen) dairesel bir kırpma ile (baştan sona sabit boyutta kalan) dikdörtgen bir kırpmanın kesişiminden ortaya çıkar.

Bunu yapmak için aşağıdaki widget ağacını oluşturur:

![RadialExpansion widget ağacı](https://docs.flutter.dev/assets/images/docs/ui/animations/radial-expansion-class.png)

İşte kod:

```dart
class RadialExpansion extends StatelessWidget {
  const RadialExpansion({super.key, required this.maxRadius, this.child})
    : clipRectSize = 2 * (maxRadius / math.sqrt2);

  final double maxRadius;
  final double clipRectSize;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child, // Photo
          ),
        ),
      ),
    );
  }
}
```

Önemli bilgiler:

* Hero, `RadialExpansion` widget'ını sarar.
* Hero uçarken boyutu değişir ve alt öğesinin (child) boyutunu sınırlandırdığı için `RadialExpansion` widget'ı da buna uyacak şekilde boyut değiştirir.
* `RadialExpansion` animasyonu, birbiriyle örtüşen iki kırpma ile oluşturulur.
* Örnek, [`MaterialRectCenterArcTween`](https://pub.dev/documentation/material_ui/latest/material_ui/MaterialRectCenterArcTween-class.html) kullanarak tween enterpolasyonunu tanımlar. Bir Hero animasyonu için varsayılan uçuş yolu, Hero'ların köşelerini kullanarak tween'leri enterpolasyon yoluyla hesaplar. Bu yaklaşım, radyal dönüşüm sırasında Hero'nun en-boy oranını etkiler; bu nedenle yeni uçuş yolu, her bir Hero'nun merkez noktasını kullanarak tween'leri enterpolasyon yoluyla hesaplamak için `MaterialRectCenterArcTween` kullanır.

  İşte kod:

  ```dart
  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
  ```

  Hero'nun uçuş yolu hâlâ bir yay izler, ancak görüntünün en-boy oranı sabit kalır.

---

### Örnekleri çalıştırma

Bu kılavuzdaki her örnek eksiksiz bir uygulamadır: [standart Hero animasyonu örneği](https://github.com/flutter/website/tree/main/examples/animation/hero_animation) ve [radyal Hero animasyonu örneği](https://github.com/flutter/website/tree/main/examples/animation/radial_hero_animation). Örnekleri kendiniz çalıştırmak için:

1. [Yeni bir Flutter uygulaması oluşturun](https://docs.flutter.dev/reference/create-new-app).
2. `flutter pub add material_ui` komutunu çalıştırarak [`material_ui`](https://pub.dev/packages/material_ui) paketini bir bağımlılık olarak ekleyin.
3. `lib/main.dart` dosyasını örneğin `lib/main.dart` dosyasıyla değiştirin.
4. Aşağıdaki görselleri projenizin kök dizinindeki bir `images` dizinine indirin: [`beachball.png`](https://raw.githubusercontent.com/flutter/website/main/examples/animation/radial_hero_animation/images/beachball.png), [`binoculars.png`](https://raw.githubusercontent.com/flutter/website/main/examples/animation/radial_hero_animation/images/binoculars.png), [`chair.png`](https://raw.githubusercontent.com/flutter/website/main/examples/animation/radial_hero_animation/images/chair.png) ve [`flippers.png`](https://raw.githubusercontent.com/flutter/website/main/examples/animation/hero_animation/images/flippers.png).
5. Projenin `pubspec.yaml` dosyasındaki mevcut `flutter` bölümüne bir `assets` girişi ekleyerek görselleri [varlık (assets)](https://docs.flutter.dev/ui/assets/assets-and-images#specifying-assets) olarak bildirin:

    ```yaml
    flutter:
      uses-material-design: true
      assets:
        - images/
    ```
6. Uygulamayı `flutter run` komutuyla çalıştırın.

---

## Sayfa Geçişini Canlandırma

*Kaynak: <https://docs.flutter.dev/cookbook/animation/page-route-animation>*

Material gibi bir tasarım dili, rotalar (veya ekranlar) arasında geçiş yaparken standart davranışları tanımlar. Ancak bazen, ekranlar arasında özel bir geçiş yapmak bir uygulamayı daha benzersiz hale getirebilir. Buna yardımcı olmak için [`PageRouteBuilder`](https://api.flutter.dev/flutter/widgets/PageRouteBuilder-class.html) bir [`Animation`](https://api.flutter.dev/flutter/animation/Animation-class.html) nesnesi sağlar. Bu `Animation`, geçiş animasyonunu özelleştirmek için [`Tween`](https://api.flutter.dev/flutter/animation/Tween-class.html) ve [`Curve`](https://api.flutter.dev/flutter/animation/Curve-class.html) nesneleriyle birlikte kullanılabilir. Bu tarif, yeni rotayı ekranın altından yukarı doğru görünür hale getirerek rotalar arasında nasıl geçiş yapılacağını gösterir.

Özel bir sayfa rotası geçişi oluşturmak için bu tarif aşağıdaki adımları kullanır:

1. Bir `PageRouteBuilder` ayarlayın.
2. Bir `Tween` oluşturun.
3. Bir `AnimatedWidget` kullanın.
4. Bir `CurveTween` kullanın.
5. İki `Tween`'i birleştirin.

### 1. Bir PageRouteBuilder ayarlayın

Başlangıç olarak, bir [`Route`](https://api.flutter.dev/flutter/widgets/Route-class.html) oluşturmak için bir [`PageRouteBuilder`](https://api.flutter.dev/flutter/widgets/PageRouteBuilder-class.html) kullanın. `PageRouteBuilder` iki geri çağırma işlevine (callback) sahiptir; biri rotanın içeriğini oluşturmak için (`pageBuilder`), diğeri ise rotanın geçişini oluşturmak için (`transitionsBuilder`).

> **Not:**
>
> `transitionsBuilder` içindeki `child` parametresi, `pageBuilder` işlevinden döndürülen widget'tır. `pageBuilder` işlevi, yalnızca rota ilk oluşturulduğunda çağrılır. `child` geçiş boyunca aynı kaldığı için çerçeve (framework) fazladan iş yapmaktan kaçınabilir.

Aşağıdaki örnek iki rota oluşturur: bir "Go!" düğmesi içeren ana sayfa rotası ve "Page 2" başlıklı ikinci bir rota.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Page1()));
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

Route<void> _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Page 2')),
    );
  }
}
```

### 2. Bir Tween oluşturun

Yeni sayfanın alttan yukarı doğru canlanarak gelmesini sağlamak için, `Offset(0.0, 1.0)` konumundan `Offset(0.0, 0.0)` konumuna (genellikle `Offset.zero` kurucusu kullanılarak tanımlanır) doğru canlanması gerekir. Bu durumda `Offset`, [`FractionalTranslation`](https://api.flutter.dev/flutter/widgets/FractionalTranslation-class.html) widget'ı için 2 boyutlu (2D) bir vektördür. `dy` argümanını 1 olarak ayarlamak, sayfanın tam yüksekliği kadar dikey bir ötelemeyi (translation) temsil eder.

`transitionsBuilder` geri çağırma işlevi bir `animation` parametresine sahiptir. Bu, 0 ile 1 arasında değerler üreten bir `Animation<double>` nesnesidir. Bir `Tween` kullanarak `Animation<double>` nesnesini bir `Animation<Offset>` nesnesine dönüştürün:

```dart
transitionsBuilder: (context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end);
  final offsetAnimation = animation.drive(tween);
  return child;
},
```

### 3. Bir AnimatedWidget kullanın

Flutter, animasyonun değeri değiştiğinde kendilerini yeniden oluşturan ve [`AnimatedWidget`](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html) sınıfını genişleten bir dizi widget'a sahiptir. Örneğin, `SlideTransition` bir `Animation<Offset>` alır ve animasyonun değeri her değiştiğinde alt öğesini (bir `FractionalTranslation` widget'ı kullanarak) kaydırır.

`Animation<Offset>` ve `child` widget'ı ile bir [`SlideTransition`](https://api.flutter.dev/flutter/widgets/SlideTransition-class.html) döndürün:

```dart
transitionsBuilder: (context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end);
  final offsetAnimation = animation.drive(tween);

  return SlideTransition(position: offsetAnimation, child: child);
},
```

### 4. Bir CurveTween kullanın

Flutter, animasyonun zaman içindeki hızını ayarlayan çeşitli yumuşatma eğrileri (easing curves) sunar. [`Curves`](https://api.flutter.dev/flutter/animation/Curves-class.html) sınıfı, yaygın olarak kullanılan önceden tanımlanmış bir eğri kümesi sağlar. Örneğin, `Curves.easeOut` animasyonun hızlı başlamasını ve yavaş bitmesini sağlar.

Bir `Curve` kullanmak için, yeni bir [`CurveTween`](https://api.flutter.dev/flutter/animation/CurveTween-class.html) oluşturun ve ona bir `Curve` aktarın:

```dart
const curve = Curves.ease;
final curveTween = CurveTween(curve: curve);
```

Bu yeni `Tween` hâlâ 0 ile 1 arasında değerler üretir. Bir sonraki adımda, bunu 2. adımdaki `Tween<Offset>` ile birleştirin.

### 5. İki Tween'i birleştirin

Tween'leri birleştirmek için [`chain()`](https://api.flutter.dev/flutter/animation/Animatable/chain.html) yöntemini kullanın:

```dart
const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.ease;

final tween = Tween(
  begin: begin,
  end: end,
).chain(CurveTween(curve: curve));
```

Ardından bu tween'i `animation.drive()` yöntemine aktararak kullanın. Bu, `SlideTransition` widget'ına verilebilecek yeni bir `Animation<Offset>` oluşturur:

```dart
return SlideTransition(position: animation.drive(tween), child: child);
```

Bu yeni `Tween` (veya `Animatable`), önce `CurveTween`'i, ardından `Tween<Offset>`'i değerlendirerek `Offset` değerleri üretir. Animasyon çalıştırıldığında, değerler şu sırayla hesaplanır:

1. Animasyon (`transitionsBuilder` geri çağırma işlevine sağlanan), 0 ile 1 arasında değerler üretir.
2. `CurveTween`, bu değerleri kendi eğrisine göre 0 ile 1 arasındaki yeni değerlere eşler.
3. `Tween<Offset>`, `double` değerlerini `Offset` değerlerine eşler.

Yumuşatma eğrisine (easing curve) sahip bir `Animation<Offset>` oluşturmanın bir başka yolu da bir [`CurvedAnimation`](https://api.flutter.dev/flutter/animation/CurvedAnimation-class.html) kullanmaktır:

```dart
transitionsBuilder: (context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.ease;

  final tween = Tween(begin: begin, end: end);
  final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

  return SlideTransition(
    position: tween.animate(curvedAnimation),
    child: child,
  );
}
```

### Etkileşimli örnek

```dartpad
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Page1()));
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

Route<void> _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Page 2')),
    );
  }
}
```
<noscript>
  <img src="/assets/images/docs/cookbook/page-route-animation.webp" alt="Demo showing a custom page route transition animating up from the bottom of the screen" />
</noscript>

---

## Fizik Simülasyonu Kullanarak Bir Widget'ı Canlandırma

*Kaynak: <https://docs.flutter.dev/cookbook/animation/physics-simulation>*

Fizik simülasyonları, uygulama etkileşimlerinin gerçekçi ve etkileşimli hissettirmesini sağlayabilir. Örneğin, bir widget'ı sanki bir yaya bağlıymış veya yerçekimi etkisiyle düşüyormuş gibi davranacak şekilde canlandırmak isteyebilirsiniz.

Bu tarif, bir yay simülasyonu kullanarak bir widget'ı sürüklendiği noktadan tekrar merkeze nasıl taşıyacağınızı gösterir.

Bu tarif şu adımları kullanır:

1. Bir animasyon denetleyicisi kurun.
2. Hareketleri (gestures) kullanarak widget'ı hareket ettirin.
3. Widget'ı canlandırın.
4. Yaylanma hareketini simüle etmek için hızı hesaplayın.

### Adım 1: Bir animasyon denetleyicisi kurun

`DraggableCard` adlı durum bilgisi olan (stateful) bir widget ile başlayın:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PhysicsCardDragDemo()));
}

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const DraggableCard(child: FlutterLogo(size: 128)),
    );
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, super.key});

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(child: Card(child: widget.child));
  }
}
```

`_DraggableCardState` sınıfının [`SingleTickerProviderStateMixin`](https://api.flutter.dev/flutter/widgets/SingleTickerProviderStateMixin-mixin.html) sınıfını genişletmesini sağlayın. Ardından `initState` içinde bir [`AnimationController`](https://api.flutter.dev/flutter/animation/AnimationController-class.html) oluşturun ve `vsync` değerini `this` olarak ayarlayın.

> **Not:**
>
> `SingleTickerProviderStateMixin` sınıfını genişletmek, state nesnesinin `AnimationController` için bir `TickerProvider` olmasını sağlar. Daha fazla bilgi edinmek için [`TickerProvider`](https://api.flutter.dev/flutter/scheduler/TickerProvider-class.html) belgelerine başvurun.

```diff
- class _DraggableCardState extends State<DraggableCard> {
+ class _DraggableCardState extends State<DraggableCard>
+     with SingleTickerProviderStateMixin {
+   late AnimationController _controller;
+
    @override
    void initState() {
      super.initState();
+     _controller =
+         AnimationController(vsync: this, duration: const Duration(seconds: 1));
    }

    @override
    void dispose() {
+     _controller.dispose();
      super.dispose();
    }
```

### Adım 2: Hareketleri kullanarak widget'ı hareket ettirin

Widget sürüklendiğinde hareket etmesini sağlayın ve `_DraggableCardState` sınıfına bir [`Alignment`](https://api.flutter.dev/flutter/painting/Alignment-class.html) alanı ekleyin:

```diff
  class _DraggableCardState extends State<DraggableCard>
      with SingleTickerProviderStateMixin {
    late AnimationController _controller;
+   Alignment _dragAlignment = Alignment.center;
```

`onPanDown`, `onPanUpdate` ve `onPanEnd` geri çağırma işlevlerini ele alan bir [`GestureDetector`](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html) ekleyin. Hizalamayı ayarlamak için, [`MediaQuery.sizeOf()`](https://api.flutter.dev/flutter/widgets/MediaQuery/sizeOf.html) kullanarak widget'ın boyutunu alın ve 2'ye bölün. (Bu işlem, "sürüklenen piksel" birimlerini [`Align`](https://api.flutter.dev/flutter/widgets/Align-class.html) widget'ının kullandığı koordinatlara dönüştürür.) Ardından, `Align` widget'ının `alignment` değerini `_dragAlignment` olarak ayarlayın:

```diff
  @override
  Widget build(BuildContext context) {
-   return Align(
-     child: Card(
-       child: widget.child,
+   final size = MediaQuery.sizeOf(context);
+   return GestureDetector(
+     onPanDown: (details) {},
+     onPanUpdate: (details) {
+       setState(() {
+         _dragAlignment += Alignment(
+           details.delta.dx / (size.width / 2),
+           details.delta.dy / (size.height / 2),
+         );
+       });
+     },
+     onPanEnd: (details) {},
+     child: Align(
+       alignment: _dragAlignment,
+       child: Card(
+         child: widget.child,
+       ),
      ),
    );
  }
```

### Adım 3: Widget'ı canlandırın

Widget bırakıldığında, yaylanarak merkeze geri dönmelidir.

Bir `Animation<Alignment>` alanı ve bir `_runAnimation()` yöntemi ekleyin. Bu yöntem, widget'ın sürüklendiği nokta ile merkezdeki nokta arasında enterpolasyon yapan bir `Tween` tanımlar.

```diff
  class _DraggableCardState extends State<DraggableCard>
      with SingleTickerProviderStateMixin {
    late AnimationController _controller;
+   late Animation<Alignment> _animation;
    Alignment _dragAlignment = Alignment.center;
```

```dart
void _runAnimation() {
  _animation = _controller.drive(
    AlignmentTween(begin: _dragAlignment, end: Alignment.center),
  );
  _controller.reset();
  _controller.forward();
}
```

Ardından, `AnimationController` bir değer ürettiğinde `_dragAlignment` alanını güncelleyin:

```diff
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
+   _controller.addListener(() {
+     setState(() {
+       _dragAlignment = _animation.value;
+     });
+   });
  }
```

Daha sonra, `Align` widget'ının `_dragAlignment` alanını kullanmasını sağlayın:

```dart
child: Align(
  alignment: _dragAlignment,
  child: Card(child: widget.child),
),
```

Son olarak, animasyon denetleyicisini yönetmek için `GestureDetector`'ı güncelleyin:

```diff
  return GestureDetector(
-   onPanDown: (details) {},
+   onPanDown: (details) {
+     _controller.stop();
+   },
    onPanUpdate: (details) {
      // ...
    },
-   onPanEnd: (details) {},
+   onPanEnd: (details) {
+     _runAnimation();
+   },
    child: Align(
```

### Adım 4: Yaylanma hareketini simüle etmek için hızı hesaplayın

Son adım, sürükleme işlemi bittikten sonra widget'ın hızını (velocity) hesaplamak için küçük bir matematik işlemi yapmaktır. Bu, widget'ın geri çekilmeden önce o hızda gerçekçi bir şekilde hareket etmeye devam etmesini sağlamak içindir. (`_runAnimation()` yöntemi, animasyonun başlangıç ve bitiş hizalamasını ayarlayarak yönü zaten belirler.)

İlk olarak, `physics` paketini içe aktarın:

```dart
import 'package:flutter/physics.dart';
```

`onPanEnd` geri çağırma işlevi bir [`DragEndDetails`](https://api.flutter.dev/flutter/gestures/DragEndDetails-class.html) nesnesi sağlar. Bu nesne, işaretçinin ekranla teması kesildiği andaki hızını verir. Hız saniye başına piksel cinsindendir, ancak `Align` widget'ı piksel kullanmaz. Bunun yerine `[-1.0, -1.0]` ile `[1.0, 1.0]` arasındaki koordinat değerlerini kullanır; burada `[0.0, 0.0]` merkezi temsil eder. 2. adımda hesaplanan `size`, pikselleri bu aralıktaki koordinat değerlerine dönüştürmek için kullanılır.

Son olarak, `AnimationController` sınıfında kendisine bir [`SpringSimulation`](https://api.flutter.dev/flutter/physics/SpringSimulation-class.html) verilebilen `animateWith()` yöntemi bulunur:

```dart
/// Calculates and runs a [SpringSimulation].
void _runAnimation(Offset pixelsPerSecond, Size size) {
  _animation = _controller.drive(
    AlignmentTween(begin: _dragAlignment, end: Alignment.center),
  );
  // Calculate the velocity relative to the unit interval, [0,1],
  // used by the animation controller.
  final unitsPerSecondX = pixelsPerSecond.dx / size.width;
  final unitsPerSecondY = pixelsPerSecond.dy / size.height;
  final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
  final unitVelocity = unitsPerSecond.distance;

  const spring = SpringDescription(mass: 1, stiffness: 1, damping: 1);

  final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

  _controller.animateWith(simulation);
}
```

> **İpucu:**
>
> `mass`, `stiffness` ve `damping` değerlerini manuel olarak belirtmek yerine [`SpringDescription.withDurationAndBounce()`](https://api.flutter.dev/flutter/physics/SpringDescription/SpringDescription.withDurationAndBounce.html) kullanarak da bir [`SpringDescription`](https://api.flutter.dev/flutter/physics/SpringDescription-class.html) yapılandırabilirsiniz.

Hız ve boyut değerleriyle birlikte `_runAnimation()` yöntemini çağırmayı unutmayın:

```dart
onPanEnd: (details) {
  _runAnimation(details.velocity.pixelsPerSecond, size);
},
```

> **Not:**
>
> Artık animasyon denetleyicisi bir simülasyon kullandığı için `duration` argümanı gerekli değildir.

### Etkileşimli örnek

```dartpad
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(const MaterialApp(home: PhysicsCardDragDemo()));
}

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const DraggableCard(child: FlutterLogo(size: 128)),
    );
  }
}

/// A draggable card that moves back to [Alignment.center] when it's
/// released.
class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, super.key});

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  Alignment _dragAlignment = Alignment.center;

  late Animation<Alignment> _animation;

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(begin: _dragAlignment, end: Alignment.center),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(mass: 1, stiffness: 1, damping: 1);

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(child: widget.child),
      ),
    );
  }
}
```

<noscript>
  <img src="/assets/images/docs/cookbook/animation-physics-card-drag.webp" alt="Demo showing a widget being dragged and snapped back to the center" />
</noscript>

---

## Kademeli Animasyonlar

*Kaynak: <https://docs.flutter.dev/ui/animations/staggered-animations>*

> **Neler öğreneceksiniz**
>
> * Kademeli bir animasyon (staggered animation), sıralı veya üst üste binen animasyonlardan oluşur.
> * Kademeli bir animasyon oluşturmak için birden fazla `Animation` nesnesi kullanın.
> * Tek bir `AnimationController`, tüm `Animation` nesnelerini kontrol eder.
> * Her bir `Animation` nesnesi, bir `Interval` (aralık) sırasındaki animasyonu belirtir.
> * Canlandırılan her özellik için bir `Tween` oluşturun.

> **İpucu – Terminoloji:**
>
> Tween veya tweening kavramları size yeni geliyorsa, [Flutter'da Animasyonlar öğreticisine](https://docs.flutter.dev/ui/animations/tutorial) başvurun.

Kademeli animasyonlar anlaşılır bir kavramdır: görsel değişiklikler tek seferde değil, bir dizi işlem olarak gerçekleşir. Animasyon, bir değişikliğin diğerinin ardından gerçekleştiği tamamen sıralı bir yapıda olabilir ya da kısmen veya tamamen üst üste binebilir. Ayrıca hiçbir değişikliğin gerçekleşmediği boşluklar da içerebilir.

Bu kılavuz, Flutter'da tek bir widget'a bir dizi sıralı ve üst üste binen animasyon uygulayan kademeli bir animasyonun nasıl oluşturulacağını gösterir. Ekrana dokunmak; opaklık, boyut, şekil, renk ve iç boşluk (padding) değerlerini değiştiren bir animasyonu başlatır.

Aşağıdaki videoda bu kademeli animasyon gösterilmektedir:

[▶ Video: Kademeli animasyon örneği](https://www.youtube.com/watch?v=0fFvnZemmh8)

Videoda, köşeleri hafifçe yuvarlatılmış, kenarlıklı mavi bir kare olarak başlayan tek bir widget'ın aşağıdaki animasyonunu görüyorsunuz. Kare, aşağıdaki sırayla değişikliklerden geçer:

1. Yavaşça görünür hale gelir (fades in)
2. Genişler
3. Yukarı doğru hareket ederken boyu uzar
4. Kenarlıklı bir daireye dönüşür
5. Rengi turuncuya dönüşür

İleriye doğru çalıştıktan sonra, animasyon ters yönde çalışır.

> **Flutter'da yeni misiniz?**
>
> Bu sayfada, Flutter'ın widget'larını kullanarak bir yerleşim düzeni (layout) oluşturmayı bildiğiniz varsayılmaktadır. Daha fazla bilgi edinmek için [Flutter'da Düzen Oluşturma](https://docs.flutter.dev/ui/layout) sayfasını ziyaret edin.

### Kademeli bir animasyonun temel yapısı

> **Bunun amacı nedir?**
>
> * Tüm animasyonlar aynı [`AnimationController`](https://api.flutter.dev/flutter/animation/AnimationController-class.html) tarafından yönlendirilir.
> * Animasyonun gerçek zamanlı olarak ne kadar sürdüğüne bakılmaksızın, denetleyicinin değerleri 0.0 ile 1.0 arasında (bu değerler dahil) olmalıdır.
> * Her animasyonun 0.0 ile 1.0 arasında (bu değerler dahil) bir [`Interval`](https://api.flutter.dev/flutter/animation/Interval-class.html) değeri vardır.
> * Bir aralıkta canlandırılan her özellik için bir [`Tween`](https://api.flutter.dev/flutter/animation/Tween-class.html) oluşturun. `Tween`, o özellik için başlangıç ve bitiş değerlerini belirtir.
> * `Tween`, denetleyici tarafından yönetilen bir [`Animation`](https://api.flutter.dev/flutter/animation/Animation-class.html) nesnesi üretir.

Aşağıdaki şemada, kademeli animasyon örneğinde kullanılan `Interval` nesneleri gösterilmektedir. Aşağıdaki özellikleri fark edebilirsiniz:

* Opaklık, zaman çizelgesinin ilk %10'luk kısmında değişir.
* Opaklık değişikliği ile genişlik değişikliği arasında küçük bir boşluk meydana gelir.
* Zaman çizelgesinin son %25'lik kısmında hiçbir şey canlanmaz.
* İç boşluğu (padding) artırmak, widget'ın yukarı doğru yükseliyormuş gibi görünmesini sağlar.
* Kenarlık yarıçapını `75.0` değerine çıkarmak, köşeleri yuvarlatılmış `150.0` x `150.0` boyutundaki kareyi bir daireye dönüştürür.
* İç boşluk ve yükseklik değişiklikleri tam olarak aynı aralıkta gerçekleşir, ancak böyle olması zorunlu değildir.

![Her hareket için belirtilen aralığı gösteren şema](https://docs.flutter.dev/assets/images/docs/ui/animations/StaggeredAnimationIntervals.png)

Animasyonu kurmak için:

* Tüm `Animation` nesnelerini yöneten bir `AnimationController` oluşturun.
* Canlandırılan her özellik için bir `Tween` oluşturun.
  * `Tween`, bir değer aralığı tanımlar.
  * `Tween`'in `animate()` yöntemi, üst (parent) animasyonu alır ve o özellik için bir `Animation` üretir.
* `CurvedAnimation`'ın `curve` özelliği ile aralığı (`Interval`) belirtin.

Kontrol eden animasyonun değeri değiştiğinde, yeni animasyonun değeri de değişir ve kullanıcı arayüzünün güncellenmesini tetikler.

Aşağıdaki kod, `width` özelliği için bir tween oluşturur. Yumuşatılmış bir eğri (`Curves.ease`) belirterek bir [`CurvedAnimation`](https://api.flutter.dev/flutter/animation/CurvedAnimation-class.html) inşa eder. Mevcut diğer önceden tanımlanmış animasyon eğrileri için [`Curves`](https://api.flutter.dev/flutter/animation/Curves-class.html) sınıfına başvurun.

```dart
width = Tween<double>(begin: 50, end: 150).animate(
  CurvedAnimation(
    parent: controller,
    curve: const Interval(0.125, 0.250, curve: Curves.ease),
  ),
),
```

`begin` ve `end` değerlerinin `double` olması gerekmez. Aşağıdaki kod, `BorderRadius.circular()` kullanarak `borderRadius` özelliği (karenin köşelerinin yuvarlaklığını kontrol eder) için tween oluşturur.

```dart
borderRadius =
    BorderRadiusTween(
      begin: BorderRadius.circular(4),
      end: BorderRadius.circular(75),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.375, 0.500, curve: Curves.ease),
      ),
    ),
```

#### Eksiksiz kademeli animasyon

Tüm etkileşimli widget'lar gibi, eksiksiz animasyon da bir widget çiftinden oluşur: durum bilgisi olmayan (stateless) ve durum bilgisi olan (stateful) bir widget.

Durum bilgisi olmayan widget; `Tween` nesnelerini belirtir, `Animation` nesnelerini tanımlar ve widget ağacının canlandırılan kısmını oluşturmaktan sorumlu bir `build()` işlevi sağlar.

Durum bilgisi olan widget ise denetleyiciyi oluşturur, animasyonu oynatır ve widget ağacının canlandırılmayan kısmını oluşturur. Animasyon, ekranın herhangi bir yerinde bir dokunma algılandığında başlar.

**Uygulama kaynağı:** [kademeli animasyon örneği](https://github.com/flutter/website/tree/main/examples/animation/staggered_animation)

#### Durum bilgisi olmayan widget: StaggerAnimation

Durum bilgisi olmayan widget olan `StaggerAnimation` içinde `build()` işlevi, animasyonlar oluşturmaya yönelik genel amaçlı bir widget olan bir [`AnimatedBuilder`](https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html) örneği oluşturur. `AnimatedBuilder` bir widget oluşturur ve onu `Animation` nesnelerinin geçerli değerlerini kullanarak yapılandırır. Örnek, `_buildAnimation()` adlı bir işlev oluşturur (gerçek kullanıcı arayüzü güncellemelerini bu işlev gerçekleştirir) ve bunu `builder` özelliğine atar. `AnimatedBuilder`, animasyon denetleyicisinden gelen bildirimleri dinler ve değerler değiştikçe widget ağacını yeniden oluşturulmak üzere (dirty olarak) işaretler. Animasyonun her bir adımında (tick) değerler güncellenir ve bu da `_buildAnimation()` işlevinin çağrılmasıyla sonuçlanır.

> **İpucu:**
>
> Bu örnekte, canlandırılan tüm özellikleri tek bir oluşturucuda (builder) tutmak için `AnimatedBuilder` içinde bir `Opacity` widget'ı kullanılmaktadır. Opaklığı tek başına canlandırırken, alt widget'ın her karede yeniden oluşturulmasını önlemek için [`FadeTransition`](https://api.flutter.dev/flutter/widgets/FadeTransition-class.html) widget'ını tercih edin.

```dart
import 'dart:async';

import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:material_ui/material_ui.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({super.key, required this.controller})
    : // Each animation defined here transforms its value during the subset
      // of the controller's duration defined by the animation's interval.
      // For example, the opacity animation transforms its value during
      // the first 10% of the controller's duration.
      opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0, 0.100, curve: Curves.ease),
        ),
      ),

      width = Tween<double>(begin: 50, end: 150).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.125, 0.250, curve: Curves.ease),
        ),
      ),

      height = Tween<double>(begin: 50, end: 150).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.250, 0.375, curve: Curves.ease),
        ),
      ),

      padding =
          EdgeInsetsTween(
            begin: const EdgeInsets.only(bottom: 16),
            end: const EdgeInsets.only(bottom: 75),
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: const Interval(0.250, 0.375, curve: Curves.ease),
            ),
          ),

      borderRadius =
          BorderRadiusTween(
            begin: BorderRadius.circular(4),
            end: BorderRadius.circular(75),
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: const Interval(0.375, 0.500, curve: Curves.ease),
            ),
          ),

      color = ColorTween(begin: Colors.indigo[100], end: Colors.orange[400])
          .animate(
            CurvedAnimation(
              parent: controller,
              curve: const Interval(0.500, 0.750, curve: Curves.ease),
            ),
          );

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(color: Colors.indigo[300]!, width: 3),
            borderRadius: borderRadius.value,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(builder: _buildAnimation, animation: controller);
  }
}
```

#### Durum bilgisi olan widget: StaggerDemo

Durum bilgisi olan widget `StaggerDemo`, 2000 ms'lik bir süre belirterek `AnimationController`'ı oluşturur. Animasyonu oynatır ve widget ağacının canlandırılmayan kısmını oluşturur. Ekranda bir dokunma algılandığında animasyon başlar. Animasyon önce ileriye, ardından geriye doğru çalışır. Dizinin tamamlanabilmesi için oynatma sırasındaki dokunmalar yok sayılır.

```dart
class StaggerDemo extends StatefulWidget {
  const StaggerDemo({super.key});

  @override
  State<StaggerDemo> createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    if (_controller.isAnimating) return;

    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // The animation got canceled, probably because it was disposed of.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Animation')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _playAnimation,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.1),
              border: Border.all(color: Colors.black.withValues(alpha: 0.5)),
            ),
            child: StaggerAnimation(controller: _controller.view),
          ),
        ),
      ),
    );
  }
}

void main() {
  timeDilation = 10; // 1 is normal animation speed.
  runApp(const MaterialApp(home: StaggerDemo()));
}
```

---

## Kademeli Bir Menü Animasyonu Oluşturma

*Kaynak: <https://docs.flutter.dev/cookbook/effects/staggered-menu-animation>*

Tek bir uygulama ekranı birden fazla animasyon içerebilir. Tüm animasyonları aynı anda oynatmak bunaltıcı olabilir. Animasyonları arka arkaya oynatmak ise çok uzun sürebilir. Daha iyi bir seçenek, animasyonları kademelendirmektir (stagger). Her animasyon farklı bir zamanda başlar, ancak animasyonlar daha kısa bir toplam süre oluşturacak şekilde birbiriyle örtüşür. Bu tarifte, içeriği kademeli olarak canlandırılan ve alt kısmında fırlayarak açılan bir düğme bulunan bir çekmece (drawer) menüsü oluşturacaksınız.

Aşağıdaki animasyon, uygulamanın davranışını göstermektedir:

![Kademeli Menü Animasyonu Örneği](https://docs.flutter.dev/assets/images/docs/cookbook/effects/StaggeredMenuAnimation.webp)

### Animasyon içermeyen menüyü oluşturun

Çekmece menüsü, başlıkların bir listesini ve ardından menünün alt kısmında bir "Get Started" düğmesini görüntüler.

Listeyi ve düğmeyi sabit konumlarda görüntüleyen `Menu` adlı durum bilgisi olan (stateful) bir widget tanımlayın.

```dart
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  static const _menuTitles = [
    'Declarative Style',
    'Premade Widgets',
    'Stateful Hot Reload',
    'Native Performance',
    'Great Community',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [_buildFlutterLogo(), _buildContent()],
      ),
    );
  }

  Widget _buildFlutterLogo() {
    // TODO: We'll implement this later.
    return Container();
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ..._buildListItems(),
        const Spacer(),
        _buildGetStartedButton(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Text(
            _menuTitles[i],
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }
    return listItems;
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
          ),
          onPressed: () {},
          child: const Text(
            'Get Started',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
```

### Animasyonlar için hazırlık

Animasyon zamanlamasının kontrolü bir `AnimationController` gerektirir.

`_MenuState` sınıfına `SingleTickerProviderStateMixin`'i ekleyin. Ardından, bir `AnimationController` bildirin ve örneklendirin.

```dart
class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late AnimationController _staggeredController;

  @override
  void initState() {
    super.initState();

    _staggeredController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }
}
```

Her animasyon öncesindeki gecikme süresi size bağlıdır. Animasyon gecikmelerini, bireysel animasyon sürelerini ve toplam animasyon süresini tanımlayın.

```dart
class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final Duration _animationDuration =
      _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;
}
```

Bu durumda, tüm animasyonlar 50 ms geciktirilir. Bundan sonra, liste öğeleri görünmeye başlar. Her bir liste öğesinin görünmesi, bir önceki liste öğesinin kayarak girmeye başlamasından 50 ms sonrasına geciktirilir. Her liste öğesinin sağdan sola kayması 250 ms sürer. Son liste öğesi kayarak girmeye başladıktan sonra, alttaki düğme fırlayarak açılmak için 150 ms daha bekler. Düğme animasyonu 500 ms sürer.

Her bir gecikme ve animasyon süresi tanımlandıktan sonra, bireysel animasyon sürelerini hesaplamak için kullanılabilmesi amacıyla toplam süre hesaplanır.

İstenen animasyon süreleri aşağıdaki şemada gösterilmiştir:

![Animasyon Zamanlama Şeması](https://docs.flutter.dev/assets/images/docs/cookbook/effects/TimingDiagram.png)

Daha büyük bir animasyonun bir alt bölümü sırasında bir değeri canlandırmak için Flutter, `Interval` sınıfını sağlar. Bir `Interval`, bir başlangıç zamanı yüzdesi ve bir bitiş zamanı yüzdesi alır. Bu `Interval`, animasyonun başlangıç ve bitiş zamanlarının tamamını kullanmak yerine, söz konusu başlangıç ve bitiş zamanları arasındaki bir değeri canlandırmak için kullanılabilir. Örneğin, 1 saniye süren bir animasyon söz konusu olduğunda, 0.2 ile 0.5 arasındaki bir aralık 200 ms'de (%20) başlar ve 500 ms'de (%50) biter.

Her bir liste öğesinin `Interval` değerini ve alt düğmenin `Interval` değerini bildirin ve hesaplayın.

```dart
class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: _menuTitles.length * 50) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }
}
```

### Liste öğelerini ve düğmeyi canlandırın

Kademeli animasyon, menü görünür hale gelir gelmez oynatılır.

Animasyonu `initState()` içinde başlatın.

```dart
@override
void initState() {
  super.initState();

  _createAnimationIntervals();

  _staggeredController = AnimationController(
    vsync: this,
    duration: _animationDuration,
  )..forward();
}
```

Her liste öğesi sağdan sola kayar ve aynı anda yavaşça görünür hale gelir.

Her bir liste öğesinin opaklık ve öteleme (translation) değerlerini canlandırmak için liste öğesinin `Interval` değerini ve bir `easeOut` eğrisini kullanın.

```dart
List<Widget> _buildListItems() {
  final listItems = <Widget>[];
  for (var i = 0; i < _menuTitles.length; ++i) {
    listItems.add(
      AnimatedBuilder(
        animation: _staggeredController,
        builder: (context, child) {
          final animationPercent = Curves.easeOut.transform(
            _itemSlideIntervals[i].transform(_staggeredController.value),
          );
          final opacity = animationPercent;
          final slideDistance = (1.0 - animationPercent) * 150;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(slideDistance, 0),
              child: child,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Text(
            _menuTitles[i],
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
  return listItems;
}
```

Alt düğmenin opaklığını ve ölçeğini canlandırmak için aynı yaklaşımı kullanın. Bu sefer, düğmeye esnek (yaylanan) bir etki vermek için bir `elasticOut` eğrisi kullanın.

```dart
Widget _buildGetStartedButton() {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: AnimatedBuilder(
        animation: _staggeredController,
        builder: (context, child) {
          final animationPercent = Curves.elasticOut.transform(
            _buttonInterval.transform(_staggeredController.value),
          );
          final opacity = animationPercent.clamp(0.0, 1.0);
          final scale = (animationPercent * 0.5) + 0.5;

          return Opacity(
            opacity: opacity,
            child: Transform.scale(scale: scale, child: child),
          );
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
          ),
          onPressed: () {},
          child: const Text(
            'Get Started',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    ),
  );
}
```

Tebrikler! Her bir liste öğesinin görünümünün kademelendirildiği ve ardından alt kısımda yerine oturan bir düğmenin geldiği animasyonlu bir menünüz var.

### Etkileşimli örnek

```dartpad
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ExampleStaggeredAnimations(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ExampleStaggeredAnimations extends StatefulWidget {
  const ExampleStaggeredAnimations({super.key});

  @override
  State<ExampleStaggeredAnimations> createState() =>
      _ExampleStaggeredAnimationsState();
}

class _ExampleStaggeredAnimationsState extends State<ExampleStaggeredAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;

  @override
  void initState() {
    super.initState();

    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(children: [_buildContent(), _buildDrawer()]),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Flutter Menu', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: [
        AnimatedBuilder(
          animation: _drawerSlideController,
          builder: (context, child) {
            return IconButton(
              onPressed: _toggleDrawer,
              icon: _isDrawerOpen() || _isDrawerOpening()
                  ? const Icon(Icons.clear, color: Colors.black)
                  : const Icon(Icons.menu, color: Colors.black),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContent() {
    // Put page content here.
    return const SizedBox();
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - _drawerSlideController.value, 0.0),
          child: _isDrawerClosed() ? const SizedBox() : const Menu(),
        );
      },
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _menuTitles = [
    'Declarative style',
    'Premade widgets',
    'Stateful hot reload',
    'Native performance',
    'Great community',
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final Duration _animationDuration =
      _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: _menuTitles.length * 50) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [_buildFlutterLogo(), _buildContent()],
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return const Positioned(
      right: -100,
      bottom: -30,
      child: Opacity(opacity: 0.2, child: FlutterLogo(size: 400)),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ..._buildListItems(),
        const Spacer(),
        _buildGetStartedButton(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            child: Text(
              _menuTitles[i],
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.elasticOut.transform(
              _buttonInterval.transform(_staggeredController.value),
            );
            final opacity = animationPercent.clamp(0.0, 1.0);
            final scale = (animationPercent * 0.5) + 0.5;

            return Opacity(
              opacity: opacity,
              child: Transform.scale(scale: scale, child: child),
            );
          },
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
            ),
            onPressed: () {},
            child: const Text(
              'Get started',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## Animasyon API'sine Genel Bakış

*Kaynak: <https://docs.flutter.dev/ui/animations/overview>*

Flutter'daki animasyon sistemi, tipli (typed) [`Animation`](https://api.flutter.dev/flutter/animation/Animation-class.html) nesnelerine dayanır. Widget'lar, bu animasyonları mevcut değerlerini okuyarak ve durum değişikliklerini dinleyerek doğrudan `build()` işlevlerine dahil edebilir veya animasyonları, diğer widget'lara aktardıkları daha ayrıntılı animasyonların temeli olarak kullanabilirler.

### Animation

Animasyon sisteminin temel yapı taşı [`Animation`](https://api.flutter.dev/flutter/animation/Animation-class.html) sınıfıdır. Bir animasyon, animasyonun yaşam süresi boyunca değişebilen belirli bir türdeki bir değeri temsil eder. Animasyon gerçekleştiren çoğu widget, parametre olarak bir `Animation` nesnesi alır; bu nesneden animasyonun mevcut değerini okur ve bu değerdeki değişiklikleri dinler.

#### `addListener`

Animasyonun değeri her değiştiğinde, animasyon [`addListener`](https://api.flutter.dev/flutter/animation/Animation/addListener.html) ile eklenen tüm dinleyicileri bilgilendirir. Genellikle, bir animasyonu dinleyen bir [`State`](https://api.flutter.dev/flutter/widgets/State-class.html) nesnesi, widget sistemine animasyonun yeni değeriyle yeniden oluşturulması (rebuild) gerektiğini bildirmek için dinleyici geri çağırma işlevi (listener callback) içinde kendi üzerinde [`setState`](https://api.flutter.dev/flutter/widgets/State/setState.html) yöntemini çağırır.

Bu kalıp o kadar yaygındır ki Flutter, animasyonlar değer değiştirdiğinde kendiliğinden yeniden oluşturulan widget'lar sağlar: [`AnimatedWidget`](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html) ve [`AnimatedBuilder`](https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html). İlki olan `AnimatedWidget`, en çok durum bilgisi olmayan (stateless) animasyonlu widget'lar için kullanışlıdır. `AnimatedWidget`'ı kullanmak için onun bir alt sınıfını oluşturun (subclass) ve [`build`](https://api.flutter.dev/flutter/widgets/AnimatedWidget/build.html) işlevini uygulayın. İkincisi olan `AnimatedBuilder`, daha büyük bir `build` işlevinin parçası olarak bir animasyon içeren daha karmaşık widget'lar için kullanışlıdır. `AnimatedBuilder`'ı kullanmak için widget'ı oluşturun ve ona bir `builder` işlevi aktarın. Diğer türdeki `Listenable` nesnelerine yanıt olarak yeniden oluşturmak için [`ListenableBuilder`](https://api.flutter.dev/flutter/widgets/ListenableBuilder-class.html) kullanın.

Kendi denetleyicisini yöneten örtük animasyonlar (implicit animations) için, `AnimatedOpacity` veya [`TweenAnimationBuilder`](https://api.flutter.dev/flutter/widgets/TweenAnimationBuilder-class.html) gibi bir [`ImplicitlyAnimatedWidget`](https://api.flutter.dev/flutter/widgets/ImplicitlyAnimatedWidget-class.html) alt sınıfı kullanın.

#### `addStatusListener`

Animasyonlar ayrıca, animasyonun zaman içinde nasıl gelişeceğini gösteren bir [`AnimationStatus`](https://api.flutter.dev/flutter/animation/AnimationStatus.html) sağlar. Animasyonun durumu her değiştiğinde, animasyon [`addStatusListener`](https://api.flutter.dev/flutter/animation/Animation/addStatusListener.html) ile eklenen tüm dinleyicileri bilgilendirir. Genellikle animasyonlar `dismissed` durumunda başlar; bu, aralıklarının başlangıcında oldukları anlamına gelir. Örneğin, 0.0'dan 1.0'a ilerleyen animasyonlar, değerleri 0.0 olduğunda `dismissed` durumunda olacaktır. Bir animasyon daha sonra `forward` (0.0'dan 1.0'a) veya belki de `reverse` (1.0'dan 0.0'a) yönde çalışabilir. Sonunda, animasyon aralığının sonuna (1.0) ulaşırsa `completed` durumuna erişir.

### AnimationController

Bir animasyon oluşturmak için önce bir [`AnimationController`](https://api.flutter.dev/flutter/animation/AnimationController-class.html) oluşturun. Kendisi de bir animasyon olmasının yanı sıra, bir `AnimationController` animasyonu kontrol etmenize olanak tanır. Örneğin, denetleyiciye animasyonu ileri doğru ([`forward`](https://api.flutter.dev/flutter/animation/AnimationController/forward.html)) oynatmasını veya animasyonu durdurmasını ([`stop`](https://api.flutter.dev/flutter/animation/AnimationController/stop.html)) söyleyebilirsiniz. Ayrıca animasyonları yay gibi bir fiziksel simülasyon kullanarak yönlendiren [`fling`](https://api.flutter.dev/flutter/animation/AnimationController/fling.html) yöntemini de kullanabilirsiniz.

Bir animasyon denetleyicisi oluşturduktan sonra, ona dayalı başka animasyonlar oluşturmaya başlayabilirsiniz. Örneğin, orijinal animasyonu yansıtan ancak ters yönde (1.0'dan 0.0'a) çalışan bir [`ReverseAnimation`](https://api.flutter.dev/flutter/animation/ReverseAnimation-class.html) oluşturabilirsiniz. Benzer şekilde, değeri bir [`Curve`](https://api.flutter.dev/flutter/animation/Curve-class.html) (örneğin [`Curves`](https://api.flutter.dev/flutter/animation/Curves-class.html) içindeki önceden tanımlanmış eğriler) tarafından ayarlanan bir [`CurvedAnimation`](https://api.flutter.dev/flutter/animation/CurvedAnimation-class.html) oluşturabilirsiniz.

### Tween'ler

0.0 ile 1.0 aralığının ötesinde animasyon oluşturmak için, [`begin`](https://api.flutter.dev/flutter/animation/Tween/begin.html) ve [`end`](https://api.flutter.dev/flutter/animation/Tween/end.html) değerleri arasında enterpolasyon yapan bir [`Tween<T>`](https://api.flutter.dev/flutter/animation/Tween-class.html) kullanabilirsiniz. Birçok türün, türe özgü enterpolasyon sağlayan özel `Tween` alt sınıfları vardır. Örneğin, [`ColorTween`](https://api.flutter.dev/flutter/animation/ColorTween-class.html) renkler arasında enterpolasyon yaparken [`RectTween`](https://api.flutter.dev/flutter/animation/RectTween-class.html) dikdörtgenler (`Rect`) arasında enterpolasyon yapar. Kendi `Tween` alt sınıfınızı oluşturarak ve onun [`lerp`](https://api.flutter.dev/flutter/animation/Tween/lerp.html) işlevini geçersiz kılarak (override ederek) kendi enterpolasyonlarınızı tanımlayabilirsiniz.

Tek başına bir tween yalnızca iki değer arasında nasıl enterpolasyon yapılacağını tanımlar. Bir animasyonun geçerli karesi (frame) için somut bir değer elde etmek üzere, geçerli durumu belirleyecek bir animasyona da ihtiyacınız vardır. Somut bir değer elde etmek amacıyla bir tween'i bir animasyonla birleştirmenin iki yolu vardır:

1. Tween'i bir animasyonun geçerli değerinde değerlendirebilirsiniz ([`evaluate`](https://api.flutter.dev/flutter/animation/Animatable/evaluate.html)). Bu yaklaşım en çok, animasyonu zaten dinleyen ve dolayısıyla animasyon değer değiştirdiğinde yeniden oluşturulan widget'lar için kullanışlıdır.

2. Tween'i bir animasyona dayalı olarak canlandırabilirsiniz ([`animate`](https://api.flutter.dev/flutter/animation/Animatable/animate.html)). Tek bir değer döndürmek yerine, `animate` işlevi tween'i bünyesine katan yeni bir `Animation` döndürür. Bu yaklaşım en çok, yeni oluşturulan animasyonu başka bir widget'a vermek istediğinizde kullanışlıdır; böylece o widget hem tween'i içeren geçerli değeri okuyabilir hem de değerdeki değişiklikleri dinleyebilir.

### Mimari

Animasyonlar bir dizi temel yapı taşından inşa edilir.

#### Scheduler (Zamanlayıcı)

[`SchedulerBinding`](https://api.flutter.dev/flutter/scheduler/SchedulerBinding-mixin.html), Flutter zamanlama temel öğelerini (scheduling primitives) dışarıya açan tekil (singleton) bir sınıftır.

Bu konu bağlamında anahtar temel öğe, kare geri çağırma işlevleridir (frame callbacks). Ekranda bir karenin gösterilmesi gereken her seferde, Flutter motoru zamanlayıcının [`scheduleFrameCallback()`](https://api.flutter.dev/flutter/scheduler/SchedulerBinding/scheduleFrameCallback.html) kullanılarak kaydedilen tüm dinleyicilere çoğulladığı (multiplex) bir "kareye başla (begin frame)" geri çağırma işlevini tetikler. Tüm bu geri çağırma işlevlerine, keyfi bir başlangıç zamanından (epoch) itibaren bir `Duration` biçiminde karenin resmi zaman damgası verilir. Tüm geri çağırma işlevleri aynı zamana sahip olduğundan, bu geri çağırma işlevlerinden tetiklenen tüm animasyonlar, yürütülmeleri birkaç milisaniye sürse bile tam olarak senkronize görünecektir.

#### Ticker'lar

[`Ticker`](https://api.flutter.dev/flutter/scheduler/Ticker-class.html) sınıfı, her adımda (tick) bir geri çağırma işlevi çağırmak için zamanlayıcının [`scheduleFrameCallback()`](https://api.flutter.dev/flutter/scheduler/SchedulerBinding/scheduleFrameCallback.html) mekanizmasına bağlanır.

Bir `Ticker` başlatılabilir ve durdurulabilir. Başlatıldığında, durdurulduğu zaman çözümlenecek (resolve) bir `Future` döndürür.

Her adımda (tick), `Ticker` geri çağırma işlevine başlatılmasından sonraki ilk adımdan bu yana geçen süreyi sağlar.

Ticker'lar geçen sürelerini her zaman başlatıldıktan sonraki ilk adıma (tick) göre verdikleri için tüm ticker'lar senkronizedir. İki adım arasında farklı zamanlarda üç ticker başlatırsanız, yine de hepsi aynı başlangıç zamanıyla senkronize edilir ve sonrasında eşzamanlı olarak (lockstep) ilerler. Bir otobüs durağındaki insanlar gibi, tüm ticker'lar hareket etmeye (zamanı saymaya) başlamak için düzenli olarak gerçekleşen bir olayı (tick) bekler.

#### Simülasyonlar

[`Simulation`](https://api.flutter.dev/flutter/physics/Simulation-class.html) soyut sınıfı, göreceli bir zaman değerini (geçen bir süreyi) bir `double` değerine eşler ve bir tamamlanma kavramına sahiptir.

Prensipte simülasyonlar durum bilgisi içermez (stateless), ancak pratikte bazı simülasyonlar (örneğin, [`BouncingScrollSimulation`](https://api.flutter.dev/flutter/widgets/BouncingScrollSimulation-class.html) ve [`ClampingScrollSimulation`](https://api.flutter.dev/flutter/widgets/ClampingScrollSimulation-class.html)) sorgulandığında durumunu geri döndürülemez biçimde değiştirir.

Farklı efektler için `Simulation` sınıfının [çeşitli somut uygulamaları](https://api.flutter.dev/flutter/physics/physics-library.html) bulunmaktadır.

#### Animatable'lar

[`Animatable`](https://api.flutter.dev/flutter/animation/Animatable-class.html) soyut sınıfı, bir `double` değerini belirli bir türdeki bir değere eşler.

Bir `Animatable` animasyonun ilerleyişini takip etmez, ancak bazı alt sınıfların değiştirilebilir (mutable) yapılandırmaları vardır.

##### Tween'ler

[`Tween<T>`](https://api.flutter.dev/flutter/animation/Tween-class.html) sınıfı, nominal olarak 0.0-1.0 aralığındaki bir `double` değerini belirli bir türdeki değere (örneğin bir `Color` veya başka bir `double`) eşler. Bu bir `Animatable` nesnesidir.

Bir çıktı türü (`T`) kavramına, bu türde bir `begin` ve `end` değerine ve belirli bir giriş değeri (nominal olarak 0.0-1.0 aralığındaki `double`) için başlangıç ve bitiş değerleri arasında enterpolasyon (`lerp`) yapma yöntemine sahiptir.

Bir `Tween` animasyonun ilerleyişini takip etmez, ancak `begin` ve `end` değerleri değiştirilebilirdir (mutable).

##### Animatable'ları birleştirme

Bir `Animatable` nesnesinin `chain()` yöntemine bir `Animatable<double>` (üst nesne / parent) aktarmak, önce üst nesnenin eşlemesini, ardından alt nesnenin (child) eşlemesini uygulayan yeni bir `Animatable` alt sınıfı oluşturur.

#### Eğriler (Curves)

[`Curve`](https://api.flutter.dev/flutter/animation/Curve-class.html) soyut sınıfı, nominal olarak 0.0-1.0 aralığındaki `double` değerlerini yine nominal olarak 0.0-1.0 aralığındaki `double` değerlerine eşler.

`Curve` sınıfları durum bilgisi içermez (stateless) ve değiştirilemezdir (immutable).

#### Animasyonlar (Animations)

[`Animation`](https://api.flutter.dev/flutter/animation/Animation-class.html) soyut sınıfı; belirli bir türde bir değer, bir animasyon yönü ve animasyon durumu kavramı ile değer veya durum değiştiğinde çağrılan geri çağırma işlevlerini kaydetmek için bir dinleyici arayüzü sağlar.

`Animation` sınıfının bazı alt sınıfları asla değişmeyen değerlere sahiptir ([`kAlwaysCompleteAnimation`](https://api.flutter.dev/flutter/animation/kAlwaysCompleteAnimation-constant.html), [`kAlwaysDismissedAnimation`](https://api.flutter.dev/flutter/animation/kAlwaysDismissedAnimation-constant.html), [`AlwaysStoppedAnimation`](https://api.flutter.dev/flutter/animation/AlwaysStoppedAnimation-class.html)); bunlara geri çağırma işlevleri kaydetmenin hiçbir etkisi yoktur çünkü bu işlevler asla çağrılmaz.

`Animation<double>` varyantı özeldir çünkü `Curve` ve `Tween` sınıflarının yanı sıra `Animation`'ın diğer bazı alt sınıfları tarafından beklenen girdi olan, nominal olarak 0.0-1.0 aralığındaki bir `double` değerini temsil etmek için kullanılabilir.

Bazı `Animation` alt sınıfları durum bilgisi içermez (stateless) ve yalnızca dinleyicileri üst nesnelerine iletir. Bazıları ise oldukça kapsamlı durum bilgisi içerir (stateful).

##### Birleştirilebilir animasyonlar (Composable animations)

Çoğu `Animation` alt sınıfı, açık bir "üst (parent)" `Animation<double>` nesnesi alır. Bu alt sınıflar söz konusu üst nesne tarafından yönlendirilir.

`CurvedAnimation` alt sınıfı; bir `Animation<double>` nesnesi (üst nesne), bir ileri yön eğrisi (`curve`) ve isteğe bağlı bir ters yön eğrisi (`reverseCurve`) alır. Geçerli yön için eğrinin girdisi olarak üst nesnenin değerini kullanır. Üst nesne bir uç noktaya ulaşmadan yön değiştirirse, `CurvedAnimation` değerde ani bir sıçramayı önlemek için aynı eğriyi kullanmaya devam eder.

`ReverseAnimation` alt sınıfı, üst nesnesi olarak bir `Animation<double>` nesnesi alır ve animasyonun tüm değerlerini tersine çevirir. Üst nesnenin nominal olarak 0.0-1.0 aralığında bir değer kullandığını varsayar ve 1.0-0.0 aralığında bir değer döndürür. Üst animasyonun durumu ve yönü de tersine çevrilir. `ReverseAnimation` değiştirilemezdir (immutable) ve durum bilgisi içermez (stateless).

`ProxyAnimation` alt sınıfı, üst nesnesi olarak bir `Animation<double>` nesnesi alır ve yalnızca o üst nesnenin geçerli durumunu iletir. Ancak üst nesne değiştirilebilirdir (mutable).

`TrainHoppingAnimation` alt sınıfı iki üst nesne (parent) alır ve değerleri kesiştiğinde aralarında geçiş yapar.

##### Animasyon denetleyicileri (Animation controllers)

[`AnimationController`](https://api.flutter.dev/flutter/animation/AnimationController-class.html), her karede ilerlemesini sürdürmek için bir `Ticker` kullanan durum bilgisi olan (stateful) bir `Animation<double>` sınıfıdır. Başlatılabilir ve durdurulabilir. Her adımda (tick), başlatılmasından bu yana geçen süreyi alır ve bir değer elde etmek için bunu bir `Simulation` nesnesine aktarır. Daha sonra bildirdiği değer bu değerdir. Eğer `Simulation` o anda sona erdiğini bildirirse, denetleyici kendisini durdurur.

Animasyon denetleyicisine, aralarında animasyon gerçekleştirilecek bir alt ve üst sınır ile bir süre (`duration`) verilebilir.

Yaygın durumda (`forward()` veya `reverse()` kullanıldığında), animasyon denetleyicisi verilen süre boyunca alt sınırdan üst sınıra (veya ters yön için tam tersi) doğrusal bir enterpolasyon gerçekleştirir.

`repeat()` kullanıldığında, animasyon denetleyicisi verilen süre boyunca belirtilen sınırlar arasında doğrusal bir enterpolasyon kullanır. Bir `count` (tekrar sayısı) belirtmediğiniz veya onu durdurmadığınız sürece süresiz olarak tekrarlar.

`animateTo()` kullanıldığında, animasyon denetleyicisi farklı bir `curve` belirtmediğiniz sürece doğrusal bir eğri kullanarak geçerli değerden belirtilen hedefe doğru enterpolasyon yapar. Eğer `duration` parametresini atlarsanız, denetleyicinin süresini hedefe olan mesafenin denetleyicinin toplam aralığına oranı ölçüsünde ölçeklendirir.

`fling()` kullanıldığında, animasyon denetleyicisi belirtilen başlangıç hızı ve isteğe bağlı `SpringDescription` ile bir yay simülasyonu kullanır.

`animateWith()` kullanıldığında, denetleyiciyi yönlendirmek için verilen simülasyon kullanılır.

Bu yöntemler, animasyon başarıyla bittiğinde tamamlanan bir `TickerFuture` döndürür. Başka bir animasyon başlatmak veya denetleyiciyi sonlandırmak (`dispose`) dahil olmak üzere animasyonu iptal etmek, bu future nesnesini tamamlanmamış bırakır. İptal durumunda `TickerCanceled` hatası fırlatan bir future nesnesini beklemek (`await`) için `orCancel` özelliğini kullanın.

##### Animatable'ları animasyonlara bağlama

Bir `Animatable` nesnesinin `animate()` yöntemine bir `Animation<double>` (yeni üst nesne) aktarmak, `Animatable` gibi davranan ancak verilen üst nesneden yönlendirilen yeni bir `Animation` alt sınıfı oluşturur.


---

## Kaynaklar

- <https://docs.flutter.dev/ui/animations>
- <https://docs.flutter.dev/ui/animations/tutorial>
- <https://docs.flutter.dev/ui/animations/implicit-animations>
- <https://docs.flutter.dev/cookbook/animation/animated-container>
- <https://docs.flutter.dev/cookbook/animation/opacity-animation>
- <https://docs.flutter.dev/ui/animations/hero-animations>
- <https://docs.flutter.dev/cookbook/animation/page-route-animation>
- <https://docs.flutter.dev/cookbook/animation/physics-simulation>
- <https://docs.flutter.dev/ui/animations/staggered-animations>
- <https://docs.flutter.dev/cookbook/effects/staggered-menu-animation>
- <https://docs.flutter.dev/ui/animations/overview>
