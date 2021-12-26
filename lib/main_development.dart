// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holidays/bootstrap.dart';
import 'package:holidays/holidays/holidays.dart';
import 'package:holidays/utils/_index.dart';

void main() {
  bootstrap(() => MultiBlocProvider(
        providers: Singletons.registerCubits(),
        child: const Holidays(),
      ));
}
