; ModuleID = '../data/hip_kernels/14923/48/main.cu'
source_filename = "../data/hip_kernels/14923/48/main.cu"
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
  br i1 %14, label %15, label %174

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
  br i1 %24, label %25, label %174

25:                                               ; preds = %15, %19
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %29 = getelementptr i8, i8 addrspace(4)* %28, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 4, !range !10, !invariant.load !9
  %32 = zext i16 %31 to i32
  %33 = shl i32 %27, 2
  %34 = mul i32 %33, %32
  %35 = add i32 %34, %26
  %36 = trunc i64 %7 to i32
  %37 = icmp eq float addrspace(1)* %4, addrspacecast (float* null to float addrspace(1)*)
  %38 = sext i32 %35 to i64
  %39 = icmp slt i64 %38, %7
  %40 = add nsw i32 %35, 32
  %41 = sext i32 %40 to i64
  %42 = icmp slt i64 %41, %7
  %43 = add nsw i32 %35, 64
  %44 = sext i32 %43 to i64
  %45 = icmp slt i64 %44, %7
  %46 = add nsw i32 %35, 96
  %47 = sext i32 %46 to i64
  %48 = icmp slt i64 %47, %7
  br label %49

49:                                               ; preds = %169, %25
  %50 = phi float [ %18, %25 ], [ %171, %169 ]
  %51 = phi <4 x float> [ undef, %25 ], [ %124, %169 ]
  %52 = phi <4 x float> [ undef, %25 ], [ %145, %169 ]
  %53 = phi i32 [ %12, %25 ], [ %166, %169 ]
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = fptosi float %50 to i32
  %57 = add nsw i32 %56, -1
  %58 = mul i32 %57, %36
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = fptosi float %60 to i32
  %62 = add nsw i32 %61, -1
  %63 = mul i32 %62, %36
  br i1 %37, label %68, label %64

64:                                               ; preds = %49
  %65 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = fdiv contract float %5, %66
  br label %68

68:                                               ; preds = %49, %64
  %69 = phi contract float [ %67, %64 ], [ %5, %49 ]
  br i1 %39, label %70, label %81

70:                                               ; preds = %68
  %71 = add nsw i32 %35, %63
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5
  %75 = insertelement <4 x float> %51, float %74, i64 0
  %76 = add nsw i32 %35, %58
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5
  %80 = insertelement <4 x float> %52, float %79, i64 0
  br label %81

81:                                               ; preds = %70, %68
  %82 = phi <4 x float> [ %75, %70 ], [ %51, %68 ]
  %83 = phi <4 x float> [ %80, %70 ], [ %52, %68 ]
  br i1 %42, label %84, label %95

84:                                               ; preds = %81
  %85 = add nsw i32 %40, %63
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = insertelement <4 x float> %82, float %88, i64 1
  %90 = add nsw i32 %40, %58
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5
  %94 = insertelement <4 x float> %83, float %93, i64 1
  br label %95

95:                                               ; preds = %84, %81
  %96 = phi <4 x float> [ %89, %84 ], [ %82, %81 ]
  %97 = phi <4 x float> [ %94, %84 ], [ %83, %81 ]
  br i1 %45, label %98, label %109

98:                                               ; preds = %95
  %99 = add nsw i32 %43, %63
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = insertelement <4 x float> %96, float %102, i64 2
  %104 = add nsw i32 %43, %58
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %3, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5
  %108 = insertelement <4 x float> %97, float %107, i64 2
  br label %109

109:                                              ; preds = %98, %95
  %110 = phi <4 x float> [ %103, %98 ], [ %96, %95 ]
  %111 = phi <4 x float> [ %108, %98 ], [ %97, %95 ]
  br i1 %48, label %112, label %123

112:                                              ; preds = %109
  %113 = add nsw i32 %46, %63
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5
  %117 = insertelement <4 x float> %110, float %116, i64 3
  %118 = add nsw i32 %46, %58
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %3, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5
  %122 = insertelement <4 x float> %111, float %121, i64 3
  br label %123

123:                                              ; preds = %112, %109
  %124 = phi <4 x float> [ %117, %112 ], [ %110, %109 ]
  %125 = phi <4 x float> [ %122, %112 ], [ %111, %109 ]
  %126 = extractelement <4 x float> %124, i64 0
  %127 = fmul contract float %69, %126
  %128 = extractelement <4 x float> %125, i64 0
  %129 = fadd contract float %128, %127
  %130 = insertelement <4 x float> poison, float %129, i64 0
  %131 = extractelement <4 x float> %124, i64 1
  %132 = fmul contract float %69, %131
  %133 = extractelement <4 x float> %125, i64 1
  %134 = fadd contract float %133, %132
  %135 = insertelement <4 x float> %130, float %134, i64 1
  %136 = extractelement <4 x float> %124, i64 2
  %137 = fmul contract float %69, %136
  %138 = extractelement <4 x float> %125, i64 2
  %139 = fadd contract float %138, %137
  %140 = insertelement <4 x float> %135, float %139, i64 2
  %141 = extractelement <4 x float> %124, i64 3
  %142 = fmul contract float %69, %141
  %143 = extractelement <4 x float> %125, i64 3
  %144 = fadd contract float %143, %142
  %145 = insertelement <4 x float> %140, float %144, i64 3
  br i1 %39, label %146, label %150

146:                                              ; preds = %123
  %147 = add nsw i32 %35, %58
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %3, i64 %148
  store float %129, float addrspace(1)* %149, align 4, !tbaa !5
  br label %150

150:                                              ; preds = %146, %123
  br i1 %42, label %151, label %155

151:                                              ; preds = %150
  %152 = add nsw i32 %40, %58
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %3, i64 %153
  store float %134, float addrspace(1)* %154, align 4, !tbaa !5
  br label %155

155:                                              ; preds = %151, %150
  br i1 %45, label %156, label %160

156:                                              ; preds = %155
  %157 = add nsw i32 %43, %58
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %3, i64 %158
  store float %139, float addrspace(1)* %159, align 4, !tbaa !5
  br label %160

160:                                              ; preds = %156, %155
  br i1 %48, label %161, label %165

161:                                              ; preds = %160
  %162 = add nsw i32 %46, %58
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %3, i64 %163
  store float %144, float addrspace(1)* %164, align 4, !tbaa !5
  br label %165

165:                                              ; preds = %161, %160
  %166 = add nsw i32 %53, 1
  %167 = sext i32 %166 to i64
  %168 = icmp slt i64 %167, %6
  br i1 %168, label %169, label %174

169:                                              ; preds = %165
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !5
  %172 = load float, float addrspace(1)* %55, align 4, !tbaa !5
  %173 = fcmp contract oeq float %171, %172
  br i1 %173, label %49, label %174, !llvm.loop !11

174:                                              ; preds = %165, %169, %19, %8
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
