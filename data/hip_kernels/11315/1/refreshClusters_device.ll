; ModuleID = '../data/hip_kernels/11315/1/main.cu'
source_filename = "../data/hip_kernels/11315/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.dim3 = type { i32, i32, i32 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15refreshClustersP4dim3S0_Pi(%struct.dim3 addrspace(1)* nocapture %0, %struct.dim3 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !5
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %32, label %17

17:                                               ; preds = %3
  %18 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %0, i64 %13, i32 0
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !11, !amdgpu.noclobber !5
  %20 = udiv i32 %19, %15
  %21 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %1, i64 %13, i32 0
  store i32 %20, i32 addrspace(1)* %21, align 4, !tbaa !11
  %22 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %0, i64 %13, i32 1
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !13, !amdgpu.noclobber !5
  %24 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7
  %25 = udiv i32 %23, %24
  %26 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %1, i64 %13, i32 1
  store i32 %25, i32 addrspace(1)* %26, align 4, !tbaa !13
  %27 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %0, i64 %13, i32 2
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !14, !amdgpu.noclobber !5
  %29 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7
  %30 = udiv i32 %28, %29
  %31 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %1, i64 %13, i32 2
  store i32 %30, i32 addrspace(1)* %31, align 4, !tbaa !14
  br label %35

32:                                               ; preds = %3
  %33 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %1, i64 %13, i32 2
  %34 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %1, i64 %13, i32 0
  store i32 0, i32 addrspace(1)* %34, align 4, !tbaa !11
  store i32 0, i32 addrspace(1)* %33, align 4, !tbaa !14
  br label %35

35:                                               ; preds = %32, %17
  %36 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %0, i64 %13, i32 0
  store i32 0, i32 addrspace(1)* %36, align 4, !tbaa.struct !15
  %37 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %0, i64 %13, i32 1
  store i32 0, i32 addrspace(1)* %37, align 4, !tbaa.struct !16
  %38 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(1)* %0, i64 %13, i32 2
  store i32 0, i32 addrspace(1)* %38, align 4, !tbaa.struct !17
  store i32 0, i32 addrspace(1)* %14, align 4, !tbaa !7
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !8, i64 0}
!12 = !{!"_ZTS4dim3", !8, i64 0, !8, i64 4, !8, i64 8}
!13 = !{!12, !8, i64 4}
!14 = !{!12, !8, i64 8}
!15 = !{i64 0, i64 4, !7, i64 4, i64 4, !7, i64 8, i64 4, !7}
!16 = !{i64 0, i64 4, !7, i64 4, i64 4, !7}
!17 = !{i64 0, i64 4, !7}
