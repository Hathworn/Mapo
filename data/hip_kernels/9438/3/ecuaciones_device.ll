; ModuleID = '../data/hip_kernels/9438/3/main.cu'
source_filename = "../data/hip_kernels/9438/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z10ecuacionesiiiPf(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = mul nsw i32 %1, %1
  %7 = shl nsw i32 %0, 2
  %8 = mul nsw i32 %7, %2
  %9 = sub nsw i32 %6, %8
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %40

11:                                               ; preds = %4
  %12 = sitofp i32 %9 to float
  %13 = sub nsw i32 0, %1
  %14 = sitofp i32 %13 to float
  %15 = tail call float @llvm.sqrt.f32(float %12)
  %16 = bitcast float %15 to i32
  %17 = add nsw i32 %16, -1
  %18 = bitcast i32 %17 to float
  %19 = add nsw i32 %16, 1
  %20 = bitcast i32 %19 to float
  %21 = tail call i1 @llvm.amdgcn.class.f32(float %12, i32 608)
  %22 = fneg float %20
  %23 = tail call float @llvm.fma.f32(float %22, float %15, float %12)
  %24 = fcmp ogt float %23, 0.000000e+00
  %25 = fneg float %18
  %26 = tail call float @llvm.fma.f32(float %25, float %15, float %12)
  %27 = fcmp ole float %26, 0.000000e+00
  %28 = select i1 %27, float %18, float %15
  %29 = select i1 %24, float %20, float %28
  %30 = select i1 %21, float %12, float %29
  %31 = fadd contract float %30, %14
  %32 = shl nsw i32 %0, 1
  %33 = sitofp i32 %32 to float
  %34 = fdiv contract float %31, %33
  %35 = fsub contract float %14, %30
  %36 = fdiv contract float %35, %33
  %37 = zext i32 %5 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  store float %34, float addrspace(1)* %38, align 4, !tbaa !5
  %39 = add nuw nsw i32 %5, 1
  br label %47

40:                                               ; preds = %4
  %41 = icmp eq i32 %6, %8
  br i1 %41, label %42, label %52

42:                                               ; preds = %40
  %43 = shl nsw i32 %0, 1
  %44 = sdiv i32 %1, %43
  %45 = sub nsw i32 0, %44
  %46 = sitofp i32 %45 to float
  br label %47

47:                                               ; preds = %11, %42
  %48 = phi i32 [ %5, %42 ], [ %39, %11 ]
  %49 = phi float [ %46, %42 ], [ %36, %11 ]
  %50 = zext i32 %48 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  store float %49, float addrspace(1)* %51, align 4, !tbaa !5
  br label %52

52:                                               ; preds = %47, %40
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
