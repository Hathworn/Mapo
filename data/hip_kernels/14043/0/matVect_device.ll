; ModuleID = '../data/hip_kernels/14043/0/main.cu'
source_filename = "../data/hip_kernels/14043/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [23 x i8] c"ERREUR - Index > size\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z7matVectPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #1 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %13, %3
  br i1 %14, label %22, label %15

15:                                               ; preds = %4
  %16 = icmp sgt i32 %3, 0
  br i1 %16, label %17, label %497

17:                                               ; preds = %15
  %18 = and i32 %3, 7
  %19 = icmp ult i32 %3, 8
  br i1 %19, label %475, label %20

20:                                               ; preds = %17
  %21 = and i32 %3, -8
  br label %501

22:                                               ; preds = %4
  %23 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 24
  %25 = bitcast i8 addrspace(4)* %24 to i64 addrspace(4)*
  %26 = load i64, i64 addrspace(4)* %25, align 8, !tbaa !7
  %27 = inttoptr i64 %26 to i8 addrspace(1)*
  %28 = addrspacecast i8 addrspace(1)* %27 to i8*
  %29 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %30 = extractelement <2 x i64> %29, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %31, label %35

31:                                               ; preds = %22
  %32 = and i64 %30, -227
  %33 = or i64 %32, 34
  %34 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %595

35:                                               ; preds = %22
  %36 = and i64 %30, -3
  %37 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %36, i64 0
  br label %38

38:                                               ; preds = %464, %35
  %39 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 22) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([23 x i8]* addrspacecast ([23 x i8] addrspace(4)* @.str to [23 x i8]*) to i64)), i64 1))), %35 ], [ %472, %464 ]
  %40 = phi i8 addrspace(4)* [ getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0), %35 ], [ %473, %464 ]
  %41 = phi <2 x i64> [ %37, %35 ], [ %471, %464 ]
  %42 = icmp ugt i64 %39, 56
  %43 = extractelement <2 x i64> %41, i64 0
  %44 = or i64 %43, 2
  %45 = insertelement <2 x i64> poison, i64 %44, i64 0
  %46 = select i1 %42, <2 x i64> %41, <2 x i64> %45
  %47 = tail call i64 @llvm.umin.i64(i64 %39, i64 56)
  %48 = trunc i64 %47 to i32
  %49 = extractelement <2 x i64> %46, i64 0
  %50 = icmp ugt i32 %48, 7
  br i1 %50, label %53, label %51

51:                                               ; preds = %38
  %52 = icmp eq i32 %48, 0
  br i1 %52, label %106, label %93

53:                                               ; preds = %38
  %54 = load i8, i8 addrspace(4)* %40, align 1, !tbaa !11
  %55 = zext i8 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 1
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !11
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 8
  %60 = or i64 %59, %55
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 2
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !11
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 16
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 3
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !11
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 24
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 4
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !11
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 32
  %75 = or i64 %70, %74
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 5
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !11
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 40
  %80 = or i64 %75, %79
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 6
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !11
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 48
  %85 = or i64 %80, %84
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 7
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !11
  %88 = zext i8 %87 to i64
  %89 = shl nuw i64 %88, 56
  %90 = or i64 %85, %89
  %91 = add nsw i32 %48, -8
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 8
  br label %106

93:                                               ; preds = %51, %93
  %94 = phi i32 [ %104, %93 ], [ 0, %51 ]
  %95 = phi i64 [ %103, %93 ], [ 0, %51 ]
  %96 = zext i32 %94 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 %96
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !11
  %99 = zext i8 %98 to i64
  %100 = shl i32 %94, 3
  %101 = zext i32 %100 to i64
  %102 = shl nuw i64 %99, %101
  %103 = or i64 %102, %95
  %104 = add nuw nsw i32 %94, 1
  %105 = icmp eq i32 %104, %48
  br i1 %105, label %106, label %93, !llvm.loop !12

106:                                              ; preds = %93, %53, %51
  %107 = phi i8 addrspace(4)* [ %92, %53 ], [ %40, %51 ], [ %40, %93 ]
  %108 = phi i32 [ %91, %53 ], [ 0, %51 ], [ 0, %93 ]
  %109 = phi i64 [ %90, %53 ], [ 0, %51 ], [ %103, %93 ]
  %110 = icmp ugt i32 %108, 7
  br i1 %110, label %113, label %111

111:                                              ; preds = %106
  %112 = icmp eq i32 %108, 0
  br i1 %112, label %166, label %153

113:                                              ; preds = %106
  %114 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !11
  %115 = zext i8 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 1
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !11
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 8
  %120 = or i64 %119, %115
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 2
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !11
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 16
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 3
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !11
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 24
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 4
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !11
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 32
  %135 = or i64 %130, %134
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 5
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !11
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 40
  %140 = or i64 %135, %139
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 6
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !11
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 48
  %145 = or i64 %140, %144
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 7
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !11
  %148 = zext i8 %147 to i64
  %149 = shl nuw i64 %148, 56
  %150 = or i64 %145, %149
  %151 = add nsw i32 %108, -8
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 8
  br label %166

153:                                              ; preds = %111, %153
  %154 = phi i32 [ %164, %153 ], [ 0, %111 ]
  %155 = phi i64 [ %163, %153 ], [ 0, %111 ]
  %156 = zext i32 %154 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 %156
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !11
  %159 = zext i8 %158 to i64
  %160 = shl i32 %154, 3
  %161 = zext i32 %160 to i64
  %162 = shl nuw i64 %159, %161
  %163 = or i64 %162, %155
  %164 = add nuw nsw i32 %154, 1
  %165 = icmp eq i32 %164, %108
  br i1 %165, label %166, label %153

166:                                              ; preds = %153, %113, %111
  %167 = phi i8 addrspace(4)* [ %152, %113 ], [ %107, %111 ], [ %107, %153 ]
  %168 = phi i32 [ %151, %113 ], [ 0, %111 ], [ 0, %153 ]
  %169 = phi i64 [ %150, %113 ], [ 0, %111 ], [ %163, %153 ]
  %170 = icmp ugt i32 %168, 7
  br i1 %170, label %173, label %171

171:                                              ; preds = %166
  %172 = icmp eq i32 %168, 0
  br i1 %172, label %226, label %213

173:                                              ; preds = %166
  %174 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !11
  %175 = zext i8 %174 to i64
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 1
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !11
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 8
  %180 = or i64 %179, %175
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 2
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !11
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 16
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 3
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !11
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 24
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 4
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !11
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 32
  %195 = or i64 %190, %194
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 5
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !11
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 40
  %200 = or i64 %195, %199
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 6
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !11
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 48
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 7
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !11
  %208 = zext i8 %207 to i64
  %209 = shl nuw i64 %208, 56
  %210 = or i64 %205, %209
  %211 = add nsw i32 %168, -8
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 8
  br label %226

213:                                              ; preds = %171, %213
  %214 = phi i32 [ %224, %213 ], [ 0, %171 ]
  %215 = phi i64 [ %223, %213 ], [ 0, %171 ]
  %216 = zext i32 %214 to i64
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 %216
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !11
  %219 = zext i8 %218 to i64
  %220 = shl i32 %214, 3
  %221 = zext i32 %220 to i64
  %222 = shl nuw i64 %219, %221
  %223 = or i64 %222, %215
  %224 = add nuw nsw i32 %214, 1
  %225 = icmp eq i32 %224, %168
  br i1 %225, label %226, label %213

226:                                              ; preds = %213, %173, %171
  %227 = phi i8 addrspace(4)* [ %212, %173 ], [ %167, %171 ], [ %167, %213 ]
  %228 = phi i32 [ %211, %173 ], [ 0, %171 ], [ 0, %213 ]
  %229 = phi i64 [ %210, %173 ], [ 0, %171 ], [ %223, %213 ]
  %230 = icmp ugt i32 %228, 7
  br i1 %230, label %233, label %231

231:                                              ; preds = %226
  %232 = icmp eq i32 %228, 0
  br i1 %232, label %286, label %273

233:                                              ; preds = %226
  %234 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !11
  %235 = zext i8 %234 to i64
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 1
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !11
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 8
  %240 = or i64 %239, %235
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 2
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !11
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 16
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 3
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !11
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 24
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 4
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !11
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 32
  %255 = or i64 %250, %254
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 5
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !11
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 40
  %260 = or i64 %255, %259
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 6
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !11
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 48
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 7
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !11
  %268 = zext i8 %267 to i64
  %269 = shl nuw i64 %268, 56
  %270 = or i64 %265, %269
  %271 = add nsw i32 %228, -8
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 8
  br label %286

273:                                              ; preds = %231, %273
  %274 = phi i32 [ %284, %273 ], [ 0, %231 ]
  %275 = phi i64 [ %283, %273 ], [ 0, %231 ]
  %276 = zext i32 %274 to i64
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 %276
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !11
  %279 = zext i8 %278 to i64
  %280 = shl i32 %274, 3
  %281 = zext i32 %280 to i64
  %282 = shl nuw i64 %279, %281
  %283 = or i64 %282, %275
  %284 = add nuw nsw i32 %274, 1
  %285 = icmp eq i32 %284, %228
  br i1 %285, label %286, label %273

286:                                              ; preds = %273, %233, %231
  %287 = phi i8 addrspace(4)* [ %272, %233 ], [ %227, %231 ], [ %227, %273 ]
  %288 = phi i32 [ %271, %233 ], [ 0, %231 ], [ 0, %273 ]
  %289 = phi i64 [ %270, %233 ], [ 0, %231 ], [ %283, %273 ]
  %290 = icmp ugt i32 %288, 7
  br i1 %290, label %293, label %291

291:                                              ; preds = %286
  %292 = icmp eq i32 %288, 0
  br i1 %292, label %346, label %333

293:                                              ; preds = %286
  %294 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !11
  %295 = zext i8 %294 to i64
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 1
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !11
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 8
  %300 = or i64 %299, %295
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 2
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !11
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 16
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 3
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !11
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 24
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 4
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !11
  %313 = zext i8 %312 to i64
  %314 = shl nuw nsw i64 %313, 32
  %315 = or i64 %310, %314
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 5
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !11
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 40
  %320 = or i64 %315, %319
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 6
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !11
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 48
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 7
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !11
  %328 = zext i8 %327 to i64
  %329 = shl nuw i64 %328, 56
  %330 = or i64 %325, %329
  %331 = add nsw i32 %288, -8
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 8
  br label %346

333:                                              ; preds = %291, %333
  %334 = phi i32 [ %344, %333 ], [ 0, %291 ]
  %335 = phi i64 [ %343, %333 ], [ 0, %291 ]
  %336 = zext i32 %334 to i64
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 %336
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !11
  %339 = zext i8 %338 to i64
  %340 = shl i32 %334, 3
  %341 = zext i32 %340 to i64
  %342 = shl nuw i64 %339, %341
  %343 = or i64 %342, %335
  %344 = add nuw nsw i32 %334, 1
  %345 = icmp eq i32 %344, %288
  br i1 %345, label %346, label %333

346:                                              ; preds = %333, %293, %291
  %347 = phi i8 addrspace(4)* [ %332, %293 ], [ %287, %291 ], [ %287, %333 ]
  %348 = phi i32 [ %331, %293 ], [ 0, %291 ], [ 0, %333 ]
  %349 = phi i64 [ %330, %293 ], [ 0, %291 ], [ %343, %333 ]
  %350 = icmp ugt i32 %348, 7
  br i1 %350, label %353, label %351

351:                                              ; preds = %346
  %352 = icmp eq i32 %348, 0
  br i1 %352, label %406, label %393

353:                                              ; preds = %346
  %354 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !11
  %355 = zext i8 %354 to i64
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 1
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !11
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 8
  %360 = or i64 %359, %355
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 2
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !11
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 16
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 3
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !11
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 24
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 4
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !11
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 32
  %375 = or i64 %370, %374
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 5
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !11
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 40
  %380 = or i64 %375, %379
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 6
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !11
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 48
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 7
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !11
  %388 = zext i8 %387 to i64
  %389 = shl nuw i64 %388, 56
  %390 = or i64 %385, %389
  %391 = add nsw i32 %348, -8
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 8
  br label %406

393:                                              ; preds = %351, %393
  %394 = phi i32 [ %404, %393 ], [ 0, %351 ]
  %395 = phi i64 [ %403, %393 ], [ 0, %351 ]
  %396 = zext i32 %394 to i64
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 %396
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !11
  %399 = zext i8 %398 to i64
  %400 = shl i32 %394, 3
  %401 = zext i32 %400 to i64
  %402 = shl nuw i64 %399, %401
  %403 = or i64 %402, %395
  %404 = add nuw nsw i32 %394, 1
  %405 = icmp eq i32 %404, %348
  br i1 %405, label %406, label %393

406:                                              ; preds = %393, %353, %351
  %407 = phi i8 addrspace(4)* [ %392, %353 ], [ %347, %351 ], [ %347, %393 ]
  %408 = phi i32 [ %391, %353 ], [ 0, %351 ], [ 0, %393 ]
  %409 = phi i64 [ %390, %353 ], [ 0, %351 ], [ %403, %393 ]
  %410 = icmp ugt i32 %408, 7
  br i1 %410, label %413, label %411

411:                                              ; preds = %406
  %412 = icmp eq i32 %408, 0
  br i1 %412, label %464, label %451

413:                                              ; preds = %406
  %414 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !11
  %415 = zext i8 %414 to i64
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 1
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !11
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 8
  %420 = or i64 %419, %415
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 2
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !11
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 16
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 3
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !11
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 24
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 4
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !11
  %433 = zext i8 %432 to i64
  %434 = shl nuw nsw i64 %433, 32
  %435 = or i64 %430, %434
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 5
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !11
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 40
  %440 = or i64 %435, %439
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 6
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !11
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 48
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 7
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !11
  %448 = zext i8 %447 to i64
  %449 = shl nuw i64 %448, 56
  %450 = or i64 %445, %449
  br label %464

451:                                              ; preds = %411, %451
  %452 = phi i32 [ %462, %451 ], [ 0, %411 ]
  %453 = phi i64 [ %461, %451 ], [ 0, %411 ]
  %454 = zext i32 %452 to i64
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 %454
  %456 = load i8, i8 addrspace(4)* %455, align 1, !tbaa !11
  %457 = zext i8 %456 to i64
  %458 = shl i32 %452, 3
  %459 = zext i32 %458 to i64
  %460 = shl nuw i64 %457, %459
  %461 = or i64 %460, %453
  %462 = add nuw nsw i32 %452, 1
  %463 = icmp eq i32 %462, %408
  br i1 %463, label %464, label %451

464:                                              ; preds = %451, %413, %411
  %465 = phi i64 [ %450, %413 ], [ 0, %411 ], [ %461, %451 ]
  %466 = shl nuw nsw i64 %47, 2
  %467 = add nuw nsw i64 %466, 28
  %468 = and i64 %467, 480
  %469 = and i64 %49, -225
  %470 = or i64 %469, %468
  %471 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %470, i64 noundef %109, i64 noundef %169, i64 noundef %229, i64 noundef %289, i64 noundef %349, i64 noundef %409, i64 noundef %465) #10
  %472 = sub i64 %39, %47
  %473 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 %47
  %474 = icmp eq i64 %472, 0
  br i1 %474, label %595, label %38

475:                                              ; preds = %501, %17
  %476 = phi float [ undef, %17 ], [ %591, %501 ]
  %477 = phi i32 [ 0, %17 ], [ %592, %501 ]
  %478 = phi float [ 0.000000e+00, %17 ], [ %591, %501 ]
  %479 = icmp eq i32 %18, 0
  br i1 %479, label %497, label %480

480:                                              ; preds = %475, %480
  %481 = phi i32 [ %494, %480 ], [ %477, %475 ]
  %482 = phi float [ %493, %480 ], [ %478, %475 ]
  %483 = phi i32 [ %495, %480 ], [ 0, %475 ]
  %484 = mul nsw i32 %481, %3
  %485 = add nsw i32 %484, %13
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds float, float addrspace(1)* %0, i64 %486
  %488 = load float, float addrspace(1)* %487, align 4, !tbaa !14, !amdgpu.noclobber !5
  %489 = zext i32 %481 to i64
  %490 = getelementptr inbounds float, float addrspace(1)* %1, i64 %489
  %491 = load float, float addrspace(1)* %490, align 4, !tbaa !14, !amdgpu.noclobber !5
  %492 = fmul contract float %488, %491
  %493 = fadd contract float %482, %492
  %494 = add nuw nsw i32 %481, 1
  %495 = add i32 %483, 1
  %496 = icmp eq i32 %495, %18
  br i1 %496, label %497, label %480, !llvm.loop !18

497:                                              ; preds = %475, %480, %15
  %498 = phi float [ 0.000000e+00, %15 ], [ %476, %475 ], [ %493, %480 ]
  %499 = sext i32 %13 to i64
  %500 = getelementptr inbounds float, float addrspace(1)* %2, i64 %499
  store float %498, float addrspace(1)* %500, align 4, !tbaa !14
  br label %595

501:                                              ; preds = %501, %20
  %502 = phi i32 [ 0, %20 ], [ %592, %501 ]
  %503 = phi float [ 0.000000e+00, %20 ], [ %591, %501 ]
  %504 = phi i32 [ 0, %20 ], [ %593, %501 ]
  %505 = mul nsw i32 %502, %3
  %506 = add nsw i32 %505, %13
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds float, float addrspace(1)* %0, i64 %507
  %509 = load float, float addrspace(1)* %508, align 4, !tbaa !14, !amdgpu.noclobber !5
  %510 = zext i32 %502 to i64
  %511 = getelementptr inbounds float, float addrspace(1)* %1, i64 %510
  %512 = load float, float addrspace(1)* %511, align 4, !tbaa !14, !amdgpu.noclobber !5
  %513 = fmul contract float %509, %512
  %514 = fadd contract float %503, %513
  %515 = or i32 %502, 1
  %516 = mul nsw i32 %515, %3
  %517 = add nsw i32 %516, %13
  %518 = sext i32 %517 to i64
  %519 = getelementptr inbounds float, float addrspace(1)* %0, i64 %518
  %520 = load float, float addrspace(1)* %519, align 4, !tbaa !14, !amdgpu.noclobber !5
  %521 = zext i32 %515 to i64
  %522 = getelementptr inbounds float, float addrspace(1)* %1, i64 %521
  %523 = load float, float addrspace(1)* %522, align 4, !tbaa !14, !amdgpu.noclobber !5
  %524 = fmul contract float %520, %523
  %525 = fadd contract float %514, %524
  %526 = or i32 %502, 2
  %527 = mul nsw i32 %526, %3
  %528 = add nsw i32 %527, %13
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds float, float addrspace(1)* %0, i64 %529
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !14, !amdgpu.noclobber !5
  %532 = zext i32 %526 to i64
  %533 = getelementptr inbounds float, float addrspace(1)* %1, i64 %532
  %534 = load float, float addrspace(1)* %533, align 4, !tbaa !14, !amdgpu.noclobber !5
  %535 = fmul contract float %531, %534
  %536 = fadd contract float %525, %535
  %537 = or i32 %502, 3
  %538 = mul nsw i32 %537, %3
  %539 = add nsw i32 %538, %13
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds float, float addrspace(1)* %0, i64 %540
  %542 = load float, float addrspace(1)* %541, align 4, !tbaa !14, !amdgpu.noclobber !5
  %543 = zext i32 %537 to i64
  %544 = getelementptr inbounds float, float addrspace(1)* %1, i64 %543
  %545 = load float, float addrspace(1)* %544, align 4, !tbaa !14, !amdgpu.noclobber !5
  %546 = fmul contract float %542, %545
  %547 = fadd contract float %536, %546
  %548 = or i32 %502, 4
  %549 = mul nsw i32 %548, %3
  %550 = add nsw i32 %549, %13
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds float, float addrspace(1)* %0, i64 %551
  %553 = load float, float addrspace(1)* %552, align 4, !tbaa !14, !amdgpu.noclobber !5
  %554 = zext i32 %548 to i64
  %555 = getelementptr inbounds float, float addrspace(1)* %1, i64 %554
  %556 = load float, float addrspace(1)* %555, align 4, !tbaa !14, !amdgpu.noclobber !5
  %557 = fmul contract float %553, %556
  %558 = fadd contract float %547, %557
  %559 = or i32 %502, 5
  %560 = mul nsw i32 %559, %3
  %561 = add nsw i32 %560, %13
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds float, float addrspace(1)* %0, i64 %562
  %564 = load float, float addrspace(1)* %563, align 4, !tbaa !14, !amdgpu.noclobber !5
  %565 = zext i32 %559 to i64
  %566 = getelementptr inbounds float, float addrspace(1)* %1, i64 %565
  %567 = load float, float addrspace(1)* %566, align 4, !tbaa !14, !amdgpu.noclobber !5
  %568 = fmul contract float %564, %567
  %569 = fadd contract float %558, %568
  %570 = or i32 %502, 6
  %571 = mul nsw i32 %570, %3
  %572 = add nsw i32 %571, %13
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds float, float addrspace(1)* %0, i64 %573
  %575 = load float, float addrspace(1)* %574, align 4, !tbaa !14, !amdgpu.noclobber !5
  %576 = zext i32 %570 to i64
  %577 = getelementptr inbounds float, float addrspace(1)* %1, i64 %576
  %578 = load float, float addrspace(1)* %577, align 4, !tbaa !14, !amdgpu.noclobber !5
  %579 = fmul contract float %575, %578
  %580 = fadd contract float %569, %579
  %581 = or i32 %502, 7
  %582 = mul nsw i32 %581, %3
  %583 = add nsw i32 %582, %13
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds float, float addrspace(1)* %0, i64 %584
  %586 = load float, float addrspace(1)* %585, align 4, !tbaa !14, !amdgpu.noclobber !5
  %587 = zext i32 %581 to i64
  %588 = getelementptr inbounds float, float addrspace(1)* %1, i64 %587
  %589 = load float, float addrspace(1)* %588, align 4, !tbaa !14, !amdgpu.noclobber !5
  %590 = fmul contract float %586, %589
  %591 = fadd contract float %580, %590
  %592 = add nuw nsw i32 %502, 8
  %593 = add i32 %504, 8
  %594 = icmp eq i32 %593, %21
  br i1 %594, label %475, label %501, !llvm.loop !19

595:                                              ; preds = %464, %31, %497
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !7
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !7
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !7
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !7
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !7
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !7
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !7
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !7
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !7
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !7
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !7
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !7
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !9, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !9, i64 0}
!25 = !{i64 2662}
!26 = !{!27, !22, i64 0}
!27 = !{!"", !22, i64 0, !22, i64 8, !28, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!28 = !{!"hsa_signal_s", !8, i64 0}
!29 = !{!27, !8, i64 40}
!30 = !{!27, !22, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !24, i64 16}
!33 = !{!"", !8, i64 0, !8, i64 8, !24, i64 16, !24, i64 20}
!34 = !{!33, !8, i64 8}
!35 = !{!33, !24, i64 20}
!36 = !{!33, !8, i64 0}
!37 = !{!38, !8, i64 16}
!38 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !24, i64 24, !24, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!39 = !{!38, !24, i64 24}
