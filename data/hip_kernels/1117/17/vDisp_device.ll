; ModuleID = '../data/hip_kernels/1117/17/main.cu'
source_filename = "../data/hip_kernels/1117/17/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [19 x i8] c"idx = %d, ds = %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [23 x i8] c"Device: [%d], \09%f\09%f \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z5vDispPKfS0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 1
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %5, %6
  %8 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 24
  %10 = bitcast i8 addrspace(4)* %9 to i64 addrspace(4)*
  %11 = load i64, i64 addrspace(4)* %10, align 8, !tbaa !5
  %12 = inttoptr i64 %11 to i8 addrspace(1)*
  %13 = addrspacecast i8 addrspace(1)* %12 to i8*
  %14 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %15 = extractelement <2 x i64> %14, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %16, label %20

16:                                               ; preds = %3
  %17 = and i64 %15, -225
  %18 = or i64 %17, 32
  %19 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %18, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %461

20:                                               ; preds = %3
  %21 = and i64 %15, 2
  %22 = and i64 %15, -3
  %23 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %22, i64 0
  br label %24

24:                                               ; preds = %450, %20
  %25 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str, i64 0, i64 18) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([19 x i8]* addrspacecast ([19 x i8] addrspace(4)* @.str to [19 x i8]*) to i64)), i64 1))), %20 ], [ %458, %450 ]
  %26 = phi i8 addrspace(4)* [ getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str, i64 0, i64 0), %20 ], [ %459, %450 ]
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
  %40 = load i8, i8 addrspace(4)* %26, align 1, !tbaa !9
  %41 = zext i8 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 1
  %43 = load i8, i8 addrspace(4)* %42, align 1, !tbaa !9
  %44 = zext i8 %43 to i64
  %45 = shl nuw nsw i64 %44, 8
  %46 = or i64 %45, %41
  %47 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 2
  %48 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !9
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 16
  %51 = or i64 %46, %50
  %52 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 3
  %53 = load i8, i8 addrspace(4)* %52, align 1, !tbaa !9
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 24
  %56 = or i64 %51, %55
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 4
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !9
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 32
  %61 = or i64 %56, %60
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 5
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !9
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 40
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 6
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !9
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 48
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 7
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !9
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
  %84 = load i8, i8 addrspace(4)* %83, align 1, !tbaa !9
  %85 = zext i8 %84 to i64
  %86 = shl i32 %80, 3
  %87 = zext i32 %86 to i64
  %88 = shl nuw i64 %85, %87
  %89 = or i64 %88, %81
  %90 = add nuw nsw i32 %80, 1
  %91 = icmp eq i32 %90, %34
  br i1 %91, label %92, label %79, !llvm.loop !10

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
  %100 = load i8, i8 addrspace(4)* %93, align 1, !tbaa !9
  %101 = zext i8 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 1
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !9
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 8
  %106 = or i64 %105, %101
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 2
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !9
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 16
  %111 = or i64 %106, %110
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 3
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !9
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 24
  %116 = or i64 %111, %115
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 4
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !9
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 32
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 5
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !9
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 40
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 6
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !9
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 48
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %93, i64 7
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !9
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
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !9
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
  %160 = load i8, i8 addrspace(4)* %153, align 1, !tbaa !9
  %161 = zext i8 %160 to i64
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 1
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !9
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 8
  %166 = or i64 %165, %161
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 2
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !9
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 16
  %171 = or i64 %166, %170
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 3
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !9
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 24
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 4
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !9
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 32
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 5
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !9
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 40
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 6
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !9
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 48
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %153, i64 7
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !9
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
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !9
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
  %220 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !9
  %221 = zext i8 %220 to i64
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 1
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !9
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 8
  %226 = or i64 %225, %221
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 2
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !9
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 16
  %231 = or i64 %226, %230
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 3
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !9
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 24
  %236 = or i64 %231, %235
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 4
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !9
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 32
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 5
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !9
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 40
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 6
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !9
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 48
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %213, i64 7
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !9
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
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !9
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
  %280 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !9
  %281 = zext i8 %280 to i64
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 1
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !9
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 8
  %286 = or i64 %285, %281
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 2
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !9
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 16
  %291 = or i64 %286, %290
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 3
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !9
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 24
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 4
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !9
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 32
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 5
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !9
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 40
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 6
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !9
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 48
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %273, i64 7
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !9
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
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !9
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
  %340 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !9
  %341 = zext i8 %340 to i64
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 1
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !9
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 8
  %346 = or i64 %345, %341
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 2
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !9
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 16
  %351 = or i64 %346, %350
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 3
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !9
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 24
  %356 = or i64 %351, %355
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 4
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !9
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 32
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 5
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !9
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 40
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 6
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !9
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 48
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %333, i64 7
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !9
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
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !9
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
  %400 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !9
  %401 = zext i8 %400 to i64
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 1
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !9
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 8
  %406 = or i64 %405, %401
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 2
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !9
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 16
  %411 = or i64 %406, %410
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 3
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !9
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 24
  %416 = or i64 %411, %415
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 4
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !9
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 32
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 5
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !9
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 40
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 6
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !9
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 48
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 7
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !9
  %434 = zext i8 %433 to i64
  %435 = shl nuw i64 %434, 56
  %436 = or i64 %431, %435
  br label %450

437:                                              ; preds = %397, %437
  %438 = phi i32 [ %448, %437 ], [ 0, %397 ]
  %439 = phi i64 [ %447, %437 ], [ 0, %397 ]
  %440 = zext i32 %438 to i64
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %393, i64 %440
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !9
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
  %463 = extractelement <2 x i64> %462, i64 0
  %464 = zext i32 %7 to i64
  %465 = and i64 %463, -225
  %466 = or i64 %465, 32
  %467 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %466, i64 noundef %464, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %468 = extractelement <2 x i64> %467, i64 0
  %469 = zext i32 %2 to i64
  %470 = and i64 %468, -227
  %471 = or i64 %470, 34
  %472 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %471, i64 noundef %469, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %473 = icmp slt i32 %7, %2
  br i1 %473, label %474, label %945

474:                                              ; preds = %461
  %475 = sext i32 %7 to i64
  %476 = getelementptr inbounds float, float addrspace(1)* %0, i64 %475
  %477 = load float, float addrspace(1)* %476, align 4, !tbaa !12
  %478 = fpext float %477 to double
  %479 = getelementptr inbounds float, float addrspace(1)* %1, i64 %475
  %480 = load float, float addrspace(1)* %479, align 4, !tbaa !12
  %481 = fpext float %480 to double
  %482 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %483 = extractelement <2 x i64> %482, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %484, label %488

484:                                              ; preds = %474
  %485 = and i64 %483, -225
  %486 = or i64 %485, 32
  %487 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %486, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %929

488:                                              ; preds = %474
  %489 = and i64 %483, 2
  %490 = and i64 %483, -3
  %491 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %490, i64 0
  br label %492

492:                                              ; preds = %918, %488
  %493 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.1, i64 0, i64 22) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([23 x i8]* addrspacecast ([23 x i8] addrspace(4)* @.str.1 to [23 x i8]*) to i64)), i64 1))), %488 ], [ %926, %918 ]
  %494 = phi i8 addrspace(4)* [ getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %488 ], [ %927, %918 ]
  %495 = phi <2 x i64> [ %491, %488 ], [ %925, %918 ]
  %496 = icmp ugt i64 %493, 56
  %497 = extractelement <2 x i64> %495, i64 0
  %498 = or i64 %497, %489
  %499 = insertelement <2 x i64> poison, i64 %498, i64 0
  %500 = select i1 %496, <2 x i64> %495, <2 x i64> %499
  %501 = tail call i64 @llvm.umin.i64(i64 %493, i64 56)
  %502 = trunc i64 %501 to i32
  %503 = extractelement <2 x i64> %500, i64 0
  %504 = icmp ugt i32 %502, 7
  br i1 %504, label %507, label %505

505:                                              ; preds = %492
  %506 = icmp eq i32 %502, 0
  br i1 %506, label %560, label %547

507:                                              ; preds = %492
  %508 = load i8, i8 addrspace(4)* %494, align 1, !tbaa !9
  %509 = zext i8 %508 to i64
  %510 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 1
  %511 = load i8, i8 addrspace(4)* %510, align 1, !tbaa !9
  %512 = zext i8 %511 to i64
  %513 = shl nuw nsw i64 %512, 8
  %514 = or i64 %513, %509
  %515 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 2
  %516 = load i8, i8 addrspace(4)* %515, align 1, !tbaa !9
  %517 = zext i8 %516 to i64
  %518 = shl nuw nsw i64 %517, 16
  %519 = or i64 %514, %518
  %520 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 3
  %521 = load i8, i8 addrspace(4)* %520, align 1, !tbaa !9
  %522 = zext i8 %521 to i64
  %523 = shl nuw nsw i64 %522, 24
  %524 = or i64 %519, %523
  %525 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 4
  %526 = load i8, i8 addrspace(4)* %525, align 1, !tbaa !9
  %527 = zext i8 %526 to i64
  %528 = shl nuw nsw i64 %527, 32
  %529 = or i64 %524, %528
  %530 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 5
  %531 = load i8, i8 addrspace(4)* %530, align 1, !tbaa !9
  %532 = zext i8 %531 to i64
  %533 = shl nuw nsw i64 %532, 40
  %534 = or i64 %529, %533
  %535 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 6
  %536 = load i8, i8 addrspace(4)* %535, align 1, !tbaa !9
  %537 = zext i8 %536 to i64
  %538 = shl nuw nsw i64 %537, 48
  %539 = or i64 %534, %538
  %540 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 7
  %541 = load i8, i8 addrspace(4)* %540, align 1, !tbaa !9
  %542 = zext i8 %541 to i64
  %543 = shl nuw i64 %542, 56
  %544 = or i64 %539, %543
  %545 = add nsw i32 %502, -8
  %546 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 8
  br label %560

547:                                              ; preds = %505, %547
  %548 = phi i32 [ %558, %547 ], [ 0, %505 ]
  %549 = phi i64 [ %557, %547 ], [ 0, %505 ]
  %550 = zext i32 %548 to i64
  %551 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 %550
  %552 = load i8, i8 addrspace(4)* %551, align 1, !tbaa !9
  %553 = zext i8 %552 to i64
  %554 = shl i32 %548, 3
  %555 = zext i32 %554 to i64
  %556 = shl nuw i64 %553, %555
  %557 = or i64 %556, %549
  %558 = add nuw nsw i32 %548, 1
  %559 = icmp eq i32 %558, %502
  br i1 %559, label %560, label %547, !llvm.loop !10

560:                                              ; preds = %547, %507, %505
  %561 = phi i8 addrspace(4)* [ %546, %507 ], [ %494, %505 ], [ %494, %547 ]
  %562 = phi i32 [ %545, %507 ], [ 0, %505 ], [ 0, %547 ]
  %563 = phi i64 [ %544, %507 ], [ 0, %505 ], [ %557, %547 ]
  %564 = icmp ugt i32 %562, 7
  br i1 %564, label %567, label %565

565:                                              ; preds = %560
  %566 = icmp eq i32 %562, 0
  br i1 %566, label %620, label %607

567:                                              ; preds = %560
  %568 = load i8, i8 addrspace(4)* %561, align 1, !tbaa !9
  %569 = zext i8 %568 to i64
  %570 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 1
  %571 = load i8, i8 addrspace(4)* %570, align 1, !tbaa !9
  %572 = zext i8 %571 to i64
  %573 = shl nuw nsw i64 %572, 8
  %574 = or i64 %573, %569
  %575 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 2
  %576 = load i8, i8 addrspace(4)* %575, align 1, !tbaa !9
  %577 = zext i8 %576 to i64
  %578 = shl nuw nsw i64 %577, 16
  %579 = or i64 %574, %578
  %580 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 3
  %581 = load i8, i8 addrspace(4)* %580, align 1, !tbaa !9
  %582 = zext i8 %581 to i64
  %583 = shl nuw nsw i64 %582, 24
  %584 = or i64 %579, %583
  %585 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 4
  %586 = load i8, i8 addrspace(4)* %585, align 1, !tbaa !9
  %587 = zext i8 %586 to i64
  %588 = shl nuw nsw i64 %587, 32
  %589 = or i64 %584, %588
  %590 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 5
  %591 = load i8, i8 addrspace(4)* %590, align 1, !tbaa !9
  %592 = zext i8 %591 to i64
  %593 = shl nuw nsw i64 %592, 40
  %594 = or i64 %589, %593
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 6
  %596 = load i8, i8 addrspace(4)* %595, align 1, !tbaa !9
  %597 = zext i8 %596 to i64
  %598 = shl nuw nsw i64 %597, 48
  %599 = or i64 %594, %598
  %600 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 7
  %601 = load i8, i8 addrspace(4)* %600, align 1, !tbaa !9
  %602 = zext i8 %601 to i64
  %603 = shl nuw i64 %602, 56
  %604 = or i64 %599, %603
  %605 = add nsw i32 %562, -8
  %606 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 8
  br label %620

607:                                              ; preds = %565, %607
  %608 = phi i32 [ %618, %607 ], [ 0, %565 ]
  %609 = phi i64 [ %617, %607 ], [ 0, %565 ]
  %610 = zext i32 %608 to i64
  %611 = getelementptr inbounds i8, i8 addrspace(4)* %561, i64 %610
  %612 = load i8, i8 addrspace(4)* %611, align 1, !tbaa !9
  %613 = zext i8 %612 to i64
  %614 = shl i32 %608, 3
  %615 = zext i32 %614 to i64
  %616 = shl nuw i64 %613, %615
  %617 = or i64 %616, %609
  %618 = add nuw nsw i32 %608, 1
  %619 = icmp eq i32 %618, %562
  br i1 %619, label %620, label %607

620:                                              ; preds = %607, %567, %565
  %621 = phi i8 addrspace(4)* [ %606, %567 ], [ %561, %565 ], [ %561, %607 ]
  %622 = phi i32 [ %605, %567 ], [ 0, %565 ], [ 0, %607 ]
  %623 = phi i64 [ %604, %567 ], [ 0, %565 ], [ %617, %607 ]
  %624 = icmp ugt i32 %622, 7
  br i1 %624, label %627, label %625

625:                                              ; preds = %620
  %626 = icmp eq i32 %622, 0
  br i1 %626, label %680, label %667

627:                                              ; preds = %620
  %628 = load i8, i8 addrspace(4)* %621, align 1, !tbaa !9
  %629 = zext i8 %628 to i64
  %630 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 1
  %631 = load i8, i8 addrspace(4)* %630, align 1, !tbaa !9
  %632 = zext i8 %631 to i64
  %633 = shl nuw nsw i64 %632, 8
  %634 = or i64 %633, %629
  %635 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 2
  %636 = load i8, i8 addrspace(4)* %635, align 1, !tbaa !9
  %637 = zext i8 %636 to i64
  %638 = shl nuw nsw i64 %637, 16
  %639 = or i64 %634, %638
  %640 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 3
  %641 = load i8, i8 addrspace(4)* %640, align 1, !tbaa !9
  %642 = zext i8 %641 to i64
  %643 = shl nuw nsw i64 %642, 24
  %644 = or i64 %639, %643
  %645 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 4
  %646 = load i8, i8 addrspace(4)* %645, align 1, !tbaa !9
  %647 = zext i8 %646 to i64
  %648 = shl nuw nsw i64 %647, 32
  %649 = or i64 %644, %648
  %650 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 5
  %651 = load i8, i8 addrspace(4)* %650, align 1, !tbaa !9
  %652 = zext i8 %651 to i64
  %653 = shl nuw nsw i64 %652, 40
  %654 = or i64 %649, %653
  %655 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 6
  %656 = load i8, i8 addrspace(4)* %655, align 1, !tbaa !9
  %657 = zext i8 %656 to i64
  %658 = shl nuw nsw i64 %657, 48
  %659 = or i64 %654, %658
  %660 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 7
  %661 = load i8, i8 addrspace(4)* %660, align 1, !tbaa !9
  %662 = zext i8 %661 to i64
  %663 = shl nuw i64 %662, 56
  %664 = or i64 %659, %663
  %665 = add nsw i32 %622, -8
  %666 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 8
  br label %680

667:                                              ; preds = %625, %667
  %668 = phi i32 [ %678, %667 ], [ 0, %625 ]
  %669 = phi i64 [ %677, %667 ], [ 0, %625 ]
  %670 = zext i32 %668 to i64
  %671 = getelementptr inbounds i8, i8 addrspace(4)* %621, i64 %670
  %672 = load i8, i8 addrspace(4)* %671, align 1, !tbaa !9
  %673 = zext i8 %672 to i64
  %674 = shl i32 %668, 3
  %675 = zext i32 %674 to i64
  %676 = shl nuw i64 %673, %675
  %677 = or i64 %676, %669
  %678 = add nuw nsw i32 %668, 1
  %679 = icmp eq i32 %678, %622
  br i1 %679, label %680, label %667

680:                                              ; preds = %667, %627, %625
  %681 = phi i8 addrspace(4)* [ %666, %627 ], [ %621, %625 ], [ %621, %667 ]
  %682 = phi i32 [ %665, %627 ], [ 0, %625 ], [ 0, %667 ]
  %683 = phi i64 [ %664, %627 ], [ 0, %625 ], [ %677, %667 ]
  %684 = icmp ugt i32 %682, 7
  br i1 %684, label %687, label %685

685:                                              ; preds = %680
  %686 = icmp eq i32 %682, 0
  br i1 %686, label %740, label %727

687:                                              ; preds = %680
  %688 = load i8, i8 addrspace(4)* %681, align 1, !tbaa !9
  %689 = zext i8 %688 to i64
  %690 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 1
  %691 = load i8, i8 addrspace(4)* %690, align 1, !tbaa !9
  %692 = zext i8 %691 to i64
  %693 = shl nuw nsw i64 %692, 8
  %694 = or i64 %693, %689
  %695 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 2
  %696 = load i8, i8 addrspace(4)* %695, align 1, !tbaa !9
  %697 = zext i8 %696 to i64
  %698 = shl nuw nsw i64 %697, 16
  %699 = or i64 %694, %698
  %700 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 3
  %701 = load i8, i8 addrspace(4)* %700, align 1, !tbaa !9
  %702 = zext i8 %701 to i64
  %703 = shl nuw nsw i64 %702, 24
  %704 = or i64 %699, %703
  %705 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 4
  %706 = load i8, i8 addrspace(4)* %705, align 1, !tbaa !9
  %707 = zext i8 %706 to i64
  %708 = shl nuw nsw i64 %707, 32
  %709 = or i64 %704, %708
  %710 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 5
  %711 = load i8, i8 addrspace(4)* %710, align 1, !tbaa !9
  %712 = zext i8 %711 to i64
  %713 = shl nuw nsw i64 %712, 40
  %714 = or i64 %709, %713
  %715 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 6
  %716 = load i8, i8 addrspace(4)* %715, align 1, !tbaa !9
  %717 = zext i8 %716 to i64
  %718 = shl nuw nsw i64 %717, 48
  %719 = or i64 %714, %718
  %720 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 7
  %721 = load i8, i8 addrspace(4)* %720, align 1, !tbaa !9
  %722 = zext i8 %721 to i64
  %723 = shl nuw i64 %722, 56
  %724 = or i64 %719, %723
  %725 = add nsw i32 %682, -8
  %726 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 8
  br label %740

727:                                              ; preds = %685, %727
  %728 = phi i32 [ %738, %727 ], [ 0, %685 ]
  %729 = phi i64 [ %737, %727 ], [ 0, %685 ]
  %730 = zext i32 %728 to i64
  %731 = getelementptr inbounds i8, i8 addrspace(4)* %681, i64 %730
  %732 = load i8, i8 addrspace(4)* %731, align 1, !tbaa !9
  %733 = zext i8 %732 to i64
  %734 = shl i32 %728, 3
  %735 = zext i32 %734 to i64
  %736 = shl nuw i64 %733, %735
  %737 = or i64 %736, %729
  %738 = add nuw nsw i32 %728, 1
  %739 = icmp eq i32 %738, %682
  br i1 %739, label %740, label %727

740:                                              ; preds = %727, %687, %685
  %741 = phi i8 addrspace(4)* [ %726, %687 ], [ %681, %685 ], [ %681, %727 ]
  %742 = phi i32 [ %725, %687 ], [ 0, %685 ], [ 0, %727 ]
  %743 = phi i64 [ %724, %687 ], [ 0, %685 ], [ %737, %727 ]
  %744 = icmp ugt i32 %742, 7
  br i1 %744, label %747, label %745

745:                                              ; preds = %740
  %746 = icmp eq i32 %742, 0
  br i1 %746, label %800, label %787

747:                                              ; preds = %740
  %748 = load i8, i8 addrspace(4)* %741, align 1, !tbaa !9
  %749 = zext i8 %748 to i64
  %750 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 1
  %751 = load i8, i8 addrspace(4)* %750, align 1, !tbaa !9
  %752 = zext i8 %751 to i64
  %753 = shl nuw nsw i64 %752, 8
  %754 = or i64 %753, %749
  %755 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 2
  %756 = load i8, i8 addrspace(4)* %755, align 1, !tbaa !9
  %757 = zext i8 %756 to i64
  %758 = shl nuw nsw i64 %757, 16
  %759 = or i64 %754, %758
  %760 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 3
  %761 = load i8, i8 addrspace(4)* %760, align 1, !tbaa !9
  %762 = zext i8 %761 to i64
  %763 = shl nuw nsw i64 %762, 24
  %764 = or i64 %759, %763
  %765 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 4
  %766 = load i8, i8 addrspace(4)* %765, align 1, !tbaa !9
  %767 = zext i8 %766 to i64
  %768 = shl nuw nsw i64 %767, 32
  %769 = or i64 %764, %768
  %770 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 5
  %771 = load i8, i8 addrspace(4)* %770, align 1, !tbaa !9
  %772 = zext i8 %771 to i64
  %773 = shl nuw nsw i64 %772, 40
  %774 = or i64 %769, %773
  %775 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 6
  %776 = load i8, i8 addrspace(4)* %775, align 1, !tbaa !9
  %777 = zext i8 %776 to i64
  %778 = shl nuw nsw i64 %777, 48
  %779 = or i64 %774, %778
  %780 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 7
  %781 = load i8, i8 addrspace(4)* %780, align 1, !tbaa !9
  %782 = zext i8 %781 to i64
  %783 = shl nuw i64 %782, 56
  %784 = or i64 %779, %783
  %785 = add nsw i32 %742, -8
  %786 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 8
  br label %800

787:                                              ; preds = %745, %787
  %788 = phi i32 [ %798, %787 ], [ 0, %745 ]
  %789 = phi i64 [ %797, %787 ], [ 0, %745 ]
  %790 = zext i32 %788 to i64
  %791 = getelementptr inbounds i8, i8 addrspace(4)* %741, i64 %790
  %792 = load i8, i8 addrspace(4)* %791, align 1, !tbaa !9
  %793 = zext i8 %792 to i64
  %794 = shl i32 %788, 3
  %795 = zext i32 %794 to i64
  %796 = shl nuw i64 %793, %795
  %797 = or i64 %796, %789
  %798 = add nuw nsw i32 %788, 1
  %799 = icmp eq i32 %798, %742
  br i1 %799, label %800, label %787

800:                                              ; preds = %787, %747, %745
  %801 = phi i8 addrspace(4)* [ %786, %747 ], [ %741, %745 ], [ %741, %787 ]
  %802 = phi i32 [ %785, %747 ], [ 0, %745 ], [ 0, %787 ]
  %803 = phi i64 [ %784, %747 ], [ 0, %745 ], [ %797, %787 ]
  %804 = icmp ugt i32 %802, 7
  br i1 %804, label %807, label %805

805:                                              ; preds = %800
  %806 = icmp eq i32 %802, 0
  br i1 %806, label %860, label %847

807:                                              ; preds = %800
  %808 = load i8, i8 addrspace(4)* %801, align 1, !tbaa !9
  %809 = zext i8 %808 to i64
  %810 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 1
  %811 = load i8, i8 addrspace(4)* %810, align 1, !tbaa !9
  %812 = zext i8 %811 to i64
  %813 = shl nuw nsw i64 %812, 8
  %814 = or i64 %813, %809
  %815 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 2
  %816 = load i8, i8 addrspace(4)* %815, align 1, !tbaa !9
  %817 = zext i8 %816 to i64
  %818 = shl nuw nsw i64 %817, 16
  %819 = or i64 %814, %818
  %820 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 3
  %821 = load i8, i8 addrspace(4)* %820, align 1, !tbaa !9
  %822 = zext i8 %821 to i64
  %823 = shl nuw nsw i64 %822, 24
  %824 = or i64 %819, %823
  %825 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 4
  %826 = load i8, i8 addrspace(4)* %825, align 1, !tbaa !9
  %827 = zext i8 %826 to i64
  %828 = shl nuw nsw i64 %827, 32
  %829 = or i64 %824, %828
  %830 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 5
  %831 = load i8, i8 addrspace(4)* %830, align 1, !tbaa !9
  %832 = zext i8 %831 to i64
  %833 = shl nuw nsw i64 %832, 40
  %834 = or i64 %829, %833
  %835 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 6
  %836 = load i8, i8 addrspace(4)* %835, align 1, !tbaa !9
  %837 = zext i8 %836 to i64
  %838 = shl nuw nsw i64 %837, 48
  %839 = or i64 %834, %838
  %840 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 7
  %841 = load i8, i8 addrspace(4)* %840, align 1, !tbaa !9
  %842 = zext i8 %841 to i64
  %843 = shl nuw i64 %842, 56
  %844 = or i64 %839, %843
  %845 = add nsw i32 %802, -8
  %846 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 8
  br label %860

847:                                              ; preds = %805, %847
  %848 = phi i32 [ %858, %847 ], [ 0, %805 ]
  %849 = phi i64 [ %857, %847 ], [ 0, %805 ]
  %850 = zext i32 %848 to i64
  %851 = getelementptr inbounds i8, i8 addrspace(4)* %801, i64 %850
  %852 = load i8, i8 addrspace(4)* %851, align 1, !tbaa !9
  %853 = zext i8 %852 to i64
  %854 = shl i32 %848, 3
  %855 = zext i32 %854 to i64
  %856 = shl nuw i64 %853, %855
  %857 = or i64 %856, %849
  %858 = add nuw nsw i32 %848, 1
  %859 = icmp eq i32 %858, %802
  br i1 %859, label %860, label %847

860:                                              ; preds = %847, %807, %805
  %861 = phi i8 addrspace(4)* [ %846, %807 ], [ %801, %805 ], [ %801, %847 ]
  %862 = phi i32 [ %845, %807 ], [ 0, %805 ], [ 0, %847 ]
  %863 = phi i64 [ %844, %807 ], [ 0, %805 ], [ %857, %847 ]
  %864 = icmp ugt i32 %862, 7
  br i1 %864, label %867, label %865

865:                                              ; preds = %860
  %866 = icmp eq i32 %862, 0
  br i1 %866, label %918, label %905

867:                                              ; preds = %860
  %868 = load i8, i8 addrspace(4)* %861, align 1, !tbaa !9
  %869 = zext i8 %868 to i64
  %870 = getelementptr inbounds i8, i8 addrspace(4)* %861, i64 1
  %871 = load i8, i8 addrspace(4)* %870, align 1, !tbaa !9
  %872 = zext i8 %871 to i64
  %873 = shl nuw nsw i64 %872, 8
  %874 = or i64 %873, %869
  %875 = getelementptr inbounds i8, i8 addrspace(4)* %861, i64 2
  %876 = load i8, i8 addrspace(4)* %875, align 1, !tbaa !9
  %877 = zext i8 %876 to i64
  %878 = shl nuw nsw i64 %877, 16
  %879 = or i64 %874, %878
  %880 = getelementptr inbounds i8, i8 addrspace(4)* %861, i64 3
  %881 = load i8, i8 addrspace(4)* %880, align 1, !tbaa !9
  %882 = zext i8 %881 to i64
  %883 = shl nuw nsw i64 %882, 24
  %884 = or i64 %879, %883
  %885 = getelementptr inbounds i8, i8 addrspace(4)* %861, i64 4
  %886 = load i8, i8 addrspace(4)* %885, align 1, !tbaa !9
  %887 = zext i8 %886 to i64
  %888 = shl nuw nsw i64 %887, 32
  %889 = or i64 %884, %888
  %890 = getelementptr inbounds i8, i8 addrspace(4)* %861, i64 5
  %891 = load i8, i8 addrspace(4)* %890, align 1, !tbaa !9
  %892 = zext i8 %891 to i64
  %893 = shl nuw nsw i64 %892, 40
  %894 = or i64 %889, %893
  %895 = getelementptr inbounds i8, i8 addrspace(4)* %861, i64 6
  %896 = load i8, i8 addrspace(4)* %895, align 1, !tbaa !9
  %897 = zext i8 %896 to i64
  %898 = shl nuw nsw i64 %897, 48
  %899 = or i64 %894, %898
  %900 = getelementptr inbounds i8, i8 addrspace(4)* %861, i64 7
  %901 = load i8, i8 addrspace(4)* %900, align 1, !tbaa !9
  %902 = zext i8 %901 to i64
  %903 = shl nuw i64 %902, 56
  %904 = or i64 %899, %903
  br label %918

905:                                              ; preds = %865, %905
  %906 = phi i32 [ %916, %905 ], [ 0, %865 ]
  %907 = phi i64 [ %915, %905 ], [ 0, %865 ]
  %908 = zext i32 %906 to i64
  %909 = getelementptr inbounds i8, i8 addrspace(4)* %861, i64 %908
  %910 = load i8, i8 addrspace(4)* %909, align 1, !tbaa !9
  %911 = zext i8 %910 to i64
  %912 = shl i32 %906, 3
  %913 = zext i32 %912 to i64
  %914 = shl nuw i64 %911, %913
  %915 = or i64 %914, %907
  %916 = add nuw nsw i32 %906, 1
  %917 = icmp eq i32 %916, %862
  br i1 %917, label %918, label %905

918:                                              ; preds = %905, %867, %865
  %919 = phi i64 [ %904, %867 ], [ 0, %865 ], [ %915, %905 ]
  %920 = shl nuw nsw i64 %501, 2
  %921 = add nuw nsw i64 %920, 28
  %922 = and i64 %921, 480
  %923 = and i64 %503, -225
  %924 = or i64 %923, %922
  %925 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %924, i64 noundef %563, i64 noundef %623, i64 noundef %683, i64 noundef %743, i64 noundef %803, i64 noundef %863, i64 noundef %919) #10
  %926 = sub i64 %493, %501
  %927 = getelementptr inbounds i8, i8 addrspace(4)* %494, i64 %501
  %928 = icmp eq i64 %926, 0
  br i1 %928, label %929, label %492

929:                                              ; preds = %918, %484
  %930 = phi <2 x i64> [ %487, %484 ], [ %925, %918 ]
  %931 = extractelement <2 x i64> %930, i64 0
  %932 = and i64 %931, -225
  %933 = or i64 %932, 32
  %934 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %933, i64 noundef %464, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %935 = extractelement <2 x i64> %934, i64 0
  %936 = bitcast double %478 to i64
  %937 = and i64 %935, -225
  %938 = or i64 %937, 32
  %939 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %938, i64 noundef %936, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %940 = extractelement <2 x i64> %939, i64 0
  %941 = bitcast double %481 to i64
  %942 = and i64 %940, -227
  %943 = or i64 %942, 34
  %944 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %13, i64 noundef %943, i64 noundef %941, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %945

945:                                              ; preds = %929, %461
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !16
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !18
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !18
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !20
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !18
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !18
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !16
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !21
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !24
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !21
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !24
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !21
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !24
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !16
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !25
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !24
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !16
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !16
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !16
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !18
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !5
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !5
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !5
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !5
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !5
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !5
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !5
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !5
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
  %110 = call i64 @llvm.read_register.i64(metadata !26) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !27
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !29
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !30
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !21
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !24
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !31
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !31
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !32
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !34
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !16
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !16
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !24
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !21
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !31
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !31
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
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !7, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !7, i64 0}
!20 = !{i64 2662}
!21 = !{!22, !17, i64 0}
!22 = !{!"", !17, i64 0, !17, i64 8, !23, i64 16, !6, i64 24, !6, i64 32, !6, i64 40}
!23 = !{!"hsa_signal_s", !6, i64 0}
!24 = !{!22, !6, i64 40}
!25 = !{!22, !17, i64 8}
!26 = !{!"exec"}
!27 = !{!28, !19, i64 16}
!28 = !{!"", !6, i64 0, !6, i64 8, !19, i64 16, !19, i64 20}
!29 = !{!28, !6, i64 8}
!30 = !{!28, !19, i64 20}
!31 = !{!28, !6, i64 0}
!32 = !{!33, !6, i64 16}
!33 = !{!"amd_signal_s", !6, i64 0, !7, i64 8, !6, i64 16, !19, i64 24, !19, i64 28, !6, i64 32, !6, i64 40, !7, i64 48, !7, i64 56}
!34 = !{!33, !19, i64 24}
