; ModuleID = '../data/hip_kernels/11654/33/main.cu'
source_filename = "../data/hip_kernels/11654/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12rexpo_kernelP12hiprandStatePfif(%struct.hiprandState addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !13, !invariant.load !14
  %29 = zext i16 %28 to i32
  %30 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !15
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %33 = mul i32 %21, %29
  %34 = add i32 %33, %30
  %35 = mul i32 %34, %25
  %36 = add i32 %35, %31
  %37 = mul i32 %36, %14
  %38 = add i32 %37, %32
  %39 = icmp slt i32 %38, %2
  br i1 %39, label %40, label %82

40:                                               ; preds = %4
  %41 = sext i32 %38 to i64
  %42 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 5, i64 0
  %43 = load i32, i32 addrspace(1)* %42, align 8, !tbaa !16, !amdgpu.noclobber !14
  %44 = lshr i32 %43, 2
  %45 = xor i32 %44, %43
  %46 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 5, i64 1
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !14
  store i32 %47, i32 addrspace(1)* %42, align 8, !tbaa !16
  %48 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 5, i64 2
  %49 = load i32, i32 addrspace(1)* %48, align 8, !tbaa !16, !amdgpu.noclobber !14
  store i32 %49, i32 addrspace(1)* %46, align 4, !tbaa !16
  %50 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 5, i64 3
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !16, !amdgpu.noclobber !14
  store i32 %51, i32 addrspace(1)* %48, align 8, !tbaa !16
  %52 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 5, i64 4
  %53 = load i32, i32 addrspace(1)* %52, align 8, !tbaa !16, !amdgpu.noclobber !14
  store i32 %53, i32 addrspace(1)* %50, align 4, !tbaa !16
  %54 = shl i32 %53, 4
  %55 = shl i32 %45, 1
  %56 = xor i32 %55, %54
  %57 = xor i32 %56, %45
  %58 = xor i32 %57, %53
  store i32 %58, i32 addrspace(1)* %52, align 8, !tbaa !16
  %59 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 0
  %60 = load i32, i32 addrspace(1)* %59, align 8, !tbaa !20, !amdgpu.noclobber !14
  %61 = add i32 %60, 362437
  store i32 %61, i32 addrspace(1)* %59, align 8, !tbaa !20
  %62 = add i32 %61, %58
  %63 = uitofp i32 %62 to float
  %64 = fmul contract float %63, 0x3DF0000000000000
  %65 = fadd contract float %64, 0x3DF0000000000000
  %66 = tail call i1 @llvm.amdgcn.class.f32(float %65, i32 144)
  %67 = select i1 %66, float 0x41F0000000000000, float 1.000000e+00
  %68 = fmul float %65, %67
  %69 = tail call float @llvm.log2.f32(float %68)
  %70 = fmul float %69, 0x3FE62E42E0000000
  %71 = tail call i1 @llvm.amdgcn.class.f32(float %69, i32 519)
  %72 = fneg float %70
  %73 = tail call float @llvm.fma.f32(float %69, float 0x3FE62E42E0000000, float %72)
  %74 = tail call float @llvm.fma.f32(float %69, float 0x3E6EFA39E0000000, float %73)
  %75 = fadd float %70, %74
  %76 = select i1 %71, float %69, float %75
  %77 = select i1 %66, float 0x40362E4300000000, float 0.000000e+00
  %78 = fsub float %76, %77
  %79 = fneg contract float %78
  %80 = fdiv contract float %79, %3
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  store float %80, float addrspace(1)* %81, align 4, !tbaa !25
  br label %82

82:                                               ; preds = %40, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
