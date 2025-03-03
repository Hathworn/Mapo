; ModuleID = '../data/hip_kernels/952/1/main.cu'
source_filename = "../data/hip_kernels/952/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@dx = protected addrspace(4) externally_initialized global double 1.000000e-02, align 8
@voltage = protected addrspace(4) externally_initialized global double 1.000000e+04, align 8
@eps = protected addrspace(4) externally_initialized global double 1.000000e-04, align 8
@_ZZ11gpu_poissonPdS_S_E4s_in = internal unnamed_addr addrspace(3) global [189 x double] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [3 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @dx to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @eps to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @voltage to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11gpu_poissonPdS_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add nuw nsw i32 %14, 1
  %16 = add nuw nsw i32 %12, 1
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = add i32 %4, %20
  %22 = urem i32 %21, 101
  %23 = add i32 %4, 100
  %24 = urem i32 %23, 101
  %25 = mul i32 %4, 122
  %26 = add i32 %13, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %1, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7, !amdgpu.noclobber !5
  %30 = mul nuw nsw i32 %15, 63
  %31 = add nuw nsw i32 %30, %16
  %32 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %31
  store double %29, double addrspace(3)* %32, align 8, !tbaa !7
  %33 = icmp eq i32 %12, 0
  br i1 %33, label %34, label %50

34:                                               ; preds = %3
  %35 = add i32 %13, 121
  %36 = urem i32 %35, 122
  %37 = add i32 %13, %10
  %38 = urem i32 %37, 122
  %39 = add i32 %36, %25
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !5
  %43 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %30
  store double %42, double addrspace(3)* %43, align 8, !tbaa !7
  %44 = add i32 %38, %25
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !5
  %48 = add nuw nsw i32 %31, %10
  %49 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %48
  store double %47, double addrspace(3)* %49, align 8, !tbaa !7
  br label %50

50:                                               ; preds = %34, %3
  %51 = icmp eq i32 %14, 0
  br i1 %51, label %52, label %68

52:                                               ; preds = %50
  %53 = mul nuw nsw i32 %24, 122
  %54 = add i32 %13, %53
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7, !amdgpu.noclobber !5
  %58 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %16
  store double %57, double addrspace(3)* %58, align 8, !tbaa !7
  %59 = mul nuw nsw i32 %22, 122
  %60 = add i32 %59, %13
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %1, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7, !amdgpu.noclobber !5
  %64 = add nuw nsw i32 %15, %20
  %65 = mul nuw nsw i32 %64, 63
  %66 = add nuw nsw i32 %65, %16
  %67 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %66
  store double %63, double addrspace(3)* %67, align 8, !tbaa !7
  br label %68

68:                                               ; preds = %52, %50
  switch i32 %4, label %77 [
    i32 0, label %69
    i32 100, label %73
  ]

69:                                               ; preds = %68
  %70 = load double, double addrspace(4)* @voltage, align 8, !tbaa !7
  %71 = zext i32 %13 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %1, i64 %71
  store double %70, double addrspace(1)* %72, align 8, !tbaa !7
  br label %108

73:                                               ; preds = %68
  %74 = add i32 %13, 12200
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %1, i64 %75
  store double 0.000000e+00, double addrspace(1)* %76, align 8, !tbaa !7
  br label %108

77:                                               ; preds = %68
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = getelementptr inbounds double, double addrspace(1)* %0, i64 %27
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7, !amdgpu.noclobber !5
  %80 = load double, double addrspace(3)* %32, align 8, !tbaa !7
  %81 = add nuw nsw i32 %30, %12
  %82 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %81
  %83 = load double, double addrspace(3)* %82, align 8, !tbaa !7
  %84 = add nuw nsw i32 %81, 2
  %85 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %84
  %86 = load double, double addrspace(3)* %85, align 8, !tbaa !7
  %87 = mul nuw nsw i32 %14, 63
  %88 = add nuw nsw i32 %87, 126
  %89 = add nuw nsw i32 %88, %16
  %90 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %89
  %91 = load double, double addrspace(3)* %90, align 8, !tbaa !7
  %92 = add nuw nsw i32 %87, %16
  %93 = getelementptr inbounds [189 x double], [189 x double] addrspace(3)* @_ZZ11gpu_poissonPdS_S_E4s_in, i32 0, i32 %92
  %94 = load double, double addrspace(3)* %93, align 8, !tbaa !7
  %95 = load double, double addrspace(4)* @eps, align 8, !tbaa !7
  %96 = fdiv contract double %79, %95
  %97 = load double, double addrspace(4)* @dx, align 8, !tbaa !7
  %98 = fmul contract double %96, %97
  %99 = fmul contract double %97, %98
  %100 = fadd contract double %83, %86
  %101 = fadd contract double %100, %91
  %102 = fadd contract double %101, %94
  %103 = fadd contract double %102, %99
  %104 = fmul contract double %103, 2.500000e-01
  %105 = fsub contract double %104, %80
  %106 = tail call double @llvm.fabs.f64(double %105)
  %107 = getelementptr inbounds double, double addrspace(1)* %2, i64 %27
  store double %106, double addrspace(1)* %107, align 8, !tbaa !7
  store double %104, double addrspace(1)* %28, align 8, !tbaa !7
  br label %108

108:                                              ; preds = %77, %73, %69
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
