; ModuleID = '../data/hip_kernels/5686/1/main.cu'
source_filename = "../data/hip_kernels/5686/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16dotProductSinglePiPfPmmmS0_E5value = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16
@_ZZ16dotProductSinglePiPfPmmmS0_E10jumpLength = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ16dotProductSinglePiPfPmmmS0_E4size = internal unnamed_addr addrspace(3) global i64 undef, align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16dotProductSinglePiPfPmmmS0_(i32 addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = sext i32 %7 to i64
  %10 = icmp ult i64 %9, %3
  br i1 %10, label %11, label %77

11:                                               ; preds = %6
  %12 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16dotProductSinglePiPfPmmmS0_E5value, i32 0, i32 %8
  %13 = icmp eq i32 %8, 0
  %14 = trunc i64 %4 to i32
  %15 = zext i32 %8 to i64
  %16 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !7
  %24 = lshr i32 %20, 1
  %25 = icmp ult i16 %19, 2
  %26 = udiv i32 %23, %20
  %27 = mul i32 %26, %20
  %28 = icmp ugt i32 %23, %27
  %29 = zext i1 %28 to i32
  br label %30

30:                                               ; preds = %11, %70
  %31 = phi i64 [ %9, %11 ], [ %75, %70 ]
  %32 = trunc i64 %31 to i32
  store float 0.000000e+00, float addrspace(3)* %12, align 4, !tbaa !16
  br i1 %13, label %33, label %37

33:                                               ; preds = %30
  %34 = mul i32 %32, %14
  store i32 %34, i32 addrspace(3)* @_ZZ16dotProductSinglePiPfPmmmS0_E10jumpLength, align 4, !tbaa !20
  %35 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %31
  %36 = load i64, i64 addrspace(1)* %35, align 8, !tbaa !22
  store i64 %36, i64 addrspace(3)* @_ZZ16dotProductSinglePiPfPmmmS0_E4size, align 8, !tbaa !22
  br label %37

37:                                               ; preds = %33, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = load i64, i64 addrspace(3)* @_ZZ16dotProductSinglePiPfPmmmS0_E4size, align 8, !tbaa !22
  %39 = icmp ugt i64 %38, %15
  br i1 %39, label %40, label %56

40:                                               ; preds = %37
  %41 = load i32, i32 addrspace(3)* @_ZZ16dotProductSinglePiPfPmmmS0_E10jumpLength, align 4, !tbaa !20
  %42 = load float, float addrspace(3)* %12, align 4, !tbaa !16
  br label %43

43:                                               ; preds = %40, %43
  %44 = phi float [ %42, %40 ], [ %51, %43 ]
  %45 = phi i32 [ %8, %40 ], [ %52, %43 ]
  %46 = add nsw i32 %41, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  %50 = fmul contract float %49, %49
  %51 = fadd contract float %44, %50
  %52 = add i32 %45, %20
  %53 = sext i32 %52 to i64
  %54 = icmp ugt i64 %38, %53
  br i1 %54, label %43, label %55, !llvm.loop !24

55:                                               ; preds = %43
  store float %51, float addrspace(3)* %12, align 4, !tbaa !16
  br label %56

56:                                               ; preds = %55, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %25, label %70, label %57

57:                                               ; preds = %56, %66
  %58 = phi i32 [ %67, %66 ], [ %24, %56 ]
  %59 = icmp ult i32 %8, %58
  br i1 %59, label %60, label %66

60:                                               ; preds = %57
  %61 = add nsw i32 %58, %8
  %62 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ16dotProductSinglePiPfPmmmS0_E5value, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !16
  %64 = load float, float addrspace(3)* %12, align 4, !tbaa !16
  %65 = fadd contract float %63, %64
  store float %65, float addrspace(3)* %12, align 4, !tbaa !16
  br label %66

66:                                               ; preds = %60, %57
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = sdiv i32 %58, 2
  %68 = add nsw i32 %58, 1
  %69 = icmp ult i32 %68, 3
  br i1 %69, label %70, label %57, !llvm.loop !26

70:                                               ; preds = %66, %56
  %71 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ16dotProductSinglePiPfPmmmS0_E5value, i32 0, i32 0), align 16, !tbaa !16
  %72 = getelementptr inbounds float, float addrspace(1)* %5, i64 %31
  store float %71, float addrspace(1)* %72, align 4, !tbaa !16
  %73 = add i32 %26, %32
  %74 = add i32 %73, %29
  %75 = sext i32 %74 to i64
  %76 = icmp ult i64 %75, %3
  br i1 %76, label %30, label %77, !llvm.loop !27

77:                                               ; preds = %70, %6
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"long", !18, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
!27 = distinct !{!27, !25}
