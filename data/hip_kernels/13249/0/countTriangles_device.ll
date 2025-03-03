; ModuleID = '../data/hip_kernels/13249/0/main.cu'
source_filename = "../data/hip_kernels/13249/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z14countTrianglesP15HIP_vector_typeIjLj2EEPi(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = icmp ugt i32 %3, %4
  br i1 %5, label %52, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %8 = icmp ugt i32 %4, %7
  %9 = icmp ugt i32 %3, %7
  %10 = select i1 %8, i1 true, i1 %9
  br i1 %10, label %52, label %11

11:                                               ; preds = %6
  %12 = zext i32 %3 to i64
  %13 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %12, i32 0, i32 0, i32 0, i64 0
  %14 = load i32, i32 addrspace(1)* %13, align 8, !amdgpu.noclobber !4
  %15 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %12, i32 0, i32 0, i32 0, i64 1
  %16 = load i32, i32 addrspace(1)* %15, align 4, !amdgpu.noclobber !4
  %17 = zext i32 %4 to i64
  %18 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 0, i64 0
  %19 = load i32, i32 addrspace(1)* %18, align 8, !amdgpu.noclobber !4
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %17, i32 0, i32 0, i32 0, i64 1
  %21 = load i32, i32 addrspace(1)* %20, align 4, !amdgpu.noclobber !4
  %22 = zext i32 %7 to i64
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %22, i32 0, i32 0, i32 0, i64 0
  %24 = load i32, i32 addrspace(1)* %23, align 8, !amdgpu.noclobber !4
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %22, i32 0, i32 0, i32 0, i64 1
  %26 = load i32, i32 addrspace(1)* %25, align 4, !amdgpu.noclobber !4
  %27 = icmp eq i32 %14, %19
  %28 = icmp eq i32 %16, %21
  %29 = select i1 %27, i1 true, i1 %28
  br i1 %29, label %30, label %40

30:                                               ; preds = %11
  %31 = icmp eq i32 %19, %24
  %32 = icmp eq i32 %21, %26
  %33 = select i1 %31, i1 true, i1 %32
  br i1 %33, label %34, label %40

34:                                               ; preds = %30
  %35 = icmp eq i32 %14, %24
  %36 = icmp eq i32 %16, %26
  %37 = select i1 %35, i1 true, i1 %36
  %38 = select i1 %27, i1 %28, i1 false
  %39 = select i1 %37, i1 true, i1 %38
  br i1 %39, label %52, label %42

40:                                               ; preds = %30, %11
  %41 = select i1 %27, i1 %28, i1 false
  br i1 %41, label %52, label %42

42:                                               ; preds = %34, %40
  %43 = icmp eq i32 %19, %24
  %44 = icmp eq i32 %21, %26
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %52, label %46

46:                                               ; preds = %42
  %47 = icmp eq i32 %14, %24
  %48 = icmp eq i32 %16, %26
  %49 = select i1 %47, i1 %48, i1 false
  br i1 %49, label %52, label %50

50:                                               ; preds = %46
  %51 = atomicrmw add i32 addrspace(1)* %1, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %52

52:                                               ; preds = %50, %34, %46, %42, %40, %2, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{}
