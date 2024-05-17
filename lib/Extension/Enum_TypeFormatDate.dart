import 'package:flutter/material.dart';

///Le tipologie di valore che può assumere:
///
///   DD                            --> 25
///
///   EEEEE                         --> W
///
///   EEE                           --> Wed
///
///   EEEE                          --> Wednesday
///
///   MM                            --> 09
///
///   MMM                           --> Sep
///
///   MMM_D                         --> Sep 25
///
///   AAAA                          --> 2018
///
///   MM_AAAA                       --> 09/2018
///
///   DD_MM_AAAA                    --> 25/09/2018
///
///   MM_DD_AAAA                    --> 09/25/2018
///
///   DD_MM_AA                      --> 25.09.18
///
///   AAAAMMDD                      --> 20180925
///
///   MMMM_AAAA                     --> September 2018
///
///   MMM_D_AAAA                    --> Sep 25, 2018
///
///   EEEE_MMM_GG_AAAA              --> Wednesday, Sep 25, 2018
///
///   HH_MM_SS_SSS                  --> 14:11:54.112
///
///   MM_DD_AAAA_HH_MM              --> 09-25-2018 14:11
///
///   MMM_D_HH_MM_A                 --> Sep 25, 2:11 PM
///
///   E_D_MMM_AAAA_HH_MM_SS_Z       --> Wed, 25 Sep 2018 14:11:54 +0000
///
///   AAAA_MM_DD_T_HH_MM_SSZ        --> 2018-09-25T14:11:54+0000

enum TypeFormatDate{
  DD,
  EEEEE,
  EEE,
  EEEE,
  MM,
  MMM,
  MMM_D,
  AAAA,
  MM_AAAA,
  DD_MM_AAAA,
  MM_DD_AAAA,
  DD_MM_AA,
  AAAAMMDD,
  MMMM_AAAA,
  MMM_D_AAAA,
  EEEE_MMM_GG_AAAA,
  HH_MM_SS_SSS,
  MM_DD_AAAA_HH_MM,
  MMM_D_HH_MM_A,
  E_D_MMM_AAAA_HH_MM_SS_Z,
  AAAA_MM_DD_T_HH_MM_SSZ,
}

extension ExtTypeFormatDate on TypeFormatDate {
  String get value {
    switch (this) {
      case TypeFormatDate.DD:
        return 'dd';
      case TypeFormatDate.EEEEE:
        return 'EEEEE';
      case TypeFormatDate.EEE:
        return 'EEE';
      case TypeFormatDate.EEEE:
        return 'EEEE';
      case TypeFormatDate.MM:
        return 'MM';
      case TypeFormatDate.MMM:
        return 'MMM';
      case TypeFormatDate.MMM_D:
        return 'MMM d';
      case TypeFormatDate.AAAA:
        return 'yyyy';
      case TypeFormatDate.MM_AAAA:
        return 'MM/yyyy';
      case TypeFormatDate.DD_MM_AAAA:
        return 'dd/MM/yyyy';
      case TypeFormatDate.MM_DD_AAAA:
        return 'MM/dd/yyyy';
      case TypeFormatDate.DD_MM_AA:
        return 'dd.MM.yy';
      case TypeFormatDate.AAAAMMDD:
        return 'yyyyMMdd';
      case TypeFormatDate.MMMM_AAAA:
        return 'MMMM yyyy';
      case TypeFormatDate.MMM_D_AAAA:
        return 'MMM d, yyyy';
      case TypeFormatDate.EEEE_MMM_GG_AAAA:
        return 'EEEE, MMM d, yyyy';
      case TypeFormatDate.HH_MM_SS_SSS:
        return 'HH:mm:ss.SSS';
      case TypeFormatDate.MM_DD_AAAA_HH_MM:
        return 'MM-dd-yyyy HH:mm';
      case TypeFormatDate.MMM_D_HH_MM_A:
        return 'MMM d, h:mm a';
      case TypeFormatDate.E_D_MMM_AAAA_HH_MM_SS_Z:
        return 'E, d MMM yyyy HH:mm:ss Z';
      case TypeFormatDate.AAAA_MM_DD_T_HH_MM_SSZ:
        return "yyyy-MM-dd'T'HH:mm:ssZ";
      default:
        return '';
    }
  }
}