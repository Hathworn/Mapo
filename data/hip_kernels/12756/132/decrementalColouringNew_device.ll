; ModuleID = '../data/hip_kernels/12756/132/main.cu'
source_filename = "../data/hip_kernels/12756/132/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [35 x i8] c"I am %d and I am deleting %d - %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z23decrementalColouringNewPiS_iiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #1 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %5
  br i1 %16, label %17, label %522

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = and i32 %15, 1
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 1, i32 -1
  %24 = add nsw i32 %23, %15
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %29 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 24
  %30 = bitcast i8 addrspace(4)* %29 to i64 addrspace(4)*
  %31 = load i64, i64 addrspace(4)* %30, align 8, !tbaa !11
  %32 = inttoptr i64 %31 to i8 addrspace(1)*
  %33 = addrspacecast i8 addrspace(1)* %32 to i8*
  %34 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %35 = extractelement <2 x i64> %34, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %36, label %40

36:                                               ; preds = %17
  %37 = and i64 %35, -225
  %38 = or i64 %37, 32
  %39 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef %38, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %481

40:                                               ; preds = %17
  %41 = and i64 %35, 2
  %42 = and i64 %35, -3
  %43 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %42, i64 0
  br label %44

44:                                               ; preds = %470, %40
  %45 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str, i64 0, i64 34) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([35 x i8]* addrspacecast ([35 x i8] addrspace(4)* @.str to [35 x i8]*) to i64)), i64 1))), %40 ], [ %478, %470 ]
  %46 = phi i8 addrspace(4)* [ getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str, i64 0, i64 0), %40 ], [ %479, %470 ]
  %47 = phi <2 x i64> [ %43, %40 ], [ %477, %470 ]
  %48 = icmp ugt i64 %45, 56
  %49 = extractelement <2 x i64> %47, i64 0
  %50 = or i64 %49, %41
  %51 = insertelement <2 x i64> poison, i64 %50, i64 0
  %52 = select i1 %48, <2 x i64> %47, <2 x i64> %51
  %53 = tail call i64 @llvm.umin.i64(i64 %45, i64 56)
  %54 = trunc i64 %53 to i32
  %55 = extractelement <2 x i64> %52, i64 0
  %56 = icmp ugt i32 %54, 7
  br i1 %56, label %59, label %57

57:                                               ; preds = %44
  %58 = icmp eq i32 %54, 0
  br i1 %58, label %112, label %99

59:                                               ; preds = %44
  %60 = load i8, i8 addrspace(4)* %46, align 1, !tbaa !15
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 1
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !15
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 8
  %66 = or i64 %65, %61
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 2
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !15
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 16
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 3
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !15
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 24
  %76 = or i64 %71, %75
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 4
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !15
  %79 = zext i8 %78 to i64
  %80 = shl nuw nsw i64 %79, 32
  %81 = or i64 %76, %80
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 5
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !15
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 40
  %86 = or i64 %81, %85
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 6
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !15
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 48
  %91 = or i64 %86, %90
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 7
  %93 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !15
  %94 = zext i8 %93 to i64
  %95 = shl nuw i64 %94, 56
  %96 = or i64 %91, %95
  %97 = add nsw i32 %54, -8
  %98 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 8
  br label %112

99:                                               ; preds = %57, %99
  %100 = phi i32 [ %110, %99 ], [ 0, %57 ]
  %101 = phi i64 [ %109, %99 ], [ 0, %57 ]
  %102 = zext i32 %100 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 %102
  %104 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !15
  %105 = zext i8 %104 to i64
  %106 = shl i32 %100, 3
  %107 = zext i32 %106 to i64
  %108 = shl nuw i64 %105, %107
  %109 = or i64 %108, %101
  %110 = add nuw nsw i32 %100, 1
  %111 = icmp eq i32 %110, %54
  br i1 %111, label %112, label %99, !llvm.loop !16

112:                                              ; preds = %99, %59, %57
  %113 = phi i8 addrspace(4)* [ %98, %59 ], [ %46, %57 ], [ %46, %99 ]
  %114 = phi i32 [ %97, %59 ], [ 0, %57 ], [ 0, %99 ]
  %115 = phi i64 [ %96, %59 ], [ 0, %57 ], [ %109, %99 ]
  %116 = icmp ugt i32 %114, 7
  br i1 %116, label %119, label %117

117:                                              ; preds = %112
  %118 = icmp eq i32 %114, 0
  br i1 %118, label %172, label %159

119:                                              ; preds = %112
  %120 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !15
  %121 = zext i8 %120 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 1
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !15
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 8
  %126 = or i64 %125, %121
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 2
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !15
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 16
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 3
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !15
  %134 = zext i8 %133 to i64
  %135 = shl nuw nsw i64 %134, 24
  %136 = or i64 %131, %135
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 4
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !15
  %139 = zext i8 %138 to i64
  %140 = shl nuw nsw i64 %139, 32
  %141 = or i64 %136, %140
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 5
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !15
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 40
  %146 = or i64 %141, %145
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 6
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !15
  %149 = zext i8 %148 to i64
  %150 = shl nuw nsw i64 %149, 48
  %151 = or i64 %146, %150
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 7
  %153 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !15
  %154 = zext i8 %153 to i64
  %155 = shl nuw i64 %154, 56
  %156 = or i64 %151, %155
  %157 = add nsw i32 %114, -8
  %158 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 8
  br label %172

159:                                              ; preds = %117, %159
  %160 = phi i32 [ %170, %159 ], [ 0, %117 ]
  %161 = phi i64 [ %169, %159 ], [ 0, %117 ]
  %162 = zext i32 %160 to i64
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 %162
  %164 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !15
  %165 = zext i8 %164 to i64
  %166 = shl i32 %160, 3
  %167 = zext i32 %166 to i64
  %168 = shl nuw i64 %165, %167
  %169 = or i64 %168, %161
  %170 = add nuw nsw i32 %160, 1
  %171 = icmp eq i32 %170, %114
  br i1 %171, label %172, label %159

172:                                              ; preds = %159, %119, %117
  %173 = phi i8 addrspace(4)* [ %158, %119 ], [ %113, %117 ], [ %113, %159 ]
  %174 = phi i32 [ %157, %119 ], [ 0, %117 ], [ 0, %159 ]
  %175 = phi i64 [ %156, %119 ], [ 0, %117 ], [ %169, %159 ]
  %176 = icmp ugt i32 %174, 7
  br i1 %176, label %179, label %177

177:                                              ; preds = %172
  %178 = icmp eq i32 %174, 0
  br i1 %178, label %232, label %219

179:                                              ; preds = %172
  %180 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !15
  %181 = zext i8 %180 to i64
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 1
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !15
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 8
  %186 = or i64 %185, %181
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 2
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !15
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 16
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 3
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !15
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 24
  %196 = or i64 %191, %195
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 4
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !15
  %199 = zext i8 %198 to i64
  %200 = shl nuw nsw i64 %199, 32
  %201 = or i64 %196, %200
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 5
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !15
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 40
  %206 = or i64 %201, %205
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 6
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !15
  %209 = zext i8 %208 to i64
  %210 = shl nuw nsw i64 %209, 48
  %211 = or i64 %206, %210
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 7
  %213 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !15
  %214 = zext i8 %213 to i64
  %215 = shl nuw i64 %214, 56
  %216 = or i64 %211, %215
  %217 = add nsw i32 %174, -8
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 8
  br label %232

219:                                              ; preds = %177, %219
  %220 = phi i32 [ %230, %219 ], [ 0, %177 ]
  %221 = phi i64 [ %229, %219 ], [ 0, %177 ]
  %222 = zext i32 %220 to i64
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %173, i64 %222
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !15
  %225 = zext i8 %224 to i64
  %226 = shl i32 %220, 3
  %227 = zext i32 %226 to i64
  %228 = shl nuw i64 %225, %227
  %229 = or i64 %228, %221
  %230 = add nuw nsw i32 %220, 1
  %231 = icmp eq i32 %230, %174
  br i1 %231, label %232, label %219

232:                                              ; preds = %219, %179, %177
  %233 = phi i8 addrspace(4)* [ %218, %179 ], [ %173, %177 ], [ %173, %219 ]
  %234 = phi i32 [ %217, %179 ], [ 0, %177 ], [ 0, %219 ]
  %235 = phi i64 [ %216, %179 ], [ 0, %177 ], [ %229, %219 ]
  %236 = icmp ugt i32 %234, 7
  br i1 %236, label %239, label %237

237:                                              ; preds = %232
  %238 = icmp eq i32 %234, 0
  br i1 %238, label %292, label %279

239:                                              ; preds = %232
  %240 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !15
  %241 = zext i8 %240 to i64
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 1
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !15
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 8
  %246 = or i64 %245, %241
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 2
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !15
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 16
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 3
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !15
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 24
  %256 = or i64 %251, %255
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 4
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !15
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 32
  %261 = or i64 %256, %260
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 5
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !15
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 40
  %266 = or i64 %261, %265
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 6
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !15
  %269 = zext i8 %268 to i64
  %270 = shl nuw nsw i64 %269, 48
  %271 = or i64 %266, %270
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 7
  %273 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !15
  %274 = zext i8 %273 to i64
  %275 = shl nuw i64 %274, 56
  %276 = or i64 %271, %275
  %277 = add nsw i32 %234, -8
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 8
  br label %292

279:                                              ; preds = %237, %279
  %280 = phi i32 [ %290, %279 ], [ 0, %237 ]
  %281 = phi i64 [ %289, %279 ], [ 0, %237 ]
  %282 = zext i32 %280 to i64
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %233, i64 %282
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !15
  %285 = zext i8 %284 to i64
  %286 = shl i32 %280, 3
  %287 = zext i32 %286 to i64
  %288 = shl nuw i64 %285, %287
  %289 = or i64 %288, %281
  %290 = add nuw nsw i32 %280, 1
  %291 = icmp eq i32 %290, %234
  br i1 %291, label %292, label %279

292:                                              ; preds = %279, %239, %237
  %293 = phi i8 addrspace(4)* [ %278, %239 ], [ %233, %237 ], [ %233, %279 ]
  %294 = phi i32 [ %277, %239 ], [ 0, %237 ], [ 0, %279 ]
  %295 = phi i64 [ %276, %239 ], [ 0, %237 ], [ %289, %279 ]
  %296 = icmp ugt i32 %294, 7
  br i1 %296, label %299, label %297

297:                                              ; preds = %292
  %298 = icmp eq i32 %294, 0
  br i1 %298, label %352, label %339

299:                                              ; preds = %292
  %300 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !15
  %301 = zext i8 %300 to i64
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 1
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !15
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 8
  %306 = or i64 %305, %301
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 2
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !15
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 16
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 3
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !15
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 24
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 4
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !15
  %319 = zext i8 %318 to i64
  %320 = shl nuw nsw i64 %319, 32
  %321 = or i64 %316, %320
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 5
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !15
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 40
  %326 = or i64 %321, %325
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 6
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !15
  %329 = zext i8 %328 to i64
  %330 = shl nuw nsw i64 %329, 48
  %331 = or i64 %326, %330
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 7
  %333 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !15
  %334 = zext i8 %333 to i64
  %335 = shl nuw i64 %334, 56
  %336 = or i64 %331, %335
  %337 = add nsw i32 %294, -8
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 8
  br label %352

339:                                              ; preds = %297, %339
  %340 = phi i32 [ %350, %339 ], [ 0, %297 ]
  %341 = phi i64 [ %349, %339 ], [ 0, %297 ]
  %342 = zext i32 %340 to i64
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %293, i64 %342
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !15
  %345 = zext i8 %344 to i64
  %346 = shl i32 %340, 3
  %347 = zext i32 %346 to i64
  %348 = shl nuw i64 %345, %347
  %349 = or i64 %348, %341
  %350 = add nuw nsw i32 %340, 1
  %351 = icmp eq i32 %350, %294
  br i1 %351, label %352, label %339

352:                                              ; preds = %339, %299, %297
  %353 = phi i8 addrspace(4)* [ %338, %299 ], [ %293, %297 ], [ %293, %339 ]
  %354 = phi i32 [ %337, %299 ], [ 0, %297 ], [ 0, %339 ]
  %355 = phi i64 [ %336, %299 ], [ 0, %297 ], [ %349, %339 ]
  %356 = icmp ugt i32 %354, 7
  br i1 %356, label %359, label %357

357:                                              ; preds = %352
  %358 = icmp eq i32 %354, 0
  br i1 %358, label %412, label %399

359:                                              ; preds = %352
  %360 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !15
  %361 = zext i8 %360 to i64
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 1
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !15
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 8
  %366 = or i64 %365, %361
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 2
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !15
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 16
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 3
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !15
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 24
  %376 = or i64 %371, %375
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 4
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !15
  %379 = zext i8 %378 to i64
  %380 = shl nuw nsw i64 %379, 32
  %381 = or i64 %376, %380
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 5
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !15
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 40
  %386 = or i64 %381, %385
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 6
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !15
  %389 = zext i8 %388 to i64
  %390 = shl nuw nsw i64 %389, 48
  %391 = or i64 %386, %390
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 7
  %393 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !15
  %394 = zext i8 %393 to i64
  %395 = shl nuw i64 %394, 56
  %396 = or i64 %391, %395
  %397 = add nsw i32 %354, -8
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 8
  br label %412

399:                                              ; preds = %357, %399
  %400 = phi i32 [ %410, %399 ], [ 0, %357 ]
  %401 = phi i64 [ %409, %399 ], [ 0, %357 ]
  %402 = zext i32 %400 to i64
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %353, i64 %402
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !15
  %405 = zext i8 %404 to i64
  %406 = shl i32 %400, 3
  %407 = zext i32 %406 to i64
  %408 = shl nuw i64 %405, %407
  %409 = or i64 %408, %401
  %410 = add nuw nsw i32 %400, 1
  %411 = icmp eq i32 %410, %354
  br i1 %411, label %412, label %399

412:                                              ; preds = %399, %359, %357
  %413 = phi i8 addrspace(4)* [ %398, %359 ], [ %353, %357 ], [ %353, %399 ]
  %414 = phi i32 [ %397, %359 ], [ 0, %357 ], [ 0, %399 ]
  %415 = phi i64 [ %396, %359 ], [ 0, %357 ], [ %409, %399 ]
  %416 = icmp ugt i32 %414, 7
  br i1 %416, label %419, label %417

417:                                              ; preds = %412
  %418 = icmp eq i32 %414, 0
  br i1 %418, label %470, label %457

419:                                              ; preds = %412
  %420 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !15
  %421 = zext i8 %420 to i64
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %413, i64 1
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !15
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 8
  %426 = or i64 %425, %421
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %413, i64 2
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !15
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 16
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %413, i64 3
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !15
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 24
  %436 = or i64 %431, %435
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %413, i64 4
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !15
  %439 = zext i8 %438 to i64
  %440 = shl nuw nsw i64 %439, 32
  %441 = or i64 %436, %440
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %413, i64 5
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !15
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 40
  %446 = or i64 %441, %445
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %413, i64 6
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !15
  %449 = zext i8 %448 to i64
  %450 = shl nuw nsw i64 %449, 48
  %451 = or i64 %446, %450
  %452 = getelementptr inbounds i8, i8 addrspace(4)* %413, i64 7
  %453 = load i8, i8 addrspace(4)* %452, align 1, !tbaa !15
  %454 = zext i8 %453 to i64
  %455 = shl nuw i64 %454, 56
  %456 = or i64 %451, %455
  br label %470

457:                                              ; preds = %417, %457
  %458 = phi i32 [ %468, %457 ], [ 0, %417 ]
  %459 = phi i64 [ %467, %457 ], [ 0, %417 ]
  %460 = zext i32 %458 to i64
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %413, i64 %460
  %462 = load i8, i8 addrspace(4)* %461, align 1, !tbaa !15
  %463 = zext i8 %462 to i64
  %464 = shl i32 %458, 3
  %465 = zext i32 %464 to i64
  %466 = shl nuw i64 %463, %465
  %467 = or i64 %466, %459
  %468 = add nuw nsw i32 %458, 1
  %469 = icmp eq i32 %468, %414
  br i1 %469, label %470, label %457

470:                                              ; preds = %457, %419, %417
  %471 = phi i64 [ %456, %419 ], [ 0, %417 ], [ %467, %457 ]
  %472 = shl nuw nsw i64 %53, 2
  %473 = add nuw nsw i64 %472, 28
  %474 = and i64 %473, 480
  %475 = and i64 %55, -225
  %476 = or i64 %475, %474
  %477 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef %476, i64 noundef %115, i64 noundef %175, i64 noundef %235, i64 noundef %295, i64 noundef %355, i64 noundef %415, i64 noundef %471) #10
  %478 = sub i64 %45, %53
  %479 = getelementptr inbounds i8, i8 addrspace(4)* %46, i64 %53
  %480 = icmp eq i64 %478, 0
  br i1 %480, label %481, label %44

481:                                              ; preds = %470, %36
  %482 = phi <2 x i64> [ %39, %36 ], [ %477, %470 ]
  %483 = extractelement <2 x i64> %482, i64 0
  %484 = zext i32 %15 to i64
  %485 = and i64 %483, -225
  %486 = or i64 %485, 32
  %487 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef %486, i64 noundef %484, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %488 = extractelement <2 x i64> %487, i64 0
  %489 = zext i32 %20 to i64
  %490 = and i64 %488, -225
  %491 = or i64 %490, 32
  %492 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef %491, i64 noundef %489, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %493 = extractelement <2 x i64> %492, i64 0
  %494 = zext i32 %27 to i64
  %495 = and i64 %493, -227
  %496 = or i64 %495, 34
  %497 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %33, i64 noundef %496, i64 noundef %494, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %498 = add nsw i32 %20, -1
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %499
  %501 = load i32, i32 addrspace(1)* %500, align 4, !tbaa !7
  %502 = icmp eq i32 %20, %2
  br i1 %502, label %503, label %505

503:                                              ; preds = %481
  %504 = shl nsw i32 %3, 1
  br label %509

505:                                              ; preds = %481
  %506 = sext i32 %20 to i64
  %507 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %506
  %508 = load i32, i32 addrspace(1)* %507, align 4, !tbaa !7
  br label %509

509:                                              ; preds = %505, %503
  %510 = phi i32 [ %504, %503 ], [ %508, %505 ]
  %511 = icmp slt i32 %501, %510
  br i1 %511, label %514, label %522

512:                                              ; preds = %514
  %513 = icmp slt i32 %520, %510
  br i1 %513, label %514, label %522, !llvm.loop !18

514:                                              ; preds = %509, %512
  %515 = phi i32 [ %520, %512 ], [ %501, %509 ]
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %516
  %518 = load i32, i32 addrspace(1)* %517, align 4, !tbaa !7
  %519 = icmp eq i32 %518, %27
  %520 = add nsw i32 %515, 1
  br i1 %519, label %521, label %512

521:                                              ; preds = %514
  store i32 0, i32 addrspace(1)* %517, align 4, !tbaa !7
  br label %522

522:                                              ; preds = %512, %509, %521, %6
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !20
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !22
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !11
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !11
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !11
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !11
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !11
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !11
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !11
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !11
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !22
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !22
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !28
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !28
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !11
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !28
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !29
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !28
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !22
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !11
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !11
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !11
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !11
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !11
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !11
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !11
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !11
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %110 = call i64 @llvm.read_register.i64(metadata !30) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !31
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !33
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !34
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !11
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !11
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !11
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !11
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !11
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !11
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !11
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !11
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !25
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !28
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !35
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !35
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !36
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !38
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !11
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !11
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !28
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !25
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !35
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !35
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!13, !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !13, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !13, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !21, i64 0}
!26 = !{!"", !21, i64 0, !21, i64 8, !27, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!27 = !{!"hsa_signal_s", !12, i64 0}
!28 = !{!26, !12, i64 40}
!29 = !{!26, !21, i64 8}
!30 = !{!"exec"}
!31 = !{!32, !23, i64 16}
!32 = !{!"", !12, i64 0, !12, i64 8, !23, i64 16, !23, i64 20}
!33 = !{!32, !12, i64 8}
!34 = !{!32, !23, i64 20}
!35 = !{!32, !12, i64 0}
!36 = !{!37, !12, i64 16}
!37 = !{!"amd_signal_s", !12, i64 0, !13, i64 8, !12, i64 16, !23, i64 24, !23, i64 28, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 56}
!38 = !{!37, !23, i64 24}
