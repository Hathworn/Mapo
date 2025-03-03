; ModuleID = '../data/hip_kernels/2528/7/main.cu'
source_filename = "../data/hip_kernels/2528/7/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [18 x i8] c"Block Number: %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [15 x i8] c"DATA[%d] = %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z4scanPfS_i(float addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture readnone %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp eq i32 %4, 0
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = icmp eq i32 %6, 0
  %8 = select i1 %5, i1 %7, i1 false
  br i1 %8, label %9, label %931

9:                                                ; preds = %3
  %10 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 24
  %12 = bitcast i8 addrspace(4)* %11 to i64 addrspace(4)*
  %13 = load i64, i64 addrspace(4)* %12, align 8, !tbaa !5
  %14 = inttoptr i64 %13 to i8 addrspace(1)*
  %15 = addrspacecast i8 addrspace(1)* %14 to i8*
  %16 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %17 = extractelement <2 x i64> %16, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %18, label %22

18:                                               ; preds = %9
  %19 = and i64 %17, -225
  %20 = or i64 %19, 32
  %21 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %20, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %463

22:                                               ; preds = %9
  %23 = and i64 %17, 2
  %24 = and i64 %17, -3
  %25 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %24, i64 0
  br label %26

26:                                               ; preds = %452, %22
  %27 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 17) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([18 x i8]* addrspacecast ([18 x i8] addrspace(4)* @.str to [18 x i8]*) to i64)), i64 1))), %22 ], [ %460, %452 ]
  %28 = phi i8 addrspace(4)* [ getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0), %22 ], [ %461, %452 ]
  %29 = phi <2 x i64> [ %25, %22 ], [ %459, %452 ]
  %30 = icmp ugt i64 %27, 56
  %31 = extractelement <2 x i64> %29, i64 0
  %32 = or i64 %31, %23
  %33 = insertelement <2 x i64> poison, i64 %32, i64 0
  %34 = select i1 %30, <2 x i64> %29, <2 x i64> %33
  %35 = tail call i64 @llvm.umin.i64(i64 %27, i64 56)
  %36 = trunc i64 %35 to i32
  %37 = extractelement <2 x i64> %34, i64 0
  %38 = icmp ugt i32 %36, 7
  br i1 %38, label %41, label %39

39:                                               ; preds = %26
  %40 = icmp eq i32 %36, 0
  br i1 %40, label %94, label %81

41:                                               ; preds = %26
  %42 = load i8, i8 addrspace(4)* %28, align 1, !tbaa !9
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 1
  %45 = load i8, i8 addrspace(4)* %44, align 1, !tbaa !9
  %46 = zext i8 %45 to i64
  %47 = shl nuw nsw i64 %46, 8
  %48 = or i64 %47, %43
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 2
  %50 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !9
  %51 = zext i8 %50 to i64
  %52 = shl nuw nsw i64 %51, 16
  %53 = or i64 %48, %52
  %54 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 3
  %55 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !9
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 24
  %58 = or i64 %53, %57
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 4
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !9
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 32
  %63 = or i64 %58, %62
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 5
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !9
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 40
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 6
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !9
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 48
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 7
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !9
  %76 = zext i8 %75 to i64
  %77 = shl nuw i64 %76, 56
  %78 = or i64 %73, %77
  %79 = add nsw i32 %36, -8
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 8
  br label %94

81:                                               ; preds = %39, %81
  %82 = phi i32 [ %92, %81 ], [ 0, %39 ]
  %83 = phi i64 [ %91, %81 ], [ 0, %39 ]
  %84 = zext i32 %82 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 %84
  %86 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !9
  %87 = zext i8 %86 to i64
  %88 = shl i32 %82, 3
  %89 = zext i32 %88 to i64
  %90 = shl nuw i64 %87, %89
  %91 = or i64 %90, %83
  %92 = add nuw nsw i32 %82, 1
  %93 = icmp eq i32 %92, %36
  br i1 %93, label %94, label %81, !llvm.loop !10

94:                                               ; preds = %81, %41, %39
  %95 = phi i8 addrspace(4)* [ %80, %41 ], [ %28, %39 ], [ %28, %81 ]
  %96 = phi i32 [ %79, %41 ], [ 0, %39 ], [ 0, %81 ]
  %97 = phi i64 [ %78, %41 ], [ 0, %39 ], [ %91, %81 ]
  %98 = icmp ugt i32 %96, 7
  br i1 %98, label %101, label %99

99:                                               ; preds = %94
  %100 = icmp eq i32 %96, 0
  br i1 %100, label %154, label %141

101:                                              ; preds = %94
  %102 = load i8, i8 addrspace(4)* %95, align 1, !tbaa !9
  %103 = zext i8 %102 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 1
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !9
  %106 = zext i8 %105 to i64
  %107 = shl nuw nsw i64 %106, 8
  %108 = or i64 %107, %103
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 2
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !9
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 16
  %113 = or i64 %108, %112
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 3
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !9
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 24
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 4
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !9
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 32
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 5
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !9
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 40
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 6
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !9
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 48
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 7
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !9
  %136 = zext i8 %135 to i64
  %137 = shl nuw i64 %136, 56
  %138 = or i64 %133, %137
  %139 = add nsw i32 %96, -8
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 8
  br label %154

141:                                              ; preds = %99, %141
  %142 = phi i32 [ %152, %141 ], [ 0, %99 ]
  %143 = phi i64 [ %151, %141 ], [ 0, %99 ]
  %144 = zext i32 %142 to i64
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 %144
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !9
  %147 = zext i8 %146 to i64
  %148 = shl i32 %142, 3
  %149 = zext i32 %148 to i64
  %150 = shl nuw i64 %147, %149
  %151 = or i64 %150, %143
  %152 = add nuw nsw i32 %142, 1
  %153 = icmp eq i32 %152, %96
  br i1 %153, label %154, label %141

154:                                              ; preds = %141, %101, %99
  %155 = phi i8 addrspace(4)* [ %140, %101 ], [ %95, %99 ], [ %95, %141 ]
  %156 = phi i32 [ %139, %101 ], [ 0, %99 ], [ 0, %141 ]
  %157 = phi i64 [ %138, %101 ], [ 0, %99 ], [ %151, %141 ]
  %158 = icmp ugt i32 %156, 7
  br i1 %158, label %161, label %159

159:                                              ; preds = %154
  %160 = icmp eq i32 %156, 0
  br i1 %160, label %214, label %201

161:                                              ; preds = %154
  %162 = load i8, i8 addrspace(4)* %155, align 1, !tbaa !9
  %163 = zext i8 %162 to i64
  %164 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 1
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !9
  %166 = zext i8 %165 to i64
  %167 = shl nuw nsw i64 %166, 8
  %168 = or i64 %167, %163
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 2
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !9
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 16
  %173 = or i64 %168, %172
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 3
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !9
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 24
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 4
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !9
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 32
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 5
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !9
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 40
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 6
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !9
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 48
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 7
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !9
  %196 = zext i8 %195 to i64
  %197 = shl nuw i64 %196, 56
  %198 = or i64 %193, %197
  %199 = add nsw i32 %156, -8
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 8
  br label %214

201:                                              ; preds = %159, %201
  %202 = phi i32 [ %212, %201 ], [ 0, %159 ]
  %203 = phi i64 [ %211, %201 ], [ 0, %159 ]
  %204 = zext i32 %202 to i64
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 %204
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !9
  %207 = zext i8 %206 to i64
  %208 = shl i32 %202, 3
  %209 = zext i32 %208 to i64
  %210 = shl nuw i64 %207, %209
  %211 = or i64 %210, %203
  %212 = add nuw nsw i32 %202, 1
  %213 = icmp eq i32 %212, %156
  br i1 %213, label %214, label %201

214:                                              ; preds = %201, %161, %159
  %215 = phi i8 addrspace(4)* [ %200, %161 ], [ %155, %159 ], [ %155, %201 ]
  %216 = phi i32 [ %199, %161 ], [ 0, %159 ], [ 0, %201 ]
  %217 = phi i64 [ %198, %161 ], [ 0, %159 ], [ %211, %201 ]
  %218 = icmp ugt i32 %216, 7
  br i1 %218, label %221, label %219

219:                                              ; preds = %214
  %220 = icmp eq i32 %216, 0
  br i1 %220, label %274, label %261

221:                                              ; preds = %214
  %222 = load i8, i8 addrspace(4)* %215, align 1, !tbaa !9
  %223 = zext i8 %222 to i64
  %224 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 1
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !9
  %226 = zext i8 %225 to i64
  %227 = shl nuw nsw i64 %226, 8
  %228 = or i64 %227, %223
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 2
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !9
  %231 = zext i8 %230 to i64
  %232 = shl nuw nsw i64 %231, 16
  %233 = or i64 %228, %232
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 3
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !9
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 24
  %238 = or i64 %233, %237
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 4
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !9
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 32
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 5
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !9
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 40
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 6
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !9
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 48
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 7
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !9
  %256 = zext i8 %255 to i64
  %257 = shl nuw i64 %256, 56
  %258 = or i64 %253, %257
  %259 = add nsw i32 %216, -8
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 8
  br label %274

261:                                              ; preds = %219, %261
  %262 = phi i32 [ %272, %261 ], [ 0, %219 ]
  %263 = phi i64 [ %271, %261 ], [ 0, %219 ]
  %264 = zext i32 %262 to i64
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 %264
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !9
  %267 = zext i8 %266 to i64
  %268 = shl i32 %262, 3
  %269 = zext i32 %268 to i64
  %270 = shl nuw i64 %267, %269
  %271 = or i64 %270, %263
  %272 = add nuw nsw i32 %262, 1
  %273 = icmp eq i32 %272, %216
  br i1 %273, label %274, label %261

274:                                              ; preds = %261, %221, %219
  %275 = phi i8 addrspace(4)* [ %260, %221 ], [ %215, %219 ], [ %215, %261 ]
  %276 = phi i32 [ %259, %221 ], [ 0, %219 ], [ 0, %261 ]
  %277 = phi i64 [ %258, %221 ], [ 0, %219 ], [ %271, %261 ]
  %278 = icmp ugt i32 %276, 7
  br i1 %278, label %281, label %279

279:                                              ; preds = %274
  %280 = icmp eq i32 %276, 0
  br i1 %280, label %334, label %321

281:                                              ; preds = %274
  %282 = load i8, i8 addrspace(4)* %275, align 1, !tbaa !9
  %283 = zext i8 %282 to i64
  %284 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 1
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !9
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 8
  %288 = or i64 %287, %283
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 2
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !9
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 16
  %293 = or i64 %288, %292
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 3
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !9
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 24
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 4
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !9
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 32
  %303 = or i64 %298, %302
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 5
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !9
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 40
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 6
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !9
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 48
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 7
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !9
  %316 = zext i8 %315 to i64
  %317 = shl nuw i64 %316, 56
  %318 = or i64 %313, %317
  %319 = add nsw i32 %276, -8
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 8
  br label %334

321:                                              ; preds = %279, %321
  %322 = phi i32 [ %332, %321 ], [ 0, %279 ]
  %323 = phi i64 [ %331, %321 ], [ 0, %279 ]
  %324 = zext i32 %322 to i64
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 %324
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !9
  %327 = zext i8 %326 to i64
  %328 = shl i32 %322, 3
  %329 = zext i32 %328 to i64
  %330 = shl nuw i64 %327, %329
  %331 = or i64 %330, %323
  %332 = add nuw nsw i32 %322, 1
  %333 = icmp eq i32 %332, %276
  br i1 %333, label %334, label %321

334:                                              ; preds = %321, %281, %279
  %335 = phi i8 addrspace(4)* [ %320, %281 ], [ %275, %279 ], [ %275, %321 ]
  %336 = phi i32 [ %319, %281 ], [ 0, %279 ], [ 0, %321 ]
  %337 = phi i64 [ %318, %281 ], [ 0, %279 ], [ %331, %321 ]
  %338 = icmp ugt i32 %336, 7
  br i1 %338, label %341, label %339

339:                                              ; preds = %334
  %340 = icmp eq i32 %336, 0
  br i1 %340, label %394, label %381

341:                                              ; preds = %334
  %342 = load i8, i8 addrspace(4)* %335, align 1, !tbaa !9
  %343 = zext i8 %342 to i64
  %344 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 1
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !9
  %346 = zext i8 %345 to i64
  %347 = shl nuw nsw i64 %346, 8
  %348 = or i64 %347, %343
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 2
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !9
  %351 = zext i8 %350 to i64
  %352 = shl nuw nsw i64 %351, 16
  %353 = or i64 %348, %352
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 3
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !9
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 24
  %358 = or i64 %353, %357
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 4
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !9
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 32
  %363 = or i64 %358, %362
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 5
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !9
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 40
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 6
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !9
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 48
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 7
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !9
  %376 = zext i8 %375 to i64
  %377 = shl nuw i64 %376, 56
  %378 = or i64 %373, %377
  %379 = add nsw i32 %336, -8
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 8
  br label %394

381:                                              ; preds = %339, %381
  %382 = phi i32 [ %392, %381 ], [ 0, %339 ]
  %383 = phi i64 [ %391, %381 ], [ 0, %339 ]
  %384 = zext i32 %382 to i64
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 %384
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !9
  %387 = zext i8 %386 to i64
  %388 = shl i32 %382, 3
  %389 = zext i32 %388 to i64
  %390 = shl nuw i64 %387, %389
  %391 = or i64 %390, %383
  %392 = add nuw nsw i32 %382, 1
  %393 = icmp eq i32 %392, %336
  br i1 %393, label %394, label %381

394:                                              ; preds = %381, %341, %339
  %395 = phi i8 addrspace(4)* [ %380, %341 ], [ %335, %339 ], [ %335, %381 ]
  %396 = phi i32 [ %379, %341 ], [ 0, %339 ], [ 0, %381 ]
  %397 = phi i64 [ %378, %341 ], [ 0, %339 ], [ %391, %381 ]
  %398 = icmp ugt i32 %396, 7
  br i1 %398, label %401, label %399

399:                                              ; preds = %394
  %400 = icmp eq i32 %396, 0
  br i1 %400, label %452, label %439

401:                                              ; preds = %394
  %402 = load i8, i8 addrspace(4)* %395, align 1, !tbaa !9
  %403 = zext i8 %402 to i64
  %404 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 1
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !9
  %406 = zext i8 %405 to i64
  %407 = shl nuw nsw i64 %406, 8
  %408 = or i64 %407, %403
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 2
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !9
  %411 = zext i8 %410 to i64
  %412 = shl nuw nsw i64 %411, 16
  %413 = or i64 %408, %412
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 3
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !9
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 24
  %418 = or i64 %413, %417
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 4
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !9
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 32
  %423 = or i64 %418, %422
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 5
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !9
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 40
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 6
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !9
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 48
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 7
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !9
  %436 = zext i8 %435 to i64
  %437 = shl nuw i64 %436, 56
  %438 = or i64 %433, %437
  br label %452

439:                                              ; preds = %399, %439
  %440 = phi i32 [ %450, %439 ], [ 0, %399 ]
  %441 = phi i64 [ %449, %439 ], [ 0, %399 ]
  %442 = zext i32 %440 to i64
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 %442
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !9
  %445 = zext i8 %444 to i64
  %446 = shl i32 %440, 3
  %447 = zext i32 %446 to i64
  %448 = shl nuw i64 %445, %447
  %449 = or i64 %448, %441
  %450 = add nuw nsw i32 %440, 1
  %451 = icmp eq i32 %450, %396
  br i1 %451, label %452, label %439

452:                                              ; preds = %439, %401, %399
  %453 = phi i64 [ %438, %401 ], [ 0, %399 ], [ %449, %439 ]
  %454 = shl nuw nsw i64 %35, 2
  %455 = add nuw nsw i64 %454, 28
  %456 = and i64 %455, 480
  %457 = and i64 %37, -225
  %458 = or i64 %457, %456
  %459 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %458, i64 noundef %97, i64 noundef %157, i64 noundef %217, i64 noundef %277, i64 noundef %337, i64 noundef %397, i64 noundef %453) #10
  %460 = sub i64 %27, %35
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 %35
  %462 = icmp eq i64 %460, 0
  br i1 %462, label %463, label %26

463:                                              ; preds = %452, %18
  %464 = phi <2 x i64> [ %21, %18 ], [ %459, %452 ]
  %465 = extractelement <2 x i64> %464, i64 0
  %466 = and i64 %465, -227
  %467 = or i64 %466, 34
  %468 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %467, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %469

469:                                              ; preds = %463, %918
  %470 = phi i32 [ 0, %463 ], [ %929, %918 ]
  %471 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %472 = extractelement <2 x i64> %471, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %473, label %477

473:                                              ; preds = %469
  %474 = and i64 %472, -225
  %475 = or i64 %474, 32
  %476 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %475, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %918

477:                                              ; preds = %469
  %478 = and i64 %472, 2
  %479 = and i64 %472, -3
  %480 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %479, i64 0
  br label %481

481:                                              ; preds = %907, %477
  %482 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str.1 to [15 x i8]*) to i64)), i64 1))), %477 ], [ %915, %907 ]
  %483 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %477 ], [ %916, %907 ]
  %484 = phi <2 x i64> [ %480, %477 ], [ %914, %907 ]
  %485 = icmp ugt i64 %482, 56
  %486 = extractelement <2 x i64> %484, i64 0
  %487 = or i64 %486, %478
  %488 = insertelement <2 x i64> poison, i64 %487, i64 0
  %489 = select i1 %485, <2 x i64> %484, <2 x i64> %488
  %490 = tail call i64 @llvm.umin.i64(i64 %482, i64 56)
  %491 = trunc i64 %490 to i32
  %492 = extractelement <2 x i64> %489, i64 0
  %493 = icmp ugt i32 %491, 7
  br i1 %493, label %496, label %494

494:                                              ; preds = %481
  %495 = icmp eq i32 %491, 0
  br i1 %495, label %549, label %536

496:                                              ; preds = %481
  %497 = load i8, i8 addrspace(4)* %483, align 1, !tbaa !9
  %498 = zext i8 %497 to i64
  %499 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 1
  %500 = load i8, i8 addrspace(4)* %499, align 1, !tbaa !9
  %501 = zext i8 %500 to i64
  %502 = shl nuw nsw i64 %501, 8
  %503 = or i64 %502, %498
  %504 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 2
  %505 = load i8, i8 addrspace(4)* %504, align 1, !tbaa !9
  %506 = zext i8 %505 to i64
  %507 = shl nuw nsw i64 %506, 16
  %508 = or i64 %503, %507
  %509 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 3
  %510 = load i8, i8 addrspace(4)* %509, align 1, !tbaa !9
  %511 = zext i8 %510 to i64
  %512 = shl nuw nsw i64 %511, 24
  %513 = or i64 %508, %512
  %514 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 4
  %515 = load i8, i8 addrspace(4)* %514, align 1, !tbaa !9
  %516 = zext i8 %515 to i64
  %517 = shl nuw nsw i64 %516, 32
  %518 = or i64 %513, %517
  %519 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 5
  %520 = load i8, i8 addrspace(4)* %519, align 1, !tbaa !9
  %521 = zext i8 %520 to i64
  %522 = shl nuw nsw i64 %521, 40
  %523 = or i64 %518, %522
  %524 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 6
  %525 = load i8, i8 addrspace(4)* %524, align 1, !tbaa !9
  %526 = zext i8 %525 to i64
  %527 = shl nuw nsw i64 %526, 48
  %528 = or i64 %523, %527
  %529 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 7
  %530 = load i8, i8 addrspace(4)* %529, align 1, !tbaa !9
  %531 = zext i8 %530 to i64
  %532 = shl nuw i64 %531, 56
  %533 = or i64 %528, %532
  %534 = add nsw i32 %491, -8
  %535 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 8
  br label %549

536:                                              ; preds = %494, %536
  %537 = phi i32 [ %547, %536 ], [ 0, %494 ]
  %538 = phi i64 [ %546, %536 ], [ 0, %494 ]
  %539 = zext i32 %537 to i64
  %540 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 %539
  %541 = load i8, i8 addrspace(4)* %540, align 1, !tbaa !9
  %542 = zext i8 %541 to i64
  %543 = shl i32 %537, 3
  %544 = zext i32 %543 to i64
  %545 = shl nuw i64 %542, %544
  %546 = or i64 %545, %538
  %547 = add nuw nsw i32 %537, 1
  %548 = icmp eq i32 %547, %491
  br i1 %548, label %549, label %536, !llvm.loop !10

549:                                              ; preds = %536, %496, %494
  %550 = phi i8 addrspace(4)* [ %535, %496 ], [ %483, %494 ], [ %483, %536 ]
  %551 = phi i32 [ %534, %496 ], [ 0, %494 ], [ 0, %536 ]
  %552 = phi i64 [ %533, %496 ], [ 0, %494 ], [ %546, %536 ]
  %553 = icmp ugt i32 %551, 7
  br i1 %553, label %556, label %554

554:                                              ; preds = %549
  %555 = icmp eq i32 %551, 0
  br i1 %555, label %609, label %596

556:                                              ; preds = %549
  %557 = load i8, i8 addrspace(4)* %550, align 1, !tbaa !9
  %558 = zext i8 %557 to i64
  %559 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 1
  %560 = load i8, i8 addrspace(4)* %559, align 1, !tbaa !9
  %561 = zext i8 %560 to i64
  %562 = shl nuw nsw i64 %561, 8
  %563 = or i64 %562, %558
  %564 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 2
  %565 = load i8, i8 addrspace(4)* %564, align 1, !tbaa !9
  %566 = zext i8 %565 to i64
  %567 = shl nuw nsw i64 %566, 16
  %568 = or i64 %563, %567
  %569 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 3
  %570 = load i8, i8 addrspace(4)* %569, align 1, !tbaa !9
  %571 = zext i8 %570 to i64
  %572 = shl nuw nsw i64 %571, 24
  %573 = or i64 %568, %572
  %574 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 4
  %575 = load i8, i8 addrspace(4)* %574, align 1, !tbaa !9
  %576 = zext i8 %575 to i64
  %577 = shl nuw nsw i64 %576, 32
  %578 = or i64 %573, %577
  %579 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 5
  %580 = load i8, i8 addrspace(4)* %579, align 1, !tbaa !9
  %581 = zext i8 %580 to i64
  %582 = shl nuw nsw i64 %581, 40
  %583 = or i64 %578, %582
  %584 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 6
  %585 = load i8, i8 addrspace(4)* %584, align 1, !tbaa !9
  %586 = zext i8 %585 to i64
  %587 = shl nuw nsw i64 %586, 48
  %588 = or i64 %583, %587
  %589 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 7
  %590 = load i8, i8 addrspace(4)* %589, align 1, !tbaa !9
  %591 = zext i8 %590 to i64
  %592 = shl nuw i64 %591, 56
  %593 = or i64 %588, %592
  %594 = add nsw i32 %551, -8
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 8
  br label %609

596:                                              ; preds = %554, %596
  %597 = phi i32 [ %607, %596 ], [ 0, %554 ]
  %598 = phi i64 [ %606, %596 ], [ 0, %554 ]
  %599 = zext i32 %597 to i64
  %600 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 %599
  %601 = load i8, i8 addrspace(4)* %600, align 1, !tbaa !9
  %602 = zext i8 %601 to i64
  %603 = shl i32 %597, 3
  %604 = zext i32 %603 to i64
  %605 = shl nuw i64 %602, %604
  %606 = or i64 %605, %598
  %607 = add nuw nsw i32 %597, 1
  %608 = icmp eq i32 %607, %551
  br i1 %608, label %609, label %596

609:                                              ; preds = %596, %556, %554
  %610 = phi i8 addrspace(4)* [ %595, %556 ], [ %550, %554 ], [ %550, %596 ]
  %611 = phi i32 [ %594, %556 ], [ 0, %554 ], [ 0, %596 ]
  %612 = phi i64 [ %593, %556 ], [ 0, %554 ], [ %606, %596 ]
  %613 = icmp ugt i32 %611, 7
  br i1 %613, label %616, label %614

614:                                              ; preds = %609
  %615 = icmp eq i32 %611, 0
  br i1 %615, label %669, label %656

616:                                              ; preds = %609
  %617 = load i8, i8 addrspace(4)* %610, align 1, !tbaa !9
  %618 = zext i8 %617 to i64
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 1
  %620 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !9
  %621 = zext i8 %620 to i64
  %622 = shl nuw nsw i64 %621, 8
  %623 = or i64 %622, %618
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 2
  %625 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !9
  %626 = zext i8 %625 to i64
  %627 = shl nuw nsw i64 %626, 16
  %628 = or i64 %623, %627
  %629 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 3
  %630 = load i8, i8 addrspace(4)* %629, align 1, !tbaa !9
  %631 = zext i8 %630 to i64
  %632 = shl nuw nsw i64 %631, 24
  %633 = or i64 %628, %632
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 4
  %635 = load i8, i8 addrspace(4)* %634, align 1, !tbaa !9
  %636 = zext i8 %635 to i64
  %637 = shl nuw nsw i64 %636, 32
  %638 = or i64 %633, %637
  %639 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 5
  %640 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !9
  %641 = zext i8 %640 to i64
  %642 = shl nuw nsw i64 %641, 40
  %643 = or i64 %638, %642
  %644 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 6
  %645 = load i8, i8 addrspace(4)* %644, align 1, !tbaa !9
  %646 = zext i8 %645 to i64
  %647 = shl nuw nsw i64 %646, 48
  %648 = or i64 %643, %647
  %649 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 7
  %650 = load i8, i8 addrspace(4)* %649, align 1, !tbaa !9
  %651 = zext i8 %650 to i64
  %652 = shl nuw i64 %651, 56
  %653 = or i64 %648, %652
  %654 = add nsw i32 %611, -8
  %655 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 8
  br label %669

656:                                              ; preds = %614, %656
  %657 = phi i32 [ %667, %656 ], [ 0, %614 ]
  %658 = phi i64 [ %666, %656 ], [ 0, %614 ]
  %659 = zext i32 %657 to i64
  %660 = getelementptr inbounds i8, i8 addrspace(4)* %610, i64 %659
  %661 = load i8, i8 addrspace(4)* %660, align 1, !tbaa !9
  %662 = zext i8 %661 to i64
  %663 = shl i32 %657, 3
  %664 = zext i32 %663 to i64
  %665 = shl nuw i64 %662, %664
  %666 = or i64 %665, %658
  %667 = add nuw nsw i32 %657, 1
  %668 = icmp eq i32 %667, %611
  br i1 %668, label %669, label %656

669:                                              ; preds = %656, %616, %614
  %670 = phi i8 addrspace(4)* [ %655, %616 ], [ %610, %614 ], [ %610, %656 ]
  %671 = phi i32 [ %654, %616 ], [ 0, %614 ], [ 0, %656 ]
  %672 = phi i64 [ %653, %616 ], [ 0, %614 ], [ %666, %656 ]
  %673 = icmp ugt i32 %671, 7
  br i1 %673, label %676, label %674

674:                                              ; preds = %669
  %675 = icmp eq i32 %671, 0
  br i1 %675, label %729, label %716

676:                                              ; preds = %669
  %677 = load i8, i8 addrspace(4)* %670, align 1, !tbaa !9
  %678 = zext i8 %677 to i64
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 1
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !9
  %681 = zext i8 %680 to i64
  %682 = shl nuw nsw i64 %681, 8
  %683 = or i64 %682, %678
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 2
  %685 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !9
  %686 = zext i8 %685 to i64
  %687 = shl nuw nsw i64 %686, 16
  %688 = or i64 %683, %687
  %689 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 3
  %690 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !9
  %691 = zext i8 %690 to i64
  %692 = shl nuw nsw i64 %691, 24
  %693 = or i64 %688, %692
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 4
  %695 = load i8, i8 addrspace(4)* %694, align 1, !tbaa !9
  %696 = zext i8 %695 to i64
  %697 = shl nuw nsw i64 %696, 32
  %698 = or i64 %693, %697
  %699 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 5
  %700 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !9
  %701 = zext i8 %700 to i64
  %702 = shl nuw nsw i64 %701, 40
  %703 = or i64 %698, %702
  %704 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 6
  %705 = load i8, i8 addrspace(4)* %704, align 1, !tbaa !9
  %706 = zext i8 %705 to i64
  %707 = shl nuw nsw i64 %706, 48
  %708 = or i64 %703, %707
  %709 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 7
  %710 = load i8, i8 addrspace(4)* %709, align 1, !tbaa !9
  %711 = zext i8 %710 to i64
  %712 = shl nuw i64 %711, 56
  %713 = or i64 %708, %712
  %714 = add nsw i32 %671, -8
  %715 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 8
  br label %729

716:                                              ; preds = %674, %716
  %717 = phi i32 [ %727, %716 ], [ 0, %674 ]
  %718 = phi i64 [ %726, %716 ], [ 0, %674 ]
  %719 = zext i32 %717 to i64
  %720 = getelementptr inbounds i8, i8 addrspace(4)* %670, i64 %719
  %721 = load i8, i8 addrspace(4)* %720, align 1, !tbaa !9
  %722 = zext i8 %721 to i64
  %723 = shl i32 %717, 3
  %724 = zext i32 %723 to i64
  %725 = shl nuw i64 %722, %724
  %726 = or i64 %725, %718
  %727 = add nuw nsw i32 %717, 1
  %728 = icmp eq i32 %727, %671
  br i1 %728, label %729, label %716

729:                                              ; preds = %716, %676, %674
  %730 = phi i8 addrspace(4)* [ %715, %676 ], [ %670, %674 ], [ %670, %716 ]
  %731 = phi i32 [ %714, %676 ], [ 0, %674 ], [ 0, %716 ]
  %732 = phi i64 [ %713, %676 ], [ 0, %674 ], [ %726, %716 ]
  %733 = icmp ugt i32 %731, 7
  br i1 %733, label %736, label %734

734:                                              ; preds = %729
  %735 = icmp eq i32 %731, 0
  br i1 %735, label %789, label %776

736:                                              ; preds = %729
  %737 = load i8, i8 addrspace(4)* %730, align 1, !tbaa !9
  %738 = zext i8 %737 to i64
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 1
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !9
  %741 = zext i8 %740 to i64
  %742 = shl nuw nsw i64 %741, 8
  %743 = or i64 %742, %738
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 2
  %745 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !9
  %746 = zext i8 %745 to i64
  %747 = shl nuw nsw i64 %746, 16
  %748 = or i64 %743, %747
  %749 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 3
  %750 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !9
  %751 = zext i8 %750 to i64
  %752 = shl nuw nsw i64 %751, 24
  %753 = or i64 %748, %752
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 4
  %755 = load i8, i8 addrspace(4)* %754, align 1, !tbaa !9
  %756 = zext i8 %755 to i64
  %757 = shl nuw nsw i64 %756, 32
  %758 = or i64 %753, %757
  %759 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 5
  %760 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !9
  %761 = zext i8 %760 to i64
  %762 = shl nuw nsw i64 %761, 40
  %763 = or i64 %758, %762
  %764 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 6
  %765 = load i8, i8 addrspace(4)* %764, align 1, !tbaa !9
  %766 = zext i8 %765 to i64
  %767 = shl nuw nsw i64 %766, 48
  %768 = or i64 %763, %767
  %769 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 7
  %770 = load i8, i8 addrspace(4)* %769, align 1, !tbaa !9
  %771 = zext i8 %770 to i64
  %772 = shl nuw i64 %771, 56
  %773 = or i64 %768, %772
  %774 = add nsw i32 %731, -8
  %775 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 8
  br label %789

776:                                              ; preds = %734, %776
  %777 = phi i32 [ %787, %776 ], [ 0, %734 ]
  %778 = phi i64 [ %786, %776 ], [ 0, %734 ]
  %779 = zext i32 %777 to i64
  %780 = getelementptr inbounds i8, i8 addrspace(4)* %730, i64 %779
  %781 = load i8, i8 addrspace(4)* %780, align 1, !tbaa !9
  %782 = zext i8 %781 to i64
  %783 = shl i32 %777, 3
  %784 = zext i32 %783 to i64
  %785 = shl nuw i64 %782, %784
  %786 = or i64 %785, %778
  %787 = add nuw nsw i32 %777, 1
  %788 = icmp eq i32 %787, %731
  br i1 %788, label %789, label %776

789:                                              ; preds = %776, %736, %734
  %790 = phi i8 addrspace(4)* [ %775, %736 ], [ %730, %734 ], [ %730, %776 ]
  %791 = phi i32 [ %774, %736 ], [ 0, %734 ], [ 0, %776 ]
  %792 = phi i64 [ %773, %736 ], [ 0, %734 ], [ %786, %776 ]
  %793 = icmp ugt i32 %791, 7
  br i1 %793, label %796, label %794

794:                                              ; preds = %789
  %795 = icmp eq i32 %791, 0
  br i1 %795, label %849, label %836

796:                                              ; preds = %789
  %797 = load i8, i8 addrspace(4)* %790, align 1, !tbaa !9
  %798 = zext i8 %797 to i64
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 1
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !9
  %801 = zext i8 %800 to i64
  %802 = shl nuw nsw i64 %801, 8
  %803 = or i64 %802, %798
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 2
  %805 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !9
  %806 = zext i8 %805 to i64
  %807 = shl nuw nsw i64 %806, 16
  %808 = or i64 %803, %807
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 3
  %810 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !9
  %811 = zext i8 %810 to i64
  %812 = shl nuw nsw i64 %811, 24
  %813 = or i64 %808, %812
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 4
  %815 = load i8, i8 addrspace(4)* %814, align 1, !tbaa !9
  %816 = zext i8 %815 to i64
  %817 = shl nuw nsw i64 %816, 32
  %818 = or i64 %813, %817
  %819 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 5
  %820 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !9
  %821 = zext i8 %820 to i64
  %822 = shl nuw nsw i64 %821, 40
  %823 = or i64 %818, %822
  %824 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 6
  %825 = load i8, i8 addrspace(4)* %824, align 1, !tbaa !9
  %826 = zext i8 %825 to i64
  %827 = shl nuw nsw i64 %826, 48
  %828 = or i64 %823, %827
  %829 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 7
  %830 = load i8, i8 addrspace(4)* %829, align 1, !tbaa !9
  %831 = zext i8 %830 to i64
  %832 = shl nuw i64 %831, 56
  %833 = or i64 %828, %832
  %834 = add nsw i32 %791, -8
  %835 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 8
  br label %849

836:                                              ; preds = %794, %836
  %837 = phi i32 [ %847, %836 ], [ 0, %794 ]
  %838 = phi i64 [ %846, %836 ], [ 0, %794 ]
  %839 = zext i32 %837 to i64
  %840 = getelementptr inbounds i8, i8 addrspace(4)* %790, i64 %839
  %841 = load i8, i8 addrspace(4)* %840, align 1, !tbaa !9
  %842 = zext i8 %841 to i64
  %843 = shl i32 %837, 3
  %844 = zext i32 %843 to i64
  %845 = shl nuw i64 %842, %844
  %846 = or i64 %845, %838
  %847 = add nuw nsw i32 %837, 1
  %848 = icmp eq i32 %847, %791
  br i1 %848, label %849, label %836

849:                                              ; preds = %836, %796, %794
  %850 = phi i8 addrspace(4)* [ %835, %796 ], [ %790, %794 ], [ %790, %836 ]
  %851 = phi i32 [ %834, %796 ], [ 0, %794 ], [ 0, %836 ]
  %852 = phi i64 [ %833, %796 ], [ 0, %794 ], [ %846, %836 ]
  %853 = icmp ugt i32 %851, 7
  br i1 %853, label %856, label %854

854:                                              ; preds = %849
  %855 = icmp eq i32 %851, 0
  br i1 %855, label %907, label %894

856:                                              ; preds = %849
  %857 = load i8, i8 addrspace(4)* %850, align 1, !tbaa !9
  %858 = zext i8 %857 to i64
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 1
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !9
  %861 = zext i8 %860 to i64
  %862 = shl nuw nsw i64 %861, 8
  %863 = or i64 %862, %858
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 2
  %865 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !9
  %866 = zext i8 %865 to i64
  %867 = shl nuw nsw i64 %866, 16
  %868 = or i64 %863, %867
  %869 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 3
  %870 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !9
  %871 = zext i8 %870 to i64
  %872 = shl nuw nsw i64 %871, 24
  %873 = or i64 %868, %872
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 4
  %875 = load i8, i8 addrspace(4)* %874, align 1, !tbaa !9
  %876 = zext i8 %875 to i64
  %877 = shl nuw nsw i64 %876, 32
  %878 = or i64 %873, %877
  %879 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 5
  %880 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !9
  %881 = zext i8 %880 to i64
  %882 = shl nuw nsw i64 %881, 40
  %883 = or i64 %878, %882
  %884 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 6
  %885 = load i8, i8 addrspace(4)* %884, align 1, !tbaa !9
  %886 = zext i8 %885 to i64
  %887 = shl nuw nsw i64 %886, 48
  %888 = or i64 %883, %887
  %889 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 7
  %890 = load i8, i8 addrspace(4)* %889, align 1, !tbaa !9
  %891 = zext i8 %890 to i64
  %892 = shl nuw i64 %891, 56
  %893 = or i64 %888, %892
  br label %907

894:                                              ; preds = %854, %894
  %895 = phi i32 [ %905, %894 ], [ 0, %854 ]
  %896 = phi i64 [ %904, %894 ], [ 0, %854 ]
  %897 = zext i32 %895 to i64
  %898 = getelementptr inbounds i8, i8 addrspace(4)* %850, i64 %897
  %899 = load i8, i8 addrspace(4)* %898, align 1, !tbaa !9
  %900 = zext i8 %899 to i64
  %901 = shl i32 %895, 3
  %902 = zext i32 %901 to i64
  %903 = shl nuw i64 %900, %902
  %904 = or i64 %903, %896
  %905 = add nuw nsw i32 %895, 1
  %906 = icmp eq i32 %905, %851
  br i1 %906, label %907, label %894

907:                                              ; preds = %894, %856, %854
  %908 = phi i64 [ %893, %856 ], [ 0, %854 ], [ %904, %894 ]
  %909 = shl nuw nsw i64 %490, 2
  %910 = add nuw nsw i64 %909, 28
  %911 = and i64 %910, 480
  %912 = and i64 %492, -225
  %913 = or i64 %912, %911
  %914 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %913, i64 noundef %552, i64 noundef %612, i64 noundef %672, i64 noundef %732, i64 noundef %792, i64 noundef %852, i64 noundef %908) #10
  %915 = sub i64 %482, %490
  %916 = getelementptr inbounds i8, i8 addrspace(4)* %483, i64 %490
  %917 = icmp eq i64 %915, 0
  br i1 %917, label %918, label %481

918:                                              ; preds = %907, %473
  %919 = phi <2 x i64> [ %476, %473 ], [ %914, %907 ]
  %920 = extractelement <2 x i64> %919, i64 0
  %921 = zext i32 %470 to i64
  %922 = and i64 %920, -225
  %923 = or i64 %922, 32
  %924 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %923, i64 noundef %921, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %925 = extractelement <2 x i64> %924, i64 0
  %926 = and i64 %925, -227
  %927 = or i64 %926, 34
  %928 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %927, i64 noundef undef, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %929 = add nuw nsw i32 %470, 1
  %930 = icmp eq i32 %929, 512
  br i1 %930, label %931, label %469, !llvm.loop !12

931:                                              ; preds = %918, %3
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
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !5
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !5
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !5
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !5
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !5
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !5
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !5
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !5
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !5
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !5
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !5
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !5
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !5
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !5
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !5
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !5
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !5
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !5
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !5
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !5
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !5
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !5
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !5
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !5
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !5
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !5
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !5
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !9
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !9
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !7, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !7, i64 0}
!18 = !{i64 2662}
!19 = !{!20, !15, i64 0}
!20 = !{!"", !15, i64 0, !15, i64 8, !21, i64 16, !6, i64 24, !6, i64 32, !6, i64 40}
!21 = !{!"hsa_signal_s", !6, i64 0}
!22 = !{!20, !6, i64 40}
!23 = !{!20, !15, i64 8}
!24 = !{!"exec"}
!25 = !{!26, !17, i64 16}
!26 = !{!"", !6, i64 0, !6, i64 8, !17, i64 16, !17, i64 20}
!27 = !{!26, !6, i64 8}
!28 = !{!26, !17, i64 20}
!29 = !{!26, !6, i64 0}
!30 = !{!31, !6, i64 16}
!31 = !{!"amd_signal_s", !6, i64 0, !7, i64 8, !6, i64 16, !17, i64 24, !17, i64 28, !6, i64 32, !6, i64 40, !7, i64 48, !7, i64 56}
!32 = !{!31, !17, i64 24}
