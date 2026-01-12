import 'package:flutter/material.dart';
import 'package:flutter_croissance/utils/colors.dart';

class FormationsPage extends StatefulWidget {
  const FormationsPage({super.key});

  @override
  State<FormationsPage> createState() => _FormationsPageState();
}

class _FormationsPageState extends State<FormationsPage> {
  int _currentPage = 1;
  final int _totalPages = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      body: SafeArea(
        child: Stack(
          children: [
          // Contenu scrollable
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Titre
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: const Text(
                      'Mes formations',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Tableau des formations
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildFormationsTable(),
                  ),
                  const SizedBox(height: 20),
                  // Pagination
                  _buildPagination(),
                  const SizedBox(height: 80), // Espace pour la pagination
                ],
              ),
            ),
          ),
          // Header fixe
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildHeader(context),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/profile_sample.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          // Logo
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/C.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F3FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'C',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 2),
                const Text(
                  'Croissance+',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Icons
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F3FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_outlined),
                      iconSize: 22,
                      color: AppColors.primaryBlue,
                    ),
                    Positioned(
                      top: 10,
                      right: 9,
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE2403F),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.menu, color: Colors.white),
                  iconSize: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormationsTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 960,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 18, 20, 12),
                child: Text(
                  'Liste des formations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(height: 1, color: Color(0xFFE4ECF7)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: const BoxDecoration(
                  color: Color(0xFFF6FAFF),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Code',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Nom de la formation',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Statut',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Progression',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Date',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Type de formation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Formateur',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Actions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 2,
                color: Color(0xFF1E87FF),
              ),
              ...List.generate(5, (index) => _buildFormationRow(index)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormationRow(int index) {
    final formations = [
      {
        'code': 'MGMT-LEAD01',
        'name': 'Leadership collaboratif', 
        'progress': 0.40, 
        'status': 'Terminé',
        'totalModules': 5,
        'completedModules': 2,
        'score': 85,
        'timeSpent': '12h 30min',
        'instructor': 'Awa Coulibaly',
        'price': '299€',
        'rating': 4.5,
        'start': '20-10-2025',
        'end': '20-10-2025',
        'duration': '3 mois',
        'certificate': 'Oui',
        'type': 'Présentiel'
      },
      {
        'code': 'COM-PARPUB02',
        'name': 'Prise de parole en public', 
        'progress': 0.0, 
        'status': 'Terminé',
        'totalModules': 5,
        'completedModules': 0,
        'score': 78,
        'timeSpent': '8h 15min',
        'instructor': 'Michel Gnahoré',
        'price': '249€',
        'rating': 4.2,
        'start': '20-10-2025',
        'end': '20-10-2025',
        'duration': '3 mois',
        'certificate': 'Oui',
        'type': 'En ligne'
      },
      {
        'code': 'PROJ-AGILE03',
        'name': 'Gestion de projet agile', 
        'progress': 1.0, 
        'status': 'Terminé',
        'totalModules': 5,
        'completedModules': 5,
        'score': 92,
        'timeSpent': '15h 45min',
        'instructor': 'Boris N\'Dri',
        'price': '199€',
        'rating': 4.8,
        'start': '20-10-2025',
        'end': '20-10-2025',
        'duration': '3 mois',
        'certificate': 'Oui',
        'type': 'Hybride'
      },
      {
        'code': 'CREA-PROB04',
        'name': 'Créativité & Résolution de problèmes', 
        'progress': 0.60, 
        'status': 'Terminé',
        'totalModules': 5,
        'completedModules': 3,
        'score': 71,
        'timeSpent': '6h 20min',
        'instructor': 'Sarah Traoré',
        'price': '349€',
        'rating': 4.3,
        'start': '20-10-2025',
        'end': '20-10-2025',
        'duration': '3 mois',
        'certificate': 'Oui',
        'type': 'Présentiel'
      },
      {
        'code': 'MGMT-CHG05',
        'name': 'Conduite de changement', 
        'progress': 0.0, 
        'status': 'Terminé',
        'totalModules': 5,
        'completedModules': 0,
        'score': 88,
        'timeSpent': '10h 00min',
        'instructor': 'Assétou Coulibaly',
        'price': '399€',
        'rating': 4.6,
        'start': '20-10-2025',
        'end': '20-10-2025',
        'duration': '3 mois',
        'certificate': 'Oui',
        'type': 'En ligne'
      },
    ];

    final formation = formations[index];
    final progress = formation['progress'] as double;
    final status = formation['status'] as String;
    
    Color statusColor = status == 'Terminé'
        ? const Color(0xFF5FA05F)
        : status == 'À venir'
            ? Colors.grey
            : const Color(0xFF275DDF);

    final bool isEven = index.isEven;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: isEven ? const Color(0xFFF6FAFF) : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Code
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: Text(
                formation['code'] as String,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Nom de la formation
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formation['name'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Statut
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor == const Color(0xFF5FA05F)
                      ? const Color(0xFFE8F7E8)
                      : statusColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ),
          ),
          // Progression
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF60748A),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 90,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xFFE6F7F1),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: progress,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF1CA8E3), Color(0xFF86E3C2)],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Date
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: const Text(
                '20-10-2025',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          // Type de formation
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: Text(
                formation['type'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          // Formateur
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey[200]!, width: 1),
                ),
              ),
              child: Text(
                formation['instructor'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          // Actions
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionIcon(Icons.visibility),
                  const SizedBox(width: 6),
                  _buildActionIcon(Icons.edit),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flèche gauche
          IconButton(
            onPressed:
                _currentPage > 1 ? () => setState(() => _currentPage--) : null,
            icon: const Icon(Icons.chevron_left),
            iconSize: 20,
            color:
                _currentPage > 1 ? const Color(0xFF275DDF) : Colors.grey,
          ),
          const SizedBox(width: 8),
          
          _buildPageButton(1),
          
          // Page 2
          _buildPageButton(2),
          
          // Points de suspension
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '...',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          
          // Pages 9 et 10
          _buildPageButton(9),
          _buildPageButton(10),
          
          const SizedBox(width: 8),
          
          // Flèche droite
          IconButton(
            onPressed: _currentPage < _totalPages
                ? () => setState(() => _currentPage++)
                : null,
            icon: const Icon(Icons.chevron_right),
            iconSize: 20,
            color: _currentPage < _totalPages
                ? const Color(0xFF275DDF)
                : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildPageButton(int pageNumber) {
    final isSelected = pageNumber == _currentPage;
    
    return GestureDetector(
      onTap: () => setState(() => _currentPage = pageNumber),
      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE3F2FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              color:
                  isSelected ? const Color(0xFF275DDF) : Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFF25A0E9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
