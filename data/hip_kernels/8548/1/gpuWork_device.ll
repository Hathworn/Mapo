; ModuleID = '../data/hip_kernels/8548/1/main.cu'
source_filename = "../data/hip_kernels/8548/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7gpuWorkPdS_S_iiE6errors = internal unnamed_addr addrspace(3) global [1024 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7gpuWorkPdS_S_ii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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
  %18 = add i32 %17, 1
  %19 = zext i32 %18 to i64
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = add i32 %27, 1
  %29 = zext i32 %28 to i64
  %30 = mul nuw nsw i32 %20, %12
  %31 = add nuw nsw i32 %30, %6
  %32 = zext i32 %31 to i64
  %33 = zext i32 %17 to i64
  %34 = add nsw i32 %3, 2
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ7gpuWorkPdS_S_iiE6errors, i32 0, i32 %31
  store double 0.000000e+00, double addrspace(3)* %36, align 8, !tbaa !16
  %37 = sext i32 %3 to i64
  %38 = icmp slt i64 %33, %37
  %39 = zext i32 %27 to i64
  %40 = sext i32 %4 to i64
  %41 = icmp slt i64 %39, %40
  %42 = select i1 %38, i1 %41, i1 false
  br i1 %42, label %43, label %102

43:                                               ; preds = %5
  %44 = add nsw i64 %29, -1
  %45 = mul nsw i64 %44, %35
  %46 = add nsw i64 %45, %19
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !16, !amdgpu.noclobber !6
  %49 = add nuw nsw i64 %29, 1
  %50 = mul nsw i64 %49, %35
  %51 = add nsw i64 %50, %19
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16, !amdgpu.noclobber !6
  %54 = fadd contract double %48, %53
  %55 = mul nsw i64 %29, %35
  %56 = add nsw i64 %55, %19
  %57 = add nsw i64 %56, -1
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !16, !amdgpu.noclobber !6
  %60 = fadd contract double %54, %59
  %61 = add nsw i64 %56, 1
  %62 = getelementptr inbounds double, double addrspace(1)* %1, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !16, !amdgpu.noclobber !6
  %64 = fadd contract double %60, %63
  %65 = fmul contract double %64, 2.500000e-01
  %66 = getelementptr inbounds double, double addrspace(1)* %1, i64 %56
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !16, !amdgpu.noclobber !6
  %68 = fsub contract double %65, %67
  %69 = tail call double @llvm.fabs.f64(double %68)
  store double %69, double addrspace(3)* %36, align 8, !tbaa !16
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  store double %65, double addrspace(1)* %70, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = mul nuw nsw i32 %25, %12
  %72 = icmp ult i32 %71, 2
  br i1 %72, label %76, label %73

73:                                               ; preds = %43
  %74 = lshr i32 %71, 1
  %75 = zext i32 %74 to i64
  br label %78

76:                                               ; preds = %88, %43
  %77 = icmp eq i32 %31, 0
  br i1 %77, label %91, label %102

78:                                               ; preds = %73, %88
  %79 = phi i64 [ %89, %88 ], [ %75, %73 ]
  %80 = icmp ugt i64 %79, %32
  br i1 %80, label %81, label %88

81:                                               ; preds = %78
  %82 = load double, double addrspace(3)* %36, align 8, !tbaa !16
  %83 = trunc i64 %79 to i32
  %84 = add nuw nsw i32 %31, %83
  %85 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @_ZZ7gpuWorkPdS_S_iiE6errors, i32 0, i32 %84
  %86 = load double, double addrspace(3)* %85, align 8, !tbaa !16
  %87 = tail call double @llvm.maxnum.f64(double %82, double %86)
  store double %87, double addrspace(3)* %36, align 8, !tbaa !16
  br label %88

88:                                               ; preds = %81, %78
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = lshr i64 %79, 1
  %90 = icmp ult i64 %79, 2
  br i1 %90, label %76, label %78, !llvm.loop !20

91:                                               ; preds = %76
  %92 = udiv i32 %15, %12
  %93 = mul i32 %92, %12
  %94 = icmp ugt i32 %15, %93
  %95 = zext i1 %94 to i32
  %96 = add i32 %92, %95
  %97 = mul i32 %96, %21
  %98 = add i32 %97, %7
  %99 = load double, double addrspace(3)* getelementptr inbounds ([1024 x double], [1024 x double] addrspace(3)* @_ZZ7gpuWorkPdS_S_iiE6errors, i32 0, i32 0), align 16, !tbaa !16
  %100 = sext i32 %98 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %2, i64 %100
  store double %99, double addrspace(1)* %101, align 8, !tbaa !16
  br label %102

102:                                              ; preds = %76, %91, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
