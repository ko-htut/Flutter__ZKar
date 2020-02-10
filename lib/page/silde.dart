
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  
//   double scrollAnimationValue(double shrinkOffset) {
//     double maxScrollAllowed = maxExtent - minExtent;
//     return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
//         .clamp(0, 1)
//         .toDouble();
//   }

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     final double visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
//     final double animationVal = scrollAnimationValue(shrinkOffset);
//     return Container(
//       height: visibleMainHeight,
//       width: MediaQuery.of(context).size.width,
//       child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           img.Container(
//             color: Colors.white30,
//             child: img.Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: img.Column(
//                 children: <Widget>[
//                   EboxDetailsHeader(
//                     model: widget.model,
//                   ),
//                   img.Padding(
//                     padding: const EdgeInsets.only(left: 10.0, right: 10),
//                     child: img.Container(
//                       color: img.Colors.black54,
//                       child: img.TabBar(
//                         tabs: [
//                           Tab(
//                             text: "About",
//                           ),
//                           Tab(
//                             text: "Series",
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 300.0;

//   @override
//   double get minExtent => 56.0;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
