; ModuleID = '../data/hip_kernels/216/0/main.cu'
source_filename = "../data/hip_kernels/216/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [15 x i8] c"test_kernel()\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z11test_kernelv() local_unnamed_addr #1 {
  %1 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 24
  %3 = bitcast i8 addrspace(4)* %2 to i64 addrspace(4)*
  %4 = load i64, i64 addrspace(4)* %3, align 8, !tbaa !4
  %5 = inttoptr i64 %4 to i8 addrspace(1)*
  %6 = addrspacecast i8 addrspace(1)* %5 to i8*
  %7 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %8 = extractelement <2 x i64> %7, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %9, label %13

9:                                                ; preds = %0
  %10 = and i64 %8, -227
  %11 = or i64 %10, 34
  %12 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %11, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %453

13:                                               ; preds = %0
  %14 = and i64 %8, -3
  %15 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %14, i64 0
  br label %16

16:                                               ; preds = %442, %13
  %17 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str to [15 x i8]*) to i64)), i64 1))), %13 ], [ %450, %442 ]
  %18 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0), %13 ], [ %451, %442 ]
  %19 = phi <2 x i64> [ %15, %13 ], [ %449, %442 ]
  %20 = icmp ugt i64 %17, 56
  %21 = extractelement <2 x i64> %19, i64 0
  %22 = or i64 %21, 2
  %23 = insertelement <2 x i64> poison, i64 %22, i64 0
  %24 = select i1 %20, <2 x i64> %19, <2 x i64> %23
  %25 = tail call i64 @llvm.umin.i64(i64 %17, i64 56)
  %26 = trunc i64 %25 to i32
  %27 = extractelement <2 x i64> %24, i64 0
  %28 = icmp ugt i32 %26, 7
  br i1 %28, label %31, label %29

29:                                               ; preds = %16
  %30 = icmp eq i32 %26, 0
  br i1 %30, label %84, label %71

31:                                               ; preds = %16
  %32 = load i8, i8 addrspace(4)* %18, align 1, !tbaa !8
  %33 = zext i8 %32 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 1
  %35 = load i8, i8 addrspace(4)* %34, align 1, !tbaa !8
  %36 = zext i8 %35 to i64
  %37 = shl nuw nsw i64 %36, 8
  %38 = or i64 %37, %33
  %39 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 2
  %40 = load i8, i8 addrspace(4)* %39, align 1, !tbaa !8
  %41 = zext i8 %40 to i64
  %42 = shl nuw nsw i64 %41, 16
  %43 = or i64 %38, %42
  %44 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 3
  %45 = load i8, i8 addrspace(4)* %44, align 1, !tbaa !8
  %46 = zext i8 %45 to i64
  %47 = shl nuw nsw i64 %46, 24
  %48 = or i64 %43, %47
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 4
  %50 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !8
  %51 = zext i8 %50 to i64
  %52 = shl nuw nsw i64 %51, 32
  %53 = or i64 %48, %52
  %54 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 5
  %55 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !8
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 40
  %58 = or i64 %53, %57
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 6
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !8
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 48
  %63 = or i64 %58, %62
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 7
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !8
  %66 = zext i8 %65 to i64
  %67 = shl nuw i64 %66, 56
  %68 = or i64 %63, %67
  %69 = add nsw i32 %26, -8
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 8
  br label %84

71:                                               ; preds = %29, %71
  %72 = phi i32 [ %82, %71 ], [ 0, %29 ]
  %73 = phi i64 [ %81, %71 ], [ 0, %29 ]
  %74 = zext i32 %72 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 %74
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !8
  %77 = zext i8 %76 to i64
  %78 = shl i32 %72, 3
  %79 = zext i32 %78 to i64
  %80 = shl nuw i64 %77, %79
  %81 = or i64 %80, %73
  %82 = add nuw nsw i32 %72, 1
  %83 = icmp eq i32 %82, %26
  br i1 %83, label %84, label %71, !llvm.loop !9

84:                                               ; preds = %71, %31, %29
  %85 = phi i8 addrspace(4)* [ %70, %31 ], [ %18, %29 ], [ %18, %71 ]
  %86 = phi i32 [ %69, %31 ], [ 0, %29 ], [ 0, %71 ]
  %87 = phi i64 [ %68, %31 ], [ 0, %29 ], [ %81, %71 ]
  %88 = icmp ugt i32 %86, 7
  br i1 %88, label %91, label %89

89:                                               ; preds = %84
  %90 = icmp eq i32 %86, 0
  br i1 %90, label %144, label %131

91:                                               ; preds = %84
  %92 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !8
  %93 = zext i8 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 1
  %95 = load i8, i8 addrspace(4)* %94, align 1, !tbaa !8
  %96 = zext i8 %95 to i64
  %97 = shl nuw nsw i64 %96, 8
  %98 = or i64 %97, %93
  %99 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 2
  %100 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !8
  %101 = zext i8 %100 to i64
  %102 = shl nuw nsw i64 %101, 16
  %103 = or i64 %98, %102
  %104 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 3
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !8
  %106 = zext i8 %105 to i64
  %107 = shl nuw nsw i64 %106, 24
  %108 = or i64 %103, %107
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 4
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !8
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 32
  %113 = or i64 %108, %112
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 5
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !8
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 40
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 6
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !8
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 48
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 7
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !8
  %126 = zext i8 %125 to i64
  %127 = shl nuw i64 %126, 56
  %128 = or i64 %123, %127
  %129 = add nsw i32 %86, -8
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 8
  br label %144

131:                                              ; preds = %89, %131
  %132 = phi i32 [ %142, %131 ], [ 0, %89 ]
  %133 = phi i64 [ %141, %131 ], [ 0, %89 ]
  %134 = zext i32 %132 to i64
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %85, i64 %134
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !8
  %137 = zext i8 %136 to i64
  %138 = shl i32 %132, 3
  %139 = zext i32 %138 to i64
  %140 = shl nuw i64 %137, %139
  %141 = or i64 %140, %133
  %142 = add nuw nsw i32 %132, 1
  %143 = icmp eq i32 %142, %86
  br i1 %143, label %144, label %131

144:                                              ; preds = %131, %91, %89
  %145 = phi i8 addrspace(4)* [ %130, %91 ], [ %85, %89 ], [ %85, %131 ]
  %146 = phi i32 [ %129, %91 ], [ 0, %89 ], [ 0, %131 ]
  %147 = phi i64 [ %128, %91 ], [ 0, %89 ], [ %141, %131 ]
  %148 = icmp ugt i32 %146, 7
  br i1 %148, label %151, label %149

149:                                              ; preds = %144
  %150 = icmp eq i32 %146, 0
  br i1 %150, label %204, label %191

151:                                              ; preds = %144
  %152 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !8
  %153 = zext i8 %152 to i64
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 1
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !8
  %156 = zext i8 %155 to i64
  %157 = shl nuw nsw i64 %156, 8
  %158 = or i64 %157, %153
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 2
  %160 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !8
  %161 = zext i8 %160 to i64
  %162 = shl nuw nsw i64 %161, 16
  %163 = or i64 %158, %162
  %164 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 3
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !8
  %166 = zext i8 %165 to i64
  %167 = shl nuw nsw i64 %166, 24
  %168 = or i64 %163, %167
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 4
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !8
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 32
  %173 = or i64 %168, %172
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 5
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !8
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 40
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 6
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !8
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 48
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 7
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !8
  %186 = zext i8 %185 to i64
  %187 = shl nuw i64 %186, 56
  %188 = or i64 %183, %187
  %189 = add nsw i32 %146, -8
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 8
  br label %204

191:                                              ; preds = %149, %191
  %192 = phi i32 [ %202, %191 ], [ 0, %149 ]
  %193 = phi i64 [ %201, %191 ], [ 0, %149 ]
  %194 = zext i32 %192 to i64
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %145, i64 %194
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !8
  %197 = zext i8 %196 to i64
  %198 = shl i32 %192, 3
  %199 = zext i32 %198 to i64
  %200 = shl nuw i64 %197, %199
  %201 = or i64 %200, %193
  %202 = add nuw nsw i32 %192, 1
  %203 = icmp eq i32 %202, %146
  br i1 %203, label %204, label %191

204:                                              ; preds = %191, %151, %149
  %205 = phi i8 addrspace(4)* [ %190, %151 ], [ %145, %149 ], [ %145, %191 ]
  %206 = phi i32 [ %189, %151 ], [ 0, %149 ], [ 0, %191 ]
  %207 = phi i64 [ %188, %151 ], [ 0, %149 ], [ %201, %191 ]
  %208 = icmp ugt i32 %206, 7
  br i1 %208, label %211, label %209

209:                                              ; preds = %204
  %210 = icmp eq i32 %206, 0
  br i1 %210, label %264, label %251

211:                                              ; preds = %204
  %212 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !8
  %213 = zext i8 %212 to i64
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 1
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !8
  %216 = zext i8 %215 to i64
  %217 = shl nuw nsw i64 %216, 8
  %218 = or i64 %217, %213
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 2
  %220 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !8
  %221 = zext i8 %220 to i64
  %222 = shl nuw nsw i64 %221, 16
  %223 = or i64 %218, %222
  %224 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 3
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !8
  %226 = zext i8 %225 to i64
  %227 = shl nuw nsw i64 %226, 24
  %228 = or i64 %223, %227
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 4
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !8
  %231 = zext i8 %230 to i64
  %232 = shl nuw nsw i64 %231, 32
  %233 = or i64 %228, %232
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 5
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !8
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 40
  %238 = or i64 %233, %237
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 6
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !8
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 48
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 7
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !8
  %246 = zext i8 %245 to i64
  %247 = shl nuw i64 %246, 56
  %248 = or i64 %243, %247
  %249 = add nsw i32 %206, -8
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 8
  br label %264

251:                                              ; preds = %209, %251
  %252 = phi i32 [ %262, %251 ], [ 0, %209 ]
  %253 = phi i64 [ %261, %251 ], [ 0, %209 ]
  %254 = zext i32 %252 to i64
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %205, i64 %254
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !8
  %257 = zext i8 %256 to i64
  %258 = shl i32 %252, 3
  %259 = zext i32 %258 to i64
  %260 = shl nuw i64 %257, %259
  %261 = or i64 %260, %253
  %262 = add nuw nsw i32 %252, 1
  %263 = icmp eq i32 %262, %206
  br i1 %263, label %264, label %251

264:                                              ; preds = %251, %211, %209
  %265 = phi i8 addrspace(4)* [ %250, %211 ], [ %205, %209 ], [ %205, %251 ]
  %266 = phi i32 [ %249, %211 ], [ 0, %209 ], [ 0, %251 ]
  %267 = phi i64 [ %248, %211 ], [ 0, %209 ], [ %261, %251 ]
  %268 = icmp ugt i32 %266, 7
  br i1 %268, label %271, label %269

269:                                              ; preds = %264
  %270 = icmp eq i32 %266, 0
  br i1 %270, label %324, label %311

271:                                              ; preds = %264
  %272 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !8
  %273 = zext i8 %272 to i64
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 1
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !8
  %276 = zext i8 %275 to i64
  %277 = shl nuw nsw i64 %276, 8
  %278 = or i64 %277, %273
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 2
  %280 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !8
  %281 = zext i8 %280 to i64
  %282 = shl nuw nsw i64 %281, 16
  %283 = or i64 %278, %282
  %284 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 3
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !8
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 24
  %288 = or i64 %283, %287
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 4
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !8
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 32
  %293 = or i64 %288, %292
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 5
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !8
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 40
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 6
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !8
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 48
  %303 = or i64 %298, %302
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 7
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !8
  %306 = zext i8 %305 to i64
  %307 = shl nuw i64 %306, 56
  %308 = or i64 %303, %307
  %309 = add nsw i32 %266, -8
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 8
  br label %324

311:                                              ; preds = %269, %311
  %312 = phi i32 [ %322, %311 ], [ 0, %269 ]
  %313 = phi i64 [ %321, %311 ], [ 0, %269 ]
  %314 = zext i32 %312 to i64
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %265, i64 %314
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !8
  %317 = zext i8 %316 to i64
  %318 = shl i32 %312, 3
  %319 = zext i32 %318 to i64
  %320 = shl nuw i64 %317, %319
  %321 = or i64 %320, %313
  %322 = add nuw nsw i32 %312, 1
  %323 = icmp eq i32 %322, %266
  br i1 %323, label %324, label %311

324:                                              ; preds = %311, %271, %269
  %325 = phi i8 addrspace(4)* [ %310, %271 ], [ %265, %269 ], [ %265, %311 ]
  %326 = phi i32 [ %309, %271 ], [ 0, %269 ], [ 0, %311 ]
  %327 = phi i64 [ %308, %271 ], [ 0, %269 ], [ %321, %311 ]
  %328 = icmp ugt i32 %326, 7
  br i1 %328, label %331, label %329

329:                                              ; preds = %324
  %330 = icmp eq i32 %326, 0
  br i1 %330, label %384, label %371

331:                                              ; preds = %324
  %332 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !8
  %333 = zext i8 %332 to i64
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 1
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !8
  %336 = zext i8 %335 to i64
  %337 = shl nuw nsw i64 %336, 8
  %338 = or i64 %337, %333
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 2
  %340 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !8
  %341 = zext i8 %340 to i64
  %342 = shl nuw nsw i64 %341, 16
  %343 = or i64 %338, %342
  %344 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 3
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !8
  %346 = zext i8 %345 to i64
  %347 = shl nuw nsw i64 %346, 24
  %348 = or i64 %343, %347
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 4
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !8
  %351 = zext i8 %350 to i64
  %352 = shl nuw nsw i64 %351, 32
  %353 = or i64 %348, %352
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 5
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !8
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 40
  %358 = or i64 %353, %357
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 6
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !8
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 48
  %363 = or i64 %358, %362
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 7
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !8
  %366 = zext i8 %365 to i64
  %367 = shl nuw i64 %366, 56
  %368 = or i64 %363, %367
  %369 = add nsw i32 %326, -8
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 8
  br label %384

371:                                              ; preds = %329, %371
  %372 = phi i32 [ %382, %371 ], [ 0, %329 ]
  %373 = phi i64 [ %381, %371 ], [ 0, %329 ]
  %374 = zext i32 %372 to i64
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %325, i64 %374
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !8
  %377 = zext i8 %376 to i64
  %378 = shl i32 %372, 3
  %379 = zext i32 %378 to i64
  %380 = shl nuw i64 %377, %379
  %381 = or i64 %380, %373
  %382 = add nuw nsw i32 %372, 1
  %383 = icmp eq i32 %382, %326
  br i1 %383, label %384, label %371

384:                                              ; preds = %371, %331, %329
  %385 = phi i8 addrspace(4)* [ %370, %331 ], [ %325, %329 ], [ %325, %371 ]
  %386 = phi i32 [ %369, %331 ], [ 0, %329 ], [ 0, %371 ]
  %387 = phi i64 [ %368, %331 ], [ 0, %329 ], [ %381, %371 ]
  %388 = icmp ugt i32 %386, 7
  br i1 %388, label %391, label %389

389:                                              ; preds = %384
  %390 = icmp eq i32 %386, 0
  br i1 %390, label %442, label %429

391:                                              ; preds = %384
  %392 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !8
  %393 = zext i8 %392 to i64
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %385, i64 1
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !8
  %396 = zext i8 %395 to i64
  %397 = shl nuw nsw i64 %396, 8
  %398 = or i64 %397, %393
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %385, i64 2
  %400 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !8
  %401 = zext i8 %400 to i64
  %402 = shl nuw nsw i64 %401, 16
  %403 = or i64 %398, %402
  %404 = getelementptr inbounds i8, i8 addrspace(4)* %385, i64 3
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !8
  %406 = zext i8 %405 to i64
  %407 = shl nuw nsw i64 %406, 24
  %408 = or i64 %403, %407
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %385, i64 4
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !8
  %411 = zext i8 %410 to i64
  %412 = shl nuw nsw i64 %411, 32
  %413 = or i64 %408, %412
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %385, i64 5
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !8
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 40
  %418 = or i64 %413, %417
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %385, i64 6
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !8
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 48
  %423 = or i64 %418, %422
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %385, i64 7
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !8
  %426 = zext i8 %425 to i64
  %427 = shl nuw i64 %426, 56
  %428 = or i64 %423, %427
  br label %442

429:                                              ; preds = %389, %429
  %430 = phi i32 [ %440, %429 ], [ 0, %389 ]
  %431 = phi i64 [ %439, %429 ], [ 0, %389 ]
  %432 = zext i32 %430 to i64
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %385, i64 %432
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !8
  %435 = zext i8 %434 to i64
  %436 = shl i32 %430, 3
  %437 = zext i32 %436 to i64
  %438 = shl nuw i64 %435, %437
  %439 = or i64 %438, %431
  %440 = add nuw nsw i32 %430, 1
  %441 = icmp eq i32 %440, %386
  br i1 %441, label %442, label %429

442:                                              ; preds = %429, %391, %389
  %443 = phi i64 [ %428, %391 ], [ 0, %389 ], [ %439, %429 ]
  %444 = shl nuw nsw i64 %25, 2
  %445 = add nuw nsw i64 %444, 28
  %446 = and i64 %445, 480
  %447 = and i64 %27, -225
  %448 = or i64 %447, %446
  %449 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %6, i64 noundef %448, i64 noundef %87, i64 noundef %147, i64 noundef %207, i64 noundef %267, i64 noundef %327, i64 noundef %387, i64 noundef %443) #10
  %450 = sub i64 %17, %25
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 %25
  %452 = icmp eq i64 %450, 0
  br i1 %452, label %453, label %16

453:                                              ; preds = %442, %9
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !11
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !13
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !13
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !13
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !15
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !13
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !13
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !13
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !11
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !11
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !11
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !13
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !13
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !16
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !19
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !16
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !19
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !11
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !16
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !19
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !11
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !11
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !20
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !19
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !11
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !11
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !11
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !13
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !13
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !13
  %110 = call i64 @llvm.read_register.i64(metadata !21) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !22
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !24
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !25
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !11
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !13
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !13
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !16
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !19
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !26
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !26
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !27
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !29
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !11
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !11
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !13
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !13
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !11
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !13
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !13
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !19
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !16
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !26
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !26
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
!12 = !{!"any pointer", !6, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !6, i64 0}
!15 = !{i64 2662}
!16 = !{!17, !12, i64 0}
!17 = !{!"", !12, i64 0, !12, i64 8, !18, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!18 = !{!"hsa_signal_s", !5, i64 0}
!19 = !{!17, !5, i64 40}
!20 = !{!17, !12, i64 8}
!21 = !{!"exec"}
!22 = !{!23, !14, i64 16}
!23 = !{!"", !5, i64 0, !5, i64 8, !14, i64 16, !14, i64 20}
!24 = !{!23, !5, i64 8}
!25 = !{!23, !14, i64 20}
!26 = !{!23, !5, i64 0}
!27 = !{!28, !5, i64 16}
!28 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !14, i64 24, !14, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!29 = !{!28, !14, i64 24}
