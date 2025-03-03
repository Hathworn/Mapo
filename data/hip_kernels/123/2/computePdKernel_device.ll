; ModuleID = '../data/hip_kernels/123/2/main.cu'
source_filename = "../data/hip_kernels/123/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15computePdKernelPdiiS_E5shmem = internal addrspace(3) global [256 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15computePdKernelPdiiS_(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = icmp slt i32 %5, %2
  br i1 %6, label %7, label %45

7:                                                ; preds = %4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %8
  %13 = addrspacecast double addrspace(3)* %12 to double*
  %14 = icmp ult i32 %8, 128
  %15 = add nuw nsw i32 %8, 128
  %16 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %15
  %17 = addrspacecast double addrspace(3)* %16 to double*
  %18 = icmp ult i32 %8, 64
  %19 = add nuw nsw i32 %8, 64
  %20 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %19
  %21 = addrspacecast double addrspace(3)* %20 to double*
  %22 = icmp ult i32 %8, 32
  %23 = add nuw nsw i32 %8, 32
  %24 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %23
  %25 = addrspacecast double addrspace(3)* %24 to double*
  %26 = add nuw nsw i32 %8, 16
  %27 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %26
  %28 = addrspacecast double addrspace(3)* %27 to double*
  %29 = add nuw nsw i32 %8, 8
  %30 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %29
  %31 = addrspacecast double addrspace(3)* %30 to double*
  %32 = add nuw nsw i32 %8, 4
  %33 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %32
  %34 = addrspacecast double addrspace(3)* %33 to double*
  %35 = add nuw nsw i32 %8, 2
  %36 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %35
  %37 = addrspacecast double addrspace(3)* %36 to double*
  %38 = add nuw nsw i32 %8, 1
  %39 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 %38
  %40 = addrspacecast double addrspace(3)* %39 to double*
  %41 = icmp eq i32 %8, 0
  %42 = sitofp i32 %1 to double
  %43 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %44 = bitcast i8 addrspace(4)* %43 to i32 addrspace(4)*
  br label %46

45:                                               ; preds = %95, %4
  ret void

46:                                               ; preds = %7, %95
  %47 = phi i32 [ %5, %7 ], [ %104, %95 ]
  %48 = mul nsw i32 %47, %1
  %49 = add i32 %48, %8
  %50 = add nsw i32 %48, %1
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %55

52:                                               ; preds = %46
  %53 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %54 = zext i16 %53 to i32
  br label %81

55:                                               ; preds = %81, %46
  %56 = phi double [ 0.000000e+00, %46 ], [ %87, %81 ]
  store volatile double %56, double* %13, align 8, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %14, label %57, label %60

57:                                               ; preds = %55
  %58 = load volatile double, double* %17, align 8, !tbaa !7
  %59 = fadd contract double %56, %58
  store volatile double %59, double* %13, align 8, !tbaa !7
  br label %60

60:                                               ; preds = %57, %55
  %61 = phi double [ %59, %57 ], [ %56, %55 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %18, label %62, label %65

62:                                               ; preds = %60
  %63 = load volatile double, double* %21, align 8, !tbaa !7
  %64 = fadd contract double %61, %63
  store volatile double %64, double* %13, align 8, !tbaa !7
  br label %65

65:                                               ; preds = %62, %60
  %66 = phi double [ %64, %62 ], [ %61, %60 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %67, label %80

67:                                               ; preds = %65
  %68 = load volatile double, double* %25, align 8, !tbaa !7
  %69 = fadd contract double %66, %68
  store volatile double %69, double* %13, align 8, !tbaa !7
  %70 = load volatile double, double* %28, align 8, !tbaa !7
  %71 = fadd contract double %69, %70
  store volatile double %71, double* %13, align 8, !tbaa !7
  %72 = load volatile double, double* %31, align 8, !tbaa !7
  %73 = fadd contract double %71, %72
  store volatile double %73, double* %13, align 8, !tbaa !7
  %74 = load volatile double, double* %34, align 8, !tbaa !7
  %75 = fadd contract double %73, %74
  store volatile double %75, double* %13, align 8, !tbaa !7
  %76 = load volatile double, double* %37, align 8, !tbaa !7
  %77 = fadd contract double %75, %76
  store volatile double %77, double* %13, align 8, !tbaa !7
  %78 = load volatile double, double* %40, align 8, !tbaa !7
  %79 = fadd contract double %77, %78
  store volatile double %79, double* %13, align 8, !tbaa !7
  br label %80

80:                                               ; preds = %65, %67
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %41, label %90, label %95

81:                                               ; preds = %52, %81
  %82 = phi i32 [ %49, %52 ], [ %88, %81 ]
  %83 = phi double [ 0.000000e+00, %52 ], [ %87, %81 ]
  %84 = sext i32 %82 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7
  %87 = fadd contract double %83, %86
  %88 = add i32 %82, %54
  %89 = icmp slt i32 %88, %50
  br i1 %89, label %81, label %55, !llvm.loop !11

90:                                               ; preds = %80
  %91 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ15computePdKernelPdiiS_E5shmem, i32 0, i32 0), align 16, !tbaa !7
  %92 = fdiv contract double %91, %42
  %93 = sext i32 %47 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %3, i64 %93
  store double %92, double addrspace(1)* %94, align 8, !tbaa !7
  br label %95

95:                                               ; preds = %90, %80
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = load i32, i32 addrspace(4)* %44, align 4, !tbaa !13
  %97 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %98 = zext i16 %97 to i32
  %99 = udiv i32 %96, %98
  %100 = mul i32 %99, %98
  %101 = icmp ugt i32 %96, %100
  %102 = zext i1 %101 to i32
  %103 = add i32 %99, %47
  %104 = add i32 %103, %102
  %105 = icmp slt i32 %104, %2
  br i1 %105, label %46, label %45, !llvm.loop !22
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
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !18, i64 12}
!14 = !{!"hsa_kernel_dispatch_packet_s", !15, i64 0, !15, i64 2, !15, i64 4, !15, i64 6, !15, i64 8, !15, i64 10, !18, i64 12, !18, i64 16, !18, i64 20, !18, i64 24, !18, i64 28, !19, i64 32, !20, i64 40, !19, i64 48, !21, i64 56}
!15 = !{!"short", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !{!"int", !16, i64 0}
!19 = !{!"long", !16, i64 0}
!20 = !{!"any pointer", !16, i64 0}
!21 = !{!"hsa_signal_s", !19, i64 0}
!22 = distinct !{!22, !12}
