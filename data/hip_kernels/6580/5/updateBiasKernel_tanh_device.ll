; ModuleID = '../data/hip_kernels/6580/5/main.cu'
source_filename = "../data/hip_kernels/6580/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_share = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21updateBiasKernel_tanhPfS_iif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %6, %2
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds float, float addrspace(1)* %0, i64 %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %10
  store float 0.000000e+00, float addrspace(3)* %11, align 4, !tbaa !5
  %12 = icmp slt i32 %10, %2
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br i1 %12, label %14, label %20

14:                                               ; preds = %5
  %15 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !9, !invariant.load !10
  %18 = zext i16 %17 to i32
  br label %27

19:                                               ; preds = %27
  store float %33, float addrspace(3)* %11, align 4, !tbaa !5
  br label %20

20:                                               ; preds = %5, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !9, !invariant.load !10
  %24 = icmp eq i16 %23, 1
  br i1 %24, label %50, label %25

25:                                               ; preds = %20
  %26 = zext i16 %23 to i32
  br label %36

27:                                               ; preds = %14, %27
  %28 = phi float [ 0.000000e+00, %14 ], [ %33, %27 ]
  %29 = phi i32 [ %10, %14 ], [ %34, %27 ]
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %9, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !10
  %33 = fadd contract float %32, %28
  %34 = add i32 %29, %18
  %35 = icmp slt i32 %34, %2
  br i1 %35, label %27, label %19, !llvm.loop !11

36:                                               ; preds = %25, %48
  %37 = phi i32 [ %39, %48 ], [ %26, %25 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = add nsw i32 %37, 1
  %39 = ashr i32 %38, 1
  %40 = ashr i32 %37, 1
  %41 = icmp ult i32 %10, %40
  br i1 %41, label %42, label %48

42:                                               ; preds = %36
  %43 = add nsw i32 %39, %10
  %44 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %46 = load float, float addrspace(3)* %11, align 4, !tbaa !5
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %11, align 4, !tbaa !5
  br label %48

48:                                               ; preds = %42, %36
  %49 = icmp eq i32 %39, 1
  br i1 %49, label %50, label %36, !llvm.loop !13

50:                                               ; preds = %48, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @_share, i32 0, i32 0), align 4, !tbaa !5
  %52 = sitofp i32 %2 to float
  %53 = fdiv contract float %51, %52
  %54 = fmul contract float %53, %4
  %55 = sext i32 %6 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5
  %58 = fsub contract float %57, %54
  store float %58, float addrspace(1)* %56, align 4, !tbaa !5
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
