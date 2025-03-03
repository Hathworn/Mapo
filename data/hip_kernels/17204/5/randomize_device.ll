; ModuleID = '../data/hip_kernels/17204/5/main.cu'
source_filename = "../data/hip_kernels/17204/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9randomizePfP12hiprandStatem(float addrspace(1)* nocapture writeonly %0, %struct.hiprandState addrspace(1)* nocapture %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = zext i32 %30 to i64
  %32 = icmp ult i64 %31, %2
  br i1 %32, label %33, label %59

33:                                               ; preds = %3
  %34 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 0
  %35 = load i32, i32 addrspace(1)* %34, align 8
  %36 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 5, i64 0
  %37 = load i32, i32 addrspace(1)* %36, align 8
  %38 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 5, i64 1
  %39 = load i32, i32 addrspace(1)* %38, align 4
  %40 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 5, i64 2
  %41 = load i32, i32 addrspace(1)* %40, align 8
  %42 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 5, i64 3
  %43 = load i32, i32 addrspace(1)* %42, align 4
  %44 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %31, i32 0, i32 0, i32 5, i64 4
  %45 = load i32, i32 addrspace(1)* %44, align 8
  %46 = lshr i32 %37, 2
  %47 = xor i32 %46, %37
  %48 = shl i32 %45, 4
  %49 = shl i32 %47, 1
  %50 = xor i32 %49, %48
  %51 = xor i32 %50, %47
  %52 = xor i32 %51, %45
  %53 = add i32 %35, 362437
  %54 = add i32 %52, %53
  %55 = uitofp i32 %54 to float
  %56 = fmul contract float %55, 0x3DF0000000000000
  %57 = fadd contract float %56, 0x3DF0000000000000
  store i32 %53, i32 addrspace(1)* %34, align 8
  store i32 %39, i32 addrspace(1)* %36, align 8
  store i32 %41, i32 addrspace(1)* %38, align 4
  store i32 %43, i32 addrspace(1)* %40, align 8
  store i32 %45, i32 addrspace(1)* %42, align 4
  store i32 %52, i32 addrspace(1)* %44, align 8
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  store float %57, float addrspace(1)* %58, align 4, !tbaa !16
  br label %59

59:                                               ; preds = %33, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
