import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ====== PUNTO DE ENTRADA ======
void main() {
  runApp(MyApp());
}

// ====== WIDGET RAÍZ ======
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil Usuario (Flutter)',
      home: UserProfilePage(),
    );
  }
}

// ====== PANTALLA DE PERFIL ======
class UserProfilePage extends StatelessWidget {
  // Lista de habilidades en una sola fila
  final List<String> skills = [
    'Programación',
    'Música',
    'Gimansio',
    'Futbol',
    'Boxeo',
  ];

  // Lista de proyectos con imágenes
  final List<Map<String, String>> projects = [
    {
      'title': 'Proyecto Sicesfot en PHP',
      'image': 'assets/proyectos/sicesoft.png',
    },
    {
      'title': 'Gametracker en React - Node.js',
      'image': 'assets/proyectos/gametracker.png',
    },
    {
      'title': 'L-MACK orientado al Sena',
      'image': 'assets/proyectos/L-MACK.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== APPBAR =====
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text(
                'Perfil de Usuario (Flutter) - David Cruz',
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 18,
  ),
),

        centerTitle: true,
      ),

      // ===== CUERPO =====
      body: Stack(
        children: [
          // Fondo con degradado
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.green.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Contenido desplazable
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== CABECERA =====
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FOTO DE PERFIL
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            offset: Offset(0, 3),
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // INFORMACIÓN
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'David Cruz',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Soy un aprendiz de análisis y desarrollo de software del SENA, '
                              'con disciplina y constancia para aprender nuevas habilidades.\n\n'
                              'Mi objetivo es convertirme en desarrollador full-stack, '
                              'especializado en backend, con liderazgo y organización.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ===== REDES SOCIALES =====
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSocialIcon(
                          icon: FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                          label: 'WhatsApp',
                        ),
                        const SizedBox(width: 12),
                        _buildSocialIcon(
                          icon: FontAwesomeIcons.instagram,
                          color: Colors.pink,
                          label: 'Instagram',
                        ),
                        const SizedBox(width: 12),
                        _buildSocialIcon(
                          icon: FontAwesomeIcons.tiktok,
                          color: Colors.black,
                          label: 'TikTok',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ===== HABILIDADES =====
                Text(
                  'Intereses y Habilidades',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),

                const SizedBox(height: 10),

                // BOTONES EN UNA SOLA FILA
                Row(
                  children: skills.map((skill) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () => print('Habilidad: $skill'),
                          child: Text(
                            skill,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // ===== PROYECTOS =====
                Text(
                  'Proyectos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),

                const SizedBox(height: 8),

                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: projects.map((project) {
                    return _ProjectCard(
                      title: project['title']!,
                      image: project['image']!,
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // ===== MENSAJE DESTACADO =====
                Text(
                  'Mensaje destacado',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  height: 140,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade700,
                              Colors.green.shade400,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '¿Listo para seguir aprendiendo Flutter\n'
                            'y construir más proyectos?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue.shade800,
                            ),
                            onPressed: () => print('Ver más'),
                            child: const Text('Ver más'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),

          // ===== VERSIÓN =====
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Versión 1.0",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.9)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===== ÍCONOS DE REDES SOCIALES =====
Widget _buildSocialIcon({
  required IconData icon,
  required Color color,
  required String label,
}) {
  return GestureDetector(
    onTap: () => print("Abrir $label"),
    child: FaIcon(icon, color: color, size: 26),
  );
}

// ===== TARJETA DE PROYECTO CON IMAGEN COMPLETA, CENTRADA Y SIN DEFORMAR =====
class _ProjectCard extends StatelessWidget {
  final String title;
  final String image;

  const _ProjectCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: Offset(0, 3),
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          // CONTENEDOR DE IMAGEN MEJORADO
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain, // 👈 IMAGEN COMPLETA SIN DEFORMARSE
                ),
              ),
            ),
          ),

          // TÍTULO DEL PROYECTO
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
