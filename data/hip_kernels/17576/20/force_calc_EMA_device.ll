; ModuleID = '../data/hip_kernels/17576/20/main.cu'
source_filename = "../data/hip_kernels/17576/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14force_calc_EMAPfPdiiS_S_S_iiPidf(float addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, i32 %7, i32 %8, i32 addrspace(1)* nocapture readonly %9, double %10, float %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = icmp ult i32 %13, %2
  %15 = icmp slt i32 %13, %2
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %119

17:                                               ; preds = %12
  %18 = sdiv i32 %8, 2
  %19 = icmp sgt i32 %8, 1
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %21 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = icmp eq i32 %20, 0
  %25 = fadd contract double %10, -1.000000e+00
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !4
  %29 = load i16, i16 addrspace(4)* %23, align 4, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = udiv i32 %28, %30
  %32 = mul i32 %31, %30
  %33 = icmp ugt i32 %28, %32
  %34 = zext i1 %33 to i32
  br label %35

35:                                               ; preds = %17, %115
  %36 = phi i32 [ %13, %17 ], [ %117, %115 ]
  br i1 %19, label %38, label %37

37:                                               ; preds = %43, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %70, label %115

38:                                               ; preds = %35, %43
  %39 = phi i32 [ %44, %43 ], [ %18, %35 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp slt i32 %20, %39
  br i1 %40, label %41, label %43

41:                                               ; preds = %38
  %42 = mul nsw i32 %39, %7
  br label %46

43:                                               ; preds = %46, %38
  %44 = ashr i32 %39, 1
  %45 = icmp sgt i32 %39, 1
  br i1 %45, label %38, label %37, !llvm.loop !15

46:                                               ; preds = %41, %46
  %47 = phi i32 [ %20, %41 ], [ %68, %46 ]
  %48 = mul nsw i32 %47, %7
  %49 = add nsw i32 %48, %36
  %50 = add nsw i32 %49, %42
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !17
  %54 = sext i32 %49 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !17
  %57 = fadd contract float %53, %56
  store float %57, float addrspace(1)* %55, align 4, !tbaa !17
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !17
  %60 = getelementptr inbounds float, float addrspace(1)* %5, i64 %54
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !17
  %62 = fadd contract float %59, %61
  store float %62, float addrspace(1)* %60, align 4, !tbaa !17
  %63 = getelementptr inbounds float, float addrspace(1)* %6, i64 %51
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !17
  %65 = getelementptr inbounds float, float addrspace(1)* %6, i64 %54
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !17
  %67 = fadd contract float %64, %66
  store float %67, float addrspace(1)* %65, align 4, !tbaa !17
  %68 = add nsw i32 %47, %30
  %69 = icmp slt i32 %68, %39
  br i1 %69, label %46, label %43, !llvm.loop !21

70:                                               ; preds = %37
  %71 = sext i32 %36 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !22
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %115, label %75

75:                                               ; preds = %70
  %76 = mul nsw i32 %36, 3
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %1, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !24
  %80 = fmul contract double %25, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %4, i64 %71
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !17
  %83 = fpext float %82 to double
  %84 = fsub contract double %80, %83
  %85 = fdiv contract double %84, %10
  store double %85, double addrspace(1)* %78, align 8, !tbaa !24
  %86 = add nsw i32 %76, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %1, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !24
  %90 = fmul contract double %25, %89
  %91 = getelementptr inbounds float, float addrspace(1)* %5, i64 %71
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !17
  %93 = fpext float %92 to double
  %94 = fsub contract double %90, %93
  %95 = fdiv contract double %94, %10
  store double %95, double addrspace(1)* %88, align 8, !tbaa !24
  %96 = add nsw i32 %76, 2
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %1, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !24
  %100 = fmul contract double %25, %99
  %101 = getelementptr inbounds float, float addrspace(1)* %6, i64 %71
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !17
  %103 = fpext float %102 to double
  %104 = fsub contract double %100, %103
  %105 = fdiv contract double %104, %10
  store double %105, double addrspace(1)* %98, align 8, !tbaa !24
  %106 = fptrunc double %85 to float
  %107 = fmul contract float %106, %11
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  store float %107, float addrspace(1)* %108, align 4, !tbaa !17
  %109 = fptrunc double %95 to float
  %110 = fmul contract float %109, %11
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %110, float addrspace(1)* %111, align 4, !tbaa !17
  %112 = fptrunc double %105 to float
  %113 = fmul contract float %112, %11
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  store float %113, float addrspace(1)* %114, align 4, !tbaa !17
  br label %115

115:                                              ; preds = %70, %75, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %116 = add i32 %31, %36
  %117 = add i32 %116, %34
  %118 = icmp slt i32 %117, %2
  br i1 %118, label %35, label %119, !llvm.loop !26

119:                                              ; preds = %115, %12
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = distinct !{!21, !16}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !19, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"double", !19, i64 0}
!26 = distinct !{!26, !16}
