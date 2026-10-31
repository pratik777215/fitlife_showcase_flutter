
import 'package:flutter/material.dart';

void main() {
  runApp(const FitLifeApp());
}

// Main application
class FitLifeApp extends StatelessWidget {
  const FitLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitLife',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF6F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF249C79),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// App colors
const Color green = Color(0xFF249C79);
const Color darkGreen = Color(0xFF116B55);
const Color lightGreen = Color(0xFFE4F5ED);
const Color darkText = Color(0xFF172337);
const Color greyText = Color(0xFF788496);

// Reusable network image
class FitImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double radius;

  const FitImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: height,
            width: width,
            color: lightGreen,
            child: const Icon(
              Icons.fitness_center,
              color: green,
              size: 35,
            ),
          );
        },
      ),
    );
  }
}

// --------------------------------------------------
// 1. SPLASH SCREEN
// --------------------------------------------------

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String backgroundImage =
      'https://images.unsplash.com/photo-1506126613408-eca07ce68773'
      '?auto=format&fit=crop&w=1000&q=85';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          // Background image
          FitImage(
            url: backgroundImage,
            fit: BoxFit.cover,
          ),

          // Dark gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x22000000),
                  Color(0xEE07141A),
                ],
                stops: [0.2, 0.55, 1.0],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [

                  const Spacer(flex: 2),

                  // Logo
                  const Icon(
                    Icons.spa,
                    color: green,
                    size: 65,
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'FitLife',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Better Health  •  Happier You',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),

                  const Spacer(flex: 4),

                  // Main heading
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Small Steps\nBig Changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your journey to a healthier\n'
                          'and stronger you starts here.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Get Started button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const HomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Login text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Login feature coming soon!',
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// 2. HOME DASHBOARD
// --------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String featuredImage =
      'https://images.unsplash.com/photo-1518611012118-696072aa579a'
      '?auto=format&fit=crop&w=1000&q=85';

  static const String cardioImage =
      'https://images.unsplash.com/photo-1534438327276-14e5300c3a48'
      '?auto=format&fit=crop&w=600&q=85';

  static const String yogaImage =
      'https://images.unsplash.com/photo-1506126613408-eca07ce68773'
      '?auto=format&fit=crop&w=600&q=85';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(17, 12, 17, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: TextStyle(
                            fontSize: 13,
                            color: greyText,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Pramod 👋',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No new notifications'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.notifications_none),
                  ),

                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: lightGreen,
                    child: Icon(
                      Icons.person,
                      color: darkGreen,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search workouts, meals, or goals...',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: greyText,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFEDF3F8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Featured workout
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const WorkoutDetailsScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 185,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FitImage(
                        url: featuredImage,
                        radius: 17,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Color(0xCC000000),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        left: 15,
                        bottom: 17,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 11,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Featured',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              'Full Body Workout',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                            const Text(
                              '30 min  •  Intermediate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Positioned(
                        right: 13,
                        bottom: 17,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward,
                            color: green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Category buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryItem(
                    Icons.fitness_center,
                    'Workouts',
                    const Color(0xFFDDF5E9),
                  ),
                  categoryItem(
                    Icons.restaurant,
                    'Nutrition',
                    const Color(0xFFE3EEFF),
                  ),
                  categoryItem(
                    Icons.spa,
                    'Mindfulness',
                    const Color(0xFFFFE5EC),
                  ),
                  categoryItem(
                    Icons.bar_chart,
                    'Progress',
                    const Color(0xFFFFF0D9),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Today's focus heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's Focus",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: green,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              // Focus card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFFC9EDDC),
                      child: Icon(
                        Icons.track_changes,
                        color: green,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You're on track!",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Complete your workout and\nstay consistent.',
                            style: TextStyle(
                              fontSize: 10,
                              color: greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: greyText,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Recommended workouts
              const Text(
                'Recommended Workouts',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),

              const SizedBox(height: 13),

              Row(
                children: [
                  Expanded(
                    child: workoutCard(
                      context,
                      cardioImage,
                      'HIIT Cardio',
                      '20 min  •  Beginner',
                      '220 kcal',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: workoutCard(
                      context,
                      yogaImage,
                      'Morning Yoga',
                      '15 min  •  All Levels',
                      '180 kcal',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: const FitBottomNavigation(
        selectedIndex: 0,
      ),
    );
  }

  // Category widget
  Widget categoryItem(
      IconData icon,
      String title,
      Color color,
      ) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: green,
            size: 24,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            color: darkText,
          ),
        ),
      ],
    );
  }

  // Recommended workout card
  Widget workoutCard(
      BuildContext context,
      String image,
      String title,
      String subtitle,
      String calories,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WorkoutDetailsScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FitImage(
              url: image,
              height: 105,
              width: double.infinity,
              radius: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 9,
                      color: greyText,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: Colors.deepOrange,
                        size: 15,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        calories,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// 3. WORKOUT DETAILS SCREEN
// --------------------------------------------------

class WorkoutDetailsScreen extends StatelessWidget {
  const WorkoutDetailsScreen({super.key});

  static const String workoutImage =
      'https://images.unsplash.com/photo-1517836357463-d25dfeac3438'
      '?auto=format&fit=crop&w=1000&q=85';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Workout top image
              SizedBox(
                height: 230,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FitImage(
                      url: workoutImage,
                      fit: BoxFit.cover,
                    ),

                    Positioned(
                      top: 15,
                      left: 15,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: darkText,
                          ),
                        ),
                      ),
                    ),

                    const Positioned(
                      top: 15,
                      right: 15,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite_border,
                          color: darkText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Workout information card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(22),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'HIIT Cardio',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.deepOrange,
                          size: 17,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '220 kcal',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(width: 13),
                        Icon(
                          Icons.access_time,
                          color: greyText,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '20 min',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(width: 13),
                        Icon(
                          Icons.bar_chart,
                          color: greyText,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Beginner',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),

                    const SizedBox(height: 23),

                    // Overview
                    const Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'A high-intensity interval training (HIIT) workout '
                          'designed to boost your metabolism, improve '
                          'endurance, and burn calories. No equipment '
                          'needed. Just your body and determination!',
                      style: TextStyle(
                        color: greyText,
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Exercise heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Exercises',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              color: green,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Exercise list
                    exerciseItem(
                      1,
                      'Jumping Jacks',
                      '1 min',
                      Icons.accessibility_new,
                    ),

                    exerciseItem(
                      2,
                      'High Knees',
                      '1 min',
                      Icons.directions_run,
                    ),

                    exerciseItem(
                      3,
                      'Mountain Climbers',
                      '1 min',
                      Icons.fitness_center,
                    ),

                    exerciseItem(
                      4,
                      'Burpees',
                      '1 min',
                      Icons.sports_gymnastics,
                    ),

                    const SizedBox(height: 15),

                    // Equipment information
                    Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFFD0EEDF),
                            child: Icon(
                              Icons.fitness_center,
                              color: green,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'What You Need',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Just your body, No equipment required!',
                                  style: TextStyle(
                                    color: greyText,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Start workout button
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const StartWorkoutScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start Workout',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.play_arrow),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Single exercise item
  Widget exerciseItem(
      int number,
      String title,
      String duration,
      IconData icon,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: const Color(0xFFD5F3DA),
            child: Text(
              '$number',
              style: const TextStyle(
                color: darkGreen,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Container(
            height: 48,
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F1EC),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              color: darkGreen,
              size: 25,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: const TextStyle(
                    color: greyText,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right,
            color: greyText,
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------
// BOTTOM NAVIGATION
// --------------------------------------------------

class FitBottomNavigation extends StatelessWidget {
  final int selectedIndex;

  const FitBottomNavigation({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      Icons.home,
      Icons.fitness_center,
      Icons.restaurant,
      Icons.bar_chart,
      Icons.person_outline,
    ];

    final labels = [
      'Home',
      'Workouts',
      'Nutrition',
      'Progress',
      'Profile',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFEEEEEE),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final bool selected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              if (index != 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${labels[index]} section coming soon!',
                    ),
                  ),
                );
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  items[index],
                  color: selected ? darkGreen : greyText,
                  size: 21,
                ),
                const SizedBox(height: 4),
                Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 9,
                    color: selected ? darkGreen : greyText,
                    fontWeight: selected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// --------------------------------------------------
// EXTRA: START WORKOUT SCREEN
// --------------------------------------------------

class StartWorkoutScreen extends StatelessWidget {
  const StartWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Session'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: lightGreen,
                child: Icon(
                  Icons.fitness_center,
                  size: 55,
                  color: green,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Your Workout Starts Now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Get ready for your HIIT Cardio session.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greyText,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Finish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
