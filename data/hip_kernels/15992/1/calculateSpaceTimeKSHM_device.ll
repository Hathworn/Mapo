; ModuleID = '../data/hip_kernels/15992/1/main.cu'
source_filename = "../data/hip_kernels/15992/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.spacePoint = type { float, float, float }
%struct.blackHole = type { float, float, float }

@s = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22calculateSpaceTimeKSHMP10spacePointiiffffP9blackHoleii(%struct.spacePoint addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float %3, float %4, float %5, float %6, %struct.blackHole addrspace(1)* nocapture readonly %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = add i32 %18, %11
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = icmp eq i32 %19, 0
  %29 = icmp eq i32 %27, 0
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %67

31:                                               ; preds = %10
  %32 = bitcast %struct.blackHole addrspace(1)* %7 to i8 addrspace(1)*
  %33 = sext i32 %9 to i64
  %34 = icmp ugt i32 %9, 3
  br i1 %34, label %35, label %53

35:                                               ; preds = %31, %35
  %36 = phi i8 addrspace(1)* [ %50, %35 ], [ %32, %31 ]
  %37 = phi i8 addrspace(3)* [ %51, %35 ], [ bitcast ([0 x float] addrspace(3)* @s to i8 addrspace(3)*), %31 ]
  %38 = phi i64 [ %49, %35 ], [ %33, %31 ]
  %39 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !7
  store i8 %39, i8 addrspace(3)* %37, align 1, !tbaa !7
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %36, i64 1
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7
  %42 = getelementptr inbounds i8, i8 addrspace(3)* %37, i32 1
  store i8 %41, i8 addrspace(3)* %42, align 1, !tbaa !7
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %36, i64 2
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7
  %45 = getelementptr inbounds i8, i8 addrspace(3)* %37, i32 2
  store i8 %44, i8 addrspace(3)* %45, align 1, !tbaa !7
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %36, i64 3
  %47 = load i8, i8 addrspace(1)* %46, align 1, !tbaa !7
  %48 = getelementptr inbounds i8, i8 addrspace(3)* %37, i32 3
  store i8 %47, i8 addrspace(3)* %48, align 1, !tbaa !7
  %49 = add i64 %38, -4
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %36, i64 4
  %51 = getelementptr inbounds i8, i8 addrspace(3)* %37, i32 4
  %52 = icmp ugt i64 %49, 3
  br i1 %52, label %35, label %53, !llvm.loop !10

53:                                               ; preds = %35, %31
  %54 = phi i64 [ %33, %31 ], [ %49, %35 ]
  %55 = phi i8 addrspace(3)* [ bitcast ([0 x float] addrspace(3)* @s to i8 addrspace(3)*), %31 ], [ %51, %35 ]
  %56 = phi i8 addrspace(1)* [ %32, %31 ], [ %50, %35 ]
  switch i64 %54, label %67 [
    i64 3, label %57
    i64 2, label %61
    i64 1, label %65
  ]

57:                                               ; preds = %53
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %56, i64 2
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7
  %60 = getelementptr inbounds i8, i8 addrspace(3)* %55, i32 2
  store i8 %59, i8 addrspace(3)* %60, align 1, !tbaa !7
  br label %61

61:                                               ; preds = %57, %53
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %56, i64 1
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !7
  %64 = getelementptr inbounds i8, i8 addrspace(3)* %55, i32 1
  store i8 %63, i8 addrspace(3)* %64, align 1, !tbaa !7
  br label %65

65:                                               ; preds = %61, %53
  %66 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7
  store i8 %66, i8 addrspace(3)* %55, align 1, !tbaa !7
  br label %67

67:                                               ; preds = %65, %53, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = icmp slt i32 %19, %1
  %69 = icmp slt i32 %27, %2
  %70 = select i1 %68, i1 %69, i1 false
  br i1 %70, label %71, label %287

71:                                               ; preds = %67
  %72 = sitofp i32 %19 to float
  %73 = sitofp i32 %1 to float
  %74 = fdiv contract float %72, %73
  %75 = fsub contract float %4, %3
  %76 = fmul contract float %75, %74
  %77 = fadd contract float %76, %3
  %78 = sitofp i32 %27 to float
  %79 = sitofp i32 %2 to float
  %80 = fdiv contract float %78, %79
  %81 = fsub contract float %5, %6
  %82 = fmul contract float %81, %80
  %83 = fadd contract float %82, %6
  %84 = mul nsw i32 %19, %1
  %85 = add nsw i32 %84, %27
  %86 = icmp sgt i32 %8, 0
  br i1 %86, label %93, label %87

87:                                               ; preds = %93, %71
  %88 = phi float [ 0.000000e+00, %71 ], [ %284, %93 ]
  %89 = sext i32 %85 to i64
  %90 = getelementptr inbounds %struct.spacePoint, %struct.spacePoint addrspace(1)* %0, i64 %89, i32 0
  store float %77, float addrspace(1)* %90, align 4, !tbaa !12
  %91 = getelementptr inbounds %struct.spacePoint, %struct.spacePoint addrspace(1)* %0, i64 %89, i32 1
  store float %83, float addrspace(1)* %91, align 4, !tbaa !15
  %92 = getelementptr inbounds %struct.spacePoint, %struct.spacePoint addrspace(1)* %0, i64 %89, i32 2
  store float %88, float addrspace(1)* %92, align 4, !tbaa !16
  br label %287

93:                                               ; preds = %71, %93
  %94 = phi float [ %284, %93 ], [ 0.000000e+00, %71 ]
  %95 = phi i32 [ %285, %93 ], [ 0, %71 ]
  %96 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(3)* bitcast ([0 x float] addrspace(3)* @s to %struct.blackHole addrspace(3)*), i32 %95, i32 0
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !17
  %98 = fsub contract float %77, %97
  %99 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(3)* bitcast ([0 x float] addrspace(3)* @s to %struct.blackHole addrspace(3)*), i32 %95, i32 1
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !19
  %101 = fsub contract float %83, %100
  %102 = fmul contract float %98, %98
  %103 = fmul contract float %101, %101
  %104 = fadd contract float %102, %103
  %105 = fcmp olt float %104, 0x39F0000000000000
  %106 = select i1 %105, float 0x41F0000000000000, float 1.000000e+00
  %107 = fmul float %104, %106
  %108 = tail call float @llvm.sqrt.f32(float %107)
  %109 = bitcast float %108 to i32
  %110 = add nsw i32 %109, -1
  %111 = bitcast i32 %110 to float
  %112 = add nsw i32 %109, 1
  %113 = bitcast i32 %112 to float
  %114 = tail call i1 @llvm.amdgcn.class.f32(float %107, i32 608)
  %115 = select i1 %105, float 0x3EF0000000000000, float 1.000000e+00
  %116 = fneg float %113
  %117 = tail call float @llvm.fma.f32(float %116, float %108, float %107)
  %118 = fcmp ogt float %117, 0.000000e+00
  %119 = fneg float %111
  %120 = tail call float @llvm.fma.f32(float %119, float %108, float %107)
  %121 = fcmp ole float %120, 0.000000e+00
  %122 = select i1 %121, float %111, float %108
  %123 = select i1 %118, float %113, float %122
  %124 = fmul float %115, %123
  %125 = select i1 %114, float %107, float %124
  %126 = fcmp contract oeq float %125, 0.000000e+00
  %127 = select i1 %126, float 0x3E112E0BE0000000, float %125
  %128 = tail call float @llvm.fabs.f32(float %127)
  %129 = tail call float @llvm.amdgcn.frexp.mant.f32(float %128)
  %130 = fcmp olt float %129, 0x3FE5555560000000
  %131 = zext i1 %130 to i32
  %132 = tail call float @llvm.amdgcn.ldexp.f32(float %129, i32 %131)
  %133 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %128)
  %134 = sub nsw i32 %133, %131
  %135 = fadd float %132, -1.000000e+00
  %136 = fadd float %132, 1.000000e+00
  %137 = fadd float %136, -1.000000e+00
  %138 = fsub float %132, %137
  %139 = tail call float @llvm.amdgcn.rcp.f32(float %136)
  %140 = fmul float %135, %139
  %141 = fmul float %136, %140
  %142 = fneg float %141
  %143 = tail call float @llvm.fma.f32(float %140, float %136, float %142)
  %144 = tail call float @llvm.fma.f32(float %140, float %138, float %143)
  %145 = fadd float %141, %144
  %146 = fsub float %145, %141
  %147 = fsub float %144, %146
  %148 = fsub float %135, %145
  %149 = fsub float %135, %148
  %150 = fsub float %149, %145
  %151 = fsub float %150, %147
  %152 = fadd float %148, %151
  %153 = fmul float %139, %152
  %154 = fadd float %140, %153
  %155 = fsub float %154, %140
  %156 = fsub float %153, %155
  %157 = fmul float %154, %154
  %158 = fneg float %157
  %159 = tail call float @llvm.fma.f32(float %154, float %154, float %158)
  %160 = fmul float %156, 2.000000e+00
  %161 = tail call float @llvm.fma.f32(float %154, float %160, float %159)
  %162 = fadd float %157, %161
  %163 = fsub float %162, %157
  %164 = fsub float %161, %163
  %165 = tail call float @llvm.fmuladd.f32(float %162, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %166 = tail call float @llvm.fmuladd.f32(float %162, float %165, float 0x3FD999BDE0000000)
  %167 = sitofp i32 %134 to float
  %168 = fmul float %167, 0x3FE62E4300000000
  %169 = fneg float %168
  %170 = tail call float @llvm.fma.f32(float %167, float 0x3FE62E4300000000, float %169)
  %171 = tail call float @llvm.fma.f32(float %167, float 0xBE205C6100000000, float %170)
  %172 = fadd float %168, %171
  %173 = fsub float %172, %168
  %174 = fsub float %171, %173
  %175 = tail call float @llvm.amdgcn.ldexp.f32(float %154, i32 1)
  %176 = fmul float %154, %162
  %177 = fneg float %176
  %178 = tail call float @llvm.fma.f32(float %162, float %154, float %177)
  %179 = tail call float @llvm.fma.f32(float %162, float %156, float %178)
  %180 = tail call float @llvm.fma.f32(float %164, float %154, float %179)
  %181 = fadd float %176, %180
  %182 = fsub float %181, %176
  %183 = fsub float %180, %182
  %184 = fmul float %162, %166
  %185 = fneg float %184
  %186 = tail call float @llvm.fma.f32(float %162, float %166, float %185)
  %187 = tail call float @llvm.fma.f32(float %164, float %166, float %186)
  %188 = fadd float %184, %187
  %189 = fsub float %188, %184
  %190 = fsub float %187, %189
  %191 = fadd float %188, 0x3FE5555540000000
  %192 = fadd float %191, 0xBFE5555540000000
  %193 = fsub float %188, %192
  %194 = fadd float %190, 0x3E2E720200000000
  %195 = fadd float %194, %193
  %196 = fadd float %191, %195
  %197 = fsub float %196, %191
  %198 = fsub float %195, %197
  %199 = fmul float %181, %196
  %200 = fneg float %199
  %201 = tail call float @llvm.fma.f32(float %181, float %196, float %200)
  %202 = tail call float @llvm.fma.f32(float %181, float %198, float %201)
  %203 = tail call float @llvm.fma.f32(float %183, float %196, float %202)
  %204 = tail call float @llvm.amdgcn.ldexp.f32(float %156, i32 1)
  %205 = fadd float %199, %203
  %206 = fsub float %205, %199
  %207 = fsub float %203, %206
  %208 = fadd float %175, %205
  %209 = fsub float %208, %175
  %210 = fsub float %205, %209
  %211 = fadd float %204, %207
  %212 = fadd float %211, %210
  %213 = fadd float %208, %212
  %214 = fsub float %213, %208
  %215 = fsub float %212, %214
  %216 = fadd float %172, %213
  %217 = fsub float %216, %172
  %218 = fsub float %216, %217
  %219 = fsub float %172, %218
  %220 = fsub float %213, %217
  %221 = fadd float %220, %219
  %222 = fadd float %174, %215
  %223 = fsub float %222, %174
  %224 = fsub float %222, %223
  %225 = fsub float %174, %224
  %226 = fsub float %215, %223
  %227 = fadd float %226, %225
  %228 = fadd float %222, %221
  %229 = fadd float %216, %228
  %230 = fsub float %229, %216
  %231 = fsub float %228, %230
  %232 = fadd float %227, %231
  %233 = fadd float %229, %232
  %234 = fsub float %233, %229
  %235 = fsub float %232, %234
  %236 = fmul float %233, 0x3FA99999A0000000
  %237 = fneg float %236
  %238 = tail call float @llvm.fma.f32(float %233, float 0x3FA99999A0000000, float %237)
  %239 = tail call float @llvm.fma.f32(float %235, float 0x3FA99999A0000000, float %238)
  %240 = fadd float %236, %239
  %241 = fsub float %240, %236
  %242 = fsub float %239, %241
  %243 = tail call float @llvm.fabs.f32(float %236) #4
  %244 = fcmp oeq float %243, 0x7FF0000000000000
  %245 = select i1 %244, float %236, float %240
  %246 = tail call float @llvm.fabs.f32(float %245) #4
  %247 = fcmp oeq float %246, 0x7FF0000000000000
  %248 = select i1 %247, float 0.000000e+00, float %242
  %249 = fcmp oeq float %245, 0x40562E4300000000
  %250 = select i1 %249, float 0x3EE0000000000000, float 0.000000e+00
  %251 = fsub float %245, %250
  %252 = fadd float %250, %248
  %253 = fmul float %251, 0x3FF7154760000000
  %254 = tail call float @llvm.rint.f32(float %253)
  %255 = fcmp ogt float %251, 0x40562E4300000000
  %256 = fcmp olt float %251, 0xC059D1DA00000000
  %257 = fneg float %253
  %258 = tail call float @llvm.fma.f32(float %251, float 0x3FF7154760000000, float %257)
  %259 = tail call float @llvm.fma.f32(float %251, float 0x3E54AE0BE0000000, float %258)
  %260 = fsub float %253, %254
  %261 = fadd float %259, %260
  %262 = tail call float @llvm.exp2.f32(float %261)
  %263 = fptosi float %254 to i32
  %264 = tail call float @llvm.amdgcn.ldexp.f32(float %262, i32 %263)
  %265 = select i1 %256, float 0.000000e+00, float %264
  %266 = select i1 %255, float 0x7FF0000000000000, float %265
  %267 = tail call float @llvm.fma.f32(float %266, float %252, float %266)
  %268 = tail call float @llvm.fabs.f32(float %266) #4
  %269 = fcmp oeq float %268, 0x7FF0000000000000
  %270 = select i1 %269, float %266, float %267
  %271 = fcmp uge float %127, 0.000000e+00
  %272 = tail call float @llvm.fabs.f32(float %270)
  %273 = fcmp oeq float %128, 0x7FF0000000000000
  %274 = fcmp uno float %127, 0.000000e+00
  %275 = fcmp oeq float %127, 1.000000e+00
  %276 = fdiv contract float 1.000000e+00, %272
  %277 = select i1 %271, float %276, float 0x7FF8000000000000
  %278 = select i1 %273, float 0.000000e+00, float %277
  %279 = select i1 %274, float 0x7FF8000000000000, float %278
  %280 = select i1 %275, float 1.000000e+00, float %279
  %281 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(3)* bitcast ([0 x float] addrspace(3)* @s to %struct.blackHole addrspace(3)*), i32 %95, i32 2
  %282 = load float, float addrspace(3)* %281, align 4, !tbaa !20
  %283 = fmul contract float %282, %280
  %284 = fadd contract float %94, %283
  %285 = add nuw nsw i32 %95, 1
  %286 = icmp eq i32 %285, %8
  br i1 %286, label %87, label %93, !llvm.loop !21

287:                                              ; preds = %87, %67
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !14, i64 0}
!13 = !{!"_ZTS10spacePoint", !14, i64 0, !14, i64 4, !14, i64 8}
!14 = !{!"float", !8, i64 0}
!15 = !{!13, !14, i64 4}
!16 = !{!13, !14, i64 8}
!17 = !{!18, !14, i64 0}
!18 = !{!"_ZTS9blackHole", !14, i64 0, !14, i64 4, !14, i64 8}
!19 = !{!18, !14, i64 4}
!20 = !{!18, !14, i64 8}
!21 = distinct !{!21, !11}
