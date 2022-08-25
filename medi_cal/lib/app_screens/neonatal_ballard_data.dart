
class PostureData {
  int value;
  String images;

  PostureData(this.value, this.images);

  static List<PostureData> getPosture() {
    return <PostureData>[
      PostureData(0, 'assets/images/Ballard/posture/0.png'),
      PostureData(1, 'assets/images/Ballard/posture/1.png'),
      PostureData(2, 'assets/images/Ballard/posture/2.png'),
      PostureData(3, 'assets/images/Ballard/posture/3.png'),
      PostureData(4, 'assets/images/Ballard/posture/4.png'),
    ];
  }
}

class SquareWindowData {
  int value;
  String images;

  SquareWindowData(this.value, this.images);

  static List<SquareWindowData> getSW() {
    return <SquareWindowData>[
      SquareWindowData(-1, 'assets/images/Ballard/square_window/-1.png'),
      SquareWindowData(0, 'assets/images/Ballard/square_window/0.png'),
      SquareWindowData(1, 'assets/images/Ballard/square_window/1.png'),
      SquareWindowData(2, 'assets/images/Ballard/square_window/2.png'),
      SquareWindowData(3, 'assets/images/Ballard/square_window/3.png'),
      SquareWindowData(4, 'assets/images/Ballard/square_window/4.png'),
    ];
  }
}

class ArmRecoilData {
  int value;
  String images;

  ArmRecoilData(this.value, this.images);

  static List<ArmRecoilData> getArmRecoil() {
    return <ArmRecoilData>[
      ArmRecoilData(0, 'assets/images/Ballard/arm_recoil/0.png'),
      ArmRecoilData(1, 'assets/images/Ballard/arm_recoil/1.png'),
      ArmRecoilData(2, 'assets/images/Ballard/arm_recoil/2.png'),
      ArmRecoilData(3, 'assets/images/Ballard/arm_recoil/3.png'),
      ArmRecoilData(4, 'assets/images/Ballard/arm_recoil/4.png'),
    ];
  }
}

class PoplitealAngleData {
  int value;
  String images;

  PoplitealAngleData(this.value, this.images);

  static List<PoplitealAngleData> getPoplitealAngle() {
    return <PoplitealAngleData>[
      PoplitealAngleData(-1, 'assets/images/Ballard/popliteal_angle/-1.png'),
      PoplitealAngleData(0, 'assets/images/Ballard/popliteal_angle/0.png'),
      PoplitealAngleData(1, 'assets/images/Ballard/popliteal_angle/1.png'),
      PoplitealAngleData(2, 'assets/images/Ballard/popliteal_angle/2.png'),
      PoplitealAngleData(3, 'assets/images/Ballard/popliteal_angle/3.png'),
      PoplitealAngleData(4, 'assets/images/Ballard/popliteal_angle/4.png'),
      PoplitealAngleData(5, 'assets/images/Ballard/popliteal_angle/5.png'),
    ];
  }
}

class ScarfSignData {
  int value;
  String images;

  ScarfSignData(this.value, this.images);

  static List<ScarfSignData> getScarfSign() {
    return <ScarfSignData>[
      //ScarfSignData(-1, 'assets/images/Ballard/square_window/-1.png'),
      ScarfSignData(0, 'assets/images/Ballard/scarf_sign/0.png'),
      ScarfSignData(1, 'assets/images/Ballard/scarf_sign/1.png'),
      ScarfSignData(2, 'assets/images/Ballard/scarf_sign/2.png'),
      ScarfSignData(3, 'assets/images/Ballard/scarf_sign/3.png'),
      ScarfSignData(4, 'assets/images/Ballard/scarf_sign/4.png'),
    ];
  }
}

class HeelToEarData {
  int value;
  String images;

  HeelToEarData(this.value, this.images);

  static List<HeelToEarData> getHeelToEar() {
    return <HeelToEarData>[
      HeelToEarData(-1, 'assets/images/Ballard/heel_ear/-1.png'),
      HeelToEarData(0, 'assets/images/Ballard/heel_ear/0.png'),
      HeelToEarData(1, 'assets/images/Ballard/heel_ear/1.png'),
      HeelToEarData(2, 'assets/images/Ballard/heel_ear/2.png'),
      HeelToEarData(3, 'assets/images/Ballard/heel_ear/3.png'),
      HeelToEarData(4, 'assets/images/Ballard/heel_ear/4.png'),
    ];
  }
}

class SkinData {
  int value;
  String desc;

  SkinData(this.value, this.desc);

  static List<SkinData> getSkin() {
    return <SkinData>[
      SkinData(-1, 'Sticky, friable, transparent'),
      SkinData(0, 'gelatinous, red, translucent '),
      SkinData(1, 'smooth pink, visible veins'),
      SkinData(2, 'superficial peeling &/or rash, few veins'),
      SkinData(3, 'cracking, pale areas, rare veins'),
      SkinData(4, 'parchment, deep cracking, no vessels'),
      SkinData(5, 'leathery, cracked, wrinkled'),
    ];
  }
}

class LanugoData {
  int value;
  String desc;

  LanugoData(this.value, this.desc);

  static List<LanugoData> getLanugo() {
    return <LanugoData>[
      LanugoData(-1, 'none'),
      LanugoData(0, 'sparse'),
      LanugoData(1, 'abundant'),
      LanugoData(2, 'thinning'),
      LanugoData(3, 'bald areas'),
      LanugoData(4, 'mostly bald'),
    ];
  }
}

class PlantarSurfaceData {
  int value;
  String desc;

  PlantarSurfaceData(this.value, this.desc);

  static List<PlantarSurfaceData> getPlantarSurface() {
    return <PlantarSurfaceData>[
      PlantarSurfaceData(-1, 'heel-toe 40-50mm: -1 <40mm: -2'),
      PlantarSurfaceData(0, '>50mm; no crease'),
      PlantarSurfaceData(1, 'faint red marks'),
      PlantarSurfaceData(2, 'anterior transverse crease only'),
      PlantarSurfaceData(3, 'creases @ ant. 2/3'),
      PlantarSurfaceData(4, 'creases over entire sole'),
    ];
  }
}

class BreastData {
  int value;
  String desc;

  BreastData(this.value, this.desc);

  static List<BreastData> getBreast() {
    return <BreastData>[
      BreastData(-1, 'imperceptible'),
      BreastData(0, 'barely imperceptible'),
      BreastData(1, 'flat areola, no bud'),
      BreastData(2, 'stippled areola 1-2 mm bud'),
      BreastData(3, 'raised areola 3-4 mm bud'),
      BreastData(4, 'full areola 5-10 mm bud'),
    ];
  }
}

class EyeEarData {
  int value;
  String desc;

  EyeEarData(this.value, this.desc);

  static List<EyeEarData> getEyeEar() {
    return <EyeEarData>[
      EyeEarData(-1, 'lids fused loosely: -1; tightly: -2'),
      EyeEarData(0, 'lids open; pinna flat; stays folded'),
      EyeEarData(1, 'slightly curved pinna; soft; slow recoil'),
      EyeEarData(2, 'well-curved pinna; soft but ready recoil'),
      EyeEarData(3, 'formed & firm, instant recoil'),
      EyeEarData(4, 'thick cartilage; ear stiff'),
    ];
  }
}

class MaleGenitaliaData {
  int value;
  String desc;

  MaleGenitaliaData(this.value, this.desc);

  static List<MaleGenitaliaData> getMaleGenitalia() {
    return <MaleGenitaliaData>[
      MaleGenitaliaData(-1, 'scrotum flat, smooth'),
      MaleGenitaliaData(0, 'scrotum empty, faint rugae'),
      MaleGenitaliaData(1, 'testes in upper canal, rare rugae'),
      MaleGenitaliaData(2, 'testes descending, few rugae'),
      MaleGenitaliaData(3, 'testes down, good rugae'),
      MaleGenitaliaData(4, 'testes pendulous, deep rugae'),
    ];
  }
}

class FemaleGenitaliaData {
  int value;
  String desc;

  FemaleGenitaliaData(this.value, this.desc);

  static List<FemaleGenitaliaData> getFemaleGenitalia() {
    return <FemaleGenitaliaData>[
      FemaleGenitaliaData(-1, 'clitoris prominent & labia flat'),
      FemaleGenitaliaData(0, 'prominent clitoris & small labia minora'),
      FemaleGenitaliaData(1, 'prominent clitoris & enlarging minora'),
      FemaleGenitaliaData(2, 'majora & minora equally prominent'),
      FemaleGenitaliaData(3, 'majora large, minora small'),
      FemaleGenitaliaData(4, 'majora cover clitoris & minora'),
    ];
  }
}