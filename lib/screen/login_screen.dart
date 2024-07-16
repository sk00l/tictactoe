import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:tic_tac/modules/auth/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStateEnum == AuthStateEnum.success) {
          context.push('/home');
        } else if (state.authStateEnum == AuthStateEnum.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage.toString()),
              backgroundColor: Colors.red,
            ),
          );
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
              padding: const EdgeInsets.only(top: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SignInButton(
                      buttonType: ButtonType.google,
                      onPressed: () {
                        context.read<AuthBloc>().add(GoogleLoginEvent());
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
