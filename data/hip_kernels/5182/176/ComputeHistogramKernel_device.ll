; ModuleID = '../data/hip_kernels/5182/176/main.cu'
source_filename = "../data/hip_kernels/5182/176/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@D_MIN_VALUE = protected addrspace(4) externally_initialized global double 0.000000e+00, align 8
@D_MAX_VALUE = protected addrspace(4) externally_initialized global double 0.000000e+00, align 8
@D_BINS = protected addrspace(4) externally_initialized global i32 0, align 4
@D_BIN_VALUE_WIDTH = protected addrspace(4) externally_initialized global float 0.000000e+00, align 4
@D_MEMORY_BLOCK_SIZE = protected addrspace(4) externally_initialized global i32 0, align 4
@partialHist = external hidden addrspace(3) global [0 x i32], align 4
@llvm.compiler.used = appending addrspace(1) global [5 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_BINS to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float addrspace(4)* @D_BIN_VALUE_WIDTH to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @D_MAX_VALUE to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_MEMORY_BLOCK_SIZE to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @D_MIN_VALUE to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z22ComputeHistogramKernelPfPi(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !6
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = udiv i32 %10, %7
  %14 = mul i32 %13, %7
  %15 = icmp ugt i32 %10, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = mul i32 %17, %12
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %11
  %21 = mul i32 %20, %7
  %22 = add i32 %21, %19
  %23 = load i32, i32 addrspace(4)* @D_BINS, align 4, !tbaa !16
  %24 = icmp slt i32 %19, %23
  br i1 %24, label %25, label %27

25:                                               ; preds = %2
  %26 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialHist, i32 0, i32 %19
  store i32 0, i32 addrspace(3)* %26, align 4, !tbaa !16
  br label %27

27:                                               ; preds = %25, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = load i32, i32 addrspace(4)* @D_MEMORY_BLOCK_SIZE, align 4, !tbaa !16
  %29 = icmp slt i32 %22, %28
  br i1 %29, label %30, label %64

30:                                               ; preds = %27
  %31 = sext i32 %22 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !20, !amdgpu.noclobber !5
  %34 = add nsw i32 %23, -1
  %35 = fpext float %33 to double
  %36 = load double, double addrspace(4)* @D_MAX_VALUE, align 8, !tbaa !22
  %37 = fcmp contract olt double %36, %35
  %38 = select i1 %37, i32 %34, i32 0
  %39 = load double, double addrspace(4)* @D_MIN_VALUE, align 8, !tbaa !22
  %40 = fcmp contract ugt double %39, %35
  %41 = fcmp contract ult double %36, %35
  %42 = select i1 %40, i1 true, i1 %41
  br i1 %42, label %54, label %43

43:                                               ; preds = %30
  %44 = fsub contract double %35, %39
  %45 = fptrunc double %44 to float
  %46 = load float, float addrspace(4)* @D_BIN_VALUE_WIDTH, align 4, !tbaa !20
  %47 = fdiv contract float %45, %46
  %48 = tail call float @llvm.floor.f32(float %47)
  %49 = fptosi float %48 to i32
  %50 = add nsw i32 %49, 1
  %51 = fcmp contract oeq double %36, %35
  %52 = add nsw i32 %23, -2
  %53 = select i1 %51, i32 %52, i32 %50
  br label %54

54:                                               ; preds = %43, %30
  %55 = phi i32 [ %53, %43 ], [ %38, %30 ]
  %56 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialHist, i32 0, i32 %55
  %57 = atomicrmw add i32 addrspace(3)* %56, i32 1 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %58, label %64

58:                                               ; preds = %54
  %59 = zext i32 %19 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialHist, i32 0, i32 %19
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !16
  %63 = atomicrmw add i32 addrspace(1)* %60, i32 %62 syncscope("agent-one-as") monotonic, align 4
  br label %64

64:                                               ; preds = %54, %58, %27
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"double", !18, i64 0}
