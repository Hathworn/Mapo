; ModuleID = '../data/hip_kernels/580/0/main.cu'
source_filename = "../data/hip_kernels/580/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12network_corrPfS_PiS_S_mmmmmiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i32 %10, i32 %11, float addrspace(1)* nocapture writeonly %12) local_unnamed_addr #0 {
  %14 = shl i64 %6, 32
  %15 = and i64 %14, -137438953472
  %16 = add i64 %15, 137438953472
  %17 = lshr exact i64 %16, 32
  %18 = trunc i64 %17 to i32
  %19 = or i32 %18, 4
  %20 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = zext i32 %21 to i64
  %23 = freeze i64 %22
  %24 = freeze i64 %8
  %25 = udiv i64 %23, %24
  %26 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %27 = getelementptr i8, i8 addrspace(4)* %26, i64 4
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !4, !invariant.load !5
  %30 = zext i16 %29 to i32
  %31 = trunc i64 %25 to i32
  %32 = mul i32 %30, %31
  %33 = add i32 %32, %10
  %34 = trunc i64 %5 to i32
  %35 = mul i32 %33, %34
  %36 = mul i64 %25, %24
  %37 = sub i64 %23, %36
  %38 = icmp eq i64 %9, 0
  br i1 %38, label %273, label %39

39:                                               ; preds = %13
  %40 = zext i32 %10 to i64
  %41 = shl nuw i64 %37, 32
  %42 = ashr exact i64 %41, 32
  %43 = mul i64 %42, %9
  %44 = sext i32 %35 to i64
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %46 = zext i32 %45 to i64
  %47 = sub nsw i64 %46, %40
  %48 = mul i64 %9, %8
  %49 = mul i64 %37, %9
  %50 = mul i64 %46, %5
  %51 = add i64 %50, %6
  %52 = icmp eq i32 %45, 0
  %53 = sext i32 %45 to i64
  %54 = icmp ult i64 %53, %6
  %55 = zext i16 %29 to i64
  %56 = mul i64 %55, %5
  %57 = add i64 %56, %6
  %58 = icmp eq i64 %6, 0
  %59 = mul i32 %45, %34
  %60 = sext i32 %11 to i64
  %61 = mul i64 %48, %60
  %62 = and i64 %6, 7
  %63 = icmp ult i64 %6, 8
  %64 = and i64 %6, -8
  %65 = icmp eq i64 %62, 0
  br label %66

66:                                               ; preds = %39, %269
  %67 = phi i64 [ 0, %39 ], [ %271, %269 ]
  %68 = add i64 %67, %43
  %69 = getelementptr inbounds float, float addrspace(1)* %4, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !6
  %71 = fcmp contract une float %70, 0.000000e+00
  br i1 %71, label %72, label %269

72:                                               ; preds = %66
  %73 = udiv i64 %44, %5
  %74 = add i64 %47, %73
  %75 = mul i64 %48, %74
  %76 = add i64 %75, %43
  %77 = add i64 %67, %76
  %78 = add i64 %67, %49
  %79 = mul i64 %78, %6
  %80 = trunc i64 %79 to i32
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !10
  %83 = add nsw i32 %82, %35
  %84 = zext i32 %83 to i64
  %85 = add i64 %51, %84
  %86 = mul i64 %78, %7
  %87 = trunc i64 %86 to i32
  %88 = add i32 %83, %87
  br i1 %52, label %89, label %94

89:                                               ; preds = %72
  %90 = shl i64 %68, 32
  %91 = ashr exact i64 %90, 32
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !6
  store float %93, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 0), align 4, !tbaa !6
  br label %94

94:                                               ; preds = %89, %72
  br i1 %54, label %99, label %95

95:                                               ; preds = %115, %94
  %96 = phi i64 [ %53, %94 ], [ %117, %115 ]
  %97 = phi i32 [ %45, %94 ], [ %116, %115 ]
  %98 = icmp ugt i64 %57, %96
  br i1 %98, label %119, label %134

99:                                               ; preds = %94, %115
  %100 = phi i32 [ %116, %115 ], [ %45, %94 ]
  %101 = add nsw i32 %100, %80
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !6
  %105 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %100
  store float %104, float addrspace(3)* %105, align 4, !tbaa !6
  %106 = add nsw i32 %100, %83
  %107 = sext i32 %106 to i64
  %108 = icmp ult i64 %107, %7
  br i1 %108, label %109, label %115

109:                                              ; preds = %99
  %110 = add nsw i32 %100, %88
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %3, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !6
  %114 = getelementptr inbounds float, float addrspace(3)* %20, i32 %100
  store float %113, float addrspace(3)* %114, align 4, !tbaa !6
  br label %115

115:                                              ; preds = %109, %99
  %116 = add i32 %100, %30
  %117 = sext i32 %116 to i64
  %118 = icmp ult i64 %117, %6
  br i1 %118, label %99, label %95, !llvm.loop !12

119:                                              ; preds = %95, %130
  %120 = phi i32 [ %131, %130 ], [ %97, %95 ]
  %121 = add nsw i32 %120, %83
  %122 = sext i32 %121 to i64
  %123 = icmp ult i64 %122, %7
  br i1 %123, label %124, label %130

124:                                              ; preds = %119
  %125 = add nsw i32 %120, %88
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %3, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !6
  %129 = getelementptr inbounds float, float addrspace(3)* %20, i32 %120
  store float %128, float addrspace(3)* %129, align 4, !tbaa !6
  br label %130

130:                                              ; preds = %124, %119
  %131 = add i32 %120, %30
  %132 = sext i32 %131 to i64
  %133 = icmp ugt i64 %57, %132
  br i1 %133, label %119, label %134, !llvm.loop !14

134:                                              ; preds = %130, %95
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %135 = shl i64 %85, 32
  %136 = ashr exact i64 %135, 32
  %137 = icmp ult i64 %136, %7
  br i1 %137, label %138, label %269

138:                                              ; preds = %134
  br i1 %58, label %250, label %139

139:                                              ; preds = %138
  br i1 %63, label %227, label %140

140:                                              ; preds = %139, %140
  %141 = phi i32 [ %224, %140 ], [ 0, %139 ]
  %142 = phi float [ %221, %140 ], [ 0.000000e+00, %139 ]
  %143 = phi float [ %223, %140 ], [ 0.000000e+00, %139 ]
  %144 = phi i64 [ %225, %140 ], [ 0, %139 ]
  %145 = add i32 %141, %59
  %146 = getelementptr inbounds float, float addrspace(3)* %20, i32 %145
  %147 = load float, float addrspace(3)* %146, align 4, !tbaa !6
  %148 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %141
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !6
  %150 = fmul contract float %147, %149
  %151 = fadd contract float %142, %150
  %152 = fmul contract float %147, %147
  %153 = fadd contract float %143, %152
  %154 = or i32 %141, 1
  %155 = add i32 %154, %59
  %156 = getelementptr inbounds float, float addrspace(3)* %20, i32 %155
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !6
  %158 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %154
  %159 = load float, float addrspace(3)* %158, align 4, !tbaa !6
  %160 = fmul contract float %157, %159
  %161 = fadd contract float %151, %160
  %162 = fmul contract float %157, %157
  %163 = fadd contract float %153, %162
  %164 = or i32 %141, 2
  %165 = add i32 %164, %59
  %166 = getelementptr inbounds float, float addrspace(3)* %20, i32 %165
  %167 = load float, float addrspace(3)* %166, align 4, !tbaa !6
  %168 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %164
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !6
  %170 = fmul contract float %167, %169
  %171 = fadd contract float %161, %170
  %172 = fmul contract float %167, %167
  %173 = fadd contract float %163, %172
  %174 = or i32 %141, 3
  %175 = add i32 %174, %59
  %176 = getelementptr inbounds float, float addrspace(3)* %20, i32 %175
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !6
  %178 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %174
  %179 = load float, float addrspace(3)* %178, align 4, !tbaa !6
  %180 = fmul contract float %177, %179
  %181 = fadd contract float %171, %180
  %182 = fmul contract float %177, %177
  %183 = fadd contract float %173, %182
  %184 = or i32 %141, 4
  %185 = add i32 %184, %59
  %186 = getelementptr inbounds float, float addrspace(3)* %20, i32 %185
  %187 = load float, float addrspace(3)* %186, align 4, !tbaa !6
  %188 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %184
  %189 = load float, float addrspace(3)* %188, align 4, !tbaa !6
  %190 = fmul contract float %187, %189
  %191 = fadd contract float %181, %190
  %192 = fmul contract float %187, %187
  %193 = fadd contract float %183, %192
  %194 = or i32 %141, 5
  %195 = add i32 %194, %59
  %196 = getelementptr inbounds float, float addrspace(3)* %20, i32 %195
  %197 = load float, float addrspace(3)* %196, align 4, !tbaa !6
  %198 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %194
  %199 = load float, float addrspace(3)* %198, align 4, !tbaa !6
  %200 = fmul contract float %197, %199
  %201 = fadd contract float %191, %200
  %202 = fmul contract float %197, %197
  %203 = fadd contract float %193, %202
  %204 = or i32 %141, 6
  %205 = add i32 %204, %59
  %206 = getelementptr inbounds float, float addrspace(3)* %20, i32 %205
  %207 = load float, float addrspace(3)* %206, align 4, !tbaa !6
  %208 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %204
  %209 = load float, float addrspace(3)* %208, align 4, !tbaa !6
  %210 = fmul contract float %207, %209
  %211 = fadd contract float %201, %210
  %212 = fmul contract float %207, %207
  %213 = fadd contract float %203, %212
  %214 = or i32 %141, 7
  %215 = add i32 %214, %59
  %216 = getelementptr inbounds float, float addrspace(3)* %20, i32 %215
  %217 = load float, float addrspace(3)* %216, align 4, !tbaa !6
  %218 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %214
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !6
  %220 = fmul contract float %217, %219
  %221 = fadd contract float %211, %220
  %222 = fmul contract float %217, %217
  %223 = fadd contract float %213, %222
  %224 = add nuw nsw i32 %141, 8
  %225 = add i64 %144, 8
  %226 = icmp eq i64 %225, %64
  br i1 %226, label %227, label %140, !llvm.loop !15

227:                                              ; preds = %140, %139
  %228 = phi float [ undef, %139 ], [ %221, %140 ]
  %229 = phi float [ undef, %139 ], [ %223, %140 ]
  %230 = phi i32 [ 0, %139 ], [ %224, %140 ]
  %231 = phi float [ 0.000000e+00, %139 ], [ %221, %140 ]
  %232 = phi float [ 0.000000e+00, %139 ], [ %223, %140 ]
  br i1 %65, label %250, label %233

233:                                              ; preds = %227, %233
  %234 = phi i32 [ %247, %233 ], [ %230, %227 ]
  %235 = phi float [ %244, %233 ], [ %231, %227 ]
  %236 = phi float [ %246, %233 ], [ %232, %227 ]
  %237 = phi i64 [ %248, %233 ], [ 0, %227 ]
  %238 = add i32 %234, %59
  %239 = getelementptr inbounds float, float addrspace(3)* %20, i32 %238
  %240 = load float, float addrspace(3)* %239, align 4, !tbaa !6
  %241 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 4), i32 %234
  %242 = load float, float addrspace(3)* %241, align 4, !tbaa !6
  %243 = fmul contract float %240, %242
  %244 = fadd contract float %235, %243
  %245 = fmul contract float %240, %240
  %246 = fadd contract float %236, %245
  %247 = add nuw nsw i32 %234, 1
  %248 = add i64 %237, 1
  %249 = icmp eq i64 %248, %62
  br i1 %249, label %250, label %233, !llvm.loop !16

250:                                              ; preds = %227, %233, %138
  %251 = phi float [ 0.000000e+00, %138 ], [ %229, %227 ], [ %246, %233 ]
  %252 = phi float [ 0.000000e+00, %138 ], [ %228, %227 ], [ %244, %233 ]
  %253 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared, i32 0, i32 0), align 4, !tbaa !6
  %254 = fmul contract float %251, %253
  %255 = shl i64 %77, 32
  %256 = ashr exact i64 %255, 32
  %257 = icmp ugt i64 %61, %256
  %258 = fcmp contract ogt float %254, 0x3EB0C6F7A0000000
  %259 = select i1 %257, i1 %258, i1 false
  br i1 %259, label %260, label %269

260:                                              ; preds = %250
  %261 = fcmp olt float %254, 0x39B0000000000000
  %262 = select i1 %261, float 0x4310000000000000, float 1.000000e+00
  %263 = select i1 %261, float 0x4630000000000000, float 1.000000e+00
  %264 = fmul float %254, %263
  %265 = tail call float @llvm.amdgcn.rsq.f32(float %264)
  %266 = fmul float %262, %265
  %267 = fmul contract float %252, %266
  %268 = getelementptr inbounds float, float addrspace(1)* %12, i64 %256
  store float %267, float addrspace(1)* %268, align 4, !tbaa !6
  br label %269

269:                                              ; preds = %134, %260, %250, %66
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %270 = add nuw nsw i64 %67, 1
  %271 = and i64 %270, 4294967295
  %272 = icmp ult i64 %271, %9
  br i1 %272, label %66, label %273, !llvm.loop !18

273:                                              ; preds = %269, %13
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rsq.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !13}
