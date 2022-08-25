import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:medi_cal/app_screens/neonatalCalcHome.dart';
import 'package:medi_cal/widget/customWidgets.dart';

import 'neonatal_ballard_data.dart';

class BallardScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppView(
      pageTitle: 'BallardScore',
      label: "Ballard Score",
      backButtonDestination: NeonatalHome(),
      pageBody: InputFields(),
    );
  }
}

// Define a custom Form widget.
class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _InputFieldsState extends State<InputFields> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<PostureData> _posture = PostureData.getPosture();
  late List<DropdownMenuItem<PostureData>> _postureDropdownMenuItems;
  late PostureData _selectedPosture;

  List<SquareWindowData> _squareWindow = SquareWindowData.getSW();
  late List<DropdownMenuItem<SquareWindowData>> _squareWindowDropdownMenuItems;
  late SquareWindowData _selectedSW;

  List<ArmRecoilData> _armRecoil = ArmRecoilData.getArmRecoil();
  late List<DropdownMenuItem<ArmRecoilData>> _armRecoilDropdownMenuItems;
  late ArmRecoilData _selectedArmRecoil;

  List<PoplitealAngleData> _poplitealAngle = PoplitealAngleData.getPoplitealAngle();
  late List<DropdownMenuItem<PoplitealAngleData>> _poplitealAngleDropdownMenuItems;
  late PoplitealAngleData _selectedPoplitealAngle;

  List<ScarfSignData> _scarfSign = ScarfSignData.getScarfSign();
  late List<DropdownMenuItem<ScarfSignData>> _scarfSignDropdownMenuItems;
  late ScarfSignData _selectedScarfSign;

  List<HeelToEarData> _heelToEar = HeelToEarData.getHeelToEar();
  late List<DropdownMenuItem<HeelToEarData>> _heelToEarDropdownMenuItems;
  late HeelToEarData _selectedHeelToEar;

  List<SkinData> _skin = SkinData.getSkin();
  late List<DropdownMenuItem<SkinData>> _skinDropdownMenuItems;
  late SkinData _selectedSkin;

  List<LanugoData> _lanugo = LanugoData.getLanugo();
  late List<DropdownMenuItem<LanugoData>> _lanugoDropdownMenuItems;
  late LanugoData _selectedLanugo;

  List<PlantarSurfaceData> _plantarSurface = PlantarSurfaceData.getPlantarSurface();
  late List<DropdownMenuItem<PlantarSurfaceData>> _plantarSurfaceDropdownMenuItems;
  late PlantarSurfaceData _selectedPlantarSurface;

  List<BreastData> _breast = BreastData.getBreast();
  late List<DropdownMenuItem<BreastData>> _breastDropdownMenuItems;
  late BreastData _selectedBreast;

  List<EyeEarData> _eyeEar = EyeEarData.getEyeEar();
  late List<DropdownMenuItem<EyeEarData>> _eyeEarDropdownMenuItems;
  late EyeEarData _selectedEyeEar;

  List<MaleGenitaliaData> _maleGenitalia = MaleGenitaliaData.getMaleGenitalia();
  late List<DropdownMenuItem<MaleGenitaliaData>> _maleGenitaliaDropdownMenuItems;
  late MaleGenitaliaData _selectedMaleGenitalia;

  List<FemaleGenitaliaData> _femaleGenitalia = FemaleGenitaliaData.getFemaleGenitalia();
  late List<DropdownMenuItem<FemaleGenitaliaData>> _femaleGenitaliaDropdownMenuItems;
  late FemaleGenitaliaData _selectedFemaleGenitalia;

  int _sex = -1;

  @override
  void initState() {
    _postureDropdownMenuItems = buildPostureDropdownMenuItems(_posture);
    _selectedPosture = _postureDropdownMenuItems[0].value!;

    _squareWindowDropdownMenuItems = buildSWDropdownMenuItems(_squareWindow);
    _selectedSW = _squareWindowDropdownMenuItems[0].value!;

    _armRecoilDropdownMenuItems = buildARDropdownMenuItems(_armRecoil);
    _selectedArmRecoil = _armRecoilDropdownMenuItems[0].value!;

    _poplitealAngleDropdownMenuItems = buildPADropdownMenuItems(_poplitealAngle);
    _selectedPoplitealAngle = _poplitealAngleDropdownMenuItems[0].value!;

    _scarfSignDropdownMenuItems = buildSSDropdownMenuItems(_scarfSign);
    _selectedScarfSign = _scarfSignDropdownMenuItems[0].value!;

    _heelToEarDropdownMenuItems = buildHEDropdownMenuItems(_heelToEar);
    _selectedHeelToEar = _heelToEarDropdownMenuItems[0].value!;

    _skinDropdownMenuItems = buildSkinDropdownMenuItems(_skin);
    _selectedSkin = _skinDropdownMenuItems[0].value!;

    _lanugoDropdownMenuItems = buildLanugoDropdownMenuItems(_lanugo);
    _selectedLanugo = _lanugoDropdownMenuItems[0].value!;

    _plantarSurfaceDropdownMenuItems = buildPSDropdownMenuItems(_plantarSurface);
    _selectedPlantarSurface = _plantarSurfaceDropdownMenuItems[0].value!;

    _breastDropdownMenuItems = buildBreastDropdownMenuItems(_breast);
    _selectedBreast = _breastDropdownMenuItems[0].value!;

    _eyeEarDropdownMenuItems = buildEEDropdownMenuItems(_eyeEar);
    _selectedEyeEar = _eyeEarDropdownMenuItems[0].value!;

    _maleGenitaliaDropdownMenuItems = buildMGDropdownMenuItems(_maleGenitalia);
    _selectedMaleGenitalia = _maleGenitaliaDropdownMenuItems[0].value!;

    _femaleGenitaliaDropdownMenuItems = buildFGDropdownMenuItems(_femaleGenitalia);
    _selectedFemaleGenitalia = _femaleGenitaliaDropdownMenuItems[0].value!;

    //_needsLayout = true!;
    super.initState();
  }

  List<DropdownMenuItem<PostureData>> buildPostureDropdownMenuItems(List postures) {
    List<DropdownMenuItem<PostureData>> items = [];
    for (PostureData posture in postures) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: posture,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Container(
                      //height: 50,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: AssetImage(posture.images,),
                          fit: BoxFit.fitHeight,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (posture.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),)
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<SquareWindowData>> buildSWDropdownMenuItems(List squareWindows) {
    List<DropdownMenuItem<SquareWindowData>> items = [];
    for (SquareWindowData squareWindow in squareWindows) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: squareWindow,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Container(
                      //height: 50,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: AssetImage(squareWindow.images,),
                          fit: BoxFit.fitHeight,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text(
                          "(" + (squareWindow.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),)
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ArmRecoilData>> buildARDropdownMenuItems(List armRecoils) {
    List<DropdownMenuItem<ArmRecoilData>> items = [];
    for (ArmRecoilData armRecoil in armRecoils) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: armRecoil,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Container(
                      //height: 50,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: AssetImage(armRecoil.images,),
                          fit: BoxFit.fitHeight,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (armRecoil.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),)
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<PoplitealAngleData>> buildPADropdownMenuItems(List poplitealAngles) {
    List<DropdownMenuItem<PoplitealAngleData>> items = [];
    for (PoplitealAngleData poplitealAngle in poplitealAngles) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: poplitealAngle,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Container(
                      //height: 50,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: AssetImage(poplitealAngle.images,),
                          fit: BoxFit.fitHeight,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (poplitealAngle.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),)
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ScarfSignData>> buildSSDropdownMenuItems(List scarfSigns) {
    List<DropdownMenuItem<ScarfSignData>> items = [];
    for (ScarfSignData scarfSign in scarfSigns) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: scarfSign,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Container(
                      //height: 50,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: AssetImage(scarfSign.images,),
                          fit: BoxFit.fitHeight,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (scarfSign.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),)
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<HeelToEarData>> buildHEDropdownMenuItems(List heelToEars) {
    List<DropdownMenuItem<HeelToEarData>> items = [];
    for (HeelToEarData heelToEar in heelToEars) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: heelToEar,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Container(
                      //height: 50,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: AssetImage(heelToEar.images,),
                          fit: BoxFit.fitHeight,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (heelToEar.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),)
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<SkinData>> buildSkinDropdownMenuItems(List skins) {
    List<DropdownMenuItem<SkinData>> items = [];
    for (SkinData skin in skins) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: skin,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              //width: MediaQuery.of(context).size.width-2.0,
              width: 80.w,
              height: 10.h,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65.w,
                    child: Text (
                        skin.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                      ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (skin.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),

                      )
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<LanugoData>> buildLanugoDropdownMenuItems(List lanugos) {
    List<DropdownMenuItem<LanugoData>> items = [];
    for (LanugoData lanugo in lanugos) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: lanugo,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65.w,
                    child: Text (
                      lanugo.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text(
                          "(" + (lanugo.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),

                      )
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<PlantarSurfaceData>> buildPSDropdownMenuItems(List plantarSurfaces) {
    List<DropdownMenuItem<PlantarSurfaceData>> items = [];
    for (PlantarSurfaceData plantarSurface in plantarSurfaces) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: plantarSurface,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65.w,
                    child: Text (
                      plantarSurface.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (plantarSurface.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<BreastData>> buildBreastDropdownMenuItems(List breasts) {
    List<DropdownMenuItem<BreastData>> items = [];
    for (BreastData breast in breasts) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: breast,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65.w,
                    child: Text (
                      breast.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (breast.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<EyeEarData>> buildEEDropdownMenuItems(List eyeEars) {
    List<DropdownMenuItem<EyeEarData>> items = [];
    for (EyeEarData eyeEar in eyeEars) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: eyeEar,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65.w,
                    child: Text (
                      eyeEar.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                      width: 10.w,
                      child: Text("(" + (eyeEar.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),)
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<MaleGenitaliaData>> buildMGDropdownMenuItems(List maleGenitalias) {
    List<DropdownMenuItem<MaleGenitaliaData>> items = [];
    for (MaleGenitaliaData maleGenitalia in maleGenitalias) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: maleGenitalia,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65.w,
                    child: Text (
                      maleGenitalia.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                      width: 10.w,
                      child: Text("(" + (maleGenitalia.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<FemaleGenitaliaData>> buildFGDropdownMenuItems(List femaleGenitalias) {
    List<DropdownMenuItem<FemaleGenitaliaData>> items = [];
    for (FemaleGenitaliaData femaleGenitalia in femaleGenitalias) {
      items.add(
        DropdownMenuItem(
          alignment: Alignment.center,
          value: femaleGenitalia,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 80.w,
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65.w,
                    child: Text (
                      femaleGenitalia.desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0.dp,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                      child: Text("(" + (femaleGenitalia.value).toStringAsFixed(0) + ")",
                        style: TextStyle(
                          fontSize: 14.0.dp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          //key: _formKey,
          child:Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            margin: EdgeInsets.all(10.0),
            //height: MediaQuery.of(context).size.height,
            //width: MediaQuery.of(context).size.width,
            child: ListView(
              //shrinkWrap: true,
              children: [
                Text(
                  'Select as appropriate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0.dp,
                      fontWeight: FontWeight.normal),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Divider(height: 5.0, color: Colors.black),

                Text(
                  '1. Posture',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.dp,
                  ),
                ),

                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return DropdownButtonHideUnderline(
                  child: DropdownButton2<PostureData>(
                    alignment: Alignment.center,
                    hint: const Text(
                      'Select Posture',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 8.w,
                    buttonHeight: 12.h,
                    //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    value: _selectedPosture,
                    items: _postureDropdownMenuItems,
                    onChanged: (newSelectedPosture) {
                      {
                        setState(() {
                          _selectedPosture = newSelectedPosture!;
                        });
                      }
                    },
                    itemHeight: 12.h,
                    //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                    dropdownWidth: 90.w,
                    dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                    //dropdownElevation: 8,
                    offset: const Offset(0, 0),
                  ),
                ); },
                ),

                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '2. Square Window',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.dp,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<SquareWindowData>(
                        alignment: Alignment.center,
                        hint: const Text(
                          'Select Square Window',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 12.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedSW,
                        items: _squareWindowDropdownMenuItems,
                        onChanged: (newSelectedSquareWindow) {
                          {
                            setState(() {
                              _selectedSW = newSelectedSquareWindow!;
                            });
                          }
                        },
                        itemHeight: 12.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '3. Arm Recoil',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.dp,
                  ),
                ),
                StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return DropdownButtonHideUnderline(
                  child: DropdownButton2<ArmRecoilData>(
                    alignment: AlignmentDirectional.center,
                    hint: Text(
                      'select Arm Recoil',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 8.w,
                    buttonHeight: 12.h,
                    //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    value: _selectedArmRecoil,
                    items: _armRecoilDropdownMenuItems,
                    onChanged: (newSelectedArmRecoil) {
                      {
                        setState(() {
                          _selectedArmRecoil = newSelectedArmRecoil!;
                        });
                      }
                    },
                    itemHeight: 12.h,
                    //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                    dropdownWidth: 90.w,
                    dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                    //dropdownElevation: 8,
                    offset: const Offset(0, 0),
                  ),
                ); },
            ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Text(
                  '4. Popliteal Angle',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.dp,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<PoplitealAngleData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Popliteal Angle',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 12.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedPoplitealAngle,
                        items: _poplitealAngleDropdownMenuItems,
                        onChanged: (newSelectedPoplitealAngle) {
                          {
                            setState(() {
                              _selectedPoplitealAngle = newSelectedPoplitealAngle!;
                            });
                          }
                        },
                        itemHeight: 12.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '5. Scarf Sign',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.dp,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<ScarfSignData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Scarf Sign',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 12.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedScarfSign,
                        items: _scarfSignDropdownMenuItems,
                        onChanged: (newSelectedScarfSign) {
                          {
                            setState(() {
                              _selectedScarfSign = newSelectedScarfSign!;
                            });
                          }
                        },
                        itemHeight: 12.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '6. Heel-to-Ear',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.dp,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<HeelToEarData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Heel-to-Ear',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 12.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedHeelToEar,
                        items: _heelToEarDropdownMenuItems,
                        onChanged: (newSelectedHeelToEar) {
                          {
                            setState(() {
                              _selectedHeelToEar = newSelectedHeelToEar!;
                            });
                          }
                        },
                        itemHeight: 12.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '7. Skin',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.dp,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<SkinData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Skin',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 12.h,
                        //buttonPadding: const EdgeInsets.only(left: 10, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedSkin,
                        items: _skinDropdownMenuItems,
                        onChanged: (newSelectedSkin) {
                          {
                            setState(() {
                              _selectedSkin = newSelectedSkin!;
                            });
                          }
                        },
                        itemHeight: 10.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '8. Lanugo',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<LanugoData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Lanugo',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 10.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedLanugo,
                        items: _lanugoDropdownMenuItems,
                        onChanged: (newSelectedLanugo) {
                          {
                            setState(() {
                              _selectedLanugo = newSelectedLanugo!;
                            });
                          }
                        },
                        itemHeight: 10.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '9. Plantar Surface',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<PlantarSurfaceData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Plantar Surface',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 10.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedPlantarSurface,
                        items: _plantarSurfaceDropdownMenuItems,
                        onChanged: (newSelectedPlantarSurface) {
                          {
                            setState(() {
                              _selectedPlantarSurface = newSelectedPlantarSurface!;
                            });
                          }
                        },
                        itemHeight: 10.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '10. Breast',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<BreastData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Breast',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 10.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedBreast,
                        items: _breastDropdownMenuItems,
                        onChanged: (newSelectedBreast) {
                          {
                            setState(() {
                              _selectedBreast = newSelectedBreast!;
                            });
                          }
                        },
                        itemHeight: 10.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  '11. Eye/Ear',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<EyeEarData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Eye/Ear',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 10.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedEyeEar,
                        items: _eyeEarDropdownMenuItems,
                        onChanged: (newSelectedEyeEar) {
                          {
                            setState(() {
                              _selectedEyeEar = newSelectedEyeEar!;
                            });
                          }
                        },
                        itemHeight: 10.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text(
                  'Select sex',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    fontSize: 16.0,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<int>(
                    title: Text('male'),
                    value: 0,
                    groupValue: _sex,
                    onChanged: (value) {
                      setState(() {
                        _sex = value!;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text('female'),
                    value: 1,
                    groupValue: _sex,
                    onChanged: (value) {
                      setState(() {
                        _sex = value!;
                      });
                    },
                  ),
                ],),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0)),
                Text(
                  '12. Genitalia',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0.dp,
                  ),
                ),
                //Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                if (_sex == 0) ... [
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton2<MaleGenitaliaData>(
                          alignment: AlignmentDirectional.center,
                          hint: const Text(
                            'select Genitalia',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 8.w,
                          buttonHeight: 10.h,
                          //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          value: _selectedMaleGenitalia,
                          items: _maleGenitaliaDropdownMenuItems,
                          onChanged: (newSelectedMaleGenitalia) {
                            {
                              setState(() {
                                _selectedMaleGenitalia = newSelectedMaleGenitalia!;
                              });
                            }
                          },
                          itemHeight: 10.h,
                          //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                          dropdownWidth: 90.w,
                          dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                          //dropdownElevation: 8,
                          offset: const Offset(0, 0),
                        ),
                      ); },
                  ),]
                else if (_sex == 1)... [
                  StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton2<FemaleGenitaliaData>(
                        alignment: AlignmentDirectional.center,
                        hint: const Text(
                          'select Genitalia',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 8.w,
                        buttonHeight: 10.h,
                        //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        value: _selectedFemaleGenitalia,
                        items: _femaleGenitaliaDropdownMenuItems,
                        onChanged: (newSelectedFemaleGenitalia) {
                          {
                            setState(() {
                              _selectedFemaleGenitalia = newSelectedFemaleGenitalia!;
                            });
                          }
                        },
                        itemHeight: 10.h,
                        //itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 90.w,
                        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                        //dropdownElevation: 8,
                        offset: const Offset(0, 0),
                      ),
                    ); },
                ),],
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Divider(
                  height: 5.0,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.all(1.0.h),
                ),
                Container(
                  width: 70.0.w,
                  height: 6.0.h,
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0.w)),
                  ),
                  child: ElevatedButton(
                    onPressed: computeScore,
                    child: Text(
                      'Check Final Score',
                      style: TextStyle(
                          fontSize: 16.0.dp,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0.h),
                ),
                Container(
                  width: 70.0.w,
                  height: 6.0.h,
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0.w)),
                  ),
                  child: ElevatedButton(
                    onPressed: resetSelection,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,),
                    child: Text(
                      'Reset Selection',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0.dp,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  int totalScore = 0;
  var _comment = "";

  late double _age;
  late int _selectedGenitalia;
  late int _weeks;
  late int _days;
  late double _rawDays;

  void resetSelection() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => BallardScore()));
  }

  void computeScore() {
    validateAnswers();
    sumScores();
    convertToMaturity();
    convertMaturityToWeeksDays();
    comment();
    showResultDialog();
  }

  void validateAnswers() {
    if (_sex == -1 ) {
      showErrorDialog();
    } else {
      switchGenitalia();
    }
  }

  void switchGenitalia() {
    if (_sex == 0) {
      _selectedGenitalia = _selectedMaleGenitalia.value;
    } else if (_sex == 1) {
      _selectedGenitalia = _selectedFemaleGenitalia.value;
    }
  }

  void sumScores() {
    totalScore = _selectedPosture.value +
                  _selectedSW.value +
    _selectedArmRecoil.value +
    _selectedPoplitealAngle.value +
    _selectedScarfSign.value +
    _selectedHeelToEar.value +
    _selectedSkin.value +
    _selectedLanugo.value +
    _selectedPlantarSurface.value +
    _selectedBreast.value +
    _selectedEyeEar.value + _selectedGenitalia;
  }

  void convertToMaturity(){
    _age = ((totalScore * 2) + 120 )/ 5;
  }

  void convertMaturityToWeeksDays() {
    _weeks = _age.truncate();
    _rawDays = _age - _weeks;
    if (_rawDays == 0.0){
      _days = 0;}
    else if (_rawDays >= 0.1 && _rawDays <= 0.7){
      _days = ((_rawDays * 10) - 1).toInt();}
    else if (_rawDays >= 0.8){
      _weeks = _age.truncate() + 1;
      _days = ((_rawDays * 10) - 1).toInt() - 7;
    }
  }

  void comment() {
    if (_age < 28) {
      _comment = 'Extremely Preterm';
    } else if (28 <= _age && _age <= 31.7 ) {
      _comment = 'Very Preterm';
    }else if (31.8 <= _age && _age <= 36.7 ) {
      _comment = 'Moderate to Late Preterm';
    }
    else if (36.8 <= _age && _age <= 37.7 ) {
      _comment = 'Early Term';
    }
  }

  void showErrorDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return ErrorDialog();
      },
    );
  }

  void showResultDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return ResultDialog(
            customHeight: 45.h,
            customWidth: 80.w,
            title: "Ballard Score",
            total: "$totalScore",
            subHeader: "Maturity",
            interpretation: "$_weeks"+"weeks+"+"$_days"+"day(s)",
            comment: "(" + _comment + ")");
      },
    );
  }
}