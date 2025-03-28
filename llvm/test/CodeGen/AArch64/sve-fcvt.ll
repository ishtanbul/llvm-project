; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sve < %s | FileCheck %s

;
; FP_EXTEND
;

define <vscale x 2 x float> @fcvts_nxv2f16(<vscale x 2 x half> %a) {
; CHECK-LABEL: fcvts_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvt z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fpext <vscale x 2 x half> %a to <vscale x 2 x float>
  ret <vscale x 2 x float> %res
}

define <vscale x 3 x float> @fcvts_nxv3f16(<vscale x 3 x half> %a) {
; CHECK-LABEL: fcvts_nxv3f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvt z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fpext <vscale x 3 x half> %a to <vscale x 3 x float>
  ret <vscale x 3 x float> %res
}

define <vscale x 4 x float> @fcvts_nxv4f16(<vscale x 4 x half> %a) {
; CHECK-LABEL: fcvts_nxv4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvt z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fpext <vscale x 4 x half> %a to <vscale x 4 x float>
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x double> @fcvtd_nxv2f16(<vscale x 2 x half> %a) {
; CHECK-LABEL: fcvtd_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvt z0.d, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fpext <vscale x 2 x half> %a to <vscale x 2 x double>
  ret <vscale x 2 x double> %res
}

define <vscale x 2 x double> @fcvtd_nxv2f32(<vscale x 2 x float> %a) {
; CHECK-LABEL: fcvtd_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvt z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fpext <vscale x 2 x float> %a to <vscale x 2 x double>
  ret <vscale x 2 x double> %res
}

;
; FP_ROUND
;

define <vscale x 2 x half> @fcvth_nxv2f32(<vscale x 2 x float> %a) {
; CHECK-LABEL: fcvth_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvt z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptrunc <vscale x 2 x float> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 3 x half> @fcvth_nxv3f32(<vscale x 3 x float> %a) {
; CHECK-LABEL: fcvth_nxv3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvt z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptrunc <vscale x 3 x float> %a to <vscale x 3 x half>
  ret <vscale x 3 x half> %res
}

define <vscale x 4 x half> @fcvth_nxv4f32(<vscale x 4 x float> %a) {
; CHECK-LABEL: fcvth_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvt z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptrunc <vscale x 4 x float> %a to <vscale x 4 x half>
  ret <vscale x 4 x half> %res
}

define <vscale x 2 x half> @fcvth_nxv2f64(<vscale x 2 x double> %a) {
; CHECK-LABEL: fcvth_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvt z0.h, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = fptrunc <vscale x 2 x double> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 2 x float> @fcvts_nxv2f64(<vscale x 2 x double> %a) {
; CHECK-LABEL: fcvts_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvt z0.s, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = fptrunc <vscale x 2 x double> %a to <vscale x 2 x float>
  ret <vscale x 2 x float> %res
}

;
; FP_TO_SINT
;

define <vscale x 2 x i16> @fcvtzs_h_nxv2f16(<vscale x 2 x half> %a) {
; CHECK-LABEL: fcvtzs_h_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x half> %a to <vscale x 2 x i16>
  ret <vscale x 2 x i16> %res
}

define <vscale x 2 x i16> @fcvtzs_h_nxv2f32(<vscale x 2 x float> %a) {
; CHECK-LABEL: fcvtzs_h_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x float> %a to <vscale x 2 x i16>
  ret <vscale x 2 x i16> %res
}

define <vscale x 2 x i16> @fcvtzs_h_nxv2f64(<vscale x 2 x double> %a) {
; CHECK-LABEL: fcvtzs_h_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x double> %a to <vscale x 2 x i16>
  ret <vscale x 2 x i16> %res
}

define <vscale x 4 x i16> @fcvtzs_h_nxv4f16(<vscale x 4 x half> %a) {
; CHECK-LABEL: fcvtzs_h_nxv4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzs z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 4 x half> %a to <vscale x 4 x i16>
  ret <vscale x 4 x i16> %res
}

define <vscale x 4 x i16> @fcvtzs_h_nxv4f32(<vscale x 4 x float> %a) {
; CHECK-LABEL: fcvtzs_h_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzs z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 4 x float> %a to <vscale x 4 x i16>
  ret <vscale x 4 x i16> %res
}

define <vscale x 7 x i16> @fcvtzs_h_nxv7f16(<vscale x 7 x half> %a) {
; CHECK-LABEL: fcvtzs_h_nxv7f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fcvtzs z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 7 x half> %a to <vscale x 7 x i16>
  ret <vscale x 7 x i16> %res
}

define <vscale x 8 x i16> @fcvtzs_h_nxv8f16(<vscale x 8 x half> %a) {
; CHECK-LABEL: fcvtzs_h_nxv8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fcvtzs z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 8 x half> %a to <vscale x 8 x i16>
  ret <vscale x 8 x i16> %res
}

define <vscale x 2 x i32> @fcvtzs_s_nxv2f16(<vscale x 2 x half> %a) {
; CHECK-LABEL: fcvtzs_s_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x half> %a to <vscale x 2 x i32>
  ret <vscale x 2 x i32> %res
}

define <vscale x 2 x i32> @fcvtzs_s_nxv2f32(<vscale x 2 x float> %a) {
; CHECK-LABEL: fcvtzs_s_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x float> %a to <vscale x 2 x i32>
  ret <vscale x 2 x i32> %res
}

define <vscale x 2 x i32> @fcvtzs_s_nxv2f64(<vscale x 2 x double> %a) {
; CHECK-LABEL: fcvtzs_s_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x double> %a to <vscale x 2 x i32>
  ret <vscale x 2 x i32> %res
}

define <vscale x 4 x i32> @fcvtzs_s_nxv4f16(<vscale x 4 x half> %a) {
; CHECK-LABEL: fcvtzs_s_nxv4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzs z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 4 x half> %a to <vscale x 4 x i32>
  ret <vscale x 4 x i32> %res
}

define <vscale x 3 x i32> @fcvtzs_s_nxv3f16(<vscale x 3 x half> %a) {
; CHECK-LABEL: fcvtzs_s_nxv3f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzs z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 3 x half> %a to <vscale x 3 x i32>
  ret <vscale x 3 x i32> %res
}

define <vscale x 4 x i32> @fcvtzs_s_nxv4f32(<vscale x 4 x float> %a) {
; CHECK-LABEL: fcvtzs_s_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzs z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 4 x float> %a to <vscale x 4 x i32>
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @fcvtzs_d_nxv2f16(<vscale x 2 x half> %a) {
; CHECK-LABEL: fcvtzs_d_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x half> %a to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

define <vscale x 2 x i64> @fcvtzs_d_nxv2f32(<vscale x 2 x float> %a) {
; CHECK-LABEL: fcvtzs_d_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x float> %a to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

define <vscale x 2 x i64> @fcvtzs_d_nxv2f64(<vscale x 2 x double> %a) {
; CHECK-LABEL: fcvtzs_d_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 2 x double> %a to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

;
; FP_TO_UINT
;

; NOTE: Using fcvtzs is safe as fptoui overflow is considered poison and a
; 64bit signed value encompasses the entire range of a 16bit unsigned value
define <vscale x 2 x i16> @fcvtzu_h_nxv2f16(<vscale x 2 x half> %a) {
; CHECK-LABEL: fcvtzu_h_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x half> %a to <vscale x 2 x i16>
  ret <vscale x 2 x i16> %res
}

define <vscale x 2 x i16> @fcvtzu_h_nxv2f32(<vscale x 2 x float> %a) {
; CHECK-LABEL: fcvtzu_h_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x float> %a to <vscale x 2 x i16>
  ret <vscale x 2 x i16> %res
}

define <vscale x 2 x i16> @fcvtzu_h_nxv2f64(<vscale x 2 x double> %a) {
; CHECK-LABEL: fcvtzu_h_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x double> %a to <vscale x 2 x i16>
  ret <vscale x 2 x i16> %res
}

define <vscale x 4 x i16> @fcvtzu_h_nxv4f16(<vscale x 4 x half> %a) {
; CHECK-LABEL: fcvtzu_h_nxv4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzs z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 4 x half> %a to <vscale x 4 x i16>
  ret <vscale x 4 x i16> %res
}

define <vscale x 4 x i16> @fcvtzu_h_nxv4f32(<vscale x 4 x float> %a) {
; CHECK-LABEL: fcvtzu_h_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzs z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptosi <vscale x 4 x float> %a to <vscale x 4 x i16>
  ret <vscale x 4 x i16> %res
}

define <vscale x 7 x i16> @fcvtzu_h_nxv7f16(<vscale x 7 x half> %a) {
; CHECK-LABEL: fcvtzu_h_nxv7f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fcvtzu z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 7 x half> %a to <vscale x 7 x i16>
  ret <vscale x 7 x i16> %res
}

define <vscale x 8 x i16> @fcvtzu_h_nxv8f16(<vscale x 8 x half> %a) {
; CHECK-LABEL: fcvtzu_h_nxv8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    fcvtzu z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 8 x half> %a to <vscale x 8 x i16>
  ret <vscale x 8 x i16> %res
}

define <vscale x 2 x i32> @fcvtzu_s_nxv2f16(<vscale x 2 x half> %a) {
; CHECK-LABEL: fcvtzu_s_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x half> %a to <vscale x 2 x i32>
  ret <vscale x 2 x i32> %res
}

define <vscale x 2 x i32> @fcvtzu_s_nxv2f32(<vscale x 2 x float> %a) {
; CHECK-LABEL: fcvtzu_s_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x float> %a to <vscale x 2 x i32>
  ret <vscale x 2 x i32> %res
}

define <vscale x 2 x i32> @fcvtzu_s_nxv2f64(<vscale x 2 x double> %a) {
; CHECK-LABEL: fcvtzu_s_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzs z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x double> %a to <vscale x 2 x i32>
  ret <vscale x 2 x i32> %res
}

define <vscale x 3 x i32> @fcvtzu_s_nxv3f16(<vscale x 3 x half> %a) {
; CHECK-LABEL: fcvtzu_s_nxv3f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzu z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 3 x half> %a to <vscale x 3 x i32>
  ret <vscale x 3 x i32> %res
}

define <vscale x 3 x i32> @fcvtzu_s_nxv3f32(<vscale x 3 x float> %a) {
; CHECK-LABEL: fcvtzu_s_nxv3f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzu z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 3 x float> %a to <vscale x 3 x i32>
  ret <vscale x 3 x i32> %res
}

define <vscale x 4 x i32> @fcvtzu_s_nxv4f16(<vscale x 4 x half> %a) {
; CHECK-LABEL: fcvtzu_s_nxv4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzu z0.s, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 4 x half> %a to <vscale x 4 x i32>
  ret <vscale x 4 x i32> %res
}

define <vscale x 4 x i32> @fcvtzu_s_nxv4f32(<vscale x 4 x float> %a) {
; CHECK-LABEL: fcvtzu_s_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    fcvtzu z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 4 x float> %a to <vscale x 4 x i32>
  ret <vscale x 4 x i32> %res
}

define <vscale x 2 x i64> @fcvtzu_d_nxv2f16(<vscale x 2 x half> %a) {
; CHECK-LABEL: fcvtzu_d_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzu z0.d, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x half> %a to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

define <vscale x 2 x i64> @fcvtzu_d_nxv2f32(<vscale x 2 x float> %a) {
; CHECK-LABEL: fcvtzu_d_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzu z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x float> %a to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

define <vscale x 2 x i64> @fcvtzu_d_nxv2f64(<vscale x 2 x double> %a) {
; CHECK-LABEL: fcvtzu_d_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    fcvtzu z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = fptoui <vscale x 2 x double> %a to <vscale x 2 x i64>
  ret <vscale x 2 x i64> %res
}

; SINT_TO_FP

define <vscale x 2 x half> @scvtf_h_nxv2i1(<vscale x 2 x i1> %a) {
; CHECK-LABEL: scvtf_h_nxv2i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i1> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 2 x half> @scvtf_h_nxv2i16(<vscale x 2 x i16> %a) {
; CHECK-LABEL: scvtf_h_nxv2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i16> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 2 x half> @scvtf_h_nxv2i32(<vscale x 2 x i32> %a) {
; CHECK-LABEL: scvtf_h_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i32> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 2 x half> @scvtf_h_nxv2i64(<vscale x 2 x i64> %a) {
; CHECK-LABEL: scvtf_h_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i64> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 3 x half> @scvtf_h_nxv3i1(<vscale x 3 x i1> %a) {
; CHECK-LABEL: scvtf_h_nxv3i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 3 x i1> %a to <vscale x 3 x half>
  ret <vscale x 3 x half> %res
}

define <vscale x 3 x half> @scvtf_h_nxv3i16(<vscale x 3 x i16> %a) {
; CHECK-LABEL: scvtf_h_nxv3i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 3 x i16> %a to <vscale x 3 x half>
  ret <vscale x 3 x half> %res
}

define <vscale x 4 x half> @scvtf_h_nxv4i1(<vscale x 4 x i1> %a) {
; CHECK-LABEL: scvtf_h_nxv4i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 4 x i1> %a to <vscale x 4 x half>
  ret <vscale x 4 x half> %res
}

define <vscale x 4 x half> @scvtf_h_nxv4i16(<vscale x 4 x i16> %a) {
; CHECK-LABEL: scvtf_h_nxv4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 4 x i16> %a to <vscale x 4 x half>
  ret <vscale x 4 x half> %res
}

define <vscale x 4 x half> @scvtf_h_nxv4i32(<vscale x 4 x i32> %a) {
; CHECK-LABEL: scvtf_h_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 4 x i32> %a to <vscale x 4 x half>
  ret <vscale x 4 x half> %res
}

define <vscale x 7 x half> @scvtf_h_nxv7i1(<vscale x 7 x i1> %a) {
; CHECK-LABEL: scvtf_h_nxv7i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 7 x i1> %a to <vscale x 7 x half>
  ret <vscale x 7 x half> %res
}

define <vscale x 7 x half> @scvtf_h_nxv7i16(<vscale x 7 x i16> %a) {
; CHECK-LABEL: scvtf_h_nxv7i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 7 x i16> %a to <vscale x 7 x half>
  ret <vscale x 7 x half> %res
}

define <vscale x 8 x half> @scvtf_h_nxv8i1(<vscale x 8 x i1> %a) {
; CHECK-LABEL: scvtf_h_nxv8i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 8 x i1> %a to <vscale x 8 x half>
  ret <vscale x 8 x half> %res
}

define <vscale x 8 x half> @scvtf_h_nxv8i16(<vscale x 8 x i16> %a) {
; CHECK-LABEL: scvtf_h_nxv8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    scvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 8 x i16> %a to <vscale x 8 x half>
  ret <vscale x 8 x half> %res
}

define <vscale x 2 x float> @scvtf_s_nxv2i1(<vscale x 2 x i1> %a) {
; CHECK-LABEL: scvtf_s_nxv2i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.s, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i1> %a to <vscale x 2 x float>
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x float> @scvtf_s_nxv2i32(<vscale x 2 x i32> %a) {
; CHECK-LABEL: scvtf_s_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i32> %a to <vscale x 2 x float>
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x float> @scvtf_s_nxv2i64(<vscale x 2 x i64> %a) {
; CHECK-LABEL: scvtf_s_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.s, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i64> %a to <vscale x 2 x float>
  ret <vscale x 2 x float> %res
}

define <vscale x 3 x float> @scvtf_s_nxv3i1(<vscale x 3 x i1> %a) {
; CHECK-LABEL: scvtf_s_nxv3i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 3 x i1> %a to <vscale x 3 x float>
  ret <vscale x 3 x float> %res
}

define <vscale x 3 x float> @scvtf_s_nxv3i32(<vscale x 3 x i32> %a) {
; CHECK-LABEL: scvtf_s_nxv3i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 3 x i32> %a to <vscale x 3 x float>
  ret <vscale x 3 x float> %res
}

define <vscale x 4 x float> @scvtf_s_nxv4i1(<vscale x 4 x i1> %a) {
; CHECK-LABEL: scvtf_s_nxv4i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 4 x i1> %a to <vscale x 4 x float>
  ret <vscale x 4 x float> %res
}

define <vscale x 4 x float> @scvtf_s_nxv4i32(<vscale x 4 x i32> %a) {
; CHECK-LABEL: scvtf_s_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    scvtf z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 4 x i32> %a to <vscale x 4 x float>
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x double> @scvtf_d_nxv2i1(<vscale x 2 x i1> %a) {
; CHECK-LABEL: scvtf_d_nxv2i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/z, #-1 // =0xffffffffffffffff
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i1> %a to <vscale x 2 x double>
  ret <vscale x 2 x double> %res
}

define <vscale x 2 x double> @scvtf_d_nxv2i32(<vscale x 2 x i32> %a) {
; CHECK-LABEL: scvtf_d_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i32> %a to <vscale x 2 x double>
  ret <vscale x 2 x double> %res
}

define <vscale x 2 x double> @scvtf_d_nxv2i64(<vscale x 2 x i64> %a) {
; CHECK-LABEL: scvtf_d_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    scvtf z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = sitofp <vscale x 2 x i64> %a to <vscale x 2 x double>
  ret <vscale x 2 x double> %res
}

; UINT_TO_FP

define <vscale x 2 x half> @ucvtf_h_nxv2i1(<vscale x 2 x i1> %a) {
; CHECK-LABEL: ucvtf_h_nxv2i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/z, #1 // =0x1
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i1> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 2 x half> @ucvtf_h_nxv2i16(<vscale x 2 x i16> %a) {
; CHECK-LABEL: ucvtf_h_nxv2i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i16> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 2 x half> @ucvtf_h_nxv2i32(<vscale x 2 x i32> %a) {
; CHECK-LABEL: ucvtf_h_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i32> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 2 x half> @ucvtf_h_nxv2i64(<vscale x 2 x i64> %a) {
; CHECK-LABEL: ucvtf_h_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i64> %a to <vscale x 2 x half>
  ret <vscale x 2 x half> %res
}

define <vscale x 3 x half> @ucvtf_h_nxv3i1(<vscale x 3 x i1> %a) {
; CHECK-LABEL: ucvtf_h_nxv3i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/z, #1 // =0x1
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 3 x i1> %a to <vscale x 3 x half>
  ret <vscale x 3 x half> %res
}

define <vscale x 3 x half> @ucvtf_h_nxv3i16(<vscale x 3 x i16> %a) {
; CHECK-LABEL: ucvtf_h_nxv3i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 3 x i16> %a to <vscale x 3 x half>
  ret <vscale x 3 x half> %res
}

define <vscale x 3 x half> @ucvtf_h_nxv3i32(<vscale x 3 x i32> %a) {
; CHECK-LABEL: ucvtf_h_nxv3i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 3 x i32> %a to <vscale x 3 x half>
  ret <vscale x 3 x half> %res
}

define <vscale x 4 x half> @ucvtf_h_nxv4i1(<vscale x 4 x i1> %a) {
; CHECK-LABEL: ucvtf_h_nxv4i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/z, #1 // =0x1
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 4 x i1> %a to <vscale x 4 x half>
  ret <vscale x 4 x half> %res
}

define <vscale x 4 x half> @ucvtf_h_nxv4i16(<vscale x 4 x i16> %a) {
; CHECK-LABEL: ucvtf_h_nxv4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 4 x i16> %a to <vscale x 4 x half>
  ret <vscale x 4 x half> %res
}

define <vscale x 4 x half> @ucvtf_h_nxv4i32(<vscale x 4 x i32> %a) {
; CHECK-LABEL: ucvtf_h_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 4 x i32> %a to <vscale x 4 x half>
  ret <vscale x 4 x half> %res
}

define <vscale x 8 x half> @ucvtf_h_nxv8i1(<vscale x 8 x i1> %a) {
; CHECK-LABEL: ucvtf_h_nxv8i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.h, p0/z, #1 // =0x1
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 8 x i1> %a to <vscale x 8 x half>
  ret <vscale x 8 x half> %res
}

define <vscale x 8 x half> @ucvtf_h_nxv8i16(<vscale x 8 x i16> %a) {
; CHECK-LABEL: ucvtf_h_nxv8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    ucvtf z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 8 x i16> %a to <vscale x 8 x half>
  ret <vscale x 8 x half> %res
}

define <vscale x 2 x float> @ucvtf_s_nxv2i1(<vscale x 2 x i1> %a) {
; CHECK-LABEL: ucvtf_s_nxv2i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/z, #1 // =0x1
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.s, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i1> %a to <vscale x 2 x float>
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x float> @ucvtf_s_nxv2i32(<vscale x 2 x i32> %a) {
; CHECK-LABEL: ucvtf_s_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i32> %a to <vscale x 2 x float>
  ret <vscale x 2 x float> %res
}

define <vscale x 2 x float> @ucvtf_s_nxv2i64(<vscale x 2 x i64> %a) {
; CHECK-LABEL: ucvtf_s_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.s, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i64> %a to <vscale x 2 x float>
  ret <vscale x 2 x float> %res
}

define <vscale x 4 x float> @ucvtf_s_nxv4i1(<vscale x 4 x i1> %a) {
; CHECK-LABEL: ucvtf_s_nxv4i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.s, p0/z, #1 // =0x1
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    ucvtf z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 4 x i1> %a to <vscale x 4 x float>
  ret <vscale x 4 x float> %res
}

define <vscale x 4 x float> @ucvtf_s_nxv4i32(<vscale x 4 x i32> %a) {
; CHECK-LABEL: ucvtf_s_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    ucvtf z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 4 x i32> %a to <vscale x 4 x float>
  ret <vscale x 4 x float> %res
}

define <vscale x 2 x double> @ucvtf_d_nxv2i1(<vscale x 2 x i1> %a) {
; CHECK-LABEL: ucvtf_d_nxv2i1:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov z0.d, p0/z, #1 // =0x1
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i1> %a to <vscale x 2 x double>
  ret <vscale x 2 x double> %res
}

define <vscale x 2 x double> @ucvtf_d_nxv2i32(<vscale x 2 x i32> %a) {
; CHECK-LABEL: ucvtf_d_nxv2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.d, p0/m, z0.s
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i32> %a to <vscale x 2 x double>
  ret <vscale x 2 x double> %res
}

define <vscale x 2 x double> @ucvtf_d_nxv2i64(<vscale x 2 x i64> %a) {
; CHECK-LABEL: ucvtf_d_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    ucvtf z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %res = uitofp <vscale x 2 x i64> %a to <vscale x 2 x double>
  ret <vscale x 2 x double> %res
}
