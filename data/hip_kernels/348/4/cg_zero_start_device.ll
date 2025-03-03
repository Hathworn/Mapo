; ModuleID = '../data/hip_kernels/348/4/main.cu'
source_filename = "../data/hip_kernels/348/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13cg_zero_startPfS_S_iE16shared_r_squared = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16
@_ZZ13cg_zero_startPfS_S_iE12shared_p_sum = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13cg_zero_startPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13cg_zero_startPfS_S_iE16shared_r_squared, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %14, align 4, !tbaa !7
  %15 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13cg_zero_startPfS_S_iE12shared_p_sum, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = icmp slt i32 %13, %3
  br i1 %16, label %17, label %79

17:                                               ; preds = %4
  %18 = shl nsw i32 %10, 1
  %19 = add nsw i32 %13, %18
  %20 = add nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %2, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7
  %24 = mul nsw i32 %13, 3
  %25 = load float, float addrspace(3)* %15, align 4, !tbaa !7
  %26 = sext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = sext i32 %19 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = fmul contract float %28, %31
  %33 = fadd contract float %25, %32
  %34 = add nsw i32 %24, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fmul contract float %37, %23
  %39 = fadd contract float %33, %38
  %40 = add nsw i32 %24, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = add nsw i32 %19, 2
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fmul contract float %43, %47
  %49 = fadd contract float %39, %48
  store float %49, float addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %50 = fmul contract float %23, %23
  store float %50, float addrspace(3)* %14, align 4, !tbaa !7
  %51 = load float, float addrspace(3)* %15, align 4, !tbaa !7
  %52 = fmul contract float %23, %51
  store float %52, float addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp ult i16 %8, 2
  br i1 %53, label %54, label %63

54:                                               ; preds = %77, %17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ13cg_zero_startPfS_S_iE16shared_r_squared, i32 0, i32 0), align 16, !tbaa !7
  %56 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ13cg_zero_startPfS_S_iE12shared_p_sum, i32 0, i32 0), align 16, !tbaa !7
  %57 = fdiv contract float %55, %56
  %58 = sext i32 %13 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %23, %57
  %62 = fadd contract float %60, %61
  store float %62, float addrspace(1)* %59, align 4, !tbaa !7
  br label %79

63:                                               ; preds = %17, %77
  %64 = phi i32 [ %65, %77 ], [ %9, %17 ]
  %65 = lshr i32 %64, 1
  %66 = icmp ult i32 %12, %65
  br i1 %66, label %67, label %77

67:                                               ; preds = %63
  %68 = load float, float addrspace(3)* %14, align 4, !tbaa !7
  %69 = add nuw nsw i32 %65, %12
  %70 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13cg_zero_startPfS_S_iE16shared_r_squared, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %72 = fadd contract float %68, %71
  store float %72, float addrspace(3)* %14, align 4, !tbaa !7
  %73 = load float, float addrspace(3)* %15, align 4, !tbaa !7
  %74 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13cg_zero_startPfS_S_iE12shared_p_sum, i32 0, i32 %69
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %76 = fadd contract float %73, %75
  store float %76, float addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %77

77:                                               ; preds = %63, %67
  %78 = icmp ult i32 %64, 4
  br i1 %78, label %54, label %63, !llvm.loop !11

79:                                               ; preds = %54, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
