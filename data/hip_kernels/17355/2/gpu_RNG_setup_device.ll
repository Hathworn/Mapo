; ModuleID = '../data/hip_kernels/17355/2/main.cu'
source_filename = "../data/hip_kernels/17355/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z13gpu_RNG_setupP12hiprandStatemi(%struct.hiprandState addrspace(1)* nocapture writeonly %0, i64 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %53

17:                                               ; preds = %3
  %18 = shl i64 %1, 20
  %19 = udiv i32 %12, %9
  %20 = mul i32 %19, %9
  %21 = icmp ugt i32 %12, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %9
  br label %25

25:                                               ; preds = %17, %25
  %26 = phi i32 [ %15, %17 ], [ %51, %25 ]
  %27 = sext i32 %26 to i64
  %28 = add i64 %18, %27
  %29 = trunc i64 %28 to i32
  %30 = xor i32 %29, 746559103
  %31 = lshr i64 %28, 32
  %32 = trunc i64 %31 to i32
  %33 = xor i32 %32, -1607034933
  %34 = mul i32 %30, 1228688033
  %35 = mul i32 %33, 2073658381
  %36 = add i32 %34, 123456789
  %37 = xor i32 %34, 362436069
  %38 = add i32 %35, 521288629
  %39 = xor i32 %35, 88675123
  %40 = add i32 %34, 5783321
  %41 = add i32 %34, 6615241
  %42 = add i32 %41, %35
  %43 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %27, i32 0, i32 0, i32 0
  store i32 %42, i32 addrspace(1)* %43, align 8, !tbaa.struct !16
  %44 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %27, i32 0, i32 0, i32 1
  store i32 0, i32 addrspace(1)* %44, align 4, !tbaa.struct !26
  %45 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %27, i32 0, i32 0, i32 2
  store i32 0, i32 addrspace(1)* %45, align 8, !tbaa.struct !27
  %46 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %27, i32 0, i32 0, i32 5, i64 0
  store i32 %36, i32 addrspace(1)* %46, align 8, !tbaa.struct !28
  %47 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %27, i32 0, i32 0, i32 5, i64 1
  store i32 %37, i32 addrspace(1)* %47, align 4, !tbaa.struct !29
  %48 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %27, i32 0, i32 0, i32 5, i64 2
  store i32 %38, i32 addrspace(1)* %48, align 8, !tbaa.struct !30
  %49 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %27, i32 0, i32 0, i32 5, i64 3
  store i32 %39, i32 addrspace(1)* %49, align 4, !tbaa.struct !31
  %50 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %27, i32 0, i32 0, i32 5, i64 4
  store i32 %40, i32 addrspace(1)* %50, align 8, !tbaa.struct !32
  %51 = add i32 %24, %26
  %52 = icmp slt i32 %51, %2
  br i1 %52, label %25, label %53, !llvm.loop !33

53:                                               ; preds = %25, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{i64 0, i64 4, !17, i64 4, i64 4, !17, i64 8, i64 4, !17, i64 12, i64 4, !21, i64 16, i64 8, !23, i64 24, i64 20, !25}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !19, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"double", !19, i64 0}
!25 = !{!19, !19, i64 0}
!26 = !{i64 0, i64 4, !17, i64 4, i64 4, !17, i64 8, i64 4, !21, i64 12, i64 8, !23, i64 20, i64 20, !25}
!27 = !{i64 0, i64 4, !17, i64 4, i64 4, !21, i64 8, i64 8, !23, i64 16, i64 20, !25}
!28 = !{i64 0, i64 20, !25}
!29 = !{i64 0, i64 16, !25}
!30 = !{i64 0, i64 12, !25}
!31 = !{i64 0, i64 8, !25}
!32 = !{i64 0, i64 4, !25}
!33 = distinct !{!33, !34}
!34 = !{!"llvm.loop.mustprogress"}
