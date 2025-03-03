; ModuleID = '../data/hip_kernels/16057/38/main.cu'
source_filename = "../data/hip_kernels/16057/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }

@.str = private unnamed_addr addrspace(4) constant [8 x i8] c"ASM %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z13calculate_ASMPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #1 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %3, 0
  br i1 %14, label %15, label %52

15:                                               ; preds = %4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %3
  %25 = add nsw i32 %24, %13
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %28 = and i32 %3, 7
  %29 = icmp ult i32 %3, 8
  br i1 %29, label %32, label %30

30:                                               ; preds = %15
  %31 = and i32 %3, -8
  br label %58

32:                                               ; preds = %58, %15
  %33 = phi i32 [ 0, %15 ], [ %156, %58 ]
  %34 = icmp eq i32 %28, 0
  br i1 %34, label %52, label %35

35:                                               ; preds = %32, %35
  %36 = phi i32 [ %49, %35 ], [ %33, %32 ]
  %37 = phi i32 [ %50, %35 ], [ 0, %32 ]
  %38 = add nsw i32 %36, %24
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = mul nsw i32 %36, %3
  %43 = add nsw i32 %42, %13
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fmul contract float %41, %46
  %48 = atomicrmw fadd float addrspace(1)* %27, float %47 syncscope("agent-one-as") monotonic, align 4
  %49 = add nuw nsw i32 %36, 1
  %50 = add i32 %37, 1
  %51 = icmp eq i32 %50, %28
  br i1 %51, label %52, label %35, !llvm.loop !11

52:                                               ; preds = %32, %35, %4
  %53 = sext i32 %13 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = atomicrmw fadd float addrspace(1)* %1, float %55 syncscope("agent-one-as") monotonic, align 4
  %57 = icmp eq i32 %13, 0
  br i1 %57, label %159, label %622

58:                                               ; preds = %58, %30
  %59 = phi i32 [ 0, %30 ], [ %156, %58 ]
  %60 = phi i32 [ 0, %30 ], [ %157, %58 ]
  %61 = add nsw i32 %59, %24
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = mul nsw i32 %59, %3
  %66 = add nsw i32 %65, %13
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fmul contract float %64, %69
  %71 = atomicrmw fadd float addrspace(1)* %27, float %70 syncscope("agent-one-as") monotonic, align 4
  %72 = or i32 %59, 1
  %73 = add nsw i32 %72, %24
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = mul nsw i32 %72, %3
  %78 = add nsw i32 %77, %13
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fmul contract float %76, %81
  %83 = atomicrmw fadd float addrspace(1)* %27, float %82 syncscope("agent-one-as") monotonic, align 4
  %84 = or i32 %59, 2
  %85 = add nsw i32 %84, %24
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = mul nsw i32 %84, %3
  %90 = add nsw i32 %89, %13
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7
  %94 = fmul contract float %88, %93
  %95 = atomicrmw fadd float addrspace(1)* %27, float %94 syncscope("agent-one-as") monotonic, align 4
  %96 = or i32 %59, 3
  %97 = add nsw i32 %96, %24
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = mul nsw i32 %96, %3
  %102 = add nsw i32 %101, %13
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = fmul contract float %100, %105
  %107 = atomicrmw fadd float addrspace(1)* %27, float %106 syncscope("agent-one-as") monotonic, align 4
  %108 = or i32 %59, 4
  %109 = add nsw i32 %108, %24
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = mul nsw i32 %108, %3
  %114 = add nsw i32 %113, %13
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fmul contract float %112, %117
  %119 = atomicrmw fadd float addrspace(1)* %27, float %118 syncscope("agent-one-as") monotonic, align 4
  %120 = or i32 %59, 5
  %121 = add nsw i32 %120, %24
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = mul nsw i32 %120, %3
  %126 = add nsw i32 %125, %13
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = fmul contract float %124, %129
  %131 = atomicrmw fadd float addrspace(1)* %27, float %130 syncscope("agent-one-as") monotonic, align 4
  %132 = or i32 %59, 6
  %133 = add nsw i32 %132, %24
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = mul nsw i32 %132, %3
  %138 = add nsw i32 %137, %13
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = fmul contract float %136, %141
  %143 = atomicrmw fadd float addrspace(1)* %27, float %142 syncscope("agent-one-as") monotonic, align 4
  %144 = or i32 %59, 7
  %145 = add nsw i32 %144, %24
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %149 = mul nsw i32 %144, %3
  %150 = add nsw i32 %149, %13
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %154 = fmul contract float %148, %153
  %155 = atomicrmw fadd float addrspace(1)* %27, float %154 syncscope("agent-one-as") monotonic, align 4
  %156 = add nuw nsw i32 %59, 8
  %157 = add i32 %60, 8
  %158 = icmp eq i32 %157, %31
  br i1 %158, label %32, label %58, !llvm.loop !13

159:                                              ; preds = %52
  %160 = load float, float addrspace(1)* %1, align 4, !tbaa !7
  %161 = fpext float %160 to double
  %162 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 24
  %164 = bitcast i8 addrspace(4)* %163 to i64 addrspace(4)*
  %165 = load i64, i64 addrspace(4)* %164, align 8, !tbaa !15
  %166 = inttoptr i64 %165 to i8 addrspace(1)*
  %167 = addrspacecast i8 addrspace(1)* %166 to i8*
  %168 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %167, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %169 = extractelement <2 x i64> %168, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %170, label %174

170:                                              ; preds = %159
  %171 = and i64 %169, -225
  %172 = or i64 %171, 32
  %173 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %167, i64 noundef %172, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %615

174:                                              ; preds = %159
  %175 = and i64 %169, 2
  %176 = and i64 %169, -3
  %177 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %176, i64 0
  br label %178

178:                                              ; preds = %604, %174
  %179 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 7) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([8 x i8]* addrspacecast ([8 x i8] addrspace(4)* @.str to [8 x i8]*) to i64)), i64 1))), %174 ], [ %612, %604 ]
  %180 = phi i8 addrspace(4)* [ getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0), %174 ], [ %613, %604 ]
  %181 = phi <2 x i64> [ %177, %174 ], [ %611, %604 ]
  %182 = icmp ugt i64 %179, 56
  %183 = extractelement <2 x i64> %181, i64 0
  %184 = or i64 %183, %175
  %185 = insertelement <2 x i64> poison, i64 %184, i64 0
  %186 = select i1 %182, <2 x i64> %181, <2 x i64> %185
  %187 = tail call i64 @llvm.umin.i64(i64 %179, i64 56)
  %188 = trunc i64 %187 to i32
  %189 = extractelement <2 x i64> %186, i64 0
  %190 = icmp ugt i32 %188, 7
  br i1 %190, label %193, label %191

191:                                              ; preds = %178
  %192 = icmp eq i32 %188, 0
  br i1 %192, label %246, label %233

193:                                              ; preds = %178
  %194 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !19
  %195 = zext i8 %194 to i64
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 1
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !19
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 8
  %200 = or i64 %199, %195
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 2
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !19
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 16
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 3
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !19
  %208 = zext i8 %207 to i64
  %209 = shl nuw nsw i64 %208, 24
  %210 = or i64 %205, %209
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 4
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !19
  %213 = zext i8 %212 to i64
  %214 = shl nuw nsw i64 %213, 32
  %215 = or i64 %210, %214
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 5
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !19
  %218 = zext i8 %217 to i64
  %219 = shl nuw nsw i64 %218, 40
  %220 = or i64 %215, %219
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 6
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !19
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 48
  %225 = or i64 %220, %224
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 7
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !19
  %228 = zext i8 %227 to i64
  %229 = shl nuw i64 %228, 56
  %230 = or i64 %225, %229
  %231 = add nsw i32 %188, -8
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 8
  br label %246

233:                                              ; preds = %191, %233
  %234 = phi i32 [ %244, %233 ], [ 0, %191 ]
  %235 = phi i64 [ %243, %233 ], [ 0, %191 ]
  %236 = zext i32 %234 to i64
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 %236
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !19
  %239 = zext i8 %238 to i64
  %240 = shl i32 %234, 3
  %241 = zext i32 %240 to i64
  %242 = shl nuw i64 %239, %241
  %243 = or i64 %242, %235
  %244 = add nuw nsw i32 %234, 1
  %245 = icmp eq i32 %244, %188
  br i1 %245, label %246, label %233, !llvm.loop !20

246:                                              ; preds = %233, %193, %191
  %247 = phi i8 addrspace(4)* [ %232, %193 ], [ %180, %191 ], [ %180, %233 ]
  %248 = phi i32 [ %231, %193 ], [ 0, %191 ], [ 0, %233 ]
  %249 = phi i64 [ %230, %193 ], [ 0, %191 ], [ %243, %233 ]
  %250 = icmp ugt i32 %248, 7
  br i1 %250, label %253, label %251

251:                                              ; preds = %246
  %252 = icmp eq i32 %248, 0
  br i1 %252, label %306, label %293

253:                                              ; preds = %246
  %254 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !19
  %255 = zext i8 %254 to i64
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 1
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !19
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 8
  %260 = or i64 %259, %255
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 2
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !19
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 16
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 3
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !19
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 24
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 4
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !19
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 32
  %275 = or i64 %270, %274
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 5
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !19
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 40
  %280 = or i64 %275, %279
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 6
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !19
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 48
  %285 = or i64 %280, %284
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 7
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !19
  %288 = zext i8 %287 to i64
  %289 = shl nuw i64 %288, 56
  %290 = or i64 %285, %289
  %291 = add nsw i32 %248, -8
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 8
  br label %306

293:                                              ; preds = %251, %293
  %294 = phi i32 [ %304, %293 ], [ 0, %251 ]
  %295 = phi i64 [ %303, %293 ], [ 0, %251 ]
  %296 = zext i32 %294 to i64
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 %296
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !19
  %299 = zext i8 %298 to i64
  %300 = shl i32 %294, 3
  %301 = zext i32 %300 to i64
  %302 = shl nuw i64 %299, %301
  %303 = or i64 %302, %295
  %304 = add nuw nsw i32 %294, 1
  %305 = icmp eq i32 %304, %248
  br i1 %305, label %306, label %293

306:                                              ; preds = %293, %253, %251
  %307 = phi i8 addrspace(4)* [ %292, %253 ], [ %247, %251 ], [ %247, %293 ]
  %308 = phi i32 [ %291, %253 ], [ 0, %251 ], [ 0, %293 ]
  %309 = phi i64 [ %290, %253 ], [ 0, %251 ], [ %303, %293 ]
  %310 = icmp ugt i32 %308, 7
  br i1 %310, label %313, label %311

311:                                              ; preds = %306
  %312 = icmp eq i32 %308, 0
  br i1 %312, label %366, label %353

313:                                              ; preds = %306
  %314 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !19
  %315 = zext i8 %314 to i64
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 1
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !19
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 8
  %320 = or i64 %319, %315
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 2
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !19
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 16
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 3
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !19
  %328 = zext i8 %327 to i64
  %329 = shl nuw nsw i64 %328, 24
  %330 = or i64 %325, %329
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 4
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !19
  %333 = zext i8 %332 to i64
  %334 = shl nuw nsw i64 %333, 32
  %335 = or i64 %330, %334
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 5
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !19
  %338 = zext i8 %337 to i64
  %339 = shl nuw nsw i64 %338, 40
  %340 = or i64 %335, %339
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 6
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !19
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 48
  %345 = or i64 %340, %344
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 7
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !19
  %348 = zext i8 %347 to i64
  %349 = shl nuw i64 %348, 56
  %350 = or i64 %345, %349
  %351 = add nsw i32 %308, -8
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 8
  br label %366

353:                                              ; preds = %311, %353
  %354 = phi i32 [ %364, %353 ], [ 0, %311 ]
  %355 = phi i64 [ %363, %353 ], [ 0, %311 ]
  %356 = zext i32 %354 to i64
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 %356
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !19
  %359 = zext i8 %358 to i64
  %360 = shl i32 %354, 3
  %361 = zext i32 %360 to i64
  %362 = shl nuw i64 %359, %361
  %363 = or i64 %362, %355
  %364 = add nuw nsw i32 %354, 1
  %365 = icmp eq i32 %364, %308
  br i1 %365, label %366, label %353

366:                                              ; preds = %353, %313, %311
  %367 = phi i8 addrspace(4)* [ %352, %313 ], [ %307, %311 ], [ %307, %353 ]
  %368 = phi i32 [ %351, %313 ], [ 0, %311 ], [ 0, %353 ]
  %369 = phi i64 [ %350, %313 ], [ 0, %311 ], [ %363, %353 ]
  %370 = icmp ugt i32 %368, 7
  br i1 %370, label %373, label %371

371:                                              ; preds = %366
  %372 = icmp eq i32 %368, 0
  br i1 %372, label %426, label %413

373:                                              ; preds = %366
  %374 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !19
  %375 = zext i8 %374 to i64
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 1
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !19
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 8
  %380 = or i64 %379, %375
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 2
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !19
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 16
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 3
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !19
  %388 = zext i8 %387 to i64
  %389 = shl nuw nsw i64 %388, 24
  %390 = or i64 %385, %389
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 4
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !19
  %393 = zext i8 %392 to i64
  %394 = shl nuw nsw i64 %393, 32
  %395 = or i64 %390, %394
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 5
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !19
  %398 = zext i8 %397 to i64
  %399 = shl nuw nsw i64 %398, 40
  %400 = or i64 %395, %399
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 6
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !19
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 48
  %405 = or i64 %400, %404
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 7
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !19
  %408 = zext i8 %407 to i64
  %409 = shl nuw i64 %408, 56
  %410 = or i64 %405, %409
  %411 = add nsw i32 %368, -8
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 8
  br label %426

413:                                              ; preds = %371, %413
  %414 = phi i32 [ %424, %413 ], [ 0, %371 ]
  %415 = phi i64 [ %423, %413 ], [ 0, %371 ]
  %416 = zext i32 %414 to i64
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 %416
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !19
  %419 = zext i8 %418 to i64
  %420 = shl i32 %414, 3
  %421 = zext i32 %420 to i64
  %422 = shl nuw i64 %419, %421
  %423 = or i64 %422, %415
  %424 = add nuw nsw i32 %414, 1
  %425 = icmp eq i32 %424, %368
  br i1 %425, label %426, label %413

426:                                              ; preds = %413, %373, %371
  %427 = phi i8 addrspace(4)* [ %412, %373 ], [ %367, %371 ], [ %367, %413 ]
  %428 = phi i32 [ %411, %373 ], [ 0, %371 ], [ 0, %413 ]
  %429 = phi i64 [ %410, %373 ], [ 0, %371 ], [ %423, %413 ]
  %430 = icmp ugt i32 %428, 7
  br i1 %430, label %433, label %431

431:                                              ; preds = %426
  %432 = icmp eq i32 %428, 0
  br i1 %432, label %486, label %473

433:                                              ; preds = %426
  %434 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !19
  %435 = zext i8 %434 to i64
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 1
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !19
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 8
  %440 = or i64 %439, %435
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 2
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !19
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 16
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 3
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !19
  %448 = zext i8 %447 to i64
  %449 = shl nuw nsw i64 %448, 24
  %450 = or i64 %445, %449
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 4
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !19
  %453 = zext i8 %452 to i64
  %454 = shl nuw nsw i64 %453, 32
  %455 = or i64 %450, %454
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 5
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !19
  %458 = zext i8 %457 to i64
  %459 = shl nuw nsw i64 %458, 40
  %460 = or i64 %455, %459
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 6
  %462 = load i8, i8 addrspace(4)* %461, align 1, !tbaa !19
  %463 = zext i8 %462 to i64
  %464 = shl nuw nsw i64 %463, 48
  %465 = or i64 %460, %464
  %466 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 7
  %467 = load i8, i8 addrspace(4)* %466, align 1, !tbaa !19
  %468 = zext i8 %467 to i64
  %469 = shl nuw i64 %468, 56
  %470 = or i64 %465, %469
  %471 = add nsw i32 %428, -8
  %472 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 8
  br label %486

473:                                              ; preds = %431, %473
  %474 = phi i32 [ %484, %473 ], [ 0, %431 ]
  %475 = phi i64 [ %483, %473 ], [ 0, %431 ]
  %476 = zext i32 %474 to i64
  %477 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 %476
  %478 = load i8, i8 addrspace(4)* %477, align 1, !tbaa !19
  %479 = zext i8 %478 to i64
  %480 = shl i32 %474, 3
  %481 = zext i32 %480 to i64
  %482 = shl nuw i64 %479, %481
  %483 = or i64 %482, %475
  %484 = add nuw nsw i32 %474, 1
  %485 = icmp eq i32 %484, %428
  br i1 %485, label %486, label %473

486:                                              ; preds = %473, %433, %431
  %487 = phi i8 addrspace(4)* [ %472, %433 ], [ %427, %431 ], [ %427, %473 ]
  %488 = phi i32 [ %471, %433 ], [ 0, %431 ], [ 0, %473 ]
  %489 = phi i64 [ %470, %433 ], [ 0, %431 ], [ %483, %473 ]
  %490 = icmp ugt i32 %488, 7
  br i1 %490, label %493, label %491

491:                                              ; preds = %486
  %492 = icmp eq i32 %488, 0
  br i1 %492, label %546, label %533

493:                                              ; preds = %486
  %494 = load i8, i8 addrspace(4)* %487, align 1, !tbaa !19
  %495 = zext i8 %494 to i64
  %496 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 1
  %497 = load i8, i8 addrspace(4)* %496, align 1, !tbaa !19
  %498 = zext i8 %497 to i64
  %499 = shl nuw nsw i64 %498, 8
  %500 = or i64 %499, %495
  %501 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 2
  %502 = load i8, i8 addrspace(4)* %501, align 1, !tbaa !19
  %503 = zext i8 %502 to i64
  %504 = shl nuw nsw i64 %503, 16
  %505 = or i64 %500, %504
  %506 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 3
  %507 = load i8, i8 addrspace(4)* %506, align 1, !tbaa !19
  %508 = zext i8 %507 to i64
  %509 = shl nuw nsw i64 %508, 24
  %510 = or i64 %505, %509
  %511 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 4
  %512 = load i8, i8 addrspace(4)* %511, align 1, !tbaa !19
  %513 = zext i8 %512 to i64
  %514 = shl nuw nsw i64 %513, 32
  %515 = or i64 %510, %514
  %516 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 5
  %517 = load i8, i8 addrspace(4)* %516, align 1, !tbaa !19
  %518 = zext i8 %517 to i64
  %519 = shl nuw nsw i64 %518, 40
  %520 = or i64 %515, %519
  %521 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 6
  %522 = load i8, i8 addrspace(4)* %521, align 1, !tbaa !19
  %523 = zext i8 %522 to i64
  %524 = shl nuw nsw i64 %523, 48
  %525 = or i64 %520, %524
  %526 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 7
  %527 = load i8, i8 addrspace(4)* %526, align 1, !tbaa !19
  %528 = zext i8 %527 to i64
  %529 = shl nuw i64 %528, 56
  %530 = or i64 %525, %529
  %531 = add nsw i32 %488, -8
  %532 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 8
  br label %546

533:                                              ; preds = %491, %533
  %534 = phi i32 [ %544, %533 ], [ 0, %491 ]
  %535 = phi i64 [ %543, %533 ], [ 0, %491 ]
  %536 = zext i32 %534 to i64
  %537 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 %536
  %538 = load i8, i8 addrspace(4)* %537, align 1, !tbaa !19
  %539 = zext i8 %538 to i64
  %540 = shl i32 %534, 3
  %541 = zext i32 %540 to i64
  %542 = shl nuw i64 %539, %541
  %543 = or i64 %542, %535
  %544 = add nuw nsw i32 %534, 1
  %545 = icmp eq i32 %544, %488
  br i1 %545, label %546, label %533

546:                                              ; preds = %533, %493, %491
  %547 = phi i8 addrspace(4)* [ %532, %493 ], [ %487, %491 ], [ %487, %533 ]
  %548 = phi i32 [ %531, %493 ], [ 0, %491 ], [ 0, %533 ]
  %549 = phi i64 [ %530, %493 ], [ 0, %491 ], [ %543, %533 ]
  %550 = icmp ugt i32 %548, 7
  br i1 %550, label %553, label %551

551:                                              ; preds = %546
  %552 = icmp eq i32 %548, 0
  br i1 %552, label %604, label %591

553:                                              ; preds = %546
  %554 = load i8, i8 addrspace(4)* %547, align 1, !tbaa !19
  %555 = zext i8 %554 to i64
  %556 = getelementptr inbounds i8, i8 addrspace(4)* %547, i64 1
  %557 = load i8, i8 addrspace(4)* %556, align 1, !tbaa !19
  %558 = zext i8 %557 to i64
  %559 = shl nuw nsw i64 %558, 8
  %560 = or i64 %559, %555
  %561 = getelementptr inbounds i8, i8 addrspace(4)* %547, i64 2
  %562 = load i8, i8 addrspace(4)* %561, align 1, !tbaa !19
  %563 = zext i8 %562 to i64
  %564 = shl nuw nsw i64 %563, 16
  %565 = or i64 %560, %564
  %566 = getelementptr inbounds i8, i8 addrspace(4)* %547, i64 3
  %567 = load i8, i8 addrspace(4)* %566, align 1, !tbaa !19
  %568 = zext i8 %567 to i64
  %569 = shl nuw nsw i64 %568, 24
  %570 = or i64 %565, %569
  %571 = getelementptr inbounds i8, i8 addrspace(4)* %547, i64 4
  %572 = load i8, i8 addrspace(4)* %571, align 1, !tbaa !19
  %573 = zext i8 %572 to i64
  %574 = shl nuw nsw i64 %573, 32
  %575 = or i64 %570, %574
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %547, i64 5
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !19
  %578 = zext i8 %577 to i64
  %579 = shl nuw nsw i64 %578, 40
  %580 = or i64 %575, %579
  %581 = getelementptr inbounds i8, i8 addrspace(4)* %547, i64 6
  %582 = load i8, i8 addrspace(4)* %581, align 1, !tbaa !19
  %583 = zext i8 %582 to i64
  %584 = shl nuw nsw i64 %583, 48
  %585 = or i64 %580, %584
  %586 = getelementptr inbounds i8, i8 addrspace(4)* %547, i64 7
  %587 = load i8, i8 addrspace(4)* %586, align 1, !tbaa !19
  %588 = zext i8 %587 to i64
  %589 = shl nuw i64 %588, 56
  %590 = or i64 %585, %589
  br label %604

591:                                              ; preds = %551, %591
  %592 = phi i32 [ %602, %591 ], [ 0, %551 ]
  %593 = phi i64 [ %601, %591 ], [ 0, %551 ]
  %594 = zext i32 %592 to i64
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %547, i64 %594
  %596 = load i8, i8 addrspace(4)* %595, align 1, !tbaa !19
  %597 = zext i8 %596 to i64
  %598 = shl i32 %592, 3
  %599 = zext i32 %598 to i64
  %600 = shl nuw i64 %597, %599
  %601 = or i64 %600, %593
  %602 = add nuw nsw i32 %592, 1
  %603 = icmp eq i32 %602, %548
  br i1 %603, label %604, label %591

604:                                              ; preds = %591, %553, %551
  %605 = phi i64 [ %590, %553 ], [ 0, %551 ], [ %601, %591 ]
  %606 = shl nuw nsw i64 %187, 2
  %607 = add nuw nsw i64 %606, 28
  %608 = and i64 %607, 480
  %609 = and i64 %189, -225
  %610 = or i64 %609, %608
  %611 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %167, i64 noundef %610, i64 noundef %249, i64 noundef %309, i64 noundef %369, i64 noundef %429, i64 noundef %489, i64 noundef %549, i64 noundef %605) #10
  %612 = sub i64 %179, %187
  %613 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 %187
  %614 = icmp eq i64 %612, 0
  br i1 %614, label %615, label %178

615:                                              ; preds = %604, %170
  %616 = phi <2 x i64> [ %173, %170 ], [ %611, %604 ]
  %617 = extractelement <2 x i64> %616, i64 0
  %618 = bitcast double %161 to i64
  %619 = and i64 %617, -227
  %620 = or i64 %619, 34
  %621 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %167, i64 noundef %620, i64 noundef %618, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %622

622:                                              ; preds = %615, %52
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #3 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !21
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !23
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !15
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !15
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !15
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !15
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !15
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !15
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !15
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !15
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !23
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !25
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !23
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !23
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !21
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !26
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !29
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !26
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !29
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !15
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !26
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !29
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !30
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !29
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !23
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !15
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !15
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !15
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !15
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !15
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !15
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !15
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !15
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %110 = call i64 @llvm.read_register.i64(metadata !31) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !32
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !34
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !35
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !15
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !15
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !15
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !15
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !15
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !15
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !15
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !15
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !26
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !29
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !36
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !36
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !37
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !39
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !15
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !15
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !19
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !29
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !26
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !36
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !36
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !19
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #6
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #6
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #6
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #6
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #6
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #6
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #6
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #4

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #5

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #6

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #7

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #4 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #5 = { mustprogress nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nofree nounwind readonly }
attributes #8 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #9 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { convergent nounwind }
attributes #11 = { convergent }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !{!17, !17, i64 0}
!20 = distinct !{!20, !12}
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !17, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !17, i64 0}
!25 = !{i64 2662}
!26 = !{!27, !22, i64 0}
!27 = !{!"", !22, i64 0, !22, i64 8, !28, i64 16, !16, i64 24, !16, i64 32, !16, i64 40}
!28 = !{!"hsa_signal_s", !16, i64 0}
!29 = !{!27, !16, i64 40}
!30 = !{!27, !22, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !24, i64 16}
!33 = !{!"", !16, i64 0, !16, i64 8, !24, i64 16, !24, i64 20}
!34 = !{!33, !16, i64 8}
!35 = !{!33, !24, i64 20}
!36 = !{!33, !16, i64 0}
!37 = !{!38, !16, i64 16}
!38 = !{!"amd_signal_s", !16, i64 0, !17, i64 8, !16, i64 16, !24, i64 24, !24, i64 28, !16, i64 32, !16, i64 40, !17, i64 48, !17, i64 56}
!39 = !{!38, !24, i64 24}
