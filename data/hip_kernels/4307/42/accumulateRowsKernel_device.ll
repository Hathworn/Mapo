; ModuleID = '../data/hip_kernels/4307/42/main.cu'
source_filename = "../data/hip_kernels/4307/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20accumulateRowsKernelPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = mul nsw i32 %3, %2
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %141

12:                                               ; preds = %5
  %13 = sdiv i32 %9, %3
  %14 = add nsw i32 %9, 1
  %15 = add i32 %14, %13
  %16 = add nsw i32 %4, 1
  %17 = mul nsw i32 %15, %16
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %20 = getelementptr inbounds float, float addrspace(1)* %19, i64 1
  %21 = getelementptr inbounds float, float addrspace(1)* %20, i64 -1
  store float 0.000000e+00, float addrspace(1)* %21, align 4, !tbaa !5
  %22 = icmp sgt i32 %4, 0
  br i1 %22, label %23, label %49

23:                                               ; preds = %12
  %24 = mul nsw i32 %9, %4
  %25 = and i32 %4, 7
  %26 = icmp ult i32 %4, 8
  br i1 %26, label %29, label %27

27:                                               ; preds = %23
  %28 = and i32 %4, -8
  br label %55

29:                                               ; preds = %55, %23
  %30 = phi i32 [ 0, %23 ], [ %138, %55 ]
  %31 = phi double [ 0.000000e+00, %23 ], [ %134, %55 ]
  %32 = icmp eq i32 %25, 0
  br i1 %32, label %49, label %33

33:                                               ; preds = %29, %33
  %34 = phi i32 [ %46, %33 ], [ %30, %29 ]
  %35 = phi double [ %42, %33 ], [ %31, %29 ]
  %36 = phi i32 [ %47, %33 ], [ 0, %29 ]
  %37 = add nsw i32 %34, %24
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  %41 = fpext float %40 to double
  %42 = fadd contract double %35, %41
  %43 = fptrunc double %42 to float
  %44 = zext i32 %34 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %20, i64 %44
  store float %43, float addrspace(1)* %45, align 4, !tbaa !5
  %46 = add nuw nsw i32 %34, 1
  %47 = add i32 %36, 1
  %48 = icmp eq i32 %47, %25
  br i1 %48, label %49, label %33, !llvm.loop !9

49:                                               ; preds = %29, %33, %12
  %50 = add nsw i32 %3, 1
  %51 = mul i32 %16, %50
  %52 = mul i32 %51, %13
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  store float 0.000000e+00, float addrspace(1)* %54, align 4, !tbaa !5
  br label %141

55:                                               ; preds = %55, %27
  %56 = phi i32 [ 0, %27 ], [ %138, %55 ]
  %57 = phi double [ 0.000000e+00, %27 ], [ %134, %55 ]
  %58 = phi i32 [ 0, %27 ], [ %139, %55 ]
  %59 = add nsw i32 %56, %24
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5
  %63 = fpext float %62 to double
  %64 = fadd contract double %57, %63
  %65 = fptrunc double %64 to float
  %66 = zext i32 %56 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %20, i64 %66
  store float %65, float addrspace(1)* %67, align 4, !tbaa !5
  %68 = or i32 %56, 1
  %69 = add nsw i32 %68, %24
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = fpext float %72 to double
  %74 = fadd contract double %64, %73
  %75 = fptrunc double %74 to float
  %76 = zext i32 %68 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %20, i64 %76
  store float %75, float addrspace(1)* %77, align 4, !tbaa !5
  %78 = or i32 %56, 2
  %79 = add nsw i32 %78, %24
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  %83 = fpext float %82 to double
  %84 = fadd contract double %74, %83
  %85 = fptrunc double %84 to float
  %86 = zext i32 %78 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %20, i64 %86
  store float %85, float addrspace(1)* %87, align 4, !tbaa !5
  %88 = or i32 %56, 3
  %89 = add nsw i32 %88, %24
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  %93 = fpext float %92 to double
  %94 = fadd contract double %84, %93
  %95 = fptrunc double %94 to float
  %96 = zext i32 %88 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %20, i64 %96
  store float %95, float addrspace(1)* %97, align 4, !tbaa !5
  %98 = or i32 %56, 4
  %99 = add nsw i32 %98, %24
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = fpext float %102 to double
  %104 = fadd contract double %94, %103
  %105 = fptrunc double %104 to float
  %106 = zext i32 %98 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %20, i64 %106
  store float %105, float addrspace(1)* %107, align 4, !tbaa !5
  %108 = or i32 %56, 5
  %109 = add nsw i32 %108, %24
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5
  %113 = fpext float %112 to double
  %114 = fadd contract double %104, %113
  %115 = fptrunc double %114 to float
  %116 = zext i32 %108 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %20, i64 %116
  store float %115, float addrspace(1)* %117, align 4, !tbaa !5
  %118 = or i32 %56, 6
  %119 = add nsw i32 %118, %24
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5
  %123 = fpext float %122 to double
  %124 = fadd contract double %114, %123
  %125 = fptrunc double %124 to float
  %126 = zext i32 %118 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %20, i64 %126
  store float %125, float addrspace(1)* %127, align 4, !tbaa !5
  %128 = or i32 %56, 7
  %129 = add nsw i32 %128, %24
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5
  %133 = fpext float %132 to double
  %134 = fadd contract double %124, %133
  %135 = fptrunc double %134 to float
  %136 = zext i32 %128 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %20, i64 %136
  store float %135, float addrspace(1)* %137, align 4, !tbaa !5
  %138 = add nuw nsw i32 %56, 8
  %139 = add i32 %58, 8
  %140 = icmp eq i32 %139, %28
  br i1 %140, label %29, label %55, !llvm.loop !11

141:                                              ; preds = %49, %5
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
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
