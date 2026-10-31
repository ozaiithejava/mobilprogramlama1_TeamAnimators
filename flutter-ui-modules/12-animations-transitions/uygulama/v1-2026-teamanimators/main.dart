import 'package:flutter/material.dart';

void main() => runApp(const AnimationsDemoApp());

class AnimationsDemoApp extends StatelessWidget {
  const AnimationsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamAnimators Demo',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animasyonlar ve Geçişler'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Implicit'),
              Tab(text: 'Explicit'),
              Tab(text: 'Hero & Geçiş'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [ImplicitDemo(), ExplicitDemo(), HeroDemo()],
        ),
      ),
    );
  }
}

// 1) Implicit animasyonlar
class ImplicitDemo extends StatefulWidget {
  const ImplicitDemo({super.key});

  @override
  State<ImplicitDemo> createState() => _ImplicitDemoState();
}

class _ImplicitDemoState extends State<ImplicitDemo> {
  bool _big = false;
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => setState(() => _big = !_big),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: _big ? 220 : 100,
              height: _big ? 220 : 100,
              decoration: BoxDecoration(
                color: _big ? Colors.orange : Colors.blue,
                borderRadius: BorderRadius.circular(_big ? 48 : 8),
              ),
            ),
          ),
          const SizedBox(height: 24),
          AnimatedOpacity(
            opacity: _visible ? 1 : 0.2,
            duration: const Duration(milliseconds: 400),
            child: const FlutterLogo(size: 64),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => setState(() => _visible = !_visible),
            child: const Text('Opaklığı değiştir'),
          ),
        ],
      ),
    );
  }
}

// 2) Explicit animasyonlar
class ExplicitDemo extends StatefulWidget {
  const ExplicitDemo({super.key});

  @override
  State<ExplicitDemo> createState() => _ExplicitDemoState();
}

class _ExplicitDemoState extends State<ExplicitDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<double> _scale = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.6, end: 1.2).animate(_scale),
        child: RotationTransition(
          turns: _controller,
          child: const Icon(Icons.star, size: 120, color: Colors.amber),
        ),
      ),
    );
  }
}

// 3) Hero ve özel sayfa geçişi
class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder<void>(
              transitionDuration: const Duration(milliseconds: 600),
              pageBuilder: (_, __, ___) => const DetailPage(),
              transitionsBuilder: (_, animation, __, child) {
                final offset = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeOutCubic));
                return SlideTransition(
                  position: animation.drive(offset),
                  child: child,
                );
              },
            ),
          );
        },
        child: const Hero(
          tag: 'hero-star',
          child: Icon(Icons.favorite, size: 80, color: Colors.red),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detay')),
      body: const Center(
        child: Hero(
          tag: 'hero-star',
          child: Icon(Icons.favorite, size: 240, color: Colors.red),
        ),
      ),
    );
  }
}
