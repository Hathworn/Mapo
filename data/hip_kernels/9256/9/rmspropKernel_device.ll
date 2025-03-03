; ModuleID = '../data/hip_kernels/9256/9/main.cu'
source_filename = "../data/hip_kernels/9256/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13rmspropKerneliPiS_iPfS0_ffffS0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float %6, float %7, float %8, float %9, float addrspace(1)* nocapture %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !4, !amdgpu.noclobber !8
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %13
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !4, !amdgpu.noclobber !8
  %18 = icmp ne i32 %15, -1
  %19 = icmp sgt i32 %17, 0
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %88

21:                                               ; preds = %11
  %22 = sitofp i32 %17 to float
  %23 = fdiv contract float 1.000000e+00, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !9, !invariant.load !8
  %29 = zext i16 %28 to i32
  %30 = mul i32 %24, %29
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %32 = add i32 %30, %31
  %33 = mul i32 %32, %0
  %34 = mul nsw i32 %15, %3
  %35 = add nsw i32 %33, %34
  %36 = add nsw i32 %35, %0
  %37 = add nsw i32 %34, %3
  %38 = tail call i32 @llvm.smin.i32(i32 %36, i32 %37)
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %88

40:                                               ; preds = %21
  %41 = mul nsw i32 %12, %3
  %42 = add nsw i32 %33, %41
  %43 = fneg contract float %6
  br label %44

44:                                               ; preds = %40, %44
  %45 = phi i32 [ %35, %40 ], [ %85, %44 ]
  %46 = phi i32 [ %42, %40 ], [ %86, %44 ]
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %5, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !11
  %50 = fmul contract float %23, %49
  %51 = sext i32 %45 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %10, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !11
  %54 = fmul contract float %53, %7
  %55 = fmul contract float %50, %50
  %56 = fmul contract float %55, %8
  %57 = fadd contract float %54, %56
  store float %57, float addrspace(1)* %52, align 4, !tbaa !11
  %58 = fadd contract float %57, %9
  %59 = fcmp olt float %58, 0x39F0000000000000
  %60 = select i1 %59, float 0x41F0000000000000, float 1.000000e+00
  %61 = fmul float %58, %60
  %62 = tail call float @llvm.sqrt.f32(float %61)
  %63 = bitcast float %62 to i32
  %64 = add nsw i32 %63, -1
  %65 = bitcast i32 %64 to float
  %66 = add nsw i32 %63, 1
  %67 = bitcast i32 %66 to float
  %68 = tail call i1 @llvm.amdgcn.class.f32(float %61, i32 608)
  %69 = select i1 %59, float 0x3EF0000000000000, float 1.000000e+00
  %70 = fneg float %67
  %71 = tail call float @llvm.fma.f32(float %70, float %62, float %61)
  %72 = fcmp ogt float %71, 0.000000e+00
  %73 = fneg float %65
  %74 = tail call float @llvm.fma.f32(float %73, float %62, float %61)
  %75 = fcmp ole float %74, 0.000000e+00
  %76 = select i1 %75, float %65, float %62
  %77 = select i1 %72, float %67, float %76
  %78 = fmul float %69, %77
  %79 = select i1 %68, float %61, float %78
  %80 = fdiv contract float %43, %79
  %81 = fmul contract float %50, %80
  %82 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11
  %84 = fadd contract float %83, %81
  store float %84, float addrspace(1)* %82, align 4, !tbaa !11
  %85 = add nsw i32 %45, 1
  %86 = add nsw i32 %46, 1
  %87 = icmp slt i32 %85, %38
  br i1 %87, label %44, label %88, !llvm.loop !13

88:                                               ; preds = %44, %21, %11
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
