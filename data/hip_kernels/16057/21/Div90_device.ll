; ModuleID = '../data/hip_kernels/16057/21/main.cu'
source_filename = "../data/hip_kernels/16057/21/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [25 x i8] c"Index : %d %d dan %d %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z5Div90PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #1 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %14, %23
  %25 = icmp sgt i32 %2, 1
  br i1 %25, label %26, label %48

26:                                               ; preds = %5
  %27 = and i32 %24, 1
  %28 = icmp eq i32 %27, 0
  %29 = add i32 %24, %2
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = sext i32 %24 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = add i32 %29, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = add nuw nsw i32 %24, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 24
  %42 = bitcast i8 addrspace(4)* %41 to i64 addrspace(4)*
  %43 = zext i32 %29 to i64
  %44 = zext i32 %24 to i64
  %45 = zext i32 %34 to i64
  %46 = zext i32 %37 to i64
  %47 = add i32 %2, -2
  br label %49

48:                                               ; preds = %542, %5
  ret void

49:                                               ; preds = %26, %542
  %50 = phi i32 [ 0, %26 ], [ %53, %542 ]
  %51 = mul nsw i32 %50, %2
  %52 = icmp slt i32 %24, %51
  %53 = add nuw nsw i32 %50, 1
  br i1 %52, label %542, label %54

54:                                               ; preds = %49
  %55 = mul nsw i32 %53, %2
  %56 = add nsw i32 %55, -1
  %57 = icmp slt i32 %24, %56
  %58 = and i1 %28, %57
  br i1 %58, label %59, label %542

59:                                               ; preds = %54
  %60 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %61 = mul nsw i32 %60, %2
  %62 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %64
  %66 = atomicrmw add i32 addrspace(1)* %65, i32 1 syncscope("agent-one-as") monotonic, align 4
  %67 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %68 = mul nsw i32 %67, %2
  %69 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %73 = atomicrmw add i32 addrspace(1)* %72, i32 1 syncscope("agent-one-as") monotonic, align 4
  %74 = load i64, i64 addrspace(4)* %42, align 8, !tbaa !11
  %75 = inttoptr i64 %74 to i8 addrspace(1)*
  %76 = addrspacecast i8 addrspace(1)* %75 to i8*
  %77 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %76, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %78 = extractelement <2 x i64> %77, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %79, label %83

79:                                               ; preds = %59
  %80 = and i64 %78, -225
  %81 = or i64 %80, 32
  %82 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %76, i64 noundef %81, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %524

83:                                               ; preds = %59
  %84 = and i64 %78, 2
  %85 = and i64 %78, -3
  %86 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %85, i64 0
  br label %87

87:                                               ; preds = %513, %83
  %88 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str, i64 0, i64 24) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([25 x i8]* addrspacecast ([25 x i8] addrspace(4)* @.str to [25 x i8]*) to i64)), i64 1))), %83 ], [ %521, %513 ]
  %89 = phi i8 addrspace(4)* [ getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str, i64 0, i64 0), %83 ], [ %522, %513 ]
  %90 = phi <2 x i64> [ %86, %83 ], [ %520, %513 ]
  %91 = icmp ugt i64 %88, 56
  %92 = extractelement <2 x i64> %90, i64 0
  %93 = or i64 %92, %84
  %94 = insertelement <2 x i64> poison, i64 %93, i64 0
  %95 = select i1 %91, <2 x i64> %90, <2 x i64> %94
  %96 = tail call i64 @llvm.umin.i64(i64 %88, i64 56)
  %97 = trunc i64 %96 to i32
  %98 = extractelement <2 x i64> %95, i64 0
  %99 = icmp ugt i32 %97, 7
  br i1 %99, label %102, label %100

100:                                              ; preds = %87
  %101 = icmp eq i32 %97, 0
  br i1 %101, label %155, label %142

102:                                              ; preds = %87
  %103 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !15
  %104 = zext i8 %103 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 1
  %106 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !15
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 8
  %109 = or i64 %108, %104
  %110 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 2
  %111 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !15
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 16
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 3
  %116 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !15
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 24
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 4
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !15
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 32
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 5
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !15
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 40
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 6
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !15
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 48
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 7
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !15
  %137 = zext i8 %136 to i64
  %138 = shl nuw i64 %137, 56
  %139 = or i64 %134, %138
  %140 = add nsw i32 %97, -8
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 8
  br label %155

142:                                              ; preds = %100, %142
  %143 = phi i32 [ %153, %142 ], [ 0, %100 ]
  %144 = phi i64 [ %152, %142 ], [ 0, %100 ]
  %145 = zext i32 %143 to i64
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 %145
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !15
  %148 = zext i8 %147 to i64
  %149 = shl i32 %143, 3
  %150 = zext i32 %149 to i64
  %151 = shl nuw i64 %148, %150
  %152 = or i64 %151, %144
  %153 = add nuw nsw i32 %143, 1
  %154 = icmp eq i32 %153, %97
  br i1 %154, label %155, label %142, !llvm.loop !16

155:                                              ; preds = %142, %102, %100
  %156 = phi i8 addrspace(4)* [ %141, %102 ], [ %89, %100 ], [ %89, %142 ]
  %157 = phi i32 [ %140, %102 ], [ 0, %100 ], [ 0, %142 ]
  %158 = phi i64 [ %139, %102 ], [ 0, %100 ], [ %152, %142 ]
  %159 = icmp ugt i32 %157, 7
  br i1 %159, label %162, label %160

160:                                              ; preds = %155
  %161 = icmp eq i32 %157, 0
  br i1 %161, label %215, label %202

162:                                              ; preds = %155
  %163 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !15
  %164 = zext i8 %163 to i64
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 1
  %166 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !15
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 8
  %169 = or i64 %168, %164
  %170 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 2
  %171 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !15
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 16
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 3
  %176 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !15
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 24
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 4
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !15
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 32
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 5
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !15
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 40
  %189 = or i64 %184, %188
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 6
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !15
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 48
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 7
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !15
  %197 = zext i8 %196 to i64
  %198 = shl nuw i64 %197, 56
  %199 = or i64 %194, %198
  %200 = add nsw i32 %157, -8
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 8
  br label %215

202:                                              ; preds = %160, %202
  %203 = phi i32 [ %213, %202 ], [ 0, %160 ]
  %204 = phi i64 [ %212, %202 ], [ 0, %160 ]
  %205 = zext i32 %203 to i64
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 %205
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !15
  %208 = zext i8 %207 to i64
  %209 = shl i32 %203, 3
  %210 = zext i32 %209 to i64
  %211 = shl nuw i64 %208, %210
  %212 = or i64 %211, %204
  %213 = add nuw nsw i32 %203, 1
  %214 = icmp eq i32 %213, %157
  br i1 %214, label %215, label %202

215:                                              ; preds = %202, %162, %160
  %216 = phi i8 addrspace(4)* [ %201, %162 ], [ %156, %160 ], [ %156, %202 ]
  %217 = phi i32 [ %200, %162 ], [ 0, %160 ], [ 0, %202 ]
  %218 = phi i64 [ %199, %162 ], [ 0, %160 ], [ %212, %202 ]
  %219 = icmp ugt i32 %217, 7
  br i1 %219, label %222, label %220

220:                                              ; preds = %215
  %221 = icmp eq i32 %217, 0
  br i1 %221, label %275, label %262

222:                                              ; preds = %215
  %223 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !15
  %224 = zext i8 %223 to i64
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 1
  %226 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !15
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 8
  %229 = or i64 %228, %224
  %230 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 2
  %231 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !15
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 16
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 3
  %236 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !15
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 24
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 4
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !15
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 32
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 5
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !15
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 40
  %249 = or i64 %244, %248
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 6
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !15
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 48
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 7
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !15
  %257 = zext i8 %256 to i64
  %258 = shl nuw i64 %257, 56
  %259 = or i64 %254, %258
  %260 = add nsw i32 %217, -8
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 8
  br label %275

262:                                              ; preds = %220, %262
  %263 = phi i32 [ %273, %262 ], [ 0, %220 ]
  %264 = phi i64 [ %272, %262 ], [ 0, %220 ]
  %265 = zext i32 %263 to i64
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 %265
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !15
  %268 = zext i8 %267 to i64
  %269 = shl i32 %263, 3
  %270 = zext i32 %269 to i64
  %271 = shl nuw i64 %268, %270
  %272 = or i64 %271, %264
  %273 = add nuw nsw i32 %263, 1
  %274 = icmp eq i32 %273, %217
  br i1 %274, label %275, label %262

275:                                              ; preds = %262, %222, %220
  %276 = phi i8 addrspace(4)* [ %261, %222 ], [ %216, %220 ], [ %216, %262 ]
  %277 = phi i32 [ %260, %222 ], [ 0, %220 ], [ 0, %262 ]
  %278 = phi i64 [ %259, %222 ], [ 0, %220 ], [ %272, %262 ]
  %279 = icmp ugt i32 %277, 7
  br i1 %279, label %282, label %280

280:                                              ; preds = %275
  %281 = icmp eq i32 %277, 0
  br i1 %281, label %335, label %322

282:                                              ; preds = %275
  %283 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !15
  %284 = zext i8 %283 to i64
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 1
  %286 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !15
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 8
  %289 = or i64 %288, %284
  %290 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 2
  %291 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !15
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 16
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 3
  %296 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !15
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 24
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 4
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !15
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 32
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 5
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !15
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 40
  %309 = or i64 %304, %308
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 6
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !15
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 48
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 7
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !15
  %317 = zext i8 %316 to i64
  %318 = shl nuw i64 %317, 56
  %319 = or i64 %314, %318
  %320 = add nsw i32 %277, -8
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 8
  br label %335

322:                                              ; preds = %280, %322
  %323 = phi i32 [ %333, %322 ], [ 0, %280 ]
  %324 = phi i64 [ %332, %322 ], [ 0, %280 ]
  %325 = zext i32 %323 to i64
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 %325
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !15
  %328 = zext i8 %327 to i64
  %329 = shl i32 %323, 3
  %330 = zext i32 %329 to i64
  %331 = shl nuw i64 %328, %330
  %332 = or i64 %331, %324
  %333 = add nuw nsw i32 %323, 1
  %334 = icmp eq i32 %333, %277
  br i1 %334, label %335, label %322

335:                                              ; preds = %322, %282, %280
  %336 = phi i8 addrspace(4)* [ %321, %282 ], [ %276, %280 ], [ %276, %322 ]
  %337 = phi i32 [ %320, %282 ], [ 0, %280 ], [ 0, %322 ]
  %338 = phi i64 [ %319, %282 ], [ 0, %280 ], [ %332, %322 ]
  %339 = icmp ugt i32 %337, 7
  br i1 %339, label %342, label %340

340:                                              ; preds = %335
  %341 = icmp eq i32 %337, 0
  br i1 %341, label %395, label %382

342:                                              ; preds = %335
  %343 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !15
  %344 = zext i8 %343 to i64
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 1
  %346 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !15
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 8
  %349 = or i64 %348, %344
  %350 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 2
  %351 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !15
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 16
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 3
  %356 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !15
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 24
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 4
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !15
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 32
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 5
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !15
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 40
  %369 = or i64 %364, %368
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 6
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !15
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 48
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 7
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !15
  %377 = zext i8 %376 to i64
  %378 = shl nuw i64 %377, 56
  %379 = or i64 %374, %378
  %380 = add nsw i32 %337, -8
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 8
  br label %395

382:                                              ; preds = %340, %382
  %383 = phi i32 [ %393, %382 ], [ 0, %340 ]
  %384 = phi i64 [ %392, %382 ], [ 0, %340 ]
  %385 = zext i32 %383 to i64
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 %385
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !15
  %388 = zext i8 %387 to i64
  %389 = shl i32 %383, 3
  %390 = zext i32 %389 to i64
  %391 = shl nuw i64 %388, %390
  %392 = or i64 %391, %384
  %393 = add nuw nsw i32 %383, 1
  %394 = icmp eq i32 %393, %337
  br i1 %394, label %395, label %382

395:                                              ; preds = %382, %342, %340
  %396 = phi i8 addrspace(4)* [ %381, %342 ], [ %336, %340 ], [ %336, %382 ]
  %397 = phi i32 [ %380, %342 ], [ 0, %340 ], [ 0, %382 ]
  %398 = phi i64 [ %379, %342 ], [ 0, %340 ], [ %392, %382 ]
  %399 = icmp ugt i32 %397, 7
  br i1 %399, label %402, label %400

400:                                              ; preds = %395
  %401 = icmp eq i32 %397, 0
  br i1 %401, label %455, label %442

402:                                              ; preds = %395
  %403 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !15
  %404 = zext i8 %403 to i64
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 1
  %406 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !15
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 8
  %409 = or i64 %408, %404
  %410 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 2
  %411 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !15
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 16
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 3
  %416 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !15
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 24
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 4
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !15
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 32
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 5
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !15
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 40
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 6
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !15
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 48
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 7
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !15
  %437 = zext i8 %436 to i64
  %438 = shl nuw i64 %437, 56
  %439 = or i64 %434, %438
  %440 = add nsw i32 %397, -8
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 8
  br label %455

442:                                              ; preds = %400, %442
  %443 = phi i32 [ %453, %442 ], [ 0, %400 ]
  %444 = phi i64 [ %452, %442 ], [ 0, %400 ]
  %445 = zext i32 %443 to i64
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 %445
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !15
  %448 = zext i8 %447 to i64
  %449 = shl i32 %443, 3
  %450 = zext i32 %449 to i64
  %451 = shl nuw i64 %448, %450
  %452 = or i64 %451, %444
  %453 = add nuw nsw i32 %443, 1
  %454 = icmp eq i32 %453, %397
  br i1 %454, label %455, label %442

455:                                              ; preds = %442, %402, %400
  %456 = phi i8 addrspace(4)* [ %441, %402 ], [ %396, %400 ], [ %396, %442 ]
  %457 = phi i32 [ %440, %402 ], [ 0, %400 ], [ 0, %442 ]
  %458 = phi i64 [ %439, %402 ], [ 0, %400 ], [ %452, %442 ]
  %459 = icmp ugt i32 %457, 7
  br i1 %459, label %462, label %460

460:                                              ; preds = %455
  %461 = icmp eq i32 %457, 0
  br i1 %461, label %513, label %500

462:                                              ; preds = %455
  %463 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !15
  %464 = zext i8 %463 to i64
  %465 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 1
  %466 = load i8, i8 addrspace(4)* %465, align 1, !tbaa !15
  %467 = zext i8 %466 to i64
  %468 = shl nuw nsw i64 %467, 8
  %469 = or i64 %468, %464
  %470 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 2
  %471 = load i8, i8 addrspace(4)* %470, align 1, !tbaa !15
  %472 = zext i8 %471 to i64
  %473 = shl nuw nsw i64 %472, 16
  %474 = or i64 %469, %473
  %475 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 3
  %476 = load i8, i8 addrspace(4)* %475, align 1, !tbaa !15
  %477 = zext i8 %476 to i64
  %478 = shl nuw nsw i64 %477, 24
  %479 = or i64 %474, %478
  %480 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 4
  %481 = load i8, i8 addrspace(4)* %480, align 1, !tbaa !15
  %482 = zext i8 %481 to i64
  %483 = shl nuw nsw i64 %482, 32
  %484 = or i64 %479, %483
  %485 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 5
  %486 = load i8, i8 addrspace(4)* %485, align 1, !tbaa !15
  %487 = zext i8 %486 to i64
  %488 = shl nuw nsw i64 %487, 40
  %489 = or i64 %484, %488
  %490 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 6
  %491 = load i8, i8 addrspace(4)* %490, align 1, !tbaa !15
  %492 = zext i8 %491 to i64
  %493 = shl nuw nsw i64 %492, 48
  %494 = or i64 %489, %493
  %495 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 7
  %496 = load i8, i8 addrspace(4)* %495, align 1, !tbaa !15
  %497 = zext i8 %496 to i64
  %498 = shl nuw i64 %497, 56
  %499 = or i64 %494, %498
  br label %513

500:                                              ; preds = %460, %500
  %501 = phi i32 [ %511, %500 ], [ 0, %460 ]
  %502 = phi i64 [ %510, %500 ], [ 0, %460 ]
  %503 = zext i32 %501 to i64
  %504 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 %503
  %505 = load i8, i8 addrspace(4)* %504, align 1, !tbaa !15
  %506 = zext i8 %505 to i64
  %507 = shl i32 %501, 3
  %508 = zext i32 %507 to i64
  %509 = shl nuw i64 %506, %508
  %510 = or i64 %509, %502
  %511 = add nuw nsw i32 %501, 1
  %512 = icmp eq i32 %511, %457
  br i1 %512, label %513, label %500

513:                                              ; preds = %500, %462, %460
  %514 = phi i64 [ %499, %462 ], [ 0, %460 ], [ %510, %500 ]
  %515 = shl nuw nsw i64 %96, 2
  %516 = add nuw nsw i64 %515, 28
  %517 = and i64 %516, 480
  %518 = and i64 %98, -225
  %519 = or i64 %518, %517
  %520 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %76, i64 noundef %519, i64 noundef %158, i64 noundef %218, i64 noundef %278, i64 noundef %338, i64 noundef %398, i64 noundef %458, i64 noundef %514) #10
  %521 = sub i64 %88, %96
  %522 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 %96
  %523 = icmp eq i64 %521, 0
  br i1 %523, label %524, label %87

524:                                              ; preds = %513, %79
  %525 = phi <2 x i64> [ %82, %79 ], [ %520, %513 ]
  %526 = extractelement <2 x i64> %525, i64 0
  %527 = and i64 %526, -225
  %528 = or i64 %527, 32
  %529 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %76, i64 noundef %528, i64 noundef %43, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %530 = extractelement <2 x i64> %529, i64 0
  %531 = and i64 %530, -225
  %532 = or i64 %531, 32
  %533 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %76, i64 noundef %532, i64 noundef %44, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %534 = extractelement <2 x i64> %533, i64 0
  %535 = and i64 %534, -225
  %536 = or i64 %535, 32
  %537 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %76, i64 noundef %536, i64 noundef %45, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %538 = extractelement <2 x i64> %537, i64 0
  %539 = and i64 %538, -227
  %540 = or i64 %539, 34
  %541 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %76, i64 noundef %540, i64 noundef %46, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %542

542:                                              ; preds = %49, %54, %524
  %543 = icmp eq i32 %50, %47
  br i1 %543, label %48, label %49, !llvm.loop !18
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
