; ModuleID = '../data/hip_kernels/14075/7/main.cu'
source_filename = "../data/hip_kernels/14075/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19copy_kernel_frombufPcS_iiiiiiiiiiiiiiiiii(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, i32 %19) local_unnamed_addr #0 {
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %23 = getelementptr i8, i8 addrspace(4)* %21, i64 8
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %29 = add i32 %27, %28
  %30 = mul i32 %29, %10
  %31 = add i32 %30, %6
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %33 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 2, !range !4, !invariant.load !5
  %36 = zext i16 %35 to i32
  %37 = mul i32 %32, %36
  %38 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %39 = add i32 %37, %38
  %40 = mul i32 %39, %9
  %41 = add i32 %40, %4
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %43 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 4, !range !4, !invariant.load !5
  %46 = zext i16 %45 to i32
  %47 = mul i32 %42, %46
  %48 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %49 = add i32 %47, %48
  %50 = mul i32 %49, %8
  %51 = add i32 %50, %2
  %52 = icmp eq i32 %8, 1
  br i1 %52, label %53, label %55

53:                                               ; preds = %20
  %54 = icmp slt i32 %51, %3
  br i1 %54, label %57, label %148

55:                                               ; preds = %20
  %56 = icmp sgt i32 %51, %3
  br i1 %56, label %57, label %148

57:                                               ; preds = %55, %53
  %58 = icmp eq i32 %9, 1
  br i1 %58, label %59, label %61

59:                                               ; preds = %57
  %60 = icmp slt i32 %41, %5
  br i1 %60, label %63, label %148

61:                                               ; preds = %57
  %62 = icmp sgt i32 %41, %5
  br i1 %62, label %63, label %148

63:                                               ; preds = %61, %59
  %64 = icmp eq i32 %10, 1
  br i1 %64, label %65, label %67

65:                                               ; preds = %63
  %66 = icmp slt i32 %31, %7
  br i1 %66, label %69, label %148

67:                                               ; preds = %63
  %68 = icmp sgt i32 %31, %7
  br i1 %68, label %69, label %148

69:                                               ; preds = %67, %65
  %70 = icmp eq i32 %19, 0
  %71 = mul i32 %31, %12
  %72 = add i32 %71, %41
  %73 = mul i32 %72, %11
  %74 = add i32 %73, %51
  br i1 %70, label %78, label %75

75:                                               ; preds = %69
  %76 = mul nsw i32 %74, %17
  %77 = mul i32 %18, %17
  br label %81

78:                                               ; preds = %69
  %79 = mul i32 %18, %17
  %80 = mul i32 %79, %74
  br label %81

81:                                               ; preds = %78, %75
  %82 = phi i32 [ %79, %78 ], [ %77, %75 ]
  %83 = phi i32 [ %80, %78 ], [ %76, %75 ]
  %84 = mul i32 %16, %10
  %85 = mul i32 %84, %30
  %86 = mul i32 %15, %9
  %87 = mul i32 %86, %40
  %88 = add nsw i32 %87, %85
  %89 = mul i32 %14, %8
  %90 = mul i32 %89, %50
  %91 = add nsw i32 %88, %90
  %92 = mul i32 %82, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %93
  %95 = icmp sgt i32 %18, 0
  br i1 %95, label %96, label %148

96:                                               ; preds = %81
  %97 = sext i32 %83 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %97
  %99 = sext i32 %17 to i64
  %100 = icmp ugt i32 %17, 3
  %101 = mul nsw i32 %12, %11
  %102 = mul nsw i32 %101, %13
  %103 = mul nsw i32 %102, %17
  %104 = sext i32 %103 to i64
  %105 = select i1 %70, i64 %99, i64 %104
  br label %106

106:                                              ; preds = %96, %144
  %107 = phi i32 [ 0, %96 ], [ %146, %144 ]
  %108 = phi i8 addrspace(1)* [ %98, %96 ], [ %145, %144 ]
  %109 = mul nsw i32 %107, %17
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %94, i64 %110
  br i1 %100, label %112, label %130

112:                                              ; preds = %106, %112
  %113 = phi i8 addrspace(1)* [ %127, %112 ], [ %111, %106 ]
  %114 = phi i8 addrspace(1)* [ %128, %112 ], [ %108, %106 ]
  %115 = phi i64 [ %126, %112 ], [ %99, %106 ]
  %116 = load i8, i8 addrspace(1)* %113, align 1, !tbaa !7
  store i8 %116, i8 addrspace(1)* %114, align 1, !tbaa !7
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %113, i64 1
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !7
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %114, i64 1
  store i8 %118, i8 addrspace(1)* %119, align 1, !tbaa !7
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %113, i64 2
  %121 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !7
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %114, i64 2
  store i8 %121, i8 addrspace(1)* %122, align 1, !tbaa !7
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %113, i64 3
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !7
  %125 = getelementptr inbounds i8, i8 addrspace(1)* %114, i64 3
  store i8 %124, i8 addrspace(1)* %125, align 1, !tbaa !7
  %126 = add i64 %115, -4
  %127 = getelementptr inbounds i8, i8 addrspace(1)* %113, i64 4
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %114, i64 4
  %129 = icmp ugt i64 %126, 3
  br i1 %129, label %112, label %130, !llvm.loop !10

130:                                              ; preds = %112, %106
  %131 = phi i64 [ %99, %106 ], [ %126, %112 ]
  %132 = phi i8 addrspace(1)* [ %108, %106 ], [ %128, %112 ]
  %133 = phi i8 addrspace(1)* [ %111, %106 ], [ %127, %112 ]
  switch i64 %131, label %144 [
    i64 3, label %134
    i64 2, label %138
    i64 1, label %142
  ]

134:                                              ; preds = %130
  %135 = getelementptr inbounds i8, i8 addrspace(1)* %133, i64 2
  %136 = load i8, i8 addrspace(1)* %135, align 1, !tbaa !7
  %137 = getelementptr inbounds i8, i8 addrspace(1)* %132, i64 2
  store i8 %136, i8 addrspace(1)* %137, align 1, !tbaa !7
  br label %138

138:                                              ; preds = %134, %130
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %133, i64 1
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !7
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %132, i64 1
  store i8 %140, i8 addrspace(1)* %141, align 1, !tbaa !7
  br label %142

142:                                              ; preds = %138, %130
  %143 = load i8, i8 addrspace(1)* %133, align 1, !tbaa !7
  store i8 %143, i8 addrspace(1)* %132, align 1, !tbaa !7
  br label %144

144:                                              ; preds = %130, %142
  %145 = getelementptr inbounds i8, i8 addrspace(1)* %108, i64 %105
  %146 = add nuw nsw i32 %107, 1
  %147 = icmp eq i32 %146, %18
  br i1 %147, label %148, label %106, !llvm.loop !12

148:                                              ; preds = %144, %81, %67, %65, %61, %59, %55, %53
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
