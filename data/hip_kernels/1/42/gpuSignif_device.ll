; ModuleID = '../data/hip_kernels/1/42/main.cu'
source_filename = "../data/hip_kernels/1/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9gpuSignifPKfS0_mPf(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i64 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = shl nuw nsw i64 %6, 9
  %9 = shl nuw nsw i32 %7, 5
  %10 = zext i32 %9 to i64
  %11 = add nuw nsw i64 %8, %10
  br label %12

12:                                               ; preds = %51, %4
  %13 = phi i64 [ 0, %4 ], [ %83, %51 ]
  %14 = add nuw nsw i64 %11, %13
  %15 = icmp ult i64 %14, %2
  br i1 %15, label %16, label %85

16:                                               ; preds = %12
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5
  %21 = fadd contract float %18, -2.000000e+00
  %22 = fmul contract float %20, %20
  %23 = fsub contract float 1.000000e+00, %22
  %24 = fdiv contract float %21, %23
  %25 = fcmp olt float %24, 0x39F0000000000000
  %26 = select i1 %25, float 0x41F0000000000000, float 1.000000e+00
  %27 = fmul float %24, %26
  %28 = tail call float @llvm.sqrt.f32(float %27)
  %29 = bitcast float %28 to i32
  %30 = add nsw i32 %29, -1
  %31 = bitcast i32 %30 to float
  %32 = add nsw i32 %29, 1
  %33 = bitcast i32 %32 to float
  %34 = tail call i1 @llvm.amdgcn.class.f32(float %27, i32 608)
  %35 = select i1 %25, float 0x3EF0000000000000, float 1.000000e+00
  %36 = fneg float %33
  %37 = tail call float @llvm.fma.f32(float %36, float %28, float %27)
  %38 = fcmp ogt float %37, 0.000000e+00
  %39 = fneg float %31
  %40 = tail call float @llvm.fma.f32(float %39, float %28, float %27)
  %41 = fcmp ole float %40, 0.000000e+00
  %42 = select i1 %41, float %31, float %28
  %43 = select i1 %38, float %33, float %42
  %44 = fmul float %35, %43
  %45 = select i1 %34, float %27, float %44
  %46 = fmul contract float %20, %45
  %47 = getelementptr inbounds float, float addrspace(1)* %3, i64 %14
  store float %46, float addrspace(1)* %47, align 4, !tbaa !5
  %48 = or i64 %13, 1
  %49 = add nuw nsw i64 %11, %48
  %50 = icmp ult i64 %49, %2
  br i1 %50, label %51, label %85

51:                                               ; preds = %16
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5
  %56 = fadd contract float %53, -2.000000e+00
  %57 = fmul contract float %55, %55
  %58 = fsub contract float 1.000000e+00, %57
  %59 = fdiv contract float %56, %58
  %60 = fcmp olt float %59, 0x39F0000000000000
  %61 = select i1 %60, float 0x41F0000000000000, float 1.000000e+00
  %62 = fmul float %59, %61
  %63 = tail call float @llvm.sqrt.f32(float %62)
  %64 = bitcast float %63 to i32
  %65 = add nsw i32 %64, -1
  %66 = bitcast i32 %65 to float
  %67 = add nsw i32 %64, 1
  %68 = bitcast i32 %67 to float
  %69 = tail call i1 @llvm.amdgcn.class.f32(float %62, i32 608)
  %70 = select i1 %60, float 0x3EF0000000000000, float 1.000000e+00
  %71 = fneg float %68
  %72 = tail call float @llvm.fma.f32(float %71, float %63, float %62)
  %73 = fcmp ogt float %72, 0.000000e+00
  %74 = fneg float %66
  %75 = tail call float @llvm.fma.f32(float %74, float %63, float %62)
  %76 = fcmp ole float %75, 0.000000e+00
  %77 = select i1 %76, float %66, float %63
  %78 = select i1 %73, float %68, float %77
  %79 = fmul float %70, %78
  %80 = select i1 %69, float %62, float %79
  %81 = fmul contract float %55, %80
  %82 = getelementptr inbounds float, float addrspace(1)* %3, i64 %49
  store float %81, float addrspace(1)* %82, align 4, !tbaa !5
  %83 = add nuw nsw i64 %13, 2
  %84 = icmp eq i64 %83, 32
  br i1 %84, label %85, label %12, !llvm.loop !9

85:                                               ; preds = %51, %16, %12
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
