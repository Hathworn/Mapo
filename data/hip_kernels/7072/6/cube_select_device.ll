; ModuleID = '../data/hip_kernels/7072/6/main.cu'
source_filename = "../data/hip_kernels/7072/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11cube_selectiifPKfPi(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul nsw i32 %6, %1
  %8 = mul nsw i32 %7, 3
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %3, i64 %9
  %11 = shl nsw i32 %7, 3
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %12
  %14 = fmul contract float %2, %2
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %23

17:                                               ; preds = %5
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  br label %24

23:                                               ; preds = %62, %5
  ret void

24:                                               ; preds = %17, %62
  %25 = phi i32 [ %15, %17 ], [ %63, %62 ]
  %26 = mul nsw i32 %25, 3
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %10, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = add nsw i32 %26, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %10, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = add nsw i32 %26, 2
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %10, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = shl nsw i32 %25, 3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %39
  store i32 %25, i32 addrspace(1)* %40, align 4, !tbaa !11
  %41 = add nuw nsw i32 %38, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %42
  store i32 %25, i32 addrspace(1)* %43, align 4, !tbaa !11
  %44 = add nuw nsw i32 %38, 2
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %45
  store i32 %25, i32 addrspace(1)* %46, align 4, !tbaa !11
  %47 = add nuw nsw i32 %38, 3
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %48
  store i32 %25, i32 addrspace(1)* %49, align 4, !tbaa !11
  %50 = add nuw nsw i32 %38, 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %51
  store i32 %25, i32 addrspace(1)* %52, align 4, !tbaa !11
  %53 = add nuw nsw i32 %38, 5
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %54
  store i32 %25, i32 addrspace(1)* %55, align 4, !tbaa !11
  %56 = add nuw nsw i32 %38, 6
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %57
  store i32 %25, i32 addrspace(1)* %58, align 4, !tbaa !11
  %59 = add nuw nsw i32 %38, 7
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %60
  store i32 %25, i32 addrspace(1)* %61, align 4, !tbaa !11
  br label %65

62:                                               ; preds = %107
  %63 = add i32 %25, %22
  %64 = icmp slt i32 %63, %1
  br i1 %64, label %24, label %23, !llvm.loop !13

65:                                               ; preds = %24, %107
  %66 = phi i32 [ 0, %24 ], [ %109, %107 ]
  %67 = phi <8 x float> [ <float 1.000000e+08, float 1.000000e+08, float 1.000000e+08, float 1.000000e+08, float 1.000000e+08, float 1.000000e+08, float 1.000000e+08, float 1.000000e+08>, %24 ], [ %108, %107 ]
  %68 = icmp eq i32 %25, %66
  br i1 %68, label %107, label %69

69:                                               ; preds = %65
  %70 = mul nsw i32 %66, 3
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %10, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = add nuw nsw i32 %70, 1
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %10, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !6
  %78 = add nuw nsw i32 %70, 2
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %10, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = fsub contract float %29, %73
  %83 = fmul contract float %82, %82
  %84 = fsub contract float %33, %77
  %85 = fmul contract float %84, %84
  %86 = fadd contract float %83, %85
  %87 = fsub contract float %37, %81
  %88 = fmul contract float %87, %87
  %89 = fadd contract float %86, %88
  %90 = fcmp contract ogt float %89, %14
  br i1 %90, label %107, label %91

91:                                               ; preds = %69
  %92 = fcmp contract ogt float %73, %29
  %93 = fcmp contract ogt float %77, %33
  %94 = fcmp contract ogt float %81, %37
  %95 = zext i1 %94 to i32
  %96 = select i1 %92, i32 4, i32 0
  %97 = select i1 %93, i32 2, i32 0
  %98 = or i32 %97, %96
  %99 = or i32 %98, %95
  %100 = extractelement <8 x float> %67, i32 %99
  %101 = fcmp contract olt float %89, %100
  br i1 %101, label %102, label %107

102:                                              ; preds = %91
  %103 = or i32 %99, %38
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %104
  store i32 %66, i32 addrspace(1)* %105, align 4, !tbaa !11
  %106 = insertelement <8 x float> %67, float %89, i32 %99
  br label %107

107:                                              ; preds = %69, %102, %91, %65
  %108 = phi <8 x float> [ %67, %65 ], [ %67, %69 ], [ %106, %102 ], [ %67, %91 ]
  %109 = add nuw nsw i32 %66, 1
  %110 = icmp eq i32 %109, %1
  br i1 %110, label %62, label %65, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
