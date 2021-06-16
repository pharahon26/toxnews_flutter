import 'package:flutter/material.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 07/04/2021.
 */
class FlagWidet extends StatelessWidget {

  static const String BURKINA_FASO = 'BURKINA FASO';
  static const String COTE_D_IVOIRE = 'COTE D`\'IVOIRE';
  static const String BURKINA_FASO_FLAG = 'assets/bf.png';
  static const String COTE_D_IVOIRE_FLAG = 'assets/ci.png';


  String _country;
  FlagWidet( this._country);

  @override
  Widget build(BuildContext context) {
    switch(_country) {
      case BURKINA_FASO:
        return Container(
          child: Image.asset(BURKINA_FASO_FLAG,
          height: 20.0,
            width: 20.0,
          ),
        );
      case COTE_D_IVOIRE:
        return Container(
          child: Image.asset(COTE_D_IVOIRE_FLAG,
          height: 20.0,
            width: 20.0,
          ),
        );

      default:
        return Container(
          child: Image.asset(BURKINA_FASO_FLAG,
            height: 20.0,
            width: 20.0,
          ),
        );
    }

  }
}
