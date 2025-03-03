; ModuleID = '../data/hip_kernels/7510/10/main.cu'
source_filename = "../data/hip_kernels/7510/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14adadeltaKerneliPiS_iPfS0_fffS0_S0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float %6, float %7, float %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !4, !amdgpu.noclobber !8
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %13
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !4, !amdgpu.noclobber !8
  %18 = icmp ne i32 %15, -1
  %19 = icmp sgt i32 %17, 0
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %116

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
  br i1 %39, label %40, label %116

40:                                               ; preds = %21
  %41 = mul nsw i32 %12, %3
  %42 = add nsw i32 %33, %41
  br label %43

43:                                               ; preds = %40, %43
  %44 = phi i32 [ %113, %43 ], [ %35, %40 ]
  %45 = phi i32 [ %114, %43 ], [ %42, %40 ]
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %5, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !11
  %49 = fmul contract float %23, %48
  %50 = sext i32 %44 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %9, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !11
  %53 = fmul contract float %52, %6
  %54 = fmul contract float %49, %49
  %55 = fmul contract float %54, %7
  %56 = fadd contract float %53, %55
  store float %56, float addrspace(1)* %51, align 4, !tbaa !11
  %57 = fadd contract float %56, %8
  %58 = fcmp olt float %57, 0x39F0000000000000
  %59 = select i1 %58, float 0x41F0000000000000, float 1.000000e+00
  %60 = fmul float %57, %59
  %61 = tail call float @llvm.sqrt.f32(float %60)
  %62 = bitcast float %61 to i32
  %63 = add nsw i32 %62, -1
  %64 = bitcast i32 %63 to float
  %65 = add nsw i32 %62, 1
  %66 = bitcast i32 %65 to float
  %67 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 608)
  %68 = select i1 %58, float 0x3EF0000000000000, float 1.000000e+00
  %69 = fneg float %66
  %70 = tail call float @llvm.fma.f32(float %69, float %61, float %60)
  %71 = fcmp ogt float %70, 0.000000e+00
  %72 = fneg float %64
  %73 = tail call float @llvm.fma.f32(float %72, float %61, float %60)
  %74 = fcmp ole float %73, 0.000000e+00
  %75 = select i1 %74, float %64, float %61
  %76 = select i1 %71, float %66, float %75
  %77 = fmul float %68, %76
  %78 = select i1 %67, float %60, float %77
  %79 = getelementptr inbounds float, float addrspace(1)* %10, i64 %50
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !11
  %81 = fadd contract float %80, %8
  %82 = fcmp olt float %81, 0x39F0000000000000
  %83 = select i1 %82, float 0x41F0000000000000, float 1.000000e+00
  %84 = fmul float %81, %83
  %85 = tail call float @llvm.sqrt.f32(float %84)
  %86 = bitcast float %85 to i32
  %87 = add nsw i32 %86, -1
  %88 = bitcast i32 %87 to float
  %89 = add nsw i32 %86, 1
  %90 = bitcast i32 %89 to float
  %91 = tail call i1 @llvm.amdgcn.class.f32(float %84, i32 608)
  %92 = select i1 %82, float 0x3EF0000000000000, float 1.000000e+00
  %93 = fneg float %90
  %94 = tail call float @llvm.fma.f32(float %93, float %85, float %84)
  %95 = fcmp ogt float %94, 0.000000e+00
  %96 = fneg float %88
  %97 = tail call float @llvm.fma.f32(float %96, float %85, float %84)
  %98 = fcmp ole float %97, 0.000000e+00
  %99 = select i1 %98, float %88, float %85
  %100 = select i1 %95, float %90, float %99
  %101 = fmul float %92, %100
  %102 = select i1 %91, float %84, float %101
  %103 = fneg contract float %102
  %104 = fdiv contract float %103, %78
  %105 = fmul contract float %49, %104
  %106 = fmul contract float %80, %6
  %107 = fmul contract float %105, %105
  %108 = fmul contract float %107, %7
  %109 = fadd contract float %106, %108
  store float %109, float addrspace(1)* %79, align 4, !tbaa !11
  %110 = getelementptr inbounds float, float addrspace(1)* %4, i64 %50
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !11
  %112 = fadd contract float %111, %105
  store float %112, float addrspace(1)* %110, align 4, !tbaa !11
  %113 = add nsw i32 %44, 1
  %114 = add nsw i32 %45, 1
  %115 = icmp slt i32 %113, %38
  br i1 %115, label %43, label %116, !llvm.loop !13

116:                                              ; preds = %43, %21, %11
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
