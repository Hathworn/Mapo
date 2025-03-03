; ModuleID = '../data/hip_kernels/335/20/main.cu'
source_filename = "../data/hip_kernels/335/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z41poisson_update_membrane_potentials_kernelP12hiprandStatePfS1_fS1_mi(%struct.hiprandState addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float %3, float addrspace(1)* nocapture readonly %4, i64 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = mul i32 %9, %14
  %19 = add i32 %18, %8
  %20 = sext i32 %19 to i64
  %21 = icmp ult i64 %20, %5
  br i1 %21, label %22, label %78

22:                                               ; preds = %7
  %23 = trunc i64 %5 to i32
  %24 = mul i32 %23, %6
  %25 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %20, i32 0, i32 0, i32 5, i64 0
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %20, i32 0, i32 0, i32 5, i64 1
  %27 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %20, i32 0, i32 0, i32 5, i64 2
  %28 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %20, i32 0, i32 0, i32 5, i64 3
  %29 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %20, i32 0, i32 0, i32 5, i64 4
  %30 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %20, i32 0, i32 0, i32 0
  %31 = udiv i32 %17, %14
  %32 = mul i32 %31, %14
  %33 = icmp ugt i32 %17, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %14
  br label %37

37:                                               ; preds = %22, %74
  %38 = phi i64 [ %20, %22 ], [ %76, %74 ]
  %39 = trunc i64 %38 to i32
  %40 = add i32 %24, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16
  %44 = fpext float %43 to double
  %45 = fcmp contract ogt double %44, 1.000000e-01
  br i1 %45, label %46, label %74

46:                                               ; preds = %37
  %47 = load i32, i32 addrspace(1)* %25, align 8, !tbaa !20
  %48 = lshr i32 %47, 2
  %49 = xor i32 %48, %47
  %50 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !20
  store i32 %50, i32 addrspace(1)* %25, align 8, !tbaa !20
  %51 = load i32, i32 addrspace(1)* %27, align 8, !tbaa !20
  store i32 %51, i32 addrspace(1)* %26, align 4, !tbaa !20
  %52 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !20
  store i32 %52, i32 addrspace(1)* %27, align 8, !tbaa !20
  %53 = load i32, i32 addrspace(1)* %29, align 8, !tbaa !20
  store i32 %53, i32 addrspace(1)* %28, align 4, !tbaa !20
  %54 = shl i32 %53, 4
  %55 = shl i32 %49, 1
  %56 = xor i32 %55, %54
  %57 = xor i32 %56, %49
  %58 = xor i32 %57, %53
  store i32 %58, i32 addrspace(1)* %29, align 8, !tbaa !20
  %59 = load i32, i32 addrspace(1)* %30, align 8, !tbaa !22
  %60 = add i32 %59, 362437
  store i32 %60, i32 addrspace(1)* %30, align 8, !tbaa !22
  %61 = add i32 %60, %58
  %62 = uitofp i32 %61 to float
  %63 = fmul contract float %62, 0x3DF0000000000000
  %64 = fadd contract float %63, 0x3DF0000000000000
  %65 = fmul contract float %43, %3
  %66 = fcmp contract olt float %64, %65
  br i1 %66, label %67, label %74

67:                                               ; preds = %46
  %68 = getelementptr inbounds float, float addrspace(1)* %4, i64 %38
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fpext float %69 to double
  %71 = fadd contract double %70, 2.000000e-02
  %72 = fptrunc double %71 to float
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  store float %72, float addrspace(1)* %73, align 4, !tbaa !16
  br label %74

74:                                               ; preds = %46, %67, %37
  %75 = add i32 %36, %39
  %76 = sext i32 %75 to i64
  %77 = icmp ult i64 %76, %5
  br i1 %77, label %37, label %78, !llvm.loop !26

78:                                               ; preds = %74, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = !{!23, !21, i64 0}
!23 = !{!"_ZTSN14rocrand_device13xorwow_engineE", !24, i64 0}
!24 = !{!"_ZTSN14rocrand_device13xorwow_engine12xorwow_stateE", !21, i64 0, !21, i64 4, !21, i64 8, !17, i64 12, !25, i64 16, !18, i64 24}
!25 = !{!"double", !18, i64 0}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.mustprogress"}
