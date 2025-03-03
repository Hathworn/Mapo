; ModuleID = '../data/hip_kernels/11832/64/main.cu'
source_filename = "../data/hip_kernels/11832/64/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14refill_randomsPfiP12hiprandState(float addrspace(1)* nocapture writeonly %0, i32 %1, %struct.hiprandState addrspace(1)* nocapture %2) local_unnamed_addr #0 {
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
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = sext i32 %15 to i64
  %23 = icmp slt i32 %15, %1
  br i1 %23, label %24, label %62

24:                                               ; preds = %3
  %25 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %22, i32 0, i32 0, i32 5, i64 0
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %22, i32 0, i32 0, i32 5, i64 1
  %27 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %22, i32 0, i32 0, i32 5, i64 2
  %28 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %22, i32 0, i32 0, i32 5, i64 3
  %29 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %22, i32 0, i32 0, i32 5, i64 4
  %30 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %2, i64 %22, i32 0, i32 0, i32 0
  %31 = load i32, i32 addrspace(1)* %25, align 8, !tbaa !16
  %32 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !16
  %33 = load i32, i32 addrspace(1)* %27, align 8, !tbaa !16
  %34 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !16
  %35 = load i32, i32 addrspace(1)* %29, align 8, !tbaa !16
  %36 = load i32, i32 addrspace(1)* %30, align 8, !tbaa !20
  br label %37

37:                                               ; preds = %24, %37
  %38 = phi i32 [ %36, %24 ], [ %52, %37 ]
  %39 = phi i32 [ %35, %24 ], [ %51, %37 ]
  %40 = phi i32 [ %34, %24 ], [ %39, %37 ]
  %41 = phi i32 [ %33, %24 ], [ %40, %37 ]
  %42 = phi i32 [ %32, %24 ], [ %41, %37 ]
  %43 = phi i32 [ %31, %24 ], [ %42, %37 ]
  %44 = phi i32 [ %15, %24 ], [ %59, %37 ]
  %45 = lshr i32 %43, 2
  %46 = xor i32 %45, %43
  %47 = shl i32 %39, 4
  %48 = shl i32 %46, 1
  %49 = xor i32 %48, %47
  %50 = xor i32 %49, %46
  %51 = xor i32 %50, %39
  %52 = add i32 %38, 362437
  %53 = add i32 %52, %51
  %54 = uitofp i32 %53 to float
  %55 = fmul contract float %54, 0x3DF0000000000000
  %56 = fadd contract float %55, 0x3DF0000000000000
  %57 = sext i32 %44 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  store float %56, float addrspace(1)* %58, align 4, !tbaa !25
  %59 = add nsw i32 %44, %21
  %60 = icmp slt i32 %59, %1
  br i1 %60, label %37, label %61, !llvm.loop !26

61:                                               ; preds = %37
  store i32 %42, i32 addrspace(1)* %25, align 8, !tbaa !16
  store i32 %41, i32 addrspace(1)* %26, align 4, !tbaa !16
  store i32 %40, i32 addrspace(1)* %27, align 8, !tbaa !16
  store i32 %39, i32 addrspace(1)* %28, align 4, !tbaa !16
  store i32 %51, i32 addrspace(1)* %29, align 8, !tbaa !16
  store i32 %52, i32 addrspace(1)* %30, align 8, !tbaa !20
  br label %62

62:                                               ; preds = %61, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.mustprogress"}
