; ModuleID = '../data/hip_kernels/10637/0/main.cu'
source_filename = "../data/hip_kernels/10637/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [14 x i8] c"CUDA ptr: %p\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [17 x i8] c"CUDA value: %lf\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z11cudaDoEigenPdii(double addrspace(1)* %0, i32 %1, i32 %2) local_unnamed_addr #1 {
  %4 = addrspacecast double addrspace(1)* %0 to double*
  %5 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 24
  %7 = bitcast i8 addrspace(4)* %6 to i64 addrspace(4)*
  %8 = load i64, i64 addrspace(4)* %7, align 8, !tbaa !4
  %9 = inttoptr i64 %8 to i8 addrspace(1)*
  %10 = addrspacecast i8 addrspace(1)* %9 to i8*
  %11 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %12 = extractelement <2 x i64> %11, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %13, label %17

13:                                               ; preds = %3
  %14 = and i64 %12, -225
  %15 = or i64 %14, 32
  %16 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %15, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %458

17:                                               ; preds = %3
  %18 = and i64 %12, 2
  %19 = and i64 %12, -3
  %20 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %19, i64 0
  br label %21

21:                                               ; preds = %447, %17
  %22 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 13) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([14 x i8]* addrspacecast ([14 x i8] addrspace(4)* @.str to [14 x i8]*) to i64)), i64 1))), %17 ], [ %455, %447 ]
  %23 = phi i8 addrspace(4)* [ getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0), %17 ], [ %456, %447 ]
  %24 = phi <2 x i64> [ %20, %17 ], [ %454, %447 ]
  %25 = icmp ugt i64 %22, 56
  %26 = extractelement <2 x i64> %24, i64 0
  %27 = or i64 %26, %18
  %28 = insertelement <2 x i64> poison, i64 %27, i64 0
  %29 = select i1 %25, <2 x i64> %24, <2 x i64> %28
  %30 = tail call i64 @llvm.umin.i64(i64 %22, i64 56)
  %31 = trunc i64 %30 to i32
  %32 = extractelement <2 x i64> %29, i64 0
  %33 = icmp ugt i32 %31, 7
  br i1 %33, label %36, label %34

34:                                               ; preds = %21
  %35 = icmp eq i32 %31, 0
  br i1 %35, label %89, label %76

36:                                               ; preds = %21
  %37 = load i8, i8 addrspace(4)* %23, align 1, !tbaa !8
  %38 = zext i8 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 1
  %40 = load i8, i8 addrspace(4)* %39, align 1, !tbaa !8
  %41 = zext i8 %40 to i64
  %42 = shl nuw nsw i64 %41, 8
  %43 = or i64 %42, %38
  %44 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 2
  %45 = load i8, i8 addrspace(4)* %44, align 1, !tbaa !8
  %46 = zext i8 %45 to i64
  %47 = shl nuw nsw i64 %46, 16
  %48 = or i64 %43, %47
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 3
  %50 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !8
  %51 = zext i8 %50 to i64
  %52 = shl nuw nsw i64 %51, 24
  %53 = or i64 %48, %52
  %54 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 4
  %55 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !8
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 32
  %58 = or i64 %53, %57
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 5
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !8
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 40
  %63 = or i64 %58, %62
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 6
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !8
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 48
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 7
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !8
  %71 = zext i8 %70 to i64
  %72 = shl nuw i64 %71, 56
  %73 = or i64 %68, %72
  %74 = add nsw i32 %31, -8
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 8
  br label %89

76:                                               ; preds = %34, %76
  %77 = phi i32 [ %87, %76 ], [ 0, %34 ]
  %78 = phi i64 [ %86, %76 ], [ 0, %34 ]
  %79 = zext i32 %77 to i64
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 %79
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !8
  %82 = zext i8 %81 to i64
  %83 = shl i32 %77, 3
  %84 = zext i32 %83 to i64
  %85 = shl nuw i64 %82, %84
  %86 = or i64 %85, %78
  %87 = add nuw nsw i32 %77, 1
  %88 = icmp eq i32 %87, %31
  br i1 %88, label %89, label %76, !llvm.loop !9

89:                                               ; preds = %76, %36, %34
  %90 = phi i8 addrspace(4)* [ %75, %36 ], [ %23, %34 ], [ %23, %76 ]
  %91 = phi i32 [ %74, %36 ], [ 0, %34 ], [ 0, %76 ]
  %92 = phi i64 [ %73, %36 ], [ 0, %34 ], [ %86, %76 ]
  %93 = icmp ugt i32 %91, 7
  br i1 %93, label %96, label %94

94:                                               ; preds = %89
  %95 = icmp eq i32 %91, 0
  br i1 %95, label %149, label %136

96:                                               ; preds = %89
  %97 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !8
  %98 = zext i8 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 1
  %100 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !8
  %101 = zext i8 %100 to i64
  %102 = shl nuw nsw i64 %101, 8
  %103 = or i64 %102, %98
  %104 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 2
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !8
  %106 = zext i8 %105 to i64
  %107 = shl nuw nsw i64 %106, 16
  %108 = or i64 %103, %107
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 3
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !8
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 24
  %113 = or i64 %108, %112
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 4
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !8
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 32
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 5
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !8
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 40
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 6
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !8
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 48
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 7
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !8
  %131 = zext i8 %130 to i64
  %132 = shl nuw i64 %131, 56
  %133 = or i64 %128, %132
  %134 = add nsw i32 %91, -8
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 8
  br label %149

136:                                              ; preds = %94, %136
  %137 = phi i32 [ %147, %136 ], [ 0, %94 ]
  %138 = phi i64 [ %146, %136 ], [ 0, %94 ]
  %139 = zext i32 %137 to i64
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 %139
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !8
  %142 = zext i8 %141 to i64
  %143 = shl i32 %137, 3
  %144 = zext i32 %143 to i64
  %145 = shl nuw i64 %142, %144
  %146 = or i64 %145, %138
  %147 = add nuw nsw i32 %137, 1
  %148 = icmp eq i32 %147, %91
  br i1 %148, label %149, label %136

149:                                              ; preds = %136, %96, %94
  %150 = phi i8 addrspace(4)* [ %135, %96 ], [ %90, %94 ], [ %90, %136 ]
  %151 = phi i32 [ %134, %96 ], [ 0, %94 ], [ 0, %136 ]
  %152 = phi i64 [ %133, %96 ], [ 0, %94 ], [ %146, %136 ]
  %153 = icmp ugt i32 %151, 7
  br i1 %153, label %156, label %154

154:                                              ; preds = %149
  %155 = icmp eq i32 %151, 0
  br i1 %155, label %209, label %196

156:                                              ; preds = %149
  %157 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !8
  %158 = zext i8 %157 to i64
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 1
  %160 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !8
  %161 = zext i8 %160 to i64
  %162 = shl nuw nsw i64 %161, 8
  %163 = or i64 %162, %158
  %164 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 2
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !8
  %166 = zext i8 %165 to i64
  %167 = shl nuw nsw i64 %166, 16
  %168 = or i64 %163, %167
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 3
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !8
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 24
  %173 = or i64 %168, %172
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 4
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !8
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 32
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 5
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !8
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 40
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 6
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !8
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 48
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 7
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !8
  %191 = zext i8 %190 to i64
  %192 = shl nuw i64 %191, 56
  %193 = or i64 %188, %192
  %194 = add nsw i32 %151, -8
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 8
  br label %209

196:                                              ; preds = %154, %196
  %197 = phi i32 [ %207, %196 ], [ 0, %154 ]
  %198 = phi i64 [ %206, %196 ], [ 0, %154 ]
  %199 = zext i32 %197 to i64
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 %199
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !8
  %202 = zext i8 %201 to i64
  %203 = shl i32 %197, 3
  %204 = zext i32 %203 to i64
  %205 = shl nuw i64 %202, %204
  %206 = or i64 %205, %198
  %207 = add nuw nsw i32 %197, 1
  %208 = icmp eq i32 %207, %151
  br i1 %208, label %209, label %196

209:                                              ; preds = %196, %156, %154
  %210 = phi i8 addrspace(4)* [ %195, %156 ], [ %150, %154 ], [ %150, %196 ]
  %211 = phi i32 [ %194, %156 ], [ 0, %154 ], [ 0, %196 ]
  %212 = phi i64 [ %193, %156 ], [ 0, %154 ], [ %206, %196 ]
  %213 = icmp ugt i32 %211, 7
  br i1 %213, label %216, label %214

214:                                              ; preds = %209
  %215 = icmp eq i32 %211, 0
  br i1 %215, label %269, label %256

216:                                              ; preds = %209
  %217 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !8
  %218 = zext i8 %217 to i64
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 1
  %220 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !8
  %221 = zext i8 %220 to i64
  %222 = shl nuw nsw i64 %221, 8
  %223 = or i64 %222, %218
  %224 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 2
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !8
  %226 = zext i8 %225 to i64
  %227 = shl nuw nsw i64 %226, 16
  %228 = or i64 %223, %227
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 3
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !8
  %231 = zext i8 %230 to i64
  %232 = shl nuw nsw i64 %231, 24
  %233 = or i64 %228, %232
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 4
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !8
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 32
  %238 = or i64 %233, %237
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 5
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !8
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 40
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 6
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !8
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 48
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 7
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !8
  %251 = zext i8 %250 to i64
  %252 = shl nuw i64 %251, 56
  %253 = or i64 %248, %252
  %254 = add nsw i32 %211, -8
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 8
  br label %269

256:                                              ; preds = %214, %256
  %257 = phi i32 [ %267, %256 ], [ 0, %214 ]
  %258 = phi i64 [ %266, %256 ], [ 0, %214 ]
  %259 = zext i32 %257 to i64
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 %259
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !8
  %262 = zext i8 %261 to i64
  %263 = shl i32 %257, 3
  %264 = zext i32 %263 to i64
  %265 = shl nuw i64 %262, %264
  %266 = or i64 %265, %258
  %267 = add nuw nsw i32 %257, 1
  %268 = icmp eq i32 %267, %211
  br i1 %268, label %269, label %256

269:                                              ; preds = %256, %216, %214
  %270 = phi i8 addrspace(4)* [ %255, %216 ], [ %210, %214 ], [ %210, %256 ]
  %271 = phi i32 [ %254, %216 ], [ 0, %214 ], [ 0, %256 ]
  %272 = phi i64 [ %253, %216 ], [ 0, %214 ], [ %266, %256 ]
  %273 = icmp ugt i32 %271, 7
  br i1 %273, label %276, label %274

274:                                              ; preds = %269
  %275 = icmp eq i32 %271, 0
  br i1 %275, label %329, label %316

276:                                              ; preds = %269
  %277 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !8
  %278 = zext i8 %277 to i64
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 1
  %280 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !8
  %281 = zext i8 %280 to i64
  %282 = shl nuw nsw i64 %281, 8
  %283 = or i64 %282, %278
  %284 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 2
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !8
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 16
  %288 = or i64 %283, %287
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 3
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !8
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 24
  %293 = or i64 %288, %292
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 4
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !8
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 32
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 5
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !8
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 40
  %303 = or i64 %298, %302
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 6
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !8
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 48
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 7
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !8
  %311 = zext i8 %310 to i64
  %312 = shl nuw i64 %311, 56
  %313 = or i64 %308, %312
  %314 = add nsw i32 %271, -8
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 8
  br label %329

316:                                              ; preds = %274, %316
  %317 = phi i32 [ %327, %316 ], [ 0, %274 ]
  %318 = phi i64 [ %326, %316 ], [ 0, %274 ]
  %319 = zext i32 %317 to i64
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 %319
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !8
  %322 = zext i8 %321 to i64
  %323 = shl i32 %317, 3
  %324 = zext i32 %323 to i64
  %325 = shl nuw i64 %322, %324
  %326 = or i64 %325, %318
  %327 = add nuw nsw i32 %317, 1
  %328 = icmp eq i32 %327, %271
  br i1 %328, label %329, label %316

329:                                              ; preds = %316, %276, %274
  %330 = phi i8 addrspace(4)* [ %315, %276 ], [ %270, %274 ], [ %270, %316 ]
  %331 = phi i32 [ %314, %276 ], [ 0, %274 ], [ 0, %316 ]
  %332 = phi i64 [ %313, %276 ], [ 0, %274 ], [ %326, %316 ]
  %333 = icmp ugt i32 %331, 7
  br i1 %333, label %336, label %334

334:                                              ; preds = %329
  %335 = icmp eq i32 %331, 0
  br i1 %335, label %389, label %376

336:                                              ; preds = %329
  %337 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !8
  %338 = zext i8 %337 to i64
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 1
  %340 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !8
  %341 = zext i8 %340 to i64
  %342 = shl nuw nsw i64 %341, 8
  %343 = or i64 %342, %338
  %344 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 2
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !8
  %346 = zext i8 %345 to i64
  %347 = shl nuw nsw i64 %346, 16
  %348 = or i64 %343, %347
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 3
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !8
  %351 = zext i8 %350 to i64
  %352 = shl nuw nsw i64 %351, 24
  %353 = or i64 %348, %352
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 4
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !8
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 32
  %358 = or i64 %353, %357
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 5
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !8
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 40
  %363 = or i64 %358, %362
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 6
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !8
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 48
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 7
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !8
  %371 = zext i8 %370 to i64
  %372 = shl nuw i64 %371, 56
  %373 = or i64 %368, %372
  %374 = add nsw i32 %331, -8
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 8
  br label %389

376:                                              ; preds = %334, %376
  %377 = phi i32 [ %387, %376 ], [ 0, %334 ]
  %378 = phi i64 [ %386, %376 ], [ 0, %334 ]
  %379 = zext i32 %377 to i64
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 %379
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !8
  %382 = zext i8 %381 to i64
  %383 = shl i32 %377, 3
  %384 = zext i32 %383 to i64
  %385 = shl nuw i64 %382, %384
  %386 = or i64 %385, %378
  %387 = add nuw nsw i32 %377, 1
  %388 = icmp eq i32 %387, %331
  br i1 %388, label %389, label %376

389:                                              ; preds = %376, %336, %334
  %390 = phi i8 addrspace(4)* [ %375, %336 ], [ %330, %334 ], [ %330, %376 ]
  %391 = phi i32 [ %374, %336 ], [ 0, %334 ], [ 0, %376 ]
  %392 = phi i64 [ %373, %336 ], [ 0, %334 ], [ %386, %376 ]
  %393 = icmp ugt i32 %391, 7
  br i1 %393, label %396, label %394

394:                                              ; preds = %389
  %395 = icmp eq i32 %391, 0
  br i1 %395, label %447, label %434

396:                                              ; preds = %389
  %397 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !8
  %398 = zext i8 %397 to i64
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 1
  %400 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !8
  %401 = zext i8 %400 to i64
  %402 = shl nuw nsw i64 %401, 8
  %403 = or i64 %402, %398
  %404 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 2
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !8
  %406 = zext i8 %405 to i64
  %407 = shl nuw nsw i64 %406, 16
  %408 = or i64 %403, %407
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 3
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !8
  %411 = zext i8 %410 to i64
  %412 = shl nuw nsw i64 %411, 24
  %413 = or i64 %408, %412
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 4
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !8
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 32
  %418 = or i64 %413, %417
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 5
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !8
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 40
  %423 = or i64 %418, %422
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 6
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !8
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 48
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 7
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !8
  %431 = zext i8 %430 to i64
  %432 = shl nuw i64 %431, 56
  %433 = or i64 %428, %432
  br label %447

434:                                              ; preds = %394, %434
  %435 = phi i32 [ %445, %434 ], [ 0, %394 ]
  %436 = phi i64 [ %444, %434 ], [ 0, %394 ]
  %437 = zext i32 %435 to i64
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 %437
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !8
  %440 = zext i8 %439 to i64
  %441 = shl i32 %435, 3
  %442 = zext i32 %441 to i64
  %443 = shl nuw i64 %440, %442
  %444 = or i64 %443, %436
  %445 = add nuw nsw i32 %435, 1
  %446 = icmp eq i32 %445, %391
  br i1 %446, label %447, label %434

447:                                              ; preds = %434, %396, %394
  %448 = phi i64 [ %433, %396 ], [ 0, %394 ], [ %444, %434 ]
  %449 = shl nuw nsw i64 %30, 2
  %450 = add nuw nsw i64 %449, 28
  %451 = and i64 %450, 480
  %452 = and i64 %32, -225
  %453 = or i64 %452, %451
  %454 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %453, i64 noundef %92, i64 noundef %152, i64 noundef %212, i64 noundef %272, i64 noundef %332, i64 noundef %392, i64 noundef %448) #10
  %455 = sub i64 %22, %30
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 %30
  %457 = icmp eq i64 %455, 0
  br i1 %457, label %458, label %21

458:                                              ; preds = %447, %13
  %459 = phi <2 x i64> [ %16, %13 ], [ %454, %447 ]
  %460 = extractelement <2 x i64> %459, i64 0
  %461 = ptrtoint double* %4 to i64
  %462 = and i64 %460, -227
  %463 = or i64 %462, 34
  %464 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %463, i64 noundef %461, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %465 = bitcast double addrspace(1)* %0 to i64 addrspace(1)*
  %466 = load i64, i64 addrspace(1)* %465, align 8, !tbaa !11
  %467 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %468 = extractelement <2 x i64> %467, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %469, label %473

469:                                              ; preds = %458
  %470 = and i64 %468, -225
  %471 = or i64 %470, 32
  %472 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %471, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %914

473:                                              ; preds = %458
  %474 = and i64 %468, 2
  %475 = and i64 %468, -3
  %476 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %475, i64 0
  br label %477

477:                                              ; preds = %903, %473
  %478 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 16) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([17 x i8]* addrspacecast ([17 x i8] addrspace(4)* @.str.1 to [17 x i8]*) to i64)), i64 1))), %473 ], [ %911, %903 ]
  %479 = phi i8 addrspace(4)* [ getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %473 ], [ %912, %903 ]
  %480 = phi <2 x i64> [ %476, %473 ], [ %910, %903 ]
  %481 = icmp ugt i64 %478, 56
  %482 = extractelement <2 x i64> %480, i64 0
  %483 = or i64 %482, %474
  %484 = insertelement <2 x i64> poison, i64 %483, i64 0
  %485 = select i1 %481, <2 x i64> %480, <2 x i64> %484
  %486 = tail call i64 @llvm.umin.i64(i64 %478, i64 56)
  %487 = trunc i64 %486 to i32
  %488 = extractelement <2 x i64> %485, i64 0
  %489 = icmp ugt i32 %487, 7
  br i1 %489, label %492, label %490

490:                                              ; preds = %477
  %491 = icmp eq i32 %487, 0
  br i1 %491, label %545, label %532

492:                                              ; preds = %477
  %493 = load i8, i8 addrspace(4)* %479, align 1, !tbaa !8
  %494 = zext i8 %493 to i64
  %495 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 1
  %496 = load i8, i8 addrspace(4)* %495, align 1, !tbaa !8
  %497 = zext i8 %496 to i64
  %498 = shl nuw nsw i64 %497, 8
  %499 = or i64 %498, %494
  %500 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 2
  %501 = load i8, i8 addrspace(4)* %500, align 1, !tbaa !8
  %502 = zext i8 %501 to i64
  %503 = shl nuw nsw i64 %502, 16
  %504 = or i64 %499, %503
  %505 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 3
  %506 = load i8, i8 addrspace(4)* %505, align 1, !tbaa !8
  %507 = zext i8 %506 to i64
  %508 = shl nuw nsw i64 %507, 24
  %509 = or i64 %504, %508
  %510 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 4
  %511 = load i8, i8 addrspace(4)* %510, align 1, !tbaa !8
  %512 = zext i8 %511 to i64
  %513 = shl nuw nsw i64 %512, 32
  %514 = or i64 %509, %513
  %515 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 5
  %516 = load i8, i8 addrspace(4)* %515, align 1, !tbaa !8
  %517 = zext i8 %516 to i64
  %518 = shl nuw nsw i64 %517, 40
  %519 = or i64 %514, %518
  %520 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 6
  %521 = load i8, i8 addrspace(4)* %520, align 1, !tbaa !8
  %522 = zext i8 %521 to i64
  %523 = shl nuw nsw i64 %522, 48
  %524 = or i64 %519, %523
  %525 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 7
  %526 = load i8, i8 addrspace(4)* %525, align 1, !tbaa !8
  %527 = zext i8 %526 to i64
  %528 = shl nuw i64 %527, 56
  %529 = or i64 %524, %528
  %530 = add nsw i32 %487, -8
  %531 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 8
  br label %545

532:                                              ; preds = %490, %532
  %533 = phi i32 [ %543, %532 ], [ 0, %490 ]
  %534 = phi i64 [ %542, %532 ], [ 0, %490 ]
  %535 = zext i32 %533 to i64
  %536 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 %535
  %537 = load i8, i8 addrspace(4)* %536, align 1, !tbaa !8
  %538 = zext i8 %537 to i64
  %539 = shl i32 %533, 3
  %540 = zext i32 %539 to i64
  %541 = shl nuw i64 %538, %540
  %542 = or i64 %541, %534
  %543 = add nuw nsw i32 %533, 1
  %544 = icmp eq i32 %543, %487
  br i1 %544, label %545, label %532, !llvm.loop !9

545:                                              ; preds = %532, %492, %490
  %546 = phi i8 addrspace(4)* [ %531, %492 ], [ %479, %490 ], [ %479, %532 ]
  %547 = phi i32 [ %530, %492 ], [ 0, %490 ], [ 0, %532 ]
  %548 = phi i64 [ %529, %492 ], [ 0, %490 ], [ %542, %532 ]
  %549 = icmp ugt i32 %547, 7
  br i1 %549, label %552, label %550

550:                                              ; preds = %545
  %551 = icmp eq i32 %547, 0
  br i1 %551, label %605, label %592

552:                                              ; preds = %545
  %553 = load i8, i8 addrspace(4)* %546, align 1, !tbaa !8
  %554 = zext i8 %553 to i64
  %555 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 1
  %556 = load i8, i8 addrspace(4)* %555, align 1, !tbaa !8
  %557 = zext i8 %556 to i64
  %558 = shl nuw nsw i64 %557, 8
  %559 = or i64 %558, %554
  %560 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 2
  %561 = load i8, i8 addrspace(4)* %560, align 1, !tbaa !8
  %562 = zext i8 %561 to i64
  %563 = shl nuw nsw i64 %562, 16
  %564 = or i64 %559, %563
  %565 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 3
  %566 = load i8, i8 addrspace(4)* %565, align 1, !tbaa !8
  %567 = zext i8 %566 to i64
  %568 = shl nuw nsw i64 %567, 24
  %569 = or i64 %564, %568
  %570 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 4
  %571 = load i8, i8 addrspace(4)* %570, align 1, !tbaa !8
  %572 = zext i8 %571 to i64
  %573 = shl nuw nsw i64 %572, 32
  %574 = or i64 %569, %573
  %575 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 5
  %576 = load i8, i8 addrspace(4)* %575, align 1, !tbaa !8
  %577 = zext i8 %576 to i64
  %578 = shl nuw nsw i64 %577, 40
  %579 = or i64 %574, %578
  %580 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 6
  %581 = load i8, i8 addrspace(4)* %580, align 1, !tbaa !8
  %582 = zext i8 %581 to i64
  %583 = shl nuw nsw i64 %582, 48
  %584 = or i64 %579, %583
  %585 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 7
  %586 = load i8, i8 addrspace(4)* %585, align 1, !tbaa !8
  %587 = zext i8 %586 to i64
  %588 = shl nuw i64 %587, 56
  %589 = or i64 %584, %588
  %590 = add nsw i32 %547, -8
  %591 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 8
  br label %605

592:                                              ; preds = %550, %592
  %593 = phi i32 [ %603, %592 ], [ 0, %550 ]
  %594 = phi i64 [ %602, %592 ], [ 0, %550 ]
  %595 = zext i32 %593 to i64
  %596 = getelementptr inbounds i8, i8 addrspace(4)* %546, i64 %595
  %597 = load i8, i8 addrspace(4)* %596, align 1, !tbaa !8
  %598 = zext i8 %597 to i64
  %599 = shl i32 %593, 3
  %600 = zext i32 %599 to i64
  %601 = shl nuw i64 %598, %600
  %602 = or i64 %601, %594
  %603 = add nuw nsw i32 %593, 1
  %604 = icmp eq i32 %603, %547
  br i1 %604, label %605, label %592

605:                                              ; preds = %592, %552, %550
  %606 = phi i8 addrspace(4)* [ %591, %552 ], [ %546, %550 ], [ %546, %592 ]
  %607 = phi i32 [ %590, %552 ], [ 0, %550 ], [ 0, %592 ]
  %608 = phi i64 [ %589, %552 ], [ 0, %550 ], [ %602, %592 ]
  %609 = icmp ugt i32 %607, 7
  br i1 %609, label %612, label %610

610:                                              ; preds = %605
  %611 = icmp eq i32 %607, 0
  br i1 %611, label %665, label %652

612:                                              ; preds = %605
  %613 = load i8, i8 addrspace(4)* %606, align 1, !tbaa !8
  %614 = zext i8 %613 to i64
  %615 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 1
  %616 = load i8, i8 addrspace(4)* %615, align 1, !tbaa !8
  %617 = zext i8 %616 to i64
  %618 = shl nuw nsw i64 %617, 8
  %619 = or i64 %618, %614
  %620 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 2
  %621 = load i8, i8 addrspace(4)* %620, align 1, !tbaa !8
  %622 = zext i8 %621 to i64
  %623 = shl nuw nsw i64 %622, 16
  %624 = or i64 %619, %623
  %625 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 3
  %626 = load i8, i8 addrspace(4)* %625, align 1, !tbaa !8
  %627 = zext i8 %626 to i64
  %628 = shl nuw nsw i64 %627, 24
  %629 = or i64 %624, %628
  %630 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 4
  %631 = load i8, i8 addrspace(4)* %630, align 1, !tbaa !8
  %632 = zext i8 %631 to i64
  %633 = shl nuw nsw i64 %632, 32
  %634 = or i64 %629, %633
  %635 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 5
  %636 = load i8, i8 addrspace(4)* %635, align 1, !tbaa !8
  %637 = zext i8 %636 to i64
  %638 = shl nuw nsw i64 %637, 40
  %639 = or i64 %634, %638
  %640 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 6
  %641 = load i8, i8 addrspace(4)* %640, align 1, !tbaa !8
  %642 = zext i8 %641 to i64
  %643 = shl nuw nsw i64 %642, 48
  %644 = or i64 %639, %643
  %645 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 7
  %646 = load i8, i8 addrspace(4)* %645, align 1, !tbaa !8
  %647 = zext i8 %646 to i64
  %648 = shl nuw i64 %647, 56
  %649 = or i64 %644, %648
  %650 = add nsw i32 %607, -8
  %651 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 8
  br label %665

652:                                              ; preds = %610, %652
  %653 = phi i32 [ %663, %652 ], [ 0, %610 ]
  %654 = phi i64 [ %662, %652 ], [ 0, %610 ]
  %655 = zext i32 %653 to i64
  %656 = getelementptr inbounds i8, i8 addrspace(4)* %606, i64 %655
  %657 = load i8, i8 addrspace(4)* %656, align 1, !tbaa !8
  %658 = zext i8 %657 to i64
  %659 = shl i32 %653, 3
  %660 = zext i32 %659 to i64
  %661 = shl nuw i64 %658, %660
  %662 = or i64 %661, %654
  %663 = add nuw nsw i32 %653, 1
  %664 = icmp eq i32 %663, %607
  br i1 %664, label %665, label %652

665:                                              ; preds = %652, %612, %610
  %666 = phi i8 addrspace(4)* [ %651, %612 ], [ %606, %610 ], [ %606, %652 ]
  %667 = phi i32 [ %650, %612 ], [ 0, %610 ], [ 0, %652 ]
  %668 = phi i64 [ %649, %612 ], [ 0, %610 ], [ %662, %652 ]
  %669 = icmp ugt i32 %667, 7
  br i1 %669, label %672, label %670

670:                                              ; preds = %665
  %671 = icmp eq i32 %667, 0
  br i1 %671, label %725, label %712

672:                                              ; preds = %665
  %673 = load i8, i8 addrspace(4)* %666, align 1, !tbaa !8
  %674 = zext i8 %673 to i64
  %675 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 1
  %676 = load i8, i8 addrspace(4)* %675, align 1, !tbaa !8
  %677 = zext i8 %676 to i64
  %678 = shl nuw nsw i64 %677, 8
  %679 = or i64 %678, %674
  %680 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 2
  %681 = load i8, i8 addrspace(4)* %680, align 1, !tbaa !8
  %682 = zext i8 %681 to i64
  %683 = shl nuw nsw i64 %682, 16
  %684 = or i64 %679, %683
  %685 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 3
  %686 = load i8, i8 addrspace(4)* %685, align 1, !tbaa !8
  %687 = zext i8 %686 to i64
  %688 = shl nuw nsw i64 %687, 24
  %689 = or i64 %684, %688
  %690 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 4
  %691 = load i8, i8 addrspace(4)* %690, align 1, !tbaa !8
  %692 = zext i8 %691 to i64
  %693 = shl nuw nsw i64 %692, 32
  %694 = or i64 %689, %693
  %695 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 5
  %696 = load i8, i8 addrspace(4)* %695, align 1, !tbaa !8
  %697 = zext i8 %696 to i64
  %698 = shl nuw nsw i64 %697, 40
  %699 = or i64 %694, %698
  %700 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 6
  %701 = load i8, i8 addrspace(4)* %700, align 1, !tbaa !8
  %702 = zext i8 %701 to i64
  %703 = shl nuw nsw i64 %702, 48
  %704 = or i64 %699, %703
  %705 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 7
  %706 = load i8, i8 addrspace(4)* %705, align 1, !tbaa !8
  %707 = zext i8 %706 to i64
  %708 = shl nuw i64 %707, 56
  %709 = or i64 %704, %708
  %710 = add nsw i32 %667, -8
  %711 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 8
  br label %725

712:                                              ; preds = %670, %712
  %713 = phi i32 [ %723, %712 ], [ 0, %670 ]
  %714 = phi i64 [ %722, %712 ], [ 0, %670 ]
  %715 = zext i32 %713 to i64
  %716 = getelementptr inbounds i8, i8 addrspace(4)* %666, i64 %715
  %717 = load i8, i8 addrspace(4)* %716, align 1, !tbaa !8
  %718 = zext i8 %717 to i64
  %719 = shl i32 %713, 3
  %720 = zext i32 %719 to i64
  %721 = shl nuw i64 %718, %720
  %722 = or i64 %721, %714
  %723 = add nuw nsw i32 %713, 1
  %724 = icmp eq i32 %723, %667
  br i1 %724, label %725, label %712

725:                                              ; preds = %712, %672, %670
  %726 = phi i8 addrspace(4)* [ %711, %672 ], [ %666, %670 ], [ %666, %712 ]
  %727 = phi i32 [ %710, %672 ], [ 0, %670 ], [ 0, %712 ]
  %728 = phi i64 [ %709, %672 ], [ 0, %670 ], [ %722, %712 ]
  %729 = icmp ugt i32 %727, 7
  br i1 %729, label %732, label %730

730:                                              ; preds = %725
  %731 = icmp eq i32 %727, 0
  br i1 %731, label %785, label %772

732:                                              ; preds = %725
  %733 = load i8, i8 addrspace(4)* %726, align 1, !tbaa !8
  %734 = zext i8 %733 to i64
  %735 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 1
  %736 = load i8, i8 addrspace(4)* %735, align 1, !tbaa !8
  %737 = zext i8 %736 to i64
  %738 = shl nuw nsw i64 %737, 8
  %739 = or i64 %738, %734
  %740 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 2
  %741 = load i8, i8 addrspace(4)* %740, align 1, !tbaa !8
  %742 = zext i8 %741 to i64
  %743 = shl nuw nsw i64 %742, 16
  %744 = or i64 %739, %743
  %745 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 3
  %746 = load i8, i8 addrspace(4)* %745, align 1, !tbaa !8
  %747 = zext i8 %746 to i64
  %748 = shl nuw nsw i64 %747, 24
  %749 = or i64 %744, %748
  %750 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 4
  %751 = load i8, i8 addrspace(4)* %750, align 1, !tbaa !8
  %752 = zext i8 %751 to i64
  %753 = shl nuw nsw i64 %752, 32
  %754 = or i64 %749, %753
  %755 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 5
  %756 = load i8, i8 addrspace(4)* %755, align 1, !tbaa !8
  %757 = zext i8 %756 to i64
  %758 = shl nuw nsw i64 %757, 40
  %759 = or i64 %754, %758
  %760 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 6
  %761 = load i8, i8 addrspace(4)* %760, align 1, !tbaa !8
  %762 = zext i8 %761 to i64
  %763 = shl nuw nsw i64 %762, 48
  %764 = or i64 %759, %763
  %765 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 7
  %766 = load i8, i8 addrspace(4)* %765, align 1, !tbaa !8
  %767 = zext i8 %766 to i64
  %768 = shl nuw i64 %767, 56
  %769 = or i64 %764, %768
  %770 = add nsw i32 %727, -8
  %771 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 8
  br label %785

772:                                              ; preds = %730, %772
  %773 = phi i32 [ %783, %772 ], [ 0, %730 ]
  %774 = phi i64 [ %782, %772 ], [ 0, %730 ]
  %775 = zext i32 %773 to i64
  %776 = getelementptr inbounds i8, i8 addrspace(4)* %726, i64 %775
  %777 = load i8, i8 addrspace(4)* %776, align 1, !tbaa !8
  %778 = zext i8 %777 to i64
  %779 = shl i32 %773, 3
  %780 = zext i32 %779 to i64
  %781 = shl nuw i64 %778, %780
  %782 = or i64 %781, %774
  %783 = add nuw nsw i32 %773, 1
  %784 = icmp eq i32 %783, %727
  br i1 %784, label %785, label %772

785:                                              ; preds = %772, %732, %730
  %786 = phi i8 addrspace(4)* [ %771, %732 ], [ %726, %730 ], [ %726, %772 ]
  %787 = phi i32 [ %770, %732 ], [ 0, %730 ], [ 0, %772 ]
  %788 = phi i64 [ %769, %732 ], [ 0, %730 ], [ %782, %772 ]
  %789 = icmp ugt i32 %787, 7
  br i1 %789, label %792, label %790

790:                                              ; preds = %785
  %791 = icmp eq i32 %787, 0
  br i1 %791, label %845, label %832

792:                                              ; preds = %785
  %793 = load i8, i8 addrspace(4)* %786, align 1, !tbaa !8
  %794 = zext i8 %793 to i64
  %795 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 1
  %796 = load i8, i8 addrspace(4)* %795, align 1, !tbaa !8
  %797 = zext i8 %796 to i64
  %798 = shl nuw nsw i64 %797, 8
  %799 = or i64 %798, %794
  %800 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 2
  %801 = load i8, i8 addrspace(4)* %800, align 1, !tbaa !8
  %802 = zext i8 %801 to i64
  %803 = shl nuw nsw i64 %802, 16
  %804 = or i64 %799, %803
  %805 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 3
  %806 = load i8, i8 addrspace(4)* %805, align 1, !tbaa !8
  %807 = zext i8 %806 to i64
  %808 = shl nuw nsw i64 %807, 24
  %809 = or i64 %804, %808
  %810 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 4
  %811 = load i8, i8 addrspace(4)* %810, align 1, !tbaa !8
  %812 = zext i8 %811 to i64
  %813 = shl nuw nsw i64 %812, 32
  %814 = or i64 %809, %813
  %815 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 5
  %816 = load i8, i8 addrspace(4)* %815, align 1, !tbaa !8
  %817 = zext i8 %816 to i64
  %818 = shl nuw nsw i64 %817, 40
  %819 = or i64 %814, %818
  %820 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 6
  %821 = load i8, i8 addrspace(4)* %820, align 1, !tbaa !8
  %822 = zext i8 %821 to i64
  %823 = shl nuw nsw i64 %822, 48
  %824 = or i64 %819, %823
  %825 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 7
  %826 = load i8, i8 addrspace(4)* %825, align 1, !tbaa !8
  %827 = zext i8 %826 to i64
  %828 = shl nuw i64 %827, 56
  %829 = or i64 %824, %828
  %830 = add nsw i32 %787, -8
  %831 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 8
  br label %845

832:                                              ; preds = %790, %832
  %833 = phi i32 [ %843, %832 ], [ 0, %790 ]
  %834 = phi i64 [ %842, %832 ], [ 0, %790 ]
  %835 = zext i32 %833 to i64
  %836 = getelementptr inbounds i8, i8 addrspace(4)* %786, i64 %835
  %837 = load i8, i8 addrspace(4)* %836, align 1, !tbaa !8
  %838 = zext i8 %837 to i64
  %839 = shl i32 %833, 3
  %840 = zext i32 %839 to i64
  %841 = shl nuw i64 %838, %840
  %842 = or i64 %841, %834
  %843 = add nuw nsw i32 %833, 1
  %844 = icmp eq i32 %843, %787
  br i1 %844, label %845, label %832

845:                                              ; preds = %832, %792, %790
  %846 = phi i8 addrspace(4)* [ %831, %792 ], [ %786, %790 ], [ %786, %832 ]
  %847 = phi i32 [ %830, %792 ], [ 0, %790 ], [ 0, %832 ]
  %848 = phi i64 [ %829, %792 ], [ 0, %790 ], [ %842, %832 ]
  %849 = icmp ugt i32 %847, 7
  br i1 %849, label %852, label %850

850:                                              ; preds = %845
  %851 = icmp eq i32 %847, 0
  br i1 %851, label %903, label %890

852:                                              ; preds = %845
  %853 = load i8, i8 addrspace(4)* %846, align 1, !tbaa !8
  %854 = zext i8 %853 to i64
  %855 = getelementptr inbounds i8, i8 addrspace(4)* %846, i64 1
  %856 = load i8, i8 addrspace(4)* %855, align 1, !tbaa !8
  %857 = zext i8 %856 to i64
  %858 = shl nuw nsw i64 %857, 8
  %859 = or i64 %858, %854
  %860 = getelementptr inbounds i8, i8 addrspace(4)* %846, i64 2
  %861 = load i8, i8 addrspace(4)* %860, align 1, !tbaa !8
  %862 = zext i8 %861 to i64
  %863 = shl nuw nsw i64 %862, 16
  %864 = or i64 %859, %863
  %865 = getelementptr inbounds i8, i8 addrspace(4)* %846, i64 3
  %866 = load i8, i8 addrspace(4)* %865, align 1, !tbaa !8
  %867 = zext i8 %866 to i64
  %868 = shl nuw nsw i64 %867, 24
  %869 = or i64 %864, %868
  %870 = getelementptr inbounds i8, i8 addrspace(4)* %846, i64 4
  %871 = load i8, i8 addrspace(4)* %870, align 1, !tbaa !8
  %872 = zext i8 %871 to i64
  %873 = shl nuw nsw i64 %872, 32
  %874 = or i64 %869, %873
  %875 = getelementptr inbounds i8, i8 addrspace(4)* %846, i64 5
  %876 = load i8, i8 addrspace(4)* %875, align 1, !tbaa !8
  %877 = zext i8 %876 to i64
  %878 = shl nuw nsw i64 %877, 40
  %879 = or i64 %874, %878
  %880 = getelementptr inbounds i8, i8 addrspace(4)* %846, i64 6
  %881 = load i8, i8 addrspace(4)* %880, align 1, !tbaa !8
  %882 = zext i8 %881 to i64
  %883 = shl nuw nsw i64 %882, 48
  %884 = or i64 %879, %883
  %885 = getelementptr inbounds i8, i8 addrspace(4)* %846, i64 7
  %886 = load i8, i8 addrspace(4)* %885, align 1, !tbaa !8
  %887 = zext i8 %886 to i64
  %888 = shl nuw i64 %887, 56
  %889 = or i64 %884, %888
  br label %903

890:                                              ; preds = %850, %890
  %891 = phi i32 [ %901, %890 ], [ 0, %850 ]
  %892 = phi i64 [ %900, %890 ], [ 0, %850 ]
  %893 = zext i32 %891 to i64
  %894 = getelementptr inbounds i8, i8 addrspace(4)* %846, i64 %893
  %895 = load i8, i8 addrspace(4)* %894, align 1, !tbaa !8
  %896 = zext i8 %895 to i64
  %897 = shl i32 %891, 3
  %898 = zext i32 %897 to i64
  %899 = shl nuw i64 %896, %898
  %900 = or i64 %899, %892
  %901 = add nuw nsw i32 %891, 1
  %902 = icmp eq i32 %901, %847
  br i1 %902, label %903, label %890

903:                                              ; preds = %890, %852, %850
  %904 = phi i64 [ %889, %852 ], [ 0, %850 ], [ %900, %890 ]
  %905 = shl nuw nsw i64 %486, 2
  %906 = add nuw nsw i64 %905, 28
  %907 = and i64 %906, 480
  %908 = and i64 %488, -225
  %909 = or i64 %908, %907
  %910 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %909, i64 noundef %548, i64 noundef %608, i64 noundef %668, i64 noundef %728, i64 noundef %788, i64 noundef %848, i64 noundef %904) #10
  %911 = sub i64 %478, %486
  %912 = getelementptr inbounds i8, i8 addrspace(4)* %479, i64 %486
  %913 = icmp eq i64 %911, 0
  br i1 %913, label %914, label %477

914:                                              ; preds = %903, %469
  %915 = phi <2 x i64> [ %472, %469 ], [ %910, %903 ]
  %916 = extractelement <2 x i64> %915, i64 0
  %917 = and i64 %916, -227
  %918 = or i64 %917, 34
  %919 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %918, i64 noundef %466, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %920 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %921 = bitcast double addrspace(1)* %920 to i64 addrspace(1)*
  %922 = load i64, i64 addrspace(1)* %921, align 8, !tbaa !11
  %923 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %924 = extractelement <2 x i64> %923, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %925, label %929

925:                                              ; preds = %914
  %926 = and i64 %924, -225
  %927 = or i64 %926, 32
  %928 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %927, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1370

929:                                              ; preds = %914
  %930 = and i64 %924, 2
  %931 = and i64 %924, -3
  %932 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %931, i64 0
  br label %933

933:                                              ; preds = %1359, %929
  %934 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 16) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([17 x i8]* addrspacecast ([17 x i8] addrspace(4)* @.str.1 to [17 x i8]*) to i64)), i64 1))), %929 ], [ %1367, %1359 ]
  %935 = phi i8 addrspace(4)* [ getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %929 ], [ %1368, %1359 ]
  %936 = phi <2 x i64> [ %932, %929 ], [ %1366, %1359 ]
  %937 = icmp ugt i64 %934, 56
  %938 = extractelement <2 x i64> %936, i64 0
  %939 = or i64 %938, %930
  %940 = insertelement <2 x i64> poison, i64 %939, i64 0
  %941 = select i1 %937, <2 x i64> %936, <2 x i64> %940
  %942 = tail call i64 @llvm.umin.i64(i64 %934, i64 56)
  %943 = trunc i64 %942 to i32
  %944 = extractelement <2 x i64> %941, i64 0
  %945 = icmp ugt i32 %943, 7
  br i1 %945, label %948, label %946

946:                                              ; preds = %933
  %947 = icmp eq i32 %943, 0
  br i1 %947, label %1001, label %988

948:                                              ; preds = %933
  %949 = load i8, i8 addrspace(4)* %935, align 1, !tbaa !8
  %950 = zext i8 %949 to i64
  %951 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 1
  %952 = load i8, i8 addrspace(4)* %951, align 1, !tbaa !8
  %953 = zext i8 %952 to i64
  %954 = shl nuw nsw i64 %953, 8
  %955 = or i64 %954, %950
  %956 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 2
  %957 = load i8, i8 addrspace(4)* %956, align 1, !tbaa !8
  %958 = zext i8 %957 to i64
  %959 = shl nuw nsw i64 %958, 16
  %960 = or i64 %955, %959
  %961 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 3
  %962 = load i8, i8 addrspace(4)* %961, align 1, !tbaa !8
  %963 = zext i8 %962 to i64
  %964 = shl nuw nsw i64 %963, 24
  %965 = or i64 %960, %964
  %966 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 4
  %967 = load i8, i8 addrspace(4)* %966, align 1, !tbaa !8
  %968 = zext i8 %967 to i64
  %969 = shl nuw nsw i64 %968, 32
  %970 = or i64 %965, %969
  %971 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 5
  %972 = load i8, i8 addrspace(4)* %971, align 1, !tbaa !8
  %973 = zext i8 %972 to i64
  %974 = shl nuw nsw i64 %973, 40
  %975 = or i64 %970, %974
  %976 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 6
  %977 = load i8, i8 addrspace(4)* %976, align 1, !tbaa !8
  %978 = zext i8 %977 to i64
  %979 = shl nuw nsw i64 %978, 48
  %980 = or i64 %975, %979
  %981 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 7
  %982 = load i8, i8 addrspace(4)* %981, align 1, !tbaa !8
  %983 = zext i8 %982 to i64
  %984 = shl nuw i64 %983, 56
  %985 = or i64 %980, %984
  %986 = add nsw i32 %943, -8
  %987 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 8
  br label %1001

988:                                              ; preds = %946, %988
  %989 = phi i32 [ %999, %988 ], [ 0, %946 ]
  %990 = phi i64 [ %998, %988 ], [ 0, %946 ]
  %991 = zext i32 %989 to i64
  %992 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 %991
  %993 = load i8, i8 addrspace(4)* %992, align 1, !tbaa !8
  %994 = zext i8 %993 to i64
  %995 = shl i32 %989, 3
  %996 = zext i32 %995 to i64
  %997 = shl nuw i64 %994, %996
  %998 = or i64 %997, %990
  %999 = add nuw nsw i32 %989, 1
  %1000 = icmp eq i32 %999, %943
  br i1 %1000, label %1001, label %988, !llvm.loop !9

1001:                                             ; preds = %988, %948, %946
  %1002 = phi i8 addrspace(4)* [ %987, %948 ], [ %935, %946 ], [ %935, %988 ]
  %1003 = phi i32 [ %986, %948 ], [ 0, %946 ], [ 0, %988 ]
  %1004 = phi i64 [ %985, %948 ], [ 0, %946 ], [ %998, %988 ]
  %1005 = icmp ugt i32 %1003, 7
  br i1 %1005, label %1008, label %1006

1006:                                             ; preds = %1001
  %1007 = icmp eq i32 %1003, 0
  br i1 %1007, label %1061, label %1048

1008:                                             ; preds = %1001
  %1009 = load i8, i8 addrspace(4)* %1002, align 1, !tbaa !8
  %1010 = zext i8 %1009 to i64
  %1011 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 1
  %1012 = load i8, i8 addrspace(4)* %1011, align 1, !tbaa !8
  %1013 = zext i8 %1012 to i64
  %1014 = shl nuw nsw i64 %1013, 8
  %1015 = or i64 %1014, %1010
  %1016 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 2
  %1017 = load i8, i8 addrspace(4)* %1016, align 1, !tbaa !8
  %1018 = zext i8 %1017 to i64
  %1019 = shl nuw nsw i64 %1018, 16
  %1020 = or i64 %1015, %1019
  %1021 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 3
  %1022 = load i8, i8 addrspace(4)* %1021, align 1, !tbaa !8
  %1023 = zext i8 %1022 to i64
  %1024 = shl nuw nsw i64 %1023, 24
  %1025 = or i64 %1020, %1024
  %1026 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 4
  %1027 = load i8, i8 addrspace(4)* %1026, align 1, !tbaa !8
  %1028 = zext i8 %1027 to i64
  %1029 = shl nuw nsw i64 %1028, 32
  %1030 = or i64 %1025, %1029
  %1031 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 5
  %1032 = load i8, i8 addrspace(4)* %1031, align 1, !tbaa !8
  %1033 = zext i8 %1032 to i64
  %1034 = shl nuw nsw i64 %1033, 40
  %1035 = or i64 %1030, %1034
  %1036 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 6
  %1037 = load i8, i8 addrspace(4)* %1036, align 1, !tbaa !8
  %1038 = zext i8 %1037 to i64
  %1039 = shl nuw nsw i64 %1038, 48
  %1040 = or i64 %1035, %1039
  %1041 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 7
  %1042 = load i8, i8 addrspace(4)* %1041, align 1, !tbaa !8
  %1043 = zext i8 %1042 to i64
  %1044 = shl nuw i64 %1043, 56
  %1045 = or i64 %1040, %1044
  %1046 = add nsw i32 %1003, -8
  %1047 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 8
  br label %1061

1048:                                             ; preds = %1006, %1048
  %1049 = phi i32 [ %1059, %1048 ], [ 0, %1006 ]
  %1050 = phi i64 [ %1058, %1048 ], [ 0, %1006 ]
  %1051 = zext i32 %1049 to i64
  %1052 = getelementptr inbounds i8, i8 addrspace(4)* %1002, i64 %1051
  %1053 = load i8, i8 addrspace(4)* %1052, align 1, !tbaa !8
  %1054 = zext i8 %1053 to i64
  %1055 = shl i32 %1049, 3
  %1056 = zext i32 %1055 to i64
  %1057 = shl nuw i64 %1054, %1056
  %1058 = or i64 %1057, %1050
  %1059 = add nuw nsw i32 %1049, 1
  %1060 = icmp eq i32 %1059, %1003
  br i1 %1060, label %1061, label %1048

1061:                                             ; preds = %1048, %1008, %1006
  %1062 = phi i8 addrspace(4)* [ %1047, %1008 ], [ %1002, %1006 ], [ %1002, %1048 ]
  %1063 = phi i32 [ %1046, %1008 ], [ 0, %1006 ], [ 0, %1048 ]
  %1064 = phi i64 [ %1045, %1008 ], [ 0, %1006 ], [ %1058, %1048 ]
  %1065 = icmp ugt i32 %1063, 7
  br i1 %1065, label %1068, label %1066

1066:                                             ; preds = %1061
  %1067 = icmp eq i32 %1063, 0
  br i1 %1067, label %1121, label %1108

1068:                                             ; preds = %1061
  %1069 = load i8, i8 addrspace(4)* %1062, align 1, !tbaa !8
  %1070 = zext i8 %1069 to i64
  %1071 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 1
  %1072 = load i8, i8 addrspace(4)* %1071, align 1, !tbaa !8
  %1073 = zext i8 %1072 to i64
  %1074 = shl nuw nsw i64 %1073, 8
  %1075 = or i64 %1074, %1070
  %1076 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 2
  %1077 = load i8, i8 addrspace(4)* %1076, align 1, !tbaa !8
  %1078 = zext i8 %1077 to i64
  %1079 = shl nuw nsw i64 %1078, 16
  %1080 = or i64 %1075, %1079
  %1081 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 3
  %1082 = load i8, i8 addrspace(4)* %1081, align 1, !tbaa !8
  %1083 = zext i8 %1082 to i64
  %1084 = shl nuw nsw i64 %1083, 24
  %1085 = or i64 %1080, %1084
  %1086 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 4
  %1087 = load i8, i8 addrspace(4)* %1086, align 1, !tbaa !8
  %1088 = zext i8 %1087 to i64
  %1089 = shl nuw nsw i64 %1088, 32
  %1090 = or i64 %1085, %1089
  %1091 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 5
  %1092 = load i8, i8 addrspace(4)* %1091, align 1, !tbaa !8
  %1093 = zext i8 %1092 to i64
  %1094 = shl nuw nsw i64 %1093, 40
  %1095 = or i64 %1090, %1094
  %1096 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 6
  %1097 = load i8, i8 addrspace(4)* %1096, align 1, !tbaa !8
  %1098 = zext i8 %1097 to i64
  %1099 = shl nuw nsw i64 %1098, 48
  %1100 = or i64 %1095, %1099
  %1101 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 7
  %1102 = load i8, i8 addrspace(4)* %1101, align 1, !tbaa !8
  %1103 = zext i8 %1102 to i64
  %1104 = shl nuw i64 %1103, 56
  %1105 = or i64 %1100, %1104
  %1106 = add nsw i32 %1063, -8
  %1107 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 8
  br label %1121

1108:                                             ; preds = %1066, %1108
  %1109 = phi i32 [ %1119, %1108 ], [ 0, %1066 ]
  %1110 = phi i64 [ %1118, %1108 ], [ 0, %1066 ]
  %1111 = zext i32 %1109 to i64
  %1112 = getelementptr inbounds i8, i8 addrspace(4)* %1062, i64 %1111
  %1113 = load i8, i8 addrspace(4)* %1112, align 1, !tbaa !8
  %1114 = zext i8 %1113 to i64
  %1115 = shl i32 %1109, 3
  %1116 = zext i32 %1115 to i64
  %1117 = shl nuw i64 %1114, %1116
  %1118 = or i64 %1117, %1110
  %1119 = add nuw nsw i32 %1109, 1
  %1120 = icmp eq i32 %1119, %1063
  br i1 %1120, label %1121, label %1108

1121:                                             ; preds = %1108, %1068, %1066
  %1122 = phi i8 addrspace(4)* [ %1107, %1068 ], [ %1062, %1066 ], [ %1062, %1108 ]
  %1123 = phi i32 [ %1106, %1068 ], [ 0, %1066 ], [ 0, %1108 ]
  %1124 = phi i64 [ %1105, %1068 ], [ 0, %1066 ], [ %1118, %1108 ]
  %1125 = icmp ugt i32 %1123, 7
  br i1 %1125, label %1128, label %1126

1126:                                             ; preds = %1121
  %1127 = icmp eq i32 %1123, 0
  br i1 %1127, label %1181, label %1168

1128:                                             ; preds = %1121
  %1129 = load i8, i8 addrspace(4)* %1122, align 1, !tbaa !8
  %1130 = zext i8 %1129 to i64
  %1131 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 1
  %1132 = load i8, i8 addrspace(4)* %1131, align 1, !tbaa !8
  %1133 = zext i8 %1132 to i64
  %1134 = shl nuw nsw i64 %1133, 8
  %1135 = or i64 %1134, %1130
  %1136 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 2
  %1137 = load i8, i8 addrspace(4)* %1136, align 1, !tbaa !8
  %1138 = zext i8 %1137 to i64
  %1139 = shl nuw nsw i64 %1138, 16
  %1140 = or i64 %1135, %1139
  %1141 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 3
  %1142 = load i8, i8 addrspace(4)* %1141, align 1, !tbaa !8
  %1143 = zext i8 %1142 to i64
  %1144 = shl nuw nsw i64 %1143, 24
  %1145 = or i64 %1140, %1144
  %1146 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 4
  %1147 = load i8, i8 addrspace(4)* %1146, align 1, !tbaa !8
  %1148 = zext i8 %1147 to i64
  %1149 = shl nuw nsw i64 %1148, 32
  %1150 = or i64 %1145, %1149
  %1151 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 5
  %1152 = load i8, i8 addrspace(4)* %1151, align 1, !tbaa !8
  %1153 = zext i8 %1152 to i64
  %1154 = shl nuw nsw i64 %1153, 40
  %1155 = or i64 %1150, %1154
  %1156 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 6
  %1157 = load i8, i8 addrspace(4)* %1156, align 1, !tbaa !8
  %1158 = zext i8 %1157 to i64
  %1159 = shl nuw nsw i64 %1158, 48
  %1160 = or i64 %1155, %1159
  %1161 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 7
  %1162 = load i8, i8 addrspace(4)* %1161, align 1, !tbaa !8
  %1163 = zext i8 %1162 to i64
  %1164 = shl nuw i64 %1163, 56
  %1165 = or i64 %1160, %1164
  %1166 = add nsw i32 %1123, -8
  %1167 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 8
  br label %1181

1168:                                             ; preds = %1126, %1168
  %1169 = phi i32 [ %1179, %1168 ], [ 0, %1126 ]
  %1170 = phi i64 [ %1178, %1168 ], [ 0, %1126 ]
  %1171 = zext i32 %1169 to i64
  %1172 = getelementptr inbounds i8, i8 addrspace(4)* %1122, i64 %1171
  %1173 = load i8, i8 addrspace(4)* %1172, align 1, !tbaa !8
  %1174 = zext i8 %1173 to i64
  %1175 = shl i32 %1169, 3
  %1176 = zext i32 %1175 to i64
  %1177 = shl nuw i64 %1174, %1176
  %1178 = or i64 %1177, %1170
  %1179 = add nuw nsw i32 %1169, 1
  %1180 = icmp eq i32 %1179, %1123
  br i1 %1180, label %1181, label %1168

1181:                                             ; preds = %1168, %1128, %1126
  %1182 = phi i8 addrspace(4)* [ %1167, %1128 ], [ %1122, %1126 ], [ %1122, %1168 ]
  %1183 = phi i32 [ %1166, %1128 ], [ 0, %1126 ], [ 0, %1168 ]
  %1184 = phi i64 [ %1165, %1128 ], [ 0, %1126 ], [ %1178, %1168 ]
  %1185 = icmp ugt i32 %1183, 7
  br i1 %1185, label %1188, label %1186

1186:                                             ; preds = %1181
  %1187 = icmp eq i32 %1183, 0
  br i1 %1187, label %1241, label %1228

1188:                                             ; preds = %1181
  %1189 = load i8, i8 addrspace(4)* %1182, align 1, !tbaa !8
  %1190 = zext i8 %1189 to i64
  %1191 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 1
  %1192 = load i8, i8 addrspace(4)* %1191, align 1, !tbaa !8
  %1193 = zext i8 %1192 to i64
  %1194 = shl nuw nsw i64 %1193, 8
  %1195 = or i64 %1194, %1190
  %1196 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 2
  %1197 = load i8, i8 addrspace(4)* %1196, align 1, !tbaa !8
  %1198 = zext i8 %1197 to i64
  %1199 = shl nuw nsw i64 %1198, 16
  %1200 = or i64 %1195, %1199
  %1201 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 3
  %1202 = load i8, i8 addrspace(4)* %1201, align 1, !tbaa !8
  %1203 = zext i8 %1202 to i64
  %1204 = shl nuw nsw i64 %1203, 24
  %1205 = or i64 %1200, %1204
  %1206 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 4
  %1207 = load i8, i8 addrspace(4)* %1206, align 1, !tbaa !8
  %1208 = zext i8 %1207 to i64
  %1209 = shl nuw nsw i64 %1208, 32
  %1210 = or i64 %1205, %1209
  %1211 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 5
  %1212 = load i8, i8 addrspace(4)* %1211, align 1, !tbaa !8
  %1213 = zext i8 %1212 to i64
  %1214 = shl nuw nsw i64 %1213, 40
  %1215 = or i64 %1210, %1214
  %1216 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 6
  %1217 = load i8, i8 addrspace(4)* %1216, align 1, !tbaa !8
  %1218 = zext i8 %1217 to i64
  %1219 = shl nuw nsw i64 %1218, 48
  %1220 = or i64 %1215, %1219
  %1221 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 7
  %1222 = load i8, i8 addrspace(4)* %1221, align 1, !tbaa !8
  %1223 = zext i8 %1222 to i64
  %1224 = shl nuw i64 %1223, 56
  %1225 = or i64 %1220, %1224
  %1226 = add nsw i32 %1183, -8
  %1227 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 8
  br label %1241

1228:                                             ; preds = %1186, %1228
  %1229 = phi i32 [ %1239, %1228 ], [ 0, %1186 ]
  %1230 = phi i64 [ %1238, %1228 ], [ 0, %1186 ]
  %1231 = zext i32 %1229 to i64
  %1232 = getelementptr inbounds i8, i8 addrspace(4)* %1182, i64 %1231
  %1233 = load i8, i8 addrspace(4)* %1232, align 1, !tbaa !8
  %1234 = zext i8 %1233 to i64
  %1235 = shl i32 %1229, 3
  %1236 = zext i32 %1235 to i64
  %1237 = shl nuw i64 %1234, %1236
  %1238 = or i64 %1237, %1230
  %1239 = add nuw nsw i32 %1229, 1
  %1240 = icmp eq i32 %1239, %1183
  br i1 %1240, label %1241, label %1228

1241:                                             ; preds = %1228, %1188, %1186
  %1242 = phi i8 addrspace(4)* [ %1227, %1188 ], [ %1182, %1186 ], [ %1182, %1228 ]
  %1243 = phi i32 [ %1226, %1188 ], [ 0, %1186 ], [ 0, %1228 ]
  %1244 = phi i64 [ %1225, %1188 ], [ 0, %1186 ], [ %1238, %1228 ]
  %1245 = icmp ugt i32 %1243, 7
  br i1 %1245, label %1248, label %1246

1246:                                             ; preds = %1241
  %1247 = icmp eq i32 %1243, 0
  br i1 %1247, label %1301, label %1288

1248:                                             ; preds = %1241
  %1249 = load i8, i8 addrspace(4)* %1242, align 1, !tbaa !8
  %1250 = zext i8 %1249 to i64
  %1251 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 1
  %1252 = load i8, i8 addrspace(4)* %1251, align 1, !tbaa !8
  %1253 = zext i8 %1252 to i64
  %1254 = shl nuw nsw i64 %1253, 8
  %1255 = or i64 %1254, %1250
  %1256 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 2
  %1257 = load i8, i8 addrspace(4)* %1256, align 1, !tbaa !8
  %1258 = zext i8 %1257 to i64
  %1259 = shl nuw nsw i64 %1258, 16
  %1260 = or i64 %1255, %1259
  %1261 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 3
  %1262 = load i8, i8 addrspace(4)* %1261, align 1, !tbaa !8
  %1263 = zext i8 %1262 to i64
  %1264 = shl nuw nsw i64 %1263, 24
  %1265 = or i64 %1260, %1264
  %1266 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 4
  %1267 = load i8, i8 addrspace(4)* %1266, align 1, !tbaa !8
  %1268 = zext i8 %1267 to i64
  %1269 = shl nuw nsw i64 %1268, 32
  %1270 = or i64 %1265, %1269
  %1271 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 5
  %1272 = load i8, i8 addrspace(4)* %1271, align 1, !tbaa !8
  %1273 = zext i8 %1272 to i64
  %1274 = shl nuw nsw i64 %1273, 40
  %1275 = or i64 %1270, %1274
  %1276 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 6
  %1277 = load i8, i8 addrspace(4)* %1276, align 1, !tbaa !8
  %1278 = zext i8 %1277 to i64
  %1279 = shl nuw nsw i64 %1278, 48
  %1280 = or i64 %1275, %1279
  %1281 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 7
  %1282 = load i8, i8 addrspace(4)* %1281, align 1, !tbaa !8
  %1283 = zext i8 %1282 to i64
  %1284 = shl nuw i64 %1283, 56
  %1285 = or i64 %1280, %1284
  %1286 = add nsw i32 %1243, -8
  %1287 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 8
  br label %1301

1288:                                             ; preds = %1246, %1288
  %1289 = phi i32 [ %1299, %1288 ], [ 0, %1246 ]
  %1290 = phi i64 [ %1298, %1288 ], [ 0, %1246 ]
  %1291 = zext i32 %1289 to i64
  %1292 = getelementptr inbounds i8, i8 addrspace(4)* %1242, i64 %1291
  %1293 = load i8, i8 addrspace(4)* %1292, align 1, !tbaa !8
  %1294 = zext i8 %1293 to i64
  %1295 = shl i32 %1289, 3
  %1296 = zext i32 %1295 to i64
  %1297 = shl nuw i64 %1294, %1296
  %1298 = or i64 %1297, %1290
  %1299 = add nuw nsw i32 %1289, 1
  %1300 = icmp eq i32 %1299, %1243
  br i1 %1300, label %1301, label %1288

1301:                                             ; preds = %1288, %1248, %1246
  %1302 = phi i8 addrspace(4)* [ %1287, %1248 ], [ %1242, %1246 ], [ %1242, %1288 ]
  %1303 = phi i32 [ %1286, %1248 ], [ 0, %1246 ], [ 0, %1288 ]
  %1304 = phi i64 [ %1285, %1248 ], [ 0, %1246 ], [ %1298, %1288 ]
  %1305 = icmp ugt i32 %1303, 7
  br i1 %1305, label %1308, label %1306

1306:                                             ; preds = %1301
  %1307 = icmp eq i32 %1303, 0
  br i1 %1307, label %1359, label %1346

1308:                                             ; preds = %1301
  %1309 = load i8, i8 addrspace(4)* %1302, align 1, !tbaa !8
  %1310 = zext i8 %1309 to i64
  %1311 = getelementptr inbounds i8, i8 addrspace(4)* %1302, i64 1
  %1312 = load i8, i8 addrspace(4)* %1311, align 1, !tbaa !8
  %1313 = zext i8 %1312 to i64
  %1314 = shl nuw nsw i64 %1313, 8
  %1315 = or i64 %1314, %1310
  %1316 = getelementptr inbounds i8, i8 addrspace(4)* %1302, i64 2
  %1317 = load i8, i8 addrspace(4)* %1316, align 1, !tbaa !8
  %1318 = zext i8 %1317 to i64
  %1319 = shl nuw nsw i64 %1318, 16
  %1320 = or i64 %1315, %1319
  %1321 = getelementptr inbounds i8, i8 addrspace(4)* %1302, i64 3
  %1322 = load i8, i8 addrspace(4)* %1321, align 1, !tbaa !8
  %1323 = zext i8 %1322 to i64
  %1324 = shl nuw nsw i64 %1323, 24
  %1325 = or i64 %1320, %1324
  %1326 = getelementptr inbounds i8, i8 addrspace(4)* %1302, i64 4
  %1327 = load i8, i8 addrspace(4)* %1326, align 1, !tbaa !8
  %1328 = zext i8 %1327 to i64
  %1329 = shl nuw nsw i64 %1328, 32
  %1330 = or i64 %1325, %1329
  %1331 = getelementptr inbounds i8, i8 addrspace(4)* %1302, i64 5
  %1332 = load i8, i8 addrspace(4)* %1331, align 1, !tbaa !8
  %1333 = zext i8 %1332 to i64
  %1334 = shl nuw nsw i64 %1333, 40
  %1335 = or i64 %1330, %1334
  %1336 = getelementptr inbounds i8, i8 addrspace(4)* %1302, i64 6
  %1337 = load i8, i8 addrspace(4)* %1336, align 1, !tbaa !8
  %1338 = zext i8 %1337 to i64
  %1339 = shl nuw nsw i64 %1338, 48
  %1340 = or i64 %1335, %1339
  %1341 = getelementptr inbounds i8, i8 addrspace(4)* %1302, i64 7
  %1342 = load i8, i8 addrspace(4)* %1341, align 1, !tbaa !8
  %1343 = zext i8 %1342 to i64
  %1344 = shl nuw i64 %1343, 56
  %1345 = or i64 %1340, %1344
  br label %1359

1346:                                             ; preds = %1306, %1346
  %1347 = phi i32 [ %1357, %1346 ], [ 0, %1306 ]
  %1348 = phi i64 [ %1356, %1346 ], [ 0, %1306 ]
  %1349 = zext i32 %1347 to i64
  %1350 = getelementptr inbounds i8, i8 addrspace(4)* %1302, i64 %1349
  %1351 = load i8, i8 addrspace(4)* %1350, align 1, !tbaa !8
  %1352 = zext i8 %1351 to i64
  %1353 = shl i32 %1347, 3
  %1354 = zext i32 %1353 to i64
  %1355 = shl nuw i64 %1352, %1354
  %1356 = or i64 %1355, %1348
  %1357 = add nuw nsw i32 %1347, 1
  %1358 = icmp eq i32 %1357, %1303
  br i1 %1358, label %1359, label %1346

1359:                                             ; preds = %1346, %1308, %1306
  %1360 = phi i64 [ %1345, %1308 ], [ 0, %1306 ], [ %1356, %1346 ]
  %1361 = shl nuw nsw i64 %942, 2
  %1362 = add nuw nsw i64 %1361, 28
  %1363 = and i64 %1362, 480
  %1364 = and i64 %944, -225
  %1365 = or i64 %1364, %1363
  %1366 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %1365, i64 noundef %1004, i64 noundef %1064, i64 noundef %1124, i64 noundef %1184, i64 noundef %1244, i64 noundef %1304, i64 noundef %1360) #10
  %1367 = sub i64 %934, %942
  %1368 = getelementptr inbounds i8, i8 addrspace(4)* %935, i64 %942
  %1369 = icmp eq i64 %1367, 0
  br i1 %1369, label %1370, label %933

1370:                                             ; preds = %1359, %925
  %1371 = phi <2 x i64> [ %928, %925 ], [ %1366, %1359 ]
  %1372 = extractelement <2 x i64> %1371, i64 0
  %1373 = and i64 %1372, -227
  %1374 = or i64 %1373, 34
  %1375 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %1374, i64 noundef %922, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1376 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %1377 = bitcast double addrspace(1)* %1376 to i64 addrspace(1)*
  %1378 = load i64, i64 addrspace(1)* %1377, align 8, !tbaa !11
  %1379 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1380 = extractelement <2 x i64> %1379, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %1381, label %1385

1381:                                             ; preds = %1370
  %1382 = and i64 %1380, -225
  %1383 = or i64 %1382, 32
  %1384 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %1383, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1826

1385:                                             ; preds = %1370
  %1386 = and i64 %1380, 2
  %1387 = and i64 %1380, -3
  %1388 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1387, i64 0
  br label %1389

1389:                                             ; preds = %1815, %1385
  %1390 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 16) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([17 x i8]* addrspacecast ([17 x i8] addrspace(4)* @.str.1 to [17 x i8]*) to i64)), i64 1))), %1385 ], [ %1823, %1815 ]
  %1391 = phi i8 addrspace(4)* [ getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %1385 ], [ %1824, %1815 ]
  %1392 = phi <2 x i64> [ %1388, %1385 ], [ %1822, %1815 ]
  %1393 = icmp ugt i64 %1390, 56
  %1394 = extractelement <2 x i64> %1392, i64 0
  %1395 = or i64 %1394, %1386
  %1396 = insertelement <2 x i64> poison, i64 %1395, i64 0
  %1397 = select i1 %1393, <2 x i64> %1392, <2 x i64> %1396
  %1398 = tail call i64 @llvm.umin.i64(i64 %1390, i64 56)
  %1399 = trunc i64 %1398 to i32
  %1400 = extractelement <2 x i64> %1397, i64 0
  %1401 = icmp ugt i32 %1399, 7
  br i1 %1401, label %1404, label %1402

1402:                                             ; preds = %1389
  %1403 = icmp eq i32 %1399, 0
  br i1 %1403, label %1457, label %1444

1404:                                             ; preds = %1389
  %1405 = load i8, i8 addrspace(4)* %1391, align 1, !tbaa !8
  %1406 = zext i8 %1405 to i64
  %1407 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 1
  %1408 = load i8, i8 addrspace(4)* %1407, align 1, !tbaa !8
  %1409 = zext i8 %1408 to i64
  %1410 = shl nuw nsw i64 %1409, 8
  %1411 = or i64 %1410, %1406
  %1412 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 2
  %1413 = load i8, i8 addrspace(4)* %1412, align 1, !tbaa !8
  %1414 = zext i8 %1413 to i64
  %1415 = shl nuw nsw i64 %1414, 16
  %1416 = or i64 %1411, %1415
  %1417 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 3
  %1418 = load i8, i8 addrspace(4)* %1417, align 1, !tbaa !8
  %1419 = zext i8 %1418 to i64
  %1420 = shl nuw nsw i64 %1419, 24
  %1421 = or i64 %1416, %1420
  %1422 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 4
  %1423 = load i8, i8 addrspace(4)* %1422, align 1, !tbaa !8
  %1424 = zext i8 %1423 to i64
  %1425 = shl nuw nsw i64 %1424, 32
  %1426 = or i64 %1421, %1425
  %1427 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 5
  %1428 = load i8, i8 addrspace(4)* %1427, align 1, !tbaa !8
  %1429 = zext i8 %1428 to i64
  %1430 = shl nuw nsw i64 %1429, 40
  %1431 = or i64 %1426, %1430
  %1432 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 6
  %1433 = load i8, i8 addrspace(4)* %1432, align 1, !tbaa !8
  %1434 = zext i8 %1433 to i64
  %1435 = shl nuw nsw i64 %1434, 48
  %1436 = or i64 %1431, %1435
  %1437 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 7
  %1438 = load i8, i8 addrspace(4)* %1437, align 1, !tbaa !8
  %1439 = zext i8 %1438 to i64
  %1440 = shl nuw i64 %1439, 56
  %1441 = or i64 %1436, %1440
  %1442 = add nsw i32 %1399, -8
  %1443 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 8
  br label %1457

1444:                                             ; preds = %1402, %1444
  %1445 = phi i32 [ %1455, %1444 ], [ 0, %1402 ]
  %1446 = phi i64 [ %1454, %1444 ], [ 0, %1402 ]
  %1447 = zext i32 %1445 to i64
  %1448 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 %1447
  %1449 = load i8, i8 addrspace(4)* %1448, align 1, !tbaa !8
  %1450 = zext i8 %1449 to i64
  %1451 = shl i32 %1445, 3
  %1452 = zext i32 %1451 to i64
  %1453 = shl nuw i64 %1450, %1452
  %1454 = or i64 %1453, %1446
  %1455 = add nuw nsw i32 %1445, 1
  %1456 = icmp eq i32 %1455, %1399
  br i1 %1456, label %1457, label %1444, !llvm.loop !9

1457:                                             ; preds = %1444, %1404, %1402
  %1458 = phi i8 addrspace(4)* [ %1443, %1404 ], [ %1391, %1402 ], [ %1391, %1444 ]
  %1459 = phi i32 [ %1442, %1404 ], [ 0, %1402 ], [ 0, %1444 ]
  %1460 = phi i64 [ %1441, %1404 ], [ 0, %1402 ], [ %1454, %1444 ]
  %1461 = icmp ugt i32 %1459, 7
  br i1 %1461, label %1464, label %1462

1462:                                             ; preds = %1457
  %1463 = icmp eq i32 %1459, 0
  br i1 %1463, label %1517, label %1504

1464:                                             ; preds = %1457
  %1465 = load i8, i8 addrspace(4)* %1458, align 1, !tbaa !8
  %1466 = zext i8 %1465 to i64
  %1467 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 1
  %1468 = load i8, i8 addrspace(4)* %1467, align 1, !tbaa !8
  %1469 = zext i8 %1468 to i64
  %1470 = shl nuw nsw i64 %1469, 8
  %1471 = or i64 %1470, %1466
  %1472 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 2
  %1473 = load i8, i8 addrspace(4)* %1472, align 1, !tbaa !8
  %1474 = zext i8 %1473 to i64
  %1475 = shl nuw nsw i64 %1474, 16
  %1476 = or i64 %1471, %1475
  %1477 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 3
  %1478 = load i8, i8 addrspace(4)* %1477, align 1, !tbaa !8
  %1479 = zext i8 %1478 to i64
  %1480 = shl nuw nsw i64 %1479, 24
  %1481 = or i64 %1476, %1480
  %1482 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 4
  %1483 = load i8, i8 addrspace(4)* %1482, align 1, !tbaa !8
  %1484 = zext i8 %1483 to i64
  %1485 = shl nuw nsw i64 %1484, 32
  %1486 = or i64 %1481, %1485
  %1487 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 5
  %1488 = load i8, i8 addrspace(4)* %1487, align 1, !tbaa !8
  %1489 = zext i8 %1488 to i64
  %1490 = shl nuw nsw i64 %1489, 40
  %1491 = or i64 %1486, %1490
  %1492 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 6
  %1493 = load i8, i8 addrspace(4)* %1492, align 1, !tbaa !8
  %1494 = zext i8 %1493 to i64
  %1495 = shl nuw nsw i64 %1494, 48
  %1496 = or i64 %1491, %1495
  %1497 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 7
  %1498 = load i8, i8 addrspace(4)* %1497, align 1, !tbaa !8
  %1499 = zext i8 %1498 to i64
  %1500 = shl nuw i64 %1499, 56
  %1501 = or i64 %1496, %1500
  %1502 = add nsw i32 %1459, -8
  %1503 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 8
  br label %1517

1504:                                             ; preds = %1462, %1504
  %1505 = phi i32 [ %1515, %1504 ], [ 0, %1462 ]
  %1506 = phi i64 [ %1514, %1504 ], [ 0, %1462 ]
  %1507 = zext i32 %1505 to i64
  %1508 = getelementptr inbounds i8, i8 addrspace(4)* %1458, i64 %1507
  %1509 = load i8, i8 addrspace(4)* %1508, align 1, !tbaa !8
  %1510 = zext i8 %1509 to i64
  %1511 = shl i32 %1505, 3
  %1512 = zext i32 %1511 to i64
  %1513 = shl nuw i64 %1510, %1512
  %1514 = or i64 %1513, %1506
  %1515 = add nuw nsw i32 %1505, 1
  %1516 = icmp eq i32 %1515, %1459
  br i1 %1516, label %1517, label %1504

1517:                                             ; preds = %1504, %1464, %1462
  %1518 = phi i8 addrspace(4)* [ %1503, %1464 ], [ %1458, %1462 ], [ %1458, %1504 ]
  %1519 = phi i32 [ %1502, %1464 ], [ 0, %1462 ], [ 0, %1504 ]
  %1520 = phi i64 [ %1501, %1464 ], [ 0, %1462 ], [ %1514, %1504 ]
  %1521 = icmp ugt i32 %1519, 7
  br i1 %1521, label %1524, label %1522

1522:                                             ; preds = %1517
  %1523 = icmp eq i32 %1519, 0
  br i1 %1523, label %1577, label %1564

1524:                                             ; preds = %1517
  %1525 = load i8, i8 addrspace(4)* %1518, align 1, !tbaa !8
  %1526 = zext i8 %1525 to i64
  %1527 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 1
  %1528 = load i8, i8 addrspace(4)* %1527, align 1, !tbaa !8
  %1529 = zext i8 %1528 to i64
  %1530 = shl nuw nsw i64 %1529, 8
  %1531 = or i64 %1530, %1526
  %1532 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 2
  %1533 = load i8, i8 addrspace(4)* %1532, align 1, !tbaa !8
  %1534 = zext i8 %1533 to i64
  %1535 = shl nuw nsw i64 %1534, 16
  %1536 = or i64 %1531, %1535
  %1537 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 3
  %1538 = load i8, i8 addrspace(4)* %1537, align 1, !tbaa !8
  %1539 = zext i8 %1538 to i64
  %1540 = shl nuw nsw i64 %1539, 24
  %1541 = or i64 %1536, %1540
  %1542 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 4
  %1543 = load i8, i8 addrspace(4)* %1542, align 1, !tbaa !8
  %1544 = zext i8 %1543 to i64
  %1545 = shl nuw nsw i64 %1544, 32
  %1546 = or i64 %1541, %1545
  %1547 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 5
  %1548 = load i8, i8 addrspace(4)* %1547, align 1, !tbaa !8
  %1549 = zext i8 %1548 to i64
  %1550 = shl nuw nsw i64 %1549, 40
  %1551 = or i64 %1546, %1550
  %1552 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 6
  %1553 = load i8, i8 addrspace(4)* %1552, align 1, !tbaa !8
  %1554 = zext i8 %1553 to i64
  %1555 = shl nuw nsw i64 %1554, 48
  %1556 = or i64 %1551, %1555
  %1557 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 7
  %1558 = load i8, i8 addrspace(4)* %1557, align 1, !tbaa !8
  %1559 = zext i8 %1558 to i64
  %1560 = shl nuw i64 %1559, 56
  %1561 = or i64 %1556, %1560
  %1562 = add nsw i32 %1519, -8
  %1563 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 8
  br label %1577

1564:                                             ; preds = %1522, %1564
  %1565 = phi i32 [ %1575, %1564 ], [ 0, %1522 ]
  %1566 = phi i64 [ %1574, %1564 ], [ 0, %1522 ]
  %1567 = zext i32 %1565 to i64
  %1568 = getelementptr inbounds i8, i8 addrspace(4)* %1518, i64 %1567
  %1569 = load i8, i8 addrspace(4)* %1568, align 1, !tbaa !8
  %1570 = zext i8 %1569 to i64
  %1571 = shl i32 %1565, 3
  %1572 = zext i32 %1571 to i64
  %1573 = shl nuw i64 %1570, %1572
  %1574 = or i64 %1573, %1566
  %1575 = add nuw nsw i32 %1565, 1
  %1576 = icmp eq i32 %1575, %1519
  br i1 %1576, label %1577, label %1564

1577:                                             ; preds = %1564, %1524, %1522
  %1578 = phi i8 addrspace(4)* [ %1563, %1524 ], [ %1518, %1522 ], [ %1518, %1564 ]
  %1579 = phi i32 [ %1562, %1524 ], [ 0, %1522 ], [ 0, %1564 ]
  %1580 = phi i64 [ %1561, %1524 ], [ 0, %1522 ], [ %1574, %1564 ]
  %1581 = icmp ugt i32 %1579, 7
  br i1 %1581, label %1584, label %1582

1582:                                             ; preds = %1577
  %1583 = icmp eq i32 %1579, 0
  br i1 %1583, label %1637, label %1624

1584:                                             ; preds = %1577
  %1585 = load i8, i8 addrspace(4)* %1578, align 1, !tbaa !8
  %1586 = zext i8 %1585 to i64
  %1587 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 1
  %1588 = load i8, i8 addrspace(4)* %1587, align 1, !tbaa !8
  %1589 = zext i8 %1588 to i64
  %1590 = shl nuw nsw i64 %1589, 8
  %1591 = or i64 %1590, %1586
  %1592 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 2
  %1593 = load i8, i8 addrspace(4)* %1592, align 1, !tbaa !8
  %1594 = zext i8 %1593 to i64
  %1595 = shl nuw nsw i64 %1594, 16
  %1596 = or i64 %1591, %1595
  %1597 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 3
  %1598 = load i8, i8 addrspace(4)* %1597, align 1, !tbaa !8
  %1599 = zext i8 %1598 to i64
  %1600 = shl nuw nsw i64 %1599, 24
  %1601 = or i64 %1596, %1600
  %1602 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 4
  %1603 = load i8, i8 addrspace(4)* %1602, align 1, !tbaa !8
  %1604 = zext i8 %1603 to i64
  %1605 = shl nuw nsw i64 %1604, 32
  %1606 = or i64 %1601, %1605
  %1607 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 5
  %1608 = load i8, i8 addrspace(4)* %1607, align 1, !tbaa !8
  %1609 = zext i8 %1608 to i64
  %1610 = shl nuw nsw i64 %1609, 40
  %1611 = or i64 %1606, %1610
  %1612 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 6
  %1613 = load i8, i8 addrspace(4)* %1612, align 1, !tbaa !8
  %1614 = zext i8 %1613 to i64
  %1615 = shl nuw nsw i64 %1614, 48
  %1616 = or i64 %1611, %1615
  %1617 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 7
  %1618 = load i8, i8 addrspace(4)* %1617, align 1, !tbaa !8
  %1619 = zext i8 %1618 to i64
  %1620 = shl nuw i64 %1619, 56
  %1621 = or i64 %1616, %1620
  %1622 = add nsw i32 %1579, -8
  %1623 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 8
  br label %1637

1624:                                             ; preds = %1582, %1624
  %1625 = phi i32 [ %1635, %1624 ], [ 0, %1582 ]
  %1626 = phi i64 [ %1634, %1624 ], [ 0, %1582 ]
  %1627 = zext i32 %1625 to i64
  %1628 = getelementptr inbounds i8, i8 addrspace(4)* %1578, i64 %1627
  %1629 = load i8, i8 addrspace(4)* %1628, align 1, !tbaa !8
  %1630 = zext i8 %1629 to i64
  %1631 = shl i32 %1625, 3
  %1632 = zext i32 %1631 to i64
  %1633 = shl nuw i64 %1630, %1632
  %1634 = or i64 %1633, %1626
  %1635 = add nuw nsw i32 %1625, 1
  %1636 = icmp eq i32 %1635, %1579
  br i1 %1636, label %1637, label %1624

1637:                                             ; preds = %1624, %1584, %1582
  %1638 = phi i8 addrspace(4)* [ %1623, %1584 ], [ %1578, %1582 ], [ %1578, %1624 ]
  %1639 = phi i32 [ %1622, %1584 ], [ 0, %1582 ], [ 0, %1624 ]
  %1640 = phi i64 [ %1621, %1584 ], [ 0, %1582 ], [ %1634, %1624 ]
  %1641 = icmp ugt i32 %1639, 7
  br i1 %1641, label %1644, label %1642

1642:                                             ; preds = %1637
  %1643 = icmp eq i32 %1639, 0
  br i1 %1643, label %1697, label %1684

1644:                                             ; preds = %1637
  %1645 = load i8, i8 addrspace(4)* %1638, align 1, !tbaa !8
  %1646 = zext i8 %1645 to i64
  %1647 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 1
  %1648 = load i8, i8 addrspace(4)* %1647, align 1, !tbaa !8
  %1649 = zext i8 %1648 to i64
  %1650 = shl nuw nsw i64 %1649, 8
  %1651 = or i64 %1650, %1646
  %1652 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 2
  %1653 = load i8, i8 addrspace(4)* %1652, align 1, !tbaa !8
  %1654 = zext i8 %1653 to i64
  %1655 = shl nuw nsw i64 %1654, 16
  %1656 = or i64 %1651, %1655
  %1657 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 3
  %1658 = load i8, i8 addrspace(4)* %1657, align 1, !tbaa !8
  %1659 = zext i8 %1658 to i64
  %1660 = shl nuw nsw i64 %1659, 24
  %1661 = or i64 %1656, %1660
  %1662 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 4
  %1663 = load i8, i8 addrspace(4)* %1662, align 1, !tbaa !8
  %1664 = zext i8 %1663 to i64
  %1665 = shl nuw nsw i64 %1664, 32
  %1666 = or i64 %1661, %1665
  %1667 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 5
  %1668 = load i8, i8 addrspace(4)* %1667, align 1, !tbaa !8
  %1669 = zext i8 %1668 to i64
  %1670 = shl nuw nsw i64 %1669, 40
  %1671 = or i64 %1666, %1670
  %1672 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 6
  %1673 = load i8, i8 addrspace(4)* %1672, align 1, !tbaa !8
  %1674 = zext i8 %1673 to i64
  %1675 = shl nuw nsw i64 %1674, 48
  %1676 = or i64 %1671, %1675
  %1677 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 7
  %1678 = load i8, i8 addrspace(4)* %1677, align 1, !tbaa !8
  %1679 = zext i8 %1678 to i64
  %1680 = shl nuw i64 %1679, 56
  %1681 = or i64 %1676, %1680
  %1682 = add nsw i32 %1639, -8
  %1683 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 8
  br label %1697

1684:                                             ; preds = %1642, %1684
  %1685 = phi i32 [ %1695, %1684 ], [ 0, %1642 ]
  %1686 = phi i64 [ %1694, %1684 ], [ 0, %1642 ]
  %1687 = zext i32 %1685 to i64
  %1688 = getelementptr inbounds i8, i8 addrspace(4)* %1638, i64 %1687
  %1689 = load i8, i8 addrspace(4)* %1688, align 1, !tbaa !8
  %1690 = zext i8 %1689 to i64
  %1691 = shl i32 %1685, 3
  %1692 = zext i32 %1691 to i64
  %1693 = shl nuw i64 %1690, %1692
  %1694 = or i64 %1693, %1686
  %1695 = add nuw nsw i32 %1685, 1
  %1696 = icmp eq i32 %1695, %1639
  br i1 %1696, label %1697, label %1684

1697:                                             ; preds = %1684, %1644, %1642
  %1698 = phi i8 addrspace(4)* [ %1683, %1644 ], [ %1638, %1642 ], [ %1638, %1684 ]
  %1699 = phi i32 [ %1682, %1644 ], [ 0, %1642 ], [ 0, %1684 ]
  %1700 = phi i64 [ %1681, %1644 ], [ 0, %1642 ], [ %1694, %1684 ]
  %1701 = icmp ugt i32 %1699, 7
  br i1 %1701, label %1704, label %1702

1702:                                             ; preds = %1697
  %1703 = icmp eq i32 %1699, 0
  br i1 %1703, label %1757, label %1744

1704:                                             ; preds = %1697
  %1705 = load i8, i8 addrspace(4)* %1698, align 1, !tbaa !8
  %1706 = zext i8 %1705 to i64
  %1707 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 1
  %1708 = load i8, i8 addrspace(4)* %1707, align 1, !tbaa !8
  %1709 = zext i8 %1708 to i64
  %1710 = shl nuw nsw i64 %1709, 8
  %1711 = or i64 %1710, %1706
  %1712 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 2
  %1713 = load i8, i8 addrspace(4)* %1712, align 1, !tbaa !8
  %1714 = zext i8 %1713 to i64
  %1715 = shl nuw nsw i64 %1714, 16
  %1716 = or i64 %1711, %1715
  %1717 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 3
  %1718 = load i8, i8 addrspace(4)* %1717, align 1, !tbaa !8
  %1719 = zext i8 %1718 to i64
  %1720 = shl nuw nsw i64 %1719, 24
  %1721 = or i64 %1716, %1720
  %1722 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 4
  %1723 = load i8, i8 addrspace(4)* %1722, align 1, !tbaa !8
  %1724 = zext i8 %1723 to i64
  %1725 = shl nuw nsw i64 %1724, 32
  %1726 = or i64 %1721, %1725
  %1727 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 5
  %1728 = load i8, i8 addrspace(4)* %1727, align 1, !tbaa !8
  %1729 = zext i8 %1728 to i64
  %1730 = shl nuw nsw i64 %1729, 40
  %1731 = or i64 %1726, %1730
  %1732 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 6
  %1733 = load i8, i8 addrspace(4)* %1732, align 1, !tbaa !8
  %1734 = zext i8 %1733 to i64
  %1735 = shl nuw nsw i64 %1734, 48
  %1736 = or i64 %1731, %1735
  %1737 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 7
  %1738 = load i8, i8 addrspace(4)* %1737, align 1, !tbaa !8
  %1739 = zext i8 %1738 to i64
  %1740 = shl nuw i64 %1739, 56
  %1741 = or i64 %1736, %1740
  %1742 = add nsw i32 %1699, -8
  %1743 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 8
  br label %1757

1744:                                             ; preds = %1702, %1744
  %1745 = phi i32 [ %1755, %1744 ], [ 0, %1702 ]
  %1746 = phi i64 [ %1754, %1744 ], [ 0, %1702 ]
  %1747 = zext i32 %1745 to i64
  %1748 = getelementptr inbounds i8, i8 addrspace(4)* %1698, i64 %1747
  %1749 = load i8, i8 addrspace(4)* %1748, align 1, !tbaa !8
  %1750 = zext i8 %1749 to i64
  %1751 = shl i32 %1745, 3
  %1752 = zext i32 %1751 to i64
  %1753 = shl nuw i64 %1750, %1752
  %1754 = or i64 %1753, %1746
  %1755 = add nuw nsw i32 %1745, 1
  %1756 = icmp eq i32 %1755, %1699
  br i1 %1756, label %1757, label %1744

1757:                                             ; preds = %1744, %1704, %1702
  %1758 = phi i8 addrspace(4)* [ %1743, %1704 ], [ %1698, %1702 ], [ %1698, %1744 ]
  %1759 = phi i32 [ %1742, %1704 ], [ 0, %1702 ], [ 0, %1744 ]
  %1760 = phi i64 [ %1741, %1704 ], [ 0, %1702 ], [ %1754, %1744 ]
  %1761 = icmp ugt i32 %1759, 7
  br i1 %1761, label %1764, label %1762

1762:                                             ; preds = %1757
  %1763 = icmp eq i32 %1759, 0
  br i1 %1763, label %1815, label %1802

1764:                                             ; preds = %1757
  %1765 = load i8, i8 addrspace(4)* %1758, align 1, !tbaa !8
  %1766 = zext i8 %1765 to i64
  %1767 = getelementptr inbounds i8, i8 addrspace(4)* %1758, i64 1
  %1768 = load i8, i8 addrspace(4)* %1767, align 1, !tbaa !8
  %1769 = zext i8 %1768 to i64
  %1770 = shl nuw nsw i64 %1769, 8
  %1771 = or i64 %1770, %1766
  %1772 = getelementptr inbounds i8, i8 addrspace(4)* %1758, i64 2
  %1773 = load i8, i8 addrspace(4)* %1772, align 1, !tbaa !8
  %1774 = zext i8 %1773 to i64
  %1775 = shl nuw nsw i64 %1774, 16
  %1776 = or i64 %1771, %1775
  %1777 = getelementptr inbounds i8, i8 addrspace(4)* %1758, i64 3
  %1778 = load i8, i8 addrspace(4)* %1777, align 1, !tbaa !8
  %1779 = zext i8 %1778 to i64
  %1780 = shl nuw nsw i64 %1779, 24
  %1781 = or i64 %1776, %1780
  %1782 = getelementptr inbounds i8, i8 addrspace(4)* %1758, i64 4
  %1783 = load i8, i8 addrspace(4)* %1782, align 1, !tbaa !8
  %1784 = zext i8 %1783 to i64
  %1785 = shl nuw nsw i64 %1784, 32
  %1786 = or i64 %1781, %1785
  %1787 = getelementptr inbounds i8, i8 addrspace(4)* %1758, i64 5
  %1788 = load i8, i8 addrspace(4)* %1787, align 1, !tbaa !8
  %1789 = zext i8 %1788 to i64
  %1790 = shl nuw nsw i64 %1789, 40
  %1791 = or i64 %1786, %1790
  %1792 = getelementptr inbounds i8, i8 addrspace(4)* %1758, i64 6
  %1793 = load i8, i8 addrspace(4)* %1792, align 1, !tbaa !8
  %1794 = zext i8 %1793 to i64
  %1795 = shl nuw nsw i64 %1794, 48
  %1796 = or i64 %1791, %1795
  %1797 = getelementptr inbounds i8, i8 addrspace(4)* %1758, i64 7
  %1798 = load i8, i8 addrspace(4)* %1797, align 1, !tbaa !8
  %1799 = zext i8 %1798 to i64
  %1800 = shl nuw i64 %1799, 56
  %1801 = or i64 %1796, %1800
  br label %1815

1802:                                             ; preds = %1762, %1802
  %1803 = phi i32 [ %1813, %1802 ], [ 0, %1762 ]
  %1804 = phi i64 [ %1812, %1802 ], [ 0, %1762 ]
  %1805 = zext i32 %1803 to i64
  %1806 = getelementptr inbounds i8, i8 addrspace(4)* %1758, i64 %1805
  %1807 = load i8, i8 addrspace(4)* %1806, align 1, !tbaa !8
  %1808 = zext i8 %1807 to i64
  %1809 = shl i32 %1803, 3
  %1810 = zext i32 %1809 to i64
  %1811 = shl nuw i64 %1808, %1810
  %1812 = or i64 %1811, %1804
  %1813 = add nuw nsw i32 %1803, 1
  %1814 = icmp eq i32 %1813, %1759
  br i1 %1814, label %1815, label %1802

1815:                                             ; preds = %1802, %1764, %1762
  %1816 = phi i64 [ %1801, %1764 ], [ 0, %1762 ], [ %1812, %1802 ]
  %1817 = shl nuw nsw i64 %1398, 2
  %1818 = add nuw nsw i64 %1817, 28
  %1819 = and i64 %1818, 480
  %1820 = and i64 %1400, -225
  %1821 = or i64 %1820, %1819
  %1822 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %1821, i64 noundef %1460, i64 noundef %1520, i64 noundef %1580, i64 noundef %1640, i64 noundef %1700, i64 noundef %1760, i64 noundef %1816) #10
  %1823 = sub i64 %1390, %1398
  %1824 = getelementptr inbounds i8, i8 addrspace(4)* %1391, i64 %1398
  %1825 = icmp eq i64 %1823, 0
  br i1 %1825, label %1826, label %1389

1826:                                             ; preds = %1815, %1381
  %1827 = phi <2 x i64> [ %1384, %1381 ], [ %1822, %1815 ]
  %1828 = extractelement <2 x i64> %1827, i64 0
  %1829 = and i64 %1828, -227
  %1830 = or i64 %1829, 34
  %1831 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %1830, i64 noundef %1378, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1832 = getelementptr inbounds double, double addrspace(1)* %0, i64 3
  %1833 = bitcast double addrspace(1)* %1832 to i64 addrspace(1)*
  %1834 = load i64, i64 addrspace(1)* %1833, align 8, !tbaa !11
  %1835 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1836 = extractelement <2 x i64> %1835, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %1837, label %1841

1837:                                             ; preds = %1826
  %1838 = and i64 %1836, -225
  %1839 = or i64 %1838, 32
  %1840 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %1839, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %2282

1841:                                             ; preds = %1826
  %1842 = and i64 %1836, 2
  %1843 = and i64 %1836, -3
  %1844 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1843, i64 0
  br label %1845

1845:                                             ; preds = %2271, %1841
  %1846 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 16) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([17 x i8]* addrspacecast ([17 x i8] addrspace(4)* @.str.1 to [17 x i8]*) to i64)), i64 1))), %1841 ], [ %2279, %2271 ]
  %1847 = phi i8 addrspace(4)* [ getelementptr inbounds ([17 x i8], [17 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %1841 ], [ %2280, %2271 ]
  %1848 = phi <2 x i64> [ %1844, %1841 ], [ %2278, %2271 ]
  %1849 = icmp ugt i64 %1846, 56
  %1850 = extractelement <2 x i64> %1848, i64 0
  %1851 = or i64 %1850, %1842
  %1852 = insertelement <2 x i64> poison, i64 %1851, i64 0
  %1853 = select i1 %1849, <2 x i64> %1848, <2 x i64> %1852
  %1854 = tail call i64 @llvm.umin.i64(i64 %1846, i64 56)
  %1855 = trunc i64 %1854 to i32
  %1856 = extractelement <2 x i64> %1853, i64 0
  %1857 = icmp ugt i32 %1855, 7
  br i1 %1857, label %1860, label %1858

1858:                                             ; preds = %1845
  %1859 = icmp eq i32 %1855, 0
  br i1 %1859, label %1913, label %1900

1860:                                             ; preds = %1845
  %1861 = load i8, i8 addrspace(4)* %1847, align 1, !tbaa !8
  %1862 = zext i8 %1861 to i64
  %1863 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 1
  %1864 = load i8, i8 addrspace(4)* %1863, align 1, !tbaa !8
  %1865 = zext i8 %1864 to i64
  %1866 = shl nuw nsw i64 %1865, 8
  %1867 = or i64 %1866, %1862
  %1868 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 2
  %1869 = load i8, i8 addrspace(4)* %1868, align 1, !tbaa !8
  %1870 = zext i8 %1869 to i64
  %1871 = shl nuw nsw i64 %1870, 16
  %1872 = or i64 %1867, %1871
  %1873 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 3
  %1874 = load i8, i8 addrspace(4)* %1873, align 1, !tbaa !8
  %1875 = zext i8 %1874 to i64
  %1876 = shl nuw nsw i64 %1875, 24
  %1877 = or i64 %1872, %1876
  %1878 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 4
  %1879 = load i8, i8 addrspace(4)* %1878, align 1, !tbaa !8
  %1880 = zext i8 %1879 to i64
  %1881 = shl nuw nsw i64 %1880, 32
  %1882 = or i64 %1877, %1881
  %1883 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 5
  %1884 = load i8, i8 addrspace(4)* %1883, align 1, !tbaa !8
  %1885 = zext i8 %1884 to i64
  %1886 = shl nuw nsw i64 %1885, 40
  %1887 = or i64 %1882, %1886
  %1888 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 6
  %1889 = load i8, i8 addrspace(4)* %1888, align 1, !tbaa !8
  %1890 = zext i8 %1889 to i64
  %1891 = shl nuw nsw i64 %1890, 48
  %1892 = or i64 %1887, %1891
  %1893 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 7
  %1894 = load i8, i8 addrspace(4)* %1893, align 1, !tbaa !8
  %1895 = zext i8 %1894 to i64
  %1896 = shl nuw i64 %1895, 56
  %1897 = or i64 %1892, %1896
  %1898 = add nsw i32 %1855, -8
  %1899 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 8
  br label %1913

1900:                                             ; preds = %1858, %1900
  %1901 = phi i32 [ %1911, %1900 ], [ 0, %1858 ]
  %1902 = phi i64 [ %1910, %1900 ], [ 0, %1858 ]
  %1903 = zext i32 %1901 to i64
  %1904 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 %1903
  %1905 = load i8, i8 addrspace(4)* %1904, align 1, !tbaa !8
  %1906 = zext i8 %1905 to i64
  %1907 = shl i32 %1901, 3
  %1908 = zext i32 %1907 to i64
  %1909 = shl nuw i64 %1906, %1908
  %1910 = or i64 %1909, %1902
  %1911 = add nuw nsw i32 %1901, 1
  %1912 = icmp eq i32 %1911, %1855
  br i1 %1912, label %1913, label %1900, !llvm.loop !9

1913:                                             ; preds = %1900, %1860, %1858
  %1914 = phi i8 addrspace(4)* [ %1899, %1860 ], [ %1847, %1858 ], [ %1847, %1900 ]
  %1915 = phi i32 [ %1898, %1860 ], [ 0, %1858 ], [ 0, %1900 ]
  %1916 = phi i64 [ %1897, %1860 ], [ 0, %1858 ], [ %1910, %1900 ]
  %1917 = icmp ugt i32 %1915, 7
  br i1 %1917, label %1920, label %1918

1918:                                             ; preds = %1913
  %1919 = icmp eq i32 %1915, 0
  br i1 %1919, label %1973, label %1960

1920:                                             ; preds = %1913
  %1921 = load i8, i8 addrspace(4)* %1914, align 1, !tbaa !8
  %1922 = zext i8 %1921 to i64
  %1923 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 1
  %1924 = load i8, i8 addrspace(4)* %1923, align 1, !tbaa !8
  %1925 = zext i8 %1924 to i64
  %1926 = shl nuw nsw i64 %1925, 8
  %1927 = or i64 %1926, %1922
  %1928 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 2
  %1929 = load i8, i8 addrspace(4)* %1928, align 1, !tbaa !8
  %1930 = zext i8 %1929 to i64
  %1931 = shl nuw nsw i64 %1930, 16
  %1932 = or i64 %1927, %1931
  %1933 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 3
  %1934 = load i8, i8 addrspace(4)* %1933, align 1, !tbaa !8
  %1935 = zext i8 %1934 to i64
  %1936 = shl nuw nsw i64 %1935, 24
  %1937 = or i64 %1932, %1936
  %1938 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 4
  %1939 = load i8, i8 addrspace(4)* %1938, align 1, !tbaa !8
  %1940 = zext i8 %1939 to i64
  %1941 = shl nuw nsw i64 %1940, 32
  %1942 = or i64 %1937, %1941
  %1943 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 5
  %1944 = load i8, i8 addrspace(4)* %1943, align 1, !tbaa !8
  %1945 = zext i8 %1944 to i64
  %1946 = shl nuw nsw i64 %1945, 40
  %1947 = or i64 %1942, %1946
  %1948 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 6
  %1949 = load i8, i8 addrspace(4)* %1948, align 1, !tbaa !8
  %1950 = zext i8 %1949 to i64
  %1951 = shl nuw nsw i64 %1950, 48
  %1952 = or i64 %1947, %1951
  %1953 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 7
  %1954 = load i8, i8 addrspace(4)* %1953, align 1, !tbaa !8
  %1955 = zext i8 %1954 to i64
  %1956 = shl nuw i64 %1955, 56
  %1957 = or i64 %1952, %1956
  %1958 = add nsw i32 %1915, -8
  %1959 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 8
  br label %1973

1960:                                             ; preds = %1918, %1960
  %1961 = phi i32 [ %1971, %1960 ], [ 0, %1918 ]
  %1962 = phi i64 [ %1970, %1960 ], [ 0, %1918 ]
  %1963 = zext i32 %1961 to i64
  %1964 = getelementptr inbounds i8, i8 addrspace(4)* %1914, i64 %1963
  %1965 = load i8, i8 addrspace(4)* %1964, align 1, !tbaa !8
  %1966 = zext i8 %1965 to i64
  %1967 = shl i32 %1961, 3
  %1968 = zext i32 %1967 to i64
  %1969 = shl nuw i64 %1966, %1968
  %1970 = or i64 %1969, %1962
  %1971 = add nuw nsw i32 %1961, 1
  %1972 = icmp eq i32 %1971, %1915
  br i1 %1972, label %1973, label %1960

1973:                                             ; preds = %1960, %1920, %1918
  %1974 = phi i8 addrspace(4)* [ %1959, %1920 ], [ %1914, %1918 ], [ %1914, %1960 ]
  %1975 = phi i32 [ %1958, %1920 ], [ 0, %1918 ], [ 0, %1960 ]
  %1976 = phi i64 [ %1957, %1920 ], [ 0, %1918 ], [ %1970, %1960 ]
  %1977 = icmp ugt i32 %1975, 7
  br i1 %1977, label %1980, label %1978

1978:                                             ; preds = %1973
  %1979 = icmp eq i32 %1975, 0
  br i1 %1979, label %2033, label %2020

1980:                                             ; preds = %1973
  %1981 = load i8, i8 addrspace(4)* %1974, align 1, !tbaa !8
  %1982 = zext i8 %1981 to i64
  %1983 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 1
  %1984 = load i8, i8 addrspace(4)* %1983, align 1, !tbaa !8
  %1985 = zext i8 %1984 to i64
  %1986 = shl nuw nsw i64 %1985, 8
  %1987 = or i64 %1986, %1982
  %1988 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 2
  %1989 = load i8, i8 addrspace(4)* %1988, align 1, !tbaa !8
  %1990 = zext i8 %1989 to i64
  %1991 = shl nuw nsw i64 %1990, 16
  %1992 = or i64 %1987, %1991
  %1993 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 3
  %1994 = load i8, i8 addrspace(4)* %1993, align 1, !tbaa !8
  %1995 = zext i8 %1994 to i64
  %1996 = shl nuw nsw i64 %1995, 24
  %1997 = or i64 %1992, %1996
  %1998 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 4
  %1999 = load i8, i8 addrspace(4)* %1998, align 1, !tbaa !8
  %2000 = zext i8 %1999 to i64
  %2001 = shl nuw nsw i64 %2000, 32
  %2002 = or i64 %1997, %2001
  %2003 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 5
  %2004 = load i8, i8 addrspace(4)* %2003, align 1, !tbaa !8
  %2005 = zext i8 %2004 to i64
  %2006 = shl nuw nsw i64 %2005, 40
  %2007 = or i64 %2002, %2006
  %2008 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 6
  %2009 = load i8, i8 addrspace(4)* %2008, align 1, !tbaa !8
  %2010 = zext i8 %2009 to i64
  %2011 = shl nuw nsw i64 %2010, 48
  %2012 = or i64 %2007, %2011
  %2013 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 7
  %2014 = load i8, i8 addrspace(4)* %2013, align 1, !tbaa !8
  %2015 = zext i8 %2014 to i64
  %2016 = shl nuw i64 %2015, 56
  %2017 = or i64 %2012, %2016
  %2018 = add nsw i32 %1975, -8
  %2019 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 8
  br label %2033

2020:                                             ; preds = %1978, %2020
  %2021 = phi i32 [ %2031, %2020 ], [ 0, %1978 ]
  %2022 = phi i64 [ %2030, %2020 ], [ 0, %1978 ]
  %2023 = zext i32 %2021 to i64
  %2024 = getelementptr inbounds i8, i8 addrspace(4)* %1974, i64 %2023
  %2025 = load i8, i8 addrspace(4)* %2024, align 1, !tbaa !8
  %2026 = zext i8 %2025 to i64
  %2027 = shl i32 %2021, 3
  %2028 = zext i32 %2027 to i64
  %2029 = shl nuw i64 %2026, %2028
  %2030 = or i64 %2029, %2022
  %2031 = add nuw nsw i32 %2021, 1
  %2032 = icmp eq i32 %2031, %1975
  br i1 %2032, label %2033, label %2020

2033:                                             ; preds = %2020, %1980, %1978
  %2034 = phi i8 addrspace(4)* [ %2019, %1980 ], [ %1974, %1978 ], [ %1974, %2020 ]
  %2035 = phi i32 [ %2018, %1980 ], [ 0, %1978 ], [ 0, %2020 ]
  %2036 = phi i64 [ %2017, %1980 ], [ 0, %1978 ], [ %2030, %2020 ]
  %2037 = icmp ugt i32 %2035, 7
  br i1 %2037, label %2040, label %2038

2038:                                             ; preds = %2033
  %2039 = icmp eq i32 %2035, 0
  br i1 %2039, label %2093, label %2080

2040:                                             ; preds = %2033
  %2041 = load i8, i8 addrspace(4)* %2034, align 1, !tbaa !8
  %2042 = zext i8 %2041 to i64
  %2043 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 1
  %2044 = load i8, i8 addrspace(4)* %2043, align 1, !tbaa !8
  %2045 = zext i8 %2044 to i64
  %2046 = shl nuw nsw i64 %2045, 8
  %2047 = or i64 %2046, %2042
  %2048 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 2
  %2049 = load i8, i8 addrspace(4)* %2048, align 1, !tbaa !8
  %2050 = zext i8 %2049 to i64
  %2051 = shl nuw nsw i64 %2050, 16
  %2052 = or i64 %2047, %2051
  %2053 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 3
  %2054 = load i8, i8 addrspace(4)* %2053, align 1, !tbaa !8
  %2055 = zext i8 %2054 to i64
  %2056 = shl nuw nsw i64 %2055, 24
  %2057 = or i64 %2052, %2056
  %2058 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 4
  %2059 = load i8, i8 addrspace(4)* %2058, align 1, !tbaa !8
  %2060 = zext i8 %2059 to i64
  %2061 = shl nuw nsw i64 %2060, 32
  %2062 = or i64 %2057, %2061
  %2063 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 5
  %2064 = load i8, i8 addrspace(4)* %2063, align 1, !tbaa !8
  %2065 = zext i8 %2064 to i64
  %2066 = shl nuw nsw i64 %2065, 40
  %2067 = or i64 %2062, %2066
  %2068 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 6
  %2069 = load i8, i8 addrspace(4)* %2068, align 1, !tbaa !8
  %2070 = zext i8 %2069 to i64
  %2071 = shl nuw nsw i64 %2070, 48
  %2072 = or i64 %2067, %2071
  %2073 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 7
  %2074 = load i8, i8 addrspace(4)* %2073, align 1, !tbaa !8
  %2075 = zext i8 %2074 to i64
  %2076 = shl nuw i64 %2075, 56
  %2077 = or i64 %2072, %2076
  %2078 = add nsw i32 %2035, -8
  %2079 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 8
  br label %2093

2080:                                             ; preds = %2038, %2080
  %2081 = phi i32 [ %2091, %2080 ], [ 0, %2038 ]
  %2082 = phi i64 [ %2090, %2080 ], [ 0, %2038 ]
  %2083 = zext i32 %2081 to i64
  %2084 = getelementptr inbounds i8, i8 addrspace(4)* %2034, i64 %2083
  %2085 = load i8, i8 addrspace(4)* %2084, align 1, !tbaa !8
  %2086 = zext i8 %2085 to i64
  %2087 = shl i32 %2081, 3
  %2088 = zext i32 %2087 to i64
  %2089 = shl nuw i64 %2086, %2088
  %2090 = or i64 %2089, %2082
  %2091 = add nuw nsw i32 %2081, 1
  %2092 = icmp eq i32 %2091, %2035
  br i1 %2092, label %2093, label %2080

2093:                                             ; preds = %2080, %2040, %2038
  %2094 = phi i8 addrspace(4)* [ %2079, %2040 ], [ %2034, %2038 ], [ %2034, %2080 ]
  %2095 = phi i32 [ %2078, %2040 ], [ 0, %2038 ], [ 0, %2080 ]
  %2096 = phi i64 [ %2077, %2040 ], [ 0, %2038 ], [ %2090, %2080 ]
  %2097 = icmp ugt i32 %2095, 7
  br i1 %2097, label %2100, label %2098

2098:                                             ; preds = %2093
  %2099 = icmp eq i32 %2095, 0
  br i1 %2099, label %2153, label %2140

2100:                                             ; preds = %2093
  %2101 = load i8, i8 addrspace(4)* %2094, align 1, !tbaa !8
  %2102 = zext i8 %2101 to i64
  %2103 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 1
  %2104 = load i8, i8 addrspace(4)* %2103, align 1, !tbaa !8
  %2105 = zext i8 %2104 to i64
  %2106 = shl nuw nsw i64 %2105, 8
  %2107 = or i64 %2106, %2102
  %2108 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 2
  %2109 = load i8, i8 addrspace(4)* %2108, align 1, !tbaa !8
  %2110 = zext i8 %2109 to i64
  %2111 = shl nuw nsw i64 %2110, 16
  %2112 = or i64 %2107, %2111
  %2113 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 3
  %2114 = load i8, i8 addrspace(4)* %2113, align 1, !tbaa !8
  %2115 = zext i8 %2114 to i64
  %2116 = shl nuw nsw i64 %2115, 24
  %2117 = or i64 %2112, %2116
  %2118 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 4
  %2119 = load i8, i8 addrspace(4)* %2118, align 1, !tbaa !8
  %2120 = zext i8 %2119 to i64
  %2121 = shl nuw nsw i64 %2120, 32
  %2122 = or i64 %2117, %2121
  %2123 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 5
  %2124 = load i8, i8 addrspace(4)* %2123, align 1, !tbaa !8
  %2125 = zext i8 %2124 to i64
  %2126 = shl nuw nsw i64 %2125, 40
  %2127 = or i64 %2122, %2126
  %2128 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 6
  %2129 = load i8, i8 addrspace(4)* %2128, align 1, !tbaa !8
  %2130 = zext i8 %2129 to i64
  %2131 = shl nuw nsw i64 %2130, 48
  %2132 = or i64 %2127, %2131
  %2133 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 7
  %2134 = load i8, i8 addrspace(4)* %2133, align 1, !tbaa !8
  %2135 = zext i8 %2134 to i64
  %2136 = shl nuw i64 %2135, 56
  %2137 = or i64 %2132, %2136
  %2138 = add nsw i32 %2095, -8
  %2139 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 8
  br label %2153

2140:                                             ; preds = %2098, %2140
  %2141 = phi i32 [ %2151, %2140 ], [ 0, %2098 ]
  %2142 = phi i64 [ %2150, %2140 ], [ 0, %2098 ]
  %2143 = zext i32 %2141 to i64
  %2144 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 %2143
  %2145 = load i8, i8 addrspace(4)* %2144, align 1, !tbaa !8
  %2146 = zext i8 %2145 to i64
  %2147 = shl i32 %2141, 3
  %2148 = zext i32 %2147 to i64
  %2149 = shl nuw i64 %2146, %2148
  %2150 = or i64 %2149, %2142
  %2151 = add nuw nsw i32 %2141, 1
  %2152 = icmp eq i32 %2151, %2095
  br i1 %2152, label %2153, label %2140

2153:                                             ; preds = %2140, %2100, %2098
  %2154 = phi i8 addrspace(4)* [ %2139, %2100 ], [ %2094, %2098 ], [ %2094, %2140 ]
  %2155 = phi i32 [ %2138, %2100 ], [ 0, %2098 ], [ 0, %2140 ]
  %2156 = phi i64 [ %2137, %2100 ], [ 0, %2098 ], [ %2150, %2140 ]
  %2157 = icmp ugt i32 %2155, 7
  br i1 %2157, label %2160, label %2158

2158:                                             ; preds = %2153
  %2159 = icmp eq i32 %2155, 0
  br i1 %2159, label %2213, label %2200

2160:                                             ; preds = %2153
  %2161 = load i8, i8 addrspace(4)* %2154, align 1, !tbaa !8
  %2162 = zext i8 %2161 to i64
  %2163 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 1
  %2164 = load i8, i8 addrspace(4)* %2163, align 1, !tbaa !8
  %2165 = zext i8 %2164 to i64
  %2166 = shl nuw nsw i64 %2165, 8
  %2167 = or i64 %2166, %2162
  %2168 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 2
  %2169 = load i8, i8 addrspace(4)* %2168, align 1, !tbaa !8
  %2170 = zext i8 %2169 to i64
  %2171 = shl nuw nsw i64 %2170, 16
  %2172 = or i64 %2167, %2171
  %2173 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 3
  %2174 = load i8, i8 addrspace(4)* %2173, align 1, !tbaa !8
  %2175 = zext i8 %2174 to i64
  %2176 = shl nuw nsw i64 %2175, 24
  %2177 = or i64 %2172, %2176
  %2178 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 4
  %2179 = load i8, i8 addrspace(4)* %2178, align 1, !tbaa !8
  %2180 = zext i8 %2179 to i64
  %2181 = shl nuw nsw i64 %2180, 32
  %2182 = or i64 %2177, %2181
  %2183 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 5
  %2184 = load i8, i8 addrspace(4)* %2183, align 1, !tbaa !8
  %2185 = zext i8 %2184 to i64
  %2186 = shl nuw nsw i64 %2185, 40
  %2187 = or i64 %2182, %2186
  %2188 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 6
  %2189 = load i8, i8 addrspace(4)* %2188, align 1, !tbaa !8
  %2190 = zext i8 %2189 to i64
  %2191 = shl nuw nsw i64 %2190, 48
  %2192 = or i64 %2187, %2191
  %2193 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 7
  %2194 = load i8, i8 addrspace(4)* %2193, align 1, !tbaa !8
  %2195 = zext i8 %2194 to i64
  %2196 = shl nuw i64 %2195, 56
  %2197 = or i64 %2192, %2196
  %2198 = add nsw i32 %2155, -8
  %2199 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 8
  br label %2213

2200:                                             ; preds = %2158, %2200
  %2201 = phi i32 [ %2211, %2200 ], [ 0, %2158 ]
  %2202 = phi i64 [ %2210, %2200 ], [ 0, %2158 ]
  %2203 = zext i32 %2201 to i64
  %2204 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 %2203
  %2205 = load i8, i8 addrspace(4)* %2204, align 1, !tbaa !8
  %2206 = zext i8 %2205 to i64
  %2207 = shl i32 %2201, 3
  %2208 = zext i32 %2207 to i64
  %2209 = shl nuw i64 %2206, %2208
  %2210 = or i64 %2209, %2202
  %2211 = add nuw nsw i32 %2201, 1
  %2212 = icmp eq i32 %2211, %2155
  br i1 %2212, label %2213, label %2200

2213:                                             ; preds = %2200, %2160, %2158
  %2214 = phi i8 addrspace(4)* [ %2199, %2160 ], [ %2154, %2158 ], [ %2154, %2200 ]
  %2215 = phi i32 [ %2198, %2160 ], [ 0, %2158 ], [ 0, %2200 ]
  %2216 = phi i64 [ %2197, %2160 ], [ 0, %2158 ], [ %2210, %2200 ]
  %2217 = icmp ugt i32 %2215, 7
  br i1 %2217, label %2220, label %2218

2218:                                             ; preds = %2213
  %2219 = icmp eq i32 %2215, 0
  br i1 %2219, label %2271, label %2258

2220:                                             ; preds = %2213
  %2221 = load i8, i8 addrspace(4)* %2214, align 1, !tbaa !8
  %2222 = zext i8 %2221 to i64
  %2223 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 1
  %2224 = load i8, i8 addrspace(4)* %2223, align 1, !tbaa !8
  %2225 = zext i8 %2224 to i64
  %2226 = shl nuw nsw i64 %2225, 8
  %2227 = or i64 %2226, %2222
  %2228 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 2
  %2229 = load i8, i8 addrspace(4)* %2228, align 1, !tbaa !8
  %2230 = zext i8 %2229 to i64
  %2231 = shl nuw nsw i64 %2230, 16
  %2232 = or i64 %2227, %2231
  %2233 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 3
  %2234 = load i8, i8 addrspace(4)* %2233, align 1, !tbaa !8
  %2235 = zext i8 %2234 to i64
  %2236 = shl nuw nsw i64 %2235, 24
  %2237 = or i64 %2232, %2236
  %2238 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 4
  %2239 = load i8, i8 addrspace(4)* %2238, align 1, !tbaa !8
  %2240 = zext i8 %2239 to i64
  %2241 = shl nuw nsw i64 %2240, 32
  %2242 = or i64 %2237, %2241
  %2243 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 5
  %2244 = load i8, i8 addrspace(4)* %2243, align 1, !tbaa !8
  %2245 = zext i8 %2244 to i64
  %2246 = shl nuw nsw i64 %2245, 40
  %2247 = or i64 %2242, %2246
  %2248 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 6
  %2249 = load i8, i8 addrspace(4)* %2248, align 1, !tbaa !8
  %2250 = zext i8 %2249 to i64
  %2251 = shl nuw nsw i64 %2250, 48
  %2252 = or i64 %2247, %2251
  %2253 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 7
  %2254 = load i8, i8 addrspace(4)* %2253, align 1, !tbaa !8
  %2255 = zext i8 %2254 to i64
  %2256 = shl nuw i64 %2255, 56
  %2257 = or i64 %2252, %2256
  br label %2271

2258:                                             ; preds = %2218, %2258
  %2259 = phi i32 [ %2269, %2258 ], [ 0, %2218 ]
  %2260 = phi i64 [ %2268, %2258 ], [ 0, %2218 ]
  %2261 = zext i32 %2259 to i64
  %2262 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 %2261
  %2263 = load i8, i8 addrspace(4)* %2262, align 1, !tbaa !8
  %2264 = zext i8 %2263 to i64
  %2265 = shl i32 %2259, 3
  %2266 = zext i32 %2265 to i64
  %2267 = shl nuw i64 %2264, %2266
  %2268 = or i64 %2267, %2260
  %2269 = add nuw nsw i32 %2259, 1
  %2270 = icmp eq i32 %2269, %2215
  br i1 %2270, label %2271, label %2258

2271:                                             ; preds = %2258, %2220, %2218
  %2272 = phi i64 [ %2257, %2220 ], [ 0, %2218 ], [ %2268, %2258 ]
  %2273 = shl nuw nsw i64 %1854, 2
  %2274 = add nuw nsw i64 %2273, 28
  %2275 = and i64 %2274, 480
  %2276 = and i64 %1856, -225
  %2277 = or i64 %2276, %2275
  %2278 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %2277, i64 noundef %1916, i64 noundef %1976, i64 noundef %2036, i64 noundef %2096, i64 noundef %2156, i64 noundef %2216, i64 noundef %2272) #10
  %2279 = sub i64 %1846, %1854
  %2280 = getelementptr inbounds i8, i8 addrspace(4)* %1847, i64 %1854
  %2281 = icmp eq i64 %2279, 0
  br i1 %2281, label %2282, label %1845

2282:                                             ; preds = %2271, %1837
  %2283 = phi <2 x i64> [ %1840, %1837 ], [ %2278, %2271 ]
  %2284 = extractelement <2 x i64> %2283, i64 0
  %2285 = and i64 %2284, -227
  %2286 = or i64 %2285, 34
  %2287 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %2286, i64 noundef %1834, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !15
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !17
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !17
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !19
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !17
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !17
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !15
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !20
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !23
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !20
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !23
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !20
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !23
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !24
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !23
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !17
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %110 = call i64 @llvm.read_register.i64(metadata !25) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !26
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !28
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !29
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !20
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !23
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !30
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !30
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !31
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !33
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !23
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !20
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !30
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !30
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
!12 = !{!"double", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!16, !16, i64 0}
!16 = !{!"any pointer", !6, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !6, i64 0}
!19 = !{i64 2662}
!20 = !{!21, !16, i64 0}
!21 = !{!"", !16, i64 0, !16, i64 8, !22, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!22 = !{!"hsa_signal_s", !5, i64 0}
!23 = !{!21, !5, i64 40}
!24 = !{!21, !16, i64 8}
!25 = !{!"exec"}
!26 = !{!27, !18, i64 16}
!27 = !{!"", !5, i64 0, !5, i64 8, !18, i64 16, !18, i64 20}
!28 = !{!27, !5, i64 8}
!29 = !{!27, !18, i64 20}
!30 = !{!27, !5, i64 0}
!31 = !{!32, !5, i64 16}
!32 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !18, i64 24, !18, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!33 = !{!32, !18, i64 24}
