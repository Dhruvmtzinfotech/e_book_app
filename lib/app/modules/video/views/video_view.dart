import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const List<String> _videoIds = [
  'tcodrIK2P_I',
  'H5v3kku4y6Q',
  'nPt8bK2gbaU',
  'K18cpp_-gP8',
  'iLnmTe5Q2Qw',
  '_WoCV4c6XOE',
  'KmzdUe0RSJo',
  '6jZDSSZZxjQ',
  'p2lYr3vM_1w',
  '7QUtEmBT_-w',
  '34_PXCzGw1M'
];


class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener(
          (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _controller.loadPlaylist(
      list: _videoIds,
      listType: ListType.playlist,
      startSeconds: 136,
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Youtube Play'),
            actions: const [VideoPlaylistIconButton()],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (kIsWeb && constraints.maxWidth > 750) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          player,
                          const VideoPositionIndicator(),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        // child: Controls(),
                      ),
                    ),
                  ],
                );
              }
              return ListView(
                children: [
                  player,
                   const VideoPositionIndicator(),
                   // Controls(),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}


// class Controls extends StatelessWidget {
//   const Controls();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           MetaDataSection(),
//           _space,
//           SourceInputSection(),
//           _space,
//           PlayPauseButtonBar(),
//           _space,
//           VideoPositionSeeker(),
//           _space,
//           PlayerStateSection(),
//         ],
//       ),
//     );
//   }
//
//   Widget get _space => const SizedBox(height: 10);
// }


class VideoPlaylistIconButton extends StatelessWidget {
  const VideoPlaylistIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.ytController;

    return IconButton(
      onPressed: () async {
        controller.pauseVideo();
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => VideoListPage(),
        //   ),
        // );
        controller.playVideo();
      },
      icon: const Icon(Icons.playlist_play_sharp),
    );
  }
}

class VideoPositionIndicator extends StatelessWidget {
  const VideoPositionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.ytController;

    return StreamBuilder<YoutubeVideoState>(
      stream: controller.videoStateStream,
      initialData: const YoutubeVideoState(),
      builder: (context, snapshot) {
        final position = snapshot.data?.position.inMilliseconds ?? 0;
        final duration = controller.metadata.duration.inMilliseconds;

        return LinearProgressIndicator(
          value: duration == 0 ? 0 : position / duration,
          minHeight: 1,
        );
      },
    );
  }
}


class VideoPositionSeeker extends StatelessWidget {
  const VideoPositionSeeker({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 0.0;

    return Row(
      children: [
         const Text('Seek',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: StreamBuilder<YoutubeVideoState>(
            stream: context.ytController.videoStateStream,
            initialData: const YoutubeVideoState(),
            builder: (context, snapshot) {
              final position = snapshot.data?.position.inSeconds ?? 0;
              final duration = context.ytController.metadata.duration.inSeconds;

              value = position == 0 || duration == 0 ? 0 : position / duration;

              return StatefulBuilder(
                builder: (context, setState) {
                  return Slider(
                    value: value,
                    onChanged: (positionFraction) {
                      value = positionFraction;
                      setState(() {});
                      context.ytController.seekTo(
                        seconds: (value * duration).toDouble(),
                        allowSeekAhead: true,
                      );
                    },
                    min: 0,
                    max: 1,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}


