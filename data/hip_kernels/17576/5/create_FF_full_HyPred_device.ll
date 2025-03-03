; ModuleID = '../data/hip_kernels/17576/5/main.cu'
source_filename = "../data/hip_kernels/17576/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21create_FF_full_HyPredPfS_fS_PiS_iiiiE5FF_pt = internal unnamed_addr addrspace(3) global [7 x float] undef, align 16
@_ZZ21create_FF_full_HyPredPfS_fS_PiS_iiiiE9hydration = internal unnamed_addr addrspace(3) global [10 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21create_FF_full_HyPredPfS_fS_PiS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp slt i32 %11, %6
  br i1 %12, label %13, label %34

13:                                               ; preds = %10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = icmp sgt i32 %14, %7
  %16 = add nsw i32 %7, 1
  %17 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = icmp ult i32 %14, 10
  %21 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ21create_FF_full_HyPredPfS_fS_PiS_iiiiE5FF_pt, i32 0, i32 %7
  %22 = icmp slt i32 %14, %8
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !5
  %26 = load i16, i16 addrspace(4)* %19, align 4, !range !14, !invariant.load !15
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %25, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %25, %29
  %31 = zext i1 %30 to i32
  %32 = zext i16 %26 to i32
  %33 = zext i16 %26 to i32
  br label %35

34:                                               ; preds = %65, %10
  ret void

35:                                               ; preds = %13, %65
  %36 = phi i32 [ %11, %13 ], [ %67, %65 ]
  br i1 %15, label %48, label %37

37:                                               ; preds = %35
  %38 = mul nsw i32 %36, %16
  br label %39

39:                                               ; preds = %37, %39
  %40 = phi i32 [ %14, %37 ], [ %46, %39 ]
  %41 = add nsw i32 %40, %38
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !16
  %45 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ21create_FF_full_HyPredPfS_fS_PiS_iiiiE5FF_pt, i32 0, i32 %40
  store float %44, float addrspace(3)* %45, align 4, !tbaa !16
  %46 = add i32 %40, %32
  %47 = icmp sgt i32 %46, %7
  br i1 %47, label %48, label %39, !llvm.loop !20

48:                                               ; preds = %39, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %49, label %51

49:                                               ; preds = %48
  %50 = load float, float addrspace(3)* %21, align 4, !tbaa !16
  br label %55

51:                                               ; preds = %55, %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %52, label %65

52:                                               ; preds = %51
  %53 = mul nsw i32 %36, %9
  %54 = load float, float addrspace(3)* getelementptr inbounds ([7 x float], [7 x float] addrspace(3)* @_ZZ21create_FF_full_HyPredPfS_fS_PiS_iiiiE5FF_pt, i32 0, i32 0), align 16
  br label %69

55:                                               ; preds = %49, %55
  %56 = phi i32 [ %14, %49 ], [ %63, %55 ]
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %3, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = fmul contract float %59, %2
  %61 = fmul contract float %60, %50
  %62 = getelementptr inbounds [10 x float], [10 x float] addrspace(3)* @_ZZ21create_FF_full_HyPredPfS_fS_PiS_iiiiE9hydration, i32 0, i32 %56
  store float %61, float addrspace(3)* %62, align 4, !tbaa !16
  %63 = add nuw nsw i32 %56, %33
  %64 = icmp ult i32 %63, 10
  br i1 %64, label %55, label %51, !llvm.loop !22

65:                                               ; preds = %85, %51
  %66 = add i32 %28, %36
  %67 = add i32 %66, %31
  %68 = icmp slt i32 %67, %6
  br i1 %68, label %35, label %34, !llvm.loop !23

69:                                               ; preds = %52, %85
  %70 = phi i32 [ %14, %52 ], [ %94, %85 ]
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !24
  %74 = icmp sgt i32 %73, 5
  br i1 %74, label %75, label %79

75:                                               ; preds = %69
  %76 = add nsw i32 %70, %53
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %5, i64 %77
  store float %54, float addrspace(1)* %78, align 4, !tbaa !16
  br label %85

79:                                               ; preds = %69
  %80 = getelementptr inbounds [7 x float], [7 x float] addrspace(3)* @_ZZ21create_FF_full_HyPredPfS_fS_PiS_iiiiE5FF_pt, i32 0, i32 %73
  %81 = load float, float addrspace(3)* %80, align 4, !tbaa !16
  %82 = add nsw i32 %70, %53
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %5, i64 %83
  store float %81, float addrspace(1)* %84, align 4, !tbaa !16
  br label %85

85:                                               ; preds = %79, %75
  %86 = phi float [ %81, %79 ], [ %54, %75 ]
  %87 = phi float addrspace(1)* [ %84, %79 ], [ %78, %75 ]
  %88 = getelementptr inbounds [10 x float], [10 x float] addrspace(3)* @_ZZ21create_FF_full_HyPredPfS_fS_PiS_iiiiE9hydration, i32 0, i32 %73
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !16
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16
  %92 = fmul contract float %89, %91
  %93 = fadd contract float %86, %92
  store float %93, float addrspace(1)* %87, align 4, !tbaa !16
  %94 = add i32 %70, %27
  %95 = icmp slt i32 %94, %8
  br i1 %95, label %69, label %65, !llvm.loop !26
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !18, i64 0}
!26 = distinct !{!26, !21}
