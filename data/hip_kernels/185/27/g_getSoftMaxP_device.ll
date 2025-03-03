; ModuleID = '../data/hip_kernels/185/27/main.cu'
source_filename = "../data/hip_kernels/185/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_share = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13g_getSoftMaxPPfS_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %9
  %11 = mul nsw i32 %4, %2
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = getelementptr inbounds float, float addrspace(3)* %10, i32 %14
  store float 0.000000e+00, float addrspace(3)* %15, align 4, !tbaa !7
  %16 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %14
  store float -1.000000e+08, float addrspace(3)* %16, align 4, !tbaa !7
  %17 = icmp sgt i32 %2, 0
  br i1 %17, label %20, label %18

18:                                               ; preds = %33, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = icmp eq i16 %8, 1
  br i1 %19, label %52, label %37

20:                                               ; preds = %3, %33
  %21 = phi float [ %34, %33 ], [ -1.000000e+08, %3 ]
  %22 = phi i32 [ %35, %33 ], [ 0, %3 ]
  %23 = add i32 %22, %14
  %24 = icmp slt i32 %23, %2
  br i1 %24, label %25, label %33

25:                                               ; preds = %20
  %26 = sext i32 %23 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %29 = getelementptr inbounds float, float addrspace(1)* %13, i64 %26
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %31 = fadd contract float %28, %30
  store float %31, float addrspace(1)* %29, align 4, !tbaa !7
  %32 = tail call float @llvm.maxnum.f32(float %21, float %31)
  store float %32, float addrspace(3)* %16, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %25, %20
  %34 = phi float [ %32, %25 ], [ %21, %20 ]
  %35 = add i32 %22, %9
  %36 = icmp slt i32 %35, %2
  br i1 %36, label %20, label %18, !llvm.loop !11

37:                                               ; preds = %18, %50
  %38 = phi i32 [ %40, %50 ], [ %9, %18 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = add nsw i32 %38, 1
  %40 = ashr i32 %39, 1
  %41 = ashr i32 %38, 1
  %42 = icmp ult i32 %14, %41
  br i1 %42, label %43, label %50

43:                                               ; preds = %37
  %44 = load float, float addrspace(3)* %16, align 4, !tbaa !7
  %45 = add nsw i32 %40, %14
  %46 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %48 = fcmp contract olt float %44, %47
  br i1 %48, label %49, label %50

49:                                               ; preds = %43
  store float %47, float addrspace(3)* %16, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %43, %49, %37
  %51 = icmp eq i32 %40, 1
  br i1 %51, label %52, label %37, !llvm.loop !13

52:                                               ; preds = %50, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %17, label %54, label %53

53:                                               ; preds = %67, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %84, label %70

54:                                               ; preds = %52, %67
  %55 = phi i32 [ %68, %67 ], [ 0, %52 ]
  %56 = add i32 %55, %14
  %57 = icmp slt i32 %56, %2
  br i1 %57, label %58, label %67

58:                                               ; preds = %54
  %59 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 0), align 4, !tbaa !7
  %60 = sext i32 %56 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %13, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fsub contract float %62, %59
  %64 = tail call float @llvm.exp.f32(float %63)
  store float %64, float addrspace(1)* %61, align 4, !tbaa !7
  %65 = load float, float addrspace(3)* %15, align 4, !tbaa !7
  %66 = fadd contract float %65, %64
  store float %66, float addrspace(3)* %15, align 4, !tbaa !7
  br label %67

67:                                               ; preds = %58, %54
  %68 = add i32 %55, %9
  %69 = icmp slt i32 %68, %2
  br i1 %69, label %54, label %53, !llvm.loop !14

70:                                               ; preds = %53, %82
  %71 = phi i32 [ %73, %82 ], [ %9, %53 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = add nsw i32 %71, 1
  %73 = ashr i32 %72, 1
  %74 = ashr i32 %71, 1
  %75 = icmp ult i32 %14, %74
  br i1 %75, label %76, label %82

76:                                               ; preds = %70
  %77 = add nsw i32 %73, %14
  %78 = getelementptr inbounds float, float addrspace(3)* %10, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !7
  %80 = load float, float addrspace(3)* %15, align 4, !tbaa !7
  %81 = fadd contract float %79, %80
  store float %81, float addrspace(3)* %15, align 4, !tbaa !7
  br label %82

82:                                               ; preds = %76, %70
  %83 = icmp eq i32 %73, 1
  br i1 %83, label %84, label %70, !llvm.loop !15

84:                                               ; preds = %82, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %17, label %86, label %85

85:                                               ; preds = %96, %84
  ret void

86:                                               ; preds = %84, %96
  %87 = phi i32 [ %97, %96 ], [ 0, %84 ]
  %88 = add i32 %87, %14
  %89 = icmp slt i32 %88, %2
  br i1 %89, label %90, label %96

90:                                               ; preds = %86
  %91 = load float, float addrspace(3)* %10, align 4, !tbaa !7
  %92 = sext i32 %88 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %13, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = fdiv contract float %94, %91
  store float %95, float addrspace(1)* %93, align 4, !tbaa !7
  br label %96

96:                                               ; preds = %90, %86
  %97 = add i32 %87, %9
  %98 = icmp slt i32 %97, %2
  br i1 %98, label %86, label %85, !llvm.loop !16
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
