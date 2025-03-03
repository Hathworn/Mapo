; ModuleID = '../data/hip_kernels/6478/0/main.cu'
source_filename = "../data/hip_kernels/6478/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12errorsKernelPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp sgt i32 %4, 0
  br i1 %7, label %8, label %15

8:                                                ; preds = %5
  %9 = icmp sgt i32 %3, 0
  %10 = mul nsw i32 %6, %3
  %11 = zext i32 %6 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %2, i64 %11
  br label %13

13:                                               ; preds = %8, %25
  %14 = phi i32 [ 0, %8 ], [ %55, %25 ]
  br i1 %9, label %16, label %25

15:                                               ; preds = %25, %5
  ret void

16:                                               ; preds = %13, %67
  %17 = phi i32 [ %78, %67 ], [ 0, %13 ]
  %18 = phi float [ %77, %67 ], [ 0.000000e+00, %13 ]
  %19 = icmp eq i32 %17, 0
  br i1 %19, label %67, label %20

20:                                               ; preds = %16
  %21 = and i32 %17, 7
  %22 = icmp ult i32 %17, 8
  br i1 %22, label %57, label %23

23:                                               ; preds = %20
  %24 = and i32 %17, 2147483640
  br label %80

25:                                               ; preds = %67, %13
  %26 = phi float [ 0.000000e+00, %13 ], [ %77, %67 ]
  %27 = zext i32 %14 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5
  %30 = fsub contract float %29, %26
  %31 = fmul contract float %30, %30
  %32 = fcmp olt float %31, 0x39F0000000000000
  %33 = select i1 %32, float 0x41F0000000000000, float 1.000000e+00
  %34 = fmul float %31, %33
  %35 = tail call float @llvm.sqrt.f32(float %34)
  %36 = bitcast float %35 to i32
  %37 = add nsw i32 %36, -1
  %38 = bitcast i32 %37 to float
  %39 = add nsw i32 %36, 1
  %40 = bitcast i32 %39 to float
  %41 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 608)
  %42 = select i1 %32, float 0x3EF0000000000000, float 1.000000e+00
  %43 = fneg float %40
  %44 = tail call float @llvm.fma.f32(float %43, float %35, float %34)
  %45 = fcmp ogt float %44, 0.000000e+00
  %46 = fneg float %38
  %47 = tail call float @llvm.fma.f32(float %46, float %35, float %34)
  %48 = fcmp ole float %47, 0.000000e+00
  %49 = select i1 %48, float %38, float %35
  %50 = select i1 %45, float %40, float %49
  %51 = fmul float %42, %50
  %52 = select i1 %41, float %34, float %51
  %53 = load float, float addrspace(1)* %12, align 4, !tbaa !5
  %54 = fadd contract float %53, %52
  store float %54, float addrspace(1)* %12, align 4, !tbaa !5
  %55 = add nuw nsw i32 %14, 1
  %56 = icmp eq i32 %55, %4
  br i1 %56, label %15, label %13, !llvm.loop !9

57:                                               ; preds = %80, %20
  %58 = phi i32 [ undef, %20 ], [ %90, %80 ]
  %59 = phi i32 [ 1, %20 ], [ %90, %80 ]
  %60 = icmp eq i32 %21, 0
  br i1 %60, label %67, label %61

61:                                               ; preds = %57, %61
  %62 = phi i32 [ %64, %61 ], [ %59, %57 ]
  %63 = phi i32 [ %65, %61 ], [ 0, %57 ]
  %64 = mul nsw i32 %62, %14
  %65 = add i32 %63, 1
  %66 = icmp eq i32 %65, %21
  br i1 %66, label %67, label %61, !llvm.loop !11

67:                                               ; preds = %57, %61, %16
  %68 = phi i32 [ 1, %16 ], [ %58, %57 ], [ %64, %61 ]
  %69 = add nsw i32 %17, %10
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = sitofp i32 %68 to float
  %74 = fmul contract float %72, %73
  %75 = fptosi float %74 to i32
  %76 = sitofp i32 %75 to float
  %77 = fadd contract float %18, %76
  %78 = add nuw nsw i32 %17, 1
  %79 = icmp eq i32 %78, %3
  br i1 %79, label %25, label %16, !llvm.loop !13

80:                                               ; preds = %80, %23
  %81 = phi i32 [ 1, %23 ], [ %90, %80 ]
  %82 = phi i32 [ 0, %23 ], [ %91, %80 ]
  %83 = mul nsw i32 %81, %14
  %84 = mul nsw i32 %83, %14
  %85 = mul nsw i32 %84, %14
  %86 = mul nsw i32 %85, %14
  %87 = mul nsw i32 %86, %14
  %88 = mul nsw i32 %87, %14
  %89 = mul nsw i32 %88, %14
  %90 = mul nsw i32 %89, %14
  %91 = add i32 %82, 8
  %92 = icmp eq i32 %91, %24
  br i1 %92, label %57, label %80, !llvm.loop !14
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
