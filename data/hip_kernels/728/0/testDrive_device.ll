; ModuleID = '../data/hip_kernels/728/0/main.cu'
source_filename = "../data/hip_kernels/728/0/main.cu"
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
@.str.1 = private unnamed_addr addrspace(4) constant [10 x i8] c"num = %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9testDrivev() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %2 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %3 = getelementptr i8, i8 addrspace(4)* %2, i64 4
  %4 = bitcast i8 addrspace(4)* %3 to i16 addrspace(4)*
  %5 = load i16, i16 addrspace(4)* %4, align 4, !range !4, !invariant.load !5
  %6 = zext i16 %5 to i32
  %7 = mul i32 %1, %6
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %9 = add i32 %7, %8
  %10 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 24
  %12 = bitcast i8 addrspace(4)* %11 to i64 addrspace(4)*
  %13 = load i64, i64 addrspace(4)* %12, align 8, !tbaa !7
  %14 = inttoptr i64 %13 to i8 addrspace(1)*
  %15 = addrspacecast i8 addrspace(1)* %14 to i8*
  %16 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %17 = extractelement <2 x i64> %16, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %18, label %22

18:                                               ; preds = %0
  %19 = and i64 %17, -225
  %20 = or i64 %19, 32
  %21 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %20, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %463

22:                                               ; preds = %0
  %23 = and i64 %17, 2
  %24 = and i64 %17, -3
  %25 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %24, i64 0
  br label %26

26:                                               ; preds = %452, %22
  %27 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 3) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([4 x i8]* addrspacecast ([4 x i8] addrspace(4)* @.str to [4 x i8]*) to i64)), i64 1))), %22 ], [ %460, %452 ]
  %28 = phi i8 addrspace(4)* [ getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0), %22 ], [ %461, %452 ]
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
  %42 = load i8, i8 addrspace(4)* %28, align 1, !tbaa !11
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 1
  %45 = load i8, i8 addrspace(4)* %44, align 1, !tbaa !11
  %46 = zext i8 %45 to i64
  %47 = shl nuw nsw i64 %46, 8
  %48 = or i64 %47, %43
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 2
  %50 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !11
  %51 = zext i8 %50 to i64
  %52 = shl nuw nsw i64 %51, 16
  %53 = or i64 %48, %52
  %54 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 3
  %55 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !11
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 24
  %58 = or i64 %53, %57
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 4
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !11
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 32
  %63 = or i64 %58, %62
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 5
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !11
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 40
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 6
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !11
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 48
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 7
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !11
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
  %86 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !11
  %87 = zext i8 %86 to i64
  %88 = shl i32 %82, 3
  %89 = zext i32 %88 to i64
  %90 = shl nuw i64 %87, %89
  %91 = or i64 %90, %83
  %92 = add nuw nsw i32 %82, 1
  %93 = icmp eq i32 %92, %36
  br i1 %93, label %94, label %81, !llvm.loop !12

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
  %102 = load i8, i8 addrspace(4)* %95, align 1, !tbaa !11
  %103 = zext i8 %102 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 1
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !11
  %106 = zext i8 %105 to i64
  %107 = shl nuw nsw i64 %106, 8
  %108 = or i64 %107, %103
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 2
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !11
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 16
  %113 = or i64 %108, %112
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 3
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !11
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 24
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 4
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !11
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 32
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 5
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !11
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 40
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 6
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !11
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 48
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 7
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !11
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
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !11
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
  %162 = load i8, i8 addrspace(4)* %155, align 1, !tbaa !11
  %163 = zext i8 %162 to i64
  %164 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 1
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !11
  %166 = zext i8 %165 to i64
  %167 = shl nuw nsw i64 %166, 8
  %168 = or i64 %167, %163
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 2
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !11
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 16
  %173 = or i64 %168, %172
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 3
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !11
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 24
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 4
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !11
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 32
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 5
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !11
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 40
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 6
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !11
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 48
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %155, i64 7
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !11
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
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !11
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
  %222 = load i8, i8 addrspace(4)* %215, align 1, !tbaa !11
  %223 = zext i8 %222 to i64
  %224 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 1
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !11
  %226 = zext i8 %225 to i64
  %227 = shl nuw nsw i64 %226, 8
  %228 = or i64 %227, %223
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 2
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !11
  %231 = zext i8 %230 to i64
  %232 = shl nuw nsw i64 %231, 16
  %233 = or i64 %228, %232
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 3
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !11
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 24
  %238 = or i64 %233, %237
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 4
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !11
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 32
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 5
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !11
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 40
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 6
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !11
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 48
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %215, i64 7
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !11
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
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !11
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
  %282 = load i8, i8 addrspace(4)* %275, align 1, !tbaa !11
  %283 = zext i8 %282 to i64
  %284 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 1
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !11
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 8
  %288 = or i64 %287, %283
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 2
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !11
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 16
  %293 = or i64 %288, %292
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 3
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !11
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 24
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 4
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !11
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 32
  %303 = or i64 %298, %302
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 5
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !11
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 40
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 6
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !11
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 48
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %275, i64 7
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !11
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
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !11
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
  %342 = load i8, i8 addrspace(4)* %335, align 1, !tbaa !11
  %343 = zext i8 %342 to i64
  %344 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 1
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !11
  %346 = zext i8 %345 to i64
  %347 = shl nuw nsw i64 %346, 8
  %348 = or i64 %347, %343
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 2
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !11
  %351 = zext i8 %350 to i64
  %352 = shl nuw nsw i64 %351, 16
  %353 = or i64 %348, %352
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 3
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !11
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 24
  %358 = or i64 %353, %357
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 4
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !11
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 32
  %363 = or i64 %358, %362
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 5
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !11
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 40
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 6
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !11
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 48
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %335, i64 7
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !11
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
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !11
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
  %402 = load i8, i8 addrspace(4)* %395, align 1, !tbaa !11
  %403 = zext i8 %402 to i64
  %404 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 1
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !11
  %406 = zext i8 %405 to i64
  %407 = shl nuw nsw i64 %406, 8
  %408 = or i64 %407, %403
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 2
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !11
  %411 = zext i8 %410 to i64
  %412 = shl nuw nsw i64 %411, 16
  %413 = or i64 %408, %412
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 3
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !11
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 24
  %418 = or i64 %413, %417
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 4
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !11
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 32
  %423 = or i64 %418, %422
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 5
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !11
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 40
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 6
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !11
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 48
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 7
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !11
  %436 = zext i8 %435 to i64
  %437 = shl nuw i64 %436, 56
  %438 = or i64 %433, %437
  br label %452

439:                                              ; preds = %399, %439
  %440 = phi i32 [ %450, %439 ], [ 0, %399 ]
  %441 = phi i64 [ %449, %439 ], [ 0, %399 ]
  %442 = zext i32 %440 to i64
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %395, i64 %442
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !11
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
  %466 = zext i32 %9 to i64
  %467 = and i64 %465, -227
  %468 = or i64 %467, 34
  %469 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %468, i64 noundef %466, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %470 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %471 = extractelement <2 x i64> %470, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %472, label %476

472:                                              ; preds = %463
  %473 = and i64 %471, -225
  %474 = or i64 %473, 32
  %475 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %474, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %917

476:                                              ; preds = %463
  %477 = and i64 %471, 2
  %478 = and i64 %471, -3
  %479 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %478, i64 0
  br label %480

480:                                              ; preds = %906, %476
  %481 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str.1, i64 0, i64 9) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([10 x i8]* addrspacecast ([10 x i8] addrspace(4)* @.str.1 to [10 x i8]*) to i64)), i64 1))), %476 ], [ %914, %906 ]
  %482 = phi i8 addrspace(4)* [ getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %476 ], [ %915, %906 ]
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
  %496 = load i8, i8 addrspace(4)* %482, align 1, !tbaa !11
  %497 = zext i8 %496 to i64
  %498 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 1
  %499 = load i8, i8 addrspace(4)* %498, align 1, !tbaa !11
  %500 = zext i8 %499 to i64
  %501 = shl nuw nsw i64 %500, 8
  %502 = or i64 %501, %497
  %503 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 2
  %504 = load i8, i8 addrspace(4)* %503, align 1, !tbaa !11
  %505 = zext i8 %504 to i64
  %506 = shl nuw nsw i64 %505, 16
  %507 = or i64 %502, %506
  %508 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 3
  %509 = load i8, i8 addrspace(4)* %508, align 1, !tbaa !11
  %510 = zext i8 %509 to i64
  %511 = shl nuw nsw i64 %510, 24
  %512 = or i64 %507, %511
  %513 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 4
  %514 = load i8, i8 addrspace(4)* %513, align 1, !tbaa !11
  %515 = zext i8 %514 to i64
  %516 = shl nuw nsw i64 %515, 32
  %517 = or i64 %512, %516
  %518 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 5
  %519 = load i8, i8 addrspace(4)* %518, align 1, !tbaa !11
  %520 = zext i8 %519 to i64
  %521 = shl nuw nsw i64 %520, 40
  %522 = or i64 %517, %521
  %523 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 6
  %524 = load i8, i8 addrspace(4)* %523, align 1, !tbaa !11
  %525 = zext i8 %524 to i64
  %526 = shl nuw nsw i64 %525, 48
  %527 = or i64 %522, %526
  %528 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 7
  %529 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !11
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
  %540 = load i8, i8 addrspace(4)* %539, align 1, !tbaa !11
  %541 = zext i8 %540 to i64
  %542 = shl i32 %536, 3
  %543 = zext i32 %542 to i64
  %544 = shl nuw i64 %541, %543
  %545 = or i64 %544, %537
  %546 = add nuw nsw i32 %536, 1
  %547 = icmp eq i32 %546, %490
  br i1 %547, label %548, label %535, !llvm.loop !12

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
  %556 = load i8, i8 addrspace(4)* %549, align 1, !tbaa !11
  %557 = zext i8 %556 to i64
  %558 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 1
  %559 = load i8, i8 addrspace(4)* %558, align 1, !tbaa !11
  %560 = zext i8 %559 to i64
  %561 = shl nuw nsw i64 %560, 8
  %562 = or i64 %561, %557
  %563 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 2
  %564 = load i8, i8 addrspace(4)* %563, align 1, !tbaa !11
  %565 = zext i8 %564 to i64
  %566 = shl nuw nsw i64 %565, 16
  %567 = or i64 %562, %566
  %568 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 3
  %569 = load i8, i8 addrspace(4)* %568, align 1, !tbaa !11
  %570 = zext i8 %569 to i64
  %571 = shl nuw nsw i64 %570, 24
  %572 = or i64 %567, %571
  %573 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 4
  %574 = load i8, i8 addrspace(4)* %573, align 1, !tbaa !11
  %575 = zext i8 %574 to i64
  %576 = shl nuw nsw i64 %575, 32
  %577 = or i64 %572, %576
  %578 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 5
  %579 = load i8, i8 addrspace(4)* %578, align 1, !tbaa !11
  %580 = zext i8 %579 to i64
  %581 = shl nuw nsw i64 %580, 40
  %582 = or i64 %577, %581
  %583 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 6
  %584 = load i8, i8 addrspace(4)* %583, align 1, !tbaa !11
  %585 = zext i8 %584 to i64
  %586 = shl nuw nsw i64 %585, 48
  %587 = or i64 %582, %586
  %588 = getelementptr inbounds i8, i8 addrspace(4)* %549, i64 7
  %589 = load i8, i8 addrspace(4)* %588, align 1, !tbaa !11
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
  %600 = load i8, i8 addrspace(4)* %599, align 1, !tbaa !11
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
  %616 = load i8, i8 addrspace(4)* %609, align 1, !tbaa !11
  %617 = zext i8 %616 to i64
  %618 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 1
  %619 = load i8, i8 addrspace(4)* %618, align 1, !tbaa !11
  %620 = zext i8 %619 to i64
  %621 = shl nuw nsw i64 %620, 8
  %622 = or i64 %621, %617
  %623 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 2
  %624 = load i8, i8 addrspace(4)* %623, align 1, !tbaa !11
  %625 = zext i8 %624 to i64
  %626 = shl nuw nsw i64 %625, 16
  %627 = or i64 %622, %626
  %628 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 3
  %629 = load i8, i8 addrspace(4)* %628, align 1, !tbaa !11
  %630 = zext i8 %629 to i64
  %631 = shl nuw nsw i64 %630, 24
  %632 = or i64 %627, %631
  %633 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 4
  %634 = load i8, i8 addrspace(4)* %633, align 1, !tbaa !11
  %635 = zext i8 %634 to i64
  %636 = shl nuw nsw i64 %635, 32
  %637 = or i64 %632, %636
  %638 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 5
  %639 = load i8, i8 addrspace(4)* %638, align 1, !tbaa !11
  %640 = zext i8 %639 to i64
  %641 = shl nuw nsw i64 %640, 40
  %642 = or i64 %637, %641
  %643 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 6
  %644 = load i8, i8 addrspace(4)* %643, align 1, !tbaa !11
  %645 = zext i8 %644 to i64
  %646 = shl nuw nsw i64 %645, 48
  %647 = or i64 %642, %646
  %648 = getelementptr inbounds i8, i8 addrspace(4)* %609, i64 7
  %649 = load i8, i8 addrspace(4)* %648, align 1, !tbaa !11
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
  %660 = load i8, i8 addrspace(4)* %659, align 1, !tbaa !11
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
  %676 = load i8, i8 addrspace(4)* %669, align 1, !tbaa !11
  %677 = zext i8 %676 to i64
  %678 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 1
  %679 = load i8, i8 addrspace(4)* %678, align 1, !tbaa !11
  %680 = zext i8 %679 to i64
  %681 = shl nuw nsw i64 %680, 8
  %682 = or i64 %681, %677
  %683 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 2
  %684 = load i8, i8 addrspace(4)* %683, align 1, !tbaa !11
  %685 = zext i8 %684 to i64
  %686 = shl nuw nsw i64 %685, 16
  %687 = or i64 %682, %686
  %688 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 3
  %689 = load i8, i8 addrspace(4)* %688, align 1, !tbaa !11
  %690 = zext i8 %689 to i64
  %691 = shl nuw nsw i64 %690, 24
  %692 = or i64 %687, %691
  %693 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 4
  %694 = load i8, i8 addrspace(4)* %693, align 1, !tbaa !11
  %695 = zext i8 %694 to i64
  %696 = shl nuw nsw i64 %695, 32
  %697 = or i64 %692, %696
  %698 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 5
  %699 = load i8, i8 addrspace(4)* %698, align 1, !tbaa !11
  %700 = zext i8 %699 to i64
  %701 = shl nuw nsw i64 %700, 40
  %702 = or i64 %697, %701
  %703 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 6
  %704 = load i8, i8 addrspace(4)* %703, align 1, !tbaa !11
  %705 = zext i8 %704 to i64
  %706 = shl nuw nsw i64 %705, 48
  %707 = or i64 %702, %706
  %708 = getelementptr inbounds i8, i8 addrspace(4)* %669, i64 7
  %709 = load i8, i8 addrspace(4)* %708, align 1, !tbaa !11
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
  %720 = load i8, i8 addrspace(4)* %719, align 1, !tbaa !11
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
  %736 = load i8, i8 addrspace(4)* %729, align 1, !tbaa !11
  %737 = zext i8 %736 to i64
  %738 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 1
  %739 = load i8, i8 addrspace(4)* %738, align 1, !tbaa !11
  %740 = zext i8 %739 to i64
  %741 = shl nuw nsw i64 %740, 8
  %742 = or i64 %741, %737
  %743 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 2
  %744 = load i8, i8 addrspace(4)* %743, align 1, !tbaa !11
  %745 = zext i8 %744 to i64
  %746 = shl nuw nsw i64 %745, 16
  %747 = or i64 %742, %746
  %748 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 3
  %749 = load i8, i8 addrspace(4)* %748, align 1, !tbaa !11
  %750 = zext i8 %749 to i64
  %751 = shl nuw nsw i64 %750, 24
  %752 = or i64 %747, %751
  %753 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 4
  %754 = load i8, i8 addrspace(4)* %753, align 1, !tbaa !11
  %755 = zext i8 %754 to i64
  %756 = shl nuw nsw i64 %755, 32
  %757 = or i64 %752, %756
  %758 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 5
  %759 = load i8, i8 addrspace(4)* %758, align 1, !tbaa !11
  %760 = zext i8 %759 to i64
  %761 = shl nuw nsw i64 %760, 40
  %762 = or i64 %757, %761
  %763 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 6
  %764 = load i8, i8 addrspace(4)* %763, align 1, !tbaa !11
  %765 = zext i8 %764 to i64
  %766 = shl nuw nsw i64 %765, 48
  %767 = or i64 %762, %766
  %768 = getelementptr inbounds i8, i8 addrspace(4)* %729, i64 7
  %769 = load i8, i8 addrspace(4)* %768, align 1, !tbaa !11
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
  %780 = load i8, i8 addrspace(4)* %779, align 1, !tbaa !11
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
  %796 = load i8, i8 addrspace(4)* %789, align 1, !tbaa !11
  %797 = zext i8 %796 to i64
  %798 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 1
  %799 = load i8, i8 addrspace(4)* %798, align 1, !tbaa !11
  %800 = zext i8 %799 to i64
  %801 = shl nuw nsw i64 %800, 8
  %802 = or i64 %801, %797
  %803 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 2
  %804 = load i8, i8 addrspace(4)* %803, align 1, !tbaa !11
  %805 = zext i8 %804 to i64
  %806 = shl nuw nsw i64 %805, 16
  %807 = or i64 %802, %806
  %808 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 3
  %809 = load i8, i8 addrspace(4)* %808, align 1, !tbaa !11
  %810 = zext i8 %809 to i64
  %811 = shl nuw nsw i64 %810, 24
  %812 = or i64 %807, %811
  %813 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 4
  %814 = load i8, i8 addrspace(4)* %813, align 1, !tbaa !11
  %815 = zext i8 %814 to i64
  %816 = shl nuw nsw i64 %815, 32
  %817 = or i64 %812, %816
  %818 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 5
  %819 = load i8, i8 addrspace(4)* %818, align 1, !tbaa !11
  %820 = zext i8 %819 to i64
  %821 = shl nuw nsw i64 %820, 40
  %822 = or i64 %817, %821
  %823 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 6
  %824 = load i8, i8 addrspace(4)* %823, align 1, !tbaa !11
  %825 = zext i8 %824 to i64
  %826 = shl nuw nsw i64 %825, 48
  %827 = or i64 %822, %826
  %828 = getelementptr inbounds i8, i8 addrspace(4)* %789, i64 7
  %829 = load i8, i8 addrspace(4)* %828, align 1, !tbaa !11
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
  %840 = load i8, i8 addrspace(4)* %839, align 1, !tbaa !11
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
  %856 = load i8, i8 addrspace(4)* %849, align 1, !tbaa !11
  %857 = zext i8 %856 to i64
  %858 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 1
  %859 = load i8, i8 addrspace(4)* %858, align 1, !tbaa !11
  %860 = zext i8 %859 to i64
  %861 = shl nuw nsw i64 %860, 8
  %862 = or i64 %861, %857
  %863 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 2
  %864 = load i8, i8 addrspace(4)* %863, align 1, !tbaa !11
  %865 = zext i8 %864 to i64
  %866 = shl nuw nsw i64 %865, 16
  %867 = or i64 %862, %866
  %868 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 3
  %869 = load i8, i8 addrspace(4)* %868, align 1, !tbaa !11
  %870 = zext i8 %869 to i64
  %871 = shl nuw nsw i64 %870, 24
  %872 = or i64 %867, %871
  %873 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 4
  %874 = load i8, i8 addrspace(4)* %873, align 1, !tbaa !11
  %875 = zext i8 %874 to i64
  %876 = shl nuw nsw i64 %875, 32
  %877 = or i64 %872, %876
  %878 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 5
  %879 = load i8, i8 addrspace(4)* %878, align 1, !tbaa !11
  %880 = zext i8 %879 to i64
  %881 = shl nuw nsw i64 %880, 40
  %882 = or i64 %877, %881
  %883 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 6
  %884 = load i8, i8 addrspace(4)* %883, align 1, !tbaa !11
  %885 = zext i8 %884 to i64
  %886 = shl nuw nsw i64 %885, 48
  %887 = or i64 %882, %886
  %888 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 7
  %889 = load i8, i8 addrspace(4)* %888, align 1, !tbaa !11
  %890 = zext i8 %889 to i64
  %891 = shl nuw i64 %890, 56
  %892 = or i64 %887, %891
  br label %906

893:                                              ; preds = %853, %893
  %894 = phi i32 [ %904, %893 ], [ 0, %853 ]
  %895 = phi i64 [ %903, %893 ], [ 0, %853 ]
  %896 = zext i32 %894 to i64
  %897 = getelementptr inbounds i8, i8 addrspace(4)* %849, i64 %896
  %898 = load i8, i8 addrspace(4)* %897, align 1, !tbaa !11
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
  %913 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %912, i64 noundef %551, i64 noundef %611, i64 noundef %671, i64 noundef %731, i64 noundef %791, i64 noundef %851, i64 noundef %907) #10
  %914 = sub i64 %481, %489
  %915 = getelementptr inbounds i8, i8 addrspace(4)* %482, i64 %489
  %916 = icmp eq i64 %914, 0
  br i1 %916, label %917, label %480

917:                                              ; preds = %906, %472
  %918 = phi <2 x i64> [ %475, %472 ], [ %913, %906 ]
  %919 = extractelement <2 x i64> %918, i64 0
  %920 = and i64 %919, -227
  %921 = or i64 %920, 34
  %922 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %15, i64 noundef %921, i64 noundef 10, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
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
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !7
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !7
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !7
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !7
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !7
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !7
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !7
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !7
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !7
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !7
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !7
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !7
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !9, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !9, i64 0}
!18 = !{i64 2662}
!19 = !{!20, !15, i64 0}
!20 = !{!"", !15, i64 0, !15, i64 8, !21, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!21 = !{!"hsa_signal_s", !8, i64 0}
!22 = !{!20, !8, i64 40}
!23 = !{!20, !15, i64 8}
!24 = !{!"exec"}
!25 = !{!26, !17, i64 16}
!26 = !{!"", !8, i64 0, !8, i64 8, !17, i64 16, !17, i64 20}
!27 = !{!26, !8, i64 8}
!28 = !{!26, !17, i64 20}
!29 = !{!26, !8, i64 0}
!30 = !{!31, !8, i64 16}
!31 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !17, i64 24, !17, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!32 = !{!31, !17, i64 24}
