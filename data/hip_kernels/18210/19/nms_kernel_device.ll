; ModuleID = '../data/hip_kernels/18210/19/main.cu'
source_filename = "../data/hip_kernels/18210/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10nms_kernelPfPyiifE2sh = internal unnamed_addr addrspace(3) global [320 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10nms_kernelPfPyiif(float addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = shl nsw i32 %7, 6
  %10 = sub nsw i32 %2, %9
  %11 = tail call i32 @llvm.smin.i32(i32 %10, i32 64)
  %12 = shl nsw i32 %6, 6
  %13 = sub nsw i32 %2, %12
  %14 = tail call i32 @llvm.smin.i32(i32 %13, i32 64)
  %15 = icmp slt i32 %8, %14
  br i1 %15, label %16, label %48

16:                                               ; preds = %5
  %17 = add nsw i32 %12, %8
  %18 = mul nsw i32 %17, 5
  %19 = mul nuw nsw i32 %8, 5
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelPfPyiifE2sh, i32 0, i32 %19
  store float %22, float addrspace(3)* %23, align 4, !tbaa !5
  %24 = add nsw i32 %18, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = add nuw nsw i32 %19, 1
  %29 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelPfPyiifE2sh, i32 0, i32 %28
  store float %27, float addrspace(3)* %29, align 4, !tbaa !5
  %30 = add nsw i32 %18, 2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = add nuw nsw i32 %19, 2
  %35 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelPfPyiifE2sh, i32 0, i32 %34
  store float %33, float addrspace(3)* %35, align 4, !tbaa !5
  %36 = add nsw i32 %18, 3
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = add nuw nsw i32 %19, 3
  %41 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelPfPyiifE2sh, i32 0, i32 %40
  store float %39, float addrspace(3)* %41, align 4, !tbaa !5
  %42 = add nsw i32 %18, 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = add nuw nsw i32 %19, 4
  %47 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelPfPyiifE2sh, i32 0, i32 %46
  store float %45, float addrspace(3)* %47, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %48

48:                                               ; preds = %16, %5
  %49 = icmp slt i32 %8, %11
  br i1 %49, label %50, label %109

50:                                               ; preds = %48
  %51 = add nsw i32 %9, %8
  %52 = mul nsw i32 %51, 5
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = icmp eq i32 %6, %7
  %56 = add nuw nsw i32 %8, 1
  %57 = select i1 %55, i32 %56, i32 0
  %58 = icmp slt i32 %57, %14
  br i1 %58, label %59, label %103

59:                                               ; preds = %50
  %60 = mul nuw nsw i32 %8, 5
  %61 = getelementptr inbounds [320 x float], [320 x float] addrspace(3)* @_ZZ10nms_kernelPfPyiifE2sh, i32 0, i32 %60
  %62 = getelementptr inbounds float, float addrspace(1)* %54, i64 2
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = getelementptr inbounds float, float addrspace(3)* %61, i32 2
  %65 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %66 = tail call float @llvm.minnum.f32(float %63, float %65)
  %67 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %69 = tail call float @llvm.maxnum.f32(float %67, float %68)
  %70 = fsub contract float %66, %69
  %71 = fpext float %70 to double
  %72 = tail call double @llvm.maxnum.f64(double %71, double 0.000000e+00)
  %73 = fptrunc double %72 to float
  %74 = getelementptr inbounds float, float addrspace(1)* %54, i64 3
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = getelementptr inbounds float, float addrspace(3)* %61, i32 3
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %78 = tail call float @llvm.minnum.f32(float %75, float %77)
  %79 = getelementptr inbounds float, float addrspace(1)* %54, i64 1
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = getelementptr inbounds float, float addrspace(3)* %61, i32 1
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %83 = tail call float @llvm.maxnum.f32(float %80, float %82)
  %84 = fsub contract float %78, %83
  %85 = fpext float %84 to double
  %86 = tail call double @llvm.maxnum.f64(double %85, double 0.000000e+00)
  %87 = fptrunc double %86 to float
  %88 = fmul contract float %73, %87
  %89 = fsub contract float %63, %67
  %90 = fsub contract float %75, %80
  %91 = fmul contract float %89, %90
  %92 = fsub contract float %65, %68
  %93 = fsub contract float %77, %82
  %94 = fmul contract float %92, %93
  %95 = fadd contract float %91, %94
  %96 = fsub contract float %95, %88
  %97 = fadd contract float %96, 0x3F1A36E2E0000000
  %98 = fdiv contract float %88, %97
  %99 = zext i32 %8 to i64
  %100 = shl nuw i64 1, %99
  %101 = fcmp contract ult float %98, %4
  %102 = select i1 %101, i64 0, i64 %100
  br label %103

103:                                              ; preds = %59, %50
  %104 = phi i64 [ 0, %50 ], [ %102, %59 ]
  %105 = mul nsw i32 %51, %3
  %106 = add nsw i32 %105, %6
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %107
  store i64 %104, i64 addrspace(1)* %108, align 8, !tbaa !10
  br label %109

109:                                              ; preds = %103, %48
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"long long", !7, i64 0}
