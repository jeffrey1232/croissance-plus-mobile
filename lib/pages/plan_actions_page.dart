import 'package:flutter/material.dart';
import 'package:flutter_croissance/utils/colors.dart';

class PlanActionsPage extends StatelessWidget {
  const PlanActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FF),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),
            // Title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Plan d\'action',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Dashboard Cards
                    _buildDashboardCards(),
                    const SizedBox(height: 24),
                    // Objectifs personnels section
                    _buildObjectifsPersonnelsSection(),
                    const SizedBox(height: 24),
                    // Management de proximité card
                    _buildManagementProximiteCard(),
                    const SizedBox(height: 24),
                    // Gestion OKR list
                    _buildGestionOKRList(),
                    const SizedBox(height: 24),
                    // Type/Progression OKR view
                    _buildProgressionOKRView(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
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

  // Dashboard Cards
  Widget _buildDashboardCards() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.95,
      children: [
        _buildDashboardCard('75%', 'Taux\n de réalisation', const Color.fromARGB(255, 40, 19, 232)),
        _buildDashboardCard('68%', 'Avancement\n moyen des KRs', const Color.fromARGB(255, 40, 19, 232)),
        _buildDashboardCard('001', 'Objectifs\n en retard', const Color.fromARGB(255, 40, 19, 232)),
        _buildDashboardCard('15/09/2025', 'Prochaine\n échéance à venir', const Color.fromARGB(255, 40, 19, 232)),
      ],
    );
  }

  Widget _buildDashboardCard(String value, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.trending_up,
              color: Color.fromARGB(255, 20, 26, 203),
              size: 20,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Objectifs personnels section
  Widget _buildObjectifsPersonnelsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Objectifs personnels (OKR individuels)',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          // Scrollable table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Table header
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F3FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: Row(
                          children: const [
                            Text(
                              'Nom de la formation',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.swap_vert, size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Row(
                          children: const [
                            Text(
                              'Type',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.swap_vert, size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Row(
                          children: const [
                            Text(
                              'Progression',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.swap_vert, size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Row(
                          children: const [
                            Text(
                              'Statut',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.swap_vert, size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Row(
                          children: const [
                            Text(
                              'Actions',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Table rows
                _buildTableRow('Leadership collaboratif', 'Présentiel', '2/3 objectifs atteints', 'En cours', const Color.fromARGB(255, 224, 183, 144)),
                _buildTableRow('Prise de parole en public', 'En ligne', '1/2 objectifs en cours', 'En attente', const Color.fromARGB(255, 122, 167, 214)),
                _buildTableRow('Management de proximité', 'Hybride', '3/3 objectifs terminés', 'Terminé', const Color.fromARGB(255, 166, 217, 198)),
                const SizedBox(height: 8),
                // Add comment row
                _buildAddCommentRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCommentRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
     
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Ajouter un commentaire/une mise à jour',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 120, child: Container()),
          SizedBox(width: 220, child: Container()),
          SizedBox(width: 120, child: Container()),
          SizedBox(width: 100, child: Container()),
        ],
      ),
    );
  }

  Widget _buildTableRow(String formation, String type, String progression, String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(
              formation,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(
              type,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            width: 220,
            child: Text(
              progression,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: status == 'En cours'
                      ? const Color(0xFFE65100) // Orange foncé
                      : status == 'En attente'
                          ? const Color(0xFF1976D2) // Bleu foncé
                          : status == 'Terminé'
                              ? const Color(0xFF4CAF50) // Vert foncé
                              : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_outlined, color: Colors.white, size: 18),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Management de proximité card
  Widget _buildManagementProximiteCard() {
    return Column(
      children: [
        // White card
        
        const SizedBox(height: 16),
        // Light blue card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F3FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      'Co-évaluation finale',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Valider ma progression',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildProgressBar('Objectifs atteints', 0.75),
              const SizedBox(height: 16),
              _buildProgressBar('Apports perçus', 0.65),
              const SizedBox(height: 16),
              _buildProgressBar('Difficultés rencontrées', 0.85),
              const SizedBox(height: 16),
              _buildProgressBar('Difficultés rencontrées', 0.75),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar(String label, double progress) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 8,
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Gestion OKR list
  Widget _buildGestionOKRList() {
    return Container(
      padding: const EdgeInsets.all(20),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
      ),
    );
  }

  Widget _buildOKRRow(String title, String status, Color statusColor, Color statusTextColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: status == 'En cours'
                      ? const Color(0xFFE65100) // Orange foncé
                      : status == 'En attente'
                          ? const Color(0xFF1976D2) // Bleu foncé
                          : status == 'Terminé'
                              ? const Color(0xFF4CAF50) // Vert foncé
                              : statusTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_outlined, color: Colors.white, size: 18),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Progression OKR view
  Widget _buildProgressionOKRView() {
    return Container(
      padding: const EdgeInsets.all(20),
      
      
    );
  }

  
}
