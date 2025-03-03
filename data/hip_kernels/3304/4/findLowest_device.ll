; ModuleID = '../data/hip_kernels/3304/4/main.cu'
source_filename = "../data/hip_kernels/3304/4/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [25 x i8] c"Thread %d returned: %d \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z10findLowestiPiS_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = mul i32 %4, %0
  %6 = add nsw i32 %0, -1
  %7 = add i32 %6, %5
  %8 = sext i32 %5 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %8
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = icmp ult i32 %5, %7
  br i1 %11, label %12, label %33

12:                                               ; preds = %3
  %13 = add i32 %0, 7
  %14 = add i32 %0, -2
  %15 = and i32 %13, 7
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %28, label %17

17:                                               ; preds = %12, %17
  %18 = phi i32 [ %25, %17 ], [ %5, %12 ]
  %19 = phi i32 [ %24, %17 ], [ %10, %12 ]
  %20 = phi i32 [ %26, %17 ], [ 0, %12 ]
  %21 = zext i32 %18 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = tail call i32 @llvm.smin.i32(i32 %23, i32 %19)
  %25 = add nuw i32 %18, 1
  %26 = add i32 %20, 1
  %27 = icmp eq i32 %26, %15
  br i1 %27, label %28, label %17, !llvm.loop !10

28:                                               ; preds = %17, %12
  %29 = phi i32 [ undef, %12 ], [ %24, %17 ]
  %30 = phi i32 [ %5, %12 ], [ %25, %17 ]
  %31 = phi i32 [ %10, %12 ], [ %24, %17 ]
  %32 = icmp ult i32 %14, 7
  br i1 %32, label %33, label %45

33:                                               ; preds = %28, %45, %3
  %34 = phi i32 [ %10, %3 ], [ %29, %28 ], [ %86, %45 ]
  %35 = zext i32 %4 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %35
  store i32 %34, i32 addrspace(1)* %36, align 4, !tbaa !5
  %37 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %38 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 24
  %39 = bitcast i8 addrspace(4)* %38 to i64 addrspace(4)*
  %40 = load i64, i64 addrspace(4)* %39, align 8, !tbaa !12
  %41 = inttoptr i64 %40 to i8 addrspace(1)*
  %42 = addrspacecast i8 addrspace(1)* %41 to i8*
  %43 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %42, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %44 = extractelement <2 x i64> %43, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %89, label %93

45:                                               ; preds = %28, %45
  %46 = phi i32 [ %87, %45 ], [ %30, %28 ]
  %47 = phi i32 [ %86, %45 ], [ %31, %28 ]
  %48 = zext i32 %46 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = tail call i32 @llvm.smin.i32(i32 %50, i32 %47)
  %52 = add nuw i32 %46, 1
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = tail call i32 @llvm.smin.i32(i32 %55, i32 %51)
  %57 = add nuw i32 %46, 2
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = tail call i32 @llvm.smin.i32(i32 %60, i32 %56)
  %62 = add nuw i32 %46, 3
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = tail call i32 @llvm.smin.i32(i32 %65, i32 %61)
  %67 = add nuw i32 %46, 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  %71 = tail call i32 @llvm.smin.i32(i32 %70, i32 %66)
  %72 = add nuw i32 %46, 5
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = tail call i32 @llvm.smin.i32(i32 %75, i32 %71)
  %77 = add nuw i32 %46, 6
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = tail call i32 @llvm.smin.i32(i32 %80, i32 %76)
  %82 = add nuw i32 %46, 7
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5, !amdgpu.noclobber !9
  %86 = tail call i32 @llvm.smin.i32(i32 %85, i32 %81)
  %87 = add nuw i32 %46, 8
  %88 = icmp eq i32 %87, %7
  br i1 %88, label %33, label %45, !llvm.loop !16

89:                                               ; preds = %33
  %90 = and i64 %44, -225
  %91 = or i64 %90, 32
  %92 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %42, i64 noundef %91, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %534

93:                                               ; preds = %33
  %94 = and i64 %44, 2
  %95 = and i64 %44, -3
  %96 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %95, i64 0
  br label %97

97:                                               ; preds = %523, %93
  %98 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str, i64 0, i64 24) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([25 x i8]* addrspacecast ([25 x i8] addrspace(4)* @.str to [25 x i8]*) to i64)), i64 1))), %93 ], [ %531, %523 ]
  %99 = phi i8 addrspace(4)* [ getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str, i64 0, i64 0), %93 ], [ %532, %523 ]
  %100 = phi <2 x i64> [ %96, %93 ], [ %530, %523 ]
  %101 = icmp ugt i64 %98, 56
  %102 = extractelement <2 x i64> %100, i64 0
  %103 = or i64 %102, %94
  %104 = insertelement <2 x i64> poison, i64 %103, i64 0
  %105 = select i1 %101, <2 x i64> %100, <2 x i64> %104
  %106 = tail call i64 @llvm.umin.i64(i64 %98, i64 56)
  %107 = trunc i64 %106 to i32
  %108 = extractelement <2 x i64> %105, i64 0
  %109 = icmp ugt i32 %107, 7
  br i1 %109, label %112, label %110

110:                                              ; preds = %97
  %111 = icmp eq i32 %107, 0
  br i1 %111, label %165, label %152

112:                                              ; preds = %97
  %113 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !18
  %114 = zext i8 %113 to i64
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 1
  %116 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !18
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 8
  %119 = or i64 %118, %114
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 2
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !18
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 16
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 3
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !18
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 24
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 4
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !18
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 32
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 5
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !18
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 40
  %139 = or i64 %134, %138
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 6
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !18
  %142 = zext i8 %141 to i64
  %143 = shl nuw nsw i64 %142, 48
  %144 = or i64 %139, %143
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 7
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !18
  %147 = zext i8 %146 to i64
  %148 = shl nuw i64 %147, 56
  %149 = or i64 %144, %148
  %150 = add nsw i32 %107, -8
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 8
  br label %165

152:                                              ; preds = %110, %152
  %153 = phi i32 [ %163, %152 ], [ 0, %110 ]
  %154 = phi i64 [ %162, %152 ], [ 0, %110 ]
  %155 = zext i32 %153 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 %155
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !18
  %158 = zext i8 %157 to i64
  %159 = shl i32 %153, 3
  %160 = zext i32 %159 to i64
  %161 = shl nuw i64 %158, %160
  %162 = or i64 %161, %154
  %163 = add nuw nsw i32 %153, 1
  %164 = icmp eq i32 %163, %107
  br i1 %164, label %165, label %152, !llvm.loop !19

165:                                              ; preds = %152, %112, %110
  %166 = phi i8 addrspace(4)* [ %151, %112 ], [ %99, %110 ], [ %99, %152 ]
  %167 = phi i32 [ %150, %112 ], [ 0, %110 ], [ 0, %152 ]
  %168 = phi i64 [ %149, %112 ], [ 0, %110 ], [ %162, %152 ]
  %169 = icmp ugt i32 %167, 7
  br i1 %169, label %172, label %170

170:                                              ; preds = %165
  %171 = icmp eq i32 %167, 0
  br i1 %171, label %225, label %212

172:                                              ; preds = %165
  %173 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !18
  %174 = zext i8 %173 to i64
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 1
  %176 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !18
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 8
  %179 = or i64 %178, %174
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 2
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !18
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 16
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 3
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !18
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 24
  %189 = or i64 %184, %188
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 4
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !18
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 32
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 5
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !18
  %197 = zext i8 %196 to i64
  %198 = shl nuw nsw i64 %197, 40
  %199 = or i64 %194, %198
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 6
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !18
  %202 = zext i8 %201 to i64
  %203 = shl nuw nsw i64 %202, 48
  %204 = or i64 %199, %203
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 7
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !18
  %207 = zext i8 %206 to i64
  %208 = shl nuw i64 %207, 56
  %209 = or i64 %204, %208
  %210 = add nsw i32 %167, -8
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 8
  br label %225

212:                                              ; preds = %170, %212
  %213 = phi i32 [ %223, %212 ], [ 0, %170 ]
  %214 = phi i64 [ %222, %212 ], [ 0, %170 ]
  %215 = zext i32 %213 to i64
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %166, i64 %215
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !18
  %218 = zext i8 %217 to i64
  %219 = shl i32 %213, 3
  %220 = zext i32 %219 to i64
  %221 = shl nuw i64 %218, %220
  %222 = or i64 %221, %214
  %223 = add nuw nsw i32 %213, 1
  %224 = icmp eq i32 %223, %167
  br i1 %224, label %225, label %212

225:                                              ; preds = %212, %172, %170
  %226 = phi i8 addrspace(4)* [ %211, %172 ], [ %166, %170 ], [ %166, %212 ]
  %227 = phi i32 [ %210, %172 ], [ 0, %170 ], [ 0, %212 ]
  %228 = phi i64 [ %209, %172 ], [ 0, %170 ], [ %222, %212 ]
  %229 = icmp ugt i32 %227, 7
  br i1 %229, label %232, label %230

230:                                              ; preds = %225
  %231 = icmp eq i32 %227, 0
  br i1 %231, label %285, label %272

232:                                              ; preds = %225
  %233 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !18
  %234 = zext i8 %233 to i64
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 1
  %236 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !18
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 8
  %239 = or i64 %238, %234
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 2
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !18
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 16
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 3
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !18
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 24
  %249 = or i64 %244, %248
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 4
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !18
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 32
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 5
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !18
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 40
  %259 = or i64 %254, %258
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 6
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !18
  %262 = zext i8 %261 to i64
  %263 = shl nuw nsw i64 %262, 48
  %264 = or i64 %259, %263
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 7
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !18
  %267 = zext i8 %266 to i64
  %268 = shl nuw i64 %267, 56
  %269 = or i64 %264, %268
  %270 = add nsw i32 %227, -8
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 8
  br label %285

272:                                              ; preds = %230, %272
  %273 = phi i32 [ %283, %272 ], [ 0, %230 ]
  %274 = phi i64 [ %282, %272 ], [ 0, %230 ]
  %275 = zext i32 %273 to i64
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %226, i64 %275
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !18
  %278 = zext i8 %277 to i64
  %279 = shl i32 %273, 3
  %280 = zext i32 %279 to i64
  %281 = shl nuw i64 %278, %280
  %282 = or i64 %281, %274
  %283 = add nuw nsw i32 %273, 1
  %284 = icmp eq i32 %283, %227
  br i1 %284, label %285, label %272

285:                                              ; preds = %272, %232, %230
  %286 = phi i8 addrspace(4)* [ %271, %232 ], [ %226, %230 ], [ %226, %272 ]
  %287 = phi i32 [ %270, %232 ], [ 0, %230 ], [ 0, %272 ]
  %288 = phi i64 [ %269, %232 ], [ 0, %230 ], [ %282, %272 ]
  %289 = icmp ugt i32 %287, 7
  br i1 %289, label %292, label %290

290:                                              ; preds = %285
  %291 = icmp eq i32 %287, 0
  br i1 %291, label %345, label %332

292:                                              ; preds = %285
  %293 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !18
  %294 = zext i8 %293 to i64
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 1
  %296 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !18
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 8
  %299 = or i64 %298, %294
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 2
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !18
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 16
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 3
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !18
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 24
  %309 = or i64 %304, %308
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 4
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !18
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 32
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 5
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !18
  %317 = zext i8 %316 to i64
  %318 = shl nuw nsw i64 %317, 40
  %319 = or i64 %314, %318
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 6
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !18
  %322 = zext i8 %321 to i64
  %323 = shl nuw nsw i64 %322, 48
  %324 = or i64 %319, %323
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 7
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !18
  %327 = zext i8 %326 to i64
  %328 = shl nuw i64 %327, 56
  %329 = or i64 %324, %328
  %330 = add nsw i32 %287, -8
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 8
  br label %345

332:                                              ; preds = %290, %332
  %333 = phi i32 [ %343, %332 ], [ 0, %290 ]
  %334 = phi i64 [ %342, %332 ], [ 0, %290 ]
  %335 = zext i32 %333 to i64
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %286, i64 %335
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !18
  %338 = zext i8 %337 to i64
  %339 = shl i32 %333, 3
  %340 = zext i32 %339 to i64
  %341 = shl nuw i64 %338, %340
  %342 = or i64 %341, %334
  %343 = add nuw nsw i32 %333, 1
  %344 = icmp eq i32 %343, %287
  br i1 %344, label %345, label %332

345:                                              ; preds = %332, %292, %290
  %346 = phi i8 addrspace(4)* [ %331, %292 ], [ %286, %290 ], [ %286, %332 ]
  %347 = phi i32 [ %330, %292 ], [ 0, %290 ], [ 0, %332 ]
  %348 = phi i64 [ %329, %292 ], [ 0, %290 ], [ %342, %332 ]
  %349 = icmp ugt i32 %347, 7
  br i1 %349, label %352, label %350

350:                                              ; preds = %345
  %351 = icmp eq i32 %347, 0
  br i1 %351, label %405, label %392

352:                                              ; preds = %345
  %353 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !18
  %354 = zext i8 %353 to i64
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 1
  %356 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !18
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 8
  %359 = or i64 %358, %354
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 2
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !18
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 16
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 3
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !18
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 24
  %369 = or i64 %364, %368
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 4
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !18
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 32
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 5
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !18
  %377 = zext i8 %376 to i64
  %378 = shl nuw nsw i64 %377, 40
  %379 = or i64 %374, %378
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 6
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !18
  %382 = zext i8 %381 to i64
  %383 = shl nuw nsw i64 %382, 48
  %384 = or i64 %379, %383
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 7
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !18
  %387 = zext i8 %386 to i64
  %388 = shl nuw i64 %387, 56
  %389 = or i64 %384, %388
  %390 = add nsw i32 %347, -8
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 8
  br label %405

392:                                              ; preds = %350, %392
  %393 = phi i32 [ %403, %392 ], [ 0, %350 ]
  %394 = phi i64 [ %402, %392 ], [ 0, %350 ]
  %395 = zext i32 %393 to i64
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %346, i64 %395
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !18
  %398 = zext i8 %397 to i64
  %399 = shl i32 %393, 3
  %400 = zext i32 %399 to i64
  %401 = shl nuw i64 %398, %400
  %402 = or i64 %401, %394
  %403 = add nuw nsw i32 %393, 1
  %404 = icmp eq i32 %403, %347
  br i1 %404, label %405, label %392

405:                                              ; preds = %392, %352, %350
  %406 = phi i8 addrspace(4)* [ %391, %352 ], [ %346, %350 ], [ %346, %392 ]
  %407 = phi i32 [ %390, %352 ], [ 0, %350 ], [ 0, %392 ]
  %408 = phi i64 [ %389, %352 ], [ 0, %350 ], [ %402, %392 ]
  %409 = icmp ugt i32 %407, 7
  br i1 %409, label %412, label %410

410:                                              ; preds = %405
  %411 = icmp eq i32 %407, 0
  br i1 %411, label %465, label %452

412:                                              ; preds = %405
  %413 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !18
  %414 = zext i8 %413 to i64
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 1
  %416 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !18
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 8
  %419 = or i64 %418, %414
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 2
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !18
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 16
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 3
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !18
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 24
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 4
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !18
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 32
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 5
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !18
  %437 = zext i8 %436 to i64
  %438 = shl nuw nsw i64 %437, 40
  %439 = or i64 %434, %438
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 6
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !18
  %442 = zext i8 %441 to i64
  %443 = shl nuw nsw i64 %442, 48
  %444 = or i64 %439, %443
  %445 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 7
  %446 = load i8, i8 addrspace(4)* %445, align 1, !tbaa !18
  %447 = zext i8 %446 to i64
  %448 = shl nuw i64 %447, 56
  %449 = or i64 %444, %448
  %450 = add nsw i32 %407, -8
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 8
  br label %465

452:                                              ; preds = %410, %452
  %453 = phi i32 [ %463, %452 ], [ 0, %410 ]
  %454 = phi i64 [ %462, %452 ], [ 0, %410 ]
  %455 = zext i32 %453 to i64
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %406, i64 %455
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !18
  %458 = zext i8 %457 to i64
  %459 = shl i32 %453, 3
  %460 = zext i32 %459 to i64
  %461 = shl nuw i64 %458, %460
  %462 = or i64 %461, %454
  %463 = add nuw nsw i32 %453, 1
  %464 = icmp eq i32 %463, %407
  br i1 %464, label %465, label %452

465:                                              ; preds = %452, %412, %410
  %466 = phi i8 addrspace(4)* [ %451, %412 ], [ %406, %410 ], [ %406, %452 ]
  %467 = phi i32 [ %450, %412 ], [ 0, %410 ], [ 0, %452 ]
  %468 = phi i64 [ %449, %412 ], [ 0, %410 ], [ %462, %452 ]
  %469 = icmp ugt i32 %467, 7
  br i1 %469, label %472, label %470

470:                                              ; preds = %465
  %471 = icmp eq i32 %467, 0
  br i1 %471, label %523, label %510

472:                                              ; preds = %465
  %473 = load i8, i8 addrspace(4)* %466, align 1, !tbaa !18
  %474 = zext i8 %473 to i64
  %475 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 1
  %476 = load i8, i8 addrspace(4)* %475, align 1, !tbaa !18
  %477 = zext i8 %476 to i64
  %478 = shl nuw nsw i64 %477, 8
  %479 = or i64 %478, %474
  %480 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 2
  %481 = load i8, i8 addrspace(4)* %480, align 1, !tbaa !18
  %482 = zext i8 %481 to i64
  %483 = shl nuw nsw i64 %482, 16
  %484 = or i64 %479, %483
  %485 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 3
  %486 = load i8, i8 addrspace(4)* %485, align 1, !tbaa !18
  %487 = zext i8 %486 to i64
  %488 = shl nuw nsw i64 %487, 24
  %489 = or i64 %484, %488
  %490 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 4
  %491 = load i8, i8 addrspace(4)* %490, align 1, !tbaa !18
  %492 = zext i8 %491 to i64
  %493 = shl nuw nsw i64 %492, 32
  %494 = or i64 %489, %493
  %495 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 5
  %496 = load i8, i8 addrspace(4)* %495, align 1, !tbaa !18
  %497 = zext i8 %496 to i64
  %498 = shl nuw nsw i64 %497, 40
  %499 = or i64 %494, %498
  %500 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 6
  %501 = load i8, i8 addrspace(4)* %500, align 1, !tbaa !18
  %502 = zext i8 %501 to i64
  %503 = shl nuw nsw i64 %502, 48
  %504 = or i64 %499, %503
  %505 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 7
  %506 = load i8, i8 addrspace(4)* %505, align 1, !tbaa !18
  %507 = zext i8 %506 to i64
  %508 = shl nuw i64 %507, 56
  %509 = or i64 %504, %508
  br label %523

510:                                              ; preds = %470, %510
  %511 = phi i32 [ %521, %510 ], [ 0, %470 ]
  %512 = phi i64 [ %520, %510 ], [ 0, %470 ]
  %513 = zext i32 %511 to i64
  %514 = getelementptr inbounds i8, i8 addrspace(4)* %466, i64 %513
  %515 = load i8, i8 addrspace(4)* %514, align 1, !tbaa !18
  %516 = zext i8 %515 to i64
  %517 = shl i32 %511, 3
  %518 = zext i32 %517 to i64
  %519 = shl nuw i64 %516, %518
  %520 = or i64 %519, %512
  %521 = add nuw nsw i32 %511, 1
  %522 = icmp eq i32 %521, %467
  br i1 %522, label %523, label %510

523:                                              ; preds = %510, %472, %470
  %524 = phi i64 [ %509, %472 ], [ 0, %470 ], [ %520, %510 ]
  %525 = shl nuw nsw i64 %106, 2
  %526 = add nuw nsw i64 %525, 28
  %527 = and i64 %526, 480
  %528 = and i64 %108, -225
  %529 = or i64 %528, %527
  %530 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %42, i64 noundef %529, i64 noundef %168, i64 noundef %228, i64 noundef %288, i64 noundef %348, i64 noundef %408, i64 noundef %468, i64 noundef %524) #11
  %531 = sub i64 %98, %106
  %532 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 %106
  %533 = icmp eq i64 %531, 0
  br i1 %533, label %534, label %97

534:                                              ; preds = %523, %89
  %535 = phi <2 x i64> [ %92, %89 ], [ %530, %523 ]
  %536 = extractelement <2 x i64> %535, i64 0
  %537 = and i64 %536, -225
  %538 = or i64 %537, 32
  %539 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %42, i64 noundef %538, i64 noundef %35, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %540 = extractelement <2 x i64> %539, i64 0
  %541 = zext i32 %34 to i64
  %542 = and i64 %540, -227
  %543 = or i64 %542, 34
  %544 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %42, i64 noundef %543, i64 noundef %541, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !24
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !12
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !12
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !12
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !12
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !12
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !12
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !12
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !12
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !12
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !12
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !12
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !12
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !12
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !12
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !18
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !12
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #10

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
attributes #10 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!14, !14, i64 0}
!19 = distinct !{!19, !11}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !14, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !14, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !21, i64 0}
!26 = !{!"", !21, i64 0, !21, i64 8, !27, i64 16, !13, i64 24, !13, i64 32, !13, i64 40}
!27 = !{!"hsa_signal_s", !13, i64 0}
!28 = !{!26, !13, i64 40}
!29 = !{!26, !21, i64 8}
!30 = !{!"exec"}
!31 = !{!32, !23, i64 16}
!32 = !{!"", !13, i64 0, !13, i64 8, !23, i64 16, !23, i64 20}
!33 = !{!32, !13, i64 8}
!34 = !{!32, !23, i64 20}
!35 = !{!32, !13, i64 0}
!36 = !{!37, !13, i64 16}
!37 = !{!"amd_signal_s", !13, i64 0, !14, i64 8, !13, i64 16, !23, i64 24, !23, i64 28, !13, i64 32, !13, i64 40, !14, i64 48, !14, i64 56}
!38 = !{!37, !23, i64 24}
