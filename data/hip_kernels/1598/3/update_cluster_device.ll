; ModuleID = '../data/hip_kernels/1598/3/main.cu'
source_filename = "../data/hip_kernels/1598/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14update_clusterPiPfS0_S0_S0_iiiS0_S0_S0_S0_(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture %10, float addrspace(1)* nocapture %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = sdiv i32 %5, %6
  %15 = mul i32 %14, %13
  %16 = icmp ult i32 %13, %5
  br i1 %16, label %17, label %119

17:                                               ; preds = %12
  %18 = add nsw i32 %15, %14
  %19 = add nsw i32 %6, -1
  %20 = icmp eq i32 %13, %19
  %21 = mul nsw i32 %14, %19
  %22 = select i1 %20, i32 %21, i32 %15
  %23 = select i1 %20, i32 %5, i32 %18
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %41, label %25

25:                                               ; preds = %62, %17
  %26 = phi float [ 0.000000e+00, %17 ], [ %63, %62 ]
  %27 = phi float [ 0.000000e+00, %17 ], [ %64, %62 ]
  %28 = phi float [ 0.000000e+00, %17 ], [ %65, %62 ]
  %29 = phi float [ 0.000000e+00, %17 ], [ %66, %62 ]
  %30 = zext i32 %13 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %11, i64 %30
  store float %26, float addrspace(1)* %31, align 4, !tbaa !5
  %32 = getelementptr inbounds float, float addrspace(1)* %8, i64 %30
  store float %27, float addrspace(1)* %32, align 4, !tbaa !5
  %33 = getelementptr inbounds float, float addrspace(1)* %9, i64 %30
  store float %28, float addrspace(1)* %33, align 4, !tbaa !5
  %34 = getelementptr inbounds float, float addrspace(1)* %10, i64 %30
  store float %29, float addrspace(1)* %34, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %36 = getelementptr i8, i8 addrspace(4)* %35, i64 4
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !9, !invariant.load !10
  %39 = zext i16 %38 to i32
  %40 = icmp ugt i16 %38, 1
  br i1 %40, label %71, label %69

41:                                               ; preds = %17, %62
  %42 = phi i32 [ %67, %62 ], [ %22, %17 ]
  %43 = phi float [ %66, %62 ], [ 0.000000e+00, %17 ]
  %44 = phi float [ %65, %62 ], [ 0.000000e+00, %17 ]
  %45 = phi float [ %64, %62 ], [ 0.000000e+00, %17 ]
  %46 = phi float [ %63, %62 ], [ 0.000000e+00, %17 ]
  %47 = sext i32 %42 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !11, !amdgpu.noclobber !10
  %50 = icmp eq i32 %49, %7
  br i1 %50, label %51, label %62

51:                                               ; preds = %41
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !10
  %54 = fadd contract float %45, %53
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !10
  %57 = fadd contract float %44, %56
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %47
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !10
  %60 = fadd contract float %43, %59
  %61 = fadd contract float %46, 1.000000e+00
  br label %62

62:                                               ; preds = %41, %51
  %63 = phi float [ %61, %51 ], [ %46, %41 ]
  %64 = phi float [ %54, %51 ], [ %45, %41 ]
  %65 = phi float [ %57, %51 ], [ %44, %41 ]
  %66 = phi float [ %60, %51 ], [ %43, %41 ]
  %67 = add nsw i32 %42, 1
  %68 = icmp slt i32 %67, %23
  br i1 %68, label %41, label %25, !llvm.loop !13

69:                                               ; preds = %96, %25
  %70 = icmp eq i32 %13, 0
  br i1 %70, label %98, label %119

71:                                               ; preds = %25, %96
  %72 = phi i32 [ %73, %96 ], [ 1, %25 ]
  %73 = shl i32 %72, 1
  %74 = add i32 %73, 1023
  %75 = and i32 %74, %13
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %96

77:                                               ; preds = %71
  %78 = add i32 %72, %13
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %11, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = load float, float addrspace(1)* %31, align 4, !tbaa !5
  %83 = fadd contract float %81, %82
  store float %83, float addrspace(1)* %31, align 4, !tbaa !5
  %84 = getelementptr inbounds float, float addrspace(1)* %8, i64 %79
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = load float, float addrspace(1)* %32, align 4, !tbaa !5
  %87 = fadd contract float %85, %86
  store float %87, float addrspace(1)* %32, align 4, !tbaa !5
  %88 = getelementptr inbounds float, float addrspace(1)* %9, i64 %79
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5
  %90 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  %91 = fadd contract float %89, %90
  store float %91, float addrspace(1)* %33, align 4, !tbaa !5
  %92 = getelementptr inbounds float, float addrspace(1)* %10, i64 %79
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5
  %94 = load float, float addrspace(1)* %34, align 4, !tbaa !5
  %95 = fadd contract float %93, %94
  store float %95, float addrspace(1)* %34, align 4, !tbaa !5
  br label %96

96:                                               ; preds = %77, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = icmp ult i32 %73, %39
  br i1 %97, label %71, label %69, !llvm.loop !15

98:                                               ; preds = %69
  %99 = load float, float addrspace(1)* %11, align 4, !tbaa !5
  %100 = fcmp contract une float %99, 0.000000e+00
  br i1 %100, label %101, label %119

101:                                              ; preds = %98
  %102 = load float, float addrspace(1)* %8, align 4, !tbaa !5
  %103 = fdiv contract float %102, %99
  %104 = mul nsw i32 %7, 3
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  store float %103, float addrspace(1)* %106, align 4, !tbaa !5
  %107 = load float, float addrspace(1)* %9, align 4, !tbaa !5
  %108 = load float, float addrspace(1)* %11, align 4, !tbaa !5
  %109 = fdiv contract float %107, %108
  %110 = add nsw i32 %104, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  store float %109, float addrspace(1)* %112, align 4, !tbaa !5
  %113 = load float, float addrspace(1)* %10, align 4, !tbaa !5
  %114 = load float, float addrspace(1)* %11, align 4, !tbaa !5
  %115 = fdiv contract float %113, %114
  %116 = add nsw i32 %104, 2
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  store float %115, float addrspace(1)* %118, align 4, !tbaa !5
  br label %119

119:                                              ; preds = %69, %101, %98, %12
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !7, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
