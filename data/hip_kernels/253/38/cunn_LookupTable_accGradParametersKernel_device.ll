; ModuleID = '../data/hip_kernels/253/38/main.cu'
source_filename = "../data/hip_kernels/253/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40cunn_LookupTable_accGradParametersKernelPfS_S_S_S_fll(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, float addrspace(1)* readonly %4, float %5, i64 %6, i64 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 2
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = icmp slt i64 %13, %6
  br i1 %14, label %15, label %173

15:                                               ; preds = %8
  %16 = icmp eq i32 %12, 0
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5
  br i1 %16, label %25, label %19

19:                                               ; preds = %15
  %20 = add nsw i32 %12, -1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = fcmp contract une float %18, %23
  br i1 %24, label %25, label %173

25:                                               ; preds = %15, %19
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %29 = getelementptr i8, i8 addrspace(4)* %28, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !10, !invariant.load !9
  %32 = zext i16 %31 to i32
  %33 = mul i32 %27, %32
  %34 = add i32 %33, %26
  %35 = trunc i64 %7 to i32
  %36 = icmp eq float addrspace(1)* %4, addrspacecast (float* null to float addrspace(1)*)
  %37 = sext i32 %34 to i64
  %38 = icmp slt i64 %37, %7
  %39 = add nsw i32 %34, 32
  %40 = sext i32 %39 to i64
  %41 = icmp slt i64 %40, %7
  %42 = add nsw i32 %34, 64
  %43 = sext i32 %42 to i64
  %44 = icmp slt i64 %43, %7
  %45 = add nsw i32 %34, 96
  %46 = sext i32 %45 to i64
  %47 = icmp slt i64 %46, %7
  br label %48

48:                                               ; preds = %168, %25
  %49 = phi float [ %18, %25 ], [ %170, %168 ]
  %50 = phi <4 x float> [ undef, %25 ], [ %123, %168 ]
  %51 = phi <4 x float> [ undef, %25 ], [ %144, %168 ]
  %52 = phi i32 [ %12, %25 ], [ %165, %168 ]
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = fptosi float %49 to i32
  %56 = add nsw i32 %55, -1
  %57 = mul i32 %56, %35
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5
  %60 = fptosi float %59 to i32
  %61 = add nsw i32 %60, -1
  %62 = mul i32 %61, %35
  br i1 %36, label %67, label %63

63:                                               ; preds = %48
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %53
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5
  %66 = fdiv contract float %5, %65
  br label %67

67:                                               ; preds = %48, %63
  %68 = phi contract float [ %66, %63 ], [ %5, %48 ]
  br i1 %38, label %69, label %80

69:                                               ; preds = %67
  %70 = add nsw i32 %34, %62
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5
  %74 = insertelement <4 x float> %50, float %73, i64 0
  %75 = add nsw i32 %34, %57
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = insertelement <4 x float> %51, float %78, i64 0
  br label %80

80:                                               ; preds = %69, %67
  %81 = phi <4 x float> [ %74, %69 ], [ %50, %67 ]
  %82 = phi <4 x float> [ %79, %69 ], [ %51, %67 ]
  br i1 %41, label %83, label %94

83:                                               ; preds = %80
  %84 = add nsw i32 %39, %62
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = insertelement <4 x float> %81, float %87, i64 1
  %89 = add nsw i32 %39, %57
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %3, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  %93 = insertelement <4 x float> %82, float %92, i64 1
  br label %94

94:                                               ; preds = %83, %80
  %95 = phi <4 x float> [ %88, %83 ], [ %81, %80 ]
  %96 = phi <4 x float> [ %93, %83 ], [ %82, %80 ]
  br i1 %44, label %97, label %108

97:                                               ; preds = %94
  %98 = add nsw i32 %42, %62
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5
  %102 = insertelement <4 x float> %95, float %101, i64 2
  %103 = add nsw i32 %42, %57
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %3, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = insertelement <4 x float> %96, float %106, i64 2
  br label %108

108:                                              ; preds = %97, %94
  %109 = phi <4 x float> [ %102, %97 ], [ %95, %94 ]
  %110 = phi <4 x float> [ %107, %97 ], [ %96, %94 ]
  br i1 %47, label %111, label %122

111:                                              ; preds = %108
  %112 = add nsw i32 %45, %62
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %2, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5
  %116 = insertelement <4 x float> %109, float %115, i64 3
  %117 = add nsw i32 %45, %57
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %3, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5
  %121 = insertelement <4 x float> %110, float %120, i64 3
  br label %122

122:                                              ; preds = %111, %108
  %123 = phi <4 x float> [ %116, %111 ], [ %109, %108 ]
  %124 = phi <4 x float> [ %121, %111 ], [ %110, %108 ]
  %125 = extractelement <4 x float> %123, i64 0
  %126 = fmul contract float %68, %125
  %127 = extractelement <4 x float> %124, i64 0
  %128 = fadd contract float %127, %126
  %129 = insertelement <4 x float> poison, float %128, i64 0
  %130 = extractelement <4 x float> %123, i64 1
  %131 = fmul contract float %68, %130
  %132 = extractelement <4 x float> %124, i64 1
  %133 = fadd contract float %132, %131
  %134 = insertelement <4 x float> %129, float %133, i64 1
  %135 = extractelement <4 x float> %123, i64 2
  %136 = fmul contract float %68, %135
  %137 = extractelement <4 x float> %124, i64 2
  %138 = fadd contract float %137, %136
  %139 = insertelement <4 x float> %134, float %138, i64 2
  %140 = extractelement <4 x float> %123, i64 3
  %141 = fmul contract float %68, %140
  %142 = extractelement <4 x float> %124, i64 3
  %143 = fadd contract float %142, %141
  %144 = insertelement <4 x float> %139, float %143, i64 3
  br i1 %38, label %145, label %149

145:                                              ; preds = %122
  %146 = add nsw i32 %34, %57
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %3, i64 %147
  store float %128, float addrspace(1)* %148, align 4, !tbaa !5
  br label %149

149:                                              ; preds = %145, %122
  br i1 %41, label %150, label %154

150:                                              ; preds = %149
  %151 = add nsw i32 %39, %57
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %3, i64 %152
  store float %133, float addrspace(1)* %153, align 4, !tbaa !5
  br label %154

154:                                              ; preds = %150, %149
  br i1 %44, label %155, label %159

155:                                              ; preds = %154
  %156 = add nsw i32 %42, %57
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %3, i64 %157
  store float %138, float addrspace(1)* %158, align 4, !tbaa !5
  br label %159

159:                                              ; preds = %155, %154
  br i1 %47, label %160, label %164

160:                                              ; preds = %159
  %161 = add nsw i32 %45, %57
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %3, i64 %162
  store float %143, float addrspace(1)* %163, align 4, !tbaa !5
  br label %164

164:                                              ; preds = %160, %159
  %165 = add nsw i32 %52, 1
  %166 = sext i32 %165 to i64
  %167 = icmp slt i64 %166, %6
  br i1 %167, label %168, label %173

168:                                              ; preds = %164
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !5
  %171 = load float, float addrspace(1)* %54, align 4, !tbaa !5
  %172 = fcmp contract oeq float %170, %171
  br i1 %172, label %48, label %173, !llvm.loop !11

173:                                              ; preds = %164, %168, %19, %8
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
