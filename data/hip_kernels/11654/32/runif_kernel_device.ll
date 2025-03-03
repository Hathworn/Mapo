; ModuleID = '../data/hip_kernels/11654/32/main.cu'
source_filename = "../data/hip_kernels/11654/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12runif_kernelP12hiprandStatePfiff(%struct.hiprandState addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, i32 %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = add i32 %21, %6
  %23 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !13, !invariant.load !14
  %26 = zext i16 %25 to i32
  %27 = getelementptr i8, i8 addrspace(4)* %8, i64 8
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %32 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %34 = mul i32 %22, %30
  %35 = add i32 %34, %31
  %36 = mul i32 %35, %26
  %37 = add i32 %36, %32
  %38 = mul i32 %37, %15
  %39 = add i32 %38, %33
  %40 = icmp slt i32 %39, %2
  br i1 %40, label %41, label %71

41:                                               ; preds = %5
  %42 = fsub contract float %4, %3
  %43 = sext i32 %39 to i64
  %44 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %43, i32 0, i32 0, i32 5, i64 0
  %45 = load i32, i32 addrspace(1)* %44, align 8, !tbaa !16, !amdgpu.noclobber !14
  %46 = lshr i32 %45, 2
  %47 = xor i32 %46, %45
  %48 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %43, i32 0, i32 0, i32 5, i64 1
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !14
  store i32 %49, i32 addrspace(1)* %44, align 8, !tbaa !16
  %50 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %43, i32 0, i32 0, i32 5, i64 2
  %51 = load i32, i32 addrspace(1)* %50, align 8, !tbaa !16, !amdgpu.noclobber !14
  store i32 %51, i32 addrspace(1)* %48, align 4, !tbaa !16
  %52 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %43, i32 0, i32 0, i32 5, i64 3
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !14
  store i32 %53, i32 addrspace(1)* %50, align 8, !tbaa !16
  %54 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %43, i32 0, i32 0, i32 5, i64 4
  %55 = load i32, i32 addrspace(1)* %54, align 8, !tbaa !16, !amdgpu.noclobber !14
  store i32 %55, i32 addrspace(1)* %52, align 4, !tbaa !16
  %56 = shl i32 %55, 4
  %57 = shl i32 %47, 1
  %58 = xor i32 %57, %56
  %59 = xor i32 %58, %47
  %60 = xor i32 %59, %55
  store i32 %60, i32 addrspace(1)* %54, align 8, !tbaa !16
  %61 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %43, i32 0, i32 0, i32 0
  %62 = load i32, i32 addrspace(1)* %61, align 8, !tbaa !20, !amdgpu.noclobber !14
  %63 = add i32 %62, 362437
  store i32 %63, i32 addrspace(1)* %61, align 8, !tbaa !20
  %64 = add i32 %63, %60
  %65 = uitofp i32 %64 to float
  %66 = fmul contract float %65, 0x3DF0000000000000
  %67 = fadd contract float %66, 0x3DF0000000000000
  %68 = fmul contract float %42, %67
  %69 = fadd contract float %68, %3
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %69, float addrspace(1)* %70, align 4, !tbaa !25
  br label %71

71:                                               ; preds = %41, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

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
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !17, i64 0}
!21 = !{!"_ZTSN14rocrand_device13xorwow_engineE", !22, i64 0}
!22 = !{!"_ZTSN14rocrand_device13xorwow_engine12xorwow_stateE", !17, i64 0, !17, i64 4, !17, i64 8, !23, i64 12, !24, i64 16, !18, i64 24}
!23 = !{!"float", !18, i64 0}
!24 = !{!"double", !18, i64 0}
!25 = !{!23, !23, i64 0}
