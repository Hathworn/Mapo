; ModuleID = '../data/hip_kernels/16453/1/main.cu'
source_filename = "../data/hip_kernels/16453/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [103 x i8] c"Hello from GPU blockIdx.x=%d blockIdx.y=%d blockIdx.z=%d threadIdx.x=%d threadIdx.y=%d threadIdx.z=%d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z10cuda_hellov() local_unnamed_addr #1 {
  %1 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 24
  %3 = bitcast i8 addrspace(4)* %2 to i64 addrspace(4)*
  %4 = load i64, i64 addrspace(4)* %3, align 8, !tbaa !4
  %5 = inttoptr i64 %4 to i8 addrspace(1)*
  %6 = addrspacecast i8 addrspace(1)* %5 to i8*
  %7 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %8 = extractelement <2 x i64> %7, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([103 x i8], [103 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %18, label %9

9:                                                ; preds = %0, %9
  %10 = phi i8 addrspace(4)* [ %11, %9 ], [ getelementptr inbounds ([103 x i8], [103 x i8] addrspace(4)* @.str, i64 0, i64 0), %0 ]
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 1
  %12 = load i8, i8 addrspace(4)* %10, align 1
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %9

14:                                               ; preds = %9
  %15 = addrspacecast i8 addrspace(4)* %10 to i8*
  %16 = ptrtoint i8* %15 to i64
  %17 = add i64 %16, add (i64 sub (i64 0, i64 ptrtoint ([103 x i8]* addrspacecast ([103 x i8] addrspace(4)* @.str to [103 x i8]*) to i64)), i64 1)
  br label %18

18:                                               ; preds = %14, %0
  %19 = phi i64 [ %17, %14 ], [ 0, %0 ]
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([103 x i8], [103 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %20, label %24

20:                                               ; preds = %18
  %21 = and i64 %8, -225
  %22 = or i64 %21, 32
  %23 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %22, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %465

24:                                               ; preds = %18
  %25 = and i64 %8, 2
  %26 = and i64 %8, -3
  %27 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %26, i64 0
  br label %28

28:                                               ; preds = %454, %24
  %29 = phi i64 [ %19, %24 ], [ %462, %454 ]
  %30 = phi i8 addrspace(4)* [ getelementptr inbounds ([103 x i8], [103 x i8] addrspace(4)* @.str, i64 0, i64 0), %24 ], [ %463, %454 ]
  %31 = phi <2 x i64> [ %27, %24 ], [ %461, %454 ]
  %32 = icmp ugt i64 %29, 56
  %33 = extractelement <2 x i64> %31, i64 0
  %34 = or i64 %33, %25
  %35 = insertelement <2 x i64> poison, i64 %34, i64 0
  %36 = select i1 %32, <2 x i64> %31, <2 x i64> %35
  %37 = tail call i64 @llvm.umin.i64(i64 %29, i64 56)
  %38 = trunc i64 %37 to i32
  %39 = extractelement <2 x i64> %36, i64 0
  %40 = icmp ugt i32 %38, 7
  br i1 %40, label %43, label %41

41:                                               ; preds = %28
  %42 = icmp eq i32 %38, 0
  br i1 %42, label %96, label %83

43:                                               ; preds = %28
  %44 = load i8, i8 addrspace(4)* %30, align 1, !tbaa !8
  %45 = zext i8 %44 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 1
  %47 = load i8, i8 addrspace(4)* %46, align 1, !tbaa !8
  %48 = zext i8 %47 to i64
  %49 = shl nuw nsw i64 %48, 8
  %50 = or i64 %49, %45
  %51 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 2
  %52 = load i8, i8 addrspace(4)* %51, align 1, !tbaa !8
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 16
  %55 = or i64 %50, %54
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 3
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !8
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 24
  %60 = or i64 %55, %59
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 4
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !8
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 32
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 5
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !8
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 40
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 6
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !8
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 48
  %75 = or i64 %70, %74
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 7
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !8
  %78 = zext i8 %77 to i64
  %79 = shl nuw i64 %78, 56
  %80 = or i64 %75, %79
  %81 = add nsw i32 %38, -8
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 8
  br label %96

83:                                               ; preds = %41, %83
  %84 = phi i32 [ %94, %83 ], [ 0, %41 ]
  %85 = phi i64 [ %93, %83 ], [ 0, %41 ]
  %86 = zext i32 %84 to i64
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 %86
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !8
  %89 = zext i8 %88 to i64
  %90 = shl i32 %84, 3
  %91 = zext i32 %90 to i64
  %92 = shl nuw i64 %89, %91
  %93 = or i64 %92, %85
  %94 = add nuw nsw i32 %84, 1
  %95 = icmp eq i32 %94, %38
  br i1 %95, label %96, label %83, !llvm.loop !9

96:                                               ; preds = %83, %43, %41
  %97 = phi i8 addrspace(4)* [ %82, %43 ], [ %30, %41 ], [ %30, %83 ]
  %98 = phi i32 [ %81, %43 ], [ 0, %41 ], [ 0, %83 ]
  %99 = phi i64 [ %80, %43 ], [ 0, %41 ], [ %93, %83 ]
  %100 = icmp ugt i32 %98, 7
  br i1 %100, label %103, label %101

101:                                              ; preds = %96
  %102 = icmp eq i32 %98, 0
  br i1 %102, label %156, label %143

103:                                              ; preds = %96
  %104 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !8
  %105 = zext i8 %104 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 1
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !8
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 8
  %110 = or i64 %109, %105
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 2
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !8
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 16
  %115 = or i64 %110, %114
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 3
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !8
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 24
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 4
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !8
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 32
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 5
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !8
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 40
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 6
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !8
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 48
  %135 = or i64 %130, %134
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 7
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !8
  %138 = zext i8 %137 to i64
  %139 = shl nuw i64 %138, 56
  %140 = or i64 %135, %139
  %141 = add nsw i32 %98, -8
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 8
  br label %156

143:                                              ; preds = %101, %143
  %144 = phi i32 [ %154, %143 ], [ 0, %101 ]
  %145 = phi i64 [ %153, %143 ], [ 0, %101 ]
  %146 = zext i32 %144 to i64
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %97, i64 %146
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !8
  %149 = zext i8 %148 to i64
  %150 = shl i32 %144, 3
  %151 = zext i32 %150 to i64
  %152 = shl nuw i64 %149, %151
  %153 = or i64 %152, %145
  %154 = add nuw nsw i32 %144, 1
  %155 = icmp eq i32 %154, %98
  br i1 %155, label %156, label %143

156:                                              ; preds = %143, %103, %101
  %157 = phi i8 addrspace(4)* [ %142, %103 ], [ %97, %101 ], [ %97, %143 ]
  %158 = phi i32 [ %141, %103 ], [ 0, %101 ], [ 0, %143 ]
  %159 = phi i64 [ %140, %103 ], [ 0, %101 ], [ %153, %143 ]
  %160 = icmp ugt i32 %158, 7
  br i1 %160, label %163, label %161

161:                                              ; preds = %156
  %162 = icmp eq i32 %158, 0
  br i1 %162, label %216, label %203

163:                                              ; preds = %156
  %164 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !8
  %165 = zext i8 %164 to i64
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 1
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !8
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 8
  %170 = or i64 %169, %165
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 2
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !8
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 16
  %175 = or i64 %170, %174
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 3
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !8
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 24
  %180 = or i64 %175, %179
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 4
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !8
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 32
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 5
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !8
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 40
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 6
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !8
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 48
  %195 = or i64 %190, %194
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 7
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !8
  %198 = zext i8 %197 to i64
  %199 = shl nuw i64 %198, 56
  %200 = or i64 %195, %199
  %201 = add nsw i32 %158, -8
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 8
  br label %216

203:                                              ; preds = %161, %203
  %204 = phi i32 [ %214, %203 ], [ 0, %161 ]
  %205 = phi i64 [ %213, %203 ], [ 0, %161 ]
  %206 = zext i32 %204 to i64
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %157, i64 %206
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !8
  %209 = zext i8 %208 to i64
  %210 = shl i32 %204, 3
  %211 = zext i32 %210 to i64
  %212 = shl nuw i64 %209, %211
  %213 = or i64 %212, %205
  %214 = add nuw nsw i32 %204, 1
  %215 = icmp eq i32 %214, %158
  br i1 %215, label %216, label %203

216:                                              ; preds = %203, %163, %161
  %217 = phi i8 addrspace(4)* [ %202, %163 ], [ %157, %161 ], [ %157, %203 ]
  %218 = phi i32 [ %201, %163 ], [ 0, %161 ], [ 0, %203 ]
  %219 = phi i64 [ %200, %163 ], [ 0, %161 ], [ %213, %203 ]
  %220 = icmp ugt i32 %218, 7
  br i1 %220, label %223, label %221

221:                                              ; preds = %216
  %222 = icmp eq i32 %218, 0
  br i1 %222, label %276, label %263

223:                                              ; preds = %216
  %224 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !8
  %225 = zext i8 %224 to i64
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 1
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !8
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 8
  %230 = or i64 %229, %225
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 2
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !8
  %233 = zext i8 %232 to i64
  %234 = shl nuw nsw i64 %233, 16
  %235 = or i64 %230, %234
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 3
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !8
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 24
  %240 = or i64 %235, %239
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 4
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !8
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 32
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 5
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !8
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 40
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 6
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !8
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 48
  %255 = or i64 %250, %254
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 7
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !8
  %258 = zext i8 %257 to i64
  %259 = shl nuw i64 %258, 56
  %260 = or i64 %255, %259
  %261 = add nsw i32 %218, -8
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 8
  br label %276

263:                                              ; preds = %221, %263
  %264 = phi i32 [ %274, %263 ], [ 0, %221 ]
  %265 = phi i64 [ %273, %263 ], [ 0, %221 ]
  %266 = zext i32 %264 to i64
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %217, i64 %266
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !8
  %269 = zext i8 %268 to i64
  %270 = shl i32 %264, 3
  %271 = zext i32 %270 to i64
  %272 = shl nuw i64 %269, %271
  %273 = or i64 %272, %265
  %274 = add nuw nsw i32 %264, 1
  %275 = icmp eq i32 %274, %218
  br i1 %275, label %276, label %263

276:                                              ; preds = %263, %223, %221
  %277 = phi i8 addrspace(4)* [ %262, %223 ], [ %217, %221 ], [ %217, %263 ]
  %278 = phi i32 [ %261, %223 ], [ 0, %221 ], [ 0, %263 ]
  %279 = phi i64 [ %260, %223 ], [ 0, %221 ], [ %273, %263 ]
  %280 = icmp ugt i32 %278, 7
  br i1 %280, label %283, label %281

281:                                              ; preds = %276
  %282 = icmp eq i32 %278, 0
  br i1 %282, label %336, label %323

283:                                              ; preds = %276
  %284 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !8
  %285 = zext i8 %284 to i64
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 1
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !8
  %288 = zext i8 %287 to i64
  %289 = shl nuw nsw i64 %288, 8
  %290 = or i64 %289, %285
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 2
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !8
  %293 = zext i8 %292 to i64
  %294 = shl nuw nsw i64 %293, 16
  %295 = or i64 %290, %294
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 3
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !8
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 24
  %300 = or i64 %295, %299
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 4
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !8
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 32
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 5
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !8
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 40
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 6
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !8
  %313 = zext i8 %312 to i64
  %314 = shl nuw nsw i64 %313, 48
  %315 = or i64 %310, %314
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 7
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !8
  %318 = zext i8 %317 to i64
  %319 = shl nuw i64 %318, 56
  %320 = or i64 %315, %319
  %321 = add nsw i32 %278, -8
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 8
  br label %336

323:                                              ; preds = %281, %323
  %324 = phi i32 [ %334, %323 ], [ 0, %281 ]
  %325 = phi i64 [ %333, %323 ], [ 0, %281 ]
  %326 = zext i32 %324 to i64
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %277, i64 %326
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !8
  %329 = zext i8 %328 to i64
  %330 = shl i32 %324, 3
  %331 = zext i32 %330 to i64
  %332 = shl nuw i64 %329, %331
  %333 = or i64 %332, %325
  %334 = add nuw nsw i32 %324, 1
  %335 = icmp eq i32 %334, %278
  br i1 %335, label %336, label %323

336:                                              ; preds = %323, %283, %281
  %337 = phi i8 addrspace(4)* [ %322, %283 ], [ %277, %281 ], [ %277, %323 ]
  %338 = phi i32 [ %321, %283 ], [ 0, %281 ], [ 0, %323 ]
  %339 = phi i64 [ %320, %283 ], [ 0, %281 ], [ %333, %323 ]
  %340 = icmp ugt i32 %338, 7
  br i1 %340, label %343, label %341

341:                                              ; preds = %336
  %342 = icmp eq i32 %338, 0
  br i1 %342, label %396, label %383

343:                                              ; preds = %336
  %344 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !8
  %345 = zext i8 %344 to i64
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 1
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !8
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 8
  %350 = or i64 %349, %345
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 2
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !8
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 16
  %355 = or i64 %350, %354
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 3
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !8
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 24
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 4
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !8
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 32
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 5
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !8
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 40
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 6
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !8
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 48
  %375 = or i64 %370, %374
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 7
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !8
  %378 = zext i8 %377 to i64
  %379 = shl nuw i64 %378, 56
  %380 = or i64 %375, %379
  %381 = add nsw i32 %338, -8
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 8
  br label %396

383:                                              ; preds = %341, %383
  %384 = phi i32 [ %394, %383 ], [ 0, %341 ]
  %385 = phi i64 [ %393, %383 ], [ 0, %341 ]
  %386 = zext i32 %384 to i64
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %337, i64 %386
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !8
  %389 = zext i8 %388 to i64
  %390 = shl i32 %384, 3
  %391 = zext i32 %390 to i64
  %392 = shl nuw i64 %389, %391
  %393 = or i64 %392, %385
  %394 = add nuw nsw i32 %384, 1
  %395 = icmp eq i32 %394, %338
  br i1 %395, label %396, label %383

396:                                              ; preds = %383, %343, %341
  %397 = phi i8 addrspace(4)* [ %382, %343 ], [ %337, %341 ], [ %337, %383 ]
  %398 = phi i32 [ %381, %343 ], [ 0, %341 ], [ 0, %383 ]
  %399 = phi i64 [ %380, %343 ], [ 0, %341 ], [ %393, %383 ]
  %400 = icmp ugt i32 %398, 7
  br i1 %400, label %403, label %401

401:                                              ; preds = %396
  %402 = icmp eq i32 %398, 0
  br i1 %402, label %454, label %441

403:                                              ; preds = %396
  %404 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !8
  %405 = zext i8 %404 to i64
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %397, i64 1
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !8
  %408 = zext i8 %407 to i64
  %409 = shl nuw nsw i64 %408, 8
  %410 = or i64 %409, %405
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %397, i64 2
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !8
  %413 = zext i8 %412 to i64
  %414 = shl nuw nsw i64 %413, 16
  %415 = or i64 %410, %414
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %397, i64 3
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !8
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 24
  %420 = or i64 %415, %419
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %397, i64 4
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !8
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 32
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %397, i64 5
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !8
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 40
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %397, i64 6
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !8
  %433 = zext i8 %432 to i64
  %434 = shl nuw nsw i64 %433, 48
  %435 = or i64 %430, %434
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %397, i64 7
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !8
  %438 = zext i8 %437 to i64
  %439 = shl nuw i64 %438, 56
  %440 = or i64 %435, %439
  br label %454

441:                                              ; preds = %401, %441
  %442 = phi i32 [ %452, %441 ], [ 0, %401 ]
  %443 = phi i64 [ %451, %441 ], [ 0, %401 ]
  %444 = zext i32 %442 to i64
  %445 = getelementptr inbounds i8, i8 addrspace(4)* %397, i64 %444
  %446 = load i8, i8 addrspace(4)* %445, align 1, !tbaa !8
  %447 = zext i8 %446 to i64
  %448 = shl i32 %442, 3
  %449 = zext i32 %448 to i64
  %450 = shl nuw i64 %447, %449
  %451 = or i64 %450, %443
  %452 = add nuw nsw i32 %442, 1
  %453 = icmp eq i32 %452, %398
  br i1 %453, label %454, label %441

454:                                              ; preds = %441, %403, %401
  %455 = phi i64 [ %440, %403 ], [ 0, %401 ], [ %451, %441 ]
  %456 = shl nuw nsw i64 %37, 2
  %457 = add nuw nsw i64 %456, 28
  %458 = and i64 %457, 480
  %459 = and i64 %39, -225
  %460 = or i64 %459, %458
  %461 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %460, i64 noundef %99, i64 noundef %159, i64 noundef %219, i64 noundef %279, i64 noundef %339, i64 noundef %399, i64 noundef %455) #10
  %462 = sub i64 %29, %37
  %463 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 %37
  %464 = icmp eq i64 %462, 0
  br i1 %464, label %465, label %28

465:                                              ; preds = %454, %20
  %466 = phi <2 x i64> [ %23, %20 ], [ %461, %454 ]
  %467 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !11
  %468 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !11
  %469 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !11
  %470 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %471 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %472 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %473 = extractelement <2 x i64> %466, i64 0
  %474 = zext i32 %472 to i64
  %475 = and i64 %473, -225
  %476 = or i64 %475, 32
  %477 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %476, i64 noundef %474, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %478 = extractelement <2 x i64> %477, i64 0
  %479 = zext i32 %471 to i64
  %480 = and i64 %478, -225
  %481 = or i64 %480, 32
  %482 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %481, i64 noundef %479, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %483 = extractelement <2 x i64> %482, i64 0
  %484 = zext i32 %470 to i64
  %485 = and i64 %483, -225
  %486 = or i64 %485, 32
  %487 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %486, i64 noundef %484, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %488 = extractelement <2 x i64> %487, i64 0
  %489 = zext i32 %469 to i64
  %490 = and i64 %488, -225
  %491 = or i64 %490, 32
  %492 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %491, i64 noundef %489, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %493 = extractelement <2 x i64> %492, i64 0
  %494 = zext i32 %468 to i64
  %495 = and i64 %493, -225
  %496 = or i64 %495, 32
  %497 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %496, i64 noundef %494, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %498 = extractelement <2 x i64> %497, i64 0
  %499 = zext i32 %467 to i64
  %500 = and i64 %498, -227
  %501 = or i64 %500, 34
  %502 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %501, i64 noundef %499, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !12
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !14
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !14
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !16
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !14
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !14
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !12
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !17
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !20
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !17
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !20
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !17
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !20
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !12
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !21
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !20
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !12
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !12
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !12
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !14
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
  %110 = call i64 @llvm.read_register.i64(metadata !22) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !23
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !25
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !26
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !17
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !20
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !27
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !27
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !28
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !30
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !12
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !12
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !20
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !17
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !27
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !27
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
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{i32 0, i32 1024}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !6, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !6, i64 0}
!16 = !{i64 2662}
!17 = !{!18, !13, i64 0}
!18 = !{!"", !13, i64 0, !13, i64 8, !19, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!19 = !{!"hsa_signal_s", !5, i64 0}
!20 = !{!18, !5, i64 40}
!21 = !{!18, !13, i64 8}
!22 = !{!"exec"}
!23 = !{!24, !15, i64 16}
!24 = !{!"", !5, i64 0, !5, i64 8, !15, i64 16, !15, i64 20}
!25 = !{!24, !5, i64 8}
!26 = !{!24, !15, i64 20}
!27 = !{!24, !5, i64 0}
!28 = !{!29, !5, i64 16}
!29 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !15, i64 24, !15, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!30 = !{!29, !15, i64 24}
