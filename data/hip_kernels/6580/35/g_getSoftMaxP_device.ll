; ModuleID = '../data/hip_kernels/6580/35/main.cu'
source_filename = "../data/hip_kernels/6580/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_share = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13g_getSoftMaxPPfS_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %10
  %12 = sext i32 %5 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = getelementptr inbounds float, float addrspace(3)* %11, i32 %14
  store float 0.000000e+00, float addrspace(3)* %15, align 4, !tbaa !7
  %16 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %14
  store float -1.000000e+08, float addrspace(3)* %16, align 4, !tbaa !7
  %17 = mul i32 %14, %2
  %18 = add i32 %17, %5
  %19 = mul nsw i32 %3, %2
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %24, label %22

21:                                               ; preds = %24
  store float %33, float addrspace(3)* %16, align 4, !tbaa !7
  br label %22

22:                                               ; preds = %21, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = icmp eq i16 %9, 1
  br i1 %23, label %51, label %36

24:                                               ; preds = %4, %24
  %25 = phi float [ %33, %24 ], [ -1.000000e+08, %4 ]
  %26 = phi i32 [ %34, %24 ], [ %18, %4 ]
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %30 = getelementptr inbounds float, float addrspace(1)* %13, i64 %27
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %32 = fadd contract float %29, %31
  store float %32, float addrspace(1)* %30, align 4, !tbaa !7
  %33 = tail call float @llvm.maxnum.f32(float %25, float %32)
  %34 = add nsw i32 %26, %2
  %35 = icmp slt i32 %34, %19
  br i1 %35, label %24, label %21, !llvm.loop !11

36:                                               ; preds = %22, %49
  %37 = phi i32 [ %39, %49 ], [ %10, %22 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = add nsw i32 %37, 1
  %39 = ashr i32 %38, 1
  %40 = ashr i32 %37, 1
  %41 = icmp ult i32 %14, %40
  br i1 %41, label %42, label %49

42:                                               ; preds = %36
  %43 = load float, float addrspace(3)* %16, align 4, !tbaa !7
  %44 = add nsw i32 %39, %14
  %45 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %44
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %47 = fcmp contract olt float %43, %46
  br i1 %47, label %48, label %49

48:                                               ; preds = %42
  store float %46, float addrspace(3)* %16, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %42, %48, %36
  %50 = icmp eq i32 %39, 1
  br i1 %50, label %51, label %36, !llvm.loop !13

51:                                               ; preds = %49, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %52, label %56

52:                                               ; preds = %51
  %53 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 0), align 4, !tbaa !7
  %54 = load float, float addrspace(3)* %15, align 4, !tbaa !7
  br label %57

55:                                               ; preds = %57
  store float %65, float addrspace(3)* %15, align 4, !tbaa !7
  br label %56

56:                                               ; preds = %55, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %23, label %82, label %68

57:                                               ; preds = %52, %57
  %58 = phi float [ %54, %52 ], [ %65, %57 ]
  %59 = phi i32 [ %18, %52 ], [ %66, %57 ]
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %13, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fsub contract float %62, %53
  %64 = tail call float @llvm.exp.f32(float %63)
  store float %64, float addrspace(1)* %61, align 4, !tbaa !7
  %65 = fadd contract float %58, %64
  %66 = add nsw i32 %59, %2
  %67 = icmp slt i32 %66, %19
  br i1 %67, label %57, label %55, !llvm.loop !14

68:                                               ; preds = %56, %80
  %69 = phi i32 [ %71, %80 ], [ %10, %56 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = add nsw i32 %69, 1
  %71 = ashr i32 %70, 1
  %72 = ashr i32 %69, 1
  %73 = icmp ult i32 %14, %72
  br i1 %73, label %74, label %80

74:                                               ; preds = %68
  %75 = add nsw i32 %71, %14
  %76 = getelementptr inbounds float, float addrspace(3)* %11, i32 %75
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %78 = load float, float addrspace(3)* %15, align 4, !tbaa !7
  %79 = fadd contract float %77, %78
  store float %79, float addrspace(3)* %15, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %74, %68
  %81 = icmp eq i32 %71, 1
  br i1 %81, label %82, label %68, !llvm.loop !15

82:                                               ; preds = %80, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %83, label %85

83:                                               ; preds = %82
  %84 = load float, float addrspace(3)* %11, align 4, !tbaa !7
  br label %86

85:                                               ; preds = %86, %82
  ret void

86:                                               ; preds = %83, %86
  %87 = phi i32 [ %18, %83 ], [ %92, %86 ]
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %13, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = fdiv contract float %90, %84
  store float %91, float addrspace(1)* %89, align 4, !tbaa !7
  %92 = add nsw i32 %87, %2
  %93 = icmp slt i32 %92, %19
  br i1 %93, label %86, label %85, !llvm.loop !16
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
