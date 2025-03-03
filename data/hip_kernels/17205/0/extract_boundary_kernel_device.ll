; ModuleID = '../data/hip_kernels/17205/0/main.cu'
source_filename = "../data/hip_kernels/17205/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23extract_boundary_kernelPfPiiii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp sgt i32 %2, 0
  br i1 %23, label %24, label %51

24:                                               ; preds = %5
  %25 = icmp slt i32 %14, %3
  %26 = icmp slt i32 %22, %4
  %27 = select i1 %25, i1 %26, i1 false
  %28 = mul nsw i32 %22, %3
  %29 = add nsw i32 %28, %14
  %30 = mul i32 %4, %3
  %31 = icmp eq i32 %14, 0
  %32 = icmp eq i32 %22, 0
  %33 = select i1 %31, i1 %32, i1 false
  %34 = add nsw i32 %4, -1
  %35 = icmp eq i32 %22, %34
  %36 = select i1 %31, i1 %35, i1 false
  %37 = add nsw i32 %3, -1
  %38 = icmp eq i32 %14, %37
  %39 = select i1 %38, i1 %32, i1 false
  %40 = select i1 %38, i1 %35, i1 false
  %41 = icmp slt i32 %22, %34
  %42 = select i1 %31, i1 %41, i1 false
  %43 = select i1 %38, i1 %41, i1 false
  %44 = icmp slt i32 %14, %37
  %45 = select i1 %44, i1 %32, i1 false
  %46 = select i1 %44, i1 %35, i1 false
  %47 = add nsw i32 %22, 1
  %48 = mul nsw i32 %47, %3
  %49 = add nsw i32 %22, -1
  %50 = mul nsw i32 %49, %3
  br label %52

51:                                               ; preds = %156, %5
  ret void

52:                                               ; preds = %24, %156
  %53 = phi i32 [ 0, %24 ], [ %157, %156 ]
  br i1 %27, label %54, label %156

54:                                               ; preds = %52
  %55 = mul i32 %30, %53
  %56 = add nsw i32 %29, %55
  br i1 %33, label %57, label %64

57:                                               ; preds = %54
  %58 = sext i32 %56 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !6
  %61 = fcmp contract une float %60, 0.000000e+00
  br i1 %61, label %62, label %64

62:                                               ; preds = %57
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  store i32 2, i32 addrspace(1)* %63, align 4, !tbaa !11
  br label %156

64:                                               ; preds = %57, %54
  br i1 %36, label %65, label %72

65:                                               ; preds = %64
  %66 = sext i32 %56 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !6
  %69 = fcmp contract une float %68, 0.000000e+00
  br i1 %69, label %70, label %72

70:                                               ; preds = %65
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %66
  store i32 2, i32 addrspace(1)* %71, align 4, !tbaa !11
  br label %156

72:                                               ; preds = %65, %64
  br i1 %39, label %73, label %80

73:                                               ; preds = %72
  %74 = sext i32 %56 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = fcmp contract une float %76, 0.000000e+00
  br i1 %77, label %78, label %80

78:                                               ; preds = %73
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %74
  store i32 2, i32 addrspace(1)* %79, align 4, !tbaa !11
  br label %156

80:                                               ; preds = %73, %72
  br i1 %40, label %81, label %88

81:                                               ; preds = %80
  %82 = sext i32 %56 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %85 = fcmp contract une float %84, 0.000000e+00
  br i1 %85, label %86, label %88

86:                                               ; preds = %81
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  store i32 2, i32 addrspace(1)* %87, align 4, !tbaa !11
  br label %156

88:                                               ; preds = %81, %80
  br i1 %42, label %89, label %96

89:                                               ; preds = %88
  %90 = sext i32 %56 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = fcmp contract une float %92, 0.000000e+00
  br i1 %93, label %94, label %96

94:                                               ; preds = %89
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %90
  store i32 2, i32 addrspace(1)* %95, align 4, !tbaa !11
  br label %156

96:                                               ; preds = %89, %88
  br i1 %43, label %97, label %104

97:                                               ; preds = %96
  %98 = sext i32 %56 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !6
  %101 = fcmp contract une float %100, 0.000000e+00
  br i1 %101, label %102, label %104

102:                                              ; preds = %97
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  store i32 2, i32 addrspace(1)* %103, align 4, !tbaa !11
  br label %156

104:                                              ; preds = %97, %96
  br i1 %45, label %105, label %112

105:                                              ; preds = %104
  %106 = sext i32 %56 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !6
  %109 = fcmp contract une float %108, 0.000000e+00
  br i1 %109, label %110, label %112

110:                                              ; preds = %105
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %106
  store i32 2, i32 addrspace(1)* %111, align 4, !tbaa !11
  br label %156

112:                                              ; preds = %105, %104
  %113 = sext i32 %56 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = fcmp contract une float %115, 0.000000e+00
  %117 = select i1 %46, i1 %116, i1 false
  br i1 %117, label %118, label %120

118:                                              ; preds = %112
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %113
  store i32 2, i32 addrspace(1)* %119, align 4, !tbaa !11
  br label %156

120:                                              ; preds = %112
  %121 = add i32 %55, %14
  %122 = add nsw i32 %121, -1
  %123 = add i32 %122, %28
  %124 = add i32 %121, %48
  %125 = add i32 %121, %50
  %126 = fcmp contract ult float %115, 5.000000e-01
  br i1 %126, label %151, label %127

127:                                              ; preds = %120
  %128 = add i32 %121, 1
  %129 = add i32 %128, %28
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !6
  %133 = fcmp contract ult float %132, 5.000000e-01
  br i1 %133, label %151, label %134

134:                                              ; preds = %127
  %135 = sext i32 %123 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !6
  %138 = fcmp contract ult float %137, 5.000000e-01
  br i1 %138, label %151, label %139

139:                                              ; preds = %134
  %140 = sext i32 %124 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !6
  %143 = fcmp contract ult float %142, 5.000000e-01
  br i1 %143, label %151, label %144

144:                                              ; preds = %139
  %145 = sext i32 %125 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !6
  %148 = fcmp contract ult float %147, 5.000000e-01
  br i1 %148, label %151, label %149

149:                                              ; preds = %144
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %113
  store i32 0, i32 addrspace(1)* %150, align 4, !tbaa !11
  br label %156

151:                                              ; preds = %144, %139, %134, %127, %120
  %152 = fcmp contract une float %115, 0.000000e+00
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %113
  br i1 %152, label %154, label %155

154:                                              ; preds = %151
  store i32 1, i32 addrspace(1)* %153, align 4, !tbaa !11
  br label %156

155:                                              ; preds = %151
  store i32 2, i32 addrspace(1)* %153, align 4, !tbaa !11
  br label %156

156:                                              ; preds = %62, %78, %94, %110, %118, %102, %86, %70, %154, %155, %149, %52
  %157 = add nuw nsw i32 %53, 1
  %158 = icmp eq i32 %157, %2
  br i1 %158, label %51, label %52, !llvm.loop !13
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
