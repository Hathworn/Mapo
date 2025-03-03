; ModuleID = '../data/hip_kernels/8205/5/main.cu'
source_filename = "../data/hip_kernels/8205/5/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [6 x i8] c"init\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z4initPjjj(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %17

14:                                               ; preds = %3
  %15 = zext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  store i32 %1, i32 addrspace(1)* %16, align 4, !tbaa !7
  br label %17

17:                                               ; preds = %14, %3
  %18 = icmp eq i32 %12, 0
  br i1 %18, label %19, label %472

19:                                               ; preds = %17
  %20 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 24
  %22 = bitcast i8 addrspace(4)* %21 to i64 addrspace(4)*
  %23 = load i64, i64 addrspace(4)* %22, align 8, !tbaa !11
  %24 = inttoptr i64 %23 to i8 addrspace(1)*
  %25 = addrspacecast i8 addrspace(1)* %24 to i8*
  %26 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %25, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %27 = extractelement <2 x i64> %26, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([6 x i8], [6 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %28, label %32

28:                                               ; preds = %19
  %29 = and i64 %27, -227
  %30 = or i64 %29, 34
  %31 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %25, i64 noundef %30, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %472

32:                                               ; preds = %19
  %33 = and i64 %27, -3
  %34 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %33, i64 0
  br label %35

35:                                               ; preds = %461, %32
  %36 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([6 x i8], [6 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([6 x i8], [6 x i8] addrspace(4)* @.str, i64 0, i64 5) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([6 x i8]* addrspacecast ([6 x i8] addrspace(4)* @.str to [6 x i8]*) to i64)), i64 1))), %32 ], [ %469, %461 ]
  %37 = phi i8 addrspace(4)* [ getelementptr inbounds ([6 x i8], [6 x i8] addrspace(4)* @.str, i64 0, i64 0), %32 ], [ %470, %461 ]
  %38 = phi <2 x i64> [ %34, %32 ], [ %468, %461 ]
  %39 = icmp ugt i64 %36, 56
  %40 = extractelement <2 x i64> %38, i64 0
  %41 = or i64 %40, 2
  %42 = insertelement <2 x i64> poison, i64 %41, i64 0
  %43 = select i1 %39, <2 x i64> %38, <2 x i64> %42
  %44 = tail call i64 @llvm.umin.i64(i64 %36, i64 56)
  %45 = trunc i64 %44 to i32
  %46 = extractelement <2 x i64> %43, i64 0
  %47 = icmp ugt i32 %45, 7
  br i1 %47, label %50, label %48

48:                                               ; preds = %35
  %49 = icmp eq i32 %45, 0
  br i1 %49, label %103, label %90

50:                                               ; preds = %35
  %51 = load i8, i8 addrspace(4)* %37, align 1, !tbaa !15
  %52 = zext i8 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 1
  %54 = load i8, i8 addrspace(4)* %53, align 1, !tbaa !15
  %55 = zext i8 %54 to i64
  %56 = shl nuw nsw i64 %55, 8
  %57 = or i64 %56, %52
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 2
  %59 = load i8, i8 addrspace(4)* %58, align 1, !tbaa !15
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 16
  %62 = or i64 %57, %61
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 3
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !15
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 24
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 4
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !15
  %70 = zext i8 %69 to i64
  %71 = shl nuw nsw i64 %70, 32
  %72 = or i64 %67, %71
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 5
  %74 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !15
  %75 = zext i8 %74 to i64
  %76 = shl nuw nsw i64 %75, 40
  %77 = or i64 %72, %76
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 6
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !15
  %80 = zext i8 %79 to i64
  %81 = shl nuw nsw i64 %80, 48
  %82 = or i64 %77, %81
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 7
  %84 = load i8, i8 addrspace(4)* %83, align 1, !tbaa !15
  %85 = zext i8 %84 to i64
  %86 = shl nuw i64 %85, 56
  %87 = or i64 %82, %86
  %88 = add nsw i32 %45, -8
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 8
  br label %103

90:                                               ; preds = %48, %90
  %91 = phi i32 [ %101, %90 ], [ 0, %48 ]
  %92 = phi i64 [ %100, %90 ], [ 0, %48 ]
  %93 = zext i32 %91 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 %93
  %95 = load i8, i8 addrspace(4)* %94, align 1, !tbaa !15
  %96 = zext i8 %95 to i64
  %97 = shl i32 %91, 3
  %98 = zext i32 %97 to i64
  %99 = shl nuw i64 %96, %98
  %100 = or i64 %99, %92
  %101 = add nuw nsw i32 %91, 1
  %102 = icmp eq i32 %101, %45
  br i1 %102, label %103, label %90, !llvm.loop !16

103:                                              ; preds = %90, %50, %48
  %104 = phi i8 addrspace(4)* [ %89, %50 ], [ %37, %48 ], [ %37, %90 ]
  %105 = phi i32 [ %88, %50 ], [ 0, %48 ], [ 0, %90 ]
  %106 = phi i64 [ %87, %50 ], [ 0, %48 ], [ %100, %90 ]
  %107 = icmp ugt i32 %105, 7
  br i1 %107, label %110, label %108

108:                                              ; preds = %103
  %109 = icmp eq i32 %105, 0
  br i1 %109, label %163, label %150

110:                                              ; preds = %103
  %111 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !15
  %112 = zext i8 %111 to i64
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 1
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !15
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 8
  %117 = or i64 %116, %112
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 2
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !15
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 16
  %122 = or i64 %117, %121
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 3
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !15
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 24
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 4
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !15
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 32
  %132 = or i64 %127, %131
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 5
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !15
  %135 = zext i8 %134 to i64
  %136 = shl nuw nsw i64 %135, 40
  %137 = or i64 %132, %136
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 6
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !15
  %140 = zext i8 %139 to i64
  %141 = shl nuw nsw i64 %140, 48
  %142 = or i64 %137, %141
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 7
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !15
  %145 = zext i8 %144 to i64
  %146 = shl nuw i64 %145, 56
  %147 = or i64 %142, %146
  %148 = add nsw i32 %105, -8
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 8
  br label %163

150:                                              ; preds = %108, %150
  %151 = phi i32 [ %161, %150 ], [ 0, %108 ]
  %152 = phi i64 [ %160, %150 ], [ 0, %108 ]
  %153 = zext i32 %151 to i64
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %104, i64 %153
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !15
  %156 = zext i8 %155 to i64
  %157 = shl i32 %151, 3
  %158 = zext i32 %157 to i64
  %159 = shl nuw i64 %156, %158
  %160 = or i64 %159, %152
  %161 = add nuw nsw i32 %151, 1
  %162 = icmp eq i32 %161, %105
  br i1 %162, label %163, label %150

163:                                              ; preds = %150, %110, %108
  %164 = phi i8 addrspace(4)* [ %149, %110 ], [ %104, %108 ], [ %104, %150 ]
  %165 = phi i32 [ %148, %110 ], [ 0, %108 ], [ 0, %150 ]
  %166 = phi i64 [ %147, %110 ], [ 0, %108 ], [ %160, %150 ]
  %167 = icmp ugt i32 %165, 7
  br i1 %167, label %170, label %168

168:                                              ; preds = %163
  %169 = icmp eq i32 %165, 0
  br i1 %169, label %223, label %210

170:                                              ; preds = %163
  %171 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !15
  %172 = zext i8 %171 to i64
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 1
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !15
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 8
  %177 = or i64 %176, %172
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 2
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !15
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 16
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 3
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !15
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 24
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 4
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !15
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 32
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 5
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !15
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 40
  %197 = or i64 %192, %196
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 6
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !15
  %200 = zext i8 %199 to i64
  %201 = shl nuw nsw i64 %200, 48
  %202 = or i64 %197, %201
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 7
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !15
  %205 = zext i8 %204 to i64
  %206 = shl nuw i64 %205, 56
  %207 = or i64 %202, %206
  %208 = add nsw i32 %165, -8
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 8
  br label %223

210:                                              ; preds = %168, %210
  %211 = phi i32 [ %221, %210 ], [ 0, %168 ]
  %212 = phi i64 [ %220, %210 ], [ 0, %168 ]
  %213 = zext i32 %211 to i64
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %164, i64 %213
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !15
  %216 = zext i8 %215 to i64
  %217 = shl i32 %211, 3
  %218 = zext i32 %217 to i64
  %219 = shl nuw i64 %216, %218
  %220 = or i64 %219, %212
  %221 = add nuw nsw i32 %211, 1
  %222 = icmp eq i32 %221, %165
  br i1 %222, label %223, label %210

223:                                              ; preds = %210, %170, %168
  %224 = phi i8 addrspace(4)* [ %209, %170 ], [ %164, %168 ], [ %164, %210 ]
  %225 = phi i32 [ %208, %170 ], [ 0, %168 ], [ 0, %210 ]
  %226 = phi i64 [ %207, %170 ], [ 0, %168 ], [ %220, %210 ]
  %227 = icmp ugt i32 %225, 7
  br i1 %227, label %230, label %228

228:                                              ; preds = %223
  %229 = icmp eq i32 %225, 0
  br i1 %229, label %283, label %270

230:                                              ; preds = %223
  %231 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !15
  %232 = zext i8 %231 to i64
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 1
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !15
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 8
  %237 = or i64 %236, %232
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 2
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !15
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 16
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 3
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !15
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 24
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 4
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !15
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 32
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 5
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !15
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 40
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 6
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !15
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 48
  %262 = or i64 %257, %261
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 7
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !15
  %265 = zext i8 %264 to i64
  %266 = shl nuw i64 %265, 56
  %267 = or i64 %262, %266
  %268 = add nsw i32 %225, -8
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 8
  br label %283

270:                                              ; preds = %228, %270
  %271 = phi i32 [ %281, %270 ], [ 0, %228 ]
  %272 = phi i64 [ %280, %270 ], [ 0, %228 ]
  %273 = zext i32 %271 to i64
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %224, i64 %273
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !15
  %276 = zext i8 %275 to i64
  %277 = shl i32 %271, 3
  %278 = zext i32 %277 to i64
  %279 = shl nuw i64 %276, %278
  %280 = or i64 %279, %272
  %281 = add nuw nsw i32 %271, 1
  %282 = icmp eq i32 %281, %225
  br i1 %282, label %283, label %270

283:                                              ; preds = %270, %230, %228
  %284 = phi i8 addrspace(4)* [ %269, %230 ], [ %224, %228 ], [ %224, %270 ]
  %285 = phi i32 [ %268, %230 ], [ 0, %228 ], [ 0, %270 ]
  %286 = phi i64 [ %267, %230 ], [ 0, %228 ], [ %280, %270 ]
  %287 = icmp ugt i32 %285, 7
  br i1 %287, label %290, label %288

288:                                              ; preds = %283
  %289 = icmp eq i32 %285, 0
  br i1 %289, label %343, label %330

290:                                              ; preds = %283
  %291 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !15
  %292 = zext i8 %291 to i64
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 1
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !15
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 8
  %297 = or i64 %296, %292
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 2
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !15
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 16
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 3
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !15
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 24
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 4
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !15
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 32
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 5
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !15
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 40
  %317 = or i64 %312, %316
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 6
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !15
  %320 = zext i8 %319 to i64
  %321 = shl nuw nsw i64 %320, 48
  %322 = or i64 %317, %321
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 7
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !15
  %325 = zext i8 %324 to i64
  %326 = shl nuw i64 %325, 56
  %327 = or i64 %322, %326
  %328 = add nsw i32 %285, -8
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 8
  br label %343

330:                                              ; preds = %288, %330
  %331 = phi i32 [ %341, %330 ], [ 0, %288 ]
  %332 = phi i64 [ %340, %330 ], [ 0, %288 ]
  %333 = zext i32 %331 to i64
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %284, i64 %333
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !15
  %336 = zext i8 %335 to i64
  %337 = shl i32 %331, 3
  %338 = zext i32 %337 to i64
  %339 = shl nuw i64 %336, %338
  %340 = or i64 %339, %332
  %341 = add nuw nsw i32 %331, 1
  %342 = icmp eq i32 %341, %285
  br i1 %342, label %343, label %330

343:                                              ; preds = %330, %290, %288
  %344 = phi i8 addrspace(4)* [ %329, %290 ], [ %284, %288 ], [ %284, %330 ]
  %345 = phi i32 [ %328, %290 ], [ 0, %288 ], [ 0, %330 ]
  %346 = phi i64 [ %327, %290 ], [ 0, %288 ], [ %340, %330 ]
  %347 = icmp ugt i32 %345, 7
  br i1 %347, label %350, label %348

348:                                              ; preds = %343
  %349 = icmp eq i32 %345, 0
  br i1 %349, label %403, label %390

350:                                              ; preds = %343
  %351 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !15
  %352 = zext i8 %351 to i64
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 1
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !15
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 8
  %357 = or i64 %356, %352
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 2
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !15
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 16
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 3
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !15
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 24
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 4
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !15
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 32
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 5
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !15
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 40
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 6
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !15
  %380 = zext i8 %379 to i64
  %381 = shl nuw nsw i64 %380, 48
  %382 = or i64 %377, %381
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 7
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !15
  %385 = zext i8 %384 to i64
  %386 = shl nuw i64 %385, 56
  %387 = or i64 %382, %386
  %388 = add nsw i32 %345, -8
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 8
  br label %403

390:                                              ; preds = %348, %390
  %391 = phi i32 [ %401, %390 ], [ 0, %348 ]
  %392 = phi i64 [ %400, %390 ], [ 0, %348 ]
  %393 = zext i32 %391 to i64
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %344, i64 %393
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !15
  %396 = zext i8 %395 to i64
  %397 = shl i32 %391, 3
  %398 = zext i32 %397 to i64
  %399 = shl nuw i64 %396, %398
  %400 = or i64 %399, %392
  %401 = add nuw nsw i32 %391, 1
  %402 = icmp eq i32 %401, %345
  br i1 %402, label %403, label %390

403:                                              ; preds = %390, %350, %348
  %404 = phi i8 addrspace(4)* [ %389, %350 ], [ %344, %348 ], [ %344, %390 ]
  %405 = phi i32 [ %388, %350 ], [ 0, %348 ], [ 0, %390 ]
  %406 = phi i64 [ %387, %350 ], [ 0, %348 ], [ %400, %390 ]
  %407 = icmp ugt i32 %405, 7
  br i1 %407, label %410, label %408

408:                                              ; preds = %403
  %409 = icmp eq i32 %405, 0
  br i1 %409, label %461, label %448

410:                                              ; preds = %403
  %411 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !15
  %412 = zext i8 %411 to i64
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 1
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !15
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 8
  %417 = or i64 %416, %412
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 2
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !15
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 16
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 3
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !15
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 24
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 4
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !15
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 32
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 5
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !15
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 40
  %437 = or i64 %432, %436
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 6
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !15
  %440 = zext i8 %439 to i64
  %441 = shl nuw nsw i64 %440, 48
  %442 = or i64 %437, %441
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 7
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !15
  %445 = zext i8 %444 to i64
  %446 = shl nuw i64 %445, 56
  %447 = or i64 %442, %446
  br label %461

448:                                              ; preds = %408, %448
  %449 = phi i32 [ %459, %448 ], [ 0, %408 ]
  %450 = phi i64 [ %458, %448 ], [ 0, %408 ]
  %451 = zext i32 %449 to i64
  %452 = getelementptr inbounds i8, i8 addrspace(4)* %404, i64 %451
  %453 = load i8, i8 addrspace(4)* %452, align 1, !tbaa !15
  %454 = zext i8 %453 to i64
  %455 = shl i32 %449, 3
  %456 = zext i32 %455 to i64
  %457 = shl nuw i64 %454, %456
  %458 = or i64 %457, %450
  %459 = add nuw nsw i32 %449, 1
  %460 = icmp eq i32 %459, %405
  br i1 %460, label %461, label %448

461:                                              ; preds = %448, %410, %408
  %462 = phi i64 [ %447, %410 ], [ 0, %408 ], [ %458, %448 ]
  %463 = shl nuw nsw i64 %44, 2
  %464 = add nuw nsw i64 %463, 28
  %465 = and i64 %464, 480
  %466 = and i64 %46, -225
  %467 = or i64 %466, %465
  %468 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %25, i64 noundef %467, i64 noundef %106, i64 noundef %166, i64 noundef %226, i64 noundef %286, i64 noundef %346, i64 noundef %406, i64 noundef %462) #10
  %469 = sub i64 %36, %44
  %470 = getelementptr inbounds i8, i8 addrspace(4)* %37, i64 %44
  %471 = icmp eq i64 %469, 0
  br i1 %471, label %472, label %35

472:                                              ; preds = %461, %28, %17
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !18
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !20
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !11
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !11
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !11
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !11
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !11
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !11
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !11
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !11
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !20
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !20
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !20
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !18
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !11
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !26
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !27
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !26
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !20
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !11
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !11
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !11
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !11
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !11
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !11
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !11
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !11
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %110 = call i64 @llvm.read_register.i64(metadata !28) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !29
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !31
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !32
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !11
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !11
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !11
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !11
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !11
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !11
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !11
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !11
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !26
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !33
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !33
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !34
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !36
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !11
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !11
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !26
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
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !33
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !33
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!13, !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !13, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !13, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !19, i64 0}
!24 = !{!"", !19, i64 0, !19, i64 8, !25, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!25 = !{!"hsa_signal_s", !12, i64 0}
!26 = !{!24, !12, i64 40}
!27 = !{!24, !19, i64 8}
!28 = !{!"exec"}
!29 = !{!30, !21, i64 16}
!30 = !{!"", !12, i64 0, !12, i64 8, !21, i64 16, !21, i64 20}
!31 = !{!30, !12, i64 8}
!32 = !{!30, !21, i64 20}
!33 = !{!30, !12, i64 0}
!34 = !{!35, !12, i64 16}
!35 = !{!"amd_signal_s", !12, i64 0, !13, i64 8, !12, i64 16, !21, i64 24, !21, i64 28, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 56}
!36 = !{!35, !21, i64 24}
