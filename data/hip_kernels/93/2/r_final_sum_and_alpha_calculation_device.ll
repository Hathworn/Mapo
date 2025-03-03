; ModuleID = '../data/hip_kernels/93/2/main.cu'
source_filename = "../data/hip_kernels/93/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ33r_final_sum_and_alpha_calculationPfS_iE16shared_r_squared = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16
@_ZZ33r_final_sum_and_alpha_calculationPfS_iE12shared_p_sum = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z33r_final_sum_and_alpha_calculationPfS_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp slt i32 %4, %2
  br i1 %5, label %6, label %12

6:                                                ; preds = %3
  %7 = zext i32 %4 to i64
  %8 = getelementptr inbounds float, float addrspace(1)* %0, i64 %7
  %9 = load float, float addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = getelementptr inbounds float, float addrspace(1)* %1, i64 %7
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %12

12:                                               ; preds = %3, %6
  %13 = phi float [ %9, %6 ], [ 0.000000e+00, %3 ]
  %14 = phi float [ %11, %6 ], [ 0.000000e+00, %3 ]
  %15 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33r_final_sum_and_alpha_calculationPfS_iE16shared_r_squared, i32 0, i32 %4
  store float %13, float addrspace(3)* %15, align 4
  %16 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33r_final_sum_and_alpha_calculationPfS_iE12shared_p_sum, i32 0, i32 %4
  store float %14, float addrspace(3)* %16, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !10, !invariant.load !9
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = icmp ult i16 %20, 2
  br i1 %22, label %25, label %23

23:                                               ; preds = %12
  %24 = zext i16 %20 to i32
  br label %27

25:                                               ; preds = %41, %12
  %26 = icmp eq i32 %4, 0
  br i1 %26, label %43, label %49

27:                                               ; preds = %23, %41
  %28 = phi i32 [ %24, %23 ], [ %29, %41 ]
  %29 = lshr i32 %28, 1
  %30 = icmp ult i32 %4, %29
  br i1 %30, label %31, label %41

31:                                               ; preds = %27
  %32 = load float, float addrspace(3)* %15, align 4, !tbaa !5
  %33 = add nuw nsw i32 %29, %4
  %34 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33r_final_sum_and_alpha_calculationPfS_iE16shared_r_squared, i32 0, i32 %33
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %36 = fadd contract float %32, %35
  store float %36, float addrspace(3)* %15, align 4, !tbaa !5
  %37 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %38 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33r_final_sum_and_alpha_calculationPfS_iE12shared_p_sum, i32 0, i32 %33
  %39 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %40 = fadd contract float %37, %39
  store float %40, float addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %41

41:                                               ; preds = %27, %31
  %42 = icmp ult i32 %28, 4
  br i1 %42, label %25, label %27, !llvm.loop !11

43:                                               ; preds = %25
  %44 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ33r_final_sum_and_alpha_calculationPfS_iE16shared_r_squared, i32 0, i32 0), align 16, !tbaa !5
  %45 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ33r_final_sum_and_alpha_calculationPfS_iE12shared_p_sum, i32 0, i32 0), align 16, !tbaa !5
  %46 = fdiv contract float %44, %45
  %47 = zext i32 %21 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float %46, float addrspace(1)* %48, align 4, !tbaa !5
  br label %49

49:                                               ; preds = %43, %25
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
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
