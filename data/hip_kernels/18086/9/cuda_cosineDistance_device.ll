; ModuleID = '../data/hip_kernels/18086/9/main.cu'
source_filename = "../data/hip_kernels/18086/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19cuda_cosineDistancePdS_lS_S_S_E9dot_cache = internal unnamed_addr addrspace(3) global [16 x double] undef, align 16
@_ZZ19cuda_cosineDistancePdS_lS_S_S_E12norm_x_cache = internal unnamed_addr addrspace(3) global [16 x double] undef, align 16
@_ZZ19cuda_cosineDistancePdS_lS_S_S_E12norm_y_cache = internal unnamed_addr addrspace(3) global [16 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19cuda_cosineDistancePdS_lS_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i64 %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture writeonly %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = mul i32 %8, %13
  %18 = add i32 %17, %7
  %19 = zext i32 %18 to i64
  %20 = zext i32 %7 to i64
  %21 = icmp slt i64 %19, %2
  br i1 %21, label %22, label %47

22:                                               ; preds = %6
  %23 = udiv i32 %16, %13
  %24 = mul i32 %23, %13
  %25 = icmp ugt i32 %16, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %13
  %29 = zext i32 %28 to i64
  br label %30

30:                                               ; preds = %22, %30
  %31 = phi double [ 0.000000e+00, %22 ], [ %44, %30 ]
  %32 = phi double [ 0.000000e+00, %22 ], [ %42, %30 ]
  %33 = phi double [ 0.000000e+00, %22 ], [ %40, %30 ]
  %34 = phi i64 [ %19, %22 ], [ %45, %30 ]
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16, !amdgpu.noclobber !6
  %37 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !16, !amdgpu.noclobber !6
  %39 = fmul contract double %36, %38
  %40 = fadd contract double %33, %39
  %41 = fmul contract double %36, %36
  %42 = fadd contract double %32, %41
  %43 = fmul contract double %38, %38
  %44 = fadd contract double %31, %43
  %45 = add nuw nsw i64 %34, %29
  %46 = icmp slt i64 %45, %2
  br i1 %46, label %30, label %47, !llvm.loop !20

47:                                               ; preds = %30, %6
  %48 = phi double [ 0.000000e+00, %6 ], [ %40, %30 ]
  %49 = phi double [ 0.000000e+00, %6 ], [ %42, %30 ]
  %50 = phi double [ 0.000000e+00, %6 ], [ %44, %30 ]
  %51 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E9dot_cache, i32 0, i32 %7
  store double %48, double addrspace(3)* %51, align 8, !tbaa !16
  %52 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E12norm_x_cache, i32 0, i32 %7
  store double %49, double addrspace(3)* %52, align 8, !tbaa !16
  %53 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E12norm_y_cache, i32 0, i32 %7
  store double %50, double addrspace(3)* %53, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp ult i16 %12, 2
  br i1 %54, label %80, label %55

55:                                               ; preds = %47
  %56 = lshr i32 %13, 1
  %57 = zext i32 %56 to i64
  br label %58

58:                                               ; preds = %55, %76
  %59 = phi i64 [ %77, %76 ], [ %57, %55 ]
  %60 = icmp sgt i64 %59, %20
  br i1 %60, label %61, label %76

61:                                               ; preds = %58
  %62 = trunc i64 %59 to i32
  %63 = add i32 %7, %62
  %64 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E9dot_cache, i32 0, i32 %63
  %65 = load double, double addrspace(3)* %64, align 8, !tbaa !16
  %66 = load double, double addrspace(3)* %51, align 8, !tbaa !16
  %67 = fadd contract double %65, %66
  store double %67, double addrspace(3)* %51, align 8, !tbaa !16
  %68 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E12norm_x_cache, i32 0, i32 %63
  %69 = load double, double addrspace(3)* %68, align 8, !tbaa !16
  %70 = load double, double addrspace(3)* %52, align 8, !tbaa !16
  %71 = fadd contract double %69, %70
  store double %71, double addrspace(3)* %52, align 8, !tbaa !16
  %72 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E12norm_y_cache, i32 0, i32 %63
  %73 = load double, double addrspace(3)* %72, align 8, !tbaa !16
  %74 = load double, double addrspace(3)* %53, align 8, !tbaa !16
  %75 = fadd contract double %73, %74
  store double %75, double addrspace(3)* %53, align 8, !tbaa !16
  br label %76

76:                                               ; preds = %61, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = sdiv i64 %59, 2
  %78 = add nsw i64 %59, 1
  %79 = icmp ult i64 %78, 3
  br i1 %79, label %80, label %58, !llvm.loop !22

80:                                               ; preds = %76, %47
  %81 = icmp eq i32 %7, 0
  br i1 %81, label %82, label %90

82:                                               ; preds = %80
  %83 = load double, double addrspace(3)* getelementptr inbounds ([16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E9dot_cache, i32 0, i32 0), align 16, !tbaa !16
  %84 = zext i32 %8 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %3, i64 %84
  store double %83, double addrspace(1)* %85, align 8, !tbaa !16
  %86 = load double, double addrspace(3)* getelementptr inbounds ([16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E12norm_x_cache, i32 0, i32 0), align 16, !tbaa !16
  %87 = getelementptr inbounds double, double addrspace(1)* %4, i64 %84
  store double %86, double addrspace(1)* %87, align 8, !tbaa !16
  %88 = load double, double addrspace(3)* getelementptr inbounds ([16 x double], [16 x double] addrspace(3)* @_ZZ19cuda_cosineDistancePdS_lS_S_S_E12norm_y_cache, i32 0, i32 0), align 16, !tbaa !16
  %89 = getelementptr inbounds double, double addrspace(1)* %5, i64 %84
  store double %88, double addrspace(1)* %89, align 8, !tbaa !16
  br label %90

90:                                               ; preds = %82, %80
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
