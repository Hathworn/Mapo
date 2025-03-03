; ModuleID = '../data/hip_kernels/11158/2/main.cu'
source_filename = "../data/hip_kernels/11158/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@c_LB = protected local_unnamed_addr addrspace(1) externally_initialized global [10 x float] zeroinitializer, align 16
@c_UB = protected local_unnamed_addr addrspace(1) externally_initialized global [10 x float] zeroinitializer, align 16
@c_a = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aa = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aaa = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aRow = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@c_aaaRow = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@c_Dysum = protected local_unnamed_addr addrspace(1) externally_initialized global [9 x float] zeroinitializer, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9selectPrePfS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds float, float addrspace(1)* %0, i64 %7
  %9 = load float, float addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = fdiv contract float 1.000000e+00, %9
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %7
  store float %10, float addrspace(1)* %11, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %12 = load float, float addrspace(1)* %8, align 4, !tbaa !5
  %13 = getelementptr inbounds float, float addrspace(1)* %2, i64 %7
  store float %12, float addrspace(1)* %13, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %14 = mul nuw nsw i32 %6, 10
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %3, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !5
  %18 = getelementptr inbounds float, float addrspace(1)* %4, i64 %15
  store float %17, float addrspace(1)* %18, align 4, !tbaa !5
  %19 = or i32 %14, 1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  %23 = getelementptr inbounds float, float addrspace(1)* %4, i64 %20
  store float %22, float addrspace(1)* %23, align 4, !tbaa !5
  %24 = add nuw nsw i32 %14, 2
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5
  %28 = getelementptr inbounds float, float addrspace(1)* %4, i64 %25
  store float %27, float addrspace(1)* %28, align 4, !tbaa !5
  %29 = add nuw nsw i32 %14, 3
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5
  %33 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  store float %32, float addrspace(1)* %33, align 4, !tbaa !5
  %34 = add nuw nsw i32 %14, 4
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5
  %38 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  store float %37, float addrspace(1)* %38, align 4, !tbaa !5
  %39 = add nuw nsw i32 %14, 5
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %3, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5
  %43 = getelementptr inbounds float, float addrspace(1)* %4, i64 %40
  store float %42, float addrspace(1)* %43, align 4, !tbaa !5
  %44 = add nuw nsw i32 %14, 6
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5
  %48 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  store float %47, float addrspace(1)* %48, align 4, !tbaa !5
  %49 = add nuw nsw i32 %14, 7
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5
  %53 = getelementptr inbounds float, float addrspace(1)* %4, i64 %50
  store float %52, float addrspace(1)* %53, align 4, !tbaa !5
  %54 = add nuw nsw i32 %14, 8
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %3, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %55
  store float %57, float addrspace(1)* %58, align 4, !tbaa !5
  %59 = add nuw nsw i32 %14, 9
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 %60
  store float %62, float addrspace(1)* %63, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
