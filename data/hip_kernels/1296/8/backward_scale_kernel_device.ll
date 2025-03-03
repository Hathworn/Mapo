; ModuleID = '../data/hip_kernels/1296/8/main.cu'
source_filename = "../data/hip_kernels/1296/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21backward_scale_kernelPfS_iiiS_E4part = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21backward_scale_kernelPfS_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = icmp sgt i32 %2, 0
  br i1 %9, label %10, label %172

10:                                               ; preds = %6
  %11 = icmp sgt i32 %4, 0
  %12 = add i32 %4, -1
  %13 = lshr i32 %12, 9
  %14 = add nuw nsw i32 %13, 1
  %15 = and i32 %14, 7
  %16 = icmp ult i32 %4, 3585
  %17 = and i32 %14, -8
  %18 = icmp eq i32 %15, 0
  br label %19

19:                                               ; preds = %10, %168
  %20 = phi float [ 0.000000e+00, %10 ], [ %169, %168 ]
  %21 = phi i32 [ 0, %10 ], [ %170, %168 ]
  br i1 %11, label %22, label %168

22:                                               ; preds = %19
  %23 = mul nsw i32 %21, %3
  %24 = add nsw i32 %23, %7
  %25 = mul nsw i32 %24, %4
  br i1 %16, label %144, label %26

26:                                               ; preds = %22, %138
  %27 = phi i32 [ %141, %138 ], [ 0, %22 ]
  %28 = phi float [ %140, %138 ], [ %20, %22 ]
  %29 = phi i32 [ %142, %138 ], [ 0, %22 ]
  %30 = or i32 %27, %8
  %31 = icmp slt i32 %30, %4
  br i1 %31, label %32, label %40

32:                                               ; preds = %26
  %33 = add nsw i32 %30, %25
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = fmul contract float %36, %38
  br label %40

40:                                               ; preds = %26, %32
  %41 = phi contract float [ %39, %32 ], [ 0.000000e+00, %26 ]
  %42 = fadd contract float %28, %41
  %43 = or i32 %27, 512
  %44 = add nuw nsw i32 %43, %8
  %45 = icmp slt i32 %44, %4
  br i1 %45, label %46, label %54

46:                                               ; preds = %40
  %47 = add nsw i32 %44, %25
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = fmul contract float %50, %52
  br label %54

54:                                               ; preds = %46, %40
  %55 = phi contract float [ %53, %46 ], [ 0.000000e+00, %40 ]
  %56 = fadd contract float %42, %55
  %57 = or i32 %27, %8
  %58 = or i32 %57, 1024
  %59 = icmp slt i32 %58, %4
  br i1 %59, label %60, label %68

60:                                               ; preds = %54
  %61 = add nsw i32 %58, %25
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  %67 = fmul contract float %64, %66
  br label %68

68:                                               ; preds = %60, %54
  %69 = phi contract float [ %67, %60 ], [ 0.000000e+00, %54 ]
  %70 = fadd contract float %56, %69
  %71 = or i32 %27, 1536
  %72 = add nuw nsw i32 %71, %8
  %73 = icmp slt i32 %72, %4
  br i1 %73, label %74, label %82

74:                                               ; preds = %68
  %75 = add nsw i32 %72, %25
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = fmul contract float %78, %80
  br label %82

82:                                               ; preds = %74, %68
  %83 = phi contract float [ %81, %74 ], [ 0.000000e+00, %68 ]
  %84 = fadd contract float %70, %83
  %85 = or i32 %27, %8
  %86 = or i32 %85, 2048
  %87 = icmp slt i32 %86, %4
  br i1 %87, label %88, label %96

88:                                               ; preds = %82
  %89 = add nsw i32 %86, %25
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = fmul contract float %92, %94
  br label %96

96:                                               ; preds = %88, %82
  %97 = phi contract float [ %95, %88 ], [ 0.000000e+00, %82 ]
  %98 = fadd contract float %84, %97
  %99 = or i32 %27, 2560
  %100 = add nuw nsw i32 %99, %8
  %101 = icmp slt i32 %100, %4
  br i1 %101, label %102, label %110

102:                                              ; preds = %96
  %103 = add nsw i32 %100, %25
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = fmul contract float %106, %108
  br label %110

110:                                              ; preds = %102, %96
  %111 = phi contract float [ %109, %102 ], [ 0.000000e+00, %96 ]
  %112 = fadd contract float %98, %111
  %113 = or i32 %27, %8
  %114 = or i32 %113, 3072
  %115 = icmp slt i32 %114, %4
  br i1 %115, label %116, label %124

116:                                              ; preds = %110
  %117 = add nsw i32 %114, %25
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5, !amdgpu.noclobber !9
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5, !amdgpu.noclobber !9
  %123 = fmul contract float %120, %122
  br label %124

124:                                              ; preds = %116, %110
  %125 = phi contract float [ %123, %116 ], [ 0.000000e+00, %110 ]
  %126 = fadd contract float %112, %125
  %127 = or i32 %27, 3584
  %128 = add nuw nsw i32 %127, %8
  %129 = icmp slt i32 %128, %4
  br i1 %129, label %130, label %138

130:                                              ; preds = %124
  %131 = add nsw i32 %128, %25
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = fmul contract float %134, %136
  br label %138

138:                                              ; preds = %130, %124
  %139 = phi contract float [ %137, %130 ], [ 0.000000e+00, %124 ]
  %140 = fadd contract float %126, %139
  %141 = add nuw nsw i32 %27, 4096
  %142 = add i32 %29, 8
  %143 = icmp eq i32 %142, %17
  br i1 %143, label %144, label %26, !llvm.loop !10

144:                                              ; preds = %138, %22
  %145 = phi float [ undef, %22 ], [ %140, %138 ]
  %146 = phi i32 [ 0, %22 ], [ %141, %138 ]
  %147 = phi float [ %20, %22 ], [ %140, %138 ]
  br i1 %18, label %168, label %148

148:                                              ; preds = %144, %162
  %149 = phi i32 [ %165, %162 ], [ %146, %144 ]
  %150 = phi float [ %164, %162 ], [ %147, %144 ]
  %151 = phi i32 [ %166, %162 ], [ 0, %144 ]
  %152 = add nuw nsw i32 %149, %8
  %153 = icmp slt i32 %152, %4
  br i1 %153, label %154, label %162

154:                                              ; preds = %148
  %155 = add nsw i32 %152, %25
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !5, !amdgpu.noclobber !9
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !5, !amdgpu.noclobber !9
  %161 = fmul contract float %158, %160
  br label %162

162:                                              ; preds = %154, %148
  %163 = phi contract float [ %161, %154 ], [ 0.000000e+00, %148 ]
  %164 = fadd contract float %150, %163
  %165 = add nuw nsw i32 %149, 512
  %166 = add i32 %151, 1
  %167 = icmp eq i32 %166, %15
  br i1 %167, label %168, label %148, !llvm.loop !12

168:                                              ; preds = %144, %162, %19
  %169 = phi float [ %20, %19 ], [ %145, %144 ], [ %164, %162 ]
  %170 = add nuw nsw i32 %21, 1
  %171 = icmp eq i32 %170, %2
  br i1 %171, label %172, label %19, !llvm.loop !14

172:                                              ; preds = %168, %6
  %173 = phi float [ 0.000000e+00, %6 ], [ %169, %168 ]
  %174 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %8
  store float %173, float addrspace(3)* %174, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %175 = icmp eq i32 %8, 0
  br i1 %175, label %176, label %249

176:                                              ; preds = %172
  %177 = sext i32 %7 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %5, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !5
  br label %180

180:                                              ; preds = %180, %176
  %181 = phi i32 [ 0, %176 ], [ %246, %180 ]
  %182 = phi float [ %179, %176 ], [ %245, %180 ]
  %183 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %181
  %184 = load float, float addrspace(3)* %183, align 16, !tbaa !5
  %185 = fadd contract float %184, %182
  %186 = or i32 %181, 1
  %187 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %186
  %188 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %189 = fadd contract float %188, %185
  %190 = or i32 %181, 2
  %191 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %190
  %192 = load float, float addrspace(3)* %191, align 8, !tbaa !5
  %193 = fadd contract float %192, %189
  %194 = or i32 %181, 3
  %195 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %194
  %196 = load float, float addrspace(3)* %195, align 4, !tbaa !5
  %197 = fadd contract float %196, %193
  %198 = or i32 %181, 4
  %199 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 16, !tbaa !5
  %201 = fadd contract float %200, %197
  %202 = or i32 %181, 5
  %203 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %202
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %205 = fadd contract float %204, %201
  %206 = or i32 %181, 6
  %207 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %206
  %208 = load float, float addrspace(3)* %207, align 8, !tbaa !5
  %209 = fadd contract float %208, %205
  %210 = or i32 %181, 7
  %211 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %210
  %212 = load float, float addrspace(3)* %211, align 4, !tbaa !5
  %213 = fadd contract float %212, %209
  %214 = or i32 %181, 8
  %215 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %214
  %216 = load float, float addrspace(3)* %215, align 16, !tbaa !5
  %217 = fadd contract float %216, %213
  %218 = or i32 %181, 9
  %219 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %218
  %220 = load float, float addrspace(3)* %219, align 4, !tbaa !5
  %221 = fadd contract float %220, %217
  %222 = or i32 %181, 10
  %223 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %222
  %224 = load float, float addrspace(3)* %223, align 8, !tbaa !5
  %225 = fadd contract float %224, %221
  %226 = or i32 %181, 11
  %227 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %226
  %228 = load float, float addrspace(3)* %227, align 4, !tbaa !5
  %229 = fadd contract float %228, %225
  %230 = or i32 %181, 12
  %231 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %230
  %232 = load float, float addrspace(3)* %231, align 16, !tbaa !5
  %233 = fadd contract float %232, %229
  %234 = or i32 %181, 13
  %235 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %234
  %236 = load float, float addrspace(3)* %235, align 4, !tbaa !5
  %237 = fadd contract float %236, %233
  %238 = or i32 %181, 14
  %239 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %238
  %240 = load float, float addrspace(3)* %239, align 8, !tbaa !5
  %241 = fadd contract float %240, %237
  %242 = or i32 %181, 15
  %243 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ21backward_scale_kernelPfS_iiiS_E4part, i32 0, i32 %242
  %244 = load float, float addrspace(3)* %243, align 4, !tbaa !5
  %245 = fadd contract float %244, %241
  %246 = add nuw nsw i32 %181, 16
  %247 = icmp eq i32 %246, 512
  br i1 %247, label %248, label %180, !llvm.loop !15

248:                                              ; preds = %180
  store float %245, float addrspace(1)* %178, align 4, !tbaa !5
  br label %249

249:                                              ; preds = %248, %172
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
