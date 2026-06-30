import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraCapturePage extends StatefulWidget {
  const CameraCapturePage({super.key});

  @override
  State<CameraCapturePage> createState() => _CameraCapturePageState();
}

class _CameraCapturePageState extends State<CameraCapturePage> {
  CameraController? _controller;
  File? _capturedImage;
  bool _initialized = false;
  bool _capturing = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        if (mounted) Navigator.of(context).pop(null);
        return;
      }
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        if (mounted) Navigator.of(context).pop(null);
        return;
      }
      final controller = CameraController(cameras.first, ResolutionPreset.high);
      await controller.initialize();
      if (mounted) {
        setState(() {
          _controller = controller;
          _initialized = true;
        });
      }
    } catch (_) {
      if (mounted) Navigator.of(context).pop(null);
    }
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized || _capturing) return;
    setState(() => _capturing = true);
    try {
      final image = await _controller!.takePicture();
      if (mounted) {
        setState(() {
          _capturedImage = File(image.path);
          _capturing = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _capturing = false);
    }
  }

  void _retake() {
    setState(() => _capturedImage = null);
  }

  void _accept() {
    Navigator.of(context).pop(_capturedImage);
  }

  void _cancel() {
    Navigator.of(context).pop(null);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(_capturedImage != null ? 'Vista previa' : 'Cámara'),
      ),
      body: _capturedImage != null ? _buildPreview() : _buildViewfinder(),
    );
  }

  Widget _buildViewfinder() {
    if (!_initialized) {
      return const Center(child: CircularProgressIndicator(color: Colors.white));
    }
    return Stack(
      children: [
        if (_controller != null && _controller!.value.isInitialized)
          CameraPreview(_controller!)
        else
          const Center(child: Text('No se pudo iniciar la cámara', style: TextStyle(color: Colors.white))),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 32),
                onPressed: _cancel,
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: _capturing ? null : _takePicture,
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: _capturing
                      ? const Center(child: SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white)))
                      : const Center(child: Icon(Icons.camera_alt, color: Colors.white, size: 32)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreview() {
    return Stack(
      children: [
        Center(
          child: Image.file(_capturedImage!, fit: BoxFit.contain),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _retake,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.refresh, color: Colors.white),
                      SizedBox(width: 6),
                      Text('Repetir', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: _accept,
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 36),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
