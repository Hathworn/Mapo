; ModuleID = '../data/hip_kernels/2824/101/main.cu'
source_filename = "../data/hip_kernels/2824/101/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12shared4R1W1GPfS_S_iE4Smem = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12shared4R1W1GPfS_S_i(float addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %39

15:                                               ; preds = %4
  %16 = sitofp i32 %13 to float
  %17 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4R1W1GPfS_S_iE4Smem, i32 0, i32 %12
  store float %16, float addrspace(3)* %17, align 4, !tbaa !7
  %18 = add nuw nsw i32 %12, 1
  %19 = and i32 %18, 511
  %20 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4R1W1GPfS_S_iE4Smem, i32 0, i32 %19
  %21 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %22 = add nuw nsw i32 %12, 2
  %23 = and i32 %22, 511
  %24 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4R1W1GPfS_S_iE4Smem, i32 0, i32 %23
  %25 = load float, float addrspace(3)* %24, align 4, !tbaa !7
  %26 = fadd contract float %21, %25
  %27 = add nuw nsw i32 %12, 3
  %28 = and i32 %27, 511
  %29 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4R1W1GPfS_S_iE4Smem, i32 0, i32 %28
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !7
  %31 = fadd contract float %26, %30
  %32 = add nuw nsw i32 %12, 4
  %33 = and i32 %32, 511
  %34 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ12shared4R1W1GPfS_S_iE4Smem, i32 0, i32 %33
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %36 = fadd contract float %31, %35
  %37 = sext i32 %13 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  store float %36, float addrspace(1)* %38, align 4, !tbaa !7
  br label %39

39:                                               ; preds = %15, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
