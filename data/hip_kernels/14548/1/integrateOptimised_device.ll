; ModuleID = '../data/hip_kernels/14548/1/main.cu'
source_filename = "../data/hip_kernels/14548/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18integrateOptimisedPiPfE5s_sum = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18integrateOptimisedPiPf(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7, !amdgpu.noclobber !6
  %13 = sitofp i32 %12 to float
  %14 = fdiv contract float 1.000000e+00, %13
  %15 = icmp slt i32 %11, %12
  br i1 %15, label %16, label %19

16:                                               ; preds = %2
  %17 = add nsw i32 %11, 1
  %18 = shl nuw nsw i32 %9, 6
  br label %24

19:                                               ; preds = %24, %2
  %20 = phi float [ 0.000000e+00, %2 ], [ %33, %24 ]
  %21 = fmul contract float %14, %20
  %22 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ18integrateOptimisedPiPfE5s_sum, i32 0, i32 %3
  store float %21, float addrspace(3)* %22, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = icmp ult i16 %8, 2
  br i1 %23, label %36, label %40

24:                                               ; preds = %16, %24
  %25 = phi float [ 0.000000e+00, %16 ], [ %33, %24 ]
  %26 = phi i32 [ %17, %16 ], [ %34, %24 ]
  %27 = sitofp i32 %26 to float
  %28 = fadd contract float %27, -5.000000e-01
  %29 = fmul contract float %14, %28
  %30 = fmul contract float %29, %29
  %31 = fadd contract float %30, 1.000000e+00
  %32 = fdiv contract float 4.000000e+00, %31
  %33 = fadd contract float %25, %32
  %34 = add i32 %26, %18
  %35 = icmp sgt i32 %34, %12
  br i1 %35, label %19, label %24, !llvm.loop !13

36:                                               ; preds = %50, %19
  %37 = load float, float addrspace(3)* %22, align 4, !tbaa !11
  %38 = sext i32 %11 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  store float %37, float addrspace(1)* %39, align 4, !tbaa !11
  ret void

40:                                               ; preds = %19, %50
  %41 = phi i32 [ %42, %50 ], [ %9, %19 ]
  %42 = lshr i32 %41, 1
  %43 = icmp ult i32 %3, %42
  br i1 %43, label %44, label %50

44:                                               ; preds = %40
  %45 = add nuw nsw i32 %42, %3
  %46 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ18integrateOptimisedPiPfE5s_sum, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !11
  %48 = load float, float addrspace(3)* %22, align 4, !tbaa !11
  %49 = fadd contract float %47, %48
  store float %49, float addrspace(3)* %22, align 4, !tbaa !11
  br label %50

50:                                               ; preds = %44, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp ult i32 %41, 4
  br i1 %51, label %36, label %40, !llvm.loop !15
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
