; ModuleID = '../data/hip_kernels/11724/2/main.cu'
source_filename = "../data/hip_kernels/11724/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }

@_ZZ13uniformUpdateP15HIP_vector_typeIjLj4EEPjE3buf = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13uniformUpdateP15HIP_vector_typeIjLj4EEPj(%struct.HIP_vector_type addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %2
  %11 = zext i32 %3 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %13, i32 addrspace(3)* @_ZZ13uniformUpdateP15HIP_vector_typeIjLj4EEPjE3buf, align 4, !tbaa !7
  br label %14

14:                                               ; preds = %10, %2
  %15 = zext i16 %7 to i32
  %16 = mul i32 %3, %15
  %17 = add i32 %16, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 0
  %20 = load i32, i32 addrspace(1)* %19, align 16, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 1
  %22 = load i32, i32 addrspace(1)* %21, align 4, !amdgpu.noclobber !5
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 2
  %24 = load i32, i32 addrspace(1)* %23, align 8, !amdgpu.noclobber !5
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 3
  %26 = load i32, i32 addrspace(1)* %25, align 4, !amdgpu.noclobber !5
  %27 = load i32, i32 addrspace(3)* @_ZZ13uniformUpdateP15HIP_vector_typeIjLj4EEPjE3buf, align 4, !tbaa !7
  %28 = add i32 %27, %20
  %29 = add i32 %27, %22
  %30 = add i32 %27, %24
  %31 = add i32 %27, %26
  store i32 %28, i32 addrspace(1)* %19, align 16
  store i32 %29, i32 addrspace(1)* %21, align 4
  store i32 %30, i32 addrspace(1)* %23, align 8
  store i32 %31, i32 addrspace(1)* %25, align 4
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
