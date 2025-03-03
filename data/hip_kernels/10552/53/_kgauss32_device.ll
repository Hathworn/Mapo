; ModuleID = '../data/hip_kernels/10552/53/main.cu'
source_filename = "../data/hip_kernels/10552/53/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9_kgauss32iiPfPiS0_S_S0_S0_fS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, float %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %12, %17
  %22 = add i32 %21, %11
  %23 = mul nsw i32 %22, %0
  %24 = add nsw i32 %23, %0
  %25 = icmp slt i32 %22, %1
  br i1 %25, label %26, label %112

26:                                               ; preds = %10
  %27 = add nsw i32 %23, -1
  %28 = icmp sgt i32 %0, 0
  %29 = fneg contract float %8
  %30 = udiv i32 %20, %17
  %31 = mul i32 %30, %17
  %32 = icmp ugt i32 %20, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %17
  br label %36

36:                                               ; preds = %26, %109
  %37 = phi i32 [ %22, %26 ], [ %110, %109 ]
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !6
  %41 = add nsw i32 %37, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !16, !amdgpu.noclobber !6
  %45 = add nsw i32 %44, -1
  %46 = icmp slt i32 %40, %44
  br i1 %46, label %47, label %49

47:                                               ; preds = %36
  %48 = add nsw i32 %40, -1
  br label %50

49:                                               ; preds = %84, %36
  br i1 %28, label %87, label %109

50:                                               ; preds = %47, %84
  %51 = phi i32 [ %85, %84 ], [ %48, %47 ]
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !16, !amdgpu.noclobber !6
  %55 = add nsw i32 %54, -1
  %56 = getelementptr inbounds float, float addrspace(1)* %5, i64 %52
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !20
  %58 = sext i32 %55 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %58
  %60 = bitcast i32 addrspace(1)* %59 to <2 x i32> addrspace(1)*
  %61 = load <2 x i32>, <2 x i32> addrspace(1)* %60, align 4, !tbaa !16
  %62 = extractelement <2 x i32> %61, i64 1
  %63 = add nsw i32 %62, -1
  %64 = extractelement <2 x i32> %61, i64 0
  %65 = icmp slt i32 %64, %62
  br i1 %65, label %66, label %84

66:                                               ; preds = %50
  %67 = add nsw i32 %64, -1
  br label %68

68:                                               ; preds = %66, %68
  %69 = phi i32 [ %82, %68 ], [ %67, %66 ]
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !6
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !20
  %75 = fsub contract float %74, %57
  %76 = fmul contract float %75, %75
  %77 = add i32 %27, %72
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %9, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !20
  %81 = fadd contract float %80, %76
  store float %81, float addrspace(1)* %79, align 4, !tbaa !20
  %82 = add nsw i32 %69, 1
  %83 = icmp slt i32 %82, %63
  br i1 %83, label %68, label %84, !llvm.loop !22

84:                                               ; preds = %68, %50
  %85 = add nsw i32 %51, 1
  %86 = icmp slt i32 %85, %45
  br i1 %86, label %50, label %49, !llvm.loop !24

87:                                               ; preds = %49, %87
  %88 = phi i32 [ %107, %87 ], [ %23, %49 ]
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %9, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !20
  %92 = fmul contract float %91, %29
  %93 = fmul float %92, 0x3FF7154760000000
  %94 = tail call float @llvm.rint.f32(float %93)
  %95 = fcmp ogt float %92, 0x40562E4300000000
  %96 = fcmp olt float %92, 0xC059D1DA00000000
  %97 = fneg float %93
  %98 = tail call float @llvm.fma.f32(float %92, float 0x3FF7154760000000, float %97)
  %99 = tail call float @llvm.fma.f32(float %92, float 0x3E54AE0BE0000000, float %98)
  %100 = fsub float %93, %94
  %101 = fadd float %99, %100
  %102 = tail call float @llvm.exp2.f32(float %101)
  %103 = fptosi float %94 to i32
  %104 = tail call float @llvm.amdgcn.ldexp.f32(float %102, i32 %103)
  %105 = select i1 %96, float 0.000000e+00, float %104
  %106 = select i1 %95, float 0x7FF0000000000000, float %105
  store float %106, float addrspace(1)* %90, align 4, !tbaa !20
  %107 = add nsw i32 %88, 1
  %108 = icmp slt i32 %107, %24
  br i1 %108, label %87, label %109, !llvm.loop !25

109:                                              ; preds = %87, %49
  %110 = add i32 %35, %37
  %111 = icmp slt i32 %110, %1
  br i1 %111, label %36, label %112, !llvm.loop !26

112:                                              ; preds = %109, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !23}
