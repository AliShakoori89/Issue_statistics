import 'package:flutter/material.dart';
import '../bloc/fetch_number_of_issues_fanar/state.dart';

class FanarIssuerList extends StatelessWidget {

  final NumberOfFanarIssuesState state;
  final double height;

  const FanarIssuerList({super.key, required this.state, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        margin: const EdgeInsets.only(
            right: 10,
            left: 10,
            top: 10,
            bottom: 10
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForAsrDaneshAfzarCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت عصر دانش افزار",
                    style: TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForToseeTejaratTeniyanCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت توسعه تجارت الكترونيك تنيان",
                    style: TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForRahkarHushmandAmnCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت راهكار هوشمند امن - اسپارا",
                    style: TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForToseeEttelaatVaErtebatatITSazaCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت توسعه اطلاعات و ارتباطات آی تی ساز",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForKiyakushanAriyaCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت کیاهوشان آریا",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForToseeNovinHamrahKishCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت توسعه نوین همراه کیش",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForTabanAtiPardazCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت تابان آتی پرداز",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForZherfAndishanHushmandDibaRayanCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت ژرف اندیشان هوشمند دیبارایان",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForPardazeshEttelaatMaliPartCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت پردازش اطلاعات مالی پارت (فنار)",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForBankTejaratCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("بانک تجارت (فنار)",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForPishgamanEtemadDijitalIraniyanCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text(
                    "شرکت پیشگامان اعتماد دیجیتال ایرانیان - ایران ساین",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForFanAvaranEtemadRaahbarCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت فن آوران اعتماد راهبر",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForGrouhTejaratElectronicSadraKiyanCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("گروه تجارت الکترونیک صدرا کیان",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForFinTekParsCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت فین و تک پارس",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.numberOfIssueForTejaratElectronicRahbordEidealAminCo.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("شرکت تجارت الکترونیک راهبرد ایده آل امین",
                    style: TextStyle(color: Colors.black))
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.fanarAllNumberOfIssue != 0
                      ? state.fanarAllNumberOfIssue.toString()
                      : 0.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: height / 80,
                ),
                const Text("تعداد کل گواهی های شرکت فنار",
                    style: TextStyle(color: Colors.black))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
