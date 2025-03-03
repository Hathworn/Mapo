; ModuleID = '../data/hip_kernels/11162/1/main.cu'
source_filename = "../data/hip_kernels/11162/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.edge = type { i32, i32 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3bfsPK4edgePii(%struct.edge addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.edge, %struct.edge addrspace(1)* %0, i64 %13, i32 0
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !5
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !12, !amdgpu.noclobber !5
  %19 = getelementptr inbounds %struct.edge, %struct.edge addrspace(1)* %0, i64 %13, i32 1
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13, !amdgpu.noclobber !5
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !12, !amdgpu.noclobber !5
  %24 = icmp eq i32 %18, %2
  %25 = icmp eq i32 %23, -1
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %29

27:                                               ; preds = %3
  %28 = add nsw i32 %2, 1
  store i32 %28, i32 addrspace(1)* %22, align 4, !tbaa !12
  br label %29

29:                                               ; preds = %27, %3
  %30 = icmp eq i32 %18, -1
  %31 = icmp eq i32 %23, %2
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %35

33:                                               ; preds = %29
  %34 = add nsw i32 %2, 1
  store i32 %34, i32 addrspace(1)* %17, align 4, !tbaa !12
  br label %35

35:                                               ; preds = %33, %29
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
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTS4edge", !9, i64 0, !9, i64 4}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!9, !9, i64 0}
!13 = !{!8, !9, i64 4}
