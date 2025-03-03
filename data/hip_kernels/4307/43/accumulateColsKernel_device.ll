; ModuleID = '../data/hip_kernels/4307/43/main.cu'
source_filename = "../data/hip_kernels/4307/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20accumulateColsKernelPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = mul nsw i32 %4, %2
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %120

12:                                               ; preds = %5
  %13 = freeze i32 %9
  %14 = freeze i32 %4
  %15 = sdiv i32 %13, %14
  %16 = mul i32 %4, %3
  %17 = mul i32 %16, %15
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = add i32 %3, 1
  %21 = add nsw i32 %4, 1
  %22 = mul i32 %21, %20
  %23 = mul i32 %22, %15
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = mul i32 %15, %14
  %27 = sub i32 %13, %26
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %25, i64 %29
  store float 0.000000e+00, float addrspace(1)* %30, align 4, !tbaa !5
  %31 = icmp slt i32 %3, 1
  br i1 %31, label %120, label %32

32:                                               ; preds = %12
  %33 = and i32 %3, 3
  %34 = icmp ult i32 %3, 4
  br i1 %34, label %96, label %35

35:                                               ; preds = %32
  %36 = and i32 %3, -4
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i32 [ 1, %35 ], [ %93, %37 ]
  %39 = phi double [ 0.000000e+00, %35 ], [ %87, %37 ]
  %40 = phi i32 [ 0, %35 ], [ %94, %37 ]
  %41 = add nsw i32 %38, -1
  %42 = mul nsw i32 %41, %4
  %43 = add i32 %42, %27
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %19, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5
  %47 = fpext float %46 to double
  %48 = fadd contract double %39, %47
  %49 = fptrunc double %48 to float
  %50 = mul nsw i32 %38, %21
  %51 = add nsw i32 %50, %28
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %25, i64 %52
  store float %49, float addrspace(1)* %53, align 4, !tbaa !5
  %54 = add nuw nsw i32 %38, 1
  %55 = mul nsw i32 %38, %4
  %56 = add i32 %55, %27
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %19, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5
  %60 = fpext float %59 to double
  %61 = fadd contract double %48, %60
  %62 = fptrunc double %61 to float
  %63 = mul nsw i32 %54, %21
  %64 = add nsw i32 %63, %28
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %25, i64 %65
  store float %62, float addrspace(1)* %66, align 4, !tbaa !5
  %67 = add nuw nsw i32 %38, 2
  %68 = mul nsw i32 %54, %4
  %69 = add i32 %68, %27
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %19, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = fpext float %72 to double
  %74 = fadd contract double %61, %73
  %75 = fptrunc double %74 to float
  %76 = mul nsw i32 %67, %21
  %77 = add nsw i32 %76, %28
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %25, i64 %78
  store float %75, float addrspace(1)* %79, align 4, !tbaa !5
  %80 = add nuw i32 %38, 3
  %81 = mul nsw i32 %67, %4
  %82 = add i32 %81, %27
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %19, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = fpext float %85 to double
  %87 = fadd contract double %74, %86
  %88 = fptrunc double %87 to float
  %89 = mul nsw i32 %80, %21
  %90 = add nsw i32 %89, %28
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %25, i64 %91
  store float %88, float addrspace(1)* %92, align 4, !tbaa !5
  %93 = add nuw i32 %38, 4
  %94 = add i32 %40, 4
  %95 = icmp eq i32 %94, %36
  br i1 %95, label %96, label %37, !llvm.loop !9

96:                                               ; preds = %37, %32
  %97 = phi i32 [ 1, %32 ], [ %93, %37 ]
  %98 = phi double [ 0.000000e+00, %32 ], [ %87, %37 ]
  %99 = icmp eq i32 %33, 0
  br i1 %99, label %120, label %100

100:                                              ; preds = %96, %100
  %101 = phi i32 [ %117, %100 ], [ %97, %96 ]
  %102 = phi double [ %111, %100 ], [ %98, %96 ]
  %103 = phi i32 [ %118, %100 ], [ 0, %96 ]
  %104 = add nsw i32 %101, -1
  %105 = mul nsw i32 %104, %4
  %106 = add i32 %105, %27
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %19, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5
  %110 = fpext float %109 to double
  %111 = fadd contract double %102, %110
  %112 = fptrunc double %111 to float
  %113 = mul nsw i32 %101, %21
  %114 = add nsw i32 %113, %28
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %25, i64 %115
  store float %112, float addrspace(1)* %116, align 4, !tbaa !5
  %117 = add nuw i32 %101, 1
  %118 = add i32 %103, 1
  %119 = icmp eq i32 %118, %33
  br i1 %119, label %120, label %100, !llvm.loop !11

120:                                              ; preds = %96, %100, %12, %5
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
