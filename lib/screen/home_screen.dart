import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:tic_tac/modules/auth/bloc/auth_bloc.dart';
import 'package:tic_tac/screen/shared/app_gradeint_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStateEnum == AuthStateEnum.loggedOut) {
          context.go('/');
        }
      },
      child: Scaffold(
        body: Newton(
          activeEffects: [
            RainEffect(
              particleConfiguration: ParticleConfiguration(
                  shape: CircleShape(),
                  size: const Size(5, 5),
                  color: const SingleParticleColor(color: Colors.orange)),
              effectConfiguration: const EffectConfiguration(
                minDuration: 4000,
                maxDuration: 7000,
                minFadeOutThreshold: 0.60,
                maxFadeOutThreshold: 0.80,
                maxEndScale: 3.1,
                minEndScale: 1.0,
                particlesPerEmit: 1,
                emitDuration: 100,
              ),
            )
          ],
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Column(
                children: [
                  Text(
                    'TIC',
                    style: TextStyle(
                        height: 0.8,
                        fontFamily: "Nabla",
                        fontSize: 100,
                        shadows: [
                          Shadow(
                            offset: const Offset(8.0, 5.0),
                            blurRadius: 5.0,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ]),
                  ),
                  Text(
                    'TAC',
                    style:
                        TextStyle(fontFamily: "Nabla", fontSize: 100, shadows: [
                      Shadow(
                        offset: const Offset(8.0, 5.0),
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ]),
                  ),
                  Text(
                    'TOE',
                    style: TextStyle(
                        height: 0.8,
                        fontFamily: "Nabla",
                        fontSize: 100,
                        shadows: [
                          Shadow(
                            offset: const Offset(8.0, 5.0),
                            blurRadius: 5.0,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ]),
                  ),
                  const Gap(40),
                  AppGradientButton(
                    title: "New Game",
                    colorOne: const Color(0xffD82987),
                    colorTwo: const Color(0xffA73BED),
                    onPressed: () {
                      context.push('/home/game');
                    },
                  ),
                  const Gap(12),
                  AppGradientButton(
                    title: "Join Game",
                    colorOne: const Color(0xffF85B8A),
                    colorTwo: const Color(0xffF89B3E),
                  ),
                  const Gap(12),
                  AppGradientButton(
                    onPressed: () {
                      context.push('/home/leaderboard');
                    },
                    title: "Leaderboard",
                    colorOne: const Color(0xff2DD382),
                    colorTwo: const Color(0xff25A5E0),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: CircularMenu(
          items: [
            CircularMenuItem(onTap: () {}, icon: FontAwesomeIcons.user),
            CircularMenuItem(onTap: () {}, icon: FontAwesomeIcons.gear),
            CircularMenuItem(
                onTap: () {
                  context.read<AuthBloc>().add(SignOutEvent());
                },
                icon: FontAwesomeIcons.doorOpen),
          ],
        ),
      ),
    );
  }
}
