; ModuleID = '../data/hip_kernels/4112/0/main.cu'
source_filename = "../data/hip_kernels/4112/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z11render_initiiP12hiprandState(i32 %0, i32 %1, %struct.hiprandState addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %13
  %21 = icmp slt i32 %12, %0
  %22 = icmp slt i32 %20, %1
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %47

24:                                               ; preds = %3
  %25 = mul nsw i32 %20, %0
  %26 = add nsw i32 %25, %12
  %27 = sext i32 %26 to i64
  %28 = xor i32 %26, 746559103
  %29 = icmp sgt i32 %26, -1
  %30 = mul i32 %28, 1228688033
  %31 = select i1 %29, i32 -1973591729, i32 -100066652
  %32 = add i32 %30, 123456789
  %33 = xor i32 %30, 362436069
  %34 = add nsw i32 %31, 521288629
  %35 = xor i32 %31, 88675123
  %36 = add i32 %30, 5783321
  %37 = add i32 %30, 6615241
  %38 = add i32 %37, %31
  %39 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %27, i32 0, i32 0, i32 0
  store i32 %38, i32 addrspace(1)* %39, align 8, !tbaa.struct !7
  %40 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %27, i32 0, i32 0, i32 1
  store i32 0, i32 addrspace(1)* %40, align 4, !tbaa.struct !17
  %41 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %27, i32 0, i32 0, i32 2
  store i32 0, i32 addrspace(1)* %41, align 8, !tbaa.struct !18
  %42 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %27, i32 0, i32 0, i32 5, i64 0
  store i32 %32, i32 addrspace(1)* %42, align 8, !tbaa.struct !19
  %43 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %27, i32 0, i32 0, i32 5, i64 1
  store i32 %33, i32 addrspace(1)* %43, align 4, !tbaa.struct !20
  %44 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %27, i32 0, i32 0, i32 5, i64 2
  store i32 %34, i32 addrspace(1)* %44, align 8, !tbaa.struct !21
  %45 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %27, i32 0, i32 0, i32 5, i64 3
  store i32 %35, i32 addrspace(1)* %45, align 4, !tbaa.struct !22
  %46 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %27, i32 0, i32 0, i32 5, i64 4
  store i32 %36, i32 addrspace(1)* %46, align 8, !tbaa.struct !23
  br label %47

47:                                               ; preds = %3, %24
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{i64 0, i64 4, !8, i64 4, i64 4, !8, i64 8, i64 4, !8, i64 12, i64 4, !12, i64 16, i64 8, !14, i64 24, i64 20, !16}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !10, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"double", !10, i64 0}
!16 = !{!10, !10, i64 0}
!17 = !{i64 0, i64 4, !8, i64 4, i64 4, !8, i64 8, i64 4, !12, i64 12, i64 8, !14, i64 20, i64 20, !16}
!18 = !{i64 0, i64 4, !8, i64 4, i64 4, !12, i64 8, i64 8, !14, i64 16, i64 20, !16}
!19 = !{i64 0, i64 20, !16}
!20 = !{i64 0, i64 16, !16}
!21 = !{i64 0, i64 12, !16}
!22 = !{i64 0, i64 8, !16}
!23 = !{i64 0, i64 4, !16}
