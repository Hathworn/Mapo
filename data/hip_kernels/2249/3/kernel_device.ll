; ModuleID = '../data/hip_kernels/2249/3/main.cu'
source_filename = "../data/hip_kernels/2249/3/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [42 x i8] c"Hello, World! size=%d   tidx=%d, tidy=%d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z6kernelv() local_unnamed_addr #1 {
  %1 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %2 = getelementptr i8, i8 addrspace(4)* %1, i64 4
  %3 = bitcast i8 addrspace(4)* %2 to i16 addrspace(4)*
  %4 = load i16, i16 addrspace(4)* %3, align 4, !range !4, !invariant.load !5
  %5 = getelementptr i8, i8 addrspace(4)* %1, i64 6
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 2, !range !4, !invariant.load !5
  %8 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 24
  %10 = bitcast i8 addrspace(4)* %9 to i64 addrspace(4)*
  %11 = load i64, i64 addrspace(4)* %10, align 8, !tbaa !6
  %12 = inttoptr i64 %11 to i8 addrspace(1)*
  %13 = addrspacecast i8 addrspace(1)* %12 to i8*
  %14 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %15 = extractelement <2 x i64> %14, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([42 x i8], [42 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %16, label %20

16:                                               ; preds = %0
  %17 = and i64 %15, -225
  %18 = or i64 %17, 32
  %19 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %18, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %461

20:                                               ; preds = %0
  %21 = and i64 %15, 2
  %22 = and i64 %15, -3
  %23 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %22, i64 0
  br label %24

24:                                               ; preds = %450, %20
  %25 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([42 x i8], [42 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([42 x i8], [42 x i8] addrspace(4)* @.str, i64 0, i64 41) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([42 x i8]* addrspacecast ([42 x i8] addrspace(4)* @.str to [42 x i8]*) to i64)), i64 1))), %20 ], [ %458, %450 ]
  %26 = phi i8 addrspace(4)* [ getelementptr inbounds ([42 x i8], [42 x i8] addrspace(4)* @.str, i64 0, i64 0), %20 ], [ %459, %450 ]
  %27 = phi <2 x i64> [ %23, %20 ], [ %457, %450 ]
  %28 = icmp ugt i64 %25, 56
  %29 = extractelement <2 x i64> %27, i64 0
  %30 = or i64 %29, %21
  %31 = insertelement <2 x i64> poison, i64 %30, i64 0
  %32 = select i1 %28, <2 x i64> %27, <2 x i64> %31
  %33 = tail call i64 @llvm.umin.i64(i64 %25, i64 56)
  %34 = trunc i64 %33 to i32
  %35 = extractelement <2 x i64> %32, i64 0
  %36 = icmp ugt i32 %34, 7
  br i1 %36, label %39, label %37

37:                                               ; preds = %24
  %38 = icmp eq i32 %34, 0
  br i1 %38, label %92, label %79

39:                                               ; preds = %24
  %40 = load i8, i8 addrspace(4)* %26, align 1, !tbaa !10
  %41 = zext i8 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 1
  %43 = load i8, i8 addrspace(4)* %42, align 1, !tbaa !10
  %44 = zext i8 %43 to i64
  %45 = shl nuw nsw i64 %44, 8
  %46 = or i64 %45, %41
  %47 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 2
  %48 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !10
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 16
  %51 = or i64 %46, %50
  %52 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 3
  %53 = load i8, i8 addrspace(4)* %52, align 1, !tbaa !10
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 24
  %56 = or i64 %51, %55
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 4
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !10
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 32
  %61 = or i64 %56, %60
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 5
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !10
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 40
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 6
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !10
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 48
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 7
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !10
  %74 = zext i8 %73 to i64
  %75 = shl nuw i64 %74, 56
  %76 = or i64 %71, %75
  %77 = add nsw i32 %34, -8
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 8
  br label %92

79:                                               ; preds = %37, %79
  %80 = phi i32 [ %90, %79 ], [ 0, %37 ]
  %81 = phi i64 [ %89, %79 ], [ 0, %37 ]
  %82 = zext i32 %80 to i64
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 %82
  %84 = load i8, i8 addrspace(4)* %83, align 1, !tbaa !10
  %85 = zext i8 %84 to i64
  %86 = shl i32 %80, 3
  %87 = zext i32 %86 to i64
  %88 = shl nuw i64 %85, %87
  %89 = or i64 %88, %81
  %90 = add nuw nsw i32 %80, 1
  %91 = icmp eq i32 %90, %34
  br i1 %91, label %92, label %79, !llvm.loop !11

92:                                               ; preds = %79, %39, %37
  %93 = phi i8 addrspace(4)* [ %78, %39 ], [ %26, %37 ], [ %26, %79 ]
  %94 = phi i32 [ %77, %39 ], [ 0, %37 ], [ 0, %79 ]
  %95 = phi i64 [ %76, %39 ], [ 0, %37 ], [ %89, %79 ]
  %96 = icmp ugt i32 %94, 7
  br i1 %96, label %99, label %97

97:                                               ; preds = %92
  %98 = icmp eq i32 %94, 0
  br i1 %98, label %152, label %139

99:                                               ; preds = %92
  %100 = load i8, i8 addrspace(4)* %93, align 1, !tbaa !10
  %101 = zext i8 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 1
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !10
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 8
  %106 = or i64 %105, %101
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 2
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !10
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 16
  %111 = or i64 %106, %110
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 3
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !10
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 24
  %116 = or i64 %111, %115
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 4
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !10
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 32
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 5
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !10
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 40
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 6
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !10
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 48
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 7
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !10
  %134 = zext i8 %133 to i64
  %135 = shl nuw i64 %134, 56
  %136 = or i64 %131, %135
  %137 = add nsw i32 %94, -8
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 8
  br label %152

139:                                              ; preds = %97, %139
  %140 = phi i32 [ %150, %139 ], [ 0, %97 ]
  %141 = phi i64 [ %149, %139 ], [ 0, %97 ]
  %142 = zext i32 %140 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 %142
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !10
  %145 = zext i8 %144 to i64
  %146 = shl i32 %140, 3
  %147 = zext i32 %146 to i64
  %148 = shl nuw i64 %145, %147
  %149 = or i64 %148, %141
  %150 = add nuw nsw i32 %140, 1
  %151 = icmp eq i32 %150, %94
  br i1 %151, label %152, label %139

152:                                              ; preds = %139, %99, %97
  %153 = phi i8 addrspace(4)* [ %138, %99 ], [ %93, %97 ], [ %93, %139 ]
  %154 = phi i32 [ %137, %99 ], [ 0, %97 ], [ 0, %139 ]
  %155 = phi i64 [ %136, %99 ], [ 0, %97 ], [ %149, %139 ]
  %156 = icmp ugt i32 %154, 7
  br i1 %156, label %159, label %157

157:                                              ; preds = %152
  %158 = icmp eq i32 %154, 0
  br i1 %158, label %212, label %199

159:                                              ; preds = %152
  %160 = load i8, i8 addrspace(4)* %153, align 1, !tbaa !10
  %161 = zext i8 %160 to i64
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 1
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !10
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 8
  %166 = or i64 %165, %161
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 2
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !10
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 16
  %171 = or i64 %166, %170
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 3
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !10
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 24
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 4
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !10
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 32
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 5
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !10
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 40
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 6
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !10
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 48
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 7
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !10
  %194 = zext i8 %193 to i64
  %195 = shl nuw i64 %194, 56
  %196 = or i64 %191, %195
  %197 = add nsw i32 %154, -8
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 8
  br label %212

199:                                              ; preds = %157, %199
  %200 = phi i32 [ %210, %199 ], [ 0, %157 ]
  %201 = phi i64 [ %209, %199 ], [ 0, %157 ]
  %202 = zext i32 %200 to i64
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 %202
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !10
  %205 = zext i8 %204 to i64
  %206 = shl i32 %200, 3
  %207 = zext i32 %206 to i64
  %208 = shl nuw i64 %205, %207
  %209 = or i64 %208, %201
  %210 = add nuw nsw i32 %200, 1
  %211 = icmp eq i32 %210, %154
  br i1 %211, label %212, label %199

212:                                              ; preds = %199, %159, %157
  %213 = phi i8 addrspace(4)* [ %198, %159 ], [ %153, %157 ], [ %153, %199 ]
  %214 = phi i32 [ %197, %159 ], [ 0, %157 ], [ 0, %199 ]
  %215 = phi i64 [ %196, %159 ], [ 0, %157 ], [ %209, %199 ]
  %216 = icmp ugt i32 %214, 7
  br i1 %216, label %219, label %217

217:                                              ; preds = %212
  %218 = icmp eq i32 %214, 0
  br i1 %218, label %272, label %259

219:                                              ; preds = %212
  %220 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !10
  %221 = zext i8 %220 to i64
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 1
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !10
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 8
  %226 = or i64 %225, %221
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 2
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !10
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 16
  %231 = or i64 %226, %230
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 3
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !10
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 24
  %236 = or i64 %231, %235
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 4
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !10
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 32
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 5
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !10
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 40
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 6
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !10
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 48
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 7
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !10
  %254 = zext i8 %253 to i64
  %255 = shl nuw i64 %254, 56
  %256 = or i64 %251, %255
  %257 = add nsw i32 %214, -8
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 8
  br label %272

259:                                              ; preds = %217, %259
  %260 = phi i32 [ %270, %259 ], [ 0, %217 ]
  %261 = phi i64 [ %269, %259 ], [ 0, %217 ]
  %262 = zext i32 %260 to i64
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 %262
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !10
  %265 = zext i8 %264 to i64
  %266 = shl i32 %260, 3
  %267 = zext i32 %266 to i64
  %268 = shl nuw i64 %265, %267
  %269 = or i64 %268, %261
  %270 = add nuw nsw i32 %260, 1
  %271 = icmp eq i32 %270, %214
  br i1 %271, label %272, label %259

272:                                              ; preds = %259, %219, %217
  %273 = phi i8 addrspace(4)* [ %258, %219 ], [ %213, %217 ], [ %213, %259 ]
  %274 = phi i32 [ %257, %219 ], [ 0, %217 ], [ 0, %259 ]
  %275 = phi i64 [ %256, %219 ], [ 0, %217 ], [ %269, %259 ]
  %276 = icmp ugt i32 %274, 7
  br i1 %276, label %279, label %277

277:                                              ; preds = %272
  %278 = icmp eq i32 %274, 0
  br i1 %278, label %332, label %319

279:                                              ; preds = %272
  %280 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !10
  %281 = zext i8 %280 to i64
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 1
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !10
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 8
  %286 = or i64 %285, %281
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 2
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !10
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 16
  %291 = or i64 %286, %290
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 3
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !10
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 24
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 4
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !10
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 32
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 5
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !10
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 40
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 6
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !10
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 48
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 7
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !10
  %314 = zext i8 %313 to i64
  %315 = shl nuw i64 %314, 56
  %316 = or i64 %311, %315
  %317 = add nsw i32 %274, -8
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 8
  br label %332

319:                                              ; preds = %277, %319
  %320 = phi i32 [ %330, %319 ], [ 0, %277 ]
  %321 = phi i64 [ %329, %319 ], [ 0, %277 ]
  %322 = zext i32 %320 to i64
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 %322
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !10
  %325 = zext i8 %324 to i64
  %326 = shl i32 %320, 3
  %327 = zext i32 %326 to i64
  %328 = shl nuw i64 %325, %327
  %329 = or i64 %328, %321
  %330 = add nuw nsw i32 %320, 1
  %331 = icmp eq i32 %330, %274
  br i1 %331, label %332, label %319

332:                                              ; preds = %319, %279, %277
  %333 = phi i8 addrspace(4)* [ %318, %279 ], [ %273, %277 ], [ %273, %319 ]
  %334 = phi i32 [ %317, %279 ], [ 0, %277 ], [ 0, %319 ]
  %335 = phi i64 [ %316, %279 ], [ 0, %277 ], [ %329, %319 ]
  %336 = icmp ugt i32 %334, 7
  br i1 %336, label %339, label %337

337:                                              ; preds = %332
  %338 = icmp eq i32 %334, 0
  br i1 %338, label %392, label %379

339:                                              ; preds = %332
  %340 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !10
  %341 = zext i8 %340 to i64
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 1
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !10
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 8
  %346 = or i64 %345, %341
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 2
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !10
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 16
  %351 = or i64 %346, %350
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 3
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !10
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 24
  %356 = or i64 %351, %355
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 4
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !10
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 32
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 5
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !10
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 40
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 6
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !10
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 48
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 7
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !10
  %374 = zext i8 %373 to i64
  %375 = shl nuw i64 %374, 56
  %376 = or i64 %371, %375
  %377 = add nsw i32 %334, -8
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 8
  br label %392

379:                                              ; preds = %337, %379
  %380 = phi i32 [ %390, %379 ], [ 0, %337 ]
  %381 = phi i64 [ %389, %379 ], [ 0, %337 ]
  %382 = zext i32 %380 to i64
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 %382
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !10
  %385 = zext i8 %384 to i64
  %386 = shl i32 %380, 3
  %387 = zext i32 %386 to i64
  %388 = shl nuw i64 %385, %387
  %389 = or i64 %388, %381
  %390 = add nuw nsw i32 %380, 1
  %391 = icmp eq i32 %390, %334
  br i1 %391, label %392, label %379

392:                                              ; preds = %379, %339, %337
  %393 = phi i8 addrspace(4)* [ %378, %339 ], [ %333, %337 ], [ %333, %379 ]
  %394 = phi i32 [ %377, %339 ], [ 0, %337 ], [ 0, %379 ]
  %395 = phi i64 [ %376, %339 ], [ 0, %337 ], [ %389, %379 ]
  %396 = icmp ugt i32 %394, 7
  br i1 %396, label %399, label %397

397:                                              ; preds = %392
  %398 = icmp eq i32 %394, 0
  br i1 %398, label %450, label %437

399:                                              ; preds = %392
  %400 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !10
  %401 = zext i8 %400 to i64
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 1
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !10
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 8
  %406 = or i64 %405, %401
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 2
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !10
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 16
  %411 = or i64 %406, %410
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 3
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !10
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 24
  %416 = or i64 %411, %415
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 4
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !10
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 32
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 5
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !10
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 40
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 6
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !10
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 48
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 7
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !10
  %434 = zext i8 %433 to i64
  %435 = shl nuw i64 %434, 56
  %436 = or i64 %431, %435
  br label %450

437:                                              ; preds = %397, %437
  %438 = phi i32 [ %448, %437 ], [ 0, %397 ]
  %439 = phi i64 [ %447, %437 ], [ 0, %397 ]
  %440 = zext i32 %438 to i64
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 %440
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !10
  %443 = zext i8 %442 to i64
  %444 = shl i32 %438, 3
  %445 = zext i32 %444 to i64
  %446 = shl nuw i64 %443, %445
  %447 = or i64 %446, %439
  %448 = add nuw nsw i32 %438, 1
  %449 = icmp eq i32 %448, %394
  br i1 %449, label %450, label %437

450:                                              ; preds = %437, %399, %397
  %451 = phi i64 [ %436, %399 ], [ 0, %397 ], [ %447, %437 ]
  %452 = shl nuw nsw i64 %33, 2
  %453 = add nuw nsw i64 %452, 28
  %454 = and i64 %453, 480
  %455 = and i64 %35, -225
  %456 = or i64 %455, %454
  %457 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %456, i64 noundef %95, i64 noundef %155, i64 noundef %215, i64 noundef %275, i64 noundef %335, i64 noundef %395, i64 noundef %451) #10
  %458 = sub i64 %25, %33
  %459 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 %33
  %460 = icmp eq i64 %458, 0
  br i1 %460, label %461, label %24

461:                                              ; preds = %450, %16
  %462 = phi <2 x i64> [ %19, %16 ], [ %457, %450 ]
  %463 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !13
  %464 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %465 = zext i16 %4 to i32
  %466 = mul i32 %464, %465
  %467 = add i32 %466, %463
  %468 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !13
  %469 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %470 = zext i16 %7 to i32
  %471 = mul i32 %469, %470
  %472 = add i32 %471, %468
  %473 = extractelement <2 x i64> %462, i64 0
  %474 = and i64 %473, -225
  %475 = or i64 %474, 32
  %476 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %475, i64 noundef 4, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %477 = extractelement <2 x i64> %476, i64 0
  %478 = zext i32 %467 to i64
  %479 = and i64 %477, -225
  %480 = or i64 %479, 32
  %481 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %480, i64 noundef %478, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %482 = extractelement <2 x i64> %481, i64 0
  %483 = zext i32 %472 to i64
  %484 = and i64 %482, -227
  %485 = or i64 %484, 34
  %486 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %485, i64 noundef %483, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
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
