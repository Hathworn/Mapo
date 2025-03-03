; ModuleID = '../data/hip_kernels/4307/44/main.cu'
source_filename = "../data/hip_kernels/4307/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z37accumulateColsInplaceTransposedKernelPfiii(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = mul nsw i32 %2, %1
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %125

11:                                               ; preds = %4
  %12 = sdiv i32 %8, %2
  %13 = add nsw i32 %2, 1
  %14 = mul nsw i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  store float 0.000000e+00, float addrspace(1)* %16, align 4, !tbaa !5
  %17 = add nsw i32 %8, 1
  %18 = add i32 %17, %12
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  store float 0.000000e+00, float addrspace(1)* %20, align 4, !tbaa !5
  %21 = icmp slt i32 %3, 1
  br i1 %21, label %125, label %22

22:                                               ; preds = %11
  %23 = mul i32 %13, %1
  %24 = and i32 %3, 7
  %25 = icmp ult i32 %3, 8
  br i1 %25, label %106, label %26

26:                                               ; preds = %22
  %27 = and i32 %3, -8
  br label %28

28:                                               ; preds = %28, %26
  %29 = phi i32 [ 1, %26 ], [ %103, %28 ]
  %30 = phi double [ 0.000000e+00, %26 ], [ %101, %28 ]
  %31 = phi i32 [ 0, %26 ], [ %104, %28 ]
  %32 = mul i32 %23, %29
  %33 = add nsw i32 %32, %18
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5
  %37 = fpext float %36 to double
  %38 = fadd contract double %30, %37
  %39 = fptrunc double %38 to float
  store float %39, float addrspace(1)* %35, align 4, !tbaa !5
  %40 = add nuw nsw i32 %29, 1
  %41 = mul i32 %23, %40
  %42 = add nsw i32 %41, %18
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  %46 = fpext float %45 to double
  %47 = fadd contract double %38, %46
  %48 = fptrunc double %47 to float
  store float %48, float addrspace(1)* %44, align 4, !tbaa !5
  %49 = add nuw nsw i32 %29, 2
  %50 = mul i32 %23, %49
  %51 = add nsw i32 %50, %18
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5
  %55 = fpext float %54 to double
  %56 = fadd contract double %47, %55
  %57 = fptrunc double %56 to float
  store float %57, float addrspace(1)* %53, align 4, !tbaa !5
  %58 = add nuw nsw i32 %29, 3
  %59 = mul i32 %23, %58
  %60 = add nsw i32 %59, %18
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5
  %64 = fpext float %63 to double
  %65 = fadd contract double %56, %64
  %66 = fptrunc double %65 to float
  store float %66, float addrspace(1)* %62, align 4, !tbaa !5
  %67 = add nuw nsw i32 %29, 4
  %68 = mul i32 %23, %67
  %69 = add nsw i32 %68, %18
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = fpext float %72 to double
  %74 = fadd contract double %65, %73
  %75 = fptrunc double %74 to float
  store float %75, float addrspace(1)* %71, align 4, !tbaa !5
  %76 = add nuw nsw i32 %29, 5
  %77 = mul i32 %23, %76
  %78 = add nsw i32 %77, %18
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = fpext float %81 to double
  %83 = fadd contract double %74, %82
  %84 = fptrunc double %83 to float
  store float %84, float addrspace(1)* %80, align 4, !tbaa !5
  %85 = add nuw nsw i32 %29, 6
  %86 = mul i32 %23, %85
  %87 = add nsw i32 %86, %18
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  %91 = fpext float %90 to double
  %92 = fadd contract double %83, %91
  %93 = fptrunc double %92 to float
  store float %93, float addrspace(1)* %89, align 4, !tbaa !5
  %94 = add nuw i32 %29, 7
  %95 = mul i32 %23, %94
  %96 = add nsw i32 %95, %18
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5
  %100 = fpext float %99 to double
  %101 = fadd contract double %92, %100
  %102 = fptrunc double %101 to float
  store float %102, float addrspace(1)* %98, align 4, !tbaa !5
  %103 = add nuw i32 %29, 8
  %104 = add i32 %31, 8
  %105 = icmp eq i32 %104, %27
  br i1 %105, label %106, label %28, !llvm.loop !9

106:                                              ; preds = %28, %22
  %107 = phi i32 [ 1, %22 ], [ %103, %28 ]
  %108 = phi double [ 0.000000e+00, %22 ], [ %101, %28 ]
  %109 = icmp eq i32 %24, 0
  br i1 %109, label %125, label %110

110:                                              ; preds = %106, %110
  %111 = phi i32 [ %122, %110 ], [ %107, %106 ]
  %112 = phi double [ %120, %110 ], [ %108, %106 ]
  %113 = phi i32 [ %123, %110 ], [ 0, %106 ]
  %114 = mul i32 %23, %111
  %115 = add nsw i32 %114, %18
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5
  %119 = fpext float %118 to double
  %120 = fadd contract double %112, %119
  %121 = fptrunc double %120 to float
  store float %121, float addrspace(1)* %117, align 4, !tbaa !5
  %122 = add nuw i32 %111, 1
  %123 = add i32 %113, 1
  %124 = icmp eq i32 %123, %24
  br i1 %124, label %125, label %110, !llvm.loop !11

125:                                              ; preds = %106, %110, %11, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
