; ModuleID = '../data/hip_kernels/8124/0/main.cu'
source_filename = "../data/hip_kernels/8124/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7kernel5PfS_jE7scratch = internal addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7kernel5PfS_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %6 = bitcast i8 addrspace(4)* %5 to i32 addrspace(4)*
  %7 = load i32, i32 addrspace(4)* %6, align 4, !tbaa !4
  %8 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !13, !invariant.load !14
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %7, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %7, %13
  %15 = zext i1 %14 to i32
  %16 = add i32 %12, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = mul i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = add i32 %18, %19
  %21 = shl nuw nsw i32 %11, 1
  %22 = mul i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = mul i32 %16, %21
  %26 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 %23
  %27 = addrspacecast float addrspace(3)* %26 to float*
  store volatile float 0.000000e+00, float* %27, align 4, !tbaa !16
  %28 = icmp ult i32 %24, %2
  br i1 %28, label %29, label %43

29:                                               ; preds = %3, %29
  %30 = phi i32 [ %41, %29 ], [ %24, %3 ]
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !14
  %34 = add i32 %30, %11
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !14
  %38 = fadd contract float %33, %37
  %39 = load volatile float, float* %27, align 4, !tbaa !16
  %40 = fadd contract float %39, %38
  store volatile float %40, float* %27, align 4, !tbaa !16
  %41 = add i32 %30, %25
  %42 = icmp ult i32 %41, %2
  br i1 %42, label %29, label %43, !llvm.loop !20

43:                                               ; preds = %29, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = icmp ugt i16 %10, 65
  br i1 %44, label %47, label %45

45:                                               ; preds = %58, %43
  %46 = icmp ult i32 %23, 33
  br i1 %46, label %60, label %97

47:                                               ; preds = %43, %58
  %48 = phi i32 [ %49, %58 ], [ %11, %43 ]
  %49 = lshr i32 %48, 1
  %50 = icmp ult i32 %23, %49
  br i1 %50, label %51, label %58

51:                                               ; preds = %47
  %52 = add nuw nsw i32 %49, %23
  %53 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 %52
  %54 = addrspacecast float addrspace(3)* %53 to float*
  %55 = load volatile float, float* %54, align 4, !tbaa !16
  %56 = load volatile float, float* %27, align 4, !tbaa !16
  %57 = fadd contract float %55, %56
  store volatile float %57, float* %27, align 4, !tbaa !16
  br label %58

58:                                               ; preds = %51, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = icmp ugt i32 %48, 131
  br i1 %59, label %47, label %45, !llvm.loop !22

60:                                               ; preds = %45
  %61 = add nuw nsw i32 %23, 32
  %62 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 %61
  %63 = addrspacecast float addrspace(3)* %62 to float*
  %64 = load volatile float, float* %63, align 4, !tbaa !16
  %65 = load volatile float, float* %27, align 4, !tbaa !16
  %66 = fadd contract float %64, %65
  store volatile float %66, float* %27, align 4, !tbaa !16
  %67 = add nuw nsw i32 %23, 16
  %68 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 %67
  %69 = addrspacecast float addrspace(3)* %68 to float*
  %70 = load volatile float, float* %69, align 4, !tbaa !16
  %71 = load volatile float, float* %27, align 4, !tbaa !16
  %72 = fadd contract float %70, %71
  store volatile float %72, float* %27, align 4, !tbaa !16
  %73 = add nuw nsw i32 %23, 8
  %74 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 %73
  %75 = addrspacecast float addrspace(3)* %74 to float*
  %76 = load volatile float, float* %75, align 4, !tbaa !16
  %77 = load volatile float, float* %27, align 4, !tbaa !16
  %78 = fadd contract float %76, %77
  store volatile float %78, float* %27, align 4, !tbaa !16
  %79 = add nuw nsw i32 %23, 4
  %80 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 %79
  %81 = addrspacecast float addrspace(3)* %80 to float*
  %82 = load volatile float, float* %81, align 4, !tbaa !16
  %83 = load volatile float, float* %27, align 4, !tbaa !16
  %84 = fadd contract float %82, %83
  store volatile float %84, float* %27, align 4, !tbaa !16
  %85 = add nuw nsw i32 %23, 2
  %86 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 %85
  %87 = addrspacecast float addrspace(3)* %86 to float*
  %88 = load volatile float, float* %87, align 4, !tbaa !16
  %89 = load volatile float, float* %27, align 4, !tbaa !16
  %90 = fadd contract float %88, %89
  store volatile float %90, float* %27, align 4, !tbaa !16
  %91 = add nuw nsw i32 %23, 1
  %92 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 %91
  %93 = addrspacecast float addrspace(3)* %92 to float*
  %94 = load volatile float, float* %93, align 4, !tbaa !16
  %95 = load volatile float, float* %27, align 4, !tbaa !16
  %96 = fadd contract float %94, %95
  store volatile float %96, float* %27, align 4, !tbaa !16
  br label %97

97:                                               ; preds = %60, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = icmp eq i32 %23, 0
  br i1 %98, label %99, label %103

99:                                               ; preds = %97
  %100 = load volatile float, float* addrspacecast (float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ7kernel5PfS_jE7scratch, i32 0, i32 0) to float*), align 16, !tbaa !16
  %101 = zext i32 %20 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  store float %100, float addrspace(1)* %102, align 4, !tbaa !16
  br label %103

103:                                              ; preds = %99, %97
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
