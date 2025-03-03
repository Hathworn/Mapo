; ModuleID = '../data/hip_kernels/4672/72/main.cu'
source_filename = "../data/hip_kernels/4672/72/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9blurnaivePfS_iiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = shl i32 %16, 1
  %18 = icmp slt i32 %17, %6
  br i1 %18, label %19, label %50

19:                                               ; preds = %7
  %20 = icmp eq i32 %2, %4
  br i1 %20, label %39, label %21

21:                                               ; preds = %19, %21
  %22 = phi i32 [ %37, %21 ], [ %2, %19 ]
  %23 = phi float [ %35, %21 ], [ 0.000000e+00, %19 ]
  %24 = phi float [ %30, %21 ], [ 0.000000e+00, %19 ]
  %25 = mul nsw i32 %22, %6
  %26 = add nsw i32 %25, %17
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = fadd contract float %24, %29
  %31 = add nsw i32 %26, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = fadd contract float %23, %34
  %36 = add nsw i32 %22, 1
  %37 = srem i32 %36, %5
  %38 = icmp eq i32 %37, %4
  br i1 %38, label %39, label %21, !llvm.loop !11

39:                                               ; preds = %21, %19
  %40 = phi float [ 0.000000e+00, %19 ], [ %30, %21 ]
  %41 = phi float [ 0.000000e+00, %19 ], [ %35, %21 ]
  %42 = sitofp i32 %3 to float
  %43 = fdiv contract float %40, %42
  %44 = sext i32 %17 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  store float %43, float addrspace(1)* %45, align 4, !tbaa !7
  %46 = fdiv contract float %41, %42
  %47 = add nuw nsw i32 %17, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  store float %46, float addrspace(1)* %49, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %39, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
