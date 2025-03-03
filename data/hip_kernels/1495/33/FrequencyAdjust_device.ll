; ModuleID = '../data/hip_kernels/1495/33/main.cu'
source_filename = "../data/hip_kernels/1495/33/main.cu"
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

$_ZL15FrequencyAdjustPiPfS0_S_iiii = comdat any

@.str = private unnamed_addr addrspace(4) constant [35 x i8] c"Frequency \E8\BD\89\E6\8F\9B\E7\9A\84\E5\9C\B0\E6\96\B9\E6\9C\89\E5\95\8F\E9\A1\8C\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define amdgpu_kernel void @_ZL15FrequencyAdjustPiPfS0_S_iiii(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #1 comdat {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !4
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !13, !invariant.load !14
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %9
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 20
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !15
  %27 = getelementptr i8, i8 addrspace(4)* %10, i64 8
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = udiv i32 %26, %30
  %32 = mul i32 %31, %30
  %33 = icmp ugt i32 %26, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %37 = add i32 %23, %36
  %38 = mul i32 %35, %37
  %39 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %40 = add i32 %38, %39
  %41 = mul i32 %40, %17
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %43 = add i32 %41, %42
  %44 = mul nsw i32 %6, %5
  %45 = mul nsw i32 %44, %7
  %46 = icmp slt i32 %43, %45
  br i1 %46, label %500, label %47

47:                                               ; preds = %8
  %48 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 24
  %50 = bitcast i8 addrspace(4)* %49 to i64 addrspace(4)*
  %51 = load i64, i64 addrspace(4)* %50, align 8, !tbaa !17
  %52 = inttoptr i64 %51 to i8 addrspace(1)*
  %53 = addrspacecast i8 addrspace(1)* %52 to i8*
  %54 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %55 = extractelement <2 x i64> %54, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %56, label %60

56:                                               ; preds = %47
  %57 = and i64 %55, -227
  %58 = or i64 %57, 34
  %59 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %58, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %544

60:                                               ; preds = %47
  %61 = and i64 %55, -3
  %62 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %61, i64 0
  br label %63

63:                                               ; preds = %489, %60
  %64 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str, i64 0, i64 34) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([35 x i8]* addrspacecast ([35 x i8] addrspace(4)* @.str to [35 x i8]*) to i64)), i64 1))), %60 ], [ %497, %489 ]
  %65 = phi i8 addrspace(4)* [ getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str, i64 0, i64 0), %60 ], [ %498, %489 ]
  %66 = phi <2 x i64> [ %62, %60 ], [ %496, %489 ]
  %67 = icmp ugt i64 %64, 56
  %68 = extractelement <2 x i64> %66, i64 0
  %69 = or i64 %68, 2
  %70 = insertelement <2 x i64> poison, i64 %69, i64 0
  %71 = select i1 %67, <2 x i64> %66, <2 x i64> %70
  %72 = tail call i64 @llvm.umin.i64(i64 %64, i64 56)
  %73 = trunc i64 %72 to i32
  %74 = extractelement <2 x i64> %71, i64 0
  %75 = icmp ugt i32 %73, 7
  br i1 %75, label %78, label %76

76:                                               ; preds = %63
  %77 = icmp eq i32 %73, 0
  br i1 %77, label %131, label %118

78:                                               ; preds = %63
  %79 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !18
  %80 = zext i8 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 1
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !18
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 8
  %85 = or i64 %84, %80
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 2
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !18
  %88 = zext i8 %87 to i64
  %89 = shl nuw nsw i64 %88, 16
  %90 = or i64 %85, %89
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 3
  %92 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !18
  %93 = zext i8 %92 to i64
  %94 = shl nuw nsw i64 %93, 24
  %95 = or i64 %90, %94
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 4
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !18
  %98 = zext i8 %97 to i64
  %99 = shl nuw nsw i64 %98, 32
  %100 = or i64 %95, %99
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 5
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !18
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 40
  %105 = or i64 %100, %104
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 6
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !18
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 48
  %110 = or i64 %105, %109
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 7
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !18
  %113 = zext i8 %112 to i64
  %114 = shl nuw i64 %113, 56
  %115 = or i64 %110, %114
  %116 = add nsw i32 %73, -8
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 8
  br label %131

118:                                              ; preds = %76, %118
  %119 = phi i32 [ %129, %118 ], [ 0, %76 ]
  %120 = phi i64 [ %128, %118 ], [ 0, %76 ]
  %121 = zext i32 %119 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 %121
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !18
  %124 = zext i8 %123 to i64
  %125 = shl i32 %119, 3
  %126 = zext i32 %125 to i64
  %127 = shl nuw i64 %124, %126
  %128 = or i64 %127, %120
  %129 = add nuw nsw i32 %119, 1
  %130 = icmp eq i32 %129, %73
  br i1 %130, label %131, label %118, !llvm.loop !19

131:                                              ; preds = %118, %78, %76
  %132 = phi i8 addrspace(4)* [ %117, %78 ], [ %65, %76 ], [ %65, %118 ]
  %133 = phi i32 [ %116, %78 ], [ 0, %76 ], [ 0, %118 ]
  %134 = phi i64 [ %115, %78 ], [ 0, %76 ], [ %128, %118 ]
  %135 = icmp ugt i32 %133, 7
  br i1 %135, label %138, label %136

136:                                              ; preds = %131
  %137 = icmp eq i32 %133, 0
  br i1 %137, label %191, label %178

138:                                              ; preds = %131
  %139 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !18
  %140 = zext i8 %139 to i64
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 1
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !18
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 8
  %145 = or i64 %144, %140
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 2
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !18
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 16
  %150 = or i64 %145, %149
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 3
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !18
  %153 = zext i8 %152 to i64
  %154 = shl nuw nsw i64 %153, 24
  %155 = or i64 %150, %154
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 4
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !18
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 32
  %160 = or i64 %155, %159
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 5
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !18
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 40
  %165 = or i64 %160, %164
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 6
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !18
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 48
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 7
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !18
  %173 = zext i8 %172 to i64
  %174 = shl nuw i64 %173, 56
  %175 = or i64 %170, %174
  %176 = add nsw i32 %133, -8
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 8
  br label %191

178:                                              ; preds = %136, %178
  %179 = phi i32 [ %189, %178 ], [ 0, %136 ]
  %180 = phi i64 [ %188, %178 ], [ 0, %136 ]
  %181 = zext i32 %179 to i64
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %132, i64 %181
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !18
  %184 = zext i8 %183 to i64
  %185 = shl i32 %179, 3
  %186 = zext i32 %185 to i64
  %187 = shl nuw i64 %184, %186
  %188 = or i64 %187, %180
  %189 = add nuw nsw i32 %179, 1
  %190 = icmp eq i32 %189, %133
  br i1 %190, label %191, label %178

191:                                              ; preds = %178, %138, %136
  %192 = phi i8 addrspace(4)* [ %177, %138 ], [ %132, %136 ], [ %132, %178 ]
  %193 = phi i32 [ %176, %138 ], [ 0, %136 ], [ 0, %178 ]
  %194 = phi i64 [ %175, %138 ], [ 0, %136 ], [ %188, %178 ]
  %195 = icmp ugt i32 %193, 7
  br i1 %195, label %198, label %196

196:                                              ; preds = %191
  %197 = icmp eq i32 %193, 0
  br i1 %197, label %251, label %238

198:                                              ; preds = %191
  %199 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !18
  %200 = zext i8 %199 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 1
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !18
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 8
  %205 = or i64 %204, %200
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 2
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !18
  %208 = zext i8 %207 to i64
  %209 = shl nuw nsw i64 %208, 16
  %210 = or i64 %205, %209
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 3
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !18
  %213 = zext i8 %212 to i64
  %214 = shl nuw nsw i64 %213, 24
  %215 = or i64 %210, %214
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 4
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !18
  %218 = zext i8 %217 to i64
  %219 = shl nuw nsw i64 %218, 32
  %220 = or i64 %215, %219
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 5
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !18
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 40
  %225 = or i64 %220, %224
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 6
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !18
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 48
  %230 = or i64 %225, %229
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 7
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !18
  %233 = zext i8 %232 to i64
  %234 = shl nuw i64 %233, 56
  %235 = or i64 %230, %234
  %236 = add nsw i32 %193, -8
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 8
  br label %251

238:                                              ; preds = %196, %238
  %239 = phi i32 [ %249, %238 ], [ 0, %196 ]
  %240 = phi i64 [ %248, %238 ], [ 0, %196 ]
  %241 = zext i32 %239 to i64
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %192, i64 %241
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !18
  %244 = zext i8 %243 to i64
  %245 = shl i32 %239, 3
  %246 = zext i32 %245 to i64
  %247 = shl nuw i64 %244, %246
  %248 = or i64 %247, %240
  %249 = add nuw nsw i32 %239, 1
  %250 = icmp eq i32 %249, %193
  br i1 %250, label %251, label %238

251:                                              ; preds = %238, %198, %196
  %252 = phi i8 addrspace(4)* [ %237, %198 ], [ %192, %196 ], [ %192, %238 ]
  %253 = phi i32 [ %236, %198 ], [ 0, %196 ], [ 0, %238 ]
  %254 = phi i64 [ %235, %198 ], [ 0, %196 ], [ %248, %238 ]
  %255 = icmp ugt i32 %253, 7
  br i1 %255, label %258, label %256

256:                                              ; preds = %251
  %257 = icmp eq i32 %253, 0
  br i1 %257, label %311, label %298

258:                                              ; preds = %251
  %259 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !18
  %260 = zext i8 %259 to i64
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 1
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !18
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 8
  %265 = or i64 %264, %260
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 2
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !18
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 16
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 3
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !18
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 24
  %275 = or i64 %270, %274
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 4
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !18
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 32
  %280 = or i64 %275, %279
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 5
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !18
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 40
  %285 = or i64 %280, %284
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 6
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !18
  %288 = zext i8 %287 to i64
  %289 = shl nuw nsw i64 %288, 48
  %290 = or i64 %285, %289
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 7
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !18
  %293 = zext i8 %292 to i64
  %294 = shl nuw i64 %293, 56
  %295 = or i64 %290, %294
  %296 = add nsw i32 %253, -8
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 8
  br label %311

298:                                              ; preds = %256, %298
  %299 = phi i32 [ %309, %298 ], [ 0, %256 ]
  %300 = phi i64 [ %308, %298 ], [ 0, %256 ]
  %301 = zext i32 %299 to i64
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %252, i64 %301
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !18
  %304 = zext i8 %303 to i64
  %305 = shl i32 %299, 3
  %306 = zext i32 %305 to i64
  %307 = shl nuw i64 %304, %306
  %308 = or i64 %307, %300
  %309 = add nuw nsw i32 %299, 1
  %310 = icmp eq i32 %309, %253
  br i1 %310, label %311, label %298

311:                                              ; preds = %298, %258, %256
  %312 = phi i8 addrspace(4)* [ %297, %258 ], [ %252, %256 ], [ %252, %298 ]
  %313 = phi i32 [ %296, %258 ], [ 0, %256 ], [ 0, %298 ]
  %314 = phi i64 [ %295, %258 ], [ 0, %256 ], [ %308, %298 ]
  %315 = icmp ugt i32 %313, 7
  br i1 %315, label %318, label %316

316:                                              ; preds = %311
  %317 = icmp eq i32 %313, 0
  br i1 %317, label %371, label %358

318:                                              ; preds = %311
  %319 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !18
  %320 = zext i8 %319 to i64
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 1
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !18
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 8
  %325 = or i64 %324, %320
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 2
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !18
  %328 = zext i8 %327 to i64
  %329 = shl nuw nsw i64 %328, 16
  %330 = or i64 %325, %329
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 3
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !18
  %333 = zext i8 %332 to i64
  %334 = shl nuw nsw i64 %333, 24
  %335 = or i64 %330, %334
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 4
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !18
  %338 = zext i8 %337 to i64
  %339 = shl nuw nsw i64 %338, 32
  %340 = or i64 %335, %339
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 5
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !18
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 40
  %345 = or i64 %340, %344
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 6
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !18
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 48
  %350 = or i64 %345, %349
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 7
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !18
  %353 = zext i8 %352 to i64
  %354 = shl nuw i64 %353, 56
  %355 = or i64 %350, %354
  %356 = add nsw i32 %313, -8
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 8
  br label %371

358:                                              ; preds = %316, %358
  %359 = phi i32 [ %369, %358 ], [ 0, %316 ]
  %360 = phi i64 [ %368, %358 ], [ 0, %316 ]
  %361 = zext i32 %359 to i64
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %312, i64 %361
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !18
  %364 = zext i8 %363 to i64
  %365 = shl i32 %359, 3
  %366 = zext i32 %365 to i64
  %367 = shl nuw i64 %364, %366
  %368 = or i64 %367, %360
  %369 = add nuw nsw i32 %359, 1
  %370 = icmp eq i32 %369, %313
  br i1 %370, label %371, label %358

371:                                              ; preds = %358, %318, %316
  %372 = phi i8 addrspace(4)* [ %357, %318 ], [ %312, %316 ], [ %312, %358 ]
  %373 = phi i32 [ %356, %318 ], [ 0, %316 ], [ 0, %358 ]
  %374 = phi i64 [ %355, %318 ], [ 0, %316 ], [ %368, %358 ]
  %375 = icmp ugt i32 %373, 7
  br i1 %375, label %378, label %376

376:                                              ; preds = %371
  %377 = icmp eq i32 %373, 0
  br i1 %377, label %431, label %418

378:                                              ; preds = %371
  %379 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !18
  %380 = zext i8 %379 to i64
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 1
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !18
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 8
  %385 = or i64 %384, %380
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 2
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !18
  %388 = zext i8 %387 to i64
  %389 = shl nuw nsw i64 %388, 16
  %390 = or i64 %385, %389
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 3
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !18
  %393 = zext i8 %392 to i64
  %394 = shl nuw nsw i64 %393, 24
  %395 = or i64 %390, %394
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 4
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !18
  %398 = zext i8 %397 to i64
  %399 = shl nuw nsw i64 %398, 32
  %400 = or i64 %395, %399
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 5
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !18
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 40
  %405 = or i64 %400, %404
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 6
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !18
  %408 = zext i8 %407 to i64
  %409 = shl nuw nsw i64 %408, 48
  %410 = or i64 %405, %409
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 7
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !18
  %413 = zext i8 %412 to i64
  %414 = shl nuw i64 %413, 56
  %415 = or i64 %410, %414
  %416 = add nsw i32 %373, -8
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 8
  br label %431

418:                                              ; preds = %376, %418
  %419 = phi i32 [ %429, %418 ], [ 0, %376 ]
  %420 = phi i64 [ %428, %418 ], [ 0, %376 ]
  %421 = zext i32 %419 to i64
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %372, i64 %421
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !18
  %424 = zext i8 %423 to i64
  %425 = shl i32 %419, 3
  %426 = zext i32 %425 to i64
  %427 = shl nuw i64 %424, %426
  %428 = or i64 %427, %420
  %429 = add nuw nsw i32 %419, 1
  %430 = icmp eq i32 %429, %373
  br i1 %430, label %431, label %418

431:                                              ; preds = %418, %378, %376
  %432 = phi i8 addrspace(4)* [ %417, %378 ], [ %372, %376 ], [ %372, %418 ]
  %433 = phi i32 [ %416, %378 ], [ 0, %376 ], [ 0, %418 ]
  %434 = phi i64 [ %415, %378 ], [ 0, %376 ], [ %428, %418 ]
  %435 = icmp ugt i32 %433, 7
  br i1 %435, label %438, label %436

436:                                              ; preds = %431
  %437 = icmp eq i32 %433, 0
  br i1 %437, label %489, label %476

438:                                              ; preds = %431
  %439 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !18
  %440 = zext i8 %439 to i64
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %432, i64 1
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !18
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 8
  %445 = or i64 %444, %440
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %432, i64 2
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !18
  %448 = zext i8 %447 to i64
  %449 = shl nuw nsw i64 %448, 16
  %450 = or i64 %445, %449
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %432, i64 3
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !18
  %453 = zext i8 %452 to i64
  %454 = shl nuw nsw i64 %453, 24
  %455 = or i64 %450, %454
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %432, i64 4
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !18
  %458 = zext i8 %457 to i64
  %459 = shl nuw nsw i64 %458, 32
  %460 = or i64 %455, %459
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %432, i64 5
  %462 = load i8, i8 addrspace(4)* %461, align 1, !tbaa !18
  %463 = zext i8 %462 to i64
  %464 = shl nuw nsw i64 %463, 40
  %465 = or i64 %460, %464
  %466 = getelementptr inbounds i8, i8 addrspace(4)* %432, i64 6
  %467 = load i8, i8 addrspace(4)* %466, align 1, !tbaa !18
  %468 = zext i8 %467 to i64
  %469 = shl nuw nsw i64 %468, 48
  %470 = or i64 %465, %469
  %471 = getelementptr inbounds i8, i8 addrspace(4)* %432, i64 7
  %472 = load i8, i8 addrspace(4)* %471, align 1, !tbaa !18
  %473 = zext i8 %472 to i64
  %474 = shl nuw i64 %473, 56
  %475 = or i64 %470, %474
  br label %489

476:                                              ; preds = %436, %476
  %477 = phi i32 [ %487, %476 ], [ 0, %436 ]
  %478 = phi i64 [ %486, %476 ], [ 0, %436 ]
  %479 = zext i32 %477 to i64
  %480 = getelementptr inbounds i8, i8 addrspace(4)* %432, i64 %479
  %481 = load i8, i8 addrspace(4)* %480, align 1, !tbaa !18
  %482 = zext i8 %481 to i64
  %483 = shl i32 %477, 3
  %484 = zext i32 %483 to i64
  %485 = shl nuw i64 %482, %484
  %486 = or i64 %485, %478
  %487 = add nuw nsw i32 %477, 1
  %488 = icmp eq i32 %487, %433
  br i1 %488, label %489, label %476

489:                                              ; preds = %476, %438, %436
  %490 = phi i64 [ %475, %438 ], [ 0, %436 ], [ %486, %476 ]
  %491 = shl nuw nsw i64 %72, 2
  %492 = add nuw nsw i64 %491, 28
  %493 = and i64 %492, 480
  %494 = and i64 %74, -225
  %495 = or i64 %494, %493
  %496 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %495, i64 noundef %134, i64 noundef %194, i64 noundef %254, i64 noundef %314, i64 noundef %374, i64 noundef %434, i64 noundef %490) #10
  %497 = sub i64 %64, %72
  %498 = getelementptr inbounds i8, i8 addrspace(4)* %65, i64 %72
  %499 = icmp eq i64 %497, 0
  br i1 %499, label %544, label %63

500:                                              ; preds = %8
  %501 = srem i32 %43, %7
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %502
  %504 = load i32, i32 addrspace(1)* %503, align 4, !tbaa !21, !amdgpu.noclobber !14
  %505 = icmp eq i32 %504, -1
  br i1 %505, label %510, label %506

506:                                              ; preds = %500
  %507 = icmp sge i32 %501, %4
  %508 = icmp eq i32 %501, 0
  %509 = or i1 %507, %508
  br i1 %509, label %510, label %513

510:                                              ; preds = %506, %500
  %511 = sext i32 %43 to i64
  %512 = getelementptr inbounds float, float addrspace(1)* %1, i64 %511
  store float 0.000000e+00, float addrspace(1)* %512, align 4, !tbaa !25
  br label %544

513:                                              ; preds = %506
  %514 = icmp slt i32 %504, 2
  %515 = add nsw i32 %504, -1
  %516 = select i1 %514, i32 0, i32 %515
  %517 = zext i32 %516 to i64
  %518 = sext i32 %43 to i64
  %519 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %518
  %520 = load i32, i32 addrspace(1)* %519, align 4, !tbaa !21, !amdgpu.noclobber !14
  %521 = add nsw i32 %43, -1
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %522
  %524 = load i32, i32 addrspace(1)* %523, align 4, !tbaa !21, !amdgpu.noclobber !14
  %525 = sub nsw i32 %520, %524
  %526 = sitofp i32 %525 to double
  %527 = sext i32 %504 to i64
  %528 = getelementptr inbounds float, float addrspace(1)* %2, i64 %527
  %529 = load float, float addrspace(1)* %528, align 4, !tbaa !25, !amdgpu.noclobber !14
  %530 = getelementptr inbounds float, float addrspace(1)* %2, i64 %517
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !25, !amdgpu.noclobber !14
  %532 = fsub contract float %529, %531
  %533 = fpext float %532 to double
  %534 = fdiv contract double %526, %533
  %535 = sitofp i32 %520 to double
  %536 = fpext float %529 to double
  %537 = fmul contract double %534, %536
  %538 = fsub contract double %535, %537
  %539 = sitofp i32 %501 to double
  %540 = fmul contract double %534, %539
  %541 = fadd contract double %540, %538
  %542 = fptrunc double %541 to float
  %543 = getelementptr inbounds float, float addrspace(1)* %1, i64 %518
  store float %542, float addrspace(1)* %543, align 4, !tbaa !25
  br label %544

544:                                              ; preds = %489, %56, %510, %513
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !27
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !28
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !17
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !17
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !17
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !17
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !17
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !17
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !17
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !17
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !28
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !29
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !28
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !28
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !27
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !27
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !27
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !30
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !32
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !30
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !32
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !17
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !27
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !30
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !32
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !27
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !27
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !33
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !32
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !27
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !27
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !27
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !28
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !17
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !17
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !17
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !17
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !17
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !17
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !17
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !17
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
  %110 = call i64 @llvm.read_register.i64(metadata !34) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !35
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !37
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !38
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !17
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !17
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !17
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !17
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !17
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !17
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !17
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !17
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !27
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !30
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !32
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !39
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !39
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !40
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !42
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !27
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !27
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !17
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !17
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !18
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !27
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !32
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !30
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !39
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !39
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !18
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 20}
!16 = !{i32 0, i32 1024}
!17 = !{!10, !10, i64 0}
!18 = !{!7, !7, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C++ TBAA"}
!25 = !{!26, !26, i64 0}
!26 = !{!"float", !23, i64 0}
!27 = !{!11, !11, i64 0}
!28 = !{!9, !9, i64 0}
!29 = !{i64 2662}
!30 = !{!31, !11, i64 0}
!31 = !{!"", !11, i64 0, !11, i64 8, !12, i64 16, !10, i64 24, !10, i64 32, !10, i64 40}
!32 = !{!31, !10, i64 40}
!33 = !{!31, !11, i64 8}
!34 = !{!"exec"}
!35 = !{!36, !9, i64 16}
!36 = !{!"", !10, i64 0, !10, i64 8, !9, i64 16, !9, i64 20}
!37 = !{!36, !10, i64 8}
!38 = !{!36, !9, i64 20}
!39 = !{!36, !10, i64 0}
!40 = !{!41, !10, i64 16}
!41 = !{!"amd_signal_s", !10, i64 0, !7, i64 8, !10, i64 16, !9, i64 24, !9, i64 28, !10, i64 32, !10, i64 40, !7, i64 48, !7, i64 56}
!42 = !{!41, !9, i64 24}
