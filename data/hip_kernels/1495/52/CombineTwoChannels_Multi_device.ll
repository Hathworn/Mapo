; ModuleID = '../data/hip_kernels/1495/52/main.cu'
source_filename = "../data/hip_kernels/1495/52/main.cu"
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

$_ZL24CombineTwoChannels_MultiPiS_iii = comdat any

@.str = private unnamed_addr addrspace(4) constant [32 x i8] c"Combine Two Channel \E6\9C\89 Error!\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define amdgpu_kernel void @_ZL24CombineTwoChannels_MultiPiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #1 comdat {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 20
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !15
  %24 = getelementptr i8, i8 addrspace(4)* %7, i64 8
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %23, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %34 = add i32 %20, %33
  %35 = mul i32 %32, %34
  %36 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %37 = add i32 %35, %36
  %38 = mul i32 %37, %14
  %39 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %40 = add i32 %38, %39
  %41 = mul i32 %4, %2
  %42 = mul i32 %41, %3
  %43 = icmp slt i32 %40, %42
  br i1 %43, label %497, label %44

44:                                               ; preds = %5
  %45 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %46 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 24
  %47 = bitcast i8 addrspace(4)* %46 to i64 addrspace(4)*
  %48 = load i64, i64 addrspace(4)* %47, align 8, !tbaa !17
  %49 = inttoptr i64 %48 to i8 addrspace(1)*
  %50 = addrspacecast i8 addrspace(1)* %49 to i8*
  %51 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %50, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %52 = extractelement <2 x i64> %51, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([32 x i8], [32 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %53, label %57

53:                                               ; preds = %44
  %54 = and i64 %52, -227
  %55 = or i64 %54, 34
  %56 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %50, i64 noundef %55, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %520

57:                                               ; preds = %44
  %58 = and i64 %52, -3
  %59 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %58, i64 0
  br label %60

60:                                               ; preds = %486, %57
  %61 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([32 x i8], [32 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([32 x i8], [32 x i8] addrspace(4)* @.str, i64 0, i64 31) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([32 x i8]* addrspacecast ([32 x i8] addrspace(4)* @.str to [32 x i8]*) to i64)), i64 1))), %57 ], [ %494, %486 ]
  %62 = phi i8 addrspace(4)* [ getelementptr inbounds ([32 x i8], [32 x i8] addrspace(4)* @.str, i64 0, i64 0), %57 ], [ %495, %486 ]
  %63 = phi <2 x i64> [ %59, %57 ], [ %493, %486 ]
  %64 = icmp ugt i64 %61, 56
  %65 = extractelement <2 x i64> %63, i64 0
  %66 = or i64 %65, 2
  %67 = insertelement <2 x i64> poison, i64 %66, i64 0
  %68 = select i1 %64, <2 x i64> %63, <2 x i64> %67
  %69 = tail call i64 @llvm.umin.i64(i64 %61, i64 56)
  %70 = trunc i64 %69 to i32
  %71 = extractelement <2 x i64> %68, i64 0
  %72 = icmp ugt i32 %70, 7
  br i1 %72, label %75, label %73

73:                                               ; preds = %60
  %74 = icmp eq i32 %70, 0
  br i1 %74, label %128, label %115

75:                                               ; preds = %60
  %76 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !18
  %77 = zext i8 %76 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 1
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !18
  %80 = zext i8 %79 to i64
  %81 = shl nuw nsw i64 %80, 8
  %82 = or i64 %81, %77
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 2
  %84 = load i8, i8 addrspace(4)* %83, align 1, !tbaa !18
  %85 = zext i8 %84 to i64
  %86 = shl nuw nsw i64 %85, 16
  %87 = or i64 %82, %86
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 3
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !18
  %90 = zext i8 %89 to i64
  %91 = shl nuw nsw i64 %90, 24
  %92 = or i64 %87, %91
  %93 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 4
  %94 = load i8, i8 addrspace(4)* %93, align 1, !tbaa !18
  %95 = zext i8 %94 to i64
  %96 = shl nuw nsw i64 %95, 32
  %97 = or i64 %92, %96
  %98 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 5
  %99 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !18
  %100 = zext i8 %99 to i64
  %101 = shl nuw nsw i64 %100, 40
  %102 = or i64 %97, %101
  %103 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 6
  %104 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !18
  %105 = zext i8 %104 to i64
  %106 = shl nuw nsw i64 %105, 48
  %107 = or i64 %102, %106
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 7
  %109 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !18
  %110 = zext i8 %109 to i64
  %111 = shl nuw i64 %110, 56
  %112 = or i64 %107, %111
  %113 = add nsw i32 %70, -8
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 8
  br label %128

115:                                              ; preds = %73, %115
  %116 = phi i32 [ %126, %115 ], [ 0, %73 ]
  %117 = phi i64 [ %125, %115 ], [ 0, %73 ]
  %118 = zext i32 %116 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 %118
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !18
  %121 = zext i8 %120 to i64
  %122 = shl i32 %116, 3
  %123 = zext i32 %122 to i64
  %124 = shl nuw i64 %121, %123
  %125 = or i64 %124, %117
  %126 = add nuw nsw i32 %116, 1
  %127 = icmp eq i32 %126, %70
  br i1 %127, label %128, label %115, !llvm.loop !19

128:                                              ; preds = %115, %75, %73
  %129 = phi i8 addrspace(4)* [ %114, %75 ], [ %62, %73 ], [ %62, %115 ]
  %130 = phi i32 [ %113, %75 ], [ 0, %73 ], [ 0, %115 ]
  %131 = phi i64 [ %112, %75 ], [ 0, %73 ], [ %125, %115 ]
  %132 = icmp ugt i32 %130, 7
  br i1 %132, label %135, label %133

133:                                              ; preds = %128
  %134 = icmp eq i32 %130, 0
  br i1 %134, label %188, label %175

135:                                              ; preds = %128
  %136 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !18
  %137 = zext i8 %136 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 1
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !18
  %140 = zext i8 %139 to i64
  %141 = shl nuw nsw i64 %140, 8
  %142 = or i64 %141, %137
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 2
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !18
  %145 = zext i8 %144 to i64
  %146 = shl nuw nsw i64 %145, 16
  %147 = or i64 %142, %146
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 3
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !18
  %150 = zext i8 %149 to i64
  %151 = shl nuw nsw i64 %150, 24
  %152 = or i64 %147, %151
  %153 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 4
  %154 = load i8, i8 addrspace(4)* %153, align 1, !tbaa !18
  %155 = zext i8 %154 to i64
  %156 = shl nuw nsw i64 %155, 32
  %157 = or i64 %152, %156
  %158 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 5
  %159 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !18
  %160 = zext i8 %159 to i64
  %161 = shl nuw nsw i64 %160, 40
  %162 = or i64 %157, %161
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 6
  %164 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !18
  %165 = zext i8 %164 to i64
  %166 = shl nuw nsw i64 %165, 48
  %167 = or i64 %162, %166
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 7
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !18
  %170 = zext i8 %169 to i64
  %171 = shl nuw i64 %170, 56
  %172 = or i64 %167, %171
  %173 = add nsw i32 %130, -8
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 8
  br label %188

175:                                              ; preds = %133, %175
  %176 = phi i32 [ %186, %175 ], [ 0, %133 ]
  %177 = phi i64 [ %185, %175 ], [ 0, %133 ]
  %178 = zext i32 %176 to i64
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %129, i64 %178
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !18
  %181 = zext i8 %180 to i64
  %182 = shl i32 %176, 3
  %183 = zext i32 %182 to i64
  %184 = shl nuw i64 %181, %183
  %185 = or i64 %184, %177
  %186 = add nuw nsw i32 %176, 1
  %187 = icmp eq i32 %186, %130
  br i1 %187, label %188, label %175

188:                                              ; preds = %175, %135, %133
  %189 = phi i8 addrspace(4)* [ %174, %135 ], [ %129, %133 ], [ %129, %175 ]
  %190 = phi i32 [ %173, %135 ], [ 0, %133 ], [ 0, %175 ]
  %191 = phi i64 [ %172, %135 ], [ 0, %133 ], [ %185, %175 ]
  %192 = icmp ugt i32 %190, 7
  br i1 %192, label %195, label %193

193:                                              ; preds = %188
  %194 = icmp eq i32 %190, 0
  br i1 %194, label %248, label %235

195:                                              ; preds = %188
  %196 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !18
  %197 = zext i8 %196 to i64
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 1
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !18
  %200 = zext i8 %199 to i64
  %201 = shl nuw nsw i64 %200, 8
  %202 = or i64 %201, %197
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 2
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !18
  %205 = zext i8 %204 to i64
  %206 = shl nuw nsw i64 %205, 16
  %207 = or i64 %202, %206
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 3
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !18
  %210 = zext i8 %209 to i64
  %211 = shl nuw nsw i64 %210, 24
  %212 = or i64 %207, %211
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 4
  %214 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !18
  %215 = zext i8 %214 to i64
  %216 = shl nuw nsw i64 %215, 32
  %217 = or i64 %212, %216
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 5
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !18
  %220 = zext i8 %219 to i64
  %221 = shl nuw nsw i64 %220, 40
  %222 = or i64 %217, %221
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 6
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !18
  %225 = zext i8 %224 to i64
  %226 = shl nuw nsw i64 %225, 48
  %227 = or i64 %222, %226
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 7
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !18
  %230 = zext i8 %229 to i64
  %231 = shl nuw i64 %230, 56
  %232 = or i64 %227, %231
  %233 = add nsw i32 %190, -8
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 8
  br label %248

235:                                              ; preds = %193, %235
  %236 = phi i32 [ %246, %235 ], [ 0, %193 ]
  %237 = phi i64 [ %245, %235 ], [ 0, %193 ]
  %238 = zext i32 %236 to i64
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %189, i64 %238
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !18
  %241 = zext i8 %240 to i64
  %242 = shl i32 %236, 3
  %243 = zext i32 %242 to i64
  %244 = shl nuw i64 %241, %243
  %245 = or i64 %244, %237
  %246 = add nuw nsw i32 %236, 1
  %247 = icmp eq i32 %246, %190
  br i1 %247, label %248, label %235

248:                                              ; preds = %235, %195, %193
  %249 = phi i8 addrspace(4)* [ %234, %195 ], [ %189, %193 ], [ %189, %235 ]
  %250 = phi i32 [ %233, %195 ], [ 0, %193 ], [ 0, %235 ]
  %251 = phi i64 [ %232, %195 ], [ 0, %193 ], [ %245, %235 ]
  %252 = icmp ugt i32 %250, 7
  br i1 %252, label %255, label %253

253:                                              ; preds = %248
  %254 = icmp eq i32 %250, 0
  br i1 %254, label %308, label %295

255:                                              ; preds = %248
  %256 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !18
  %257 = zext i8 %256 to i64
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 1
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !18
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 8
  %262 = or i64 %261, %257
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 2
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !18
  %265 = zext i8 %264 to i64
  %266 = shl nuw nsw i64 %265, 16
  %267 = or i64 %262, %266
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 3
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !18
  %270 = zext i8 %269 to i64
  %271 = shl nuw nsw i64 %270, 24
  %272 = or i64 %267, %271
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 4
  %274 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !18
  %275 = zext i8 %274 to i64
  %276 = shl nuw nsw i64 %275, 32
  %277 = or i64 %272, %276
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 5
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !18
  %280 = zext i8 %279 to i64
  %281 = shl nuw nsw i64 %280, 40
  %282 = or i64 %277, %281
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 6
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !18
  %285 = zext i8 %284 to i64
  %286 = shl nuw nsw i64 %285, 48
  %287 = or i64 %282, %286
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 7
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !18
  %290 = zext i8 %289 to i64
  %291 = shl nuw i64 %290, 56
  %292 = or i64 %287, %291
  %293 = add nsw i32 %250, -8
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 8
  br label %308

295:                                              ; preds = %253, %295
  %296 = phi i32 [ %306, %295 ], [ 0, %253 ]
  %297 = phi i64 [ %305, %295 ], [ 0, %253 ]
  %298 = zext i32 %296 to i64
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %249, i64 %298
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !18
  %301 = zext i8 %300 to i64
  %302 = shl i32 %296, 3
  %303 = zext i32 %302 to i64
  %304 = shl nuw i64 %301, %303
  %305 = or i64 %304, %297
  %306 = add nuw nsw i32 %296, 1
  %307 = icmp eq i32 %306, %250
  br i1 %307, label %308, label %295

308:                                              ; preds = %295, %255, %253
  %309 = phi i8 addrspace(4)* [ %294, %255 ], [ %249, %253 ], [ %249, %295 ]
  %310 = phi i32 [ %293, %255 ], [ 0, %253 ], [ 0, %295 ]
  %311 = phi i64 [ %292, %255 ], [ 0, %253 ], [ %305, %295 ]
  %312 = icmp ugt i32 %310, 7
  br i1 %312, label %315, label %313

313:                                              ; preds = %308
  %314 = icmp eq i32 %310, 0
  br i1 %314, label %368, label %355

315:                                              ; preds = %308
  %316 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !18
  %317 = zext i8 %316 to i64
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 1
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !18
  %320 = zext i8 %319 to i64
  %321 = shl nuw nsw i64 %320, 8
  %322 = or i64 %321, %317
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 2
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !18
  %325 = zext i8 %324 to i64
  %326 = shl nuw nsw i64 %325, 16
  %327 = or i64 %322, %326
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 3
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !18
  %330 = zext i8 %329 to i64
  %331 = shl nuw nsw i64 %330, 24
  %332 = or i64 %327, %331
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 4
  %334 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !18
  %335 = zext i8 %334 to i64
  %336 = shl nuw nsw i64 %335, 32
  %337 = or i64 %332, %336
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 5
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !18
  %340 = zext i8 %339 to i64
  %341 = shl nuw nsw i64 %340, 40
  %342 = or i64 %337, %341
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 6
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !18
  %345 = zext i8 %344 to i64
  %346 = shl nuw nsw i64 %345, 48
  %347 = or i64 %342, %346
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 7
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !18
  %350 = zext i8 %349 to i64
  %351 = shl nuw i64 %350, 56
  %352 = or i64 %347, %351
  %353 = add nsw i32 %310, -8
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 8
  br label %368

355:                                              ; preds = %313, %355
  %356 = phi i32 [ %366, %355 ], [ 0, %313 ]
  %357 = phi i64 [ %365, %355 ], [ 0, %313 ]
  %358 = zext i32 %356 to i64
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %309, i64 %358
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !18
  %361 = zext i8 %360 to i64
  %362 = shl i32 %356, 3
  %363 = zext i32 %362 to i64
  %364 = shl nuw i64 %361, %363
  %365 = or i64 %364, %357
  %366 = add nuw nsw i32 %356, 1
  %367 = icmp eq i32 %366, %310
  br i1 %367, label %368, label %355

368:                                              ; preds = %355, %315, %313
  %369 = phi i8 addrspace(4)* [ %354, %315 ], [ %309, %313 ], [ %309, %355 ]
  %370 = phi i32 [ %353, %315 ], [ 0, %313 ], [ 0, %355 ]
  %371 = phi i64 [ %352, %315 ], [ 0, %313 ], [ %365, %355 ]
  %372 = icmp ugt i32 %370, 7
  br i1 %372, label %375, label %373

373:                                              ; preds = %368
  %374 = icmp eq i32 %370, 0
  br i1 %374, label %428, label %415

375:                                              ; preds = %368
  %376 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !18
  %377 = zext i8 %376 to i64
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 1
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !18
  %380 = zext i8 %379 to i64
  %381 = shl nuw nsw i64 %380, 8
  %382 = or i64 %381, %377
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 2
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !18
  %385 = zext i8 %384 to i64
  %386 = shl nuw nsw i64 %385, 16
  %387 = or i64 %382, %386
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 3
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !18
  %390 = zext i8 %389 to i64
  %391 = shl nuw nsw i64 %390, 24
  %392 = or i64 %387, %391
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 4
  %394 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !18
  %395 = zext i8 %394 to i64
  %396 = shl nuw nsw i64 %395, 32
  %397 = or i64 %392, %396
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 5
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !18
  %400 = zext i8 %399 to i64
  %401 = shl nuw nsw i64 %400, 40
  %402 = or i64 %397, %401
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 6
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !18
  %405 = zext i8 %404 to i64
  %406 = shl nuw nsw i64 %405, 48
  %407 = or i64 %402, %406
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 7
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !18
  %410 = zext i8 %409 to i64
  %411 = shl nuw i64 %410, 56
  %412 = or i64 %407, %411
  %413 = add nsw i32 %370, -8
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 8
  br label %428

415:                                              ; preds = %373, %415
  %416 = phi i32 [ %426, %415 ], [ 0, %373 ]
  %417 = phi i64 [ %425, %415 ], [ 0, %373 ]
  %418 = zext i32 %416 to i64
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %369, i64 %418
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !18
  %421 = zext i8 %420 to i64
  %422 = shl i32 %416, 3
  %423 = zext i32 %422 to i64
  %424 = shl nuw i64 %421, %423
  %425 = or i64 %424, %417
  %426 = add nuw nsw i32 %416, 1
  %427 = icmp eq i32 %426, %370
  br i1 %427, label %428, label %415

428:                                              ; preds = %415, %375, %373
  %429 = phi i8 addrspace(4)* [ %414, %375 ], [ %369, %373 ], [ %369, %415 ]
  %430 = phi i32 [ %413, %375 ], [ 0, %373 ], [ 0, %415 ]
  %431 = phi i64 [ %412, %375 ], [ 0, %373 ], [ %425, %415 ]
  %432 = icmp ugt i32 %430, 7
  br i1 %432, label %435, label %433

433:                                              ; preds = %428
  %434 = icmp eq i32 %430, 0
  br i1 %434, label %486, label %473

435:                                              ; preds = %428
  %436 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !18
  %437 = zext i8 %436 to i64
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %429, i64 1
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !18
  %440 = zext i8 %439 to i64
  %441 = shl nuw nsw i64 %440, 8
  %442 = or i64 %441, %437
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %429, i64 2
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !18
  %445 = zext i8 %444 to i64
  %446 = shl nuw nsw i64 %445, 16
  %447 = or i64 %442, %446
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %429, i64 3
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !18
  %450 = zext i8 %449 to i64
  %451 = shl nuw nsw i64 %450, 24
  %452 = or i64 %447, %451
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %429, i64 4
  %454 = load i8, i8 addrspace(4)* %453, align 1, !tbaa !18
  %455 = zext i8 %454 to i64
  %456 = shl nuw nsw i64 %455, 32
  %457 = or i64 %452, %456
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %429, i64 5
  %459 = load i8, i8 addrspace(4)* %458, align 1, !tbaa !18
  %460 = zext i8 %459 to i64
  %461 = shl nuw nsw i64 %460, 40
  %462 = or i64 %457, %461
  %463 = getelementptr inbounds i8, i8 addrspace(4)* %429, i64 6
  %464 = load i8, i8 addrspace(4)* %463, align 1, !tbaa !18
  %465 = zext i8 %464 to i64
  %466 = shl nuw nsw i64 %465, 48
  %467 = or i64 %462, %466
  %468 = getelementptr inbounds i8, i8 addrspace(4)* %429, i64 7
  %469 = load i8, i8 addrspace(4)* %468, align 1, !tbaa !18
  %470 = zext i8 %469 to i64
  %471 = shl nuw i64 %470, 56
  %472 = or i64 %467, %471
  br label %486

473:                                              ; preds = %433, %473
  %474 = phi i32 [ %484, %473 ], [ 0, %433 ]
  %475 = phi i64 [ %483, %473 ], [ 0, %433 ]
  %476 = zext i32 %474 to i64
  %477 = getelementptr inbounds i8, i8 addrspace(4)* %429, i64 %476
  %478 = load i8, i8 addrspace(4)* %477, align 1, !tbaa !18
  %479 = zext i8 %478 to i64
  %480 = shl i32 %474, 3
  %481 = zext i32 %480 to i64
  %482 = shl nuw i64 %479, %481
  %483 = or i64 %482, %475
  %484 = add nuw nsw i32 %474, 1
  %485 = icmp eq i32 %484, %430
  br i1 %485, label %486, label %473

486:                                              ; preds = %473, %435, %433
  %487 = phi i64 [ %472, %435 ], [ 0, %433 ], [ %483, %473 ]
  %488 = shl nuw nsw i64 %69, 2
  %489 = add nuw nsw i64 %488, 28
  %490 = and i64 %489, 480
  %491 = and i64 %71, -225
  %492 = or i64 %491, %490
  %493 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %50, i64 noundef %492, i64 noundef %131, i64 noundef %191, i64 noundef %251, i64 noundef %311, i64 noundef %371, i64 noundef %431, i64 noundef %487) #10
  %494 = sub i64 %61, %69
  %495 = getelementptr inbounds i8, i8 addrspace(4)* %62, i64 %69
  %496 = icmp eq i64 %494, 0
  br i1 %496, label %520, label %60

497:                                              ; preds = %5
  %498 = shl nsw i32 %41, 1
  %499 = freeze i32 %40
  %500 = freeze i32 %498
  %501 = sdiv i32 %499, %500
  %502 = mul i32 %501, %500
  %503 = sub i32 %499, %502
  %504 = shl nsw i32 %501, 1
  %505 = mul nsw i32 %504, %498
  %506 = add nsw i32 %505, %503
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %507
  %509 = load i32, i32 addrspace(1)* %508, align 4, !tbaa !21, !amdgpu.noclobber !14
  %510 = add nuw nsw i32 %504, 1
  %511 = mul nsw i32 %510, %498
  %512 = add nsw i32 %511, %503
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %513
  %515 = load i32, i32 addrspace(1)* %514, align 4, !tbaa !21, !amdgpu.noclobber !14
  %516 = add nsw i32 %515, %509
  %517 = sdiv i32 %516, 2
  %518 = sext i32 %40 to i64
  %519 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %518
  store i32 %517, i32 addrspace(1)* %519, align 4, !tbaa !21
  br label %520

520:                                              ; preds = %486, %53, %497
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
!22 = !{!"int", !23, i64 0}
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
