; ModuleID = '../data/hip_kernels/1538/83/main.cu'
source_filename = "../data/hip_kernels/1538/83/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24computeScoreGradientListPfS_S_PiS0_S0_iPdS1_S1_iS1_S1_diS1_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, i32 %10, double addrspace(1)* nocapture readonly %11, double addrspace(1)* nocapture readonly %12, double %13, i32 %14, double addrspace(1)* nocapture writeonly %15) local_unnamed_addr #0 {
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 4, !tbaa !6
  %25 = udiv i32 %24, %21
  %26 = mul i32 %25, %21
  %27 = icmp ugt i32 %24, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %21
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = icmp slt i32 %31, 6
  br i1 %32, label %33, label %118

33:                                               ; preds = %16
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %35 = mul i32 %34, %21
  %36 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %37 = add i32 %35, %36
  %38 = mul nsw i32 %31, %6
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %15, i64 %39
  %41 = mul nsw i32 %31, %14
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %12, i64 %42
  %44 = mul nsw i32 %14, 6
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %43, i64 %45
  %47 = getelementptr inbounds double, double addrspace(1)* %46, i64 %45
  %48 = icmp slt i32 %37, %6
  br i1 %48, label %49, label %118

49:                                               ; preds = %33, %71
  %50 = phi i32 [ %74, %71 ], [ %37, %33 ]
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !5
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !20, !amdgpu.noclobber !5
  %57 = fpext float %56 to double
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !20, !amdgpu.noclobber !5
  %60 = fpext float %59 to double
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !20, !amdgpu.noclobber !5
  %63 = fpext float %62 to double
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %51
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !5
  %66 = add nsw i32 %50, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !5
  %70 = icmp slt i32 %65, %69
  br i1 %70, label %76, label %71

71:                                               ; preds = %114, %49
  %72 = phi double [ 0.000000e+00, %49 ], [ %115, %114 ]
  %73 = getelementptr inbounds double, double addrspace(1)* %40, i64 %51
  store double %72, double addrspace(1)* %73, align 8, !tbaa !22
  %74 = add nsw i32 %50, %30
  %75 = icmp slt i32 %74, %6
  br i1 %75, label %49, label %118, !llvm.loop !24

76:                                               ; preds = %49, %114
  %77 = phi i32 [ %116, %114 ], [ %65, %49 ]
  %78 = phi double [ %115, %114 ], [ 0.000000e+00, %49 ]
  %79 = sext i32 %77 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %11, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !22
  %82 = fcmp contract ogt double %81, 1.000000e+00
  %83 = fcmp contract olt double %81, 0.000000e+00
  %84 = or i1 %82, %83
  %85 = fcmp contract uno double %81, 0.000000e+00
  %86 = or i1 %85, %84
  br i1 %86, label %114, label %87

87:                                               ; preds = %76
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %79
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !16, !amdgpu.noclobber !5
  %90 = fmul contract double %81, %13
  %91 = sext i32 %89 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %7, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !22
  %94 = fsub contract double %57, %93
  %95 = getelementptr inbounds double, double addrspace(1)* %43, i64 %79
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !22
  %97 = fmul contract double %94, %96
  %98 = getelementptr inbounds double, double addrspace(1)* %8, i64 %91
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !22
  %100 = fsub contract double %60, %99
  %101 = getelementptr inbounds double, double addrspace(1)* %46, i64 %79
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !22
  %103 = fmul contract double %100, %102
  %104 = fadd contract double %97, %103
  %105 = getelementptr inbounds double, double addrspace(1)* %9, i64 %91
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !22
  %107 = fsub contract double %63, %106
  %108 = getelementptr inbounds double, double addrspace(1)* %47, i64 %79
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !22
  %110 = fmul contract double %107, %109
  %111 = fadd contract double %104, %110
  %112 = fmul contract double %90, %111
  %113 = fadd contract double %78, %112
  br label %114

114:                                              ; preds = %87, %76
  %115 = phi double [ %78, %76 ], [ %113, %87 ]
  %116 = add nsw i32 %77, 1
  %117 = icmp slt i32 %116, %69
  br i1 %117, label %76, label %71, !llvm.loop !26

118:                                              ; preds = %71, %33, %16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"double", !18, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
