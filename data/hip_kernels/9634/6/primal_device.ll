; ModuleID = '../data/hip_kernels/9634/6/main.cu'
source_filename = "../data/hip_kernels/9634/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6primalPfS_S_fiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = add i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = icmp slt i32 %16, %4
  %26 = icmp slt i32 %24, %5
  %27 = select i1 %25, i1 %26, i1 false
  %28 = icmp sgt i32 %6, 0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %100

30:                                               ; preds = %7
  %31 = mul nsw i32 %24, %4
  %32 = mul nsw i32 %5, %4
  %33 = add nsw i32 %16, 1
  %34 = icmp slt i32 %33, %4
  %35 = add nsw i32 %24, 1
  %36 = icmp slt i32 %35, %5
  %37 = mul nsw i32 %35, %4
  br label %38

38:                                               ; preds = %30, %61
  %39 = phi i32 [ 0, %30 ], [ %98, %61 ]
  %40 = mul nsw i32 %32, %39
  %41 = add i32 %40, %31
  %42 = add i32 %41, %16
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  br i1 %34, label %46, label %52

46:                                               ; preds = %38
  %47 = add i32 %41, %33
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fsub contract float %50, %45
  br label %52

52:                                               ; preds = %38, %46
  %53 = phi contract float [ %51, %46 ], [ 0.000000e+00, %38 ]
  br i1 %36, label %54, label %61

54:                                               ; preds = %52
  %55 = add i32 %40, %16
  %56 = add i32 %55, %37
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fsub contract float %59, %45
  br label %61

61:                                               ; preds = %52, %54
  %62 = phi contract float [ %60, %54 ], [ 0.000000e+00, %52 ]
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fmul contract float %53, %3
  %66 = fadd contract float %65, %64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fmul contract float %62, %3
  %70 = fadd contract float %69, %68
  %71 = fmul contract float %66, %66
  %72 = fmul contract float %70, %70
  %73 = fadd contract float %71, %72
  %74 = fcmp olt float %73, 0x39F0000000000000
  %75 = select i1 %74, float 0x41F0000000000000, float 1.000000e+00
  %76 = fmul float %73, %75
  %77 = tail call float @llvm.sqrt.f32(float %76)
  %78 = bitcast float %77 to i32
  %79 = add nsw i32 %78, -1
  %80 = bitcast i32 %79 to float
  %81 = add nsw i32 %78, 1
  %82 = bitcast i32 %81 to float
  %83 = tail call i1 @llvm.amdgcn.class.f32(float %76, i32 608)
  %84 = select i1 %74, float 0x3EF0000000000000, float 1.000000e+00
  %85 = fneg float %82
  %86 = tail call float @llvm.fma.f32(float %85, float %77, float %76)
  %87 = fcmp ogt float %86, 0.000000e+00
  %88 = fneg float %80
  %89 = tail call float @llvm.fma.f32(float %88, float %77, float %76)
  %90 = fcmp ole float %89, 0.000000e+00
  %91 = select i1 %90, float %80, float %77
  %92 = select i1 %87, float %82, float %91
  %93 = fmul float %84, %92
  %94 = select i1 %83, float %76, float %93
  %95 = tail call float @llvm.maxnum.f32(float %94, float 1.000000e+00)
  %96 = fdiv contract float %66, %95
  store float %96, float addrspace(1)* %63, align 4, !tbaa !7
  %97 = fdiv contract float %70, %95
  store float %97, float addrspace(1)* %67, align 4, !tbaa !7
  %98 = add nuw nsw i32 %39, 1
  %99 = icmp eq i32 %98, %6
  br i1 %99, label %100, label %38, !llvm.loop !11

100:                                              ; preds = %61, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
