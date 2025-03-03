; ModuleID = '../data/hip_kernels/5330/7/main.cu'
source_filename = "../data/hip_kernels/5330/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14forward_kernelPKfS0_S0_S0_S0_PfS1_fiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* readonly %3, float addrspace(1)* readonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, float %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !4, !amdgpu.noclobber !8
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !4, !amdgpu.noclobber !8
  %18 = fcmp contract une float %17, 0.000000e+00
  %19 = fcmp contract une float %7, 0.000000e+00
  %20 = select i1 %18, i1 true, i1 %19
  br i1 %20, label %21, label %45

21:                                               ; preds = %11
  %22 = fadd contract float %17, %7
  %23 = fcmp olt float %22, 0x39F0000000000000
  %24 = select i1 %23, float 0x41F0000000000000, float 1.000000e+00
  %25 = fmul float %22, %24
  %26 = tail call float @llvm.sqrt.f32(float %25)
  %27 = bitcast float %26 to i32
  %28 = add nsw i32 %27, -1
  %29 = bitcast i32 %28 to float
  %30 = add nsw i32 %27, 1
  %31 = bitcast i32 %30 to float
  %32 = tail call i1 @llvm.amdgcn.class.f32(float %25, i32 608)
  %33 = select i1 %23, float 0x3EF0000000000000, float 1.000000e+00
  %34 = fneg float %31
  %35 = tail call float @llvm.fma.f32(float %34, float %26, float %25)
  %36 = fcmp ogt float %35, 0.000000e+00
  %37 = fneg float %29
  %38 = tail call float @llvm.fma.f32(float %37, float %26, float %25)
  %39 = fcmp ole float %38, 0.000000e+00
  %40 = select i1 %39, float %29, float %26
  %41 = select i1 %36, float %31, float %40
  %42 = fmul float %33, %41
  %43 = select i1 %32, float %25, float %42
  %44 = fdiv contract float 1.000000e+00, %43
  br label %45

45:                                               ; preds = %11, %21
  %46 = phi float [ %44, %21 ], [ 0.000000e+00, %11 ]
  %47 = icmp eq float addrspace(1)* %3, addrspacecast (float* null to float addrspace(1)*)
  br i1 %47, label %53, label %48

48:                                               ; preds = %45
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %13
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !4, !amdgpu.noclobber !8
  %51 = tail call float @llvm.fabs.f32(float %50)
  %52 = fadd contract float %51, %7
  br label %53

53:                                               ; preds = %45, %48
  %54 = phi contract float [ %52, %48 ], [ 1.000000e+00, %45 ]
  %55 = icmp eq float addrspace(1)* %4, addrspacecast (float* null to float addrspace(1)*)
  br i1 %55, label %59, label %56

56:                                               ; preds = %53
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %13
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !4, !amdgpu.noclobber !8
  br label %59

59:                                               ; preds = %53, %56
  %60 = phi contract float [ %58, %56 ], [ 0.000000e+00, %53 ]
  %61 = icmp sgt i32 %8, 0
  br i1 %61, label %62, label %68

62:                                               ; preds = %59
  %63 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %64 = icmp slt i32 %63, %10
  %65 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %66 = getelementptr i8, i8 addrspace(4)* %65, i64 4
  %67 = bitcast i8 addrspace(4)* %66 to i16 addrspace(4)*
  br label %69

68:                                               ; preds = %77, %59
  ret void

69:                                               ; preds = %62, %77
  %70 = phi i32 [ 0, %62 ], [ %78, %77 ]
  br i1 %64, label %71, label %77

71:                                               ; preds = %69
  %72 = mul nsw i32 %70, %9
  %73 = add nsw i32 %72, %12
  %74 = mul nsw i32 %73, %10
  %75 = load i16, i16 addrspace(4)* %67, align 4, !range !10, !invariant.load !8
  %76 = zext i16 %75 to i32
  br label %80

77:                                               ; preds = %80, %69
  %78 = add nuw nsw i32 %70, 1
  %79 = icmp eq i32 %78, %8
  br i1 %79, label %68, label %69, !llvm.loop !11

80:                                               ; preds = %71, %80
  %81 = phi i32 [ %63, %71 ], [ %92, %80 ]
  %82 = add nsw i32 %81, %74
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !4
  %86 = fsub contract float %85, %15
  %87 = fmul contract float %46, %86
  %88 = fmul contract float %54, %87
  %89 = fadd contract float %60, %88
  %90 = getelementptr inbounds float, float addrspace(1)* %5, i64 %83
  store float %87, float addrspace(1)* %90, align 4, !tbaa !4
  %91 = getelementptr inbounds float, float addrspace(1)* %6, i64 %83
  store float %89, float addrspace(1)* %91, align 4, !tbaa !4
  %92 = add i32 %81, %76
  %93 = icmp slt i32 %92, %10
  br i1 %93, label %80, label %77, !llvm.loop !13
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
