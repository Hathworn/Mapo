; ModuleID = '../data/hip_kernels/12739/13/main.cu'
source_filename = "../data/hip_kernels/12739/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z16gpu_setup_curandmP12hiprandStatej(i64 %0, %struct.hiprandState addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = mul i32 %17, %4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = add i32 %18, %19
  %21 = mul i32 %20, %12
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = zext i32 %2 to i64
  %25 = icmp ult i32 %23, %2
  br i1 %25, label %26, label %63

26:                                               ; preds = %3
  %27 = zext i32 %23 to i64
  %28 = mul i32 %17, %12
  %29 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 2, !range !13, !invariant.load !14
  %32 = zext i16 %31 to i32
  %33 = mul nuw nsw i32 %32, %32
  %34 = add i32 %33, %28
  %35 = zext i32 %34 to i64
  br label %36

36:                                               ; preds = %26, %36
  %37 = phi i64 [ %27, %26 ], [ %61, %36 ]
  %38 = add i64 %37, %0
  %39 = trunc i64 %38 to i32
  %40 = xor i32 %39, 746559103
  %41 = lshr i64 %38, 32
  %42 = trunc i64 %41 to i32
  %43 = xor i32 %42, -1607034933
  %44 = mul i32 %40, 1228688033
  %45 = mul i32 %43, 2073658381
  %46 = add i32 %44, 123456789
  %47 = xor i32 %44, 362436069
  %48 = add i32 %45, 521288629
  %49 = xor i32 %45, 88675123
  %50 = add i32 %44, 5783321
  %51 = add i32 %44, 6615241
  %52 = add i32 %51, %45
  %53 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %37, i32 0, i32 0, i32 0
  store i32 %52, i32 addrspace(1)* %53, align 8, !tbaa.struct !16
  %54 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %37, i32 0, i32 0, i32 1
  store i32 0, i32 addrspace(1)* %54, align 4, !tbaa.struct !26
  %55 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %37, i32 0, i32 0, i32 2
  store i32 0, i32 addrspace(1)* %55, align 8, !tbaa.struct !27
  %56 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %37, i32 0, i32 0, i32 5, i64 0
  store i32 %46, i32 addrspace(1)* %56, align 8, !tbaa.struct !28
  %57 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %37, i32 0, i32 0, i32 5, i64 1
  store i32 %47, i32 addrspace(1)* %57, align 4, !tbaa.struct !29
  %58 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %37, i32 0, i32 0, i32 5, i64 2
  store i32 %48, i32 addrspace(1)* %58, align 8, !tbaa.struct !30
  %59 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %37, i32 0, i32 0, i32 5, i64 3
  store i32 %49, i32 addrspace(1)* %59, align 4, !tbaa.struct !31
  %60 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %37, i32 0, i32 0, i32 5, i64 4
  store i32 %50, i32 addrspace(1)* %60, align 8, !tbaa.struct !32
  %61 = add i64 %37, %35
  %62 = icmp ult i64 %61, %24
  br i1 %62, label %36, label %63, !llvm.loop !33

63:                                               ; preds = %36, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
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
