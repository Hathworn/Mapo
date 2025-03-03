; ModuleID = '../data/hip_kernels/3620/133/main.cu'
source_filename = "../data/hip_kernels/3620/133/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [10 x i8] c"long: %d \00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [5 x i8] c"%ld \00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z12kernel_printPKli(i64 addrspace(1)* nocapture readonly %0, i32 %1) local_unnamed_addr #1 {
  %3 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %4 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 24
  %5 = bitcast i8 addrspace(4)* %4 to i64 addrspace(4)*
  %6 = load i64, i64 addrspace(4)* %5, align 8, !tbaa !4
  %7 = inttoptr i64 %6 to i8 addrspace(1)*
  %8 = addrspacecast i8 addrspace(1)* %7 to i8*
  %9 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %10 = extractelement <2 x i64> %9, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %11, label %15

11:                                               ; preds = %2
  %12 = and i64 %10, -225
  %13 = or i64 %12, 32
  %14 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %13, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %456

15:                                               ; preds = %2
  %16 = and i64 %10, 2
  %17 = and i64 %10, -3
  %18 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %17, i64 0
  br label %19

19:                                               ; preds = %445, %15
  %20 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 9) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([10 x i8]* addrspacecast ([10 x i8] addrspace(4)* @.str to [10 x i8]*) to i64)), i64 1))), %15 ], [ %453, %445 ]
  %21 = phi i8 addrspace(4)* [ getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0), %15 ], [ %454, %445 ]
  %22 = phi <2 x i64> [ %18, %15 ], [ %452, %445 ]
  %23 = icmp ugt i64 %20, 56
  %24 = extractelement <2 x i64> %22, i64 0
  %25 = or i64 %24, %16
  %26 = insertelement <2 x i64> poison, i64 %25, i64 0
  %27 = select i1 %23, <2 x i64> %22, <2 x i64> %26
  %28 = tail call i64 @llvm.umin.i64(i64 %20, i64 56)
  %29 = trunc i64 %28 to i32
  %30 = extractelement <2 x i64> %27, i64 0
  %31 = icmp ugt i32 %29, 7
  br i1 %31, label %34, label %32

32:                                               ; preds = %19
  %33 = icmp eq i32 %29, 0
  br i1 %33, label %87, label %74

34:                                               ; preds = %19
  %35 = load i8, i8 addrspace(4)* %21, align 1, !tbaa !8
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 1
  %38 = load i8, i8 addrspace(4)* %37, align 1, !tbaa !8
  %39 = zext i8 %38 to i64
  %40 = shl nuw nsw i64 %39, 8
  %41 = or i64 %40, %36
  %42 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 2
  %43 = load i8, i8 addrspace(4)* %42, align 1, !tbaa !8
  %44 = zext i8 %43 to i64
  %45 = shl nuw nsw i64 %44, 16
  %46 = or i64 %41, %45
  %47 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 3
  %48 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !8
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 24
  %51 = or i64 %46, %50
  %52 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 4
  %53 = load i8, i8 addrspace(4)* %52, align 1, !tbaa !8
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 32
  %56 = or i64 %51, %55
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 5
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !8
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 40
  %61 = or i64 %56, %60
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 6
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !8
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 48
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 7
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !8
  %69 = zext i8 %68 to i64
  %70 = shl nuw i64 %69, 56
  %71 = or i64 %66, %70
  %72 = add nsw i32 %29, -8
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 8
  br label %87

74:                                               ; preds = %32, %74
  %75 = phi i32 [ %85, %74 ], [ 0, %32 ]
  %76 = phi i64 [ %84, %74 ], [ 0, %32 ]
  %77 = zext i32 %75 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 %77
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !8
  %80 = zext i8 %79 to i64
  %81 = shl i32 %75, 3
  %82 = zext i32 %81 to i64
  %83 = shl nuw i64 %80, %82
  %84 = or i64 %83, %76
  %85 = add nuw nsw i32 %75, 1
  %86 = icmp eq i32 %85, %29
  br i1 %86, label %87, label %74, !llvm.loop !9

87:                                               ; preds = %74, %34, %32
  %88 = phi i8 addrspace(4)* [ %73, %34 ], [ %21, %32 ], [ %21, %74 ]
  %89 = phi i32 [ %72, %34 ], [ 0, %32 ], [ 0, %74 ]
  %90 = phi i64 [ %71, %34 ], [ 0, %32 ], [ %84, %74 ]
  %91 = icmp ugt i32 %89, 7
  br i1 %91, label %94, label %92

92:                                               ; preds = %87
  %93 = icmp eq i32 %89, 0
  br i1 %93, label %147, label %134

94:                                               ; preds = %87
  %95 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !8
  %96 = zext i8 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 1
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !8
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 8
  %101 = or i64 %100, %96
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 2
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !8
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 16
  %106 = or i64 %101, %105
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 3
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !8
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 24
  %111 = or i64 %106, %110
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 4
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !8
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 32
  %116 = or i64 %111, %115
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 5
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !8
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 40
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 6
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !8
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 48
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 7
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !8
  %129 = zext i8 %128 to i64
  %130 = shl nuw i64 %129, 56
  %131 = or i64 %126, %130
  %132 = add nsw i32 %89, -8
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 8
  br label %147

134:                                              ; preds = %92, %134
  %135 = phi i32 [ %145, %134 ], [ 0, %92 ]
  %136 = phi i64 [ %144, %134 ], [ 0, %92 ]
  %137 = zext i32 %135 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 %137
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !8
  %140 = zext i8 %139 to i64
  %141 = shl i32 %135, 3
  %142 = zext i32 %141 to i64
  %143 = shl nuw i64 %140, %142
  %144 = or i64 %143, %136
  %145 = add nuw nsw i32 %135, 1
  %146 = icmp eq i32 %145, %89
  br i1 %146, label %147, label %134

147:                                              ; preds = %134, %94, %92
  %148 = phi i8 addrspace(4)* [ %133, %94 ], [ %88, %92 ], [ %88, %134 ]
  %149 = phi i32 [ %132, %94 ], [ 0, %92 ], [ 0, %134 ]
  %150 = phi i64 [ %131, %94 ], [ 0, %92 ], [ %144, %134 ]
  %151 = icmp ugt i32 %149, 7
  br i1 %151, label %154, label %152

152:                                              ; preds = %147
  %153 = icmp eq i32 %149, 0
  br i1 %153, label %207, label %194

154:                                              ; preds = %147
  %155 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !8
  %156 = zext i8 %155 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 1
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !8
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 8
  %161 = or i64 %160, %156
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 2
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !8
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 16
  %166 = or i64 %161, %165
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 3
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !8
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 24
  %171 = or i64 %166, %170
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 4
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !8
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 32
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 5
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !8
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 40
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 6
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !8
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 48
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 7
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !8
  %189 = zext i8 %188 to i64
  %190 = shl nuw i64 %189, 56
  %191 = or i64 %186, %190
  %192 = add nsw i32 %149, -8
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 8
  br label %207

194:                                              ; preds = %152, %194
  %195 = phi i32 [ %205, %194 ], [ 0, %152 ]
  %196 = phi i64 [ %204, %194 ], [ 0, %152 ]
  %197 = zext i32 %195 to i64
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 %197
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !8
  %200 = zext i8 %199 to i64
  %201 = shl i32 %195, 3
  %202 = zext i32 %201 to i64
  %203 = shl nuw i64 %200, %202
  %204 = or i64 %203, %196
  %205 = add nuw nsw i32 %195, 1
  %206 = icmp eq i32 %205, %149
  br i1 %206, label %207, label %194

207:                                              ; preds = %194, %154, %152
  %208 = phi i8 addrspace(4)* [ %193, %154 ], [ %148, %152 ], [ %148, %194 ]
  %209 = phi i32 [ %192, %154 ], [ 0, %152 ], [ 0, %194 ]
  %210 = phi i64 [ %191, %154 ], [ 0, %152 ], [ %204, %194 ]
  %211 = icmp ugt i32 %209, 7
  br i1 %211, label %214, label %212

212:                                              ; preds = %207
  %213 = icmp eq i32 %209, 0
  br i1 %213, label %267, label %254

214:                                              ; preds = %207
  %215 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !8
  %216 = zext i8 %215 to i64
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 1
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !8
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 8
  %221 = or i64 %220, %216
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 2
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !8
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 16
  %226 = or i64 %221, %225
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 3
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !8
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 24
  %231 = or i64 %226, %230
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 4
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !8
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 32
  %236 = or i64 %231, %235
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 5
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !8
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 40
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 6
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !8
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 48
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 7
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !8
  %249 = zext i8 %248 to i64
  %250 = shl nuw i64 %249, 56
  %251 = or i64 %246, %250
  %252 = add nsw i32 %209, -8
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 8
  br label %267

254:                                              ; preds = %212, %254
  %255 = phi i32 [ %265, %254 ], [ 0, %212 ]
  %256 = phi i64 [ %264, %254 ], [ 0, %212 ]
  %257 = zext i32 %255 to i64
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 %257
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !8
  %260 = zext i8 %259 to i64
  %261 = shl i32 %255, 3
  %262 = zext i32 %261 to i64
  %263 = shl nuw i64 %260, %262
  %264 = or i64 %263, %256
  %265 = add nuw nsw i32 %255, 1
  %266 = icmp eq i32 %265, %209
  br i1 %266, label %267, label %254

267:                                              ; preds = %254, %214, %212
  %268 = phi i8 addrspace(4)* [ %253, %214 ], [ %208, %212 ], [ %208, %254 ]
  %269 = phi i32 [ %252, %214 ], [ 0, %212 ], [ 0, %254 ]
  %270 = phi i64 [ %251, %214 ], [ 0, %212 ], [ %264, %254 ]
  %271 = icmp ugt i32 %269, 7
  br i1 %271, label %274, label %272

272:                                              ; preds = %267
  %273 = icmp eq i32 %269, 0
  br i1 %273, label %327, label %314

274:                                              ; preds = %267
  %275 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !8
  %276 = zext i8 %275 to i64
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 1
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !8
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 8
  %281 = or i64 %280, %276
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 2
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !8
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 16
  %286 = or i64 %281, %285
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 3
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !8
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 24
  %291 = or i64 %286, %290
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 4
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !8
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 32
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 5
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !8
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 40
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 6
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !8
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 48
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 7
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !8
  %309 = zext i8 %308 to i64
  %310 = shl nuw i64 %309, 56
  %311 = or i64 %306, %310
  %312 = add nsw i32 %269, -8
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 8
  br label %327

314:                                              ; preds = %272, %314
  %315 = phi i32 [ %325, %314 ], [ 0, %272 ]
  %316 = phi i64 [ %324, %314 ], [ 0, %272 ]
  %317 = zext i32 %315 to i64
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 %317
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !8
  %320 = zext i8 %319 to i64
  %321 = shl i32 %315, 3
  %322 = zext i32 %321 to i64
  %323 = shl nuw i64 %320, %322
  %324 = or i64 %323, %316
  %325 = add nuw nsw i32 %315, 1
  %326 = icmp eq i32 %325, %269
  br i1 %326, label %327, label %314

327:                                              ; preds = %314, %274, %272
  %328 = phi i8 addrspace(4)* [ %313, %274 ], [ %268, %272 ], [ %268, %314 ]
  %329 = phi i32 [ %312, %274 ], [ 0, %272 ], [ 0, %314 ]
  %330 = phi i64 [ %311, %274 ], [ 0, %272 ], [ %324, %314 ]
  %331 = icmp ugt i32 %329, 7
  br i1 %331, label %334, label %332

332:                                              ; preds = %327
  %333 = icmp eq i32 %329, 0
  br i1 %333, label %387, label %374

334:                                              ; preds = %327
  %335 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !8
  %336 = zext i8 %335 to i64
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 1
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !8
  %339 = zext i8 %338 to i64
  %340 = shl nuw nsw i64 %339, 8
  %341 = or i64 %340, %336
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 2
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !8
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 16
  %346 = or i64 %341, %345
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 3
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !8
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 24
  %351 = or i64 %346, %350
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 4
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !8
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 32
  %356 = or i64 %351, %355
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 5
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !8
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 40
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 6
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !8
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 48
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 7
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !8
  %369 = zext i8 %368 to i64
  %370 = shl nuw i64 %369, 56
  %371 = or i64 %366, %370
  %372 = add nsw i32 %329, -8
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 8
  br label %387

374:                                              ; preds = %332, %374
  %375 = phi i32 [ %385, %374 ], [ 0, %332 ]
  %376 = phi i64 [ %384, %374 ], [ 0, %332 ]
  %377 = zext i32 %375 to i64
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 %377
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !8
  %380 = zext i8 %379 to i64
  %381 = shl i32 %375, 3
  %382 = zext i32 %381 to i64
  %383 = shl nuw i64 %380, %382
  %384 = or i64 %383, %376
  %385 = add nuw nsw i32 %375, 1
  %386 = icmp eq i32 %385, %329
  br i1 %386, label %387, label %374

387:                                              ; preds = %374, %334, %332
  %388 = phi i8 addrspace(4)* [ %373, %334 ], [ %328, %332 ], [ %328, %374 ]
  %389 = phi i32 [ %372, %334 ], [ 0, %332 ], [ 0, %374 ]
  %390 = phi i64 [ %371, %334 ], [ 0, %332 ], [ %384, %374 ]
  %391 = icmp ugt i32 %389, 7
  br i1 %391, label %394, label %392

392:                                              ; preds = %387
  %393 = icmp eq i32 %389, 0
  br i1 %393, label %445, label %432

394:                                              ; preds = %387
  %395 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !8
  %396 = zext i8 %395 to i64
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 1
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !8
  %399 = zext i8 %398 to i64
  %400 = shl nuw nsw i64 %399, 8
  %401 = or i64 %400, %396
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 2
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !8
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 16
  %406 = or i64 %401, %405
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 3
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !8
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 24
  %411 = or i64 %406, %410
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 4
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !8
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 32
  %416 = or i64 %411, %415
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 5
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !8
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 40
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 6
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !8
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 48
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 7
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !8
  %429 = zext i8 %428 to i64
  %430 = shl nuw i64 %429, 56
  %431 = or i64 %426, %430
  br label %445

432:                                              ; preds = %392, %432
  %433 = phi i32 [ %443, %432 ], [ 0, %392 ]
  %434 = phi i64 [ %442, %432 ], [ 0, %392 ]
  %435 = zext i32 %433 to i64
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 %435
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !8
  %438 = zext i8 %437 to i64
  %439 = shl i32 %433, 3
  %440 = zext i32 %439 to i64
  %441 = shl nuw i64 %438, %440
  %442 = or i64 %441, %434
  %443 = add nuw nsw i32 %433, 1
  %444 = icmp eq i32 %443, %389
  br i1 %444, label %445, label %432

445:                                              ; preds = %432, %394, %392
  %446 = phi i64 [ %431, %394 ], [ 0, %392 ], [ %442, %432 ]
  %447 = shl nuw nsw i64 %28, 2
  %448 = add nuw nsw i64 %447, 28
  %449 = and i64 %448, 480
  %450 = and i64 %30, -225
  %451 = or i64 %450, %449
  %452 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %451, i64 noundef %90, i64 noundef %150, i64 noundef %210, i64 noundef %270, i64 noundef %330, i64 noundef %390, i64 noundef %446) #10
  %453 = sub i64 %20, %28
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 %28
  %455 = icmp eq i64 %453, 0
  br i1 %455, label %456, label %19

456:                                              ; preds = %445, %11
  %457 = phi <2 x i64> [ %14, %11 ], [ %452, %445 ]
  %458 = extractelement <2 x i64> %457, i64 0
  %459 = zext i32 %1 to i64
  %460 = and i64 %458, -227
  %461 = or i64 %460, 34
  %462 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %461, i64 noundef %459, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %463 = icmp sgt i32 %1, 0
  br i1 %463, label %465, label %464

464:                                              ; preds = %917, %456
  ret void

465:                                              ; preds = %456, %917
  %466 = phi i32 [ %923, %917 ], [ 0, %456 ]
  %467 = zext i32 %466 to i64
  %468 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %467
  %469 = load i64, i64 addrspace(1)* %468, align 8, !tbaa !11
  %470 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %471 = extractelement <2 x i64> %470, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([5 x i8], [5 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %472, label %476

472:                                              ; preds = %465
  %473 = and i64 %471, -225
  %474 = or i64 %473, 32
  %475 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %474, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %917

476:                                              ; preds = %465
  %477 = and i64 %471, 2
  %478 = and i64 %471, -3
  %479 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %478, i64 0
  br label %480

480:                                              ; preds = %906, %476
  %481 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([5 x i8], [5 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([5 x i8], [5 x i8] addrspace(4)* @.str.1, i64 0, i64 4) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([5 x i8]* addrspacecast ([5 x i8] addrspace(4)* @.str.1 to [5 x i8]*) to i64)), i64 1))), %476 ], [ %914, %906 ]
  %482 = phi i8 addrspace(4)* [ getelementptr inbounds ([5 x i8], [5 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %476 ], [ %915, %906 ]
  %483 = phi <2 x i64> [ %479, %476 ], [ %913, %906 ]
  %484 = icmp ugt i64 %481, 56
  %485 = extractelement <2 x i64> %483, i64 0
  %486 = or i64 %485, %477
  %487 = insertelement <2 x i64> poison, i64 %486, i64 0
  %488 = select i1 %484, <2 x i64> %483, <2 x i64> %487
  %489 = tail call i64 @llvm.umin.i64(i64 %481, i64 56)
  %490 = trunc i64 %489 to i32
  %491 = extractelement <2 x i64> %488, i64 0
  %492 = icmp ugt i32 %490, 7
  br i1 %492, label %495, label %493

493:                                              ; preds = %480
  %494 = icmp eq i32 %490, 0
  br i1 %494, label %548, label %535

495:                                              ; preds = %480
  %496 = load i8, i8 addrspace(4)* %482, align 1, !tbaa !8
  %497 = zext i8 %496 to i64
  %498 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 1
  %499 = load i8, i8 addrspace(4)* %498, align 1, !tbaa !8
  %500 = zext i8 %499 to i64
  %501 = shl nuw nsw i64 %500, 8
  %502 = or i64 %501, %497
  %503 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 2
  %504 = load i8, i8 addrspace(4)* %503, align 1, !tbaa !8
  %505 = zext i8 %504 to i64
  %506 = shl nuw nsw i64 %505, 16
  %507 = or i64 %502, %506
  %508 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 3
  %509 = load i8, i8 addrspace(4)* %508, align 1, !tbaa !8
  %510 = zext i8 %509 to i64
  %511 = shl nuw nsw i64 %510, 24
  %512 = or i64 %507, %511
  %513 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 4
  %514 = load i8, i8 addrspace(4)* %513, align 1, !tbaa !8
  %515 = zext i8 %514 to i64
  %516 = shl nuw nsw i64 %515, 32
  %517 = or i64 %512, %516
  %518 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 5
  %519 = load i8, i8 addrspace(4)* %518, align 1, !tbaa !8
  %520 = zext i8 %519 to i64
  %521 = shl nuw nsw i64 %520, 40
  %522 = or i64 %517, %521
  %523 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 6
  %524 = load i8, i8 addrspace(4)* %523, align 1, !tbaa !8
  %525 = zext i8 %524 to i64
  %526 = shl nuw nsw i64 %525, 48
  %527 = or i64 %522, %526
  %528 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 7
  %529 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !8
  %530 = zext i8 %529 to i64
  %531 = shl nuw i64 %530, 56
  %532 = or i64 %527, %531
  %533 = add nsw i32 %490, -8
  %534 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 8
  br label %548

535:                                              ; preds = %493, %535
  %536 = phi i32 [ %546, %535 ], [ 0, %493 ]
  %537 = phi i64 [ %545, %535 ], [ 0, %493 ]
  %538 = zext i32 %536 to i64
  %539 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 %538
  %540 = load i8, i8 addrspace(4)* %539, align 1, !tbaa !8
  %541 = zext i8 %540 to i64
  %542 = shl i32 %536, 3
  %543 = zext i32 %542 to i64
  %544 = shl nuw i64 %541, %543
  %545 = or i64 %544, %537
  %546 = add nuw nsw i32 %536, 1
  %547 = icmp eq i32 %546, %490
  br i1 %547, label %548, label %535, !llvm.loop !9

548:                                              ; preds = %535, %495, %493
  %549 = phi i8 addrspace(4)* [ %534, %495 ], [ %482, %493 ], [ %482, %535 ]
  %550 = phi i32 [ %533, %495 ], [ 0, %493 ], [ 0, %535 ]
  %551 = phi i64 [ %532, %495 ], [ 0, %493 ], [ %545, %535 ]
  %552 = icmp ugt i32 %550, 7
  br i1 %552, label %555, label %553

553:                                              ; preds = %548
  %554 = icmp eq i32 %550, 0
  br i1 %554, label %608, label %595

555:                                              ; preds = %548
  %556 = load i8, i8 addrspace(4)* %549, align 1, !tbaa !8
  %557 = zext i8 %556 to i64
  %558 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 1
  %559 = load i8, i8 addrspace(4)* %558, align 1, !tbaa !8
  %560 = zext i8 %559 to i64
  %561 = shl nuw nsw i64 %560, 8
  %562 = or i64 %561, %557
  %563 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 2
  %564 = load i8, i8 addrspace(4)* %563, align 1, !tbaa !8
  %565 = zext i8 %564 to i64
  %566 = shl nuw nsw i64 %565, 16
  %567 = or i64 %562, %566
  %568 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 3
  %569 = load i8, i8 addrspace(4)* %568, align 1, !tbaa !8
  %570 = zext i8 %569 to i64
  %571 = shl nuw nsw i64 %570, 24
  %572 = or i64 %567, %571
  %573 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 4
  %574 = load i8, i8 addrspace(4)* %573, align 1, !tbaa !8
  %575 = zext i8 %574 to i64
  %576 = shl nuw nsw i64 %575, 32
  %577 = or i64 %572, %576
  %578 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 5
  %579 = load i8, i8 addrspace(4)* %578, align 1, !tbaa !8
  %580 = zext i8 %579 to i64
  %581 = shl nuw nsw i64 %580, 40
  %582 = or i64 %577, %581
  %583 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 6
  %584 = load i8, i8 addrspace(4)* %583, align 1, !tbaa !8
  %585 = zext i8 %584 to i64
  %586 = shl nuw nsw i64 %585, 48
  %587 = or i64 %582, %586
  %588 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 7
  %589 = load i8, i8 addrspace(4)* %588, align 1, !tbaa !8
  %590 = zext i8 %589 to i64
  %591 = shl nuw i64 %590, 56
  %592 = or i64 %587, %591
  %593 = add nsw i32 %550, -8
  %594 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 8
  br label %608

595:                                              ; preds = %553, %595
  %596 = phi i32 [ %606, %595 ], [ 0, %553 ]
  %597 = phi i64 [ %605, %595 ], [ 0, %553 ]
  %598 = zext i32 %596 to i64
  %599 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 %598
  %600 = load i8, i8 addrspace(4)* %599, align 1, !tbaa !8
  %601 = zext i8 %600 to i64
  %602 = shl i32 %596, 3
  %603 = zext i32 %602 to i64
  %604 = shl nuw i64 %601, %603
  %605 = or i64 %604, %597
  %606 = add nuw nsw i32 %596, 1
  %607 = icmp eq i32 %606, %550
  br i1 %607, label %608, label %595

608:                                              ; preds = %595, %555, %553
  %609 = phi i8 addrspace(4)* [ %594, %555 ], [ %549, %553 ], [ %549, %595 ]
  %610 = phi i32 [ %593, %555 ], [ 0, %553 ], [ 0, %595 ]
  %611 = phi i64 [ %592, %555 ], [ 0, %553 ], [ %605, %595 ]
  %612 = icmp ugt i32 %610, 7
  br i1 %612, label %615, label %613

613:                                              ; preds = %608
  %614 = icmp eq i32 %610, 0
  br i1 %614, label %668, label %655

615:                                              ; preds = %608
  %616 = load i8, i8 addrspace(4)* %609, align 1, !tbaa !8
  %617 = zext i8 %616 to i64
  %618 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 1
  %619 = load i8, i8 addrspace(4)* %618, align 1, !tbaa !8
  %620 = zext i8 %619 to i64
  %621 = shl nuw nsw i64 %620, 8
  %622 = or i64 %621, %617
  %623 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 2
  %624 = load i8, i8 addrspace(4)* %623, align 1, !tbaa !8
  %625 = zext i8 %624 to i64
  %626 = shl nuw nsw i64 %625, 16
  %627 = or i64 %622, %626
  %628 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 3
  %629 = load i8, i8 addrspace(4)* %628, align 1, !tbaa !8
  %630 = zext i8 %629 to i64
  %631 = shl nuw nsw i64 %630, 24
  %632 = or i64 %627, %631
  %633 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 4
  %634 = load i8, i8 addrspace(4)* %633, align 1, !tbaa !8
  %635 = zext i8 %634 to i64
  %636 = shl nuw nsw i64 %635, 32
  %637 = or i64 %632, %636
  %638 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 5
  %639 = load i8, i8 addrspace(4)* %638, align 1, !tbaa !8
  %640 = zext i8 %639 to i64
  %641 = shl nuw nsw i64 %640, 40
  %642 = or i64 %637, %641
  %643 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 6
  %644 = load i8, i8 addrspace(4)* %643, align 1, !tbaa !8
  %645 = zext i8 %644 to i64
  %646 = shl nuw nsw i64 %645, 48
  %647 = or i64 %642, %646
  %648 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 7
  %649 = load i8, i8 addrspace(4)* %648, align 1, !tbaa !8
  %650 = zext i8 %649 to i64
  %651 = shl nuw i64 %650, 56
  %652 = or i64 %647, %651
  %653 = add nsw i32 %610, -8
  %654 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 8
  br label %668

655:                                              ; preds = %613, %655
  %656 = phi i32 [ %666, %655 ], [ 0, %613 ]
  %657 = phi i64 [ %665, %655 ], [ 0, %613 ]
  %658 = zext i32 %656 to i64
  %659 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 %658
  %660 = load i8, i8 addrspace(4)* %659, align 1, !tbaa !8
  %661 = zext i8 %660 to i64
  %662 = shl i32 %656, 3
  %663 = zext i32 %662 to i64
  %664 = shl nuw i64 %661, %663
  %665 = or i64 %664, %657
  %666 = add nuw nsw i32 %656, 1
  %667 = icmp eq i32 %666, %610
  br i1 %667, label %668, label %655

668:                                              ; preds = %655, %615, %613
  %669 = phi i8 addrspace(4)* [ %654, %615 ], [ %609, %613 ], [ %609, %655 ]
  %670 = phi i32 [ %653, %615 ], [ 0, %613 ], [ 0, %655 ]
  %671 = phi i64 [ %652, %615 ], [ 0, %613 ], [ %665, %655 ]
  %672 = icmp ugt i32 %670, 7
  br i1 %672, label %675, label %673

673:                                              ; preds = %668
  %674 = icmp eq i32 %670, 0
  br i1 %674, label %728, label %715

675:                                              ; preds = %668
  %676 = load i8, i8 addrspace(4)* %669, align 1, !tbaa !8
  %677 = zext i8 %676 to i64
  %678 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 1
  %679 = load i8, i8 addrspace(4)* %678, align 1, !tbaa !8
  %680 = zext i8 %679 to i64
  %681 = shl nuw nsw i64 %680, 8
  %682 = or i64 %681, %677
  %683 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 2
  %684 = load i8, i8 addrspace(4)* %683, align 1, !tbaa !8
  %685 = zext i8 %684 to i64
  %686 = shl nuw nsw i64 %685, 16
  %687 = or i64 %682, %686
  %688 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 3
  %689 = load i8, i8 addrspace(4)* %688, align 1, !tbaa !8
  %690 = zext i8 %689 to i64
  %691 = shl nuw nsw i64 %690, 24
  %692 = or i64 %687, %691
  %693 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 4
  %694 = load i8, i8 addrspace(4)* %693, align 1, !tbaa !8
  %695 = zext i8 %694 to i64
  %696 = shl nuw nsw i64 %695, 32
  %697 = or i64 %692, %696
  %698 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 5
  %699 = load i8, i8 addrspace(4)* %698, align 1, !tbaa !8
  %700 = zext i8 %699 to i64
  %701 = shl nuw nsw i64 %700, 40
  %702 = or i64 %697, %701
  %703 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 6
  %704 = load i8, i8 addrspace(4)* %703, align 1, !tbaa !8
  %705 = zext i8 %704 to i64
  %706 = shl nuw nsw i64 %705, 48
  %707 = or i64 %702, %706
  %708 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 7
  %709 = load i8, i8 addrspace(4)* %708, align 1, !tbaa !8
  %710 = zext i8 %709 to i64
  %711 = shl nuw i64 %710, 56
  %712 = or i64 %707, %711
  %713 = add nsw i32 %670, -8
  %714 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 8
  br label %728

715:                                              ; preds = %673, %715
  %716 = phi i32 [ %726, %715 ], [ 0, %673 ]
  %717 = phi i64 [ %725, %715 ], [ 0, %673 ]
  %718 = zext i32 %716 to i64
  %719 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 %718
  %720 = load i8, i8 addrspace(4)* %719, align 1, !tbaa !8
  %721 = zext i8 %720 to i64
  %722 = shl i32 %716, 3
  %723 = zext i32 %722 to i64
  %724 = shl nuw i64 %721, %723
  %725 = or i64 %724, %717
  %726 = add nuw nsw i32 %716, 1
  %727 = icmp eq i32 %726, %670
  br i1 %727, label %728, label %715

728:                                              ; preds = %715, %675, %673
  %729 = phi i8 addrspace(4)* [ %714, %675 ], [ %669, %673 ], [ %669, %715 ]
  %730 = phi i32 [ %713, %675 ], [ 0, %673 ], [ 0, %715 ]
  %731 = phi i64 [ %712, %675 ], [ 0, %673 ], [ %725, %715 ]
  %732 = icmp ugt i32 %730, 7
  br i1 %732, label %735, label %733

733:                                              ; preds = %728
  %734 = icmp eq i32 %730, 0
  br i1 %734, label %788, label %775

735:                                              ; preds = %728
  %736 = load i8, i8 addrspace(4)* %729, align 1, !tbaa !8
  %737 = zext i8 %736 to i64
  %738 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 1
  %739 = load i8, i8 addrspace(4)* %738, align 1, !tbaa !8
  %740 = zext i8 %739 to i64
  %741 = shl nuw nsw i64 %740, 8
  %742 = or i64 %741, %737
  %743 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 2
  %744 = load i8, i8 addrspace(4)* %743, align 1, !tbaa !8
  %745 = zext i8 %744 to i64
  %746 = shl nuw nsw i64 %745, 16
  %747 = or i64 %742, %746
  %748 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 3
  %749 = load i8, i8 addrspace(4)* %748, align 1, !tbaa !8
  %750 = zext i8 %749 to i64
  %751 = shl nuw nsw i64 %750, 24
  %752 = or i64 %747, %751
  %753 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 4
  %754 = load i8, i8 addrspace(4)* %753, align 1, !tbaa !8
  %755 = zext i8 %754 to i64
  %756 = shl nuw nsw i64 %755, 32
  %757 = or i64 %752, %756
  %758 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 5
  %759 = load i8, i8 addrspace(4)* %758, align 1, !tbaa !8
  %760 = zext i8 %759 to i64
  %761 = shl nuw nsw i64 %760, 40
  %762 = or i64 %757, %761
  %763 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 6
  %764 = load i8, i8 addrspace(4)* %763, align 1, !tbaa !8
  %765 = zext i8 %764 to i64
  %766 = shl nuw nsw i64 %765, 48
  %767 = or i64 %762, %766
  %768 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 7
  %769 = load i8, i8 addrspace(4)* %768, align 1, !tbaa !8
  %770 = zext i8 %769 to i64
  %771 = shl nuw i64 %770, 56
  %772 = or i64 %767, %771
  %773 = add nsw i32 %730, -8
  %774 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 8
  br label %788

775:                                              ; preds = %733, %775
  %776 = phi i32 [ %786, %775 ], [ 0, %733 ]
  %777 = phi i64 [ %785, %775 ], [ 0, %733 ]
  %778 = zext i32 %776 to i64
  %779 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 %778
  %780 = load i8, i8 addrspace(4)* %779, align 1, !tbaa !8
  %781 = zext i8 %780 to i64
  %782 = shl i32 %776, 3
  %783 = zext i32 %782 to i64
  %784 = shl nuw i64 %781, %783
  %785 = or i64 %784, %777
  %786 = add nuw nsw i32 %776, 1
  %787 = icmp eq i32 %786, %730
  br i1 %787, label %788, label %775

788:                                              ; preds = %775, %735, %733
  %789 = phi i8 addrspace(4)* [ %774, %735 ], [ %729, %733 ], [ %729, %775 ]
  %790 = phi i32 [ %773, %735 ], [ 0, %733 ], [ 0, %775 ]
  %791 = phi i64 [ %772, %735 ], [ 0, %733 ], [ %785, %775 ]
  %792 = icmp ugt i32 %790, 7
  br i1 %792, label %795, label %793

793:                                              ; preds = %788
  %794 = icmp eq i32 %790, 0
  br i1 %794, label %848, label %835

795:                                              ; preds = %788
  %796 = load i8, i8 addrspace(4)* %789, align 1, !tbaa !8
  %797 = zext i8 %796 to i64
  %798 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 1
  %799 = load i8, i8 addrspace(4)* %798, align 1, !tbaa !8
  %800 = zext i8 %799 to i64
  %801 = shl nuw nsw i64 %800, 8
  %802 = or i64 %801, %797
  %803 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 2
  %804 = load i8, i8 addrspace(4)* %803, align 1, !tbaa !8
  %805 = zext i8 %804 to i64
  %806 = shl nuw nsw i64 %805, 16
  %807 = or i64 %802, %806
  %808 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 3
  %809 = load i8, i8 addrspace(4)* %808, align 1, !tbaa !8
  %810 = zext i8 %809 to i64
  %811 = shl nuw nsw i64 %810, 24
  %812 = or i64 %807, %811
  %813 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 4
  %814 = load i8, i8 addrspace(4)* %813, align 1, !tbaa !8
  %815 = zext i8 %814 to i64
  %816 = shl nuw nsw i64 %815, 32
  %817 = or i64 %812, %816
  %818 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 5
  %819 = load i8, i8 addrspace(4)* %818, align 1, !tbaa !8
  %820 = zext i8 %819 to i64
  %821 = shl nuw nsw i64 %820, 40
  %822 = or i64 %817, %821
  %823 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 6
  %824 = load i8, i8 addrspace(4)* %823, align 1, !tbaa !8
  %825 = zext i8 %824 to i64
  %826 = shl nuw nsw i64 %825, 48
  %827 = or i64 %822, %826
  %828 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 7
  %829 = load i8, i8 addrspace(4)* %828, align 1, !tbaa !8
  %830 = zext i8 %829 to i64
  %831 = shl nuw i64 %830, 56
  %832 = or i64 %827, %831
  %833 = add nsw i32 %790, -8
  %834 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 8
  br label %848

835:                                              ; preds = %793, %835
  %836 = phi i32 [ %846, %835 ], [ 0, %793 ]
  %837 = phi i64 [ %845, %835 ], [ 0, %793 ]
  %838 = zext i32 %836 to i64
  %839 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 %838
  %840 = load i8, i8 addrspace(4)* %839, align 1, !tbaa !8
  %841 = zext i8 %840 to i64
  %842 = shl i32 %836, 3
  %843 = zext i32 %842 to i64
  %844 = shl nuw i64 %841, %843
  %845 = or i64 %844, %837
  %846 = add nuw nsw i32 %836, 1
  %847 = icmp eq i32 %846, %790
  br i1 %847, label %848, label %835

848:                                              ; preds = %835, %795, %793
  %849 = phi i8 addrspace(4)* [ %834, %795 ], [ %789, %793 ], [ %789, %835 ]
  %850 = phi i32 [ %833, %795 ], [ 0, %793 ], [ 0, %835 ]
  %851 = phi i64 [ %832, %795 ], [ 0, %793 ], [ %845, %835 ]
  %852 = icmp ugt i32 %850, 7
  br i1 %852, label %855, label %853

853:                                              ; preds = %848
  %854 = icmp eq i32 %850, 0
  br i1 %854, label %906, label %893

855:                                              ; preds = %848
  %856 = load i8, i8 addrspace(4)* %849, align 1, !tbaa !8
  %857 = zext i8 %856 to i64
  %858 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 1
  %859 = load i8, i8 addrspace(4)* %858, align 1, !tbaa !8
  %860 = zext i8 %859 to i64
  %861 = shl nuw nsw i64 %860, 8
  %862 = or i64 %861, %857
  %863 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 2
  %864 = load i8, i8 addrspace(4)* %863, align 1, !tbaa !8
  %865 = zext i8 %864 to i64
  %866 = shl nuw nsw i64 %865, 16
  %867 = or i64 %862, %866
  %868 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 3
  %869 = load i8, i8 addrspace(4)* %868, align 1, !tbaa !8
  %870 = zext i8 %869 to i64
  %871 = shl nuw nsw i64 %870, 24
  %872 = or i64 %867, %871
  %873 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 4
  %874 = load i8, i8 addrspace(4)* %873, align 1, !tbaa !8
  %875 = zext i8 %874 to i64
  %876 = shl nuw nsw i64 %875, 32
  %877 = or i64 %872, %876
  %878 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 5
  %879 = load i8, i8 addrspace(4)* %878, align 1, !tbaa !8
  %880 = zext i8 %879 to i64
  %881 = shl nuw nsw i64 %880, 40
  %882 = or i64 %877, %881
  %883 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 6
  %884 = load i8, i8 addrspace(4)* %883, align 1, !tbaa !8
  %885 = zext i8 %884 to i64
  %886 = shl nuw nsw i64 %885, 48
  %887 = or i64 %882, %886
  %888 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 7
  %889 = load i8, i8 addrspace(4)* %888, align 1, !tbaa !8
  %890 = zext i8 %889 to i64
  %891 = shl nuw i64 %890, 56
  %892 = or i64 %887, %891
  br label %906

893:                                              ; preds = %853, %893
  %894 = phi i32 [ %904, %893 ], [ 0, %853 ]
  %895 = phi i64 [ %903, %893 ], [ 0, %853 ]
  %896 = zext i32 %894 to i64
  %897 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 %896
  %898 = load i8, i8 addrspace(4)* %897, align 1, !tbaa !8
  %899 = zext i8 %898 to i64
  %900 = shl i32 %894, 3
  %901 = zext i32 %900 to i64
  %902 = shl nuw i64 %899, %901
  %903 = or i64 %902, %895
  %904 = add nuw nsw i32 %894, 1
  %905 = icmp eq i32 %904, %850
  br i1 %905, label %906, label %893

906:                                              ; preds = %893, %855, %853
  %907 = phi i64 [ %892, %855 ], [ 0, %853 ], [ %903, %893 ]
  %908 = shl nuw nsw i64 %489, 2
  %909 = add nuw nsw i64 %908, 28
  %910 = and i64 %909, 480
  %911 = and i64 %491, -225
  %912 = or i64 %911, %910
  %913 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %912, i64 noundef %551, i64 noundef %611, i64 noundef %671, i64 noundef %731, i64 noundef %791, i64 noundef %851, i64 noundef %907) #10
  %914 = sub i64 %481, %489
  %915 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 %489
  %916 = icmp eq i64 %914, 0
  br i1 %916, label %917, label %480

917:                                              ; preds = %906, %472
  %918 = phi <2 x i64> [ %475, %472 ], [ %913, %906 ]
  %919 = extractelement <2 x i64> %918, i64 0
  %920 = and i64 %919, -227
  %921 = or i64 %920, 34
  %922 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %921, i64 noundef %469, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %923 = add nuw nsw i32 %466, 1
  %924 = icmp eq i32 %923, %1
  br i1 %924, label %464, label %465, !llvm.loop !15
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !17
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !19
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !19
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !21
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !19
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !19
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !17
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !25
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !25
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !22
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !25
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !26
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !25
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !19
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %110 = call i64 @llvm.read_register.i64(metadata !27) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !28
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !30
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !31
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !22
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !25
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !32
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !32
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !33
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !35
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !25
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !22
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !32
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !32
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
!12 = !{!"long", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !6, i64 0}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !6, i64 0}
!21 = !{i64 2662}
!22 = !{!23, !18, i64 0}
!23 = !{!"", !18, i64 0, !18, i64 8, !24, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!24 = !{!"hsa_signal_s", !5, i64 0}
!25 = !{!23, !5, i64 40}
!26 = !{!23, !18, i64 8}
!27 = !{!"exec"}
!28 = !{!29, !20, i64 16}
!29 = !{!"", !5, i64 0, !5, i64 8, !20, i64 16, !20, i64 20}
!30 = !{!29, !5, i64 8}
!31 = !{!29, !20, i64 20}
!32 = !{!29, !5, i64 0}
!33 = !{!34, !5, i64 16}
!34 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !20, i64 24, !20, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!35 = !{!34, !20, i64 24}
