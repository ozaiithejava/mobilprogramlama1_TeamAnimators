> **Uyarı:** Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

# Flutter Arayüz: Animasyonlar ve Geçişler — Pekiştirme Soruları

**Mobil Programlama I · 6. Takım (TeamAnimators)** · Konu: Animations & transitions

Bu dokümanda, [docs.flutter.dev/ui/animations](https://docs.flutter.dev/ui/animations) resmi dokümantasyon çevirisine sadık kalınarak hazırlanmış **2 adet çoktan seçmeli (test)** ve **2 adet açık uçlu (klasik)** pekiştirme sorusu ve cevapları yer almaktadır.

## İçindekiler

- [Bölüm 1: Çoktan Seçmeli Sorular (Test)](#bölüm-1-çoktan-seçmeli-sorular-test)
  - [Soru 1 (Örtük Animasyonlar / Implicit Animations)](#soru-1-örtük-animasyonlar--implicit-animations)
  - [Soru 2 (Tween ve Değer Aralığı Eşleme)](#soru-2-tween-ve-değer-aralığı-eşleme)
- [Bölüm 2: Açık Uçlu (Klasik) Sorular](#bölüm-2-açık-uçlu-klasik-sorular)
  - [Soru 3 (Hero Animasyonlarında Eşleştirme Kuralı)](#soru-3-hero-animasyonlarında-eşleştirme-kuralı)
  - [Soru 4 (AnimationController ve vsync Parametresi)](#soru-4-animationcontroller-ve-vsync-parametresi)

---

## Bölüm 1: Çoktan Seçmeli Sorular (Test)

### Soru 1 (Örtük Animasyonlar / Implicit Animations)

Flutter'da bir `AnimationController` veya `Ticker` yönetmeye gerek kalmadan, widget'ın hedef özelliği (`width`, `color`, `opacity` vb.) `setState()` ile güncellendiğinde eski ve yeni değer arasında otomatik olarak geçiş yapan animasyon türüne ne ad verilir?

- **A)** Fizik tabanlı animasyonlar (Physics-based animations)
- **B)** Örtük animasyonlar (Implicit animations)
- **C)** Açık animasyonlar (Explicit animations)
- **D)** Radyal animasyonlar (Radial animations)
- **E)** Ters animasyonlar (Reverse animations)

**Doğru Cevap:** **B) Örtük animasyonlar (Implicit animations)**

> **Açıklama:** `AnimatedContainer` ve `AnimatedOpacity` gibi `ImplicitlyAnimatedWidget` sınıfından türeyen örtük animasyonlu widget'lar, animasyonu geliştirici yerine kendi içinde yönetir; yalnızca bir `duration` (süre) ve hedef değer verilmesi yeterlidir.

---

### Soru 2 (Tween ve Değer Aralığı Eşleme)

Varsayılan olarak `0.0` ile `1.0` arasında sayı üreten `AnimationController` çıktısını, farklı bir değer aralığına (örneğin `-200.0` ile `0.0`) veya farklı bir veri türüne (örneğin iki renk arasına) dönüştürmek için hangi sınıf kullanılır?

- **A)** `Navigator`
- **B)** `Ticker`
- **C)** `Tween`
- **D)** `ClipOval`
- **E)** `InkWell`

**Doğru Cevap:** **C) `Tween`**

> **Açıklama:** _"In-betweening"_ (ara kareleme) teriminin kısaltması olan `Tween` (ve `ColorTween`, `IntTween` gibi alt sınıfları), `begin` ve `end` değerlerini tutarak `0.0`–`1.0` giriş aralığını istenen çıkış aralığına veya veri türüne eşler.

---

## Bölüm 2: Açık Uçlu (Klasik) Sorular

### Soru 3 (Hero Animasyonlarında Eşleştirme Kuralı)

Flutter'da iki ekran (rota) arasında ortak bir görselin uçarak geçiş yapmasını sağlayan (paylaşılan öğe geçişi) `Hero` animasyonunun çalışabilmesi için, kaynak rotadaki ve hedef rotadaki her iki `Hero` widget'ında hangi özelliğin **aynı** olması zorunludur?

**Cevap:**  
Her iki `Hero` widget'ının **`tag` (etiket)** özelliğinin birebir aynı olması zorunludur. `Navigator` üzerinden sayfa geçişi (`push` / `pop`) yapıldığında Flutter, kaynak ve hedef rotadaki `Hero` çiftlerini eşleşen `tag` değerlerine göre bulup canlandırır.

---

### Soru 4 (AnimationController ve vsync Parametresi)

Bir `AnimationController` tanımlarken zorunlu olarak geçilen `vsync` parametresinin temel amacı nedir ve `State` sınıfına bu özelliği kazandırmak için sınıf tanımına hangi `mixin` eklenir?

**Cevap:**  
- **Amacı:** `vsync` parametresi, **ekran dışındaki (görünmeyen) animasyonların gereksiz kaynak (işlemci/pil) tüketmesini önler.**  
- **Kullanılan Mixin:** Durum bilgisi içeren (`State`) sınıfı `vsync: this` olarak kullanabilmek için sınıf tanımına **`SingleTickerProviderStateMixin`** (birden fazla controller varsa `TickerProviderStateMixin`) eklenir.
