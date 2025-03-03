; ModuleID = '../data/hip_kernels/121/94/main.cu'
source_filename = "../data/hip_kernels/121/94/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22kBesselRatioActivationPfS_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %15, %2
  br i1 %22, label %24, label %23

23:                                               ; preds = %99, %3
  ret void

24:                                               ; preds = %3, %99
  %25 = phi i32 [ %106, %99 ], [ %15, %3 ]
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16
  %29 = tail call float @llvm.fabs.f32(float %28)
  %30 = fcmp olt float %29, 8.000000e+00
  br i1 %30, label %31, label %60

31:                                               ; preds = %24
  %32 = fmul float %29, 5.000000e-01
  %33 = fmul float %32, %32
  %34 = tail call float @llvm.fmuladd.f32(float %33, float 0x3D7882DD20000000, float 0x3DCAF97F60000000)
  %35 = tail call float @llvm.fmuladd.f32(float %33, float %34, float 0x3E366A3EA0000000)
  %36 = tail call float @llvm.fmuladd.f32(float %33, float %35, float 0x3E9251B320000000)
  %37 = tail call float @llvm.fmuladd.f32(float %33, float %36, float 0x3EE84CBB60000000)
  %38 = tail call float @llvm.fmuladd.f32(float %33, float %37, float 0x3F36C0D4A0000000)
  %39 = tail call float @llvm.fmuladd.f32(float %33, float %38, float 0x3F7C71D3A0000000)
  %40 = tail call float @llvm.fmuladd.f32(float %33, float %39, float 0x3FB5555500000000)
  %41 = tail call float @llvm.fmuladd.f32(float %33, float %40, float 5.000000e-01)
  %42 = fmul float %32, %41
  %43 = tail call float @llvm.fmuladd.f32(float %33, float %42, float %32)
  %44 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 515)
  %45 = select i1 %44, float %32, float %43
  %46 = tail call float @llvm.copysign.f32(float %45, float %28)
  %47 = fmul float %29, 2.500000e-01
  %48 = fmul float %29, %47
  %49 = tail call float @llvm.fmuladd.f32(float %48, float 0x3D438D7600000000, float 0x3D97FD5C60000000)
  %50 = tail call float @llvm.fmuladd.f32(float %48, float %49, float 0x3E066FFC80000000)
  %51 = tail call float @llvm.fmuladd.f32(float %48, float %50, float 0x3E64ECB6E0000000)
  %52 = tail call float @llvm.fmuladd.f32(float %48, float %51, float 0x3EC033C700000000)
  %53 = tail call float @llvm.fmuladd.f32(float %48, float %52, float 0x3F1233BB20000000)
  %54 = tail call float @llvm.fmuladd.f32(float %48, float %53, float 0x3F5C71DB20000000)
  %55 = tail call float @llvm.fmuladd.f32(float %48, float %54, float 0x3F9C71C5E0000000)
  %56 = tail call float @llvm.fmuladd.f32(float %48, float %55, float 2.500000e-01)
  %57 = tail call float @llvm.fmuladd.f32(float %48, float %56, float 1.000000e+00)
  %58 = tail call float @llvm.fmuladd.f32(float %48, float %57, float 1.000000e+00)
  %59 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 515)
  br label %99

60:                                               ; preds = %24
  %61 = tail call float @llvm.amdgcn.rcp.f32(float %29)
  %62 = tail call float @llvm.fmuladd.f32(float %61, float 0xBFE06DE320000000, float 0x3FA043B220000000)
  %63 = tail call float @llvm.fmuladd.f32(float %61, float %62, float 0xBFA9252760000000)
  %64 = tail call float @llvm.fmuladd.f32(float %61, float %63, float 0xBFA7C15C80000000)
  %65 = tail call float @llvm.fmuladd.f32(float %61, float %64, float 0xBFC3266CC0000000)
  %66 = tail call float @llvm.fmuladd.f32(float %61, float %65, float 0x3FD9884560000000)
  %67 = fadd float %29, -8.800000e+01
  %68 = fcmp ogt float %29, 8.800000e+01
  %69 = select i1 %68, float %67, float %29
  %70 = fmul float %69, 0x3FF7154760000000
  %71 = tail call float @llvm.rint.f32(float %70)
  %72 = fcmp ogt float %69, 0x40562E4300000000
  %73 = fcmp olt float %69, 0xC059D1DA00000000
  %74 = fneg float %70
  %75 = tail call float @llvm.fma.f32(float %69, float 0x3FF7154760000000, float %74)
  %76 = tail call float @llvm.fma.f32(float %69, float 0x3E54AE0BE0000000, float %75)
  %77 = fsub float %70, %71
  %78 = fadd float %76, %77
  %79 = tail call float @llvm.exp2.f32(float %78)
  %80 = fptosi float %71 to i32
  %81 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 %80)
  %82 = select i1 %73, float 0.000000e+00, float %81
  %83 = select i1 %72, float 0x7FF0000000000000, float %82
  %84 = select i1 %68, float 0x47DF1056E0000000, float 1.000000e+00
  %85 = tail call float @llvm.amdgcn.rsq.f32(float %29)
  %86 = fmul float %85, %83
  %87 = fmul float %66, %86
  %88 = fmul float %84, %87
  %89 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 515)
  %90 = select i1 %89, float %29, float %88
  %91 = tail call float @llvm.copysign.f32(float %90, float %28)
  %92 = tail call float @llvm.fmuladd.f32(float %61, float 0x3FDC499160000000, float 0xBFA110F5E0000000)
  %93 = tail call float @llvm.fmuladd.f32(float %61, float %92, float 0x3FA2A130A0000000)
  %94 = tail call float @llvm.fmuladd.f32(float %61, float %93, float 0x3F9C687020000000)
  %95 = tail call float @llvm.fmuladd.f32(float %61, float %94, float 0x3FA9890AE0000000)
  %96 = tail call float @llvm.fmuladd.f32(float %61, float %95, float 0x3FD9884500000000)
  %97 = fmul float %96, %86
  %98 = fmul float %84, %97
  br label %99

99:                                               ; preds = %31, %60
  %100 = phi i1 [ %59, %31 ], [ %89, %60 ]
  %101 = phi float [ %46, %31 ], [ %91, %60 ]
  %102 = phi float [ %58, %31 ], [ %98, %60 ]
  %103 = select i1 %100, float %29, float %102
  %104 = fdiv contract float %101, %103
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %104, float addrspace(1)* %105, align 4, !tbaa !16
  %106 = add i32 %25, %21
  %107 = icmp ult i32 %106, %2
  br i1 %107, label %24, label %23, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rsq.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
