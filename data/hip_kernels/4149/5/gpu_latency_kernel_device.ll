; ModuleID = '../data/hip_kernels/4149/5/main.cu'
source_filename = "../data/hip_kernels/4149/5/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [10 x i8] c"%d -> %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z18gpu_latency_kernelPimmm(i32 addrspace(1)* nocapture %0, i64 %1, i64 %2, i64 %3) local_unnamed_addr #1 {
  %5 = icmp eq i64 %1, 0
  br i1 %5, label %11, label %6

6:                                                ; preds = %4
  %7 = icmp eq i64 %2, 0
  %8 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 24
  %10 = bitcast i8 addrspace(4)* %9 to i64 addrspace(4)*
  br label %16

11:                                               ; preds = %22, %4
  %12 = phi i32 [ 0, %4 ], [ %23, %22 ]
  %13 = icmp sgt i32 %12, 0
  %14 = icmp ugt i64 %1, %3
  %15 = select i1 %13, i1 %14, i1 false
  br i1 %15, label %504, label %505

16:                                               ; preds = %6, %22
  %17 = phi i32 [ 0, %6 ], [ %23, %22 ]
  %18 = phi i64 [ 0, %6 ], [ %24, %22 ]
  br i1 %7, label %22, label %19

19:                                               ; preds = %16
  %20 = trunc i64 %18 to i32
  %21 = and i32 %20, 31
  br label %26

22:                                               ; preds = %499, %16
  %23 = phi i32 [ %17, %16 ], [ %501, %499 ]
  %24 = add nuw i64 %18, 1
  %25 = icmp eq i64 %24, %1
  br i1 %25, label %11, label %16, !llvm.loop !4

26:                                               ; preds = %19, %499
  %27 = phi i32 [ %501, %499 ], [ %17, %19 ]
  %28 = phi i64 [ %502, %499 ], [ 0, %19 ]
  %29 = phi i32 [ %500, %499 ], [ %21, %19 ]
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !6
  %33 = icmp sgt i32 %32, -1
  %34 = zext i32 %32 to i64
  %35 = icmp ult i64 %34, %3
  %36 = select i1 %33, i1 %35, i1 false
  br i1 %36, label %499, label %37

37:                                               ; preds = %26
  %38 = load i64, i64 addrspace(4)* %10, align 8, !tbaa !10
  %39 = inttoptr i64 %38 to i8 addrspace(1)*
  %40 = addrspacecast i8 addrspace(1)* %39 to i8*
  %41 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %40, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %42 = extractelement <2 x i64> %41, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %43, label %47

43:                                               ; preds = %37
  %44 = and i64 %42, -225
  %45 = or i64 %44, 32
  %46 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %40, i64 noundef %45, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %488

47:                                               ; preds = %37
  %48 = and i64 %42, 2
  %49 = and i64 %42, -3
  %50 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %49, i64 0
  br label %51

51:                                               ; preds = %477, %47
  %52 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 9) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([10 x i8]* addrspacecast ([10 x i8] addrspace(4)* @.str to [10 x i8]*) to i64)), i64 1))), %47 ], [ %485, %477 ]
  %53 = phi i8 addrspace(4)* [ getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0), %47 ], [ %486, %477 ]
  %54 = phi <2 x i64> [ %50, %47 ], [ %484, %477 ]
  %55 = icmp ugt i64 %52, 56
  %56 = extractelement <2 x i64> %54, i64 0
  %57 = or i64 %56, %48
  %58 = insertelement <2 x i64> poison, i64 %57, i64 0
  %59 = select i1 %55, <2 x i64> %54, <2 x i64> %58
  %60 = tail call i64 @llvm.umin.i64(i64 %52, i64 56)
  %61 = trunc i64 %60 to i32
  %62 = extractelement <2 x i64> %59, i64 0
  %63 = icmp ugt i32 %61, 7
  br i1 %63, label %66, label %64

64:                                               ; preds = %51
  %65 = icmp eq i32 %61, 0
  br i1 %65, label %119, label %106

66:                                               ; preds = %51
  %67 = load i8, i8 addrspace(4)* %53, align 1, !tbaa !14
  %68 = zext i8 %67 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 1
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !14
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 8
  %73 = or i64 %72, %68
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 2
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !14
  %76 = zext i8 %75 to i64
  %77 = shl nuw nsw i64 %76, 16
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 3
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !14
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 24
  %83 = or i64 %78, %82
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 4
  %85 = load i8, i8 addrspace(4)* %84, align 1, !tbaa !14
  %86 = zext i8 %85 to i64
  %87 = shl nuw nsw i64 %86, 32
  %88 = or i64 %83, %87
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 5
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !14
  %91 = zext i8 %90 to i64
  %92 = shl nuw nsw i64 %91, 40
  %93 = or i64 %88, %92
  %94 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 6
  %95 = load i8, i8 addrspace(4)* %94, align 1, !tbaa !14
  %96 = zext i8 %95 to i64
  %97 = shl nuw nsw i64 %96, 48
  %98 = or i64 %93, %97
  %99 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 7
  %100 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !14
  %101 = zext i8 %100 to i64
  %102 = shl nuw i64 %101, 56
  %103 = or i64 %98, %102
  %104 = add nsw i32 %61, -8
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 8
  br label %119

106:                                              ; preds = %64, %106
  %107 = phi i32 [ %117, %106 ], [ 0, %64 ]
  %108 = phi i64 [ %116, %106 ], [ 0, %64 ]
  %109 = zext i32 %107 to i64
  %110 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 %109
  %111 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !14
  %112 = zext i8 %111 to i64
  %113 = shl i32 %107, 3
  %114 = zext i32 %113 to i64
  %115 = shl nuw i64 %112, %114
  %116 = or i64 %115, %108
  %117 = add nuw nsw i32 %107, 1
  %118 = icmp eq i32 %117, %61
  br i1 %118, label %119, label %106, !llvm.loop !15

119:                                              ; preds = %106, %66, %64
  %120 = phi i8 addrspace(4)* [ %105, %66 ], [ %53, %64 ], [ %53, %106 ]
  %121 = phi i32 [ %104, %66 ], [ 0, %64 ], [ 0, %106 ]
  %122 = phi i64 [ %103, %66 ], [ 0, %64 ], [ %116, %106 ]
  %123 = icmp ugt i32 %121, 7
  br i1 %123, label %126, label %124

124:                                              ; preds = %119
  %125 = icmp eq i32 %121, 0
  br i1 %125, label %179, label %166

126:                                              ; preds = %119
  %127 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !14
  %128 = zext i8 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 1
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !14
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 8
  %133 = or i64 %132, %128
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 2
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !14
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 16
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 3
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !14
  %141 = zext i8 %140 to i64
  %142 = shl nuw nsw i64 %141, 24
  %143 = or i64 %138, %142
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 4
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !14
  %146 = zext i8 %145 to i64
  %147 = shl nuw nsw i64 %146, 32
  %148 = or i64 %143, %147
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 5
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !14
  %151 = zext i8 %150 to i64
  %152 = shl nuw nsw i64 %151, 40
  %153 = or i64 %148, %152
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 6
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !14
  %156 = zext i8 %155 to i64
  %157 = shl nuw nsw i64 %156, 48
  %158 = or i64 %153, %157
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 7
  %160 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !14
  %161 = zext i8 %160 to i64
  %162 = shl nuw i64 %161, 56
  %163 = or i64 %158, %162
  %164 = add nsw i32 %121, -8
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 8
  br label %179

166:                                              ; preds = %124, %166
  %167 = phi i32 [ %177, %166 ], [ 0, %124 ]
  %168 = phi i64 [ %176, %166 ], [ 0, %124 ]
  %169 = zext i32 %167 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(4)* %120, i64 %169
  %171 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !14
  %172 = zext i8 %171 to i64
  %173 = shl i32 %167, 3
  %174 = zext i32 %173 to i64
  %175 = shl nuw i64 %172, %174
  %176 = or i64 %175, %168
  %177 = add nuw nsw i32 %167, 1
  %178 = icmp eq i32 %177, %121
  br i1 %178, label %179, label %166

179:                                              ; preds = %166, %126, %124
  %180 = phi i8 addrspace(4)* [ %165, %126 ], [ %120, %124 ], [ %120, %166 ]
  %181 = phi i32 [ %164, %126 ], [ 0, %124 ], [ 0, %166 ]
  %182 = phi i64 [ %163, %126 ], [ 0, %124 ], [ %176, %166 ]
  %183 = icmp ugt i32 %181, 7
  br i1 %183, label %186, label %184

184:                                              ; preds = %179
  %185 = icmp eq i32 %181, 0
  br i1 %185, label %239, label %226

186:                                              ; preds = %179
  %187 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !14
  %188 = zext i8 %187 to i64
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 1
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !14
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 8
  %193 = or i64 %192, %188
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 2
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !14
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 16
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 3
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !14
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 24
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 4
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !14
  %206 = zext i8 %205 to i64
  %207 = shl nuw nsw i64 %206, 32
  %208 = or i64 %203, %207
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 5
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !14
  %211 = zext i8 %210 to i64
  %212 = shl nuw nsw i64 %211, 40
  %213 = or i64 %208, %212
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 6
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !14
  %216 = zext i8 %215 to i64
  %217 = shl nuw nsw i64 %216, 48
  %218 = or i64 %213, %217
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 7
  %220 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !14
  %221 = zext i8 %220 to i64
  %222 = shl nuw i64 %221, 56
  %223 = or i64 %218, %222
  %224 = add nsw i32 %181, -8
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 8
  br label %239

226:                                              ; preds = %184, %226
  %227 = phi i32 [ %237, %226 ], [ 0, %184 ]
  %228 = phi i64 [ %236, %226 ], [ 0, %184 ]
  %229 = zext i32 %227 to i64
  %230 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 %229
  %231 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !14
  %232 = zext i8 %231 to i64
  %233 = shl i32 %227, 3
  %234 = zext i32 %233 to i64
  %235 = shl nuw i64 %232, %234
  %236 = or i64 %235, %228
  %237 = add nuw nsw i32 %227, 1
  %238 = icmp eq i32 %237, %181
  br i1 %238, label %239, label %226

239:                                              ; preds = %226, %186, %184
  %240 = phi i8 addrspace(4)* [ %225, %186 ], [ %180, %184 ], [ %180, %226 ]
  %241 = phi i32 [ %224, %186 ], [ 0, %184 ], [ 0, %226 ]
  %242 = phi i64 [ %223, %186 ], [ 0, %184 ], [ %236, %226 ]
  %243 = icmp ugt i32 %241, 7
  br i1 %243, label %246, label %244

244:                                              ; preds = %239
  %245 = icmp eq i32 %241, 0
  br i1 %245, label %299, label %286

246:                                              ; preds = %239
  %247 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !14
  %248 = zext i8 %247 to i64
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 1
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !14
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 8
  %253 = or i64 %252, %248
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 2
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !14
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 16
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 3
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !14
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 24
  %263 = or i64 %258, %262
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 4
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !14
  %266 = zext i8 %265 to i64
  %267 = shl nuw nsw i64 %266, 32
  %268 = or i64 %263, %267
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 5
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !14
  %271 = zext i8 %270 to i64
  %272 = shl nuw nsw i64 %271, 40
  %273 = or i64 %268, %272
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 6
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !14
  %276 = zext i8 %275 to i64
  %277 = shl nuw nsw i64 %276, 48
  %278 = or i64 %273, %277
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 7
  %280 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !14
  %281 = zext i8 %280 to i64
  %282 = shl nuw i64 %281, 56
  %283 = or i64 %278, %282
  %284 = add nsw i32 %241, -8
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 8
  br label %299

286:                                              ; preds = %244, %286
  %287 = phi i32 [ %297, %286 ], [ 0, %244 ]
  %288 = phi i64 [ %296, %286 ], [ 0, %244 ]
  %289 = zext i32 %287 to i64
  %290 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 %289
  %291 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !14
  %292 = zext i8 %291 to i64
  %293 = shl i32 %287, 3
  %294 = zext i32 %293 to i64
  %295 = shl nuw i64 %292, %294
  %296 = or i64 %295, %288
  %297 = add nuw nsw i32 %287, 1
  %298 = icmp eq i32 %297, %241
  br i1 %298, label %299, label %286

299:                                              ; preds = %286, %246, %244
  %300 = phi i8 addrspace(4)* [ %285, %246 ], [ %240, %244 ], [ %240, %286 ]
  %301 = phi i32 [ %284, %246 ], [ 0, %244 ], [ 0, %286 ]
  %302 = phi i64 [ %283, %246 ], [ 0, %244 ], [ %296, %286 ]
  %303 = icmp ugt i32 %301, 7
  br i1 %303, label %306, label %304

304:                                              ; preds = %299
  %305 = icmp eq i32 %301, 0
  br i1 %305, label %359, label %346

306:                                              ; preds = %299
  %307 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !14
  %308 = zext i8 %307 to i64
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 1
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !14
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 8
  %313 = or i64 %312, %308
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 2
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !14
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 16
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 3
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !14
  %321 = zext i8 %320 to i64
  %322 = shl nuw nsw i64 %321, 24
  %323 = or i64 %318, %322
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 4
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !14
  %326 = zext i8 %325 to i64
  %327 = shl nuw nsw i64 %326, 32
  %328 = or i64 %323, %327
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 5
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !14
  %331 = zext i8 %330 to i64
  %332 = shl nuw nsw i64 %331, 40
  %333 = or i64 %328, %332
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 6
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !14
  %336 = zext i8 %335 to i64
  %337 = shl nuw nsw i64 %336, 48
  %338 = or i64 %333, %337
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 7
  %340 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !14
  %341 = zext i8 %340 to i64
  %342 = shl nuw i64 %341, 56
  %343 = or i64 %338, %342
  %344 = add nsw i32 %301, -8
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 8
  br label %359

346:                                              ; preds = %304, %346
  %347 = phi i32 [ %357, %346 ], [ 0, %304 ]
  %348 = phi i64 [ %356, %346 ], [ 0, %304 ]
  %349 = zext i32 %347 to i64
  %350 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 %349
  %351 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !14
  %352 = zext i8 %351 to i64
  %353 = shl i32 %347, 3
  %354 = zext i32 %353 to i64
  %355 = shl nuw i64 %352, %354
  %356 = or i64 %355, %348
  %357 = add nuw nsw i32 %347, 1
  %358 = icmp eq i32 %357, %301
  br i1 %358, label %359, label %346

359:                                              ; preds = %346, %306, %304
  %360 = phi i8 addrspace(4)* [ %345, %306 ], [ %300, %304 ], [ %300, %346 ]
  %361 = phi i32 [ %344, %306 ], [ 0, %304 ], [ 0, %346 ]
  %362 = phi i64 [ %343, %306 ], [ 0, %304 ], [ %356, %346 ]
  %363 = icmp ugt i32 %361, 7
  br i1 %363, label %366, label %364

364:                                              ; preds = %359
  %365 = icmp eq i32 %361, 0
  br i1 %365, label %419, label %406

366:                                              ; preds = %359
  %367 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !14
  %368 = zext i8 %367 to i64
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 1
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !14
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 8
  %373 = or i64 %372, %368
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 2
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !14
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 16
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 3
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !14
  %381 = zext i8 %380 to i64
  %382 = shl nuw nsw i64 %381, 24
  %383 = or i64 %378, %382
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 4
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !14
  %386 = zext i8 %385 to i64
  %387 = shl nuw nsw i64 %386, 32
  %388 = or i64 %383, %387
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 5
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !14
  %391 = zext i8 %390 to i64
  %392 = shl nuw nsw i64 %391, 40
  %393 = or i64 %388, %392
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 6
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !14
  %396 = zext i8 %395 to i64
  %397 = shl nuw nsw i64 %396, 48
  %398 = or i64 %393, %397
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 7
  %400 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !14
  %401 = zext i8 %400 to i64
  %402 = shl nuw i64 %401, 56
  %403 = or i64 %398, %402
  %404 = add nsw i32 %361, -8
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 8
  br label %419

406:                                              ; preds = %364, %406
  %407 = phi i32 [ %417, %406 ], [ 0, %364 ]
  %408 = phi i64 [ %416, %406 ], [ 0, %364 ]
  %409 = zext i32 %407 to i64
  %410 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 %409
  %411 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !14
  %412 = zext i8 %411 to i64
  %413 = shl i32 %407, 3
  %414 = zext i32 %413 to i64
  %415 = shl nuw i64 %412, %414
  %416 = or i64 %415, %408
  %417 = add nuw nsw i32 %407, 1
  %418 = icmp eq i32 %417, %361
  br i1 %418, label %419, label %406

419:                                              ; preds = %406, %366, %364
  %420 = phi i8 addrspace(4)* [ %405, %366 ], [ %360, %364 ], [ %360, %406 ]
  %421 = phi i32 [ %404, %366 ], [ 0, %364 ], [ 0, %406 ]
  %422 = phi i64 [ %403, %366 ], [ 0, %364 ], [ %416, %406 ]
  %423 = icmp ugt i32 %421, 7
  br i1 %423, label %426, label %424

424:                                              ; preds = %419
  %425 = icmp eq i32 %421, 0
  br i1 %425, label %477, label %464

426:                                              ; preds = %419
  %427 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !14
  %428 = zext i8 %427 to i64
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 1
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !14
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 8
  %433 = or i64 %432, %428
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 2
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !14
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 16
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 3
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !14
  %441 = zext i8 %440 to i64
  %442 = shl nuw nsw i64 %441, 24
  %443 = or i64 %438, %442
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 4
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !14
  %446 = zext i8 %445 to i64
  %447 = shl nuw nsw i64 %446, 32
  %448 = or i64 %443, %447
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 5
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !14
  %451 = zext i8 %450 to i64
  %452 = shl nuw nsw i64 %451, 40
  %453 = or i64 %448, %452
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 6
  %455 = load i8, i8 addrspace(4)* %454, align 1, !tbaa !14
  %456 = zext i8 %455 to i64
  %457 = shl nuw nsw i64 %456, 48
  %458 = or i64 %453, %457
  %459 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 7
  %460 = load i8, i8 addrspace(4)* %459, align 1, !tbaa !14
  %461 = zext i8 %460 to i64
  %462 = shl nuw i64 %461, 56
  %463 = or i64 %458, %462
  br label %477

464:                                              ; preds = %424, %464
  %465 = phi i32 [ %475, %464 ], [ 0, %424 ]
  %466 = phi i64 [ %474, %464 ], [ 0, %424 ]
  %467 = zext i32 %465 to i64
  %468 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 %467
  %469 = load i8, i8 addrspace(4)* %468, align 1, !tbaa !14
  %470 = zext i8 %469 to i64
  %471 = shl i32 %465, 3
  %472 = zext i32 %471 to i64
  %473 = shl nuw i64 %470, %472
  %474 = or i64 %473, %466
  %475 = add nuw nsw i32 %465, 1
  %476 = icmp eq i32 %475, %421
  br i1 %476, label %477, label %464

477:                                              ; preds = %464, %426, %424
  %478 = phi i64 [ %463, %426 ], [ 0, %424 ], [ %474, %464 ]
  %479 = shl nuw nsw i64 %60, 2
  %480 = add nuw nsw i64 %479, 28
  %481 = and i64 %480, 480
  %482 = and i64 %62, -225
  %483 = or i64 %482, %481
  %484 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %40, i64 noundef %483, i64 noundef %122, i64 noundef %182, i64 noundef %242, i64 noundef %302, i64 noundef %362, i64 noundef %422, i64 noundef %478) #10
  %485 = sub i64 %52, %60
  %486 = getelementptr inbounds i8, i8 addrspace(4)* %53, i64 %60
  %487 = icmp eq i64 %485, 0
  br i1 %487, label %488, label %51

488:                                              ; preds = %477, %43
  %489 = phi <2 x i64> [ %46, %43 ], [ %484, %477 ]
  %490 = extractelement <2 x i64> %489, i64 0
  %491 = and i64 %490, -225
  %492 = or i64 %491, 32
  %493 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %40, i64 noundef %492, i64 noundef %30, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %494 = extractelement <2 x i64> %493, i64 0
  %495 = and i64 %494, -227
  %496 = or i64 %495, 34
  %497 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %40, i64 noundef %496, i64 noundef %34, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %498 = add nsw i32 %27, 1
  br label %499

499:                                              ; preds = %26, %488
  %500 = phi i32 [ 0, %488 ], [ %32, %26 ]
  %501 = phi i32 [ %498, %488 ], [ %27, %26 ]
  %502 = add nuw i64 %28, 1
  %503 = icmp eq i64 %502, %2
  br i1 %503, label %22, label %26, !llvm.loop !17

504:                                              ; preds = %11
  store i32 %12, i32 addrspace(1)* %0, align 4, !tbaa !6
  br label %505

505:                                              ; preds = %504, %11
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !18
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !20
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !10
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !10
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !10
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !10
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !10
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !10
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !10
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !10
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !10
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !10
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !10
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !10
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !10
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !10
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !10
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !10
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !10
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !10
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !10
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !10
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !10
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !10
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !10
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !10
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !10
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !10
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !10
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !14
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !14
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
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!12, !12, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !5}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !12, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !12, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !19, i64 0}
!24 = !{!"", !19, i64 0, !19, i64 8, !25, i64 16, !11, i64 24, !11, i64 32, !11, i64 40}
!25 = !{!"hsa_signal_s", !11, i64 0}
!26 = !{!24, !11, i64 40}
!27 = !{!24, !19, i64 8}
!28 = !{!"exec"}
!29 = !{!30, !21, i64 16}
!30 = !{!"", !11, i64 0, !11, i64 8, !21, i64 16, !21, i64 20}
!31 = !{!30, !11, i64 8}
!32 = !{!30, !21, i64 20}
!33 = !{!30, !11, i64 0}
!34 = !{!35, !11, i64 16}
!35 = !{!"amd_signal_s", !11, i64 0, !12, i64 8, !11, i64 16, !21, i64 24, !21, i64 28, !11, i64 32, !11, i64 40, !12, i64 48, !12, i64 56}
!36 = !{!35, !21, i64 24}
