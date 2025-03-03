; ModuleID = '../data/hip_kernels/191/9/main.cu'
source_filename = "../data/hip_kernels/191/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@dot_product_wr_lock = protected addrspace(1) externally_initialized global i32 0, align 4
@dprs_r4 = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @dot_product_wr_lock to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26gpu_array_dot_product_r4__mPKfS0_PVf(i64 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* %3) local_unnamed_addr #0 {
  %5 = addrspacecast float addrspace(1)* %3 to float*
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = zext i32 %17 to i64
  %19 = icmp ult i64 %18, %0
  br i1 %19, label %20, label %39

20:                                               ; preds = %4
  %21 = udiv i32 %14, %11
  %22 = mul i32 %21, %11
  %23 = icmp ugt i32 %14, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %11
  %27 = zext i32 %26 to i64
  br label %28

28:                                               ; preds = %20, %28
  %29 = phi float [ 0.000000e+00, %20 ], [ %36, %28 ]
  %30 = phi i64 [ %18, %20 ], [ %37, %28 ]
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !5
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !5
  %35 = fmul contract float %32, %34
  %36 = fadd contract float %29, %35
  %37 = add i64 %30, %27
  %38 = icmp ult i64 %37, %0
  br i1 %38, label %28, label %39, !llvm.loop !20

39:                                               ; preds = %28, %4
  %40 = phi float [ 0.000000e+00, %4 ], [ %36, %28 ]
  %41 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @dprs_r4, i32 0, i32 %16
  store float %40, float addrspace(3)* %41, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = icmp ugt i16 %10, 1
  br i1 %42, label %43, label %57

43:                                               ; preds = %39, %55
  %44 = phi i32 [ %45, %55 ], [ 1, %39 ]
  %45 = shl nsw i32 %44, 1
  %46 = mul i32 %45, %16
  %47 = add nsw i32 %46, %44
  %48 = icmp ult i32 %47, %11
  br i1 %48, label %49, label %55

49:                                               ; preds = %43
  %50 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @dprs_r4, i32 0, i32 %47
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !16
  %52 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @dprs_r4, i32 0, i32 %46
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !16
  %54 = fadd contract float %51, %53
  store float %54, float addrspace(3)* %52, align 4, !tbaa !16
  br label %55

55:                                               ; preds = %49, %43
  %56 = icmp ult i32 %45, %11
  br i1 %56, label %43, label %57, !llvm.loop !22

57:                                               ; preds = %55, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = icmp eq i32 %16, 0
  br i1 %58, label %59, label %67

59:                                               ; preds = %57, %59
  %60 = atomicrmw max i32 addrspace(1)* @dot_product_wr_lock, i32 1 syncscope("agent-one-as") monotonic, align 4
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %59, label %62, !llvm.loop !23

62:                                               ; preds = %59
  %63 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @dprs_r4, i32 0, i32 0), align 4, !tbaa !16
  %64 = load volatile float, float* %5, align 4, !tbaa !16
  %65 = fadd contract float %63, %64
  store volatile float %65, float* %5, align 4, !tbaa !16
  fence syncscope("agent") seq_cst
  %66 = atomicrmw xchg i32 addrspace(1)* @dot_product_wr_lock, i32 0 syncscope("agent-one-as") monotonic, align 4
  br label %67

67:                                               ; preds = %62, %57
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
