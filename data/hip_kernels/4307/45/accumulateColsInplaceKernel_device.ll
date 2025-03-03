; ModuleID = '../data/hip_kernels/4307/45/main.cu'
source_filename = "../data/hip_kernels/4307/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27accumulateColsInplaceKernelPfiii(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = mul nsw i32 %3, %1
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %129

11:                                               ; preds = %4
  %12 = freeze i32 %8
  %13 = freeze i32 %3
  %14 = sdiv i32 %12, %13
  %15 = add i32 %2, 1
  %16 = add nsw i32 %3, 1
  %17 = mul i32 %16, %15
  %18 = mul i32 %17, %14
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = mul i32 %14, %13
  %22 = sub i32 %12, %21
  %23 = add nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %20, i64 %24
  store float 0.000000e+00, float addrspace(1)* %25, align 4, !tbaa !5
  %26 = icmp slt i32 %2, 1
  br i1 %26, label %129, label %27

27:                                               ; preds = %11
  %28 = and i32 %2, 7
  %29 = icmp ult i32 %2, 8
  br i1 %29, label %110, label %30

30:                                               ; preds = %27
  %31 = and i32 %2, -8
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi i32 [ 1, %30 ], [ %107, %32 ]
  %34 = phi double [ 0.000000e+00, %30 ], [ %105, %32 ]
  %35 = phi i32 [ 0, %30 ], [ %108, %32 ]
  %36 = mul nsw i32 %33, %16
  %37 = add nsw i32 %36, %23
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %20, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  %41 = fpext float %40 to double
  %42 = fadd contract double %34, %41
  %43 = fptrunc double %42 to float
  store float %43, float addrspace(1)* %39, align 4, !tbaa !5
  %44 = add nuw nsw i32 %33, 1
  %45 = mul nsw i32 %44, %16
  %46 = add nsw i32 %45, %23
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %20, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5
  %50 = fpext float %49 to double
  %51 = fadd contract double %42, %50
  %52 = fptrunc double %51 to float
  store float %52, float addrspace(1)* %48, align 4, !tbaa !5
  %53 = add nuw nsw i32 %33, 2
  %54 = mul nsw i32 %53, %16
  %55 = add nsw i32 %54, %23
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %20, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5
  %59 = fpext float %58 to double
  %60 = fadd contract double %51, %59
  %61 = fptrunc double %60 to float
  store float %61, float addrspace(1)* %57, align 4, !tbaa !5
  %62 = add nuw nsw i32 %33, 3
  %63 = mul nsw i32 %62, %16
  %64 = add nsw i32 %63, %23
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %20, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5
  %68 = fpext float %67 to double
  %69 = fadd contract double %60, %68
  %70 = fptrunc double %69 to float
  store float %70, float addrspace(1)* %66, align 4, !tbaa !5
  %71 = add nuw nsw i32 %33, 4
  %72 = mul nsw i32 %71, %16
  %73 = add nsw i32 %72, %23
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %20, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5
  %77 = fpext float %76 to double
  %78 = fadd contract double %69, %77
  %79 = fptrunc double %78 to float
  store float %79, float addrspace(1)* %75, align 4, !tbaa !5
  %80 = add nuw nsw i32 %33, 5
  %81 = mul nsw i32 %80, %16
  %82 = add nsw i32 %81, %23
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %20, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = fpext float %85 to double
  %87 = fadd contract double %78, %86
  %88 = fptrunc double %87 to float
  store float %88, float addrspace(1)* %84, align 4, !tbaa !5
  %89 = add nuw nsw i32 %33, 6
  %90 = mul nsw i32 %89, %16
  %91 = add nsw i32 %90, %23
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %20, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5
  %95 = fpext float %94 to double
  %96 = fadd contract double %87, %95
  %97 = fptrunc double %96 to float
  store float %97, float addrspace(1)* %93, align 4, !tbaa !5
  %98 = add nuw i32 %33, 7
  %99 = mul nsw i32 %98, %16
  %100 = add nsw i32 %99, %23
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %20, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5
  %104 = fpext float %103 to double
  %105 = fadd contract double %96, %104
  %106 = fptrunc double %105 to float
  store float %106, float addrspace(1)* %102, align 4, !tbaa !5
  %107 = add nuw i32 %33, 8
  %108 = add i32 %35, 8
  %109 = icmp eq i32 %108, %31
  br i1 %109, label %110, label %32, !llvm.loop !9

110:                                              ; preds = %32, %27
  %111 = phi i32 [ 1, %27 ], [ %107, %32 ]
  %112 = phi double [ 0.000000e+00, %27 ], [ %105, %32 ]
  %113 = icmp eq i32 %28, 0
  br i1 %113, label %129, label %114

114:                                              ; preds = %110, %114
  %115 = phi i32 [ %126, %114 ], [ %111, %110 ]
  %116 = phi double [ %124, %114 ], [ %112, %110 ]
  %117 = phi i32 [ %127, %114 ], [ 0, %110 ]
  %118 = mul nsw i32 %115, %16
  %119 = add nsw i32 %118, %23
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %20, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5
  %123 = fpext float %122 to double
  %124 = fadd contract double %116, %123
  %125 = fptrunc double %124 to float
  store float %125, float addrspace(1)* %121, align 4, !tbaa !5
  %126 = add nuw i32 %115, 1
  %127 = add i32 %117, 1
  %128 = icmp eq i32 %127, %28
  br i1 %128, label %129, label %114, !llvm.loop !11

129:                                              ; preds = %110, %114, %11, %4
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
