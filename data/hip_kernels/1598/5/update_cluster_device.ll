; ModuleID = '../data/hip_kernels/1598/5/main.cu'
source_filename = "../data/hip_kernels/1598/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14update_clusterPiPfS0_S0_S0_iiiS0_S0_S0_S0_(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture %10, float addrspace(1)* nocapture %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = sdiv i32 %5, %6
  %23 = mul i32 %22, %20
  %24 = zext i32 %21 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %11, i64 %24
  store float 0.000000e+00, float addrspace(1)* %25, align 4, !tbaa !7
  %26 = getelementptr inbounds float, float addrspace(1)* %8, i64 %24
  store float 0.000000e+00, float addrspace(1)* %26, align 4, !tbaa !7
  %27 = getelementptr inbounds float, float addrspace(1)* %9, i64 %24
  store float 0.000000e+00, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds float, float addrspace(1)* %10, i64 %24
  store float 0.000000e+00, float addrspace(1)* %28, align 4, !tbaa !7
  %29 = icmp ult i32 %20, %5
  br i1 %29, label %30, label %127

30:                                               ; preds = %12
  %31 = add nsw i32 %23, %22
  %32 = add nsw i32 %6, -1
  %33 = icmp eq i32 %20, %32
  %34 = mul nsw i32 %22, %32
  %35 = select i1 %33, i32 %34, i32 %23
  %36 = select i1 %33, i32 %5, i32 %31
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %47, label %38

38:                                               ; preds = %68, %30
  %39 = phi float [ 0.000000e+00, %30 ], [ %69, %68 ]
  %40 = phi float [ 0.000000e+00, %30 ], [ %70, %68 ]
  %41 = phi float [ 0.000000e+00, %30 ], [ %71, %68 ]
  %42 = phi float [ 0.000000e+00, %30 ], [ %72, %68 ]
  store float %39, float addrspace(1)* %25, align 4, !tbaa !7
  store float %40, float addrspace(1)* %26, align 4, !tbaa !7
  store float %41, float addrspace(1)* %27, align 4, !tbaa !7
  store float %42, float addrspace(1)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp ugt i16 %17, 1
  br i1 %43, label %44, label %75

44:                                               ; preds = %38
  %45 = add nsw i32 %13, 1
  %46 = mul nsw i32 %45, %6
  br label %77

47:                                               ; preds = %30, %68
  %48 = phi i32 [ %73, %68 ], [ %35, %30 ]
  %49 = phi float [ %72, %68 ], [ 0.000000e+00, %30 ]
  %50 = phi float [ %71, %68 ], [ 0.000000e+00, %30 ]
  %51 = phi float [ %70, %68 ], [ 0.000000e+00, %30 ]
  %52 = phi float [ %69, %68 ], [ 0.000000e+00, %30 ]
  %53 = sext i32 %48 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !11, !amdgpu.noclobber !5
  %56 = icmp eq i32 %55, %13
  br i1 %56, label %57, label %68

57:                                               ; preds = %47
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fadd contract float %51, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fadd contract float %50, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %53
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = fadd contract float %49, %65
  %67 = fadd contract float %52, 1.000000e+00
  br label %68

68:                                               ; preds = %47, %57
  %69 = phi float [ %67, %57 ], [ %52, %47 ]
  %70 = phi float [ %60, %57 ], [ %51, %47 ]
  %71 = phi float [ %63, %57 ], [ %50, %47 ]
  %72 = phi float [ %66, %57 ], [ %49, %47 ]
  %73 = add nsw i32 %48, 1
  %74 = icmp slt i32 %73, %36
  br i1 %74, label %47, label %38, !llvm.loop !13

75:                                               ; preds = %104, %38
  %76 = icmp eq i32 %20, 0
  br i1 %76, label %106, label %127

77:                                               ; preds = %44, %104
  %78 = phi i32 [ 1, %44 ], [ %79, %104 ]
  %79 = shl i32 %78, 1
  %80 = add i32 %79, -1
  %81 = and i32 %80, %21
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %104

83:                                               ; preds = %77
  %84 = add i32 %78, %21
  %85 = icmp ugt i32 %84, %46
  br i1 %85, label %104, label %86

86:                                               ; preds = %83
  %87 = zext i32 %84 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %11, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %91 = fadd contract float %89, %90
  store float %91, float addrspace(1)* %25, align 4, !tbaa !7
  %92 = getelementptr inbounds float, float addrspace(1)* %8, i64 %87
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7
  %94 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %95 = fadd contract float %93, %94
  store float %95, float addrspace(1)* %26, align 4, !tbaa !7
  %96 = getelementptr inbounds float, float addrspace(1)* %9, i64 %87
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %99 = fadd contract float %97, %98
  store float %99, float addrspace(1)* %27, align 4, !tbaa !7
  %100 = getelementptr inbounds float, float addrspace(1)* %10, i64 %87
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %103 = fadd contract float %101, %102
  store float %103, float addrspace(1)* %28, align 4, !tbaa !7
  br label %104

104:                                              ; preds = %86, %83, %77
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = icmp ult i32 %79, %18
  br i1 %105, label %77, label %75, !llvm.loop !15

106:                                              ; preds = %75
  %107 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %108 = fcmp contract une float %107, 0.000000e+00
  br i1 %108, label %109, label %127

109:                                              ; preds = %106
  %110 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %111 = fdiv contract float %110, %107
  %112 = mul nsw i32 %13, 3
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  store float %111, float addrspace(1)* %114, align 4, !tbaa !7
  %115 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %116 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %117 = fdiv contract float %115, %116
  %118 = add nsw i32 %112, 1
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  store float %117, float addrspace(1)* %120, align 4, !tbaa !7
  %121 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %122 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %123 = fdiv contract float %121, %122
  %124 = add nsw i32 %112, 2
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  store float %123, float addrspace(1)* %126, align 4, !tbaa !7
  br label %127

127:                                              ; preds = %75, %109, %106, %12
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
