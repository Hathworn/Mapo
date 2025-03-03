; ModuleID = '../data/hip_kernels/1752/68/main.cu'
source_filename = "../data/hip_kernels/1752/68/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22fast_mean_delta_kernelPfS_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %7
  store float 0.000000e+00, float addrspace(3)* %8, align 4, !tbaa !5
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = icmp sgt i32 %2, 0
  br i1 %10, label %11, label %148

11:                                               ; preds = %6
  %12 = icmp sgt i32 %4, 0
  %13 = add i32 %4, -1
  %14 = lshr i32 %13, 9
  %15 = add nuw nsw i32 %14, 1
  %16 = and i32 %15, 7
  %17 = icmp ult i32 %4, 3585
  %18 = and i32 %15, -8
  %19 = icmp eq i32 %16, 0
  br label %20

20:                                               ; preds = %11, %144
  %21 = phi float [ 0.000000e+00, %11 ], [ %145, %144 ]
  %22 = phi i32 [ 0, %11 ], [ %146, %144 ]
  br i1 %12, label %23, label %144

23:                                               ; preds = %20
  %24 = mul i32 %22, %3
  %25 = add i32 %24, %9
  %26 = mul i32 %25, %4
  br i1 %17, label %121, label %27

27:                                               ; preds = %23, %115
  %28 = phi float [ %117, %115 ], [ %21, %23 ]
  %29 = phi i32 [ %118, %115 ], [ 0, %23 ]
  %30 = phi i32 [ %119, %115 ], [ 0, %23 ]
  %31 = or i32 %29, %7
  %32 = icmp slt i32 %31, %4
  br i1 %32, label %33, label %38

33:                                               ; preds = %27
  %34 = add i32 %31, %26
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %38

38:                                               ; preds = %27, %33
  %39 = phi contract float [ %37, %33 ], [ 0.000000e+00, %27 ]
  %40 = fadd contract float %39, %28
  %41 = or i32 %29, 512
  %42 = add nuw nsw i32 %41, %7
  %43 = icmp slt i32 %42, %4
  br i1 %43, label %44, label %49

44:                                               ; preds = %38
  %45 = add i32 %42, %26
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %49

49:                                               ; preds = %44, %38
  %50 = phi contract float [ %48, %44 ], [ 0.000000e+00, %38 ]
  %51 = fadd contract float %50, %40
  %52 = or i32 %29, %7
  %53 = or i32 %52, 1024
  %54 = icmp slt i32 %53, %4
  br i1 %54, label %55, label %60

55:                                               ; preds = %49
  %56 = add i32 %53, %26
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %60

60:                                               ; preds = %55, %49
  %61 = phi contract float [ %59, %55 ], [ 0.000000e+00, %49 ]
  %62 = fadd contract float %61, %51
  %63 = or i32 %29, 1536
  %64 = add nuw nsw i32 %63, %7
  %65 = icmp slt i32 %64, %4
  br i1 %65, label %66, label %71

66:                                               ; preds = %60
  %67 = add i32 %64, %26
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %71

71:                                               ; preds = %66, %60
  %72 = phi contract float [ %70, %66 ], [ 0.000000e+00, %60 ]
  %73 = fadd contract float %72, %62
  %74 = or i32 %29, %7
  %75 = or i32 %74, 2048
  %76 = icmp slt i32 %75, %4
  br i1 %76, label %77, label %82

77:                                               ; preds = %71
  %78 = add i32 %75, %26
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %82

82:                                               ; preds = %77, %71
  %83 = phi contract float [ %81, %77 ], [ 0.000000e+00, %71 ]
  %84 = fadd contract float %83, %73
  %85 = or i32 %29, 2560
  %86 = add nuw nsw i32 %85, %7
  %87 = icmp slt i32 %86, %4
  br i1 %87, label %88, label %93

88:                                               ; preds = %82
  %89 = add i32 %86, %26
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %93

93:                                               ; preds = %88, %82
  %94 = phi contract float [ %92, %88 ], [ 0.000000e+00, %82 ]
  %95 = fadd contract float %94, %84
  %96 = or i32 %29, %7
  %97 = or i32 %96, 3072
  %98 = icmp slt i32 %97, %4
  br i1 %98, label %99, label %104

99:                                               ; preds = %93
  %100 = add i32 %97, %26
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %104

104:                                              ; preds = %99, %93
  %105 = phi contract float [ %103, %99 ], [ 0.000000e+00, %93 ]
  %106 = fadd contract float %105, %95
  %107 = or i32 %29, 3584
  %108 = add nuw nsw i32 %107, %7
  %109 = icmp slt i32 %108, %4
  br i1 %109, label %110, label %115

110:                                              ; preds = %104
  %111 = add i32 %108, %26
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %115

115:                                              ; preds = %110, %104
  %116 = phi contract float [ %114, %110 ], [ 0.000000e+00, %104 ]
  %117 = fadd contract float %116, %106
  %118 = add nuw nsw i32 %29, 4096
  %119 = add i32 %30, 8
  %120 = icmp eq i32 %119, %18
  br i1 %120, label %121, label %27, !llvm.loop !10

121:                                              ; preds = %115, %23
  %122 = phi float [ undef, %23 ], [ %117, %115 ]
  %123 = phi float [ %21, %23 ], [ %117, %115 ]
  %124 = phi i32 [ 0, %23 ], [ %118, %115 ]
  br i1 %19, label %142, label %125

125:                                              ; preds = %121, %136
  %126 = phi float [ %138, %136 ], [ %123, %121 ]
  %127 = phi i32 [ %139, %136 ], [ %124, %121 ]
  %128 = phi i32 [ %140, %136 ], [ 0, %121 ]
  %129 = add nuw nsw i32 %127, %7
  %130 = icmp slt i32 %129, %4
  br i1 %130, label %131, label %136

131:                                              ; preds = %125
  %132 = add i32 %129, %26
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %136

136:                                              ; preds = %131, %125
  %137 = phi contract float [ %135, %131 ], [ 0.000000e+00, %125 ]
  %138 = fadd contract float %137, %126
  %139 = add nuw nsw i32 %127, 512
  %140 = add i32 %128, 1
  %141 = icmp eq i32 %140, %16
  br i1 %141, label %142, label %125, !llvm.loop !12

142:                                              ; preds = %136, %121
  %143 = phi float [ %122, %121 ], [ %138, %136 ]
  store float %143, float addrspace(3)* %8, align 4, !tbaa !5
  br label %144

144:                                              ; preds = %142, %20
  %145 = phi float [ %143, %142 ], [ %21, %20 ]
  %146 = add nuw nsw i32 %22, 1
  %147 = icmp eq i32 %146, %2
  br i1 %147, label %148, label %20, !llvm.loop !14

148:                                              ; preds = %144, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %149 = icmp eq i32 %7, 0
  br i1 %149, label %150, label %248

150:                                              ; preds = %148
  %151 = sext i32 %9 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %5, i64 %151
  store float 0.000000e+00, float addrspace(1)* %152, align 4, !tbaa !5
  br label %153

153:                                              ; preds = %153, %150
  %154 = phi i32 [ 0, %150 ], [ %219, %153 ]
  %155 = phi float [ 0.000000e+00, %150 ], [ %218, %153 ]
  %156 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %154
  %157 = load float, float addrspace(3)* %156, align 16, !tbaa !5
  %158 = fadd contract float %157, %155
  %159 = or i32 %154, 1
  %160 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %159
  %161 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %162 = fadd contract float %161, %158
  %163 = or i32 %154, 2
  %164 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %163
  %165 = load float, float addrspace(3)* %164, align 8, !tbaa !5
  %166 = fadd contract float %165, %162
  %167 = or i32 %154, 3
  %168 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %167
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !5
  %170 = fadd contract float %169, %166
  %171 = or i32 %154, 4
  %172 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %171
  %173 = load float, float addrspace(3)* %172, align 16, !tbaa !5
  %174 = fadd contract float %173, %170
  %175 = or i32 %154, 5
  %176 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %175
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !5
  %178 = fadd contract float %177, %174
  %179 = or i32 %154, 6
  %180 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %179
  %181 = load float, float addrspace(3)* %180, align 8, !tbaa !5
  %182 = fadd contract float %181, %178
  %183 = or i32 %154, 7
  %184 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %183
  %185 = load float, float addrspace(3)* %184, align 4, !tbaa !5
  %186 = fadd contract float %185, %182
  %187 = or i32 %154, 8
  %188 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %187
  %189 = load float, float addrspace(3)* %188, align 16, !tbaa !5
  %190 = fadd contract float %189, %186
  %191 = or i32 %154, 9
  %192 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %191
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !5
  %194 = fadd contract float %193, %190
  %195 = or i32 %154, 10
  %196 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %195
  %197 = load float, float addrspace(3)* %196, align 8, !tbaa !5
  %198 = fadd contract float %197, %194
  %199 = or i32 %154, 11
  %200 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %199
  %201 = load float, float addrspace(3)* %200, align 4, !tbaa !5
  %202 = fadd contract float %201, %198
  %203 = or i32 %154, 12
  %204 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %203
  %205 = load float, float addrspace(3)* %204, align 16, !tbaa !5
  %206 = fadd contract float %205, %202
  %207 = or i32 %154, 13
  %208 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %207
  %209 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %210 = fadd contract float %209, %206
  %211 = or i32 %154, 14
  %212 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %211
  %213 = load float, float addrspace(3)* %212, align 8, !tbaa !5
  %214 = fadd contract float %213, %210
  %215 = or i32 %154, 15
  %216 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ22fast_mean_delta_kernelPfS_iiiS_E5local, i32 0, i32 %215
  %217 = load float, float addrspace(3)* %216, align 4, !tbaa !5
  %218 = fadd contract float %217, %214
  %219 = add nuw nsw i32 %154, 16
  %220 = icmp eq i32 %219, 512
  br i1 %220, label %221, label %153, !llvm.loop !15

221:                                              ; preds = %153
  store float %218, float addrspace(1)* %152, align 4, !tbaa !5
  %222 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !5
  %224 = fadd contract float %223, 0x3EE4F8B580000000
  %225 = fcmp olt float %224, 0x39F0000000000000
  %226 = select i1 %225, float 0x41F0000000000000, float 1.000000e+00
  %227 = fmul float %224, %226
  %228 = tail call float @llvm.sqrt.f32(float %227)
  %229 = bitcast float %228 to i32
  %230 = add nsw i32 %229, -1
  %231 = bitcast i32 %230 to float
  %232 = add nsw i32 %229, 1
  %233 = bitcast i32 %232 to float
  %234 = tail call i1 @llvm.amdgcn.class.f32(float %227, i32 608)
  %235 = select i1 %225, float 0x3EF0000000000000, float 1.000000e+00
  %236 = fneg float %233
  %237 = tail call float @llvm.fma.f32(float %236, float %228, float %227)
  %238 = fcmp ogt float %237, 0.000000e+00
  %239 = fneg float %231
  %240 = tail call float @llvm.fma.f32(float %239, float %228, float %227)
  %241 = fcmp ole float %240, 0.000000e+00
  %242 = select i1 %241, float %231, float %228
  %243 = select i1 %238, float %233, float %242
  %244 = fmul float %235, %243
  %245 = select i1 %234, float %227, float %244
  %246 = fdiv contract float -1.000000e+00, %245
  %247 = fmul contract float %218, %246
  store float %247, float addrspace(1)* %152, align 4, !tbaa !5
  br label %248

248:                                              ; preds = %221, %148
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
