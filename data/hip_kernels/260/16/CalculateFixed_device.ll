; ModuleID = '../data/hip_kernels/260/16/main.cu'
source_filename = "../data/hip_kernels/260/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14CalculateFixedPKfS0_S0_Pfiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %27 = add i32 %25, %26
  %28 = mul nsw i32 %19, %6
  %29 = add nsw i32 %28, %27
  %30 = icmp slt i32 %19, %7
  %31 = icmp slt i32 %27, %6
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %261

33:                                               ; preds = %10
  %34 = sext i32 %29 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fcmp contract ogt float %36, 1.270000e+02
  br i1 %37, label %38, label %261

38:                                               ; preds = %33
  %39 = icmp eq i32 %19, 0
  %40 = icmp eq i32 %27, 0
  %41 = add nsw i32 %7, -1
  %42 = icmp eq i32 %19, %41
  %43 = add nsw i32 %6, -1
  %44 = icmp ne i32 %27, %43
  %45 = select i1 %39, i32 0, i32 %6
  %46 = sub nsw i32 %29, %45
  %47 = add nsw i32 %29, -1
  %48 = select i1 %40, i32 %28, i32 %47
  %49 = select i1 %42, i32 0, i32 %6
  %50 = add nsw i32 %29, %49
  %51 = zext i1 %44 to i32
  %52 = add nsw i32 %29, %51
  %53 = mul nsw i32 %29, 3
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = fmul contract float %56, 4.000000e+00
  %58 = mul nsw i32 %46, 3
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = mul nsw i32 %48, 3
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fadd contract float %61, %65
  %67 = mul nsw i32 %50, 3
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = fadd contract float %66, %70
  %72 = mul nsw i32 %52, 3
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fadd contract float %71, %75
  %77 = fsub contract float %57, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  store float %77, float addrspace(1)* %78, align 4, !tbaa !7
  %79 = add nsw i32 %53, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fmul contract float %82, 4.000000e+00
  %84 = add nsw i32 %58, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = add nsw i32 %62, 1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fadd contract float %87, %91
  %93 = add nsw i32 %67, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fadd contract float %92, %96
  %98 = add nsw i32 %72, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = fadd contract float %97, %101
  %103 = fsub contract float %83, %102
  %104 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  store float %103, float addrspace(1)* %104, align 4, !tbaa !7
  %105 = add nsw i32 %53, 2
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = fmul contract float %108, 4.000000e+00
  %110 = add nsw i32 %58, 2
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = add nsw i32 %62, 2
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fadd contract float %113, %117
  %119 = add nsw i32 %67, 2
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fadd contract float %118, %122
  %124 = add nsw i32 %72, 2
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = fadd contract float %123, %127
  %129 = fsub contract float %109, %128
  %130 = getelementptr inbounds float, float addrspace(1)* %3, i64 %106
  store float %129, float addrspace(1)* %130, align 4, !tbaa !7
  %131 = add nsw i32 %19, %8
  %132 = add nsw i32 %27, %9
  %133 = mul nsw i32 %131, %4
  %134 = add nsw i32 %133, %132
  %135 = icmp sgt i32 %131, -1
  br i1 %135, label %136, label %261

136:                                              ; preds = %38
  %137 = icmp slt i32 %131, %5
  %138 = icmp sgt i32 %132, -1
  %139 = select i1 %137, i1 %138, i1 false
  %140 = icmp slt i32 %132, %4
  %141 = select i1 %139, i1 %140, i1 false
  br i1 %141, label %142, label %261

142:                                              ; preds = %136
  %143 = icmp eq i32 %131, 0
  %144 = icmp eq i32 %132, 0
  %145 = add nsw i32 %5, -1
  %146 = icmp eq i32 %131, %145
  %147 = add nsw i32 %4, -1
  %148 = icmp ne i32 %132, %147
  %149 = select i1 %143, i32 0, i32 %4
  %150 = sub nsw i32 %134, %149
  %151 = add nsw i32 %134, -1
  %152 = select i1 %144, i32 %133, i32 %151
  %153 = select i1 %146, i32 0, i32 %4
  %154 = add nsw i32 %134, %153
  %155 = zext i1 %148 to i32
  %156 = add nsw i32 %134, %155
  br i1 %39, label %162, label %157

157:                                              ; preds = %142
  %158 = sext i32 %46 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %2, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7
  %161 = fcmp contract ole float %160, 1.270000e+02
  br label %162

162:                                              ; preds = %142, %157
  %163 = phi i1 [ %161, %157 ], [ true, %142 ]
  br i1 %40, label %169, label %164

164:                                              ; preds = %162
  %165 = sext i32 %48 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7
  %168 = fcmp contract ole float %167, 1.270000e+02
  br label %169

169:                                              ; preds = %162, %164
  %170 = phi i1 [ %168, %164 ], [ true, %162 ]
  br i1 %42, label %176, label %171

171:                                              ; preds = %169
  %172 = sext i32 %50 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %2, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7
  %175 = fcmp contract ole float %174, 1.270000e+02
  br label %176

176:                                              ; preds = %169, %171
  %177 = phi i1 [ %175, %171 ], [ true, %169 ]
  br i1 %44, label %178, label %183

178:                                              ; preds = %176
  %179 = sext i32 %52 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %2, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7
  %182 = fcmp contract ole float %181, 1.270000e+02
  br label %183

183:                                              ; preds = %176, %178
  %184 = phi i1 [ %182, %178 ], [ true, %176 ]
  br i1 %163, label %185, label %201

185:                                              ; preds = %183
  %186 = mul nsw i32 %150, 3
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7
  %190 = fadd contract float %77, %189
  store float %190, float addrspace(1)* %78, align 4, !tbaa !7
  %191 = add nsw i32 %186, 1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %0, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = fadd contract float %103, %194
  store float %195, float addrspace(1)* %104, align 4, !tbaa !7
  %196 = add nsw i32 %186, 2
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %0, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = fadd contract float %129, %199
  store float %200, float addrspace(1)* %130, align 4, !tbaa !7
  br label %201

201:                                              ; preds = %185, %183
  %202 = phi float [ %200, %185 ], [ %129, %183 ]
  %203 = phi float [ %195, %185 ], [ %103, %183 ]
  %204 = phi float [ %190, %185 ], [ %77, %183 ]
  br i1 %170, label %205, label %221

205:                                              ; preds = %201
  %206 = mul nsw i32 %152, 3
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %0, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7
  %210 = fadd contract float %209, %204
  store float %210, float addrspace(1)* %78, align 4, !tbaa !7
  %211 = add nsw i32 %206, 1
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %0, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !7
  %215 = fadd contract float %214, %203
  store float %215, float addrspace(1)* %104, align 4, !tbaa !7
  %216 = add nsw i32 %206, 2
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %0, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !7
  %220 = fadd contract float %219, %202
  store float %220, float addrspace(1)* %130, align 4, !tbaa !7
  br label %221

221:                                              ; preds = %205, %201
  %222 = phi float [ %220, %205 ], [ %202, %201 ]
  %223 = phi float [ %215, %205 ], [ %203, %201 ]
  %224 = phi float [ %210, %205 ], [ %204, %201 ]
  br i1 %177, label %225, label %241

225:                                              ; preds = %221
  %226 = mul nsw i32 %154, 3
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !7
  %230 = fadd contract float %229, %224
  store float %230, float addrspace(1)* %78, align 4, !tbaa !7
  %231 = add nsw i32 %226, 1
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds float, float addrspace(1)* %0, i64 %232
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !7
  %235 = fadd contract float %234, %223
  store float %235, float addrspace(1)* %104, align 4, !tbaa !7
  %236 = add nsw i32 %226, 2
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %0, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !7
  %240 = fadd contract float %239, %222
  store float %240, float addrspace(1)* %130, align 4, !tbaa !7
  br label %241

241:                                              ; preds = %225, %221
  %242 = phi float [ %240, %225 ], [ %222, %221 ]
  %243 = phi float [ %235, %225 ], [ %223, %221 ]
  %244 = phi float [ %230, %225 ], [ %224, %221 ]
  br i1 %184, label %245, label %261

245:                                              ; preds = %241
  %246 = mul nsw i32 %156, 3
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds float, float addrspace(1)* %0, i64 %247
  %249 = load float, float addrspace(1)* %248, align 4, !tbaa !7
  %250 = fadd contract float %249, %244
  store float %250, float addrspace(1)* %78, align 4, !tbaa !7
  %251 = add nsw i32 %246, 1
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %0, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !7
  %255 = fadd contract float %254, %243
  store float %255, float addrspace(1)* %104, align 4, !tbaa !7
  %256 = add nsw i32 %246, 2
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %0, i64 %257
  %259 = load float, float addrspace(1)* %258, align 4, !tbaa !7
  %260 = fadd contract float %259, %242
  store float %260, float addrspace(1)* %130, align 4, !tbaa !7
  br label %261

261:                                              ; preds = %38, %136, %245, %241, %33, %10
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
