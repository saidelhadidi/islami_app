import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/reusable_components/header_image.dart';
import 'package:islami_app/ui/home/widgets/recent_sura_item.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/home/widgets/suras_item.dart';
import '../../../../core/resources/assets_manager.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filterdSuras = [];
  String searchText = "";
  List<SuraModel> recentSuras = [];

  @override
  void initState() {
    super.initState();
    filterdSuras = SuraModel.getSuraList();
  }

  void manageRecentList(SuraModel sura) {
    setState(() {
      recentSuras.removeWhere((element) => element.number == sura.number);
      recentSuras.insert(0, sura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderImage(),
              SizedBox(height: 10),
              SearchBar(
                onChanged: (value) {
                  setState(() {
                    filterdSuras = SuraModel.getSuraList().where((sura) {
                      String searchInput = value.toLowerCase();
                      String englishName = sura.eName.toLowerCase();
                      String arabicName = sura.aName;

                      return englishName.contains(searchInput) ||
                          arabicName.contains(searchInput);
                    }).toList();
                    searchText = value;
                  });
                },
                leading: SvgPicture.asset(
                  AssetsManager.home,
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    ColorsManager.offWhite,
                    BlendMode.srcIn,
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  ColorsManager.black.withValues(alpha: 0.2),
                ),

                side: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.focused)) {
                    return BorderSide(color: Color(0XFFE2BE7F), width: 1.5);
                  }
                  return BorderSide.none;
                }),

                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                hintText: "Sura Name",
                hintStyle: WidgetStateProperty.all(
                  TextStyle(
                    color: ColorsManager.offWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textStyle: WidgetStateProperty.all(
                  TextStyle(color: ColorsManager.white),
                ),
              ),
              SizedBox(height: 15),
              if (searchText.isEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Recently",
                      style: TextStyle(
                        color: ColorsManager.offWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          recentSuras = [];
                        });
                      },
                      icon: Icon(Icons.delete, color: ColorsManager.offWhite,),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                recentSuras.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "No Recent Suras",
                            style: TextStyle(
                              color: ColorsManager.gold,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: recentSuras.length,
                                itemBuilder: (context, index) => RecentSuraItem(
                                  onRecentSuraTab: (recentSuraClicked) {
                                    manageRecentList(recentSuraClicked);
                                  },
                                  suraModel: recentSuras[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 15),
              ],
              Text(
                "Suras List",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 3),
              Expanded(
                child: filterdSuras.isEmpty
                    ? Center(
                        child: Text(
                          "لا توجد سورة بهذا الاسم",
                          style: TextStyle(
                            color: ColorsManager.gold,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.only(top: 20),
                        itemCount: filterdSuras.length,
                        itemBuilder: (context, index) => SurasItem(
                          onSuraTap: (clickedSura) {
                            manageRecentList(clickedSura);
                          },
                          suraModel: filterdSuras[index],
                        ),
                        separatorBuilder: (context, index) => Divider(
                          color: ColorsManager.white,
                          thickness: 2,
                          indent: 30,
                          endIndent: 30,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
