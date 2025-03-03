; ModuleID = '../data/hip_kernels/2166/9/main.cu'
source_filename = "../data/hip_kernels/2166/9/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z4loopv() local_unnamed_addr #1 {
  %1 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %2 = getelementptr i8, i8 addrspace(4)* %1, i64 4
  %3 = bitcast i8 addrspace(4)* %2 to i16 addrspace(4)*
  %4 = load i16, i16 addrspace(4)* %3, align 4, !range !4, !invariant.load !5
  %5 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 24
  %7 = bitcast i8 addrspace(4)* %6 to i64 addrspace(4)*
  %8 = load i64, i64 addrspace(4)* %7, align 8, !tbaa !6
  %9 = inttoptr i64 %8 to i8 addrspace(1)*
  %10 = addrspacecast i8 addrspace(1)* %9 to i8*
  %11 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %12 = extractelement <2 x i64> %11, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %13, label %17

13:                                               ; preds = %0
  %14 = and i64 %12, -225
  %15 = or i64 %14, 32
  %16 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %15, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %458

17:                                               ; preds = %0
  %18 = and i64 %12, 2
  %19 = and i64 %12, -3
  %20 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %19, i64 0
  br label %21

21:                                               ; preds = %447, %17
  %22 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 3) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([4 x i8]* addrspacecast ([4 x i8] addrspace(4)* @.str to [4 x i8]*) to i64)), i64 1))), %17 ], [ %455, %447 ]
  %23 = phi i8 addrspace(4)* [ getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0), %17 ], [ %456, %447 ]
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
  %37 = load i8, i8 addrspace(4)* %23, align 1, !tbaa !10
  %38 = zext i8 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 1
  %40 = load i8, i8 addrspace(4)* %39, align 1, !tbaa !10
  %41 = zext i8 %40 to i64
  %42 = shl nuw nsw i64 %41, 8
  %43 = or i64 %42, %38
  %44 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 2
  %45 = load i8, i8 addrspace(4)* %44, align 1, !tbaa !10
  %46 = zext i8 %45 to i64
  %47 = shl nuw nsw i64 %46, 16
  %48 = or i64 %43, %47
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 3
  %50 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !10
  %51 = zext i8 %50 to i64
  %52 = shl nuw nsw i64 %51, 24
  %53 = or i64 %48, %52
  %54 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 4
  %55 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !10
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 32
  %58 = or i64 %53, %57
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 5
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !10
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 40
  %63 = or i64 %58, %62
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 6
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !10
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 48
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 7
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !10
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
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !10
  %82 = zext i8 %81 to i64
  %83 = shl i32 %77, 3
  %84 = zext i32 %83 to i64
  %85 = shl nuw i64 %82, %84
  %86 = or i64 %85, %78
  %87 = add nuw nsw i32 %77, 1
  %88 = icmp eq i32 %87, %31
  br i1 %88, label %89, label %76, !llvm.loop !11

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
  %97 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !10
  %98 = zext i8 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 1
  %100 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !10
  %101 = zext i8 %100 to i64
  %102 = shl nuw nsw i64 %101, 8
  %103 = or i64 %102, %98
  %104 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 2
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !10
  %106 = zext i8 %105 to i64
  %107 = shl nuw nsw i64 %106, 16
  %108 = or i64 %103, %107
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 3
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !10
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 24
  %113 = or i64 %108, %112
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 4
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !10
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 32
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 5
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !10
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 40
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 6
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !10
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 48
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 7
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !10
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
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !10
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
  %157 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !10
  %158 = zext i8 %157 to i64
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 1
  %160 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !10
  %161 = zext i8 %160 to i64
  %162 = shl nuw nsw i64 %161, 8
  %163 = or i64 %162, %158
  %164 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 2
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !10
  %166 = zext i8 %165 to i64
  %167 = shl nuw nsw i64 %166, 16
  %168 = or i64 %163, %167
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 3
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !10
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 24
  %173 = or i64 %168, %172
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 4
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !10
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 32
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 5
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !10
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 40
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 6
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !10
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 48
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %150, i64 7
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !10
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
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !10
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
  %217 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !10
  %218 = zext i8 %217 to i64
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 1
  %220 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !10
  %221 = zext i8 %220 to i64
  %222 = shl nuw nsw i64 %221, 8
  %223 = or i64 %222, %218
  %224 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 2
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !10
  %226 = zext i8 %225 to i64
  %227 = shl nuw nsw i64 %226, 16
  %228 = or i64 %223, %227
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 3
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !10
  %231 = zext i8 %230 to i64
  %232 = shl nuw nsw i64 %231, 24
  %233 = or i64 %228, %232
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 4
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !10
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 32
  %238 = or i64 %233, %237
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 5
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !10
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 40
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 6
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !10
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 48
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %210, i64 7
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !10
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
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !10
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
  %277 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !10
  %278 = zext i8 %277 to i64
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 1
  %280 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !10
  %281 = zext i8 %280 to i64
  %282 = shl nuw nsw i64 %281, 8
  %283 = or i64 %282, %278
  %284 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 2
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !10
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 16
  %288 = or i64 %283, %287
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 3
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !10
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 24
  %293 = or i64 %288, %292
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 4
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !10
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 32
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 5
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !10
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 40
  %303 = or i64 %298, %302
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 6
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !10
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 48
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %270, i64 7
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !10
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
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !10
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
  %337 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !10
  %338 = zext i8 %337 to i64
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 1
  %340 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !10
  %341 = zext i8 %340 to i64
  %342 = shl nuw nsw i64 %341, 8
  %343 = or i64 %342, %338
  %344 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 2
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !10
  %346 = zext i8 %345 to i64
  %347 = shl nuw nsw i64 %346, 16
  %348 = or i64 %343, %347
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 3
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !10
  %351 = zext i8 %350 to i64
  %352 = shl nuw nsw i64 %351, 24
  %353 = or i64 %348, %352
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 4
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !10
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 32
  %358 = or i64 %353, %357
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 5
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !10
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 40
  %363 = or i64 %358, %362
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 6
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !10
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 48
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %330, i64 7
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !10
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
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !10
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
  %397 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !10
  %398 = zext i8 %397 to i64
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 1
  %400 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !10
  %401 = zext i8 %400 to i64
  %402 = shl nuw nsw i64 %401, 8
  %403 = or i64 %402, %398
  %404 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 2
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !10
  %406 = zext i8 %405 to i64
  %407 = shl nuw nsw i64 %406, 16
  %408 = or i64 %403, %407
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 3
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !10
  %411 = zext i8 %410 to i64
  %412 = shl nuw nsw i64 %411, 24
  %413 = or i64 %408, %412
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 4
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !10
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 32
  %418 = or i64 %413, %417
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 5
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !10
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 40
  %423 = or i64 %418, %422
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 6
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !10
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 48
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 7
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !10
  %431 = zext i8 %430 to i64
  %432 = shl nuw i64 %431, 56
  %433 = or i64 %428, %432
  br label %447

434:                                              ; preds = %394, %434
  %435 = phi i32 [ %445, %434 ], [ 0, %394 ]
  %436 = phi i64 [ %444, %434 ], [ 0, %394 ]
  %437 = zext i32 %435 to i64
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %390, i64 %437
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !10
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
  %460 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %461 = zext i16 %4 to i32
  %462 = mul i32 %460, %461
  %463 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !13
  %464 = add i32 %462, %463
  %465 = extractelement <2 x i64> %459, i64 0
  %466 = zext i32 %464 to i64
  %467 = and i64 %465, -227
  %468 = or i64 %467, 34
  %469 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %468, i64 noundef %466, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !14
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !16
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !6
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !6
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !6
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !6
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !6
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !6
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !6
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !6
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !16
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !18
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !16
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !16
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !14
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !19
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !22
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !19
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !22
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !6
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !6
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !19
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !22
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !6
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !23
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !22
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !16
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !6
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !6
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !6
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !6
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !6
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !6
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !6
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !6
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %110 = call i64 @llvm.read_register.i64(metadata !24) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !25
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !27
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !28
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !6
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !6
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !6
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !6
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !6
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !6
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !6
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !6
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !6
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !19
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !22
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !29
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !29
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !30
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !32
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !6
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !6
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !10
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !6
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !22
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !19
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !29
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !29
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !10
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
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!8, !8, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{i32 0, i32 1024}
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !8, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !8, i64 0}
!18 = !{i64 2662}
!19 = !{!20, !15, i64 0}
!20 = !{!"", !15, i64 0, !15, i64 8, !21, i64 16, !7, i64 24, !7, i64 32, !7, i64 40}
!21 = !{!"hsa_signal_s", !7, i64 0}
!22 = !{!20, !7, i64 40}
!23 = !{!20, !15, i64 8}
!24 = !{!"exec"}
!25 = !{!26, !17, i64 16}
!26 = !{!"", !7, i64 0, !7, i64 8, !17, i64 16, !17, i64 20}
!27 = !{!26, !7, i64 8}
!28 = !{!26, !17, i64 20}
!29 = !{!26, !7, i64 0}
!30 = !{!31, !7, i64 16}
!31 = !{!"amd_signal_s", !7, i64 0, !8, i64 8, !7, i64 16, !17, i64 24, !17, i64 28, !7, i64 32, !7, i64 40, !8, i64 48, !8, i64 56}
!32 = !{!31, !17, i64 24}
