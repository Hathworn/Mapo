; ModuleID = '../data/hip_kernels/90/10/main.cu'
source_filename = "../data/hip_kernels/90/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17_mat_sum_row_fastPfS_iiiE5accum = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z17_mat_sum_row_fastPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %23

16:                                               ; preds = %5
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = mul i32 %17, %3
  %19 = add i32 %14, %18
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %23

23:                                               ; preds = %5, %16
  %24 = phi float [ %22, %16 ], [ 0.000000e+00, %5 ]
  %25 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 %13
  store float %24, float addrspace(3)* %25, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = icmp ult i32 %13, 64
  br i1 %26, label %27, label %33

27:                                               ; preds = %23
  %28 = add nuw nsw i32 %13, 64
  %29 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 %28
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !7
  %31 = load float, float addrspace(3)* %25, align 4, !tbaa !7
  %32 = fadd contract float %30, %31
  store float %32, float addrspace(3)* %25, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %27, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp ult i32 %13, 32
  br i1 %34, label %35, label %61

35:                                               ; preds = %33
  %36 = add nuw nsw i32 %13, 32
  %37 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 %36
  %38 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %39 = load float, float addrspace(3)* %25, align 4, !tbaa !7
  %40 = fadd contract float %38, %39
  %41 = add nuw nsw i32 %13, 16
  %42 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 %41
  %43 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %44 = fadd contract float %40, %43
  %45 = add nuw nsw i32 %13, 8
  %46 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %48 = fadd contract float %44, %47
  %49 = add nuw nsw i32 %13, 4
  %50 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 %49
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %52 = fadd contract float %48, %51
  %53 = add nuw nsw i32 %13, 2
  %54 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 %53
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %56 = fadd contract float %52, %55
  %57 = add nuw nsw i32 %13, 1
  %58 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 %57
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %60 = fadd contract float %56, %59
  store float %60, float addrspace(3)* %25, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %35, %33
  %62 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ17_mat_sum_row_fastPfS_iiiE5accum, i32 0, i32 0), align 16, !tbaa !7
  %63 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %64 = mul i32 %63, %4
  %65 = add i32 %64, %6
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  store float %62, float addrspace(1)* %67, align 4, !tbaa !7
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
