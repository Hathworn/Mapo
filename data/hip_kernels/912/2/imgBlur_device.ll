; ModuleID = '../data/hip_kernels/912/2/main.cu'
source_filename = "../data/hip_kernels/912/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7imgBlurPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %115

25:                                               ; preds = %4
  %26 = mul nsw i32 %13, %2
  %27 = add nsw i32 %26, %21
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = icmp sgt i32 %13, 0
  %32 = icmp sgt i32 %21, 0
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %43

34:                                               ; preds = %25
  %35 = add nsw i32 %13, -1
  %36 = mul nsw i32 %35, %2
  %37 = add nsw i32 %21, -1
  %38 = add nsw i32 %37, %36
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fadd contract float %30, %41
  br label %43

43:                                               ; preds = %34, %25
  %44 = phi float [ %42, %34 ], [ %30, %25 ]
  br i1 %31, label %45, label %53

45:                                               ; preds = %43
  %46 = add nsw i32 %13, -1
  %47 = mul nsw i32 %46, %2
  %48 = add nsw i32 %47, %21
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fadd contract float %44, %51
  br label %53

53:                                               ; preds = %45, %43
  %54 = phi float [ %52, %45 ], [ %44, %43 ]
  %55 = add nsw i32 %2, -1
  %56 = icmp slt i32 %13, %55
  br i1 %56, label %57, label %65

57:                                               ; preds = %53
  %58 = add nsw i32 %13, 1
  %59 = mul nsw i32 %58, %2
  %60 = add nsw i32 %59, %21
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fadd contract float %54, %63
  br label %65

65:                                               ; preds = %57, %53
  %66 = phi float [ %64, %57 ], [ %54, %53 ]
  %67 = add nsw i32 %3, -1
  %68 = icmp slt i32 %21, %67
  %69 = select i1 %56, i1 %68, i1 false
  br i1 %69, label %70, label %79

70:                                               ; preds = %65
  %71 = add nsw i32 %13, 1
  %72 = mul nsw i32 %71, %2
  %73 = add nsw i32 %21, 1
  %74 = add i32 %73, %72
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fadd contract float %66, %77
  br label %79

79:                                               ; preds = %70, %65
  %80 = phi float [ %78, %70 ], [ %66, %65 ]
  br i1 %32, label %81, label %95

81:                                               ; preds = %79
  %82 = add nsw i32 %13, 1
  %83 = mul nsw i32 %82, %2
  %84 = add nsw i32 %21, -1
  %85 = add i32 %84, %83
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fadd contract float %80, %88
  %90 = add nsw i32 %27, -1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fadd contract float %89, %93
  br label %95

95:                                               ; preds = %79, %81
  %96 = phi float [ %94, %81 ], [ %80, %79 ]
  %97 = add nsw i32 %27, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = fadd contract float %96, %100
  br i1 %31, label %102, label %111

102:                                              ; preds = %95
  %103 = add nsw i32 %13, -1
  %104 = mul nsw i32 %103, %2
  %105 = add nsw i32 %21, 1
  %106 = add i32 %105, %104
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fadd contract float %101, %109
  br label %111

111:                                              ; preds = %102, %95
  %112 = phi float [ %110, %102 ], [ %101, %95 ]
  %113 = fdiv contract float %112, 2.500000e+01
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  store float %113, float addrspace(1)* %114, align 4, !tbaa !7
  br label %115

115:                                              ; preds = %111, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
