; ModuleID = '../data/hip_kernels/16995/7/main.cu'
source_filename = "../data/hip_kernels/16995/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13lowHysterisisiiPfS_fS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp sgt i32 %15, 0
  br i1 %24, label %25, label %106

25:                                               ; preds = %6
  %26 = add nsw i32 %0, -1
  %27 = icmp slt i32 %15, %26
  %28 = icmp sgt i32 %23, 0
  %29 = select i1 %27, i1 %28, i1 false
  %30 = add nsw i32 %1, -1
  %31 = icmp slt i32 %23, %30
  %32 = select i1 %29, i1 %31, i1 false
  br i1 %32, label %33, label %106

33:                                               ; preds = %25
  %34 = mul nsw i32 %23, %0
  %35 = add nsw i32 %34, %15
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds float, float addrspace(1)* %5, i64 %36
  store float %38, float addrspace(1)* %39, align 4, !tbaa !7
  %40 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %41 = fcmp contract oeq float %40, 1.000000e+00
  br i1 %41, label %42, label %106

42:                                               ; preds = %33
  %43 = add nsw i32 %35, 1
  %44 = add nsw i32 %35, -1
  %45 = sub nsw i32 %35, %0
  %46 = add nsw i32 %35, %0
  %47 = add nsw i32 %46, 1
  %48 = add nsw i32 %45, 1
  %49 = add nsw i32 %46, -1
  %50 = add nsw i32 %45, -1
  %51 = sext i32 %43 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fcmp contract ogt float %53, %4
  br i1 %54, label %55, label %57

55:                                               ; preds = %42
  %56 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  store float 1.000000e+00, float addrspace(1)* %56, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %55, %42
  %58 = sext i32 %44 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fcmp contract ogt float %60, %4
  br i1 %61, label %62, label %64

62:                                               ; preds = %57
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  store float 1.000000e+00, float addrspace(1)* %63, align 4, !tbaa !7
  br label %64

64:                                               ; preds = %62, %57
  %65 = sext i32 %45 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fcmp contract ogt float %67, %4
  br i1 %68, label %69, label %71

69:                                               ; preds = %64
  %70 = getelementptr inbounds float, float addrspace(1)* %5, i64 %65
  store float 1.000000e+00, float addrspace(1)* %70, align 4, !tbaa !7
  br label %71

71:                                               ; preds = %69, %64
  %72 = sext i32 %46 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fcmp contract ogt float %74, %4
  br i1 %75, label %76, label %78

76:                                               ; preds = %71
  %77 = getelementptr inbounds float, float addrspace(1)* %5, i64 %72
  store float 1.000000e+00, float addrspace(1)* %77, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %76, %71
  %79 = sext i32 %47 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fcmp contract ogt float %81, %4
  br i1 %82, label %83, label %85

83:                                               ; preds = %78
  %84 = getelementptr inbounds float, float addrspace(1)* %5, i64 %79
  store float 1.000000e+00, float addrspace(1)* %84, align 4, !tbaa !7
  br label %85

85:                                               ; preds = %83, %78
  %86 = sext i32 %48 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fcmp contract ogt float %88, %4
  br i1 %89, label %90, label %92

90:                                               ; preds = %85
  %91 = getelementptr inbounds float, float addrspace(1)* %5, i64 %86
  store float 1.000000e+00, float addrspace(1)* %91, align 4, !tbaa !7
  br label %92

92:                                               ; preds = %90, %85
  %93 = sext i32 %49 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fcmp contract ogt float %95, %4
  br i1 %96, label %97, label %99

97:                                               ; preds = %92
  %98 = getelementptr inbounds float, float addrspace(1)* %5, i64 %93
  store float 1.000000e+00, float addrspace(1)* %98, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %97, %92
  %100 = sext i32 %50 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fcmp contract ogt float %102, %4
  br i1 %103, label %104, label %106

104:                                              ; preds = %99
  %105 = getelementptr inbounds float, float addrspace(1)* %5, i64 %100
  store float 1.000000e+00, float addrspace(1)* %105, align 4, !tbaa !7
  br label %106

106:                                              ; preds = %33, %104, %99, %25, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
