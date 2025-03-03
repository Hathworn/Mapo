; ModuleID = '../data/hip_kernels/14301/1/main.cu'
source_filename = "../data/hip_kernels/14301/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__const._Z9kernelKNNPKfS0_PiPfiiiii.kdistances = private unnamed_addr addrspace(4) constant [10 x float] [float 0x7FF0000000000000, float 0x7FF0000000000000, float 0x7FF0000000000000, float 0x7FF0000000000000, float 0x7FF0000000000000, float 0x7FF0000000000000, float 0x7FF0000000000000, float 0x7FF0000000000000, float 0x7FF0000000000000, float 0x7FF0000000000000], align 16

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9kernelKNNPKfS0_PiPfiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #1 {
  %10 = alloca [10 x i32], align 16, addrspace(5)
  %11 = alloca [10 x float], align 16, addrspace(5)
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %17
  %20 = add i32 %19, %12
  %21 = freeze i32 %20
  %22 = bitcast [10 x i32] addrspace(5)* %10 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 40, i8 addrspace(5)* %22) #6
  call void @llvm.memset.p5i8.i64(i8 addrspace(5)* noundef align 16 dereferenceable(40) %22, i8 0, i64 40, i1 false)
  %23 = bitcast [10 x float] addrspace(5)* %11 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 40, i8 addrspace(5)* %23) #6
  call void @llvm.memcpy.p5i8.p4i8.i64(i8 addrspace(5)* noundef align 16 dereferenceable(40) %23, i8 addrspace(4)* noundef align 16 dereferenceable(40) bitcast ([10 x float] addrspace(4)* @__const._Z9kernelKNNPKfS0_PiPfiiiii.kdistances to i8 addrspace(4)*), i64 40, i1 false)
  %24 = icmp ult i32 %21, %6
  br i1 %24, label %25, label %325

25:                                               ; preds = %9
  %26 = urem i32 %21, %5
  %27 = sub nuw i32 %21, %26
  %28 = icmp sgt i32 %5, 0
  br i1 %28, label %29, label %42

29:                                               ; preds = %25
  %30 = sub nsw i32 %26, %8
  %31 = add nsw i32 %26, %8
  %32 = sext i32 %21 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = icmp sgt i32 %4, 0
  %35 = add nsw i32 %7, -1
  %36 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %7
  %37 = getelementptr inbounds float, float addrspace(5)* %36, i32 -1
  %38 = and i32 %4, 7
  %39 = icmp ult i32 %4, 8
  %40 = and i32 %4, -8
  %41 = icmp eq i32 %38, 0
  br label %49

42:                                               ; preds = %218, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp sgt i32 %7, 0
  br i1 %43, label %44, label %325

44:                                               ; preds = %42
  %45 = and i32 %7, 7
  %46 = icmp ult i32 %7, 8
  br i1 %46, label %307, label %47

47:                                               ; preds = %44
  %48 = and i32 %7, -8
  br label %222

49:                                               ; preds = %29, %218
  %50 = phi float [ 0x7FF0000000000000, %29 ], [ %219, %218 ]
  %51 = phi i32 [ 0, %29 ], [ %220, %218 ]
  %52 = icmp slt i32 %51, %30
  %53 = icmp sgt i32 %51, %31
  %54 = select i1 %52, i1 true, i1 %53
  br i1 %54, label %55, label %218

55:                                               ; preds = %49
  %56 = add i32 %27, %51
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  br i1 %34, label %59, label %193

59:                                               ; preds = %55
  br i1 %39, label %170, label %60

60:                                               ; preds = %59, %60
  %61 = phi i32 [ %167, %60 ], [ 0, %59 ]
  %62 = phi float [ %166, %60 ], [ 0.000000e+00, %59 ]
  %63 = phi i32 [ %168, %60 ], [ 0, %59 ]
  %64 = mul nsw i32 %61, %6
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %33, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = getelementptr inbounds float, float addrspace(1)* %58, i64 %65
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = fsub contract float %69, %67
  %71 = fcmp contract olt float %70, 0.000000e+00
  %72 = fneg contract float %70
  %73 = select contract i1 %71, float %72, float %70
  %74 = fcmp contract olt float %62, %73
  %75 = select contract i1 %74, float %73, float %62
  %76 = or i32 %61, 1
  %77 = mul nsw i32 %76, %6
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %33, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !6
  %81 = getelementptr inbounds float, float addrspace(1)* %58, i64 %78
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = fsub contract float %82, %80
  %84 = fcmp contract olt float %83, 0.000000e+00
  %85 = fneg contract float %83
  %86 = select contract i1 %84, float %85, float %83
  %87 = fcmp contract olt float %75, %86
  %88 = select contract i1 %87, float %86, float %75
  %89 = or i32 %61, 2
  %90 = mul nsw i32 %89, %6
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %33, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = getelementptr inbounds float, float addrspace(1)* %58, i64 %91
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !6
  %96 = fsub contract float %95, %93
  %97 = fcmp contract olt float %96, 0.000000e+00
  %98 = fneg contract float %96
  %99 = select contract i1 %97, float %98, float %96
  %100 = fcmp contract olt float %88, %99
  %101 = select contract i1 %100, float %99, float %88
  %102 = or i32 %61, 3
  %103 = mul nsw i32 %102, %6
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %33, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = getelementptr inbounds float, float addrspace(1)* %58, i64 %104
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !6
  %109 = fsub contract float %108, %106
  %110 = fcmp contract olt float %109, 0.000000e+00
  %111 = fneg contract float %109
  %112 = select contract i1 %110, float %111, float %109
  %113 = fcmp contract olt float %101, %112
  %114 = select contract i1 %113, float %112, float %101
  %115 = or i32 %61, 4
  %116 = mul nsw i32 %115, %6
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %33, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !6
  %120 = getelementptr inbounds float, float addrspace(1)* %58, i64 %117
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fsub contract float %121, %119
  %123 = fcmp contract olt float %122, 0.000000e+00
  %124 = fneg contract float %122
  %125 = select contract i1 %123, float %124, float %122
  %126 = fcmp contract olt float %114, %125
  %127 = select contract i1 %126, float %125, float %114
  %128 = or i32 %61, 5
  %129 = mul nsw i32 %128, %6
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %33, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !6
  %133 = getelementptr inbounds float, float addrspace(1)* %58, i64 %130
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !6
  %135 = fsub contract float %134, %132
  %136 = fcmp contract olt float %135, 0.000000e+00
  %137 = fneg contract float %135
  %138 = select contract i1 %136, float %137, float %135
  %139 = fcmp contract olt float %127, %138
  %140 = select contract i1 %139, float %138, float %127
  %141 = or i32 %61, 6
  %142 = mul nsw i32 %141, %6
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %33, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !6
  %146 = getelementptr inbounds float, float addrspace(1)* %58, i64 %143
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !6
  %148 = fsub contract float %147, %145
  %149 = fcmp contract olt float %148, 0.000000e+00
  %150 = fneg contract float %148
  %151 = select contract i1 %149, float %150, float %148
  %152 = fcmp contract olt float %140, %151
  %153 = select contract i1 %152, float %151, float %140
  %154 = or i32 %61, 7
  %155 = mul nsw i32 %154, %6
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %33, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !6
  %159 = getelementptr inbounds float, float addrspace(1)* %58, i64 %156
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !6
  %161 = fsub contract float %160, %158
  %162 = fcmp contract olt float %161, 0.000000e+00
  %163 = fneg contract float %161
  %164 = select contract i1 %162, float %163, float %161
  %165 = fcmp contract olt float %153, %164
  %166 = select contract i1 %165, float %164, float %153
  %167 = add nuw nsw i32 %61, 8
  %168 = add i32 %63, 8
  %169 = icmp eq i32 %168, %40
  br i1 %169, label %170, label %60, !llvm.loop !11

170:                                              ; preds = %60, %59
  %171 = phi float [ undef, %59 ], [ %166, %60 ]
  %172 = phi i32 [ 0, %59 ], [ %167, %60 ]
  %173 = phi float [ 0.000000e+00, %59 ], [ %166, %60 ]
  br i1 %41, label %193, label %174

174:                                              ; preds = %170, %174
  %175 = phi i32 [ %190, %174 ], [ %172, %170 ]
  %176 = phi float [ %189, %174 ], [ %173, %170 ]
  %177 = phi i32 [ %191, %174 ], [ 0, %170 ]
  %178 = mul nsw i32 %175, %6
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %33, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7, !amdgpu.noclobber !6
  %182 = getelementptr inbounds float, float addrspace(1)* %58, i64 %179
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !7, !amdgpu.noclobber !6
  %184 = fsub contract float %183, %181
  %185 = fcmp contract olt float %184, 0.000000e+00
  %186 = fneg contract float %184
  %187 = select contract i1 %185, float %186, float %184
  %188 = fcmp contract olt float %176, %187
  %189 = select contract i1 %188, float %187, float %176
  %190 = add nuw nsw i32 %175, 1
  %191 = add i32 %177, 1
  %192 = icmp eq i32 %191, %38
  br i1 %192, label %193, label %174, !llvm.loop !13

193:                                              ; preds = %170, %174, %55
  %194 = phi float [ 0.000000e+00, %55 ], [ %171, %170 ], [ %189, %174 ]
  %195 = fcmp contract ugt float %194, %50
  br i1 %195, label %218, label %196

196:                                              ; preds = %193, %196
  %197 = phi i32 [ %203, %196 ], [ 0, %193 ]
  %198 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %197
  %199 = load float, float addrspace(5)* %198, align 4, !tbaa !7
  %200 = fcmp contract olt float %199, %194
  %201 = icmp slt i32 %197, %35
  %202 = select i1 %200, i1 %201, i1 false
  %203 = add nuw nsw i32 %197, 1
  br i1 %202, label %196, label %204, !llvm.loop !15

204:                                              ; preds = %196
  br i1 %201, label %205, label %215

205:                                              ; preds = %204, %205
  %206 = phi i32 [ %213, %205 ], [ %35, %204 ]
  %207 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %206
  %208 = getelementptr inbounds float, float addrspace(5)* %207, i32 -1
  %209 = load float, float addrspace(5)* %208, align 4, !tbaa !7
  store float %209, float addrspace(5)* %207, align 4, !tbaa !7
  %210 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %206
  %211 = getelementptr inbounds i32, i32 addrspace(5)* %210, i32 -1
  %212 = load i32, i32 addrspace(5)* %211, align 4, !tbaa !16
  store i32 %212, i32 addrspace(5)* %210, align 4, !tbaa !16
  %213 = add nsw i32 %206, -1
  %214 = icmp sgt i32 %213, %197
  br i1 %214, label %205, label %215, !llvm.loop !18

215:                                              ; preds = %205, %204
  store float %194, float addrspace(5)* %198, align 4, !tbaa !7
  %216 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %197
  store i32 %51, i32 addrspace(5)* %216, align 4, !tbaa !16
  %217 = load float, float addrspace(5)* %37, align 4, !tbaa !7
  br label %218

218:                                              ; preds = %193, %215, %49
  %219 = phi float [ %50, %49 ], [ %217, %215 ], [ %50, %193 ]
  %220 = add nuw nsw i32 %51, 1
  %221 = icmp eq i32 %220, %5
  br i1 %221, label %42, label %49, !llvm.loop !19

222:                                              ; preds = %222, %47
  %223 = phi i32 [ 0, %47 ], [ %304, %222 ]
  %224 = phi i32 [ 0, %47 ], [ %305, %222 ]
  %225 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %223
  %226 = load i32, i32 addrspace(5)* %225, align 16, !tbaa !16
  %227 = mul nsw i32 %223, %6
  %228 = add i32 %227, %21
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %229
  store i32 %226, i32 addrspace(1)* %230, align 4, !tbaa !16
  %231 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %223
  %232 = load float, float addrspace(5)* %231, align 16, !tbaa !7
  %233 = getelementptr inbounds float, float addrspace(1)* %3, i64 %229
  store float %232, float addrspace(1)* %233, align 4, !tbaa !7
  %234 = or i32 %223, 1
  %235 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %234
  %236 = load i32, i32 addrspace(5)* %235, align 4, !tbaa !16
  %237 = mul nsw i32 %234, %6
  %238 = add i32 %237, %21
  %239 = zext i32 %238 to i64
  %240 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %239
  store i32 %236, i32 addrspace(1)* %240, align 4, !tbaa !16
  %241 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %234
  %242 = load float, float addrspace(5)* %241, align 4, !tbaa !7
  %243 = getelementptr inbounds float, float addrspace(1)* %3, i64 %239
  store float %242, float addrspace(1)* %243, align 4, !tbaa !7
  %244 = or i32 %223, 2
  %245 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %244
  %246 = load i32, i32 addrspace(5)* %245, align 8, !tbaa !16
  %247 = mul nsw i32 %244, %6
  %248 = add i32 %247, %21
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %249
  store i32 %246, i32 addrspace(1)* %250, align 4, !tbaa !16
  %251 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %244
  %252 = load float, float addrspace(5)* %251, align 8, !tbaa !7
  %253 = getelementptr inbounds float, float addrspace(1)* %3, i64 %249
  store float %252, float addrspace(1)* %253, align 4, !tbaa !7
  %254 = or i32 %223, 3
  %255 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %254
  %256 = load i32, i32 addrspace(5)* %255, align 4, !tbaa !16
  %257 = mul nsw i32 %254, %6
  %258 = add i32 %257, %21
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %259
  store i32 %256, i32 addrspace(1)* %260, align 4, !tbaa !16
  %261 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %254
  %262 = load float, float addrspace(5)* %261, align 4, !tbaa !7
  %263 = getelementptr inbounds float, float addrspace(1)* %3, i64 %259
  store float %262, float addrspace(1)* %263, align 4, !tbaa !7
  %264 = or i32 %223, 4
  %265 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %264
  %266 = load i32, i32 addrspace(5)* %265, align 16, !tbaa !16
  %267 = mul nsw i32 %264, %6
  %268 = add i32 %267, %21
  %269 = zext i32 %268 to i64
  %270 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %269
  store i32 %266, i32 addrspace(1)* %270, align 4, !tbaa !16
  %271 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %264
  %272 = load float, float addrspace(5)* %271, align 16, !tbaa !7
  %273 = getelementptr inbounds float, float addrspace(1)* %3, i64 %269
  store float %272, float addrspace(1)* %273, align 4, !tbaa !7
  %274 = or i32 %223, 5
  %275 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %274
  %276 = load i32, i32 addrspace(5)* %275, align 4, !tbaa !16
  %277 = mul nsw i32 %274, %6
  %278 = add i32 %277, %21
  %279 = zext i32 %278 to i64
  %280 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %279
  store i32 %276, i32 addrspace(1)* %280, align 4, !tbaa !16
  %281 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %274
  %282 = load float, float addrspace(5)* %281, align 4, !tbaa !7
  %283 = getelementptr inbounds float, float addrspace(1)* %3, i64 %279
  store float %282, float addrspace(1)* %283, align 4, !tbaa !7
  %284 = or i32 %223, 6
  %285 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %284
  %286 = load i32, i32 addrspace(5)* %285, align 8, !tbaa !16
  %287 = mul nsw i32 %284, %6
  %288 = add i32 %287, %21
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %289
  store i32 %286, i32 addrspace(1)* %290, align 4, !tbaa !16
  %291 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %284
  %292 = load float, float addrspace(5)* %291, align 8, !tbaa !7
  %293 = getelementptr inbounds float, float addrspace(1)* %3, i64 %289
  store float %292, float addrspace(1)* %293, align 4, !tbaa !7
  %294 = or i32 %223, 7
  %295 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %294
  %296 = load i32, i32 addrspace(5)* %295, align 4, !tbaa !16
  %297 = mul nsw i32 %294, %6
  %298 = add i32 %297, %21
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %299
  store i32 %296, i32 addrspace(1)* %300, align 4, !tbaa !16
  %301 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %294
  %302 = load float, float addrspace(5)* %301, align 4, !tbaa !7
  %303 = getelementptr inbounds float, float addrspace(1)* %3, i64 %299
  store float %302, float addrspace(1)* %303, align 4, !tbaa !7
  %304 = add nuw nsw i32 %223, 8
  %305 = add i32 %224, 8
  %306 = icmp eq i32 %305, %48
  br i1 %306, label %307, label %222, !llvm.loop !20

307:                                              ; preds = %222, %44
  %308 = phi i32 [ 0, %44 ], [ %304, %222 ]
  %309 = icmp eq i32 %45, 0
  br i1 %309, label %325, label %310

310:                                              ; preds = %307, %310
  %311 = phi i32 [ %322, %310 ], [ %308, %307 ]
  %312 = phi i32 [ %323, %310 ], [ 0, %307 ]
  %313 = getelementptr inbounds [10 x i32], [10 x i32] addrspace(5)* %10, i32 0, i32 %311
  %314 = load i32, i32 addrspace(5)* %313, align 4, !tbaa !16
  %315 = mul nsw i32 %311, %6
  %316 = add i32 %315, %21
  %317 = zext i32 %316 to i64
  %318 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %317
  store i32 %314, i32 addrspace(1)* %318, align 4, !tbaa !16
  %319 = getelementptr inbounds [10 x float], [10 x float] addrspace(5)* %11, i32 0, i32 %311
  %320 = load float, float addrspace(5)* %319, align 4, !tbaa !7
  %321 = getelementptr inbounds float, float addrspace(1)* %3, i64 %317
  store float %320, float addrspace(1)* %321, align 4, !tbaa !7
  %322 = add nuw nsw i32 %311, 1
  %323 = add i32 %312, 1
  %324 = icmp eq i32 %323, %45
  br i1 %324, label %325, label %310, !llvm.loop !21

325:                                              ; preds = %307, %310, %42, %9
  call void @llvm.lifetime.end.p5i8(i64 40, i8 addrspace(5)* %23) #6
  call void @llvm.lifetime.end.p5i8(i64 40, i8 addrspace(5)* %22) #6
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p5i8.p4i8.i64(i8 addrspace(5)* noalias nocapture writeonly, i8 addrspace(4)* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p5i8.i64(i8 addrspace(5)* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn }
attributes #5 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !9, i64 0}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !14}
