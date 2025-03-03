; ModuleID = '../data/hip_kernels/585/7/main.cu'
source_filename = "../data/hip_kernels/585/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12MatMulKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp sgt i32 %3, 0
  %8 = mul nsw i32 %5, %3
  %9 = sext i32 %8 to i64
  br i1 %7, label %12, label %10

10:                                               ; preds = %4
  %11 = zext i32 %6 to i64
  br label %41

12:                                               ; preds = %4
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %14 = zext i32 %6 to i64
  %15 = getelementptr float, float addrspace(1)* %1, i64 %14
  %16 = and i32 %3, 7
  %17 = icmp ult i32 %3, 8
  br i1 %17, label %20, label %18

18:                                               ; preds = %12
  %19 = and i32 %3, -8
  br label %46

20:                                               ; preds = %46, %12
  %21 = phi float [ undef, %12 ], [ %128, %46 ]
  %22 = phi float [ 0.000000e+00, %12 ], [ %128, %46 ]
  %23 = phi i32 [ 0, %12 ], [ %129, %46 ]
  %24 = icmp eq i32 %16, 0
  br i1 %24, label %41, label %25

25:                                               ; preds = %20, %25
  %26 = phi float [ %37, %25 ], [ %22, %20 ]
  %27 = phi i32 [ %38, %25 ], [ %23, %20 ]
  %28 = phi i32 [ %39, %25 ], [ 0, %20 ]
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %13, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = mul nsw i32 %27, %3
  %33 = sext i32 %32 to i64
  %34 = getelementptr float, float addrspace(1)* %15, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fmul contract float %31, %35
  %37 = fadd contract float %26, %36
  %38 = add nuw nsw i32 %27, 1
  %39 = add i32 %28, 1
  %40 = icmp eq i32 %39, %16
  br i1 %40, label %41, label %25, !llvm.loop !10

41:                                               ; preds = %20, %25, %10
  %42 = phi i64 [ %11, %10 ], [ %14, %25 ], [ %14, %20 ]
  %43 = phi float [ 0.000000e+00, %10 ], [ %21, %20 ], [ %37, %25 ]
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %9
  %45 = getelementptr inbounds float, float addrspace(1)* %44, i64 %42
  store float %43, float addrspace(1)* %45, align 4, !tbaa !5
  ret void

46:                                               ; preds = %46, %18
  %47 = phi float [ 0.000000e+00, %18 ], [ %128, %46 ]
  %48 = phi i32 [ 0, %18 ], [ %129, %46 ]
  %49 = phi i32 [ 0, %18 ], [ %130, %46 ]
  %50 = zext i32 %48 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %13, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = mul nsw i32 %48, %3
  %54 = sext i32 %53 to i64
  %55 = getelementptr float, float addrspace(1)* %15, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = fmul contract float %52, %56
  %58 = fadd contract float %47, %57
  %59 = or i32 %48, 1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %13, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = mul nsw i32 %59, %3
  %64 = sext i32 %63 to i64
  %65 = getelementptr float, float addrspace(1)* %15, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  %67 = fmul contract float %62, %66
  %68 = fadd contract float %58, %67
  %69 = or i32 %48, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %13, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = mul nsw i32 %69, %3
  %74 = sext i32 %73 to i64
  %75 = getelementptr float, float addrspace(1)* %15, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = fmul contract float %72, %76
  %78 = fadd contract float %68, %77
  %79 = or i32 %48, 3
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %13, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = mul nsw i32 %79, %3
  %84 = sext i32 %83 to i64
  %85 = getelementptr float, float addrspace(1)* %15, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  %87 = fmul contract float %82, %86
  %88 = fadd contract float %78, %87
  %89 = or i32 %48, 4
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %13, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = mul nsw i32 %89, %3
  %94 = sext i32 %93 to i64
  %95 = getelementptr float, float addrspace(1)* %15, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = fmul contract float %92, %96
  %98 = fadd contract float %88, %97
  %99 = or i32 %48, 5
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %13, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = mul nsw i32 %99, %3
  %104 = sext i32 %103 to i64
  %105 = getelementptr float, float addrspace(1)* %15, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  %107 = fmul contract float %102, %106
  %108 = fadd contract float %98, %107
  %109 = or i32 %48, 6
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %13, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5, !amdgpu.noclobber !9
  %113 = mul nsw i32 %109, %3
  %114 = sext i32 %113 to i64
  %115 = getelementptr float, float addrspace(1)* %15, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  %117 = fmul contract float %112, %116
  %118 = fadd contract float %108, %117
  %119 = or i32 %48, 7
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %13, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5, !amdgpu.noclobber !9
  %123 = mul nsw i32 %119, %3
  %124 = sext i32 %123 to i64
  %125 = getelementptr float, float addrspace(1)* %15, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %118, %127
  %129 = add nuw nsw i32 %48, 8
  %130 = add i32 %49, 8
  %131 = icmp eq i32 %130, %19
  br i1 %131, label %20, label %46, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
