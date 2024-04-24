import 'dart:async';
import 'package:flutter/material.dart';
import './screen_arguments.dart';

class StopWatch extends StatefulWidget {
  static const route = '/stopwatch';

  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  late Timer timer;
  bool isTicking = false;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void _onTick(timer) {
    setState(() {
      milliseconds += 100;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);
    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer(BuildContext context) {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
    final controller = showBottomSheet(
      context: context,
      builder: _buildRunCompleteSheet,
    );

    Future.delayed(const Duration(seconds: 5)).then(
      (_) => controller.close(),
    );
  }

  Widget _buildRunCompleteSheet(BuildContext context) {
    final totalRuntime = laps.fold(milliseconds, (total, lap) => total + lap);
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        color: Theme.of(context).cardColor,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Run Finished!', style: textTheme.headlineSmall),
              Text('Total Run Time is ${_secondsText(totalRuntime)}.')
            ],
          ),
        ),
      ),
    );
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });

    scrollController.animateTo(
      itemHeight * laps.length,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeight,
        itemCount: laps.length,
        itemBuilder: (context, index) {
          final milliseconds = laps[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 50),
            title: Text('Lap ${index + 1}'),
            trailing: Text(_secondsText(milliseconds)),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? name = ModalRoute.of(context)!.settings.arguments != null
        ? (ModalRoute.of(context)!.settings.arguments as ScreenArguments).name
        : "Unknown";
    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          _buildControls()
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: isTicking ? null : _startTimer,
          child: const Text("Start"),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
          ),
          onPressed: isTicking ? _lap : null,
          child: const Text('Lap'),
        ),
        const SizedBox(width: 20),
        Builder(
          builder: (context) => TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: isTicking ? () => _stopTimer(context) : null,
            child: const Text('Stop'),
          ),
        ),
      ],
    );
  }
}
