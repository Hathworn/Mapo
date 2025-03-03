; ModuleID = '../data/hip_kernels/1495/14/main.cu'
source_filename = "../data/hip_kernels/1495/14/main.cu"
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

$_ZL14ShiftFinalDataPfS_iiii = comdat any

@.str = private unnamed_addr addrspace(4) constant [24 x i8] c"Shift Data \E6\9C\89\E9\8C\AF\E8\AA\A4!!\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define amdgpu_kernel void @_ZL14ShiftFinalDataPfS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #1 comdat {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 20
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 4, !tbaa !15
  %25 = getelementptr i8, i8 addrspace(4)* %8, i64 8
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !13, !invariant.load !14
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %24, %28
  %30 = mul i32 %29, %28
  %31 = icmp ugt i32 %24, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %35 = add i32 %21, %34
  %36 = mul i32 %33, %35
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %38 = add i32 %36, %37
  %39 = mul i32 %38, %15
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %41 = add i32 %39, %40
  %42 = icmp slt i32 %41, %5
  br i1 %42, label %496, label %43

43:                                               ; preds = %6
  %44 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %45 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 24
  %46 = bitcast i8 addrspace(4)* %45 to i64 addrspace(4)*
  %47 = load i64, i64 addrspace(4)* %46, align 8, !tbaa !17
  %48 = inttoptr i64 %47 to i8 addrspace(1)*
  %49 = addrspacecast i8 addrspace(1)* %48 to i8*
  %50 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %49, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %51 = extractelement <2 x i64> %50, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %52, label %56

52:                                               ; preds = %43
  %53 = and i64 %51, -227
  %54 = or i64 %53, 34
  %55 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %49, i64 noundef %54, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %518

56:                                               ; preds = %43
  %57 = and i64 %51, -3
  %58 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %57, i64 0
  br label %59

59:                                               ; preds = %485, %56
  %60 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str to [24 x i8]*) to i64)), i64 1))), %56 ], [ %493, %485 ]
  %61 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0), %56 ], [ %494, %485 ]
  %62 = phi <2 x i64> [ %58, %56 ], [ %492, %485 ]
  %63 = icmp ugt i64 %60, 56
  %64 = extractelement <2 x i64> %62, i64 0
  %65 = or i64 %64, 2
  %66 = insertelement <2 x i64> poison, i64 %65, i64 0
  %67 = select i1 %63, <2 x i64> %62, <2 x i64> %66
  %68 = tail call i64 @llvm.umin.i64(i64 %60, i64 56)
  %69 = trunc i64 %68 to i32
  %70 = extractelement <2 x i64> %67, i64 0
  %71 = icmp ugt i32 %69, 7
  br i1 %71, label %74, label %72

72:                                               ; preds = %59
  %73 = icmp eq i32 %69, 0
  br i1 %73, label %127, label %114

74:                                               ; preds = %59
  %75 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !18
  %76 = zext i8 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 1
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !18
  %79 = zext i8 %78 to i64
  %80 = shl nuw nsw i64 %79, 8
  %81 = or i64 %80, %76
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 2
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !18
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 16
  %86 = or i64 %81, %85
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 3
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !18
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 24
  %91 = or i64 %86, %90
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 4
  %93 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !18
  %94 = zext i8 %93 to i64
  %95 = shl nuw nsw i64 %94, 32
  %96 = or i64 %91, %95
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 5
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !18
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 40
  %101 = or i64 %96, %100
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 6
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !18
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 48
  %106 = or i64 %101, %105
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 7
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !18
  %109 = zext i8 %108 to i64
  %110 = shl nuw i64 %109, 56
  %111 = or i64 %106, %110
  %112 = add nsw i32 %69, -8
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 8
  br label %127

114:                                              ; preds = %72, %114
  %115 = phi i32 [ %125, %114 ], [ 0, %72 ]
  %116 = phi i64 [ %124, %114 ], [ 0, %72 ]
  %117 = zext i32 %115 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 %117
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !18
  %120 = zext i8 %119 to i64
  %121 = shl i32 %115, 3
  %122 = zext i32 %121 to i64
  %123 = shl nuw i64 %120, %122
  %124 = or i64 %123, %116
  %125 = add nuw nsw i32 %115, 1
  %126 = icmp eq i32 %125, %69
  br i1 %126, label %127, label %114, !llvm.loop !19

127:                                              ; preds = %114, %74, %72
  %128 = phi i8 addrspace(4)* [ %113, %74 ], [ %61, %72 ], [ %61, %114 ]
  %129 = phi i32 [ %112, %74 ], [ 0, %72 ], [ 0, %114 ]
  %130 = phi i64 [ %111, %74 ], [ 0, %72 ], [ %124, %114 ]
  %131 = icmp ugt i32 %129, 7
  br i1 %131, label %134, label %132

132:                                              ; preds = %127
  %133 = icmp eq i32 %129, 0
  br i1 %133, label %187, label %174

134:                                              ; preds = %127
  %135 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !18
  %136 = zext i8 %135 to i64
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 1
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !18
  %139 = zext i8 %138 to i64
  %140 = shl nuw nsw i64 %139, 8
  %141 = or i64 %140, %136
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 2
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !18
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 16
  %146 = or i64 %141, %145
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 3
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !18
  %149 = zext i8 %148 to i64
  %150 = shl nuw nsw i64 %149, 24
  %151 = or i64 %146, %150
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 4
  %153 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !18
  %154 = zext i8 %153 to i64
  %155 = shl nuw nsw i64 %154, 32
  %156 = or i64 %151, %155
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 5
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !18
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 40
  %161 = or i64 %156, %160
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 6
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !18
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 48
  %166 = or i64 %161, %165
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 7
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !18
  %169 = zext i8 %168 to i64
  %170 = shl nuw i64 %169, 56
  %171 = or i64 %166, %170
  %172 = add nsw i32 %129, -8
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 8
  br label %187

174:                                              ; preds = %132, %174
  %175 = phi i32 [ %185, %174 ], [ 0, %132 ]
  %176 = phi i64 [ %184, %174 ], [ 0, %132 ]
  %177 = zext i32 %175 to i64
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 %177
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !18
  %180 = zext i8 %179 to i64
  %181 = shl i32 %175, 3
  %182 = zext i32 %181 to i64
  %183 = shl nuw i64 %180, %182
  %184 = or i64 %183, %176
  %185 = add nuw nsw i32 %175, 1
  %186 = icmp eq i32 %185, %129
  br i1 %186, label %187, label %174

187:                                              ; preds = %174, %134, %132
  %188 = phi i8 addrspace(4)* [ %173, %134 ], [ %128, %132 ], [ %128, %174 ]
  %189 = phi i32 [ %172, %134 ], [ 0, %132 ], [ 0, %174 ]
  %190 = phi i64 [ %171, %134 ], [ 0, %132 ], [ %184, %174 ]
  %191 = icmp ugt i32 %189, 7
  br i1 %191, label %194, label %192

192:                                              ; preds = %187
  %193 = icmp eq i32 %189, 0
  br i1 %193, label %247, label %234

194:                                              ; preds = %187
  %195 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !18
  %196 = zext i8 %195 to i64
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 1
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !18
  %199 = zext i8 %198 to i64
  %200 = shl nuw nsw i64 %199, 8
  %201 = or i64 %200, %196
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 2
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !18
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 16
  %206 = or i64 %201, %205
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 3
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !18
  %209 = zext i8 %208 to i64
  %210 = shl nuw nsw i64 %209, 24
  %211 = or i64 %206, %210
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 4
  %213 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !18
  %214 = zext i8 %213 to i64
  %215 = shl nuw nsw i64 %214, 32
  %216 = or i64 %211, %215
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 5
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !18
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 40
  %221 = or i64 %216, %220
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 6
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !18
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 48
  %226 = or i64 %221, %225
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 7
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !18
  %229 = zext i8 %228 to i64
  %230 = shl nuw i64 %229, 56
  %231 = or i64 %226, %230
  %232 = add nsw i32 %189, -8
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 8
  br label %247

234:                                              ; preds = %192, %234
  %235 = phi i32 [ %245, %234 ], [ 0, %192 ]
  %236 = phi i64 [ %244, %234 ], [ 0, %192 ]
  %237 = zext i32 %235 to i64
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 %237
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !18
  %240 = zext i8 %239 to i64
  %241 = shl i32 %235, 3
  %242 = zext i32 %241 to i64
  %243 = shl nuw i64 %240, %242
  %244 = or i64 %243, %236
  %245 = add nuw nsw i32 %235, 1
  %246 = icmp eq i32 %245, %189
  br i1 %246, label %247, label %234

247:                                              ; preds = %234, %194, %192
  %248 = phi i8 addrspace(4)* [ %233, %194 ], [ %188, %192 ], [ %188, %234 ]
  %249 = phi i32 [ %232, %194 ], [ 0, %192 ], [ 0, %234 ]
  %250 = phi i64 [ %231, %194 ], [ 0, %192 ], [ %244, %234 ]
  %251 = icmp ugt i32 %249, 7
  br i1 %251, label %254, label %252

252:                                              ; preds = %247
  %253 = icmp eq i32 %249, 0
  br i1 %253, label %307, label %294

254:                                              ; preds = %247
  %255 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !18
  %256 = zext i8 %255 to i64
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 1
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !18
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 8
  %261 = or i64 %260, %256
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 2
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !18
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 16
  %266 = or i64 %261, %265
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 3
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !18
  %269 = zext i8 %268 to i64
  %270 = shl nuw nsw i64 %269, 24
  %271 = or i64 %266, %270
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 4
  %273 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !18
  %274 = zext i8 %273 to i64
  %275 = shl nuw nsw i64 %274, 32
  %276 = or i64 %271, %275
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 5
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !18
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 40
  %281 = or i64 %276, %280
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 6
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !18
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 48
  %286 = or i64 %281, %285
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 7
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !18
  %289 = zext i8 %288 to i64
  %290 = shl nuw i64 %289, 56
  %291 = or i64 %286, %290
  %292 = add nsw i32 %249, -8
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 8
  br label %307

294:                                              ; preds = %252, %294
  %295 = phi i32 [ %305, %294 ], [ 0, %252 ]
  %296 = phi i64 [ %304, %294 ], [ 0, %252 ]
  %297 = zext i32 %295 to i64
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 %297
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !18
  %300 = zext i8 %299 to i64
  %301 = shl i32 %295, 3
  %302 = zext i32 %301 to i64
  %303 = shl nuw i64 %300, %302
  %304 = or i64 %303, %296
  %305 = add nuw nsw i32 %295, 1
  %306 = icmp eq i32 %305, %249
  br i1 %306, label %307, label %294

307:                                              ; preds = %294, %254, %252
  %308 = phi i8 addrspace(4)* [ %293, %254 ], [ %248, %252 ], [ %248, %294 ]
  %309 = phi i32 [ %292, %254 ], [ 0, %252 ], [ 0, %294 ]
  %310 = phi i64 [ %291, %254 ], [ 0, %252 ], [ %304, %294 ]
  %311 = icmp ugt i32 %309, 7
  br i1 %311, label %314, label %312

312:                                              ; preds = %307
  %313 = icmp eq i32 %309, 0
  br i1 %313, label %367, label %354

314:                                              ; preds = %307
  %315 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !18
  %316 = zext i8 %315 to i64
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 1
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !18
  %319 = zext i8 %318 to i64
  %320 = shl nuw nsw i64 %319, 8
  %321 = or i64 %320, %316
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 2
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !18
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 16
  %326 = or i64 %321, %325
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 3
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !18
  %329 = zext i8 %328 to i64
  %330 = shl nuw nsw i64 %329, 24
  %331 = or i64 %326, %330
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 4
  %333 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !18
  %334 = zext i8 %333 to i64
  %335 = shl nuw nsw i64 %334, 32
  %336 = or i64 %331, %335
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 5
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !18
  %339 = zext i8 %338 to i64
  %340 = shl nuw nsw i64 %339, 40
  %341 = or i64 %336, %340
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 6
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !18
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 48
  %346 = or i64 %341, %345
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 7
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !18
  %349 = zext i8 %348 to i64
  %350 = shl nuw i64 %349, 56
  %351 = or i64 %346, %350
  %352 = add nsw i32 %309, -8
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 8
  br label %367

354:                                              ; preds = %312, %354
  %355 = phi i32 [ %365, %354 ], [ 0, %312 ]
  %356 = phi i64 [ %364, %354 ], [ 0, %312 ]
  %357 = zext i32 %355 to i64
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 %357
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !18
  %360 = zext i8 %359 to i64
  %361 = shl i32 %355, 3
  %362 = zext i32 %361 to i64
  %363 = shl nuw i64 %360, %362
  %364 = or i64 %363, %356
  %365 = add nuw nsw i32 %355, 1
  %366 = icmp eq i32 %365, %309
  br i1 %366, label %367, label %354

367:                                              ; preds = %354, %314, %312
  %368 = phi i8 addrspace(4)* [ %353, %314 ], [ %308, %312 ], [ %308, %354 ]
  %369 = phi i32 [ %352, %314 ], [ 0, %312 ], [ 0, %354 ]
  %370 = phi i64 [ %351, %314 ], [ 0, %312 ], [ %364, %354 ]
  %371 = icmp ugt i32 %369, 7
  br i1 %371, label %374, label %372

372:                                              ; preds = %367
  %373 = icmp eq i32 %369, 0
  br i1 %373, label %427, label %414

374:                                              ; preds = %367
  %375 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !18
  %376 = zext i8 %375 to i64
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 1
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !18
  %379 = zext i8 %378 to i64
  %380 = shl nuw nsw i64 %379, 8
  %381 = or i64 %380, %376
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 2
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !18
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 16
  %386 = or i64 %381, %385
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 3
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !18
  %389 = zext i8 %388 to i64
  %390 = shl nuw nsw i64 %389, 24
  %391 = or i64 %386, %390
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 4
  %393 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !18
  %394 = zext i8 %393 to i64
  %395 = shl nuw nsw i64 %394, 32
  %396 = or i64 %391, %395
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 5
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !18
  %399 = zext i8 %398 to i64
  %400 = shl nuw nsw i64 %399, 40
  %401 = or i64 %396, %400
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 6
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !18
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 48
  %406 = or i64 %401, %405
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 7
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !18
  %409 = zext i8 %408 to i64
  %410 = shl nuw i64 %409, 56
  %411 = or i64 %406, %410
  %412 = add nsw i32 %369, -8
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 8
  br label %427

414:                                              ; preds = %372, %414
  %415 = phi i32 [ %425, %414 ], [ 0, %372 ]
  %416 = phi i64 [ %424, %414 ], [ 0, %372 ]
  %417 = zext i32 %415 to i64
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 %417
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !18
  %420 = zext i8 %419 to i64
  %421 = shl i32 %415, 3
  %422 = zext i32 %421 to i64
  %423 = shl nuw i64 %420, %422
  %424 = or i64 %423, %416
  %425 = add nuw nsw i32 %415, 1
  %426 = icmp eq i32 %425, %369
  br i1 %426, label %427, label %414

427:                                              ; preds = %414, %374, %372
  %428 = phi i8 addrspace(4)* [ %413, %374 ], [ %368, %372 ], [ %368, %414 ]
  %429 = phi i32 [ %412, %374 ], [ 0, %372 ], [ 0, %414 ]
  %430 = phi i64 [ %411, %374 ], [ 0, %372 ], [ %424, %414 ]
  %431 = icmp ugt i32 %429, 7
  br i1 %431, label %434, label %432

432:                                              ; preds = %427
  %433 = icmp eq i32 %429, 0
  br i1 %433, label %485, label %472

434:                                              ; preds = %427
  %435 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !18
  %436 = zext i8 %435 to i64
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 1
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !18
  %439 = zext i8 %438 to i64
  %440 = shl nuw nsw i64 %439, 8
  %441 = or i64 %440, %436
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 2
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !18
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 16
  %446 = or i64 %441, %445
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 3
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !18
  %449 = zext i8 %448 to i64
  %450 = shl nuw nsw i64 %449, 24
  %451 = or i64 %446, %450
  %452 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 4
  %453 = load i8, i8 addrspace(4)* %452, align 1, !tbaa !18
  %454 = zext i8 %453 to i64
  %455 = shl nuw nsw i64 %454, 32
  %456 = or i64 %451, %455
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 5
  %458 = load i8, i8 addrspace(4)* %457, align 1, !tbaa !18
  %459 = zext i8 %458 to i64
  %460 = shl nuw nsw i64 %459, 40
  %461 = or i64 %456, %460
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 6
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !18
  %464 = zext i8 %463 to i64
  %465 = shl nuw nsw i64 %464, 48
  %466 = or i64 %461, %465
  %467 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 7
  %468 = load i8, i8 addrspace(4)* %467, align 1, !tbaa !18
  %469 = zext i8 %468 to i64
  %470 = shl nuw i64 %469, 56
  %471 = or i64 %466, %470
  br label %485

472:                                              ; preds = %432, %472
  %473 = phi i32 [ %483, %472 ], [ 0, %432 ]
  %474 = phi i64 [ %482, %472 ], [ 0, %432 ]
  %475 = zext i32 %473 to i64
  %476 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 %475
  %477 = load i8, i8 addrspace(4)* %476, align 1, !tbaa !18
  %478 = zext i8 %477 to i64
  %479 = shl i32 %473, 3
  %480 = zext i32 %479 to i64
  %481 = shl nuw i64 %478, %480
  %482 = or i64 %481, %474
  %483 = add nuw nsw i32 %473, 1
  %484 = icmp eq i32 %483, %429
  br i1 %484, label %485, label %472

485:                                              ; preds = %472, %434, %432
  %486 = phi i64 [ %471, %434 ], [ 0, %432 ], [ %482, %472 ]
  %487 = shl nuw nsw i64 %68, 2
  %488 = add nuw nsw i64 %487, 28
  %489 = and i64 %488, 480
  %490 = and i64 %70, -225
  %491 = or i64 %490, %489
  %492 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %49, i64 noundef %491, i64 noundef %130, i64 noundef %190, i64 noundef %250, i64 noundef %310, i64 noundef %370, i64 noundef %430, i64 noundef %486) #10
  %493 = sub i64 %60, %68
  %494 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 %68
  %495 = icmp eq i64 %493, 0
  br i1 %495, label %518, label %59

496:                                              ; preds = %6
  %497 = freeze i32 %41
  %498 = freeze i32 %4
  %499 = sdiv i32 %497, %498
  %500 = mul i32 %499, %498
  %501 = sub i32 %497, %500
  %502 = freeze i32 %2
  %503 = sdiv i32 %499, %502
  %504 = mul i32 %503, %502
  %505 = sub i32 %499, %504
  %506 = sdiv i32 %3, 2
  %507 = add nsw i32 %503, %506
  %508 = srem i32 %507, %3
  %509 = mul nsw i32 %508, %2
  %510 = add i32 %509, %505
  %511 = mul i32 %510, %4
  %512 = add nsw i32 %511, %501
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds float, float addrspace(1)* %0, i64 %513
  %515 = load float, float addrspace(1)* %514, align 4, !tbaa !21, !amdgpu.noclobber !14
  %516 = sext i32 %41 to i64
  %517 = getelementptr inbounds float, float addrspace(1)* %1, i64 %516
  store float %515, float addrspace(1)* %517, align 4, !tbaa !21
  br label %518

518:                                              ; preds = %485, %52, %496
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !25
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !26
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !26
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !27
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !26
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !26
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !25
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !28
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !28
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !28
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !30
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !31
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !30
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !26
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !17
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !17
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !17
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !17
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !17
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !17
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !17
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !17
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
  %110 = call i64 @llvm.read_register.i64(metadata !32) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !33
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !35
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !36
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !28
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !30
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !37
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !37
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !38
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !40
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !30
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !28
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !37
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !37
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
!22 = !{!"float", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C++ TBAA"}
!25 = !{!11, !11, i64 0}
!26 = !{!9, !9, i64 0}
!27 = !{i64 2662}
!28 = !{!29, !11, i64 0}
!29 = !{!"", !11, i64 0, !11, i64 8, !12, i64 16, !10, i64 24, !10, i64 32, !10, i64 40}
!30 = !{!29, !10, i64 40}
!31 = !{!29, !11, i64 8}
!32 = !{!"exec"}
!33 = !{!34, !9, i64 16}
!34 = !{!"", !10, i64 0, !10, i64 8, !9, i64 16, !9, i64 20}
!35 = !{!34, !10, i64 8}
!36 = !{!34, !9, i64 20}
!37 = !{!34, !10, i64 0}
!38 = !{!39, !10, i64 16}
!39 = !{!"amd_signal_s", !10, i64 0, !7, i64 8, !10, i64 16, !9, i64 24, !9, i64 28, !10, i64 32, !10, i64 40, !7, i64 48, !7, i64 56}
!40 = !{!39, !9, i64 24}
