; ModuleID = '../data/hip_kernels/4968/4/main.cu'
source_filename = "../data/hip_kernels/4968/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28same_num_channels_mul_kernelPKfS0_Pfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = shl i32 %13, 1
  %15 = ashr exact i32 %14, 1
  %16 = icmp slt i32 %15, %3
  br i1 %16, label %17, label %41

17:                                               ; preds = %4
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = fmul contract float %20, %22
  %24 = add nuw nsw i32 %14, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = fmul contract float %27, %29
  %31 = fsub contract float %23, %30
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  store float %31, float addrspace(1)* %32, align 4, !tbaa !7
  %33 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %34 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %35 = fmul contract float %33, %34
  %36 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %37 = load float, float addrspace(1)* %21, align 4, !tbaa !7
  %38 = fmul contract float %36, %37
  %39 = fadd contract float %35, %38
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %25
  store float %39, float addrspace(1)* %40, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %17, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
