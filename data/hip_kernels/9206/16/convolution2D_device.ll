; ModuleID = '../data/hip_kernels/9206/16/main.cu'
source_filename = "../data/hip_kernels/9206/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13convolution2DPKfS0_Pfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
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
  %22 = mul nsw i32 %13, %3
  %23 = add nsw i32 %22, %21
  %24 = icmp slt i32 %13, %3
  %25 = icmp slt i32 %21, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %172

27:                                               ; preds = %4
  %28 = add nsw i32 %13, -1
  %29 = add nsw i32 %21, -1
  %30 = icmp sgt i32 %13, 0
  %31 = mul nsw i32 %28, %3
  br i1 %30, label %128, label %140

32:                                               ; preds = %169
  %33 = icmp sgt i32 %21, 0
  %34 = icmp sle i32 %21, %3
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %45

36:                                               ; preds = %32
  %37 = add nsw i32 %29, %22
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 3
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = fmul contract float %40, %42
  %44 = fadd contract float %170, %43
  br label %45

45:                                               ; preds = %169, %32, %36
  %46 = phi float [ %44, %36 ], [ %170, %32 ], [ %170, %169 ]
  %47 = icmp sgt i32 %21, -1
  %48 = select i1 %171, i1 %47, i1 false
  br i1 %48, label %49, label %57

49:                                               ; preds = %45
  %50 = sext i32 %23 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 4
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fmul contract float %52, %54
  %56 = fadd contract float %46, %55
  br label %57

57:                                               ; preds = %49, %45
  %58 = phi float [ %56, %49 ], [ %46, %45 ]
  %59 = add nsw i32 %21, 1
  br i1 %171, label %60, label %73

60:                                               ; preds = %57
  %61 = icmp sgt i32 %21, -2
  %62 = icmp slt i32 %59, %3
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %64, label %73

64:                                               ; preds = %60
  %65 = add nsw i32 %59, %22
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 5
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = fmul contract float %68, %70
  %72 = fadd contract float %58, %71
  br label %73

73:                                               ; preds = %57, %60, %64
  %74 = phi float [ %72, %64 ], [ %58, %60 ], [ %58, %57 ]
  %75 = add nsw i32 %13, 1
  %76 = icmp sgt i32 %13, -2
  %77 = icmp slt i32 %75, %3
  %78 = mul nsw i32 %75, %3
  br i1 %76, label %79, label %93

79:                                               ; preds = %73
  %80 = icmp sgt i32 %21, 0
  %81 = select i1 %77, i1 %80, i1 false
  %82 = icmp sle i32 %21, %3
  %83 = select i1 %81, i1 %82, i1 false
  br i1 %83, label %84, label %93

84:                                               ; preds = %79
  %85 = add nsw i32 %29, %78
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 6
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract float %88, %90
  %92 = fadd contract float %74, %91
  br label %93

93:                                               ; preds = %73, %79, %84
  %94 = phi i1 [ false, %73 ], [ %77, %79 ], [ %77, %84 ]
  %95 = phi float [ %74, %73 ], [ %74, %79 ], [ %92, %84 ]
  %96 = icmp sgt i32 %21, -1
  %97 = select i1 %94, i1 %96, i1 false
  br i1 %97, label %98, label %107

98:                                               ; preds = %93
  %99 = add nsw i32 %21, %78
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 7
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract float %102, %104
  %106 = fadd contract float %95, %105
  br label %107

107:                                              ; preds = %98, %93
  %108 = phi float [ %106, %98 ], [ %95, %93 ]
  %109 = add nsw i32 %21, 1
  br i1 %76, label %110, label %124

110:                                              ; preds = %107
  %111 = icmp sgt i32 %21, -2
  %112 = select i1 %77, i1 %111, i1 false
  %113 = icmp slt i32 %109, %3
  %114 = select i1 %112, i1 %113, i1 false
  br i1 %114, label %115, label %124

115:                                              ; preds = %110
  %116 = add nsw i32 %109, %78
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 8
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fmul contract float %119, %121
  %123 = fadd contract float %108, %122
  br label %124

124:                                              ; preds = %107, %110, %115
  %125 = phi float [ %123, %115 ], [ %108, %110 ], [ %108, %107 ]
  %126 = sext i32 %23 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %126
  store float %125, float addrspace(1)* %127, align 4, !tbaa !7
  br label %172

128:                                              ; preds = %27
  %129 = icmp sgt i32 %21, 0
  %130 = icmp sle i32 %21, %3
  %131 = select i1 %129, i1 %130, i1 false
  br i1 %131, label %132, label %140

132:                                              ; preds = %128
  %133 = add nsw i32 %29, %31
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = load float, float addrspace(1)* %1, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %138, 0.000000e+00
  br label %140

140:                                              ; preds = %27, %128, %132
  %141 = phi float [ %139, %132 ], [ 0.000000e+00, %128 ], [ 0.000000e+00, %27 ]
  %142 = icmp sgt i32 %21, -1
  %143 = select i1 %30, i1 %142, i1 false
  br i1 %143, label %144, label %153

144:                                              ; preds = %140
  %145 = add nsw i32 %21, %31
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = fmul contract float %148, %150
  %152 = fadd contract float %141, %151
  br label %153

153:                                              ; preds = %144, %140
  %154 = phi float [ %152, %144 ], [ %141, %140 ]
  %155 = add nsw i32 %21, 1
  br i1 %30, label %156, label %169

156:                                              ; preds = %153
  %157 = icmp sgt i32 %21, -2
  %158 = icmp slt i32 %155, %3
  %159 = select i1 %157, i1 %158, i1 false
  br i1 %159, label %160, label %169

160:                                              ; preds = %156
  %161 = add nsw i32 %155, %31
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7, !amdgpu.noclobber !5
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  %167 = fmul contract float %164, %166
  %168 = fadd contract float %154, %167
  br label %169

169:                                              ; preds = %160, %156, %153
  %170 = phi float [ %168, %160 ], [ %154, %156 ], [ %154, %153 ]
  %171 = icmp sgt i32 %13, -1
  br i1 %171, label %32, label %45

172:                                              ; preds = %124, %4
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
