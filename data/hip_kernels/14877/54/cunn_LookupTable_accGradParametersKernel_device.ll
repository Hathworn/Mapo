; ModuleID = '../data/hip_kernels/14877/54/main.cu'
source_filename = "../data/hip_kernels/14877/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40cunn_LookupTable_accGradParametersKernelPfS_S_S_S_flli(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, float addrspace(1)* readonly %4, float %5, i64 %6, i64 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 2
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = icmp slt i64 %14, %6
  br i1 %15, label %16, label %181

16:                                               ; preds = %9
  %17 = icmp eq i32 %13, 0
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !5
  br i1 %17, label %29, label %20

20:                                               ; preds = %16
  %21 = add nsw i32 %13, -1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = fcmp contract une float %19, %24
  %26 = sitofp i32 %8 to float
  %27 = fcmp contract une float %19, %26
  %28 = select i1 %25, i1 %27, i1 false
  br i1 %28, label %32, label %181

29:                                               ; preds = %16
  %30 = sitofp i32 %8 to float
  %31 = fcmp contract une float %19, %30
  br i1 %31, label %32, label %181

32:                                               ; preds = %20, %29
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %35 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %36 = getelementptr i8, i8 addrspace(4)* %35, i64 4
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !10, !invariant.load !9
  %39 = zext i16 %38 to i32
  %40 = shl i32 %34, 2
  %41 = mul i32 %40, %39
  %42 = add i32 %41, %33
  %43 = trunc i64 %7 to i32
  %44 = icmp eq float addrspace(1)* %4, addrspacecast (float* null to float addrspace(1)*)
  %45 = sext i32 %42 to i64
  %46 = icmp slt i64 %45, %7
  %47 = add nsw i32 %42, 32
  %48 = sext i32 %47 to i64
  %49 = icmp slt i64 %48, %7
  %50 = add nsw i32 %42, 64
  %51 = sext i32 %50 to i64
  %52 = icmp slt i64 %51, %7
  %53 = add nsw i32 %42, 96
  %54 = sext i32 %53 to i64
  %55 = icmp slt i64 %54, %7
  br label %56

56:                                               ; preds = %32, %176
  %57 = phi float [ %178, %176 ], [ %19, %32 ]
  %58 = phi <4 x float> [ %131, %176 ], [ undef, %32 ]
  %59 = phi <4 x float> [ %152, %176 ], [ undef, %32 ]
  %60 = phi i32 [ %173, %176 ], [ %13, %32 ]
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = fptosi float %57 to i32
  %64 = add nsw i32 %63, -1
  %65 = mul i32 %64, %43
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5
  %68 = fptosi float %67 to i32
  %69 = add nsw i32 %68, -1
  %70 = mul i32 %69, %43
  br i1 %44, label %75, label %71

71:                                               ; preds = %56
  %72 = getelementptr inbounds float, float addrspace(1)* %4, i64 %61
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5
  %74 = fdiv contract float %5, %73
  br label %75

75:                                               ; preds = %56, %71
  %76 = phi contract float [ %74, %71 ], [ %5, %56 ]
  br i1 %46, label %77, label %88

77:                                               ; preds = %75
  %78 = add nsw i32 %42, %70
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = insertelement <4 x float> %58, float %81, i64 0
  %83 = add nsw i32 %42, %65
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5
  %87 = insertelement <4 x float> %59, float %86, i64 0
  br label %88

88:                                               ; preds = %77, %75
  %89 = phi <4 x float> [ %82, %77 ], [ %58, %75 ]
  %90 = phi <4 x float> [ %87, %77 ], [ %59, %75 ]
  br i1 %49, label %91, label %102

91:                                               ; preds = %88
  %92 = add nsw i32 %47, %70
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5
  %96 = insertelement <4 x float> %89, float %95, i64 1
  %97 = add nsw i32 %47, %65
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5
  %101 = insertelement <4 x float> %90, float %100, i64 1
  br label %102

102:                                              ; preds = %91, %88
  %103 = phi <4 x float> [ %96, %91 ], [ %89, %88 ]
  %104 = phi <4 x float> [ %101, %91 ], [ %90, %88 ]
  br i1 %52, label %105, label %116

105:                                              ; preds = %102
  %106 = add nsw i32 %50, %70
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5
  %110 = insertelement <4 x float> %103, float %109, i64 2
  %111 = add nsw i32 %50, %65
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %3, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5
  %115 = insertelement <4 x float> %104, float %114, i64 2
  br label %116

116:                                              ; preds = %105, %102
  %117 = phi <4 x float> [ %110, %105 ], [ %103, %102 ]
  %118 = phi <4 x float> [ %115, %105 ], [ %104, %102 ]
  br i1 %55, label %119, label %130

119:                                              ; preds = %116
  %120 = add nsw i32 %53, %70
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5
  %124 = insertelement <4 x float> %117, float %123, i64 3
  %125 = add nsw i32 %53, %65
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %3, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !5
  %129 = insertelement <4 x float> %118, float %128, i64 3
  br label %130

130:                                              ; preds = %119, %116
  %131 = phi <4 x float> [ %124, %119 ], [ %117, %116 ]
  %132 = phi <4 x float> [ %129, %119 ], [ %118, %116 ]
  %133 = extractelement <4 x float> %131, i64 0
  %134 = fmul contract float %76, %133
  %135 = extractelement <4 x float> %132, i64 0
  %136 = fadd contract float %135, %134
  %137 = insertelement <4 x float> poison, float %136, i64 0
  %138 = extractelement <4 x float> %131, i64 1
  %139 = fmul contract float %76, %138
  %140 = extractelement <4 x float> %132, i64 1
  %141 = fadd contract float %140, %139
  %142 = insertelement <4 x float> %137, float %141, i64 1
  %143 = extractelement <4 x float> %131, i64 2
  %144 = fmul contract float %76, %143
  %145 = extractelement <4 x float> %132, i64 2
  %146 = fadd contract float %145, %144
  %147 = insertelement <4 x float> %142, float %146, i64 2
  %148 = extractelement <4 x float> %131, i64 3
  %149 = fmul contract float %76, %148
  %150 = extractelement <4 x float> %132, i64 3
  %151 = fadd contract float %150, %149
  %152 = insertelement <4 x float> %147, float %151, i64 3
  br i1 %46, label %153, label %157

153:                                              ; preds = %130
  %154 = add nsw i32 %42, %65
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %3, i64 %155
  store float %136, float addrspace(1)* %156, align 4, !tbaa !5
  br label %157

157:                                              ; preds = %153, %130
  br i1 %49, label %158, label %162

158:                                              ; preds = %157
  %159 = add nsw i32 %47, %65
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %3, i64 %160
  store float %141, float addrspace(1)* %161, align 4, !tbaa !5
  br label %162

162:                                              ; preds = %158, %157
  br i1 %52, label %163, label %167

163:                                              ; preds = %162
  %164 = add nsw i32 %50, %65
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %3, i64 %165
  store float %146, float addrspace(1)* %166, align 4, !tbaa !5
  br label %167

167:                                              ; preds = %163, %162
  br i1 %55, label %168, label %172

168:                                              ; preds = %167
  %169 = add nsw i32 %53, %65
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %3, i64 %170
  store float %151, float addrspace(1)* %171, align 4, !tbaa !5
  br label %172

172:                                              ; preds = %168, %167
  %173 = add nsw i32 %60, 1
  %174 = sext i32 %173 to i64
  %175 = icmp slt i64 %174, %6
  br i1 %175, label %176, label %181

176:                                              ; preds = %172
  %177 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !5
  %179 = load float, float addrspace(1)* %62, align 4, !tbaa !5
  %180 = fcmp contract oeq float %178, %179
  br i1 %180, label %56, label %181, !llvm.loop !11

181:                                              ; preds = %172, %176, %29, %20, %9
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
