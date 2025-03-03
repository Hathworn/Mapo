; ModuleID = '../data/hip_kernels/4933/341/main.cu'
source_filename = "../data/hip_kernels/4933/341/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [96 x i8] c"threadIdx: (%d, %d, %d), blockIdx: (%d, %d, %d), blockDim: (%d, %d, %d), gridDim: (%d, %d, %d)\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z10checkIndexv() local_unnamed_addr #1 {
  %1 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %2 = getelementptr i8, i8 addrspace(4)* %1, i64 4
  %3 = bitcast i8 addrspace(4)* %2 to i16 addrspace(4)*
  %4 = load i16, i16 addrspace(4)* %3, align 4, !range !4, !invariant.load !5
  %5 = zext i16 %4 to i32
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !6
  %9 = getelementptr i8, i8 addrspace(4)* %1, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 16
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 8, !tbaa !15
  %16 = getelementptr i8, i8 addrspace(4)* %1, i64 8
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 20
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !16
  %23 = udiv i32 %8, %5
  %24 = udiv i32 %15, %12
  %25 = udiv i32 %22, %19
  %26 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 24
  %28 = bitcast i8 addrspace(4)* %27 to i64 addrspace(4)*
  %29 = load i64, i64 addrspace(4)* %28, align 8, !tbaa !17
  %30 = inttoptr i64 %29 to i8 addrspace(1)*
  %31 = addrspacecast i8 addrspace(1)* %30 to i8*
  %32 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %33 = extractelement <2 x i64> %32, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([96 x i8], [96 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %34, label %38

34:                                               ; preds = %0
  %35 = and i64 %33, -225
  %36 = or i64 %35, 32
  %37 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %36, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %479

38:                                               ; preds = %0
  %39 = and i64 %33, 2
  %40 = and i64 %33, -3
  %41 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %40, i64 0
  br label %42

42:                                               ; preds = %468, %38
  %43 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([96 x i8], [96 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([96 x i8], [96 x i8] addrspace(4)* @.str, i64 0, i64 95) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([96 x i8]* addrspacecast ([96 x i8] addrspace(4)* @.str to [96 x i8]*) to i64)), i64 1))), %38 ], [ %476, %468 ]
  %44 = phi i8 addrspace(4)* [ getelementptr inbounds ([96 x i8], [96 x i8] addrspace(4)* @.str, i64 0, i64 0), %38 ], [ %477, %468 ]
  %45 = phi <2 x i64> [ %41, %38 ], [ %475, %468 ]
  %46 = icmp ugt i64 %43, 56
  %47 = extractelement <2 x i64> %45, i64 0
  %48 = or i64 %47, %39
  %49 = insertelement <2 x i64> poison, i64 %48, i64 0
  %50 = select i1 %46, <2 x i64> %45, <2 x i64> %49
  %51 = tail call i64 @llvm.umin.i64(i64 %43, i64 56)
  %52 = trunc i64 %51 to i32
  %53 = extractelement <2 x i64> %50, i64 0
  %54 = icmp ugt i32 %52, 7
  br i1 %54, label %57, label %55

55:                                               ; preds = %42
  %56 = icmp eq i32 %52, 0
  br i1 %56, label %110, label %97

57:                                               ; preds = %42
  %58 = load i8, i8 addrspace(4)* %44, align 1, !tbaa !18
  %59 = zext i8 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 1
  %61 = load i8, i8 addrspace(4)* %60, align 1, !tbaa !18
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 8
  %64 = or i64 %63, %59
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 2
  %66 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !18
  %67 = zext i8 %66 to i64
  %68 = shl nuw nsw i64 %67, 16
  %69 = or i64 %64, %68
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 3
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !18
  %72 = zext i8 %71 to i64
  %73 = shl nuw nsw i64 %72, 24
  %74 = or i64 %69, %73
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 4
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !18
  %77 = zext i8 %76 to i64
  %78 = shl nuw nsw i64 %77, 32
  %79 = or i64 %74, %78
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 5
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !18
  %82 = zext i8 %81 to i64
  %83 = shl nuw nsw i64 %82, 40
  %84 = or i64 %79, %83
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 6
  %86 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !18
  %87 = zext i8 %86 to i64
  %88 = shl nuw nsw i64 %87, 48
  %89 = or i64 %84, %88
  %90 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 7
  %91 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !18
  %92 = zext i8 %91 to i64
  %93 = shl nuw i64 %92, 56
  %94 = or i64 %89, %93
  %95 = add nsw i32 %52, -8
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 8
  br label %110

97:                                               ; preds = %55, %97
  %98 = phi i32 [ %108, %97 ], [ 0, %55 ]
  %99 = phi i64 [ %107, %97 ], [ 0, %55 ]
  %100 = zext i32 %98 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 %100
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !18
  %103 = zext i8 %102 to i64
  %104 = shl i32 %98, 3
  %105 = zext i32 %104 to i64
  %106 = shl nuw i64 %103, %105
  %107 = or i64 %106, %99
  %108 = add nuw nsw i32 %98, 1
  %109 = icmp eq i32 %108, %52
  br i1 %109, label %110, label %97, !llvm.loop !19

110:                                              ; preds = %97, %57, %55
  %111 = phi i8 addrspace(4)* [ %96, %57 ], [ %44, %55 ], [ %44, %97 ]
  %112 = phi i32 [ %95, %57 ], [ 0, %55 ], [ 0, %97 ]
  %113 = phi i64 [ %94, %57 ], [ 0, %55 ], [ %107, %97 ]
  %114 = icmp ugt i32 %112, 7
  br i1 %114, label %117, label %115

115:                                              ; preds = %110
  %116 = icmp eq i32 %112, 0
  br i1 %116, label %170, label %157

117:                                              ; preds = %110
  %118 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !18
  %119 = zext i8 %118 to i64
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 1
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !18
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 8
  %124 = or i64 %123, %119
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 2
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !18
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 16
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 3
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !18
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 24
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 4
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !18
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 32
  %139 = or i64 %134, %138
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 5
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !18
  %142 = zext i8 %141 to i64
  %143 = shl nuw nsw i64 %142, 40
  %144 = or i64 %139, %143
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 6
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !18
  %147 = zext i8 %146 to i64
  %148 = shl nuw nsw i64 %147, 48
  %149 = or i64 %144, %148
  %150 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 7
  %151 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !18
  %152 = zext i8 %151 to i64
  %153 = shl nuw i64 %152, 56
  %154 = or i64 %149, %153
  %155 = add nsw i32 %112, -8
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 8
  br label %170

157:                                              ; preds = %115, %157
  %158 = phi i32 [ %168, %157 ], [ 0, %115 ]
  %159 = phi i64 [ %167, %157 ], [ 0, %115 ]
  %160 = zext i32 %158 to i64
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %111, i64 %160
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !18
  %163 = zext i8 %162 to i64
  %164 = shl i32 %158, 3
  %165 = zext i32 %164 to i64
  %166 = shl nuw i64 %163, %165
  %167 = or i64 %166, %159
  %168 = add nuw nsw i32 %158, 1
  %169 = icmp eq i32 %168, %112
  br i1 %169, label %170, label %157

170:                                              ; preds = %157, %117, %115
  %171 = phi i8 addrspace(4)* [ %156, %117 ], [ %111, %115 ], [ %111, %157 ]
  %172 = phi i32 [ %155, %117 ], [ 0, %115 ], [ 0, %157 ]
  %173 = phi i64 [ %154, %117 ], [ 0, %115 ], [ %167, %157 ]
  %174 = icmp ugt i32 %172, 7
  br i1 %174, label %177, label %175

175:                                              ; preds = %170
  %176 = icmp eq i32 %172, 0
  br i1 %176, label %230, label %217

177:                                              ; preds = %170
  %178 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !18
  %179 = zext i8 %178 to i64
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 1
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !18
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 8
  %184 = or i64 %183, %179
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 2
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !18
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 16
  %189 = or i64 %184, %188
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 3
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !18
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 24
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 4
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !18
  %197 = zext i8 %196 to i64
  %198 = shl nuw nsw i64 %197, 32
  %199 = or i64 %194, %198
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 5
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !18
  %202 = zext i8 %201 to i64
  %203 = shl nuw nsw i64 %202, 40
  %204 = or i64 %199, %203
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 6
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !18
  %207 = zext i8 %206 to i64
  %208 = shl nuw nsw i64 %207, 48
  %209 = or i64 %204, %208
  %210 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 7
  %211 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !18
  %212 = zext i8 %211 to i64
  %213 = shl nuw i64 %212, 56
  %214 = or i64 %209, %213
  %215 = add nsw i32 %172, -8
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 8
  br label %230

217:                                              ; preds = %175, %217
  %218 = phi i32 [ %228, %217 ], [ 0, %175 ]
  %219 = phi i64 [ %227, %217 ], [ 0, %175 ]
  %220 = zext i32 %218 to i64
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %171, i64 %220
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !18
  %223 = zext i8 %222 to i64
  %224 = shl i32 %218, 3
  %225 = zext i32 %224 to i64
  %226 = shl nuw i64 %223, %225
  %227 = or i64 %226, %219
  %228 = add nuw nsw i32 %218, 1
  %229 = icmp eq i32 %228, %172
  br i1 %229, label %230, label %217

230:                                              ; preds = %217, %177, %175
  %231 = phi i8 addrspace(4)* [ %216, %177 ], [ %171, %175 ], [ %171, %217 ]
  %232 = phi i32 [ %215, %177 ], [ 0, %175 ], [ 0, %217 ]
  %233 = phi i64 [ %214, %177 ], [ 0, %175 ], [ %227, %217 ]
  %234 = icmp ugt i32 %232, 7
  br i1 %234, label %237, label %235

235:                                              ; preds = %230
  %236 = icmp eq i32 %232, 0
  br i1 %236, label %290, label %277

237:                                              ; preds = %230
  %238 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !18
  %239 = zext i8 %238 to i64
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 1
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !18
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 8
  %244 = or i64 %243, %239
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 2
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !18
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 16
  %249 = or i64 %244, %248
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 3
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !18
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 24
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 4
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !18
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 32
  %259 = or i64 %254, %258
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 5
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !18
  %262 = zext i8 %261 to i64
  %263 = shl nuw nsw i64 %262, 40
  %264 = or i64 %259, %263
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 6
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !18
  %267 = zext i8 %266 to i64
  %268 = shl nuw nsw i64 %267, 48
  %269 = or i64 %264, %268
  %270 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 7
  %271 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !18
  %272 = zext i8 %271 to i64
  %273 = shl nuw i64 %272, 56
  %274 = or i64 %269, %273
  %275 = add nsw i32 %232, -8
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 8
  br label %290

277:                                              ; preds = %235, %277
  %278 = phi i32 [ %288, %277 ], [ 0, %235 ]
  %279 = phi i64 [ %287, %277 ], [ 0, %235 ]
  %280 = zext i32 %278 to i64
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %231, i64 %280
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !18
  %283 = zext i8 %282 to i64
  %284 = shl i32 %278, 3
  %285 = zext i32 %284 to i64
  %286 = shl nuw i64 %283, %285
  %287 = or i64 %286, %279
  %288 = add nuw nsw i32 %278, 1
  %289 = icmp eq i32 %288, %232
  br i1 %289, label %290, label %277

290:                                              ; preds = %277, %237, %235
  %291 = phi i8 addrspace(4)* [ %276, %237 ], [ %231, %235 ], [ %231, %277 ]
  %292 = phi i32 [ %275, %237 ], [ 0, %235 ], [ 0, %277 ]
  %293 = phi i64 [ %274, %237 ], [ 0, %235 ], [ %287, %277 ]
  %294 = icmp ugt i32 %292, 7
  br i1 %294, label %297, label %295

295:                                              ; preds = %290
  %296 = icmp eq i32 %292, 0
  br i1 %296, label %350, label %337

297:                                              ; preds = %290
  %298 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !18
  %299 = zext i8 %298 to i64
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 1
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !18
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 8
  %304 = or i64 %303, %299
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 2
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !18
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 16
  %309 = or i64 %304, %308
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 3
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !18
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 24
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 4
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !18
  %317 = zext i8 %316 to i64
  %318 = shl nuw nsw i64 %317, 32
  %319 = or i64 %314, %318
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 5
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !18
  %322 = zext i8 %321 to i64
  %323 = shl nuw nsw i64 %322, 40
  %324 = or i64 %319, %323
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 6
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !18
  %327 = zext i8 %326 to i64
  %328 = shl nuw nsw i64 %327, 48
  %329 = or i64 %324, %328
  %330 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 7
  %331 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !18
  %332 = zext i8 %331 to i64
  %333 = shl nuw i64 %332, 56
  %334 = or i64 %329, %333
  %335 = add nsw i32 %292, -8
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 8
  br label %350

337:                                              ; preds = %295, %337
  %338 = phi i32 [ %348, %337 ], [ 0, %295 ]
  %339 = phi i64 [ %347, %337 ], [ 0, %295 ]
  %340 = zext i32 %338 to i64
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %291, i64 %340
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !18
  %343 = zext i8 %342 to i64
  %344 = shl i32 %338, 3
  %345 = zext i32 %344 to i64
  %346 = shl nuw i64 %343, %345
  %347 = or i64 %346, %339
  %348 = add nuw nsw i32 %338, 1
  %349 = icmp eq i32 %348, %292
  br i1 %349, label %350, label %337

350:                                              ; preds = %337, %297, %295
  %351 = phi i8 addrspace(4)* [ %336, %297 ], [ %291, %295 ], [ %291, %337 ]
  %352 = phi i32 [ %335, %297 ], [ 0, %295 ], [ 0, %337 ]
  %353 = phi i64 [ %334, %297 ], [ 0, %295 ], [ %347, %337 ]
  %354 = icmp ugt i32 %352, 7
  br i1 %354, label %357, label %355

355:                                              ; preds = %350
  %356 = icmp eq i32 %352, 0
  br i1 %356, label %410, label %397

357:                                              ; preds = %350
  %358 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !18
  %359 = zext i8 %358 to i64
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 1
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !18
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 8
  %364 = or i64 %363, %359
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 2
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !18
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 16
  %369 = or i64 %364, %368
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 3
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !18
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 24
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 4
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !18
  %377 = zext i8 %376 to i64
  %378 = shl nuw nsw i64 %377, 32
  %379 = or i64 %374, %378
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 5
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !18
  %382 = zext i8 %381 to i64
  %383 = shl nuw nsw i64 %382, 40
  %384 = or i64 %379, %383
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 6
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !18
  %387 = zext i8 %386 to i64
  %388 = shl nuw nsw i64 %387, 48
  %389 = or i64 %384, %388
  %390 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 7
  %391 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !18
  %392 = zext i8 %391 to i64
  %393 = shl nuw i64 %392, 56
  %394 = or i64 %389, %393
  %395 = add nsw i32 %352, -8
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 8
  br label %410

397:                                              ; preds = %355, %397
  %398 = phi i32 [ %408, %397 ], [ 0, %355 ]
  %399 = phi i64 [ %407, %397 ], [ 0, %355 ]
  %400 = zext i32 %398 to i64
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %351, i64 %400
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !18
  %403 = zext i8 %402 to i64
  %404 = shl i32 %398, 3
  %405 = zext i32 %404 to i64
  %406 = shl nuw i64 %403, %405
  %407 = or i64 %406, %399
  %408 = add nuw nsw i32 %398, 1
  %409 = icmp eq i32 %408, %352
  br i1 %409, label %410, label %397

410:                                              ; preds = %397, %357, %355
  %411 = phi i8 addrspace(4)* [ %396, %357 ], [ %351, %355 ], [ %351, %397 ]
  %412 = phi i32 [ %395, %357 ], [ 0, %355 ], [ 0, %397 ]
  %413 = phi i64 [ %394, %357 ], [ 0, %355 ], [ %407, %397 ]
  %414 = icmp ugt i32 %412, 7
  br i1 %414, label %417, label %415

415:                                              ; preds = %410
  %416 = icmp eq i32 %412, 0
  br i1 %416, label %468, label %455

417:                                              ; preds = %410
  %418 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !18
  %419 = zext i8 %418 to i64
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %411, i64 1
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !18
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 8
  %424 = or i64 %423, %419
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %411, i64 2
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !18
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 16
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %411, i64 3
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !18
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 24
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %411, i64 4
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !18
  %437 = zext i8 %436 to i64
  %438 = shl nuw nsw i64 %437, 32
  %439 = or i64 %434, %438
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %411, i64 5
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !18
  %442 = zext i8 %441 to i64
  %443 = shl nuw nsw i64 %442, 40
  %444 = or i64 %439, %443
  %445 = getelementptr inbounds i8, i8 addrspace(4)* %411, i64 6
  %446 = load i8, i8 addrspace(4)* %445, align 1, !tbaa !18
  %447 = zext i8 %446 to i64
  %448 = shl nuw nsw i64 %447, 48
  %449 = or i64 %444, %448
  %450 = getelementptr inbounds i8, i8 addrspace(4)* %411, i64 7
  %451 = load i8, i8 addrspace(4)* %450, align 1, !tbaa !18
  %452 = zext i8 %451 to i64
  %453 = shl nuw i64 %452, 56
  %454 = or i64 %449, %453
  br label %468

455:                                              ; preds = %415, %455
  %456 = phi i32 [ %466, %455 ], [ 0, %415 ]
  %457 = phi i64 [ %465, %455 ], [ 0, %415 ]
  %458 = zext i32 %456 to i64
  %459 = getelementptr inbounds i8, i8 addrspace(4)* %411, i64 %458
  %460 = load i8, i8 addrspace(4)* %459, align 1, !tbaa !18
  %461 = zext i8 %460 to i64
  %462 = shl i32 %456, 3
  %463 = zext i32 %462 to i64
  %464 = shl nuw i64 %461, %463
  %465 = or i64 %464, %457
  %466 = add nuw nsw i32 %456, 1
  %467 = icmp eq i32 %466, %412
  br i1 %467, label %468, label %455

468:                                              ; preds = %455, %417, %415
  %469 = phi i64 [ %454, %417 ], [ 0, %415 ], [ %465, %455 ]
  %470 = shl nuw nsw i64 %51, 2
  %471 = add nuw nsw i64 %470, 28
  %472 = and i64 %471, 480
  %473 = and i64 %53, -225
  %474 = or i64 %473, %472
  %475 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %474, i64 noundef %113, i64 noundef %173, i64 noundef %233, i64 noundef %293, i64 noundef %353, i64 noundef %413, i64 noundef %469) #10
  %476 = sub i64 %43, %51
  %477 = getelementptr inbounds i8, i8 addrspace(4)* %44, i64 %51
  %478 = icmp eq i64 %476, 0
  br i1 %478, label %479, label %42

479:                                              ; preds = %468, %34
  %480 = phi <2 x i64> [ %37, %34 ], [ %475, %468 ]
  %481 = mul i32 %25, %19
  %482 = icmp ugt i32 %22, %481
  %483 = zext i1 %482 to i32
  %484 = add i32 %25, %483
  %485 = mul i32 %24, %12
  %486 = icmp ugt i32 %15, %485
  %487 = zext i1 %486 to i32
  %488 = add i32 %24, %487
  %489 = mul i32 %23, %5
  %490 = icmp ugt i32 %8, %489
  %491 = zext i1 %490 to i32
  %492 = add i32 %23, %491
  %493 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %494 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %495 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %496 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !21
  %497 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %498 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %499 = extractelement <2 x i64> %480, i64 0
  %500 = zext i32 %498 to i64
  %501 = and i64 %499, -225
  %502 = or i64 %501, 32
  %503 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %502, i64 noundef %500, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %504 = extractelement <2 x i64> %503, i64 0
  %505 = zext i32 %497 to i64
  %506 = and i64 %504, -225
  %507 = or i64 %506, 32
  %508 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %507, i64 noundef %505, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %509 = extractelement <2 x i64> %508, i64 0
  %510 = zext i32 %496 to i64
  %511 = and i64 %509, -225
  %512 = or i64 %511, 32
  %513 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %512, i64 noundef %510, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %514 = extractelement <2 x i64> %513, i64 0
  %515 = zext i32 %495 to i64
  %516 = and i64 %514, -225
  %517 = or i64 %516, 32
  %518 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %517, i64 noundef %515, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %519 = extractelement <2 x i64> %518, i64 0
  %520 = zext i32 %494 to i64
  %521 = and i64 %519, -225
  %522 = or i64 %521, 32
  %523 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %522, i64 noundef %520, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %524 = extractelement <2 x i64> %523, i64 0
  %525 = zext i32 %493 to i64
  %526 = and i64 %524, -225
  %527 = or i64 %526, 32
  %528 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %527, i64 noundef %525, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %529 = extractelement <2 x i64> %528, i64 0
  %530 = zext i16 %4 to i64
  %531 = and i64 %529, -225
  %532 = or i64 %531, 32
  %533 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %532, i64 noundef %530, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %534 = extractelement <2 x i64> %533, i64 0
  %535 = zext i16 %11 to i64
  %536 = and i64 %534, -225
  %537 = or i64 %536, 32
  %538 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %537, i64 noundef %535, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %539 = extractelement <2 x i64> %538, i64 0
  %540 = zext i16 %18 to i64
  %541 = and i64 %539, -225
  %542 = or i64 %541, 32
  %543 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %542, i64 noundef %540, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %544 = extractelement <2 x i64> %543, i64 0
  %545 = zext i32 %492 to i64
  %546 = and i64 %544, -225
  %547 = or i64 %546, 32
  %548 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %547, i64 noundef %545, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %549 = extractelement <2 x i64> %548, i64 0
  %550 = zext i32 %488 to i64
  %551 = and i64 %549, -225
  %552 = or i64 %551, 32
  %553 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %552, i64 noundef %550, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %554 = extractelement <2 x i64> %553, i64 0
  %555 = zext i32 %484 to i64
  %556 = and i64 %554, -227
  %557 = or i64 %556, 34
  %558 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %557, i64 noundef %555, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !22
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !23
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !23
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !23
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !23
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !22
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !27
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
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !27
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !27
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !28
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !27
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !23
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !17
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !17
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !17
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !17
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !17
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !17
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !17
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !17
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %110 = call i64 @llvm.read_register.i64(metadata !29) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !30
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !32
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !33
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !25
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !27
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !34
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !34
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !35
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !37
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !27
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
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !34
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !34
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{!7, !11, i64 16}
!16 = !{!7, !11, i64 20}
!17 = !{!12, !12, i64 0}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = !{i32 0, i32 1024}
!22 = !{!13, !13, i64 0}
!23 = !{!11, !11, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !13, i64 0}
!26 = !{!"", !13, i64 0, !13, i64 8, !14, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!27 = !{!26, !12, i64 40}
!28 = !{!26, !13, i64 8}
!29 = !{!"exec"}
!30 = !{!31, !11, i64 16}
!31 = !{!"", !12, i64 0, !12, i64 8, !11, i64 16, !11, i64 20}
!32 = !{!31, !12, i64 8}
!33 = !{!31, !11, i64 20}
!34 = !{!31, !12, i64 0}
!35 = !{!36, !12, i64 16}
!36 = !{!"amd_signal_s", !12, i64 0, !9, i64 8, !12, i64 16, !11, i64 24, !11, i64 28, !12, i64 32, !12, i64 40, !9, i64 48, !9, i64 56}
!37 = !{!36, !11, i64 24}
