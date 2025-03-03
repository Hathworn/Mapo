; ModuleID = '../data/hip_kernels/16037/31/main.cu'
source_filename = "../data/hip_kernels/16037/31/main.cu"
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
define protected amdgpu_kernel void @_Z16generate_sourcesP12hiprandStateiPj(%struct.hiprandState addrspace(1)* nocapture %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #1 {
  %4 = alloca [20 x i8], align 4, addrspace(5)
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = udiv i32 %14, %11
  %18 = mul i32 %17, %11
  %19 = icmp ugt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %11
  %23 = getelementptr inbounds [20 x i8], [20 x i8] addrspace(5)* %4, i32 0, i32 0
  call void @llvm.lifetime.start.p5i8(i64 20, i8 addrspace(5)* %23)
  %24 = sext i32 %16 to i64
  %25 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0
  %26 = load i32, i32 addrspace(1)* %25, align 8
  %27 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 1
  %28 = bitcast i32 addrspace(1)* %27 to i8 addrspace(1)*
  call void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noundef align 4 dereferenceable(20) %23, i8 addrspace(1)* noundef align 4 dereferenceable(20) %28, i64 20, i1 false)
  %29 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 5, i64 0
  %30 = load i32, i32 addrspace(1)* %29, align 8
  %31 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 5, i64 1
  %32 = load i32, i32 addrspace(1)* %31, align 4
  %33 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 5, i64 2
  %34 = load i32, i32 addrspace(1)* %33, align 8
  %35 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 5, i64 3
  %36 = load i32, i32 addrspace(1)* %35, align 4
  %37 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 5, i64 4
  %38 = load i32, i32 addrspace(1)* %37, align 8
  %39 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 5, i64 5
  %40 = load i32, i32 addrspace(1)* %39, align 4
  %41 = icmp slt i32 %16, %1
  br i1 %41, label %49, label %42

42:                                               ; preds = %49, %3
  %43 = phi i32 [ %38, %3 ], [ %63, %49 ]
  %44 = phi i32 [ %36, %3 ], [ %56, %49 ]
  %45 = phi i32 [ %34, %3 ], [ %55, %49 ]
  %46 = phi i32 [ %32, %3 ], [ %54, %49 ]
  %47 = phi i32 [ %30, %3 ], [ %53, %49 ]
  %48 = phi i32 [ %26, %3 ], [ %64, %49 ]
  store i32 %48, i32 addrspace(1)* %25, align 8
  call void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(20) %28, i8 addrspace(5)* noundef align 4 dereferenceable(20) %23, i64 20, i1 false)
  store i32 %47, i32 addrspace(1)* %29, align 8
  store i32 %46, i32 addrspace(1)* %31, align 4
  store i32 %45, i32 addrspace(1)* %33, align 8
  store i32 %44, i32 addrspace(1)* %35, align 4
  store i32 %43, i32 addrspace(1)* %37, align 8
  store i32 %40, i32 addrspace(1)* %39, align 4
  call void @llvm.lifetime.end.p5i8(i64 20, i8 addrspace(5)* %23)
  ret void

49:                                               ; preds = %3, %49
  %50 = phi i32 [ %68, %49 ], [ %16, %3 ]
  %51 = phi i32 [ %64, %49 ], [ %26, %3 ]
  %52 = phi i32 [ %53, %49 ], [ %30, %3 ]
  %53 = phi i32 [ %54, %49 ], [ %32, %3 ]
  %54 = phi i32 [ %55, %49 ], [ %34, %3 ]
  %55 = phi i32 [ %56, %49 ], [ %36, %3 ]
  %56 = phi i32 [ %63, %49 ], [ %38, %3 ]
  %57 = lshr i32 %52, 2
  %58 = xor i32 %57, %52
  %59 = shl i32 %56, 4
  %60 = shl i32 %58, 1
  %61 = xor i32 %59, %60
  %62 = xor i32 %61, %56
  %63 = xor i32 %62, %58
  %64 = add i32 %51, 362437
  %65 = add i32 %63, %64
  %66 = sext i32 %50 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %66
  store i32 %65, i32 addrspace(1)* %67, align 4, !tbaa !16
  %68 = add nsw i32 %50, %22
  %69 = icmp slt i32 %68, %1
  br i1 %69, label %49, label %42, !llvm.loop !20
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
