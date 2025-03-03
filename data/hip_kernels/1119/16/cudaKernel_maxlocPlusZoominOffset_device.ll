; ModuleID = '../data/hip_kernels/1119/16/main.cu'
source_filename = "../data/hip_kernels/1119/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z33cudaKernel_maxlocPlusZoominOffsetPfPKiS1_mff(float addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i64 %3, float %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %7
  %16 = sext i32 %15 to i64
  %17 = icmp ult i64 %16, %3
  br i1 %17, label %18, label %41

18:                                               ; preds = %6
  %19 = shl nsw i32 %15, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = sitofp i32 %22 to float
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %20
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = sitofp i32 %25 to float
  %27 = fmul contract float %26, %4
  %28 = fadd contract float %27, %23
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  store float %28, float addrspace(1)* %29, align 4, !tbaa !11
  %30 = add nuw nsw i32 %19, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = sitofp i32 %33 to float
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = sitofp i32 %36 to float
  %38 = fmul contract float %37, %5
  %39 = fadd contract float %38, %34
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  store float %39, float addrspace(1)* %40, align 4, !tbaa !11
  br label %41

41:                                               ; preds = %18, %6
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
