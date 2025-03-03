; ModuleID = '../data/hip_kernels/16922/32/main.cu'
source_filename = "../data/hip_kernels/16922/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21generate_destinationsP12hiprandStateiPKjPj(%struct.hiprandState addrspace(1)* nocapture %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #1 {
  %5 = alloca [20 x i8], align 4, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = mul i32 %7, %12
  %17 = add i32 %16, %6
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %12
  %24 = getelementptr inbounds [20 x i8], [20 x i8] addrspace(5)* %5, i32 0, i32 0
  call void @llvm.lifetime.start.p5i8(i64 20, i8 addrspace(5)* %24)
  %25 = sext i32 %17 to i64
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %25, i32 0, i32 0, i32 0
  %27 = load i32, i32 addrspace(1)* %26, align 8
  %28 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %25, i32 0, i32 0, i32 1
  %29 = bitcast i32 addrspace(1)* %28 to i8 addrspace(1)*
  call void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noundef align 4 dereferenceable(20) %24, i8 addrspace(1)* noundef align 4 dereferenceable(20) %29, i64 20, i1 false)
  %30 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %25, i32 0, i32 0, i32 5, i64 0
  %31 = load i32, i32 addrspace(1)* %30, align 8
  %32 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %25, i32 0, i32 0, i32 5, i64 1
  %33 = load i32, i32 addrspace(1)* %32, align 4
  %34 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %25, i32 0, i32 0, i32 5, i64 2
  %35 = load i32, i32 addrspace(1)* %34, align 8
  %36 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %25, i32 0, i32 0, i32 5, i64 3
  %37 = load i32, i32 addrspace(1)* %36, align 4
  %38 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %25, i32 0, i32 0, i32 5, i64 4
  %39 = load i32, i32 addrspace(1)* %38, align 8
  %40 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %25, i32 0, i32 0, i32 5, i64 5
  %41 = load i32, i32 addrspace(1)* %40, align 4
  %42 = icmp slt i32 %17, %1
  br i1 %42, label %50, label %43

43:                                               ; preds = %50, %4
  %44 = phi i32 [ %39, %4 ], [ %64, %50 ]
  %45 = phi i32 [ %37, %4 ], [ %57, %50 ]
  %46 = phi i32 [ %35, %4 ], [ %56, %50 ]
  %47 = phi i32 [ %33, %4 ], [ %55, %50 ]
  %48 = phi i32 [ %31, %4 ], [ %54, %50 ]
  %49 = phi i32 [ %27, %4 ], [ %65, %50 ]
  store i32 %49, i32 addrspace(1)* %26, align 8
  call void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(20) %29, i8 addrspace(5)* noundef align 4 dereferenceable(20) %24, i64 20, i1 false)
  store i32 %48, i32 addrspace(1)* %30, align 8
  store i32 %47, i32 addrspace(1)* %32, align 4
  store i32 %46, i32 addrspace(1)* %34, align 8
  store i32 %45, i32 addrspace(1)* %36, align 4
  store i32 %44, i32 addrspace(1)* %38, align 8
  store i32 %41, i32 addrspace(1)* %40, align 4
  call void @llvm.lifetime.end.p5i8(i64 20, i8 addrspace(5)* %24)
  ret void

50:                                               ; preds = %4, %50
  %51 = phi i32 [ %73, %50 ], [ %17, %4 ]
  %52 = phi i32 [ %65, %50 ], [ %27, %4 ]
  %53 = phi i32 [ %54, %50 ], [ %31, %4 ]
  %54 = phi i32 [ %55, %50 ], [ %33, %4 ]
  %55 = phi i32 [ %56, %50 ], [ %35, %4 ]
  %56 = phi i32 [ %57, %50 ], [ %37, %4 ]
  %57 = phi i32 [ %64, %50 ], [ %39, %4 ]
  %58 = lshr i32 %53, 2
  %59 = xor i32 %58, %53
  %60 = shl i32 %57, 4
  %61 = shl i32 %59, 1
  %62 = xor i32 %60, %61
  %63 = xor i32 %62, %57
  %64 = xor i32 %63, %59
  %65 = add i32 %52, 362437
  %66 = add i32 %64, %65
  %67 = urem i32 %66, %1
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !16
  %71 = sext i32 %51 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %71
  store i32 %70, i32 addrspace(1)* %72, align 4, !tbaa !16
  %73 = add nsw i32 %51, %23
  %74 = icmp slt i32 %73, %1
  br i1 %74, label %50, label %43, !llvm.loop !20
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(5)* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
