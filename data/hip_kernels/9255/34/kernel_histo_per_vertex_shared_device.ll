; ModuleID = '../data/hip_kernels/9255/34/main.cu'
source_filename = "../data/hip_kernels/9255/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@constant_n_test_vertices = protected addrspace(4) externally_initialized global i32 0, align 4
@constant_n_time_bins = protected addrspace(4) externally_initialized global i32 0, align 4
@constant_n_hits = protected addrspace(4) externally_initialized global i32 0, align 4
@temp = external hidden addrspace(3) global [0 x i32], align 4
@llvm.compiler.used = appending addrspace(1) global [3 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @constant_n_hits to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @constant_n_test_vertices to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @constant_n_time_bins to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z30kernel_histo_per_vertex_sharedPjS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = add i32 %10, %3
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 16
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 8, !tbaa !7
  %20 = load i32, i32 addrspace(4)* @constant_n_test_vertices, align 4, !tbaa !16
  %21 = icmp ult i32 %11, %20
  br i1 %21, label %22, label %67

22:                                               ; preds = %2
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = mul i32 %23, %16
  %25 = add i32 %24, %12
  %26 = load i32, i32 addrspace(4)* @constant_n_hits, align 4, !tbaa !16
  %27 = mul i32 %26, %11
  %28 = udiv i32 %19, %16
  %29 = mul i32 %28, %16
  %30 = icmp ugt i32 %19, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %16
  %34 = add i32 %25, %27
  %35 = load i32, i32 addrspace(4)* @constant_n_time_bins, align 4, !tbaa !16
  %36 = mul i32 %35, %11
  %37 = icmp ult i32 %12, %35
  br i1 %37, label %38, label %43

38:                                               ; preds = %22, %38
  %39 = phi i32 [ %41, %38 ], [ %12, %22 ]
  %40 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %39
  store i32 0, i32 addrspace(3)* %40, align 4, !tbaa !16
  %41 = add i32 %39, %16
  %42 = icmp ult i32 %41, %35
  br i1 %42, label %38, label %43, !llvm.loop !20

43:                                               ; preds = %38, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = add i32 %27, %26
  %45 = icmp ult i32 %34, %44
  br i1 %45, label %46, label %56

46:                                               ; preds = %43, %46
  %47 = phi i32 [ %54, %46 ], [ %34, %43 ]
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !6
  %51 = sub i32 %50, %36
  %52 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %51
  %53 = atomicrmw add i32 addrspace(3)* %52, i32 1 syncscope("agent-one-as") monotonic, align 4
  %54 = add i32 %47, %33
  %55 = icmp ult i32 %54, %44
  br i1 %55, label %46, label %56, !llvm.loop !22

56:                                               ; preds = %46, %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %37, label %57, label %67

57:                                               ; preds = %56, %57
  %58 = phi i32 [ %65, %57 ], [ %12, %56 ]
  %59 = add i32 %58, %36
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %62 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %58
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !16
  %64 = atomicrmw add i32 addrspace(1)* %61, i32 %63 syncscope("agent-one-as") monotonic, align 4
  %65 = add i32 %58, %16
  %66 = icmp ult i32 %65, %35
  br i1 %66, label %57, label %67, !llvm.loop !23

67:                                               ; preds = %57, %56, %2
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!7 = !{!8, !12, i64 16}
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
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
