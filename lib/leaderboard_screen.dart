import 'package:flutter/material.dart';
class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6366F1),
              Color(0xFF8B5CF6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Leaderboard title 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Center(
                  child: Text(
                    'Leaderboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              //  buttons (All time, This week, Month) 
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFF6366F1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'All time',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'This week',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Month',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              //3 users 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left
                  _buildPodiumUser(
                    rank: 2,
                    name: 'Lennert Niva',
                    score: '120.774',
                    avatarSize: 30,
                    isCenter: false,
                  ),
                  
                  SizedBox(width: 20),
                  
                  // Center
                  _buildPodiumUser(
                    rank: 1,
                    name: 'David James',
                    score: '145.093',
                    avatarSize: 50,
                    isCenter: true,
                  ),
                  
                  SizedBox(width: 20),
                  
                  // Right
                  _buildPodiumUser(
                    rank: 3,
                    name: 'Peter',
                    score: '95.876',
                    avatarSize: 30,
                    isCenter: false,
                  ),
                ],
              ),

              SizedBox(height: 40),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          children: [
                            _buildLeaderboardItem(4, 'Smith Carol', '91.736'),
                            SizedBox(height: 30),
                            _buildLeaderboardItem(5, 'Stina Gunnarsdottir', '90.281'),
                            SizedBox(height: 30),
                            _buildLeaderboardItem(6, 'Benedikt Safiyulin', '88.463'),
                            SizedBox(height: 30),
                            _buildLeaderboardItem(7, 'Gabriel Soares', '85.287'),
                            SizedBox(height: 30),
                            _buildLeaderboardItem(8, 'Yahiro Ayuko', '84.009'),
                            SizedBox(height: 30),
                            
                          ],
                        ),
                      ),
                      
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.leaderboard, color: Colors.white, size: 28),
                            Icon(Icons.home, color: Colors.white, size: 28),
                            Icon(Icons.person, color: Colors.white, size: 28),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPodiumUser({
    required int rank,
    required String name,
    required String score,
    required double avatarSize,
    required bool isCenter,
  }) {
    return Column(
      children: [
        if (rank == 1) ...[
          Icon(
            Icons.emoji_events,
            color: Colors.yellow,
            size: 28,
          ),
          SizedBox(height: 4),
        ],
        
        Container(
          width: avatarSize * 2,
          height: avatarSize * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              _getPodiumImagePath(rank),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: _getAvatarColor(rank),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: avatarSize,
                  ),
                );
              },
            ),
          ),
        ),
        
        SizedBox(height: 8),
        
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: isCenter ? 16 : 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        Text(
          score,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardItem(int rank, String name, String score) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          
          Container(
            width: 24,
            child: Text(
              rank.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          
          SizedBox(width: 16),
            Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset( 
                _getLeaderboardImagePath(rank, name),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: _getAvatarColor(rank),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 24,
                    ),
                  );
                },
              ),
            ),
          ),
          
          SizedBox(width: 16),
          
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          
          Text(
            score,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  //  image users
  String _getPodiumImagePath(int rank) {
    switch (rank) {
      case 1:
        return 'images/David James.png'; 
      case 2:
        return 'images/Lennert Niva.png';  
      case 3:
        return 'images/Peter.png';   
      default:
        return 'assets/images/default.jpg';
    }
  }

  // image users
  String _getLeaderboardImagePath(int rank, String name) {
    switch (rank) {
      case 4:
        return 'images/Smith Carol.png';     
      case 5:
        return 'images/Stina Gunnarsdottir.png';     
      case 6:
        return 'images/Benedikt Safiyulin.png';   
      case 7:  
        return 'images/Gabriel Soares.png';    
      case 8:
        return 'images/Yahiro Ayuko.png';     
      default:
        return 'assets/images/default.jpg';
    }
  }

  Color _getAvatarColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.brown;
      case 4:
        return Colors.green;
      case 5:
        return Colors.blue;
      case 6:
        return Colors.purple;
      case 7:
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}