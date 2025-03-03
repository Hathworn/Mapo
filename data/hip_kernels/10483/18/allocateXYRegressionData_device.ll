; ModuleID = '../data/hip_kernels/10483/18/main.cu'
source_filename = "../data/hip_kernels/10483/18/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [20 x i8] c"Invalid control %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z24allocateXYRegressionDataiiiiPfiPiS_S_S0_S_S_(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture %9, float addrspace(1)* nocapture writeonly %10, float addrspace(1)* nocapture writeonly %11) local_unnamed_addr #1 {
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %14, label %30

14:                                               ; preds = %12
  %15 = and i32 %1, 7
  %16 = icmp ult i32 %1, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = and i32 %1, -8
  br label %45

19:                                               ; preds = %45, %14
  %20 = phi i32 [ 0, %14 ], [ %71, %45 ]
  %21 = icmp eq i32 %15, 0
  br i1 %21, label %30, label %22

22:                                               ; preds = %19, %22
  %23 = phi i32 [ %27, %22 ], [ %20, %19 ]
  %24 = phi i32 [ %28, %22 ], [ 0, %19 ]
  %25 = zext i32 %23 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %25
  store i32 0, i32 addrspace(1)* %26, align 4, !tbaa !4
  %27 = add nuw nsw i32 %23, 1
  %28 = add i32 %24, 1
  %29 = icmp eq i32 %28, %15
  br i1 %29, label %30, label %22, !llvm.loop !8

30:                                               ; preds = %19, %22, %12
  %31 = icmp sgt i32 %0, 0
  br i1 %31, label %32, label %74

32:                                               ; preds = %30
  %33 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %34 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 24
  %35 = bitcast i8 addrspace(4)* %34 to i64 addrspace(4)*
  %36 = icmp sgt i32 %2, 1
  %37 = add nsw i32 %5, 1
  %38 = mul nsw i32 %37, %0
  %39 = icmp sgt i32 %2, 0
  %40 = add i32 %2, -2
  %41 = and i32 %2, 7
  %42 = icmp ult i32 %2, 8
  %43 = and i32 %2, -8
  %44 = icmp eq i32 %41, 0
  br label %75

45:                                               ; preds = %45, %17
  %46 = phi i32 [ 0, %17 ], [ %71, %45 ]
  %47 = phi i32 [ 0, %17 ], [ %72, %45 ]
  %48 = zext i32 %46 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %48
  store i32 0, i32 addrspace(1)* %49, align 4, !tbaa !4
  %50 = or i32 %46, 1
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %51
  store i32 0, i32 addrspace(1)* %52, align 4, !tbaa !4
  %53 = or i32 %46, 2
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %54
  store i32 0, i32 addrspace(1)* %55, align 4, !tbaa !4
  %56 = or i32 %46, 3
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %57
  store i32 0, i32 addrspace(1)* %58, align 4, !tbaa !4
  %59 = or i32 %46, 4
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %60
  store i32 0, i32 addrspace(1)* %61, align 4, !tbaa !4
  %62 = or i32 %46, 5
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %63
  store i32 0, i32 addrspace(1)* %64, align 4, !tbaa !4
  %65 = or i32 %46, 6
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %66
  store i32 0, i32 addrspace(1)* %67, align 4, !tbaa !4
  %68 = or i32 %46, 7
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %69
  store i32 0, i32 addrspace(1)* %70, align 4, !tbaa !4
  %71 = add nuw nsw i32 %46, 8
  %72 = add i32 %47, 8
  %73 = icmp eq i32 %72, %18
  br i1 %73, label %19, label %45, !llvm.loop !10

74:                                               ; preds = %672, %30
  ret void

75:                                               ; preds = %32, %672
  %76 = phi i32 [ 0, %32 ], [ %673, %672 ]
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !4
  %80 = icmp slt i32 %79, %1
  br i1 %80, label %539, label %81

81:                                               ; preds = %75
  %82 = load i64, i64 addrspace(4)* %35, align 8, !tbaa !12
  %83 = inttoptr i64 %82 to i8 addrspace(1)*
  %84 = addrspacecast i8 addrspace(1)* %83 to i8*
  %85 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %84, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %86 = extractelement <2 x i64> %85, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %87, label %91

87:                                               ; preds = %81
  %88 = and i64 %86, -225
  %89 = or i64 %88, 32
  %90 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %84, i64 noundef %89, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %532

91:                                               ; preds = %81
  %92 = and i64 %86, 2
  %93 = and i64 %86, -3
  %94 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %93, i64 0
  br label %95

95:                                               ; preds = %521, %91
  %96 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str, i64 0, i64 19) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([20 x i8]* addrspacecast ([20 x i8] addrspace(4)* @.str to [20 x i8]*) to i64)), i64 1))), %91 ], [ %529, %521 ]
  %97 = phi i8 addrspace(4)* [ getelementptr inbounds ([20 x i8], [20 x i8] addrspace(4)* @.str, i64 0, i64 0), %91 ], [ %530, %521 ]
  %98 = phi <2 x i64> [ %94, %91 ], [ %528, %521 ]
  %99 = icmp ugt i64 %96, 56
  %100 = extractelement <2 x i64> %98, i64 0
  %101 = or i64 %100, %92
  %102 = insertelement <2 x i64> poison, i64 %101, i64 0
  %103 = select i1 %99, <2 x i64> %98, <2 x i64> %102
  %104 = tail call i64 @llvm.umin.i64(i64 %96, i64 56)
  %105 = trunc i64 %104 to i32
  %106 = extractelement <2 x i64> %103, i64 0
  %107 = icmp ugt i32 %105, 7
  br i1 %107, label %110, label %108

108:                                              ; preds = %95
  %109 = icmp eq i32 %105, 0
  br i1 %109, label %163, label %150

110:                                              ; preds = %95
  %111 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !16
  %112 = zext i8 %111 to i64
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 1
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !16
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 8
  %117 = or i64 %116, %112
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 2
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !16
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 16
  %122 = or i64 %117, %121
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 3
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !16
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 24
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 4
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !16
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 32
  %132 = or i64 %127, %131
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 5
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !16
  %135 = zext i8 %134 to i64
  %136 = shl nuw nsw i64 %135, 40
  %137 = or i64 %132, %136
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 6
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !16
  %140 = zext i8 %139 to i64
  %141 = shl nuw nsw i64 %140, 48
  %142 = or i64 %137, %141
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 7
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !16
  %145 = zext i8 %144 to i64
  %146 = shl nuw i64 %145, 56
  %147 = or i64 %142, %146
  %148 = add nsw i32 %105, -8
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 8
  br label %163

150:                                              ; preds = %108, %150
  %151 = phi i32 [ %161, %150 ], [ 0, %108 ]
  %152 = phi i64 [ %160, %150 ], [ 0, %108 ]
  %153 = zext i32 %151 to i64
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 %153
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !16
  %156 = zext i8 %155 to i64
  %157 = shl i32 %151, 3
  %158 = zext i32 %157 to i64
  %159 = shl nuw i64 %156, %158
  %160 = or i64 %159, %152
  %161 = add nuw nsw i32 %151, 1
  %162 = icmp eq i32 %161, %105
  br i1 %162, label %163, label %150, !llvm.loop !17

163:                                              ; preds = %150, %110, %108
  %164 = phi i8 addrspace(4)* [ %149, %110 ], [ %97, %108 ], [ %97, %150 ]
  %165 = phi i32 [ %148, %110 ], [ 0, %108 ], [ 0, %150 ]
  %166 = phi i64 [ %147, %110 ], [ 0, %108 ], [ %160, %150 ]
  %167 = icmp ugt i32 %165, 7
  br i1 %167, label %170, label %168

168:                                              ; preds = %163
  %169 = icmp eq i32 %165, 0
  br i1 %169, label %223, label %210

170:                                              ; preds = %163
  %171 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !16
  %172 = zext i8 %171 to i64
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 1
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !16
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 8
  %177 = or i64 %176, %172
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 2
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !16
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 16
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 3
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !16
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 24
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 4
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !16
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 32
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 5
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !16
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 40
  %197 = or i64 %192, %196
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 6
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !16
  %200 = zext i8 %199 to i64
  %201 = shl nuw nsw i64 %200, 48
  %202 = or i64 %197, %201
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 7
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !16
  %205 = zext i8 %204 to i64
  %206 = shl nuw i64 %205, 56
  %207 = or i64 %202, %206
  %208 = add nsw i32 %165, -8
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 8
  br label %223

210:                                              ; preds = %168, %210
  %211 = phi i32 [ %221, %210 ], [ 0, %168 ]
  %212 = phi i64 [ %220, %210 ], [ 0, %168 ]
  %213 = zext i32 %211 to i64
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 %213
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !16
  %216 = zext i8 %215 to i64
  %217 = shl i32 %211, 3
  %218 = zext i32 %217 to i64
  %219 = shl nuw i64 %216, %218
  %220 = or i64 %219, %212
  %221 = add nuw nsw i32 %211, 1
  %222 = icmp eq i32 %221, %165
  br i1 %222, label %223, label %210

223:                                              ; preds = %210, %170, %168
  %224 = phi i8 addrspace(4)* [ %209, %170 ], [ %164, %168 ], [ %164, %210 ]
  %225 = phi i32 [ %208, %170 ], [ 0, %168 ], [ 0, %210 ]
  %226 = phi i64 [ %207, %170 ], [ 0, %168 ], [ %220, %210 ]
  %227 = icmp ugt i32 %225, 7
  br i1 %227, label %230, label %228

228:                                              ; preds = %223
  %229 = icmp eq i32 %225, 0
  br i1 %229, label %283, label %270

230:                                              ; preds = %223
  %231 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !16
  %232 = zext i8 %231 to i64
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 1
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !16
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 8
  %237 = or i64 %236, %232
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 2
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !16
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 16
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 3
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !16
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 24
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 4
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !16
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 32
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 5
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !16
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 40
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 6
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !16
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 48
  %262 = or i64 %257, %261
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 7
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !16
  %265 = zext i8 %264 to i64
  %266 = shl nuw i64 %265, 56
  %267 = or i64 %262, %266
  %268 = add nsw i32 %225, -8
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 8
  br label %283

270:                                              ; preds = %228, %270
  %271 = phi i32 [ %281, %270 ], [ 0, %228 ]
  %272 = phi i64 [ %280, %270 ], [ 0, %228 ]
  %273 = zext i32 %271 to i64
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 %273
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !16
  %276 = zext i8 %275 to i64
  %277 = shl i32 %271, 3
  %278 = zext i32 %277 to i64
  %279 = shl nuw i64 %276, %278
  %280 = or i64 %279, %272
  %281 = add nuw nsw i32 %271, 1
  %282 = icmp eq i32 %281, %225
  br i1 %282, label %283, label %270

283:                                              ; preds = %270, %230, %228
  %284 = phi i8 addrspace(4)* [ %269, %230 ], [ %224, %228 ], [ %224, %270 ]
  %285 = phi i32 [ %268, %230 ], [ 0, %228 ], [ 0, %270 ]
  %286 = phi i64 [ %267, %230 ], [ 0, %228 ], [ %280, %270 ]
  %287 = icmp ugt i32 %285, 7
  br i1 %287, label %290, label %288

288:                                              ; preds = %283
  %289 = icmp eq i32 %285, 0
  br i1 %289, label %343, label %330

290:                                              ; preds = %283
  %291 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !16
  %292 = zext i8 %291 to i64
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 1
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !16
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 8
  %297 = or i64 %296, %292
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 2
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !16
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 16
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 3
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !16
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 24
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 4
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !16
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 32
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 5
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !16
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 40
  %317 = or i64 %312, %316
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 6
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !16
  %320 = zext i8 %319 to i64
  %321 = shl nuw nsw i64 %320, 48
  %322 = or i64 %317, %321
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 7
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !16
  %325 = zext i8 %324 to i64
  %326 = shl nuw i64 %325, 56
  %327 = or i64 %322, %326
  %328 = add nsw i32 %285, -8
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 8
  br label %343

330:                                              ; preds = %288, %330
  %331 = phi i32 [ %341, %330 ], [ 0, %288 ]
  %332 = phi i64 [ %340, %330 ], [ 0, %288 ]
  %333 = zext i32 %331 to i64
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 %333
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !16
  %336 = zext i8 %335 to i64
  %337 = shl i32 %331, 3
  %338 = zext i32 %337 to i64
  %339 = shl nuw i64 %336, %338
  %340 = or i64 %339, %332
  %341 = add nuw nsw i32 %331, 1
  %342 = icmp eq i32 %341, %285
  br i1 %342, label %343, label %330

343:                                              ; preds = %330, %290, %288
  %344 = phi i8 addrspace(4)* [ %329, %290 ], [ %284, %288 ], [ %284, %330 ]
  %345 = phi i32 [ %328, %290 ], [ 0, %288 ], [ 0, %330 ]
  %346 = phi i64 [ %327, %290 ], [ 0, %288 ], [ %340, %330 ]
  %347 = icmp ugt i32 %345, 7
  br i1 %347, label %350, label %348

348:                                              ; preds = %343
  %349 = icmp eq i32 %345, 0
  br i1 %349, label %403, label %390

350:                                              ; preds = %343
  %351 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !16
  %352 = zext i8 %351 to i64
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 1
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !16
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 8
  %357 = or i64 %356, %352
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 2
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !16
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 16
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 3
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !16
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 24
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 4
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !16
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 32
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 5
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !16
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 40
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 6
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !16
  %380 = zext i8 %379 to i64
  %381 = shl nuw nsw i64 %380, 48
  %382 = or i64 %377, %381
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 7
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !16
  %385 = zext i8 %384 to i64
  %386 = shl nuw i64 %385, 56
  %387 = or i64 %382, %386
  %388 = add nsw i32 %345, -8
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 8
  br label %403

390:                                              ; preds = %348, %390
  %391 = phi i32 [ %401, %390 ], [ 0, %348 ]
  %392 = phi i64 [ %400, %390 ], [ 0, %348 ]
  %393 = zext i32 %391 to i64
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 %393
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !16
  %396 = zext i8 %395 to i64
  %397 = shl i32 %391, 3
  %398 = zext i32 %397 to i64
  %399 = shl nuw i64 %396, %398
  %400 = or i64 %399, %392
  %401 = add nuw nsw i32 %391, 1
  %402 = icmp eq i32 %401, %345
  br i1 %402, label %403, label %390

403:                                              ; preds = %390, %350, %348
  %404 = phi i8 addrspace(4)* [ %389, %350 ], [ %344, %348 ], [ %344, %390 ]
  %405 = phi i32 [ %388, %350 ], [ 0, %348 ], [ 0, %390 ]
  %406 = phi i64 [ %387, %350 ], [ 0, %348 ], [ %400, %390 ]
  %407 = icmp ugt i32 %405, 7
  br i1 %407, label %410, label %408

408:                                              ; preds = %403
  %409 = icmp eq i32 %405, 0
  br i1 %409, label %463, label %450

410:                                              ; preds = %403
  %411 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !16
  %412 = zext i8 %411 to i64
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 1
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !16
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 8
  %417 = or i64 %416, %412
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 2
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !16
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 16
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 3
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !16
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 24
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 4
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !16
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 32
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 5
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !16
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 40
  %437 = or i64 %432, %436
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 6
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !16
  %440 = zext i8 %439 to i64
  %441 = shl nuw nsw i64 %440, 48
  %442 = or i64 %437, %441
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 7
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !16
  %445 = zext i8 %444 to i64
  %446 = shl nuw i64 %445, 56
  %447 = or i64 %442, %446
  %448 = add nsw i32 %405, -8
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 8
  br label %463

450:                                              ; preds = %408, %450
  %451 = phi i32 [ %461, %450 ], [ 0, %408 ]
  %452 = phi i64 [ %460, %450 ], [ 0, %408 ]
  %453 = zext i32 %451 to i64
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 %453
  %455 = load i8, i8 addrspace(4)* %454, align 1, !tbaa !16
  %456 = zext i8 %455 to i64
  %457 = shl i32 %451, 3
  %458 = zext i32 %457 to i64
  %459 = shl nuw i64 %456, %458
  %460 = or i64 %459, %452
  %461 = add nuw nsw i32 %451, 1
  %462 = icmp eq i32 %461, %405
  br i1 %462, label %463, label %450

463:                                              ; preds = %450, %410, %408
  %464 = phi i8 addrspace(4)* [ %449, %410 ], [ %404, %408 ], [ %404, %450 ]
  %465 = phi i32 [ %448, %410 ], [ 0, %408 ], [ 0, %450 ]
  %466 = phi i64 [ %447, %410 ], [ 0, %408 ], [ %460, %450 ]
  %467 = icmp ugt i32 %465, 7
  br i1 %467, label %470, label %468

468:                                              ; preds = %463
  %469 = icmp eq i32 %465, 0
  br i1 %469, label %521, label %508

470:                                              ; preds = %463
  %471 = load i8, i8 addrspace(4)* %464, align 1, !tbaa !16
  %472 = zext i8 %471 to i64
  %473 = getelementptr inbounds i8, i8 addrspace(4)* %464, i64 1
  %474 = load i8, i8 addrspace(4)* %473, align 1, !tbaa !16
  %475 = zext i8 %474 to i64
  %476 = shl nuw nsw i64 %475, 8
  %477 = or i64 %476, %472
  %478 = getelementptr inbounds i8, i8 addrspace(4)* %464, i64 2
  %479 = load i8, i8 addrspace(4)* %478, align 1, !tbaa !16
  %480 = zext i8 %479 to i64
  %481 = shl nuw nsw i64 %480, 16
  %482 = or i64 %477, %481
  %483 = getelementptr inbounds i8, i8 addrspace(4)* %464, i64 3
  %484 = load i8, i8 addrspace(4)* %483, align 1, !tbaa !16
  %485 = zext i8 %484 to i64
  %486 = shl nuw nsw i64 %485, 24
  %487 = or i64 %482, %486
  %488 = getelementptr inbounds i8, i8 addrspace(4)* %464, i64 4
  %489 = load i8, i8 addrspace(4)* %488, align 1, !tbaa !16
  %490 = zext i8 %489 to i64
  %491 = shl nuw nsw i64 %490, 32
  %492 = or i64 %487, %491
  %493 = getelementptr inbounds i8, i8 addrspace(4)* %464, i64 5
  %494 = load i8, i8 addrspace(4)* %493, align 1, !tbaa !16
  %495 = zext i8 %494 to i64
  %496 = shl nuw nsw i64 %495, 40
  %497 = or i64 %492, %496
  %498 = getelementptr inbounds i8, i8 addrspace(4)* %464, i64 6
  %499 = load i8, i8 addrspace(4)* %498, align 1, !tbaa !16
  %500 = zext i8 %499 to i64
  %501 = shl nuw nsw i64 %500, 48
  %502 = or i64 %497, %501
  %503 = getelementptr inbounds i8, i8 addrspace(4)* %464, i64 7
  %504 = load i8, i8 addrspace(4)* %503, align 1, !tbaa !16
  %505 = zext i8 %504 to i64
  %506 = shl nuw i64 %505, 56
  %507 = or i64 %502, %506
  br label %521

508:                                              ; preds = %468, %508
  %509 = phi i32 [ %519, %508 ], [ 0, %468 ]
  %510 = phi i64 [ %518, %508 ], [ 0, %468 ]
  %511 = zext i32 %509 to i64
  %512 = getelementptr inbounds i8, i8 addrspace(4)* %464, i64 %511
  %513 = load i8, i8 addrspace(4)* %512, align 1, !tbaa !16
  %514 = zext i8 %513 to i64
  %515 = shl i32 %509, 3
  %516 = zext i32 %515 to i64
  %517 = shl nuw i64 %514, %516
  %518 = or i64 %517, %510
  %519 = add nuw nsw i32 %509, 1
  %520 = icmp eq i32 %519, %465
  br i1 %520, label %521, label %508

521:                                              ; preds = %508, %470, %468
  %522 = phi i64 [ %507, %470 ], [ 0, %468 ], [ %518, %508 ]
  %523 = shl nuw nsw i64 %104, 2
  %524 = add nuw nsw i64 %523, 28
  %525 = and i64 %524, 480
  %526 = and i64 %106, -225
  %527 = or i64 %526, %525
  %528 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %84, i64 noundef %527, i64 noundef %166, i64 noundef %226, i64 noundef %286, i64 noundef %346, i64 noundef %406, i64 noundef %466, i64 noundef %522) #10
  %529 = sub i64 %96, %104
  %530 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 %104
  %531 = icmp eq i64 %529, 0
  br i1 %531, label %532, label %95

532:                                              ; preds = %521, %87
  %533 = phi <2 x i64> [ %90, %87 ], [ %528, %521 ]
  %534 = extractelement <2 x i64> %533, i64 0
  %535 = zext i32 %79 to i64
  %536 = and i64 %534, -227
  %537 = or i64 %536, 34
  %538 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %84, i64 noundef %537, i64 noundef %535, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %539

539:                                              ; preds = %532, %75
  br i1 %36, label %540, label %560

540:                                              ; preds = %539
  %541 = mul nsw i32 %76, %2
  br label %545

542:                                              ; preds = %545
  %543 = add nuw nsw i32 %546, 1
  %544 = icmp eq i32 %546, %40
  br i1 %544, label %560, label %545, !llvm.loop !18

545:                                              ; preds = %540, %542
  %546 = phi i32 [ 0, %540 ], [ %543, %542 ]
  %547 = add nsw i32 %546, %541
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds float, float addrspace(1)* %7, i64 %548
  %550 = load float, float addrspace(1)* %549, align 4, !tbaa !19
  %551 = shl nsw i32 %546, 3
  %552 = add nuw nsw i32 %551, 3
  %553 = zext i32 %552 to i64
  %554 = getelementptr inbounds float, float addrspace(1)* %4, i64 %553
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !19
  %556 = fcmp contract olt float %550, %555
  br i1 %556, label %557, label %542

557:                                              ; preds = %545
  %558 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !4
  %559 = icmp eq i32 %558, 0
  br i1 %559, label %560, label %672

560:                                              ; preds = %542, %539, %557
  %561 = add nsw i32 %76, %38
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds float, float addrspace(1)* %8, i64 %562
  %564 = load float, float addrspace(1)* %563, align 4, !tbaa !19
  %565 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !4
  %566 = mul nsw i32 %565, %0
  %567 = sext i32 %565 to i64
  %568 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %567
  %569 = load i32, i32 addrspace(1)* %568, align 4, !tbaa !4
  %570 = add nsw i32 %566, %569
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds float, float addrspace(1)* %11, i64 %571
  store float %564, float addrspace(1)* %572, align 4, !tbaa !19
  br i1 %39, label %573, label %593

573:                                              ; preds = %560
  %574 = mul nsw i32 %76, %2
  %575 = mul nsw i32 %566, %2
  %576 = add i32 %575, %569
  br i1 %42, label %577, label %595

577:                                              ; preds = %595, %573
  %578 = phi i32 [ 0, %573 ], [ %669, %595 ]
  br i1 %44, label %593, label %579

579:                                              ; preds = %577, %579
  %580 = phi i32 [ %590, %579 ], [ %578, %577 ]
  %581 = phi i32 [ %591, %579 ], [ 0, %577 ]
  %582 = add nsw i32 %580, %574
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds float, float addrspace(1)* %7, i64 %583
  %585 = load float, float addrspace(1)* %584, align 4, !tbaa !19
  %586 = mul nsw i32 %580, %0
  %587 = add i32 %576, %586
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds float, float addrspace(1)* %10, i64 %588
  store float %585, float addrspace(1)* %589, align 4, !tbaa !19
  %590 = add nuw nsw i32 %580, 1
  %591 = add i32 %581, 1
  %592 = icmp eq i32 %591, %41
  br i1 %592, label %593, label %579, !llvm.loop !21

593:                                              ; preds = %577, %579, %560
  %594 = add nsw i32 %569, 1
  store i32 %594, i32 addrspace(1)* %568, align 4, !tbaa !4
  br label %672

595:                                              ; preds = %573, %595
  %596 = phi i32 [ %669, %595 ], [ 0, %573 ]
  %597 = phi i32 [ %670, %595 ], [ 0, %573 ]
  %598 = add nsw i32 %596, %574
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds float, float addrspace(1)* %7, i64 %599
  %601 = load float, float addrspace(1)* %600, align 4, !tbaa !19
  %602 = mul nsw i32 %596, %0
  %603 = add i32 %576, %602
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds float, float addrspace(1)* %10, i64 %604
  store float %601, float addrspace(1)* %605, align 4, !tbaa !19
  %606 = or i32 %596, 1
  %607 = add nsw i32 %606, %574
  %608 = sext i32 %607 to i64
  %609 = getelementptr inbounds float, float addrspace(1)* %7, i64 %608
  %610 = load float, float addrspace(1)* %609, align 4, !tbaa !19
  %611 = mul nsw i32 %606, %0
  %612 = add i32 %576, %611
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds float, float addrspace(1)* %10, i64 %613
  store float %610, float addrspace(1)* %614, align 4, !tbaa !19
  %615 = or i32 %596, 2
  %616 = add nsw i32 %615, %574
  %617 = sext i32 %616 to i64
  %618 = getelementptr inbounds float, float addrspace(1)* %7, i64 %617
  %619 = load float, float addrspace(1)* %618, align 4, !tbaa !19
  %620 = mul nsw i32 %615, %0
  %621 = add i32 %576, %620
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds float, float addrspace(1)* %10, i64 %622
  store float %619, float addrspace(1)* %623, align 4, !tbaa !19
  %624 = or i32 %596, 3
  %625 = add nsw i32 %624, %574
  %626 = sext i32 %625 to i64
  %627 = getelementptr inbounds float, float addrspace(1)* %7, i64 %626
  %628 = load float, float addrspace(1)* %627, align 4, !tbaa !19
  %629 = mul nsw i32 %624, %0
  %630 = add i32 %576, %629
  %631 = sext i32 %630 to i64
  %632 = getelementptr inbounds float, float addrspace(1)* %10, i64 %631
  store float %628, float addrspace(1)* %632, align 4, !tbaa !19
  %633 = or i32 %596, 4
  %634 = add nsw i32 %633, %574
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds float, float addrspace(1)* %7, i64 %635
  %637 = load float, float addrspace(1)* %636, align 4, !tbaa !19
  %638 = mul nsw i32 %633, %0
  %639 = add i32 %576, %638
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds float, float addrspace(1)* %10, i64 %640
  store float %637, float addrspace(1)* %641, align 4, !tbaa !19
  %642 = or i32 %596, 5
  %643 = add nsw i32 %642, %574
  %644 = sext i32 %643 to i64
  %645 = getelementptr inbounds float, float addrspace(1)* %7, i64 %644
  %646 = load float, float addrspace(1)* %645, align 4, !tbaa !19
  %647 = mul nsw i32 %642, %0
  %648 = add i32 %576, %647
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds float, float addrspace(1)* %10, i64 %649
  store float %646, float addrspace(1)* %650, align 4, !tbaa !19
  %651 = or i32 %596, 6
  %652 = add nsw i32 %651, %574
  %653 = sext i32 %652 to i64
  %654 = getelementptr inbounds float, float addrspace(1)* %7, i64 %653
  %655 = load float, float addrspace(1)* %654, align 4, !tbaa !19
  %656 = mul nsw i32 %651, %0
  %657 = add i32 %576, %656
  %658 = sext i32 %657 to i64
  %659 = getelementptr inbounds float, float addrspace(1)* %10, i64 %658
  store float %655, float addrspace(1)* %659, align 4, !tbaa !19
  %660 = or i32 %596, 7
  %661 = add nsw i32 %660, %574
  %662 = sext i32 %661 to i64
  %663 = getelementptr inbounds float, float addrspace(1)* %7, i64 %662
  %664 = load float, float addrspace(1)* %663, align 4, !tbaa !19
  %665 = mul nsw i32 %660, %0
  %666 = add i32 %576, %665
  %667 = sext i32 %666 to i64
  %668 = getelementptr inbounds float, float addrspace(1)* %10, i64 %667
  store float %664, float addrspace(1)* %668, align 4, !tbaa !19
  %669 = add nuw nsw i32 %596, 8
  %670 = add i32 %597, 8
  %671 = icmp eq i32 %670, %43
  br i1 %671, label %577, label %595, !llvm.loop !22

672:                                              ; preds = %593, %557
  %673 = add nuw nsw i32 %76, 1
  %674 = icmp eq i32 %673, %0
  br i1 %674, label %74, label %75, !llvm.loop !23
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !24
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !26
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !12
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !12
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !12
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !12
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !12
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !12
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !12
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !12
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !26
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !28
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !26
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !26
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !24
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !29
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !29
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !12
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !12
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !29
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !32
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !12
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !33
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !32
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !26
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !12
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !12
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !12
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !12
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !12
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !12
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !12
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !12
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !12
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !12
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !12
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !12
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !12
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !12
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !12
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !12
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !12
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !29
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
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !12
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !12
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !16
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !12
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !26
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !26
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
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !29
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !16
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
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!14, !14, i64 0}
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !11}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !6, i64 0}
!21 = distinct !{!21, !9}
!22 = distinct !{!22, !11}
!23 = distinct !{!23, !11}
!24 = !{!25, !25, i64 0}
!25 = !{!"any pointer", !14, i64 0}
!26 = !{!27, !27, i64 0}
!27 = !{!"int", !14, i64 0}
!28 = !{i64 2662}
!29 = !{!30, !25, i64 0}
!30 = !{!"", !25, i64 0, !25, i64 8, !31, i64 16, !13, i64 24, !13, i64 32, !13, i64 40}
!31 = !{!"hsa_signal_s", !13, i64 0}
!32 = !{!30, !13, i64 40}
!33 = !{!30, !25, i64 8}
!34 = !{!"exec"}
!35 = !{!36, !27, i64 16}
!36 = !{!"", !13, i64 0, !13, i64 8, !27, i64 16, !27, i64 20}
!37 = !{!36, !13, i64 8}
!38 = !{!36, !27, i64 20}
!39 = !{!36, !13, i64 0}
!40 = !{!41, !13, i64 16}
!41 = !{!"amd_signal_s", !13, i64 0, !14, i64 8, !13, i64 16, !27, i64 24, !27, i64 28, !13, i64 32, !13, i64 40, !14, i64 48, !14, i64 56}
!42 = !{!41, !27, i64 24}
