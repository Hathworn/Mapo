; ModuleID = '../data/hip_kernels/2461/1/main.cu'
source_filename = "../data/hip_kernels/2461/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [3 x i8] c"hi\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z10vector_addPfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #1 {
  %5 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 24
  %7 = bitcast i8 addrspace(4)* %6 to i64 addrspace(4)*
  %8 = load i64, i64 addrspace(4)* %7, align 8, !tbaa !4
  %9 = inttoptr i64 %8 to i8 addrspace(1)*
  %10 = addrspacecast i8 addrspace(1)* %9 to i8*
  %11 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %12 = extractelement <2 x i64> %11, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([3 x i8], [3 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %13, label %17

13:                                               ; preds = %4
  %14 = and i64 %12, -227
  %15 = or i64 %14, 34
  %16 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %15, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %457

17:                                               ; preds = %4
  %18 = and i64 %12, -3
  %19 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %18, i64 0
  br label %20

20:                                               ; preds = %446, %17
  %21 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([3 x i8], [3 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([3 x i8], [3 x i8] addrspace(4)* @.str, i64 0, i64 2) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([3 x i8]* addrspacecast ([3 x i8] addrspace(4)* @.str to [3 x i8]*) to i64)), i64 1))), %17 ], [ %454, %446 ]
  %22 = phi i8 addrspace(4)* [ getelementptr inbounds ([3 x i8], [3 x i8] addrspace(4)* @.str, i64 0, i64 0), %17 ], [ %455, %446 ]
  %23 = phi <2 x i64> [ %19, %17 ], [ %453, %446 ]
  %24 = icmp ugt i64 %21, 56
  %25 = extractelement <2 x i64> %23, i64 0
  %26 = or i64 %25, 2
  %27 = insertelement <2 x i64> poison, i64 %26, i64 0
  %28 = select i1 %24, <2 x i64> %23, <2 x i64> %27
  %29 = tail call i64 @llvm.umin.i64(i64 %21, i64 56)
  %30 = trunc i64 %29 to i32
  %31 = extractelement <2 x i64> %28, i64 0
  %32 = icmp ugt i32 %30, 7
  br i1 %32, label %35, label %33

33:                                               ; preds = %20
  %34 = icmp eq i32 %30, 0
  br i1 %34, label %88, label %75

35:                                               ; preds = %20
  %36 = load i8, i8 addrspace(4)* %22, align 1, !tbaa !8
  %37 = zext i8 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 1
  %39 = load i8, i8 addrspace(4)* %38, align 1, !tbaa !8
  %40 = zext i8 %39 to i64
  %41 = shl nuw nsw i64 %40, 8
  %42 = or i64 %41, %37
  %43 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 2
  %44 = load i8, i8 addrspace(4)* %43, align 1, !tbaa !8
  %45 = zext i8 %44 to i64
  %46 = shl nuw nsw i64 %45, 16
  %47 = or i64 %42, %46
  %48 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 3
  %49 = load i8, i8 addrspace(4)* %48, align 1, !tbaa !8
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 24
  %52 = or i64 %47, %51
  %53 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 4
  %54 = load i8, i8 addrspace(4)* %53, align 1, !tbaa !8
  %55 = zext i8 %54 to i64
  %56 = shl nuw nsw i64 %55, 32
  %57 = or i64 %52, %56
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 5
  %59 = load i8, i8 addrspace(4)* %58, align 1, !tbaa !8
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 40
  %62 = or i64 %57, %61
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 6
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !8
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 48
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 7
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !8
  %70 = zext i8 %69 to i64
  %71 = shl nuw i64 %70, 56
  %72 = or i64 %67, %71
  %73 = add nsw i32 %30, -8
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 8
  br label %88

75:                                               ; preds = %33, %75
  %76 = phi i32 [ %86, %75 ], [ 0, %33 ]
  %77 = phi i64 [ %85, %75 ], [ 0, %33 ]
  %78 = zext i32 %76 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 %78
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !8
  %81 = zext i8 %80 to i64
  %82 = shl i32 %76, 3
  %83 = zext i32 %82 to i64
  %84 = shl nuw i64 %81, %83
  %85 = or i64 %84, %77
  %86 = add nuw nsw i32 %76, 1
  %87 = icmp eq i32 %86, %30
  br i1 %87, label %88, label %75, !llvm.loop !9

88:                                               ; preds = %75, %35, %33
  %89 = phi i8 addrspace(4)* [ %74, %35 ], [ %22, %33 ], [ %22, %75 ]
  %90 = phi i32 [ %73, %35 ], [ 0, %33 ], [ 0, %75 ]
  %91 = phi i64 [ %72, %35 ], [ 0, %33 ], [ %85, %75 ]
  %92 = icmp ugt i32 %90, 7
  br i1 %92, label %95, label %93

93:                                               ; preds = %88
  %94 = icmp eq i32 %90, 0
  br i1 %94, label %148, label %135

95:                                               ; preds = %88
  %96 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !8
  %97 = zext i8 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 1
  %99 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !8
  %100 = zext i8 %99 to i64
  %101 = shl nuw nsw i64 %100, 8
  %102 = or i64 %101, %97
  %103 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 2
  %104 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !8
  %105 = zext i8 %104 to i64
  %106 = shl nuw nsw i64 %105, 16
  %107 = or i64 %102, %106
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 3
  %109 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !8
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 24
  %112 = or i64 %107, %111
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 4
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !8
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 32
  %117 = or i64 %112, %116
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 5
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !8
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 40
  %122 = or i64 %117, %121
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 6
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !8
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 48
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 7
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !8
  %130 = zext i8 %129 to i64
  %131 = shl nuw i64 %130, 56
  %132 = or i64 %127, %131
  %133 = add nsw i32 %90, -8
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 8
  br label %148

135:                                              ; preds = %93, %135
  %136 = phi i32 [ %146, %135 ], [ 0, %93 ]
  %137 = phi i64 [ %145, %135 ], [ 0, %93 ]
  %138 = zext i32 %136 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 %138
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !8
  %141 = zext i8 %140 to i64
  %142 = shl i32 %136, 3
  %143 = zext i32 %142 to i64
  %144 = shl nuw i64 %141, %143
  %145 = or i64 %144, %137
  %146 = add nuw nsw i32 %136, 1
  %147 = icmp eq i32 %146, %90
  br i1 %147, label %148, label %135

148:                                              ; preds = %135, %95, %93
  %149 = phi i8 addrspace(4)* [ %134, %95 ], [ %89, %93 ], [ %89, %135 ]
  %150 = phi i32 [ %133, %95 ], [ 0, %93 ], [ 0, %135 ]
  %151 = phi i64 [ %132, %95 ], [ 0, %93 ], [ %145, %135 ]
  %152 = icmp ugt i32 %150, 7
  br i1 %152, label %155, label %153

153:                                              ; preds = %148
  %154 = icmp eq i32 %150, 0
  br i1 %154, label %208, label %195

155:                                              ; preds = %148
  %156 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !8
  %157 = zext i8 %156 to i64
  %158 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 1
  %159 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !8
  %160 = zext i8 %159 to i64
  %161 = shl nuw nsw i64 %160, 8
  %162 = or i64 %161, %157
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 2
  %164 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !8
  %165 = zext i8 %164 to i64
  %166 = shl nuw nsw i64 %165, 16
  %167 = or i64 %162, %166
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 3
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !8
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 24
  %172 = or i64 %167, %171
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 4
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !8
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 32
  %177 = or i64 %172, %176
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 5
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !8
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 40
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 6
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !8
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 48
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 7
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !8
  %190 = zext i8 %189 to i64
  %191 = shl nuw i64 %190, 56
  %192 = or i64 %187, %191
  %193 = add nsw i32 %150, -8
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 8
  br label %208

195:                                              ; preds = %153, %195
  %196 = phi i32 [ %206, %195 ], [ 0, %153 ]
  %197 = phi i64 [ %205, %195 ], [ 0, %153 ]
  %198 = zext i32 %196 to i64
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 %198
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !8
  %201 = zext i8 %200 to i64
  %202 = shl i32 %196, 3
  %203 = zext i32 %202 to i64
  %204 = shl nuw i64 %201, %203
  %205 = or i64 %204, %197
  %206 = add nuw nsw i32 %196, 1
  %207 = icmp eq i32 %206, %150
  br i1 %207, label %208, label %195

208:                                              ; preds = %195, %155, %153
  %209 = phi i8 addrspace(4)* [ %194, %155 ], [ %149, %153 ], [ %149, %195 ]
  %210 = phi i32 [ %193, %155 ], [ 0, %153 ], [ 0, %195 ]
  %211 = phi i64 [ %192, %155 ], [ 0, %153 ], [ %205, %195 ]
  %212 = icmp ugt i32 %210, 7
  br i1 %212, label %215, label %213

213:                                              ; preds = %208
  %214 = icmp eq i32 %210, 0
  br i1 %214, label %268, label %255

215:                                              ; preds = %208
  %216 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !8
  %217 = zext i8 %216 to i64
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 1
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !8
  %220 = zext i8 %219 to i64
  %221 = shl nuw nsw i64 %220, 8
  %222 = or i64 %221, %217
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 2
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !8
  %225 = zext i8 %224 to i64
  %226 = shl nuw nsw i64 %225, 16
  %227 = or i64 %222, %226
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 3
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !8
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 24
  %232 = or i64 %227, %231
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 4
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !8
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 32
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 5
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !8
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 40
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 6
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !8
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 48
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 7
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !8
  %250 = zext i8 %249 to i64
  %251 = shl nuw i64 %250, 56
  %252 = or i64 %247, %251
  %253 = add nsw i32 %210, -8
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 8
  br label %268

255:                                              ; preds = %213, %255
  %256 = phi i32 [ %266, %255 ], [ 0, %213 ]
  %257 = phi i64 [ %265, %255 ], [ 0, %213 ]
  %258 = zext i32 %256 to i64
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 %258
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !8
  %261 = zext i8 %260 to i64
  %262 = shl i32 %256, 3
  %263 = zext i32 %262 to i64
  %264 = shl nuw i64 %261, %263
  %265 = or i64 %264, %257
  %266 = add nuw nsw i32 %256, 1
  %267 = icmp eq i32 %266, %210
  br i1 %267, label %268, label %255

268:                                              ; preds = %255, %215, %213
  %269 = phi i8 addrspace(4)* [ %254, %215 ], [ %209, %213 ], [ %209, %255 ]
  %270 = phi i32 [ %253, %215 ], [ 0, %213 ], [ 0, %255 ]
  %271 = phi i64 [ %252, %215 ], [ 0, %213 ], [ %265, %255 ]
  %272 = icmp ugt i32 %270, 7
  br i1 %272, label %275, label %273

273:                                              ; preds = %268
  %274 = icmp eq i32 %270, 0
  br i1 %274, label %328, label %315

275:                                              ; preds = %268
  %276 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !8
  %277 = zext i8 %276 to i64
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 1
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !8
  %280 = zext i8 %279 to i64
  %281 = shl nuw nsw i64 %280, 8
  %282 = or i64 %281, %277
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 2
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !8
  %285 = zext i8 %284 to i64
  %286 = shl nuw nsw i64 %285, 16
  %287 = or i64 %282, %286
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 3
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !8
  %290 = zext i8 %289 to i64
  %291 = shl nuw nsw i64 %290, 24
  %292 = or i64 %287, %291
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 4
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !8
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 32
  %297 = or i64 %292, %296
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 5
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !8
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 40
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 6
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !8
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 48
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 7
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !8
  %310 = zext i8 %309 to i64
  %311 = shl nuw i64 %310, 56
  %312 = or i64 %307, %311
  %313 = add nsw i32 %270, -8
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 8
  br label %328

315:                                              ; preds = %273, %315
  %316 = phi i32 [ %326, %315 ], [ 0, %273 ]
  %317 = phi i64 [ %325, %315 ], [ 0, %273 ]
  %318 = zext i32 %316 to i64
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 %318
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !8
  %321 = zext i8 %320 to i64
  %322 = shl i32 %316, 3
  %323 = zext i32 %322 to i64
  %324 = shl nuw i64 %321, %323
  %325 = or i64 %324, %317
  %326 = add nuw nsw i32 %316, 1
  %327 = icmp eq i32 %326, %270
  br i1 %327, label %328, label %315

328:                                              ; preds = %315, %275, %273
  %329 = phi i8 addrspace(4)* [ %314, %275 ], [ %269, %273 ], [ %269, %315 ]
  %330 = phi i32 [ %313, %275 ], [ 0, %273 ], [ 0, %315 ]
  %331 = phi i64 [ %312, %275 ], [ 0, %273 ], [ %325, %315 ]
  %332 = icmp ugt i32 %330, 7
  br i1 %332, label %335, label %333

333:                                              ; preds = %328
  %334 = icmp eq i32 %330, 0
  br i1 %334, label %388, label %375

335:                                              ; preds = %328
  %336 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !8
  %337 = zext i8 %336 to i64
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 1
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !8
  %340 = zext i8 %339 to i64
  %341 = shl nuw nsw i64 %340, 8
  %342 = or i64 %341, %337
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 2
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !8
  %345 = zext i8 %344 to i64
  %346 = shl nuw nsw i64 %345, 16
  %347 = or i64 %342, %346
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 3
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !8
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 24
  %352 = or i64 %347, %351
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 4
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !8
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 32
  %357 = or i64 %352, %356
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 5
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !8
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 40
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 6
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !8
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 48
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 7
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !8
  %370 = zext i8 %369 to i64
  %371 = shl nuw i64 %370, 56
  %372 = or i64 %367, %371
  %373 = add nsw i32 %330, -8
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 8
  br label %388

375:                                              ; preds = %333, %375
  %376 = phi i32 [ %386, %375 ], [ 0, %333 ]
  %377 = phi i64 [ %385, %375 ], [ 0, %333 ]
  %378 = zext i32 %376 to i64
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 %378
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !8
  %381 = zext i8 %380 to i64
  %382 = shl i32 %376, 3
  %383 = zext i32 %382 to i64
  %384 = shl nuw i64 %381, %383
  %385 = or i64 %384, %377
  %386 = add nuw nsw i32 %376, 1
  %387 = icmp eq i32 %386, %330
  br i1 %387, label %388, label %375

388:                                              ; preds = %375, %335, %333
  %389 = phi i8 addrspace(4)* [ %374, %335 ], [ %329, %333 ], [ %329, %375 ]
  %390 = phi i32 [ %373, %335 ], [ 0, %333 ], [ 0, %375 ]
  %391 = phi i64 [ %372, %335 ], [ 0, %333 ], [ %385, %375 ]
  %392 = icmp ugt i32 %390, 7
  br i1 %392, label %395, label %393

393:                                              ; preds = %388
  %394 = icmp eq i32 %390, 0
  br i1 %394, label %446, label %433

395:                                              ; preds = %388
  %396 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !8
  %397 = zext i8 %396 to i64
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 1
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !8
  %400 = zext i8 %399 to i64
  %401 = shl nuw nsw i64 %400, 8
  %402 = or i64 %401, %397
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 2
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !8
  %405 = zext i8 %404 to i64
  %406 = shl nuw nsw i64 %405, 16
  %407 = or i64 %402, %406
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 3
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !8
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 24
  %412 = or i64 %407, %411
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 4
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !8
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 32
  %417 = or i64 %412, %416
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 5
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !8
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 40
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 6
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !8
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 48
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 7
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !8
  %430 = zext i8 %429 to i64
  %431 = shl nuw i64 %430, 56
  %432 = or i64 %427, %431
  br label %446

433:                                              ; preds = %393, %433
  %434 = phi i32 [ %444, %433 ], [ 0, %393 ]
  %435 = phi i64 [ %443, %433 ], [ 0, %393 ]
  %436 = zext i32 %434 to i64
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 %436
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !8
  %439 = zext i8 %438 to i64
  %440 = shl i32 %434, 3
  %441 = zext i32 %440 to i64
  %442 = shl nuw i64 %439, %441
  %443 = or i64 %442, %435
  %444 = add nuw nsw i32 %434, 1
  %445 = icmp eq i32 %444, %390
  br i1 %445, label %446, label %433

446:                                              ; preds = %433, %395, %393
  %447 = phi i64 [ %432, %395 ], [ 0, %393 ], [ %443, %433 ]
  %448 = shl nuw nsw i64 %29, 2
  %449 = add nuw nsw i64 %448, 28
  %450 = and i64 %449, 480
  %451 = and i64 %31, -225
  %452 = or i64 %451, %450
  %453 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %452, i64 noundef %91, i64 noundef %151, i64 noundef %211, i64 noundef %271, i64 noundef %331, i64 noundef %391, i64 noundef %447) #10
  %454 = sub i64 %21, %29
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 %29
  %456 = icmp eq i64 %454, 0
  br i1 %456, label %457, label %20

457:                                              ; preds = %446, %13
  %458 = icmp sgt i32 %3, 0
  br i1 %458, label %459, label %480

459:                                              ; preds = %457
  %460 = and i32 %3, 7
  %461 = icmp ult i32 %3, 8
  br i1 %461, label %464, label %462

462:                                              ; preds = %459
  %463 = and i32 %3, -8
  br label %481

464:                                              ; preds = %481, %459
  %465 = phi i32 [ 0, %459 ], [ %547, %481 ]
  %466 = icmp eq i32 %460, 0
  br i1 %466, label %480, label %467

467:                                              ; preds = %464, %467
  %468 = phi i32 [ %477, %467 ], [ %465, %464 ]
  %469 = phi i32 [ %478, %467 ], [ 0, %464 ]
  %470 = zext i32 %468 to i64
  %471 = getelementptr inbounds float, float addrspace(1)* %1, i64 %470
  %472 = load float, float addrspace(1)* %471, align 4, !tbaa !11
  %473 = getelementptr inbounds float, float addrspace(1)* %2, i64 %470
  %474 = load float, float addrspace(1)* %473, align 4, !tbaa !11
  %475 = fadd contract float %472, %474
  %476 = getelementptr inbounds float, float addrspace(1)* %0, i64 %470
  store float %475, float addrspace(1)* %476, align 4, !tbaa !11
  %477 = add nuw nsw i32 %468, 1
  %478 = add i32 %469, 1
  %479 = icmp eq i32 %478, %460
  br i1 %479, label %480, label %467, !llvm.loop !15

480:                                              ; preds = %464, %467, %457
  ret void

481:                                              ; preds = %481, %462
  %482 = phi i32 [ 0, %462 ], [ %547, %481 ]
  %483 = phi i32 [ 0, %462 ], [ %548, %481 ]
  %484 = zext i32 %482 to i64
  %485 = getelementptr inbounds float, float addrspace(1)* %1, i64 %484
  %486 = load float, float addrspace(1)* %485, align 4, !tbaa !11
  %487 = getelementptr inbounds float, float addrspace(1)* %2, i64 %484
  %488 = load float, float addrspace(1)* %487, align 4, !tbaa !11
  %489 = fadd contract float %486, %488
  %490 = getelementptr inbounds float, float addrspace(1)* %0, i64 %484
  store float %489, float addrspace(1)* %490, align 4, !tbaa !11
  %491 = or i32 %482, 1
  %492 = zext i32 %491 to i64
  %493 = getelementptr inbounds float, float addrspace(1)* %1, i64 %492
  %494 = load float, float addrspace(1)* %493, align 4, !tbaa !11
  %495 = getelementptr inbounds float, float addrspace(1)* %2, i64 %492
  %496 = load float, float addrspace(1)* %495, align 4, !tbaa !11
  %497 = fadd contract float %494, %496
  %498 = getelementptr inbounds float, float addrspace(1)* %0, i64 %492
  store float %497, float addrspace(1)* %498, align 4, !tbaa !11
  %499 = or i32 %482, 2
  %500 = zext i32 %499 to i64
  %501 = getelementptr inbounds float, float addrspace(1)* %1, i64 %500
  %502 = load float, float addrspace(1)* %501, align 4, !tbaa !11
  %503 = getelementptr inbounds float, float addrspace(1)* %2, i64 %500
  %504 = load float, float addrspace(1)* %503, align 4, !tbaa !11
  %505 = fadd contract float %502, %504
  %506 = getelementptr inbounds float, float addrspace(1)* %0, i64 %500
  store float %505, float addrspace(1)* %506, align 4, !tbaa !11
  %507 = or i32 %482, 3
  %508 = zext i32 %507 to i64
  %509 = getelementptr inbounds float, float addrspace(1)* %1, i64 %508
  %510 = load float, float addrspace(1)* %509, align 4, !tbaa !11
  %511 = getelementptr inbounds float, float addrspace(1)* %2, i64 %508
  %512 = load float, float addrspace(1)* %511, align 4, !tbaa !11
  %513 = fadd contract float %510, %512
  %514 = getelementptr inbounds float, float addrspace(1)* %0, i64 %508
  store float %513, float addrspace(1)* %514, align 4, !tbaa !11
  %515 = or i32 %482, 4
  %516 = zext i32 %515 to i64
  %517 = getelementptr inbounds float, float addrspace(1)* %1, i64 %516
  %518 = load float, float addrspace(1)* %517, align 4, !tbaa !11
  %519 = getelementptr inbounds float, float addrspace(1)* %2, i64 %516
  %520 = load float, float addrspace(1)* %519, align 4, !tbaa !11
  %521 = fadd contract float %518, %520
  %522 = getelementptr inbounds float, float addrspace(1)* %0, i64 %516
  store float %521, float addrspace(1)* %522, align 4, !tbaa !11
  %523 = or i32 %482, 5
  %524 = zext i32 %523 to i64
  %525 = getelementptr inbounds float, float addrspace(1)* %1, i64 %524
  %526 = load float, float addrspace(1)* %525, align 4, !tbaa !11
  %527 = getelementptr inbounds float, float addrspace(1)* %2, i64 %524
  %528 = load float, float addrspace(1)* %527, align 4, !tbaa !11
  %529 = fadd contract float %526, %528
  %530 = getelementptr inbounds float, float addrspace(1)* %0, i64 %524
  store float %529, float addrspace(1)* %530, align 4, !tbaa !11
  %531 = or i32 %482, 6
  %532 = zext i32 %531 to i64
  %533 = getelementptr inbounds float, float addrspace(1)* %1, i64 %532
  %534 = load float, float addrspace(1)* %533, align 4, !tbaa !11
  %535 = getelementptr inbounds float, float addrspace(1)* %2, i64 %532
  %536 = load float, float addrspace(1)* %535, align 4, !tbaa !11
  %537 = fadd contract float %534, %536
  %538 = getelementptr inbounds float, float addrspace(1)* %0, i64 %532
  store float %537, float addrspace(1)* %538, align 4, !tbaa !11
  %539 = or i32 %482, 7
  %540 = zext i32 %539 to i64
  %541 = getelementptr inbounds float, float addrspace(1)* %1, i64 %540
  %542 = load float, float addrspace(1)* %541, align 4, !tbaa !11
  %543 = getelementptr inbounds float, float addrspace(1)* %2, i64 %540
  %544 = load float, float addrspace(1)* %543, align 4, !tbaa !11
  %545 = fadd contract float %542, %544
  %546 = getelementptr inbounds float, float addrspace(1)* %0, i64 %540
  store float %545, float addrspace(1)* %546, align 4, !tbaa !11
  %547 = add nuw nsw i32 %482, 8
  %548 = add i32 %483, 8
  %549 = icmp eq i32 %548, %463
  br i1 %549, label %464, label %481, !llvm.loop !16
}

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !18
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !20
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !4
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !4
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !4
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !4
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !4
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !4
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !4
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !4
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !20
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !20
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !20
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !18
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !4
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !26
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !27
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !26
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !20
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %110 = call i64 @llvm.read_register.i64(metadata !28) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !29
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !31
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !32
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !4
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !4
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !4
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !4
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !4
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !4
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !4
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !4
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !26
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !33
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !33
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !34
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !36
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !4
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !4
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !8
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !26
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !23
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !33
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !33
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !8
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
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !6, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !6, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !19, i64 0}
!24 = !{!"", !19, i64 0, !19, i64 8, !25, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!25 = !{!"hsa_signal_s", !5, i64 0}
!26 = !{!24, !5, i64 40}
!27 = !{!24, !19, i64 8}
!28 = !{!"exec"}
!29 = !{!30, !21, i64 16}
!30 = !{!"", !5, i64 0, !5, i64 8, !21, i64 16, !21, i64 20}
!31 = !{!30, !5, i64 8}
!32 = !{!30, !21, i64 20}
!33 = !{!30, !5, i64 0}
!34 = !{!35, !5, i64 16}
!35 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !21, i64 24, !21, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!36 = !{!35, !21, i64 24}
