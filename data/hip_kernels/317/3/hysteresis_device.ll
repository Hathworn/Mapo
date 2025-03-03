; ModuleID = '../data/hip_kernels/317/3/main.cu'
source_filename = "../data/hip_kernels/317/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10hysteresisiiiPh(i32 %0, i32 %1, i32 %2, i8 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
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
  %22 = icmp slt i32 %13, %1
  %23 = icmp slt i32 %21, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %138

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %1
  %27 = add nsw i32 %26, %13
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7, !amdgpu.noclobber !5
  %31 = icmp ugt i8 %30, 90
  br i1 %31, label %32, label %33

32:                                               ; preds = %25
  store i8 -1, i8 addrspace(1)* %29, align 1, !tbaa !7
  br label %138

33:                                               ; preds = %25
  %34 = icmp ult i8 %30, 30
  br i1 %34, label %46, label %35

35:                                               ; preds = %33
  %36 = add nsw i32 %21, -1
  %37 = icmp sgt i32 %21, 0
  %38 = icmp sle i32 %21, %2
  %39 = select i1 %37, i1 %38, i1 false
  %40 = mul nsw i32 %36, %1
  %41 = add nsw i32 %13, -1
  %42 = icmp sgt i32 %13, 0
  %43 = select i1 %39, i1 %42, i1 false
  %44 = icmp sle i32 %13, %1
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %47, label %54

46:                                               ; preds = %33
  store i8 0, i8 addrspace(1)* %29, align 1, !tbaa !7
  br label %138

47:                                               ; preds = %35
  %48 = add nsw i32 %41, %40
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %49
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7
  %52 = icmp ugt i8 %51, 30
  br i1 %52, label %53, label %54

53:                                               ; preds = %47
  store i8 -1, i8 addrspace(1)* %50, align 1, !tbaa !7
  br label %54

54:                                               ; preds = %53, %47, %35
  %55 = icmp sgt i32 %13, -1
  %56 = select i1 %39, i1 %55, i1 false
  br i1 %56, label %57, label %64

57:                                               ; preds = %54
  %58 = add nsw i32 %13, %40
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7
  %62 = icmp ugt i8 %61, 30
  br i1 %62, label %63, label %64

63:                                               ; preds = %57
  store i8 -1, i8 addrspace(1)* %60, align 1, !tbaa !7
  br label %64

64:                                               ; preds = %63, %57, %54
  %65 = add nsw i32 %13, 1
  %66 = icmp sgt i32 %13, -2
  %67 = select i1 %39, i1 %66, i1 false
  %68 = icmp slt i32 %65, %1
  %69 = select i1 %67, i1 %68, i1 false
  br i1 %69, label %70, label %77

70:                                               ; preds = %64
  %71 = add nsw i32 %65, %40
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %72
  %74 = load i8, i8 addrspace(1)* %73, align 1, !tbaa !7
  %75 = icmp ugt i8 %74, 30
  br i1 %75, label %76, label %77

76:                                               ; preds = %70
  store i8 -1, i8 addrspace(1)* %73, align 1, !tbaa !7
  br label %77

77:                                               ; preds = %76, %70, %64
  %78 = icmp sgt i32 %21, -1
  %79 = select i1 %78, i1 %42, i1 false
  %80 = select i1 %79, i1 %44, i1 false
  br i1 %80, label %81, label %88

81:                                               ; preds = %77
  %82 = add nsw i32 %41, %26
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !7
  %86 = icmp ugt i8 %85, 30
  br i1 %86, label %87, label %88

87:                                               ; preds = %81
  store i8 -1, i8 addrspace(1)* %84, align 1, !tbaa !7
  br label %88

88:                                               ; preds = %87, %81, %77
  %89 = select i1 %78, i1 %55, i1 false
  br i1 %89, label %90, label %94

90:                                               ; preds = %88
  %91 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7
  %92 = icmp ugt i8 %91, 30
  br i1 %92, label %93, label %94

93:                                               ; preds = %90
  store i8 -1, i8 addrspace(1)* %29, align 1, !tbaa !7
  br label %94

94:                                               ; preds = %93, %90, %88
  %95 = select i1 %78, i1 %66, i1 false
  %96 = select i1 %95, i1 %68, i1 false
  br i1 %96, label %97, label %104

97:                                               ; preds = %94
  %98 = add nsw i32 %65, %26
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %99
  %101 = load i8, i8 addrspace(1)* %100, align 1, !tbaa !7
  %102 = icmp ugt i8 %101, 30
  br i1 %102, label %103, label %104

103:                                              ; preds = %97
  store i8 -1, i8 addrspace(1)* %100, align 1, !tbaa !7
  br label %104

104:                                              ; preds = %103, %97, %94
  %105 = add nsw i32 %21, 1
  %106 = icmp sgt i32 %21, -2
  %107 = icmp slt i32 %105, %2
  %108 = select i1 %106, i1 %107, i1 false
  %109 = mul nsw i32 %105, %1
  %110 = select i1 %108, i1 %42, i1 false
  %111 = select i1 %110, i1 %44, i1 false
  br i1 %111, label %112, label %119

112:                                              ; preds = %104
  %113 = add nsw i32 %41, %109
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %114
  %116 = load i8, i8 addrspace(1)* %115, align 1, !tbaa !7
  %117 = icmp ugt i8 %116, 30
  br i1 %117, label %118, label %119

118:                                              ; preds = %112
  store i8 -1, i8 addrspace(1)* %115, align 1, !tbaa !7
  br label %119

119:                                              ; preds = %118, %112, %104
  %120 = select i1 %108, i1 %55, i1 false
  br i1 %120, label %121, label %128

121:                                              ; preds = %119
  %122 = add nsw i32 %13, %109
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %123
  %125 = load i8, i8 addrspace(1)* %124, align 1, !tbaa !7
  %126 = icmp ugt i8 %125, 30
  br i1 %126, label %127, label %128

127:                                              ; preds = %121
  store i8 -1, i8 addrspace(1)* %124, align 1, !tbaa !7
  br label %128

128:                                              ; preds = %127, %121, %119
  %129 = select i1 %108, i1 %66, i1 false
  %130 = select i1 %129, i1 %68, i1 false
  br i1 %130, label %131, label %138

131:                                              ; preds = %128
  %132 = add nsw i32 %65, %109
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %133
  %135 = load i8, i8 addrspace(1)* %134, align 1, !tbaa !7
  %136 = icmp ugt i8 %135, 30
  br i1 %136, label %137, label %138

137:                                              ; preds = %131
  store i8 -1, i8 addrspace(1)* %134, align 1, !tbaa !7
  br label %138

138:                                              ; preds = %128, %131, %137, %32, %46, %4
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
