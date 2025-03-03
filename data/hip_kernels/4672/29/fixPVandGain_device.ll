; ModuleID = '../data/hip_kernels/4672/29/main.cu'
source_filename = "../data/hip_kernels/4672/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12fixPVandGainPfS_fi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = shl i32 %13, 1
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %31

16:                                               ; preds = %4
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = fcmp uno float %19, 0.000000e+00
  br i1 %20, label %21, label %22

21:                                               ; preds = %16
  store float 0.000000e+00, float addrspace(1)* %18, align 4, !tbaa !7
  br label %22

22:                                               ; preds = %21, %16
  %23 = phi float [ 0.000000e+00, %21 ], [ %19, %16 ]
  %24 = add nuw nsw i32 %14, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %28 = fcmp contract oeq float %27, -1.000000e+00
  %29 = fmul contract float %23, %2
  %30 = select i1 %28, float 0.000000e+00, float %29
  store float %30, float addrspace(1)* %18, align 4, !tbaa !7
  br label %31

31:                                               ; preds = %22, %4
  %32 = icmp eq i32 %14, 0
  br i1 %32, label %33, label %35

33:                                               ; preds = %31
  %34 = load float, float addrspace(1)* %0, align 4, !tbaa !7
  store float %34, float addrspace(1)* %1, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %33, %31
  %36 = add nsw i32 %3, -2
  %37 = icmp eq i32 %14, %36
  br i1 %37, label %38, label %43

38:                                               ; preds = %35
  %39 = sext i32 %14 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  store float %41, float addrspace(1)* %42, align 4, !tbaa !7
  br label %43

43:                                               ; preds = %38, %35
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
