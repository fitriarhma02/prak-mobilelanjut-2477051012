import 'package:flutter/material.dart';

class ResponsiveProfile extends StatelessWidget {
  final VoidCallback onThemeChanged;

  const ResponsiveProfile({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Profile'),
        actions: [
          IconButton(
            onPressed: onThemeChanged,
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width < 600 ? 16 : 32),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                final isWide =
                    constraints.maxWidth >= 600 ||
                    orientation == Orientation.landscape;

                return isWide
                ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _ProfileHeader()),
                        const SizedBox(width: 24),
                        Expanded(child: _ProfileInfo()),
                      ],
                    )
                  : Column(
                      children: [
                        _ProfileHeader(),
                        const SizedBox(height: 20),
                        _ProfileInfo(),
                      ],
                    );
              },
            );
          },
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48,
              child: Icon(
                Icons.person,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Fitria Rahmadani',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(
              'Ilmu Komputer',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Universitas Lampung',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Mahasiswi D3 Manajemen Informatika yang sedang mempelajari pengembangan aplikasi mobile menggunakan Flutter.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}