; ModuleID = '../data/hip_kernels/17144/1/main.cu'
source_filename = "../data/hip_kernels/17144/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [12 x i8] c"%d->%d->%d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z12do_sum_mergePii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #1 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %9 = mul nuw nsw i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add nuw nsw i32 %9, %10
  %12 = icmp sgt i32 %1, 1
  br i1 %12, label %13, label %503

13:                                               ; preds = %2
  %14 = xor i32 %11, -1
  %15 = zext i32 %11 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 24
  %19 = bitcast i8 addrspace(4)* %18 to i64 addrspace(4)*
  br label %20

20:                                               ; preds = %13, %500
  %21 = phi i32 [ %1, %13 ], [ %501, %500 ]
  %22 = add nuw nsw i32 %21, 1
  %23 = lshr i32 %22, 1
  %24 = icmp ult i32 %11, %23
  br i1 %24, label %25, label %500

25:                                               ; preds = %20
  %26 = add i32 %21, %14
  %27 = icmp eq i32 %26, %11
  br i1 %27, label %500, label %28

28:                                               ; preds = %25
  %29 = sext i32 %26 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %32 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7
  %33 = add nsw i32 %32, %31
  store i32 %33, i32 addrspace(1)* %16, align 4, !tbaa !7
  %34 = load i64, i64 addrspace(4)* %19, align 8, !tbaa !11
  %35 = inttoptr i64 %34 to i8 addrspace(1)*
  %36 = addrspacecast i8 addrspace(1)* %35 to i8*
  %37 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %36, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %38 = extractelement <2 x i64> %37, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %39, label %43

39:                                               ; preds = %28
  %40 = and i64 %38, -225
  %41 = or i64 %40, 32
  %42 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %36, i64 noundef %41, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %484

43:                                               ; preds = %28
  %44 = and i64 %38, 2
  %45 = and i64 %38, -3
  %46 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %45, i64 0
  br label %47

47:                                               ; preds = %473, %43
  %48 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str, i64 0, i64 11) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([12 x i8]* addrspacecast ([12 x i8] addrspace(4)* @.str to [12 x i8]*) to i64)), i64 1))), %43 ], [ %481, %473 ]
  %49 = phi i8 addrspace(4)* [ getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str, i64 0, i64 0), %43 ], [ %482, %473 ]
  %50 = phi <2 x i64> [ %46, %43 ], [ %480, %473 ]
  %51 = icmp ugt i64 %48, 56
  %52 = extractelement <2 x i64> %50, i64 0
  %53 = or i64 %52, %44
  %54 = insertelement <2 x i64> poison, i64 %53, i64 0
  %55 = select i1 %51, <2 x i64> %50, <2 x i64> %54
  %56 = tail call i64 @llvm.umin.i64(i64 %48, i64 56)
  %57 = trunc i64 %56 to i32
  %58 = extractelement <2 x i64> %55, i64 0
  %59 = icmp ugt i32 %57, 7
  br i1 %59, label %62, label %60

60:                                               ; preds = %47
  %61 = icmp eq i32 %57, 0
  br i1 %61, label %115, label %102

62:                                               ; preds = %47
  %63 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !15
  %64 = zext i8 %63 to i64
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 1
  %66 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !15
  %67 = zext i8 %66 to i64
  %68 = shl nuw nsw i64 %67, 8
  %69 = or i64 %68, %64
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 2
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !15
  %72 = zext i8 %71 to i64
  %73 = shl nuw nsw i64 %72, 16
  %74 = or i64 %69, %73
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 3
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !15
  %77 = zext i8 %76 to i64
  %78 = shl nuw nsw i64 %77, 24
  %79 = or i64 %74, %78
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 4
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !15
  %82 = zext i8 %81 to i64
  %83 = shl nuw nsw i64 %82, 32
  %84 = or i64 %79, %83
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 5
  %86 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !15
  %87 = zext i8 %86 to i64
  %88 = shl nuw nsw i64 %87, 40
  %89 = or i64 %84, %88
  %90 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 6
  %91 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !15
  %92 = zext i8 %91 to i64
  %93 = shl nuw nsw i64 %92, 48
  %94 = or i64 %89, %93
  %95 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 7
  %96 = load i8, i8 addrspace(4)* %95, align 1, !tbaa !15
  %97 = zext i8 %96 to i64
  %98 = shl nuw i64 %97, 56
  %99 = or i64 %94, %98
  %100 = add nsw i32 %57, -8
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 8
  br label %115

102:                                              ; preds = %60, %102
  %103 = phi i32 [ %113, %102 ], [ 0, %60 ]
  %104 = phi i64 [ %112, %102 ], [ 0, %60 ]
  %105 = zext i32 %103 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 %105
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !15
  %108 = zext i8 %107 to i64
  %109 = shl i32 %103, 3
  %110 = zext i32 %109 to i64
  %111 = shl nuw i64 %108, %110
  %112 = or i64 %111, %104
  %113 = add nuw nsw i32 %103, 1
  %114 = icmp eq i32 %113, %57
  br i1 %114, label %115, label %102, !llvm.loop !16

115:                                              ; preds = %102, %62, %60
  %116 = phi i8 addrspace(4)* [ %101, %62 ], [ %49, %60 ], [ %49, %102 ]
  %117 = phi i32 [ %100, %62 ], [ 0, %60 ], [ 0, %102 ]
  %118 = phi i64 [ %99, %62 ], [ 0, %60 ], [ %112, %102 ]
  %119 = icmp ugt i32 %117, 7
  br i1 %119, label %122, label %120

120:                                              ; preds = %115
  %121 = icmp eq i32 %117, 0
  br i1 %121, label %175, label %162

122:                                              ; preds = %115
  %123 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !15
  %124 = zext i8 %123 to i64
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 1
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !15
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 8
  %129 = or i64 %128, %124
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 2
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !15
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 16
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 3
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !15
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 24
  %139 = or i64 %134, %138
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 4
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !15
  %142 = zext i8 %141 to i64
  %143 = shl nuw nsw i64 %142, 32
  %144 = or i64 %139, %143
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 5
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !15
  %147 = zext i8 %146 to i64
  %148 = shl nuw nsw i64 %147, 40
  %149 = or i64 %144, %148
  %150 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 6
  %151 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !15
  %152 = zext i8 %151 to i64
  %153 = shl nuw nsw i64 %152, 48
  %154 = or i64 %149, %153
  %155 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 7
  %156 = load i8, i8 addrspace(4)* %155, align 1, !tbaa !15
  %157 = zext i8 %156 to i64
  %158 = shl nuw i64 %157, 56
  %159 = or i64 %154, %158
  %160 = add nsw i32 %117, -8
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 8
  br label %175

162:                                              ; preds = %120, %162
  %163 = phi i32 [ %173, %162 ], [ 0, %120 ]
  %164 = phi i64 [ %172, %162 ], [ 0, %120 ]
  %165 = zext i32 %163 to i64
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 %165
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !15
  %168 = zext i8 %167 to i64
  %169 = shl i32 %163, 3
  %170 = zext i32 %169 to i64
  %171 = shl nuw i64 %168, %170
  %172 = or i64 %171, %164
  %173 = add nuw nsw i32 %163, 1
  %174 = icmp eq i32 %173, %117
  br i1 %174, label %175, label %162

175:                                              ; preds = %162, %122, %120
  %176 = phi i8 addrspace(4)* [ %161, %122 ], [ %116, %120 ], [ %116, %162 ]
  %177 = phi i32 [ %160, %122 ], [ 0, %120 ], [ 0, %162 ]
  %178 = phi i64 [ %159, %122 ], [ 0, %120 ], [ %172, %162 ]
  %179 = icmp ugt i32 %177, 7
  br i1 %179, label %182, label %180

180:                                              ; preds = %175
  %181 = icmp eq i32 %177, 0
  br i1 %181, label %235, label %222

182:                                              ; preds = %175
  %183 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !15
  %184 = zext i8 %183 to i64
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 1
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !15
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 8
  %189 = or i64 %188, %184
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 2
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !15
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 16
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 3
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !15
  %197 = zext i8 %196 to i64
  %198 = shl nuw nsw i64 %197, 24
  %199 = or i64 %194, %198
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 4
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !15
  %202 = zext i8 %201 to i64
  %203 = shl nuw nsw i64 %202, 32
  %204 = or i64 %199, %203
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 5
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !15
  %207 = zext i8 %206 to i64
  %208 = shl nuw nsw i64 %207, 40
  %209 = or i64 %204, %208
  %210 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 6
  %211 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !15
  %212 = zext i8 %211 to i64
  %213 = shl nuw nsw i64 %212, 48
  %214 = or i64 %209, %213
  %215 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 7
  %216 = load i8, i8 addrspace(4)* %215, align 1, !tbaa !15
  %217 = zext i8 %216 to i64
  %218 = shl nuw i64 %217, 56
  %219 = or i64 %214, %218
  %220 = add nsw i32 %177, -8
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 8
  br label %235

222:                                              ; preds = %180, %222
  %223 = phi i32 [ %233, %222 ], [ 0, %180 ]
  %224 = phi i64 [ %232, %222 ], [ 0, %180 ]
  %225 = zext i32 %223 to i64
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 %225
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !15
  %228 = zext i8 %227 to i64
  %229 = shl i32 %223, 3
  %230 = zext i32 %229 to i64
  %231 = shl nuw i64 %228, %230
  %232 = or i64 %231, %224
  %233 = add nuw nsw i32 %223, 1
  %234 = icmp eq i32 %233, %177
  br i1 %234, label %235, label %222

235:                                              ; preds = %222, %182, %180
  %236 = phi i8 addrspace(4)* [ %221, %182 ], [ %176, %180 ], [ %176, %222 ]
  %237 = phi i32 [ %220, %182 ], [ 0, %180 ], [ 0, %222 ]
  %238 = phi i64 [ %219, %182 ], [ 0, %180 ], [ %232, %222 ]
  %239 = icmp ugt i32 %237, 7
  br i1 %239, label %242, label %240

240:                                              ; preds = %235
  %241 = icmp eq i32 %237, 0
  br i1 %241, label %295, label %282

242:                                              ; preds = %235
  %243 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !15
  %244 = zext i8 %243 to i64
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 1
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !15
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 8
  %249 = or i64 %248, %244
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 2
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !15
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 16
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 3
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !15
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 24
  %259 = or i64 %254, %258
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 4
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !15
  %262 = zext i8 %261 to i64
  %263 = shl nuw nsw i64 %262, 32
  %264 = or i64 %259, %263
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 5
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !15
  %267 = zext i8 %266 to i64
  %268 = shl nuw nsw i64 %267, 40
  %269 = or i64 %264, %268
  %270 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 6
  %271 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !15
  %272 = zext i8 %271 to i64
  %273 = shl nuw nsw i64 %272, 48
  %274 = or i64 %269, %273
  %275 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 7
  %276 = load i8, i8 addrspace(4)* %275, align 1, !tbaa !15
  %277 = zext i8 %276 to i64
  %278 = shl nuw i64 %277, 56
  %279 = or i64 %274, %278
  %280 = add nsw i32 %237, -8
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 8
  br label %295

282:                                              ; preds = %240, %282
  %283 = phi i32 [ %293, %282 ], [ 0, %240 ]
  %284 = phi i64 [ %292, %282 ], [ 0, %240 ]
  %285 = zext i32 %283 to i64
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 %285
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !15
  %288 = zext i8 %287 to i64
  %289 = shl i32 %283, 3
  %290 = zext i32 %289 to i64
  %291 = shl nuw i64 %288, %290
  %292 = or i64 %291, %284
  %293 = add nuw nsw i32 %283, 1
  %294 = icmp eq i32 %293, %237
  br i1 %294, label %295, label %282

295:                                              ; preds = %282, %242, %240
  %296 = phi i8 addrspace(4)* [ %281, %242 ], [ %236, %240 ], [ %236, %282 ]
  %297 = phi i32 [ %280, %242 ], [ 0, %240 ], [ 0, %282 ]
  %298 = phi i64 [ %279, %242 ], [ 0, %240 ], [ %292, %282 ]
  %299 = icmp ugt i32 %297, 7
  br i1 %299, label %302, label %300

300:                                              ; preds = %295
  %301 = icmp eq i32 %297, 0
  br i1 %301, label %355, label %342

302:                                              ; preds = %295
  %303 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !15
  %304 = zext i8 %303 to i64
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 1
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !15
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 8
  %309 = or i64 %308, %304
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 2
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !15
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 16
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 3
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !15
  %317 = zext i8 %316 to i64
  %318 = shl nuw nsw i64 %317, 24
  %319 = or i64 %314, %318
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 4
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !15
  %322 = zext i8 %321 to i64
  %323 = shl nuw nsw i64 %322, 32
  %324 = or i64 %319, %323
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 5
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !15
  %327 = zext i8 %326 to i64
  %328 = shl nuw nsw i64 %327, 40
  %329 = or i64 %324, %328
  %330 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 6
  %331 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !15
  %332 = zext i8 %331 to i64
  %333 = shl nuw nsw i64 %332, 48
  %334 = or i64 %329, %333
  %335 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 7
  %336 = load i8, i8 addrspace(4)* %335, align 1, !tbaa !15
  %337 = zext i8 %336 to i64
  %338 = shl nuw i64 %337, 56
  %339 = or i64 %334, %338
  %340 = add nsw i32 %297, -8
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 8
  br label %355

342:                                              ; preds = %300, %342
  %343 = phi i32 [ %353, %342 ], [ 0, %300 ]
  %344 = phi i64 [ %352, %342 ], [ 0, %300 ]
  %345 = zext i32 %343 to i64
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 %345
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !15
  %348 = zext i8 %347 to i64
  %349 = shl i32 %343, 3
  %350 = zext i32 %349 to i64
  %351 = shl nuw i64 %348, %350
  %352 = or i64 %351, %344
  %353 = add nuw nsw i32 %343, 1
  %354 = icmp eq i32 %353, %297
  br i1 %354, label %355, label %342

355:                                              ; preds = %342, %302, %300
  %356 = phi i8 addrspace(4)* [ %341, %302 ], [ %296, %300 ], [ %296, %342 ]
  %357 = phi i32 [ %340, %302 ], [ 0, %300 ], [ 0, %342 ]
  %358 = phi i64 [ %339, %302 ], [ 0, %300 ], [ %352, %342 ]
  %359 = icmp ugt i32 %357, 7
  br i1 %359, label %362, label %360

360:                                              ; preds = %355
  %361 = icmp eq i32 %357, 0
  br i1 %361, label %415, label %402

362:                                              ; preds = %355
  %363 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !15
  %364 = zext i8 %363 to i64
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 1
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !15
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 8
  %369 = or i64 %368, %364
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 2
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !15
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 16
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 3
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !15
  %377 = zext i8 %376 to i64
  %378 = shl nuw nsw i64 %377, 24
  %379 = or i64 %374, %378
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 4
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !15
  %382 = zext i8 %381 to i64
  %383 = shl nuw nsw i64 %382, 32
  %384 = or i64 %379, %383
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 5
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !15
  %387 = zext i8 %386 to i64
  %388 = shl nuw nsw i64 %387, 40
  %389 = or i64 %384, %388
  %390 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 6
  %391 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !15
  %392 = zext i8 %391 to i64
  %393 = shl nuw nsw i64 %392, 48
  %394 = or i64 %389, %393
  %395 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 7
  %396 = load i8, i8 addrspace(4)* %395, align 1, !tbaa !15
  %397 = zext i8 %396 to i64
  %398 = shl nuw i64 %397, 56
  %399 = or i64 %394, %398
  %400 = add nsw i32 %357, -8
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 8
  br label %415

402:                                              ; preds = %360, %402
  %403 = phi i32 [ %413, %402 ], [ 0, %360 ]
  %404 = phi i64 [ %412, %402 ], [ 0, %360 ]
  %405 = zext i32 %403 to i64
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 %405
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !15
  %408 = zext i8 %407 to i64
  %409 = shl i32 %403, 3
  %410 = zext i32 %409 to i64
  %411 = shl nuw i64 %408, %410
  %412 = or i64 %411, %404
  %413 = add nuw nsw i32 %403, 1
  %414 = icmp eq i32 %413, %357
  br i1 %414, label %415, label %402

415:                                              ; preds = %402, %362, %360
  %416 = phi i8 addrspace(4)* [ %401, %362 ], [ %356, %360 ], [ %356, %402 ]
  %417 = phi i32 [ %400, %362 ], [ 0, %360 ], [ 0, %402 ]
  %418 = phi i64 [ %399, %362 ], [ 0, %360 ], [ %412, %402 ]
  %419 = icmp ugt i32 %417, 7
  br i1 %419, label %422, label %420

420:                                              ; preds = %415
  %421 = icmp eq i32 %417, 0
  br i1 %421, label %473, label %460

422:                                              ; preds = %415
  %423 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !15
  %424 = zext i8 %423 to i64
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 1
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !15
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 8
  %429 = or i64 %428, %424
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 2
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !15
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 16
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 3
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !15
  %437 = zext i8 %436 to i64
  %438 = shl nuw nsw i64 %437, 24
  %439 = or i64 %434, %438
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 4
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !15
  %442 = zext i8 %441 to i64
  %443 = shl nuw nsw i64 %442, 32
  %444 = or i64 %439, %443
  %445 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 5
  %446 = load i8, i8 addrspace(4)* %445, align 1, !tbaa !15
  %447 = zext i8 %446 to i64
  %448 = shl nuw nsw i64 %447, 40
  %449 = or i64 %444, %448
  %450 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 6
  %451 = load i8, i8 addrspace(4)* %450, align 1, !tbaa !15
  %452 = zext i8 %451 to i64
  %453 = shl nuw nsw i64 %452, 48
  %454 = or i64 %449, %453
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 7
  %456 = load i8, i8 addrspace(4)* %455, align 1, !tbaa !15
  %457 = zext i8 %456 to i64
  %458 = shl nuw i64 %457, 56
  %459 = or i64 %454, %458
  br label %473

460:                                              ; preds = %420, %460
  %461 = phi i32 [ %471, %460 ], [ 0, %420 ]
  %462 = phi i64 [ %470, %460 ], [ 0, %420 ]
  %463 = zext i32 %461 to i64
  %464 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 %463
  %465 = load i8, i8 addrspace(4)* %464, align 1, !tbaa !15
  %466 = zext i8 %465 to i64
  %467 = shl i32 %461, 3
  %468 = zext i32 %467 to i64
  %469 = shl nuw i64 %466, %468
  %470 = or i64 %469, %462
  %471 = add nuw nsw i32 %461, 1
  %472 = icmp eq i32 %471, %417
  br i1 %472, label %473, label %460

473:                                              ; preds = %460, %422, %420
  %474 = phi i64 [ %459, %422 ], [ 0, %420 ], [ %470, %460 ]
  %475 = shl nuw nsw i64 %56, 2
  %476 = add nuw nsw i64 %475, 28
  %477 = and i64 %476, 480
  %478 = and i64 %58, -225
  %479 = or i64 %478, %477
  %480 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %36, i64 noundef %479, i64 noundef %118, i64 noundef %178, i64 noundef %238, i64 noundef %298, i64 noundef %358, i64 noundef %418, i64 noundef %474) #11
  %481 = sub i64 %48, %56
  %482 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 %56
  %483 = icmp eq i64 %481, 0
  br i1 %483, label %484, label %47

484:                                              ; preds = %473, %39
  %485 = phi <2 x i64> [ %42, %39 ], [ %480, %473 ]
  %486 = extractelement <2 x i64> %485, i64 0
  %487 = zext i32 %21 to i64
  %488 = and i64 %486, -225
  %489 = or i64 %488, 32
  %490 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %36, i64 noundef %489, i64 noundef %487, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %491 = extractelement <2 x i64> %490, i64 0
  %492 = and i64 %491, -225
  %493 = or i64 %492, 32
  %494 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %36, i64 noundef %493, i64 noundef %15, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %495 = extractelement <2 x i64> %494, i64 0
  %496 = zext i32 %33 to i64
  %497 = and i64 %495, -227
  %498 = or i64 %497, 34
  %499 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %36, i64 noundef %498, i64 noundef %496, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %500

500:                                              ; preds = %484, %25, %20
  %501 = sdiv i32 %21, 2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %502 = icmp sgt i32 %21, 3
  br i1 %502, label %20, label %503, !llvm.loop !18

503:                                              ; preds = %500, %2
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
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
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !22
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !22
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
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
  %110 = call i64 @llvm.read_register.i64(metadata !30) #12
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
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
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

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
