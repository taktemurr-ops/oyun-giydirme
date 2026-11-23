import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_giydirme/oyun_giydirme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(giydirmeConfig.title.length, 33);
    expect(giydirmeConfig.tagline.length, 33);
    for (final s in giydirmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(giydirmeConfig.gameId, giydirmeId);
    expect(giydirmeRules.gameId, giydirmeId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(giydirmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: giydirmeId, optionalMechanics: giydirmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(giydirmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
