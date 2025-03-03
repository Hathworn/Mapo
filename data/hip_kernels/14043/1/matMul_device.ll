; ModuleID = '../data/hip_kernels/14043/1/main.cu'
source_filename = "../data/hip_kernels/14043/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [42 x i8] c"ERREUR - Soit ligne > m soit colonne > m\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z6matMulPfiiS_iiS_ii(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #1 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp sgt i32 %18, %1
  %28 = icmp sgt i32 %26, %5
  %29 = select i1 %27, i1 true, i1 %28
  br i1 %29, label %38, label %30

30:                                               ; preds = %9
  %31 = icmp sgt i32 %2, 0
  br i1 %31, label %32, label %514

32:                                               ; preds = %30
  %33 = mul nsw i32 %18, %2
  %34 = and i32 %2, 7
  %35 = icmp ult i32 %2, 8
  br i1 %35, label %491, label %36

36:                                               ; preds = %32
  %37 = and i32 %2, -8
  br label %520

38:                                               ; preds = %9
  %39 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %40 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 24
  %41 = bitcast i8 addrspace(4)* %40 to i64 addrspace(4)*
  %42 = load i64, i64 addrspace(4)* %41, align 8, !tbaa !7
  %43 = inttoptr i64 %42 to i8 addrspace(1)*
  %44 = addrspacecast i8 addrspace(1)* %43 to i8*
  %45 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %46 = extractelement <2 x i64> %45, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([42 x i8], [42 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %47, label %51

47:                                               ; preds = %38
  %48 = and i64 %46, -227
  %49 = or i64 %48, 34
  %50 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef %49, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %622

51:                                               ; preds = %38
  %52 = and i64 %46, -3
  %53 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %52, i64 0
  br label %54

54:                                               ; preds = %480, %51
  %55 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([42 x i8], [42 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([42 x i8], [42 x i8] addrspace(4)* @.str, i64 0, i64 41) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([42 x i8]* addrspacecast ([42 x i8] addrspace(4)* @.str to [42 x i8]*) to i64)), i64 1))), %51 ], [ %488, %480 ]
  %56 = phi i8 addrspace(4)* [ getelementptr inbounds ([42 x i8], [42 x i8] addrspace(4)* @.str, i64 0, i64 0), %51 ], [ %489, %480 ]
  %57 = phi <2 x i64> [ %53, %51 ], [ %487, %480 ]
  %58 = icmp ugt i64 %55, 56
  %59 = extractelement <2 x i64> %57, i64 0
  %60 = or i64 %59, 2
  %61 = insertelement <2 x i64> poison, i64 %60, i64 0
  %62 = select i1 %58, <2 x i64> %57, <2 x i64> %61
  %63 = tail call i64 @llvm.umin.i64(i64 %55, i64 56)
  %64 = trunc i64 %63 to i32
  %65 = extractelement <2 x i64> %62, i64 0
  %66 = icmp ugt i32 %64, 7
  br i1 %66, label %69, label %67

67:                                               ; preds = %54
  %68 = icmp eq i32 %64, 0
  br i1 %68, label %122, label %109

69:                                               ; preds = %54
  %70 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !11
  %71 = zext i8 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 1
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !11
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 8
  %76 = or i64 %75, %71
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 2
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !11
  %79 = zext i8 %78 to i64
  %80 = shl nuw nsw i64 %79, 16
  %81 = or i64 %76, %80
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 3
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !11
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 24
  %86 = or i64 %81, %85
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 4
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !11
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 32
  %91 = or i64 %86, %90
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 5
  %93 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !11
  %94 = zext i8 %93 to i64
  %95 = shl nuw nsw i64 %94, 40
  %96 = or i64 %91, %95
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 6
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !11
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 48
  %101 = or i64 %96, %100
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 7
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !11
  %104 = zext i8 %103 to i64
  %105 = shl nuw i64 %104, 56
  %106 = or i64 %101, %105
  %107 = add nsw i32 %64, -8
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 8
  br label %122

109:                                              ; preds = %67, %109
  %110 = phi i32 [ %120, %109 ], [ 0, %67 ]
  %111 = phi i64 [ %119, %109 ], [ 0, %67 ]
  %112 = zext i32 %110 to i64
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 %112
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !11
  %115 = zext i8 %114 to i64
  %116 = shl i32 %110, 3
  %117 = zext i32 %116 to i64
  %118 = shl nuw i64 %115, %117
  %119 = or i64 %118, %111
  %120 = add nuw nsw i32 %110, 1
  %121 = icmp eq i32 %120, %64
  br i1 %121, label %122, label %109, !llvm.loop !12

122:                                              ; preds = %109, %69, %67
  %123 = phi i8 addrspace(4)* [ %108, %69 ], [ %56, %67 ], [ %56, %109 ]
  %124 = phi i32 [ %107, %69 ], [ 0, %67 ], [ 0, %109 ]
  %125 = phi i64 [ %106, %69 ], [ 0, %67 ], [ %119, %109 ]
  %126 = icmp ugt i32 %124, 7
  br i1 %126, label %129, label %127

127:                                              ; preds = %122
  %128 = icmp eq i32 %124, 0
  br i1 %128, label %182, label %169

129:                                              ; preds = %122
  %130 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !11
  %131 = zext i8 %130 to i64
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 1
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !11
  %134 = zext i8 %133 to i64
  %135 = shl nuw nsw i64 %134, 8
  %136 = or i64 %135, %131
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 2
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !11
  %139 = zext i8 %138 to i64
  %140 = shl nuw nsw i64 %139, 16
  %141 = or i64 %136, %140
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 3
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !11
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 24
  %146 = or i64 %141, %145
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 4
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !11
  %149 = zext i8 %148 to i64
  %150 = shl nuw nsw i64 %149, 32
  %151 = or i64 %146, %150
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 5
  %153 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !11
  %154 = zext i8 %153 to i64
  %155 = shl nuw nsw i64 %154, 40
  %156 = or i64 %151, %155
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 6
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !11
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 48
  %161 = or i64 %156, %160
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 7
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !11
  %164 = zext i8 %163 to i64
  %165 = shl nuw i64 %164, 56
  %166 = or i64 %161, %165
  %167 = add nsw i32 %124, -8
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 8
  br label %182

169:                                              ; preds = %127, %169
  %170 = phi i32 [ %180, %169 ], [ 0, %127 ]
  %171 = phi i64 [ %179, %169 ], [ 0, %127 ]
  %172 = zext i32 %170 to i64
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %123, i64 %172
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !11
  %175 = zext i8 %174 to i64
  %176 = shl i32 %170, 3
  %177 = zext i32 %176 to i64
  %178 = shl nuw i64 %175, %177
  %179 = or i64 %178, %171
  %180 = add nuw nsw i32 %170, 1
  %181 = icmp eq i32 %180, %124
  br i1 %181, label %182, label %169

182:                                              ; preds = %169, %129, %127
  %183 = phi i8 addrspace(4)* [ %168, %129 ], [ %123, %127 ], [ %123, %169 ]
  %184 = phi i32 [ %167, %129 ], [ 0, %127 ], [ 0, %169 ]
  %185 = phi i64 [ %166, %129 ], [ 0, %127 ], [ %179, %169 ]
  %186 = icmp ugt i32 %184, 7
  br i1 %186, label %189, label %187

187:                                              ; preds = %182
  %188 = icmp eq i32 %184, 0
  br i1 %188, label %242, label %229

189:                                              ; preds = %182
  %190 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !11
  %191 = zext i8 %190 to i64
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 1
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !11
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 8
  %196 = or i64 %195, %191
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 2
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !11
  %199 = zext i8 %198 to i64
  %200 = shl nuw nsw i64 %199, 16
  %201 = or i64 %196, %200
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 3
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !11
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 24
  %206 = or i64 %201, %205
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 4
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !11
  %209 = zext i8 %208 to i64
  %210 = shl nuw nsw i64 %209, 32
  %211 = or i64 %206, %210
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 5
  %213 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !11
  %214 = zext i8 %213 to i64
  %215 = shl nuw nsw i64 %214, 40
  %216 = or i64 %211, %215
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 6
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !11
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 48
  %221 = or i64 %216, %220
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 7
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !11
  %224 = zext i8 %223 to i64
  %225 = shl nuw i64 %224, 56
  %226 = or i64 %221, %225
  %227 = add nsw i32 %184, -8
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 8
  br label %242

229:                                              ; preds = %187, %229
  %230 = phi i32 [ %240, %229 ], [ 0, %187 ]
  %231 = phi i64 [ %239, %229 ], [ 0, %187 ]
  %232 = zext i32 %230 to i64
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %183, i64 %232
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !11
  %235 = zext i8 %234 to i64
  %236 = shl i32 %230, 3
  %237 = zext i32 %236 to i64
  %238 = shl nuw i64 %235, %237
  %239 = or i64 %238, %231
  %240 = add nuw nsw i32 %230, 1
  %241 = icmp eq i32 %240, %184
  br i1 %241, label %242, label %229

242:                                              ; preds = %229, %189, %187
  %243 = phi i8 addrspace(4)* [ %228, %189 ], [ %183, %187 ], [ %183, %229 ]
  %244 = phi i32 [ %227, %189 ], [ 0, %187 ], [ 0, %229 ]
  %245 = phi i64 [ %226, %189 ], [ 0, %187 ], [ %239, %229 ]
  %246 = icmp ugt i32 %244, 7
  br i1 %246, label %249, label %247

247:                                              ; preds = %242
  %248 = icmp eq i32 %244, 0
  br i1 %248, label %302, label %289

249:                                              ; preds = %242
  %250 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !11
  %251 = zext i8 %250 to i64
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 1
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !11
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 8
  %256 = or i64 %255, %251
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 2
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !11
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 16
  %261 = or i64 %256, %260
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 3
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !11
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 24
  %266 = or i64 %261, %265
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 4
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !11
  %269 = zext i8 %268 to i64
  %270 = shl nuw nsw i64 %269, 32
  %271 = or i64 %266, %270
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 5
  %273 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !11
  %274 = zext i8 %273 to i64
  %275 = shl nuw nsw i64 %274, 40
  %276 = or i64 %271, %275
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 6
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !11
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 48
  %281 = or i64 %276, %280
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 7
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !11
  %284 = zext i8 %283 to i64
  %285 = shl nuw i64 %284, 56
  %286 = or i64 %281, %285
  %287 = add nsw i32 %244, -8
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 8
  br label %302

289:                                              ; preds = %247, %289
  %290 = phi i32 [ %300, %289 ], [ 0, %247 ]
  %291 = phi i64 [ %299, %289 ], [ 0, %247 ]
  %292 = zext i32 %290 to i64
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %243, i64 %292
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !11
  %295 = zext i8 %294 to i64
  %296 = shl i32 %290, 3
  %297 = zext i32 %296 to i64
  %298 = shl nuw i64 %295, %297
  %299 = or i64 %298, %291
  %300 = add nuw nsw i32 %290, 1
  %301 = icmp eq i32 %300, %244
  br i1 %301, label %302, label %289

302:                                              ; preds = %289, %249, %247
  %303 = phi i8 addrspace(4)* [ %288, %249 ], [ %243, %247 ], [ %243, %289 ]
  %304 = phi i32 [ %287, %249 ], [ 0, %247 ], [ 0, %289 ]
  %305 = phi i64 [ %286, %249 ], [ 0, %247 ], [ %299, %289 ]
  %306 = icmp ugt i32 %304, 7
  br i1 %306, label %309, label %307

307:                                              ; preds = %302
  %308 = icmp eq i32 %304, 0
  br i1 %308, label %362, label %349

309:                                              ; preds = %302
  %310 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !11
  %311 = zext i8 %310 to i64
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 1
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !11
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 8
  %316 = or i64 %315, %311
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 2
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !11
  %319 = zext i8 %318 to i64
  %320 = shl nuw nsw i64 %319, 16
  %321 = or i64 %316, %320
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 3
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !11
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 24
  %326 = or i64 %321, %325
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 4
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !11
  %329 = zext i8 %328 to i64
  %330 = shl nuw nsw i64 %329, 32
  %331 = or i64 %326, %330
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 5
  %333 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !11
  %334 = zext i8 %333 to i64
  %335 = shl nuw nsw i64 %334, 40
  %336 = or i64 %331, %335
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 6
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !11
  %339 = zext i8 %338 to i64
  %340 = shl nuw nsw i64 %339, 48
  %341 = or i64 %336, %340
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 7
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !11
  %344 = zext i8 %343 to i64
  %345 = shl nuw i64 %344, 56
  %346 = or i64 %341, %345
  %347 = add nsw i32 %304, -8
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 8
  br label %362

349:                                              ; preds = %307, %349
  %350 = phi i32 [ %360, %349 ], [ 0, %307 ]
  %351 = phi i64 [ %359, %349 ], [ 0, %307 ]
  %352 = zext i32 %350 to i64
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %303, i64 %352
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !11
  %355 = zext i8 %354 to i64
  %356 = shl i32 %350, 3
  %357 = zext i32 %356 to i64
  %358 = shl nuw i64 %355, %357
  %359 = or i64 %358, %351
  %360 = add nuw nsw i32 %350, 1
  %361 = icmp eq i32 %360, %304
  br i1 %361, label %362, label %349

362:                                              ; preds = %349, %309, %307
  %363 = phi i8 addrspace(4)* [ %348, %309 ], [ %303, %307 ], [ %303, %349 ]
  %364 = phi i32 [ %347, %309 ], [ 0, %307 ], [ 0, %349 ]
  %365 = phi i64 [ %346, %309 ], [ 0, %307 ], [ %359, %349 ]
  %366 = icmp ugt i32 %364, 7
  br i1 %366, label %369, label %367

367:                                              ; preds = %362
  %368 = icmp eq i32 %364, 0
  br i1 %368, label %422, label %409

369:                                              ; preds = %362
  %370 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !11
  %371 = zext i8 %370 to i64
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 1
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !11
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 8
  %376 = or i64 %375, %371
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 2
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !11
  %379 = zext i8 %378 to i64
  %380 = shl nuw nsw i64 %379, 16
  %381 = or i64 %376, %380
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 3
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !11
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 24
  %386 = or i64 %381, %385
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 4
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !11
  %389 = zext i8 %388 to i64
  %390 = shl nuw nsw i64 %389, 32
  %391 = or i64 %386, %390
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 5
  %393 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !11
  %394 = zext i8 %393 to i64
  %395 = shl nuw nsw i64 %394, 40
  %396 = or i64 %391, %395
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 6
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !11
  %399 = zext i8 %398 to i64
  %400 = shl nuw nsw i64 %399, 48
  %401 = or i64 %396, %400
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 7
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !11
  %404 = zext i8 %403 to i64
  %405 = shl nuw i64 %404, 56
  %406 = or i64 %401, %405
  %407 = add nsw i32 %364, -8
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 8
  br label %422

409:                                              ; preds = %367, %409
  %410 = phi i32 [ %420, %409 ], [ 0, %367 ]
  %411 = phi i64 [ %419, %409 ], [ 0, %367 ]
  %412 = zext i32 %410 to i64
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %363, i64 %412
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !11
  %415 = zext i8 %414 to i64
  %416 = shl i32 %410, 3
  %417 = zext i32 %416 to i64
  %418 = shl nuw i64 %415, %417
  %419 = or i64 %418, %411
  %420 = add nuw nsw i32 %410, 1
  %421 = icmp eq i32 %420, %364
  br i1 %421, label %422, label %409

422:                                              ; preds = %409, %369, %367
  %423 = phi i8 addrspace(4)* [ %408, %369 ], [ %363, %367 ], [ %363, %409 ]
  %424 = phi i32 [ %407, %369 ], [ 0, %367 ], [ 0, %409 ]
  %425 = phi i64 [ %406, %369 ], [ 0, %367 ], [ %419, %409 ]
  %426 = icmp ugt i32 %424, 7
  br i1 %426, label %429, label %427

427:                                              ; preds = %422
  %428 = icmp eq i32 %424, 0
  br i1 %428, label %480, label %467

429:                                              ; preds = %422
  %430 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !11
  %431 = zext i8 %430 to i64
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %423, i64 1
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !11
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 8
  %436 = or i64 %435, %431
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %423, i64 2
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !11
  %439 = zext i8 %438 to i64
  %440 = shl nuw nsw i64 %439, 16
  %441 = or i64 %436, %440
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %423, i64 3
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !11
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 24
  %446 = or i64 %441, %445
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %423, i64 4
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !11
  %449 = zext i8 %448 to i64
  %450 = shl nuw nsw i64 %449, 32
  %451 = or i64 %446, %450
  %452 = getelementptr inbounds i8, i8 addrspace(4)* %423, i64 5
  %453 = load i8, i8 addrspace(4)* %452, align 1, !tbaa !11
  %454 = zext i8 %453 to i64
  %455 = shl nuw nsw i64 %454, 40
  %456 = or i64 %451, %455
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %423, i64 6
  %458 = load i8, i8 addrspace(4)* %457, align 1, !tbaa !11
  %459 = zext i8 %458 to i64
  %460 = shl nuw nsw i64 %459, 48
  %461 = or i64 %456, %460
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %423, i64 7
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !11
  %464 = zext i8 %463 to i64
  %465 = shl nuw i64 %464, 56
  %466 = or i64 %461, %465
  br label %480

467:                                              ; preds = %427, %467
  %468 = phi i32 [ %478, %467 ], [ 0, %427 ]
  %469 = phi i64 [ %477, %467 ], [ 0, %427 ]
  %470 = zext i32 %468 to i64
  %471 = getelementptr inbounds i8, i8 addrspace(4)* %423, i64 %470
  %472 = load i8, i8 addrspace(4)* %471, align 1, !tbaa !11
  %473 = zext i8 %472 to i64
  %474 = shl i32 %468, 3
  %475 = zext i32 %474 to i64
  %476 = shl nuw i64 %473, %475
  %477 = or i64 %476, %469
  %478 = add nuw nsw i32 %468, 1
  %479 = icmp eq i32 %478, %424
  br i1 %479, label %480, label %467

480:                                              ; preds = %467, %429, %427
  %481 = phi i64 [ %466, %429 ], [ 0, %427 ], [ %477, %467 ]
  %482 = shl nuw nsw i64 %63, 2
  %483 = add nuw nsw i64 %482, 28
  %484 = and i64 %483, 480
  %485 = and i64 %65, -225
  %486 = or i64 %485, %484
  %487 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef %486, i64 noundef %125, i64 noundef %185, i64 noundef %245, i64 noundef %305, i64 noundef %365, i64 noundef %425, i64 noundef %481) #10
  %488 = sub i64 %55, %63
  %489 = getelementptr inbounds i8, i8 addrspace(4)* %56, i64 %63
  %490 = icmp eq i64 %488, 0
  br i1 %490, label %622, label %54

491:                                              ; preds = %520, %32
  %492 = phi float [ undef, %32 ], [ %618, %520 ]
  %493 = phi i32 [ 0, %32 ], [ %619, %520 ]
  %494 = phi float [ 0.000000e+00, %32 ], [ %618, %520 ]
  %495 = icmp eq i32 %34, 0
  br i1 %495, label %514, label %496

496:                                              ; preds = %491, %496
  %497 = phi i32 [ %511, %496 ], [ %493, %491 ]
  %498 = phi float [ %510, %496 ], [ %494, %491 ]
  %499 = phi i32 [ %512, %496 ], [ 0, %491 ]
  %500 = add nsw i32 %497, %33
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds float, float addrspace(1)* %0, i64 %501
  %503 = load float, float addrspace(1)* %502, align 4, !tbaa !14, !amdgpu.noclobber !5
  %504 = mul nsw i32 %497, %5
  %505 = add nsw i32 %504, %26
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds float, float addrspace(1)* %3, i64 %506
  %508 = load float, float addrspace(1)* %507, align 4, !tbaa !14, !amdgpu.noclobber !5
  %509 = fmul contract float %503, %508
  %510 = fadd contract float %498, %509
  %511 = add nuw nsw i32 %497, 1
  %512 = add i32 %499, 1
  %513 = icmp eq i32 %512, %34
  br i1 %513, label %514, label %496, !llvm.loop !18

514:                                              ; preds = %491, %496, %30
  %515 = phi float [ 0.000000e+00, %30 ], [ %492, %491 ], [ %510, %496 ]
  %516 = mul nsw i32 %18, %8
  %517 = add nsw i32 %516, %26
  %518 = sext i32 %517 to i64
  %519 = getelementptr inbounds float, float addrspace(1)* %6, i64 %518
  store float %515, float addrspace(1)* %519, align 4, !tbaa !14
  br label %622

520:                                              ; preds = %520, %36
  %521 = phi i32 [ 0, %36 ], [ %619, %520 ]
  %522 = phi float [ 0.000000e+00, %36 ], [ %618, %520 ]
  %523 = phi i32 [ 0, %36 ], [ %620, %520 ]
  %524 = add nsw i32 %521, %33
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds float, float addrspace(1)* %0, i64 %525
  %527 = load float, float addrspace(1)* %526, align 4, !tbaa !14, !amdgpu.noclobber !5
  %528 = mul nsw i32 %521, %5
  %529 = add nsw i32 %528, %26
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds float, float addrspace(1)* %3, i64 %530
  %532 = load float, float addrspace(1)* %531, align 4, !tbaa !14, !amdgpu.noclobber !5
  %533 = fmul contract float %527, %532
  %534 = fadd contract float %522, %533
  %535 = or i32 %521, 1
  %536 = add nsw i32 %535, %33
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds float, float addrspace(1)* %0, i64 %537
  %539 = load float, float addrspace(1)* %538, align 4, !tbaa !14, !amdgpu.noclobber !5
  %540 = mul nsw i32 %535, %5
  %541 = add nsw i32 %540, %26
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds float, float addrspace(1)* %3, i64 %542
  %544 = load float, float addrspace(1)* %543, align 4, !tbaa !14, !amdgpu.noclobber !5
  %545 = fmul contract float %539, %544
  %546 = fadd contract float %534, %545
  %547 = or i32 %521, 2
  %548 = add nsw i32 %547, %33
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds float, float addrspace(1)* %0, i64 %549
  %551 = load float, float addrspace(1)* %550, align 4, !tbaa !14, !amdgpu.noclobber !5
  %552 = mul nsw i32 %547, %5
  %553 = add nsw i32 %552, %26
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds float, float addrspace(1)* %3, i64 %554
  %556 = load float, float addrspace(1)* %555, align 4, !tbaa !14, !amdgpu.noclobber !5
  %557 = fmul contract float %551, %556
  %558 = fadd contract float %546, %557
  %559 = or i32 %521, 3
  %560 = add nsw i32 %559, %33
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds float, float addrspace(1)* %0, i64 %561
  %563 = load float, float addrspace(1)* %562, align 4, !tbaa !14, !amdgpu.noclobber !5
  %564 = mul nsw i32 %559, %5
  %565 = add nsw i32 %564, %26
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds float, float addrspace(1)* %3, i64 %566
  %568 = load float, float addrspace(1)* %567, align 4, !tbaa !14, !amdgpu.noclobber !5
  %569 = fmul contract float %563, %568
  %570 = fadd contract float %558, %569
  %571 = or i32 %521, 4
  %572 = add nsw i32 %571, %33
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds float, float addrspace(1)* %0, i64 %573
  %575 = load float, float addrspace(1)* %574, align 4, !tbaa !14, !amdgpu.noclobber !5
  %576 = mul nsw i32 %571, %5
  %577 = add nsw i32 %576, %26
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds float, float addrspace(1)* %3, i64 %578
  %580 = load float, float addrspace(1)* %579, align 4, !tbaa !14, !amdgpu.noclobber !5
  %581 = fmul contract float %575, %580
  %582 = fadd contract float %570, %581
  %583 = or i32 %521, 5
  %584 = add nsw i32 %583, %33
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds float, float addrspace(1)* %0, i64 %585
  %587 = load float, float addrspace(1)* %586, align 4, !tbaa !14, !amdgpu.noclobber !5
  %588 = mul nsw i32 %583, %5
  %589 = add nsw i32 %588, %26
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds float, float addrspace(1)* %3, i64 %590
  %592 = load float, float addrspace(1)* %591, align 4, !tbaa !14, !amdgpu.noclobber !5
  %593 = fmul contract float %587, %592
  %594 = fadd contract float %582, %593
  %595 = or i32 %521, 6
  %596 = add nsw i32 %595, %33
  %597 = sext i32 %596 to i64
  %598 = getelementptr inbounds float, float addrspace(1)* %0, i64 %597
  %599 = load float, float addrspace(1)* %598, align 4, !tbaa !14, !amdgpu.noclobber !5
  %600 = mul nsw i32 %595, %5
  %601 = add nsw i32 %600, %26
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds float, float addrspace(1)* %3, i64 %602
  %604 = load float, float addrspace(1)* %603, align 4, !tbaa !14, !amdgpu.noclobber !5
  %605 = fmul contract float %599, %604
  %606 = fadd contract float %594, %605
  %607 = or i32 %521, 7
  %608 = add nsw i32 %607, %33
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds float, float addrspace(1)* %0, i64 %609
  %611 = load float, float addrspace(1)* %610, align 4, !tbaa !14, !amdgpu.noclobber !5
  %612 = mul nsw i32 %607, %5
  %613 = add nsw i32 %612, %26
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds float, float addrspace(1)* %3, i64 %614
  %616 = load float, float addrspace(1)* %615, align 4, !tbaa !14, !amdgpu.noclobber !5
  %617 = fmul contract float %611, %616
  %618 = fadd contract float %606, %617
  %619 = add nuw nsw i32 %521, 8
  %620 = add i32 %523, 8
  %621 = icmp eq i32 %620, %37
  br i1 %621, label %491, label %520, !llvm.loop !19

622:                                              ; preds = %480, %47, %514
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
