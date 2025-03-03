; ModuleID = '../data/hip_kernels/1643/11/main.cu'
source_filename = "../data/hip_kernels/1643/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

@_ZZ10FluffyTailPK15HIP_vector_typeIjLj2EEPS0_PKiPiE7destIdx = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z10FluffyTailPK15HIP_vector_typeIjLj2EEPS0_PKiPi(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %7
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  %10 = icmp eq i32 %5, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %4
  %12 = atomicrmw add i32 addrspace(1)* %3, i32 %9 syncscope("agent-one-as") monotonic, align 4
  store i32 %12, i32 addrspace(3)* @_ZZ10FluffyTailPK15HIP_vector_typeIjLj2EEPS0_PKiPiE7destIdx, align 4, !tbaa !5
  br label %13

13:                                               ; preds = %11, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %14 = icmp slt i32 %5, %9
  br i1 %14, label %15, label %27

15:                                               ; preds = %13
  %16 = mul nsw i64 %7, 22016
  %17 = zext i32 %5 to i64
  %18 = add nsw i64 %16, %17
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(3)* @_ZZ10FluffyTailPK15HIP_vector_typeIjLj2EEPS0_PKiPiE7destIdx, align 4, !tbaa !5
  %21 = add nsw i32 %20, %5
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %22
  %24 = bitcast %struct.HIP_vector_type addrspace(1)* %19 to i64 addrspace(1)*
  %25 = bitcast %struct.HIP_vector_type addrspace(1)* %23 to i64 addrspace(1)*
  %26 = load i64, i64 addrspace(1)* %24, align 8
  store i64 %26, i64 addrspace(1)* %25, align 8
  br label %27

27:                                               ; preds = %15, %13
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
