; ModuleID = '../data/hip_kernels/13949/5/main.cu'
source_filename = "../data/hip_kernels/13949/5/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [24 x i8] c"G[%d] B[%d][%d]  t[%d]\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9addKernelPiPKiS1_(i32 addrspace(1)* nocapture readnone %0, i32 addrspace(1)* nocapture readnone %1, i32 addrspace(1)* nocapture readnone %2) local_unnamed_addr #1 {
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = udiv i32 %11, %8
  %13 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 24
  %15 = bitcast i8 addrspace(4)* %14 to i64 addrspace(4)*
  %16 = load i64, i64 addrspace(4)* %15, align 8, !tbaa !15
  %17 = inttoptr i64 %16 to i8 addrspace(1)*
  %18 = addrspacecast i8 addrspace(1)* %17 to i8*
  %19 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %20 = extractelement <2 x i64> %19, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %21, label %25

21:                                               ; preds = %3
  %22 = and i64 %20, -225
  %23 = or i64 %22, 32
  %24 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %23, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %466

25:                                               ; preds = %3
  %26 = and i64 %20, 2
  %27 = and i64 %20, -3
  %28 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %27, i64 0
  br label %29

29:                                               ; preds = %455, %25
  %30 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str to [24 x i8]*) to i64)), i64 1))), %25 ], [ %463, %455 ]
  %31 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0), %25 ], [ %464, %455 ]
  %32 = phi <2 x i64> [ %28, %25 ], [ %462, %455 ]
  %33 = icmp ugt i64 %30, 56
  %34 = extractelement <2 x i64> %32, i64 0
  %35 = or i64 %34, %26
  %36 = insertelement <2 x i64> poison, i64 %35, i64 0
  %37 = select i1 %33, <2 x i64> %32, <2 x i64> %36
  %38 = tail call i64 @llvm.umin.i64(i64 %30, i64 56)
  %39 = trunc i64 %38 to i32
  %40 = extractelement <2 x i64> %37, i64 0
  %41 = icmp ugt i32 %39, 7
  br i1 %41, label %44, label %42

42:                                               ; preds = %29
  %43 = icmp eq i32 %39, 0
  br i1 %43, label %97, label %84

44:                                               ; preds = %29
  %45 = load i8, i8 addrspace(4)* %31, align 1, !tbaa !16
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 1
  %48 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !16
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 8
  %51 = or i64 %50, %46
  %52 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 2
  %53 = load i8, i8 addrspace(4)* %52, align 1, !tbaa !16
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 16
  %56 = or i64 %51, %55
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 3
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !16
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 24
  %61 = or i64 %56, %60
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 4
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !16
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 32
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 5
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !16
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 40
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 6
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !16
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 48
  %76 = or i64 %71, %75
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 7
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !16
  %79 = zext i8 %78 to i64
  %80 = shl nuw i64 %79, 56
  %81 = or i64 %76, %80
  %82 = add nsw i32 %39, -8
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 8
  br label %97

84:                                               ; preds = %42, %84
  %85 = phi i32 [ %95, %84 ], [ 0, %42 ]
  %86 = phi i64 [ %94, %84 ], [ 0, %42 ]
  %87 = zext i32 %85 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 %87
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !16
  %90 = zext i8 %89 to i64
  %91 = shl i32 %85, 3
  %92 = zext i32 %91 to i64
  %93 = shl nuw i64 %90, %92
  %94 = or i64 %93, %86
  %95 = add nuw nsw i32 %85, 1
  %96 = icmp eq i32 %95, %39
  br i1 %96, label %97, label %84, !llvm.loop !17

97:                                               ; preds = %84, %44, %42
  %98 = phi i8 addrspace(4)* [ %83, %44 ], [ %31, %42 ], [ %31, %84 ]
  %99 = phi i32 [ %82, %44 ], [ 0, %42 ], [ 0, %84 ]
  %100 = phi i64 [ %81, %44 ], [ 0, %42 ], [ %94, %84 ]
  %101 = icmp ugt i32 %99, 7
  br i1 %101, label %104, label %102

102:                                              ; preds = %97
  %103 = icmp eq i32 %99, 0
  br i1 %103, label %157, label %144

104:                                              ; preds = %97
  %105 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !16
  %106 = zext i8 %105 to i64
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 1
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !16
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 8
  %111 = or i64 %110, %106
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 2
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !16
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 16
  %116 = or i64 %111, %115
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 3
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !16
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 24
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 4
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !16
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 32
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 5
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !16
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 40
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 6
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !16
  %134 = zext i8 %133 to i64
  %135 = shl nuw nsw i64 %134, 48
  %136 = or i64 %131, %135
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 7
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !16
  %139 = zext i8 %138 to i64
  %140 = shl nuw i64 %139, 56
  %141 = or i64 %136, %140
  %142 = add nsw i32 %99, -8
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 8
  br label %157

144:                                              ; preds = %102, %144
  %145 = phi i32 [ %155, %144 ], [ 0, %102 ]
  %146 = phi i64 [ %154, %144 ], [ 0, %102 ]
  %147 = zext i32 %145 to i64
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %98, i64 %147
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !16
  %150 = zext i8 %149 to i64
  %151 = shl i32 %145, 3
  %152 = zext i32 %151 to i64
  %153 = shl nuw i64 %150, %152
  %154 = or i64 %153, %146
  %155 = add nuw nsw i32 %145, 1
  %156 = icmp eq i32 %155, %99
  br i1 %156, label %157, label %144

157:                                              ; preds = %144, %104, %102
  %158 = phi i8 addrspace(4)* [ %143, %104 ], [ %98, %102 ], [ %98, %144 ]
  %159 = phi i32 [ %142, %104 ], [ 0, %102 ], [ 0, %144 ]
  %160 = phi i64 [ %141, %104 ], [ 0, %102 ], [ %154, %144 ]
  %161 = icmp ugt i32 %159, 7
  br i1 %161, label %164, label %162

162:                                              ; preds = %157
  %163 = icmp eq i32 %159, 0
  br i1 %163, label %217, label %204

164:                                              ; preds = %157
  %165 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !16
  %166 = zext i8 %165 to i64
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 1
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !16
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 8
  %171 = or i64 %170, %166
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 2
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !16
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 16
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 3
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !16
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 24
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 4
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !16
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 32
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 5
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !16
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 40
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 6
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !16
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 48
  %196 = or i64 %191, %195
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 7
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !16
  %199 = zext i8 %198 to i64
  %200 = shl nuw i64 %199, 56
  %201 = or i64 %196, %200
  %202 = add nsw i32 %159, -8
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 8
  br label %217

204:                                              ; preds = %162, %204
  %205 = phi i32 [ %215, %204 ], [ 0, %162 ]
  %206 = phi i64 [ %214, %204 ], [ 0, %162 ]
  %207 = zext i32 %205 to i64
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %158, i64 %207
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !16
  %210 = zext i8 %209 to i64
  %211 = shl i32 %205, 3
  %212 = zext i32 %211 to i64
  %213 = shl nuw i64 %210, %212
  %214 = or i64 %213, %206
  %215 = add nuw nsw i32 %205, 1
  %216 = icmp eq i32 %215, %159
  br i1 %216, label %217, label %204

217:                                              ; preds = %204, %164, %162
  %218 = phi i8 addrspace(4)* [ %203, %164 ], [ %158, %162 ], [ %158, %204 ]
  %219 = phi i32 [ %202, %164 ], [ 0, %162 ], [ 0, %204 ]
  %220 = phi i64 [ %201, %164 ], [ 0, %162 ], [ %214, %204 ]
  %221 = icmp ugt i32 %219, 7
  br i1 %221, label %224, label %222

222:                                              ; preds = %217
  %223 = icmp eq i32 %219, 0
  br i1 %223, label %277, label %264

224:                                              ; preds = %217
  %225 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !16
  %226 = zext i8 %225 to i64
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 1
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !16
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 8
  %231 = or i64 %230, %226
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 2
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !16
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 16
  %236 = or i64 %231, %235
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 3
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !16
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 24
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 4
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !16
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 32
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 5
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !16
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 40
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 6
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !16
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 48
  %256 = or i64 %251, %255
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 7
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !16
  %259 = zext i8 %258 to i64
  %260 = shl nuw i64 %259, 56
  %261 = or i64 %256, %260
  %262 = add nsw i32 %219, -8
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 8
  br label %277

264:                                              ; preds = %222, %264
  %265 = phi i32 [ %275, %264 ], [ 0, %222 ]
  %266 = phi i64 [ %274, %264 ], [ 0, %222 ]
  %267 = zext i32 %265 to i64
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %218, i64 %267
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !16
  %270 = zext i8 %269 to i64
  %271 = shl i32 %265, 3
  %272 = zext i32 %271 to i64
  %273 = shl nuw i64 %270, %272
  %274 = or i64 %273, %266
  %275 = add nuw nsw i32 %265, 1
  %276 = icmp eq i32 %275, %219
  br i1 %276, label %277, label %264

277:                                              ; preds = %264, %224, %222
  %278 = phi i8 addrspace(4)* [ %263, %224 ], [ %218, %222 ], [ %218, %264 ]
  %279 = phi i32 [ %262, %224 ], [ 0, %222 ], [ 0, %264 ]
  %280 = phi i64 [ %261, %224 ], [ 0, %222 ], [ %274, %264 ]
  %281 = icmp ugt i32 %279, 7
  br i1 %281, label %284, label %282

282:                                              ; preds = %277
  %283 = icmp eq i32 %279, 0
  br i1 %283, label %337, label %324

284:                                              ; preds = %277
  %285 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !16
  %286 = zext i8 %285 to i64
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 1
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !16
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 8
  %291 = or i64 %290, %286
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 2
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !16
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 16
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 3
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !16
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 24
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 4
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !16
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 32
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 5
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !16
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 40
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 6
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !16
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 48
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 7
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !16
  %319 = zext i8 %318 to i64
  %320 = shl nuw i64 %319, 56
  %321 = or i64 %316, %320
  %322 = add nsw i32 %279, -8
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 8
  br label %337

324:                                              ; preds = %282, %324
  %325 = phi i32 [ %335, %324 ], [ 0, %282 ]
  %326 = phi i64 [ %334, %324 ], [ 0, %282 ]
  %327 = zext i32 %325 to i64
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %278, i64 %327
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !16
  %330 = zext i8 %329 to i64
  %331 = shl i32 %325, 3
  %332 = zext i32 %331 to i64
  %333 = shl nuw i64 %330, %332
  %334 = or i64 %333, %326
  %335 = add nuw nsw i32 %325, 1
  %336 = icmp eq i32 %335, %279
  br i1 %336, label %337, label %324

337:                                              ; preds = %324, %284, %282
  %338 = phi i8 addrspace(4)* [ %323, %284 ], [ %278, %282 ], [ %278, %324 ]
  %339 = phi i32 [ %322, %284 ], [ 0, %282 ], [ 0, %324 ]
  %340 = phi i64 [ %321, %284 ], [ 0, %282 ], [ %334, %324 ]
  %341 = icmp ugt i32 %339, 7
  br i1 %341, label %344, label %342

342:                                              ; preds = %337
  %343 = icmp eq i32 %339, 0
  br i1 %343, label %397, label %384

344:                                              ; preds = %337
  %345 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !16
  %346 = zext i8 %345 to i64
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 1
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !16
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 8
  %351 = or i64 %350, %346
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 2
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !16
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 16
  %356 = or i64 %351, %355
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 3
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !16
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 24
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 4
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !16
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 32
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 5
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !16
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 40
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 6
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !16
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 48
  %376 = or i64 %371, %375
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 7
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !16
  %379 = zext i8 %378 to i64
  %380 = shl nuw i64 %379, 56
  %381 = or i64 %376, %380
  %382 = add nsw i32 %339, -8
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 8
  br label %397

384:                                              ; preds = %342, %384
  %385 = phi i32 [ %395, %384 ], [ 0, %342 ]
  %386 = phi i64 [ %394, %384 ], [ 0, %342 ]
  %387 = zext i32 %385 to i64
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %338, i64 %387
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !16
  %390 = zext i8 %389 to i64
  %391 = shl i32 %385, 3
  %392 = zext i32 %391 to i64
  %393 = shl nuw i64 %390, %392
  %394 = or i64 %393, %386
  %395 = add nuw nsw i32 %385, 1
  %396 = icmp eq i32 %395, %339
  br i1 %396, label %397, label %384

397:                                              ; preds = %384, %344, %342
  %398 = phi i8 addrspace(4)* [ %383, %344 ], [ %338, %342 ], [ %338, %384 ]
  %399 = phi i32 [ %382, %344 ], [ 0, %342 ], [ 0, %384 ]
  %400 = phi i64 [ %381, %344 ], [ 0, %342 ], [ %394, %384 ]
  %401 = icmp ugt i32 %399, 7
  br i1 %401, label %404, label %402

402:                                              ; preds = %397
  %403 = icmp eq i32 %399, 0
  br i1 %403, label %455, label %442

404:                                              ; preds = %397
  %405 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !16
  %406 = zext i8 %405 to i64
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 1
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !16
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 8
  %411 = or i64 %410, %406
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 2
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !16
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 16
  %416 = or i64 %411, %415
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 3
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !16
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 24
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 4
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !16
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 32
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 5
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !16
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 40
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 6
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !16
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 48
  %436 = or i64 %431, %435
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 7
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !16
  %439 = zext i8 %438 to i64
  %440 = shl nuw i64 %439, 56
  %441 = or i64 %436, %440
  br label %455

442:                                              ; preds = %402, %442
  %443 = phi i32 [ %453, %442 ], [ 0, %402 ]
  %444 = phi i64 [ %452, %442 ], [ 0, %402 ]
  %445 = zext i32 %443 to i64
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %398, i64 %445
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !16
  %448 = zext i8 %447 to i64
  %449 = shl i32 %443, 3
  %450 = zext i32 %449 to i64
  %451 = shl nuw i64 %448, %450
  %452 = or i64 %451, %444
  %453 = add nuw nsw i32 %443, 1
  %454 = icmp eq i32 %453, %399
  br i1 %454, label %455, label %442

455:                                              ; preds = %442, %404, %402
  %456 = phi i64 [ %441, %404 ], [ 0, %402 ], [ %452, %442 ]
  %457 = shl nuw nsw i64 %38, 2
  %458 = add nuw nsw i64 %457, 28
  %459 = and i64 %458, 480
  %460 = and i64 %40, -225
  %461 = or i64 %460, %459
  %462 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %461, i64 noundef %100, i64 noundef %160, i64 noundef %220, i64 noundef %280, i64 noundef %340, i64 noundef %400, i64 noundef %456) #11
  %463 = sub i64 %30, %38
  %464 = getelementptr inbounds i8, i8 addrspace(4)* %31, i64 %38
  %465 = icmp eq i64 %463, 0
  br i1 %465, label %466, label %29

466:                                              ; preds = %455, %21
  %467 = phi <2 x i64> [ %24, %21 ], [ %462, %455 ]
  %468 = mul i32 %12, %8
  %469 = icmp ugt i32 %11, %468
  %470 = zext i1 %469 to i32
  %471 = add i32 %12, %470
  %472 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %473 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %474 = extractelement <2 x i64> %467, i64 0
  %475 = zext i32 %471 to i64
  %476 = and i64 %474, -225
  %477 = or i64 %476, 32
  %478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %477, i64 noundef %475, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %479 = extractelement <2 x i64> %478, i64 0
  %480 = zext i16 %7 to i64
  %481 = and i64 %479, -225
  %482 = or i64 %481, 32
  %483 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %482, i64 noundef %480, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %484 = extractelement <2 x i64> %483, i64 0
  %485 = zext i32 %472 to i64
  %486 = and i64 %484, -225
  %487 = or i64 %486, 32
  %488 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %487, i64 noundef %485, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %489 = extractelement <2 x i64> %488, i64 0
  %490 = zext i32 %473 to i64
  %491 = and i64 %489, -227
  %492 = or i64 %491, 34
  %493 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %18, i64 noundef %492, i64 noundef %490, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
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
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !21
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !15
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !15
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !15
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !15
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !15
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !15
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !15
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !15
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !21
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !21
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !21
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !15
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !25
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !26
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !25
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !21
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !15
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !15
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !15
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !15
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !15
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !15
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !15
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !15
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %110 = call i64 @llvm.read_register.i64(metadata !27) #12
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !15
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !15
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !15
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !15
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !15
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !15
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !15
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !15
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !15
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !15
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !16
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !23
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !16
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

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
!15 = !{!12, !12, i64 0}
!16 = !{!9, !9, i64 0}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = !{i32 0, i32 1024}
!20 = !{!13, !13, i64 0}
!21 = !{!11, !11, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !13, i64 0}
!24 = !{!"", !13, i64 0, !13, i64 8, !14, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!25 = !{!24, !12, i64 40}
!26 = !{!24, !13, i64 8}
!27 = !{!"exec"}
!28 = !{!29, !11, i64 16}
!29 = !{!"", !12, i64 0, !12, i64 8, !11, i64 16, !11, i64 20}
!30 = !{!29, !12, i64 8}
!31 = !{!29, !11, i64 20}
!32 = !{!29, !12, i64 0}
!33 = !{!34, !12, i64 16}
!34 = !{!"amd_signal_s", !12, i64 0, !9, i64 8, !12, i64 16, !11, i64 24, !11, i64 28, !12, i64 32, !12, i64 40, !9, i64 48, !9, i64 56}
!35 = !{!34, !11, i64 24}
