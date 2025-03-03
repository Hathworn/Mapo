; ModuleID = '../data/hip_kernels/10806/2/main.cu'
source_filename = "../data/hip_kernels/10806/2/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [51 x i8] c"\0A Block[%d][%d] : Thread[%d][%d] : Product = %.2f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9MatrixMulPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #1 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp sgt i32 %3, 0
  %23 = mul nsw i32 %13, %3
  br i1 %22, label %24, label %52

24:                                               ; preds = %4
  %25 = and i32 %3, 7
  %26 = icmp ult i32 %3, 8
  br i1 %26, label %29, label %27

27:                                               ; preds = %24
  %28 = and i32 %3, -8
  br label %65

29:                                               ; preds = %65, %24
  %30 = phi float [ undef, %24 ], [ %163, %65 ]
  %31 = phi i32 [ 0, %24 ], [ %164, %65 ]
  %32 = phi float [ 0.000000e+00, %24 ], [ %163, %65 ]
  %33 = icmp eq i32 %25, 0
  br i1 %33, label %52, label %34

34:                                               ; preds = %29, %34
  %35 = phi i32 [ %49, %34 ], [ %31, %29 ]
  %36 = phi float [ %48, %34 ], [ %32, %29 ]
  %37 = phi i32 [ %50, %34 ], [ 0, %29 ]
  %38 = add nsw i32 %35, %23
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = mul nsw i32 %35, %3
  %43 = add nsw i32 %42, %21
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fmul contract float %41, %46
  %48 = fadd contract float %36, %47
  %49 = add nuw nsw i32 %35, 1
  %50 = add i32 %37, 1
  %51 = icmp eq i32 %50, %25
  br i1 %51, label %52, label %34, !llvm.loop !11

52:                                               ; preds = %29, %34, %4
  %53 = phi float [ 0.000000e+00, %4 ], [ %30, %29 ], [ %48, %34 ]
  %54 = add nsw i32 %23, %21
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  store float %53, float addrspace(1)* %56, align 4, !tbaa !7
  %57 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 24
  %59 = bitcast i8 addrspace(4)* %58 to i64 addrspace(4)*
  %60 = load i64, i64 addrspace(4)* %59, align 8, !tbaa !13
  %61 = inttoptr i64 %60 to i8 addrspace(1)*
  %62 = addrspacecast i8 addrspace(1)* %61 to i8*
  %63 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %64 = extractelement <2 x i64> %63, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([51 x i8], [51 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %167, label %171

65:                                               ; preds = %65, %27
  %66 = phi i32 [ 0, %27 ], [ %164, %65 ]
  %67 = phi float [ 0.000000e+00, %27 ], [ %163, %65 ]
  %68 = phi i32 [ 0, %27 ], [ %165, %65 ]
  %69 = add nsw i32 %66, %23
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = mul nsw i32 %66, %3
  %74 = add nsw i32 %73, %21
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract float %72, %77
  %79 = fadd contract float %67, %78
  %80 = or i32 %66, 1
  %81 = add nsw i32 %80, %23
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = mul nsw i32 %80, %3
  %86 = add nsw i32 %85, %21
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fmul contract float %84, %89
  %91 = fadd contract float %79, %90
  %92 = or i32 %66, 2
  %93 = add nsw i32 %92, %23
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = mul nsw i32 %92, %3
  %98 = add nsw i32 %97, %21
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fmul contract float %96, %101
  %103 = fadd contract float %91, %102
  %104 = or i32 %66, 3
  %105 = add nsw i32 %104, %23
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = mul nsw i32 %104, %3
  %110 = add nsw i32 %109, %21
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = fmul contract float %108, %113
  %115 = fadd contract float %103, %114
  %116 = or i32 %66, 4
  %117 = add nsw i32 %116, %23
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !5
  %121 = mul nsw i32 %116, %3
  %122 = add nsw i32 %121, %21
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = fmul contract float %120, %125
  %127 = fadd contract float %115, %126
  %128 = or i32 %66, 5
  %129 = add nsw i32 %128, %23
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = mul nsw i32 %128, %3
  %134 = add nsw i32 %133, %21
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %132, %137
  %139 = fadd contract float %127, %138
  %140 = or i32 %66, 6
  %141 = add nsw i32 %140, %23
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = mul nsw i32 %140, %3
  %146 = add nsw i32 %145, %21
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !5
  %150 = fmul contract float %144, %149
  %151 = fadd contract float %139, %150
  %152 = or i32 %66, 7
  %153 = add nsw i32 %152, %23
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !5
  %157 = mul nsw i32 %152, %3
  %158 = add nsw i32 %157, %21
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !5
  %162 = fmul contract float %156, %161
  %163 = fadd contract float %151, %162
  %164 = add nuw nsw i32 %66, 8
  %165 = add i32 %68, 8
  %166 = icmp eq i32 %165, %28
  br i1 %166, label %29, label %65, !llvm.loop !17

167:                                              ; preds = %52
  %168 = and i64 %64, -225
  %169 = or i64 %168, 32
  %170 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %169, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %612

171:                                              ; preds = %52
  %172 = and i64 %64, 2
  %173 = and i64 %64, -3
  %174 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %173, i64 0
  br label %175

175:                                              ; preds = %601, %171
  %176 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([51 x i8], [51 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([51 x i8], [51 x i8] addrspace(4)* @.str, i64 0, i64 50) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([51 x i8]* addrspacecast ([51 x i8] addrspace(4)* @.str to [51 x i8]*) to i64)), i64 1))), %171 ], [ %609, %601 ]
  %177 = phi i8 addrspace(4)* [ getelementptr inbounds ([51 x i8], [51 x i8] addrspace(4)* @.str, i64 0, i64 0), %171 ], [ %610, %601 ]
  %178 = phi <2 x i64> [ %174, %171 ], [ %608, %601 ]
  %179 = icmp ugt i64 %176, 56
  %180 = extractelement <2 x i64> %178, i64 0
  %181 = or i64 %180, %172
  %182 = insertelement <2 x i64> poison, i64 %181, i64 0
  %183 = select i1 %179, <2 x i64> %178, <2 x i64> %182
  %184 = tail call i64 @llvm.umin.i64(i64 %176, i64 56)
  %185 = trunc i64 %184 to i32
  %186 = extractelement <2 x i64> %183, i64 0
  %187 = icmp ugt i32 %185, 7
  br i1 %187, label %190, label %188

188:                                              ; preds = %175
  %189 = icmp eq i32 %185, 0
  br i1 %189, label %243, label %230

190:                                              ; preds = %175
  %191 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !19
  %192 = zext i8 %191 to i64
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 1
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !19
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 8
  %197 = or i64 %196, %192
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 2
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !19
  %200 = zext i8 %199 to i64
  %201 = shl nuw nsw i64 %200, 16
  %202 = or i64 %197, %201
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 3
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !19
  %205 = zext i8 %204 to i64
  %206 = shl nuw nsw i64 %205, 24
  %207 = or i64 %202, %206
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 4
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !19
  %210 = zext i8 %209 to i64
  %211 = shl nuw nsw i64 %210, 32
  %212 = or i64 %207, %211
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 5
  %214 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !19
  %215 = zext i8 %214 to i64
  %216 = shl nuw nsw i64 %215, 40
  %217 = or i64 %212, %216
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 6
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !19
  %220 = zext i8 %219 to i64
  %221 = shl nuw nsw i64 %220, 48
  %222 = or i64 %217, %221
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 7
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !19
  %225 = zext i8 %224 to i64
  %226 = shl nuw i64 %225, 56
  %227 = or i64 %222, %226
  %228 = add nsw i32 %185, -8
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 8
  br label %243

230:                                              ; preds = %188, %230
  %231 = phi i32 [ %241, %230 ], [ 0, %188 ]
  %232 = phi i64 [ %240, %230 ], [ 0, %188 ]
  %233 = zext i32 %231 to i64
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 %233
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !19
  %236 = zext i8 %235 to i64
  %237 = shl i32 %231, 3
  %238 = zext i32 %237 to i64
  %239 = shl nuw i64 %236, %238
  %240 = or i64 %239, %232
  %241 = add nuw nsw i32 %231, 1
  %242 = icmp eq i32 %241, %185
  br i1 %242, label %243, label %230, !llvm.loop !20

243:                                              ; preds = %230, %190, %188
  %244 = phi i8 addrspace(4)* [ %229, %190 ], [ %177, %188 ], [ %177, %230 ]
  %245 = phi i32 [ %228, %190 ], [ 0, %188 ], [ 0, %230 ]
  %246 = phi i64 [ %227, %190 ], [ 0, %188 ], [ %240, %230 ]
  %247 = icmp ugt i32 %245, 7
  br i1 %247, label %250, label %248

248:                                              ; preds = %243
  %249 = icmp eq i32 %245, 0
  br i1 %249, label %303, label %290

250:                                              ; preds = %243
  %251 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !19
  %252 = zext i8 %251 to i64
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 1
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !19
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 8
  %257 = or i64 %256, %252
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 2
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !19
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 16
  %262 = or i64 %257, %261
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 3
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !19
  %265 = zext i8 %264 to i64
  %266 = shl nuw nsw i64 %265, 24
  %267 = or i64 %262, %266
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 4
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !19
  %270 = zext i8 %269 to i64
  %271 = shl nuw nsw i64 %270, 32
  %272 = or i64 %267, %271
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 5
  %274 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !19
  %275 = zext i8 %274 to i64
  %276 = shl nuw nsw i64 %275, 40
  %277 = or i64 %272, %276
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 6
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !19
  %280 = zext i8 %279 to i64
  %281 = shl nuw nsw i64 %280, 48
  %282 = or i64 %277, %281
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 7
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !19
  %285 = zext i8 %284 to i64
  %286 = shl nuw i64 %285, 56
  %287 = or i64 %282, %286
  %288 = add nsw i32 %245, -8
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 8
  br label %303

290:                                              ; preds = %248, %290
  %291 = phi i32 [ %301, %290 ], [ 0, %248 ]
  %292 = phi i64 [ %300, %290 ], [ 0, %248 ]
  %293 = zext i32 %291 to i64
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 %293
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !19
  %296 = zext i8 %295 to i64
  %297 = shl i32 %291, 3
  %298 = zext i32 %297 to i64
  %299 = shl nuw i64 %296, %298
  %300 = or i64 %299, %292
  %301 = add nuw nsw i32 %291, 1
  %302 = icmp eq i32 %301, %245
  br i1 %302, label %303, label %290

303:                                              ; preds = %290, %250, %248
  %304 = phi i8 addrspace(4)* [ %289, %250 ], [ %244, %248 ], [ %244, %290 ]
  %305 = phi i32 [ %288, %250 ], [ 0, %248 ], [ 0, %290 ]
  %306 = phi i64 [ %287, %250 ], [ 0, %248 ], [ %300, %290 ]
  %307 = icmp ugt i32 %305, 7
  br i1 %307, label %310, label %308

308:                                              ; preds = %303
  %309 = icmp eq i32 %305, 0
  br i1 %309, label %363, label %350

310:                                              ; preds = %303
  %311 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !19
  %312 = zext i8 %311 to i64
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 1
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !19
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 8
  %317 = or i64 %316, %312
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 2
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !19
  %320 = zext i8 %319 to i64
  %321 = shl nuw nsw i64 %320, 16
  %322 = or i64 %317, %321
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 3
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !19
  %325 = zext i8 %324 to i64
  %326 = shl nuw nsw i64 %325, 24
  %327 = or i64 %322, %326
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 4
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !19
  %330 = zext i8 %329 to i64
  %331 = shl nuw nsw i64 %330, 32
  %332 = or i64 %327, %331
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 5
  %334 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !19
  %335 = zext i8 %334 to i64
  %336 = shl nuw nsw i64 %335, 40
  %337 = or i64 %332, %336
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 6
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !19
  %340 = zext i8 %339 to i64
  %341 = shl nuw nsw i64 %340, 48
  %342 = or i64 %337, %341
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 7
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !19
  %345 = zext i8 %344 to i64
  %346 = shl nuw i64 %345, 56
  %347 = or i64 %342, %346
  %348 = add nsw i32 %305, -8
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 8
  br label %363

350:                                              ; preds = %308, %350
  %351 = phi i32 [ %361, %350 ], [ 0, %308 ]
  %352 = phi i64 [ %360, %350 ], [ 0, %308 ]
  %353 = zext i32 %351 to i64
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 %353
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !19
  %356 = zext i8 %355 to i64
  %357 = shl i32 %351, 3
  %358 = zext i32 %357 to i64
  %359 = shl nuw i64 %356, %358
  %360 = or i64 %359, %352
  %361 = add nuw nsw i32 %351, 1
  %362 = icmp eq i32 %361, %305
  br i1 %362, label %363, label %350

363:                                              ; preds = %350, %310, %308
  %364 = phi i8 addrspace(4)* [ %349, %310 ], [ %304, %308 ], [ %304, %350 ]
  %365 = phi i32 [ %348, %310 ], [ 0, %308 ], [ 0, %350 ]
  %366 = phi i64 [ %347, %310 ], [ 0, %308 ], [ %360, %350 ]
  %367 = icmp ugt i32 %365, 7
  br i1 %367, label %370, label %368

368:                                              ; preds = %363
  %369 = icmp eq i32 %365, 0
  br i1 %369, label %423, label %410

370:                                              ; preds = %363
  %371 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !19
  %372 = zext i8 %371 to i64
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 1
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !19
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 8
  %377 = or i64 %376, %372
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 2
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !19
  %380 = zext i8 %379 to i64
  %381 = shl nuw nsw i64 %380, 16
  %382 = or i64 %377, %381
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 3
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !19
  %385 = zext i8 %384 to i64
  %386 = shl nuw nsw i64 %385, 24
  %387 = or i64 %382, %386
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 4
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !19
  %390 = zext i8 %389 to i64
  %391 = shl nuw nsw i64 %390, 32
  %392 = or i64 %387, %391
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 5
  %394 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !19
  %395 = zext i8 %394 to i64
  %396 = shl nuw nsw i64 %395, 40
  %397 = or i64 %392, %396
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 6
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !19
  %400 = zext i8 %399 to i64
  %401 = shl nuw nsw i64 %400, 48
  %402 = or i64 %397, %401
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 7
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !19
  %405 = zext i8 %404 to i64
  %406 = shl nuw i64 %405, 56
  %407 = or i64 %402, %406
  %408 = add nsw i32 %365, -8
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 8
  br label %423

410:                                              ; preds = %368, %410
  %411 = phi i32 [ %421, %410 ], [ 0, %368 ]
  %412 = phi i64 [ %420, %410 ], [ 0, %368 ]
  %413 = zext i32 %411 to i64
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 %413
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !19
  %416 = zext i8 %415 to i64
  %417 = shl i32 %411, 3
  %418 = zext i32 %417 to i64
  %419 = shl nuw i64 %416, %418
  %420 = or i64 %419, %412
  %421 = add nuw nsw i32 %411, 1
  %422 = icmp eq i32 %421, %365
  br i1 %422, label %423, label %410

423:                                              ; preds = %410, %370, %368
  %424 = phi i8 addrspace(4)* [ %409, %370 ], [ %364, %368 ], [ %364, %410 ]
  %425 = phi i32 [ %408, %370 ], [ 0, %368 ], [ 0, %410 ]
  %426 = phi i64 [ %407, %370 ], [ 0, %368 ], [ %420, %410 ]
  %427 = icmp ugt i32 %425, 7
  br i1 %427, label %430, label %428

428:                                              ; preds = %423
  %429 = icmp eq i32 %425, 0
  br i1 %429, label %483, label %470

430:                                              ; preds = %423
  %431 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !19
  %432 = zext i8 %431 to i64
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 1
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !19
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 8
  %437 = or i64 %436, %432
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 2
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !19
  %440 = zext i8 %439 to i64
  %441 = shl nuw nsw i64 %440, 16
  %442 = or i64 %437, %441
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 3
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !19
  %445 = zext i8 %444 to i64
  %446 = shl nuw nsw i64 %445, 24
  %447 = or i64 %442, %446
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 4
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !19
  %450 = zext i8 %449 to i64
  %451 = shl nuw nsw i64 %450, 32
  %452 = or i64 %447, %451
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 5
  %454 = load i8, i8 addrspace(4)* %453, align 1, !tbaa !19
  %455 = zext i8 %454 to i64
  %456 = shl nuw nsw i64 %455, 40
  %457 = or i64 %452, %456
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 6
  %459 = load i8, i8 addrspace(4)* %458, align 1, !tbaa !19
  %460 = zext i8 %459 to i64
  %461 = shl nuw nsw i64 %460, 48
  %462 = or i64 %457, %461
  %463 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 7
  %464 = load i8, i8 addrspace(4)* %463, align 1, !tbaa !19
  %465 = zext i8 %464 to i64
  %466 = shl nuw i64 %465, 56
  %467 = or i64 %462, %466
  %468 = add nsw i32 %425, -8
  %469 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 8
  br label %483

470:                                              ; preds = %428, %470
  %471 = phi i32 [ %481, %470 ], [ 0, %428 ]
  %472 = phi i64 [ %480, %470 ], [ 0, %428 ]
  %473 = zext i32 %471 to i64
  %474 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 %473
  %475 = load i8, i8 addrspace(4)* %474, align 1, !tbaa !19
  %476 = zext i8 %475 to i64
  %477 = shl i32 %471, 3
  %478 = zext i32 %477 to i64
  %479 = shl nuw i64 %476, %478
  %480 = or i64 %479, %472
  %481 = add nuw nsw i32 %471, 1
  %482 = icmp eq i32 %481, %425
  br i1 %482, label %483, label %470

483:                                              ; preds = %470, %430, %428
  %484 = phi i8 addrspace(4)* [ %469, %430 ], [ %424, %428 ], [ %424, %470 ]
  %485 = phi i32 [ %468, %430 ], [ 0, %428 ], [ 0, %470 ]
  %486 = phi i64 [ %467, %430 ], [ 0, %428 ], [ %480, %470 ]
  %487 = icmp ugt i32 %485, 7
  br i1 %487, label %490, label %488

488:                                              ; preds = %483
  %489 = icmp eq i32 %485, 0
  br i1 %489, label %543, label %530

490:                                              ; preds = %483
  %491 = load i8, i8 addrspace(4)* %484, align 1, !tbaa !19
  %492 = zext i8 %491 to i64
  %493 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 1
  %494 = load i8, i8 addrspace(4)* %493, align 1, !tbaa !19
  %495 = zext i8 %494 to i64
  %496 = shl nuw nsw i64 %495, 8
  %497 = or i64 %496, %492
  %498 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 2
  %499 = load i8, i8 addrspace(4)* %498, align 1, !tbaa !19
  %500 = zext i8 %499 to i64
  %501 = shl nuw nsw i64 %500, 16
  %502 = or i64 %497, %501
  %503 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 3
  %504 = load i8, i8 addrspace(4)* %503, align 1, !tbaa !19
  %505 = zext i8 %504 to i64
  %506 = shl nuw nsw i64 %505, 24
  %507 = or i64 %502, %506
  %508 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 4
  %509 = load i8, i8 addrspace(4)* %508, align 1, !tbaa !19
  %510 = zext i8 %509 to i64
  %511 = shl nuw nsw i64 %510, 32
  %512 = or i64 %507, %511
  %513 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 5
  %514 = load i8, i8 addrspace(4)* %513, align 1, !tbaa !19
  %515 = zext i8 %514 to i64
  %516 = shl nuw nsw i64 %515, 40
  %517 = or i64 %512, %516
  %518 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 6
  %519 = load i8, i8 addrspace(4)* %518, align 1, !tbaa !19
  %520 = zext i8 %519 to i64
  %521 = shl nuw nsw i64 %520, 48
  %522 = or i64 %517, %521
  %523 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 7
  %524 = load i8, i8 addrspace(4)* %523, align 1, !tbaa !19
  %525 = zext i8 %524 to i64
  %526 = shl nuw i64 %525, 56
  %527 = or i64 %522, %526
  %528 = add nsw i32 %485, -8
  %529 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 8
  br label %543

530:                                              ; preds = %488, %530
  %531 = phi i32 [ %541, %530 ], [ 0, %488 ]
  %532 = phi i64 [ %540, %530 ], [ 0, %488 ]
  %533 = zext i32 %531 to i64
  %534 = getelementptr inbounds i8, i8 addrspace(4)* %484, i64 %533
  %535 = load i8, i8 addrspace(4)* %534, align 1, !tbaa !19
  %536 = zext i8 %535 to i64
  %537 = shl i32 %531, 3
  %538 = zext i32 %537 to i64
  %539 = shl nuw i64 %536, %538
  %540 = or i64 %539, %532
  %541 = add nuw nsw i32 %531, 1
  %542 = icmp eq i32 %541, %485
  br i1 %542, label %543, label %530

543:                                              ; preds = %530, %490, %488
  %544 = phi i8 addrspace(4)* [ %529, %490 ], [ %484, %488 ], [ %484, %530 ]
  %545 = phi i32 [ %528, %490 ], [ 0, %488 ], [ 0, %530 ]
  %546 = phi i64 [ %527, %490 ], [ 0, %488 ], [ %540, %530 ]
  %547 = icmp ugt i32 %545, 7
  br i1 %547, label %550, label %548

548:                                              ; preds = %543
  %549 = icmp eq i32 %545, 0
  br i1 %549, label %601, label %588

550:                                              ; preds = %543
  %551 = load i8, i8 addrspace(4)* %544, align 1, !tbaa !19
  %552 = zext i8 %551 to i64
  %553 = getelementptr inbounds i8, i8 addrspace(4)* %544, i64 1
  %554 = load i8, i8 addrspace(4)* %553, align 1, !tbaa !19
  %555 = zext i8 %554 to i64
  %556 = shl nuw nsw i64 %555, 8
  %557 = or i64 %556, %552
  %558 = getelementptr inbounds i8, i8 addrspace(4)* %544, i64 2
  %559 = load i8, i8 addrspace(4)* %558, align 1, !tbaa !19
  %560 = zext i8 %559 to i64
  %561 = shl nuw nsw i64 %560, 16
  %562 = or i64 %557, %561
  %563 = getelementptr inbounds i8, i8 addrspace(4)* %544, i64 3
  %564 = load i8, i8 addrspace(4)* %563, align 1, !tbaa !19
  %565 = zext i8 %564 to i64
  %566 = shl nuw nsw i64 %565, 24
  %567 = or i64 %562, %566
  %568 = getelementptr inbounds i8, i8 addrspace(4)* %544, i64 4
  %569 = load i8, i8 addrspace(4)* %568, align 1, !tbaa !19
  %570 = zext i8 %569 to i64
  %571 = shl nuw nsw i64 %570, 32
  %572 = or i64 %567, %571
  %573 = getelementptr inbounds i8, i8 addrspace(4)* %544, i64 5
  %574 = load i8, i8 addrspace(4)* %573, align 1, !tbaa !19
  %575 = zext i8 %574 to i64
  %576 = shl nuw nsw i64 %575, 40
  %577 = or i64 %572, %576
  %578 = getelementptr inbounds i8, i8 addrspace(4)* %544, i64 6
  %579 = load i8, i8 addrspace(4)* %578, align 1, !tbaa !19
  %580 = zext i8 %579 to i64
  %581 = shl nuw nsw i64 %580, 48
  %582 = or i64 %577, %581
  %583 = getelementptr inbounds i8, i8 addrspace(4)* %544, i64 7
  %584 = load i8, i8 addrspace(4)* %583, align 1, !tbaa !19
  %585 = zext i8 %584 to i64
  %586 = shl nuw i64 %585, 56
  %587 = or i64 %582, %586
  br label %601

588:                                              ; preds = %548, %588
  %589 = phi i32 [ %599, %588 ], [ 0, %548 ]
  %590 = phi i64 [ %598, %588 ], [ 0, %548 ]
  %591 = zext i32 %589 to i64
  %592 = getelementptr inbounds i8, i8 addrspace(4)* %544, i64 %591
  %593 = load i8, i8 addrspace(4)* %592, align 1, !tbaa !19
  %594 = zext i8 %593 to i64
  %595 = shl i32 %589, 3
  %596 = zext i32 %595 to i64
  %597 = shl nuw i64 %594, %596
  %598 = or i64 %597, %590
  %599 = add nuw nsw i32 %589, 1
  %600 = icmp eq i32 %599, %545
  br i1 %600, label %601, label %588

601:                                              ; preds = %588, %550, %548
  %602 = phi i64 [ %587, %550 ], [ 0, %548 ], [ %598, %588 ]
  %603 = shl nuw nsw i64 %184, 2
  %604 = add nuw nsw i64 %603, 28
  %605 = and i64 %604, 480
  %606 = and i64 %186, -225
  %607 = or i64 %606, %605
  %608 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %607, i64 noundef %246, i64 noundef %306, i64 noundef %366, i64 noundef %426, i64 noundef %486, i64 noundef %546, i64 noundef %602) #10
  %609 = sub i64 %176, %184
  %610 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 %184
  %611 = icmp eq i64 %609, 0
  br i1 %611, label %612, label %175

612:                                              ; preds = %601, %167
  %613 = phi <2 x i64> [ %170, %167 ], [ %608, %601 ]
  %614 = fpext float %53 to double
  %615 = extractelement <2 x i64> %613, i64 0
  %616 = zext i32 %14 to i64
  %617 = and i64 %615, -225
  %618 = or i64 %617, 32
  %619 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %618, i64 noundef %616, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %620 = extractelement <2 x i64> %619, i64 0
  %621 = zext i32 %5 to i64
  %622 = and i64 %620, -225
  %623 = or i64 %622, 32
  %624 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %623, i64 noundef %621, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %625 = extractelement <2 x i64> %624, i64 0
  %626 = zext i32 %20 to i64
  %627 = and i64 %625, -225
  %628 = or i64 %627, 32
  %629 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %628, i64 noundef %626, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %630 = extractelement <2 x i64> %629, i64 0
  %631 = zext i32 %12 to i64
  %632 = and i64 %630, -225
  %633 = or i64 %632, 32
  %634 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %633, i64 noundef %631, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %635 = extractelement <2 x i64> %634, i64 0
  %636 = bitcast double %614 to i64
  %637 = and i64 %635, -227
  %638 = or i64 %637, 34
  %639 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %638, i64 noundef %636, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
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
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !13
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !13
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !13
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !13
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !13
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !13
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !13
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !13
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !13
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !13
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !13
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !13
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !13
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !13
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !13
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !13
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !13
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !13
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !13
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !13
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !13
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !13
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !13
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !13
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !13
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !13
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !13
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !19
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
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
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!15, !15, i64 0}
!20 = distinct !{!20, !12}
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !15, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !15, i64 0}
!25 = !{i64 2662}
!26 = !{!27, !22, i64 0}
!27 = !{!"", !22, i64 0, !22, i64 8, !28, i64 16, !14, i64 24, !14, i64 32, !14, i64 40}
!28 = !{!"hsa_signal_s", !14, i64 0}
!29 = !{!27, !14, i64 40}
!30 = !{!27, !22, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !24, i64 16}
!33 = !{!"", !14, i64 0, !14, i64 8, !24, i64 16, !24, i64 20}
!34 = !{!33, !14, i64 8}
!35 = !{!33, !24, i64 20}
!36 = !{!33, !14, i64 0}
!37 = !{!38, !14, i64 16}
!38 = !{!"amd_signal_s", !14, i64 0, !15, i64 8, !14, i64 16, !24, i64 24, !24, i64 28, !14, i64 32, !14, i64 40, !15, i64 48, !15, i64 56}
!39 = !{!38, !24, i64 24}
