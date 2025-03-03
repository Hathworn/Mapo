; ModuleID = '../data/hip_kernels/6109/2/main.cu'
source_filename = "../data/hip_kernels/6109/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z11setup_stateP12hiprandStatey(%struct.hiprandState addrspace(1)* nocapture writeonly %0, i64 %1) local_unnamed_addr #0 {
  %3 = trunc i64 %1 to i32
  %4 = xor i32 %3, 746559103
  %5 = lshr i64 %1, 32
  %6 = trunc i64 %5 to i32
  %7 = xor i32 %6, -1607034933
  %8 = mul i32 %4, 1228688033
  %9 = mul i32 %7, 2073658381
  %10 = add i32 %8, 123456789
  %11 = xor i32 %8, 362436069
  %12 = add i32 %9, 521288629
  %13 = xor i32 %9, 88675123
  %14 = add i32 %8, 5783321
  %15 = add i32 %8, 6615241
  %16 = add i32 %15, %9
  %17 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 0, i32 0, i32 0, i32 0
  store i32 %16, i32 addrspace(1)* %17, align 8, !tbaa.struct !4
  %18 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 0, i32 0, i32 0, i32 1
  store i32 0, i32 addrspace(1)* %18, align 4, !tbaa.struct !14
  %19 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 0, i32 0, i32 0, i32 2
  store i32 0, i32 addrspace(1)* %19, align 8, !tbaa.struct !15
  %20 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 0, i32 0, i32 0, i32 5, i64 0
  store i32 %10, i32 addrspace(1)* %20, align 8, !tbaa.struct !16
  %21 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 0, i32 0, i32 0, i32 5, i64 1
  store i32 %11, i32 addrspace(1)* %21, align 4, !tbaa.struct !17
  %22 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 0, i32 0, i32 0, i32 5, i64 2
  store i32 %12, i32 addrspace(1)* %22, align 8, !tbaa.struct !18
  %23 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 0, i32 0, i32 0, i32 5, i64 3
  store i32 %13, i32 addrspace(1)* %23, align 4, !tbaa.struct !19
  %24 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 0, i32 0, i32 0, i32 5, i64 4
  store i32 %14, i32 addrspace(1)* %24, align 8, !tbaa.struct !20
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !9, i64 16, i64 8, !11, i64 24, i64 20, !13}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !7, i64 0}
!13 = !{!7, !7, i64 0}
!14 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !9, i64 12, i64 8, !11, i64 20, i64 20, !13}
!15 = !{i64 0, i64 4, !5, i64 4, i64 4, !9, i64 8, i64 8, !11, i64 16, i64 20, !13}
!16 = !{i64 0, i64 20, !13}
!17 = !{i64 0, i64 16, !13}
!18 = !{i64 0, i64 12, !13}
!19 = !{i64 0, i64 8, !13}
!20 = !{i64 0, i64 4, !13}
