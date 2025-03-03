; ModuleID = '../data/hip_kernels/2818/3/main.cu'
source_filename = "../data/hip_kernels/2818/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20fast_variance_kernelPfS_iiiS_E5local = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20fast_variance_kernelPfS_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %7
  store float 0.000000e+00, float addrspace(3)* %8, align 4, !tbaa !5
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = icmp sgt i32 %2, 0
  br i1 %10, label %11, label %177

11:                                               ; preds = %6
  %12 = icmp sgt i32 %4, 0
  %13 = sext i32 %9 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = add i32 %4, -1
  %16 = lshr i32 %15, 9
  %17 = add nuw nsw i32 %16, 1
  %18 = and i32 %17, 7
  %19 = icmp ult i32 %4, 3585
  %20 = and i32 %17, -8
  %21 = icmp eq i32 %18, 0
  br label %22

22:                                               ; preds = %11, %173
  %23 = phi float [ 0.000000e+00, %11 ], [ %174, %173 ]
  %24 = phi i32 [ 0, %11 ], [ %175, %173 ]
  br i1 %12, label %25, label %173

25:                                               ; preds = %22
  %26 = mul i32 %24, %3
  %27 = add i32 %26, %9
  %28 = mul i32 %27, %4
  br i1 %19, label %147, label %29

29:                                               ; preds = %25, %141
  %30 = phi float [ %143, %141 ], [ %23, %25 ]
  %31 = phi i32 [ %144, %141 ], [ 0, %25 ]
  %32 = phi i32 [ %145, %141 ], [ 0, %25 ]
  %33 = or i32 %31, %7
  %34 = icmp slt i32 %33, %4
  br i1 %34, label %35, label %43

35:                                               ; preds = %29
  %36 = add i32 %33, %28
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %41 = fsub contract float %39, %40
  %42 = fmul contract float %41, %41
  br label %43

43:                                               ; preds = %29, %35
  %44 = phi contract float [ %42, %35 ], [ 0.000000e+00, %29 ]
  %45 = fadd contract float %44, %30
  %46 = or i32 %31, 512
  %47 = add nuw nsw i32 %46, %7
  %48 = icmp slt i32 %47, %4
  br i1 %48, label %49, label %57

49:                                               ; preds = %43
  %50 = add i32 %47, %28
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !5, !amdgpu.noclobber !9
  %54 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = fsub contract float %53, %54
  %56 = fmul contract float %55, %55
  br label %57

57:                                               ; preds = %49, %43
  %58 = phi contract float [ %56, %49 ], [ 0.000000e+00, %43 ]
  %59 = fadd contract float %58, %45
  %60 = or i32 %31, %7
  %61 = or i32 %60, 1024
  %62 = icmp slt i32 %61, %4
  br i1 %62, label %63, label %71

63:                                               ; preds = %57
  %64 = add i32 %61, %28
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %69 = fsub contract float %67, %68
  %70 = fmul contract float %69, %69
  br label %71

71:                                               ; preds = %63, %57
  %72 = phi contract float [ %70, %63 ], [ 0.000000e+00, %57 ]
  %73 = fadd contract float %72, %59
  %74 = or i32 %31, 1536
  %75 = add nuw nsw i32 %74, %7
  %76 = icmp slt i32 %75, %4
  br i1 %76, label %77, label %85

77:                                               ; preds = %71
  %78 = add i32 %75, %28
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = fsub contract float %81, %82
  %84 = fmul contract float %83, %83
  br label %85

85:                                               ; preds = %77, %71
  %86 = phi contract float [ %84, %77 ], [ 0.000000e+00, %71 ]
  %87 = fadd contract float %86, %73
  %88 = or i32 %31, %7
  %89 = or i32 %88, 2048
  %90 = icmp slt i32 %89, %4
  br i1 %90, label %91, label %99

91:                                               ; preds = %85
  %92 = add i32 %89, %28
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = fsub contract float %95, %96
  %98 = fmul contract float %97, %97
  br label %99

99:                                               ; preds = %91, %85
  %100 = phi contract float [ %98, %91 ], [ 0.000000e+00, %85 ]
  %101 = fadd contract float %100, %87
  %102 = or i32 %31, 2560
  %103 = add nuw nsw i32 %102, %7
  %104 = icmp slt i32 %103, %4
  br i1 %104, label %105, label %113

105:                                              ; preds = %99
  %106 = add i32 %103, %28
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  %110 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = fsub contract float %109, %110
  %112 = fmul contract float %111, %111
  br label %113

113:                                              ; preds = %105, %99
  %114 = phi contract float [ %112, %105 ], [ 0.000000e+00, %99 ]
  %115 = fadd contract float %114, %101
  %116 = or i32 %31, %7
  %117 = or i32 %116, 3072
  %118 = icmp slt i32 %117, %4
  br i1 %118, label %119, label %127

119:                                              ; preds = %113
  %120 = add i32 %117, %28
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  %124 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = fsub contract float %123, %124
  %126 = fmul contract float %125, %125
  br label %127

127:                                              ; preds = %119, %113
  %128 = phi contract float [ %126, %119 ], [ 0.000000e+00, %113 ]
  %129 = fadd contract float %128, %115
  %130 = or i32 %31, 3584
  %131 = add nuw nsw i32 %130, %7
  %132 = icmp slt i32 %131, %4
  br i1 %132, label %133, label %141

133:                                              ; preds = %127
  %134 = add i32 %131, %28
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = fsub contract float %137, %138
  %140 = fmul contract float %139, %139
  br label %141

141:                                              ; preds = %133, %127
  %142 = phi contract float [ %140, %133 ], [ 0.000000e+00, %127 ]
  %143 = fadd contract float %142, %129
  %144 = add nuw nsw i32 %31, 4096
  %145 = add i32 %32, 8
  %146 = icmp eq i32 %145, %20
  br i1 %146, label %147, label %29, !llvm.loop !10

147:                                              ; preds = %141, %25
  %148 = phi float [ undef, %25 ], [ %143, %141 ]
  %149 = phi float [ %23, %25 ], [ %143, %141 ]
  %150 = phi i32 [ 0, %25 ], [ %144, %141 ]
  br i1 %21, label %171, label %151

151:                                              ; preds = %147, %165
  %152 = phi float [ %167, %165 ], [ %149, %147 ]
  %153 = phi i32 [ %168, %165 ], [ %150, %147 ]
  %154 = phi i32 [ %169, %165 ], [ 0, %147 ]
  %155 = add nuw nsw i32 %153, %7
  %156 = icmp slt i32 %155, %4
  br i1 %156, label %157, label %165

157:                                              ; preds = %151
  %158 = add i32 %155, %28
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5, !amdgpu.noclobber !9
  %162 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %163 = fsub contract float %161, %162
  %164 = fmul contract float %163, %163
  br label %165

165:                                              ; preds = %157, %151
  %166 = phi contract float [ %164, %157 ], [ 0.000000e+00, %151 ]
  %167 = fadd contract float %166, %152
  %168 = add nuw nsw i32 %153, 512
  %169 = add i32 %154, 1
  %170 = icmp eq i32 %169, %18
  br i1 %170, label %171, label %151, !llvm.loop !12

171:                                              ; preds = %165, %147
  %172 = phi float [ %148, %147 ], [ %167, %165 ]
  store float %172, float addrspace(3)* %8, align 4, !tbaa !5
  br label %173

173:                                              ; preds = %171, %22
  %174 = phi float [ %172, %171 ], [ %23, %22 ]
  %175 = add nuw nsw i32 %24, 1
  %176 = icmp eq i32 %175, %2
  br i1 %176, label %177, label %22, !llvm.loop !14

177:                                              ; preds = %173, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %178 = icmp eq i32 %7, 0
  br i1 %178, label %179, label %255

179:                                              ; preds = %177
  %180 = sext i32 %9 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %5, i64 %180
  store float 0.000000e+00, float addrspace(1)* %181, align 4, !tbaa !5
  br label %182

182:                                              ; preds = %182, %179
  %183 = phi i32 [ 0, %179 ], [ %248, %182 ]
  %184 = phi float [ 0.000000e+00, %179 ], [ %247, %182 ]
  %185 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %183
  %186 = load float, float addrspace(3)* %185, align 16, !tbaa !5
  %187 = fadd contract float %186, %184
  %188 = or i32 %183, 1
  %189 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %188
  %190 = load float, float addrspace(3)* %189, align 4, !tbaa !5
  %191 = fadd contract float %190, %187
  %192 = or i32 %183, 2
  %193 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %192
  %194 = load float, float addrspace(3)* %193, align 8, !tbaa !5
  %195 = fadd contract float %194, %191
  %196 = or i32 %183, 3
  %197 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %196
  %198 = load float, float addrspace(3)* %197, align 4, !tbaa !5
  %199 = fadd contract float %198, %195
  %200 = or i32 %183, 4
  %201 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %200
  %202 = load float, float addrspace(3)* %201, align 16, !tbaa !5
  %203 = fadd contract float %202, %199
  %204 = or i32 %183, 5
  %205 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %204
  %206 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %207 = fadd contract float %206, %203
  %208 = or i32 %183, 6
  %209 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %208
  %210 = load float, float addrspace(3)* %209, align 8, !tbaa !5
  %211 = fadd contract float %210, %207
  %212 = or i32 %183, 7
  %213 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %212
  %214 = load float, float addrspace(3)* %213, align 4, !tbaa !5
  %215 = fadd contract float %214, %211
  %216 = or i32 %183, 8
  %217 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %216
  %218 = load float, float addrspace(3)* %217, align 16, !tbaa !5
  %219 = fadd contract float %218, %215
  %220 = or i32 %183, 9
  %221 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %220
  %222 = load float, float addrspace(3)* %221, align 4, !tbaa !5
  %223 = fadd contract float %222, %219
  %224 = or i32 %183, 10
  %225 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %224
  %226 = load float, float addrspace(3)* %225, align 8, !tbaa !5
  %227 = fadd contract float %226, %223
  %228 = or i32 %183, 11
  %229 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %228
  %230 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %231 = fadd contract float %230, %227
  %232 = or i32 %183, 12
  %233 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %232
  %234 = load float, float addrspace(3)* %233, align 16, !tbaa !5
  %235 = fadd contract float %234, %231
  %236 = or i32 %183, 13
  %237 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %236
  %238 = load float, float addrspace(3)* %237, align 4, !tbaa !5
  %239 = fadd contract float %238, %235
  %240 = or i32 %183, 14
  %241 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %240
  %242 = load float, float addrspace(3)* %241, align 8, !tbaa !5
  %243 = fadd contract float %242, %239
  %244 = or i32 %183, 15
  %245 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %244
  %246 = load float, float addrspace(3)* %245, align 4, !tbaa !5
  %247 = fadd contract float %246, %243
  %248 = add nuw nsw i32 %183, 16
  %249 = icmp eq i32 %248, 512
  br i1 %249, label %250, label %182, !llvm.loop !15

250:                                              ; preds = %182
  %251 = mul nsw i32 %4, %2
  %252 = add nsw i32 %251, -1
  %253 = sitofp i32 %252 to float
  %254 = fdiv contract float %247, %253
  store float %254, float addrspace(1)* %181, align 4, !tbaa !5
  br label %255

255:                                              ; preds = %250, %177
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
