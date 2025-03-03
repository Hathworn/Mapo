; ModuleID = '../data/hip_kernels/16974/6/main.cu'
source_filename = "../data/hip_kernels/16974/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9setRandomP12hiprandStatePii(%struct.hiprandState addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %13, i32 0, i32 0, i32 5, i64 0
  %15 = load i32, i32 addrspace(1)* %14, align 8, !tbaa !7, !amdgpu.noclobber !6
  %16 = lshr i32 %15, 2
  %17 = xor i32 %16, %15
  %18 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %13, i32 0, i32 0, i32 5, i64 1
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  store i32 %19, i32 addrspace(1)* %14, align 8, !tbaa !7
  %20 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %13, i32 0, i32 0, i32 5, i64 2
  %21 = load i32, i32 addrspace(1)* %20, align 8, !tbaa !7, !amdgpu.noclobber !6
  store i32 %21, i32 addrspace(1)* %18, align 4, !tbaa !7
  %22 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %13, i32 0, i32 0, i32 5, i64 3
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  store i32 %23, i32 addrspace(1)* %20, align 8, !tbaa !7
  %24 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %13, i32 0, i32 0, i32 5, i64 4
  %25 = load i32, i32 addrspace(1)* %24, align 8, !tbaa !7, !amdgpu.noclobber !6
  store i32 %25, i32 addrspace(1)* %22, align 4, !tbaa !7
  %26 = shl i32 %25, 4
  %27 = shl i32 %17, 1
  %28 = xor i32 %27, %26
  %29 = xor i32 %28, %17
  %30 = xor i32 %29, %25
  store i32 %30, i32 addrspace(1)* %24, align 8, !tbaa !7
  %31 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %13, i32 0, i32 0, i32 0
  %32 = load i32, i32 addrspace(1)* %31, align 8, !tbaa !11, !amdgpu.noclobber !6
  %33 = add i32 %32, 362437
  store i32 %33, i32 addrspace(1)* %31, align 8, !tbaa !11
  %34 = add i32 %33, %30
  %35 = urem i32 %34, %2
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %13
  store i32 %35, i32 addrspace(1)* %36, align 4, !tbaa !7
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !8, i64 0}
!12 = !{!"_ZTSN14rocrand_device13xorwow_engineE", !13, i64 0}
!13 = !{!"_ZTSN14rocrand_device13xorwow_engine12xorwow_stateE", !8, i64 0, !8, i64 4, !8, i64 8, !14, i64 12, !15, i64 16, !9, i64 24}
!14 = !{!"float", !9, i64 0}
!15 = !{!"double", !9, i64 0}
