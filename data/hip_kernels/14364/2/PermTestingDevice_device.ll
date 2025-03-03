; ModuleID = '../data/hip_kernels/14364/2/main.cu'
source_filename = "../data/hip_kernels/14364/2/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [22 x i8] c"Starting thread: %d \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z17PermTestingDeviceiiiiPdPiS_(i32 %0, i32 %1, i32 %2, i32 %3, double addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture writeonly %6) local_unnamed_addr #1 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 24
  %19 = bitcast i8 addrspace(4)* %18 to i64 addrspace(4)*
  %20 = load i64, i64 addrspace(4)* %19, align 8, !tbaa !7
  %21 = inttoptr i64 %20 to i8 addrspace(1)*
  %22 = addrspacecast i8 addrspace(1)* %21 to i8*
  %23 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %22, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %24 = extractelement <2 x i64> %23, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([22 x i8], [22 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %25, label %29

25:                                               ; preds = %7
  %26 = and i64 %24, -225
  %27 = or i64 %26, 32
  %28 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %22, i64 noundef %27, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %470

29:                                               ; preds = %7
  %30 = and i64 %24, 2
  %31 = and i64 %24, -3
  %32 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %31, i64 0
  br label %33

33:                                               ; preds = %459, %29
  %34 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([22 x i8], [22 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([22 x i8], [22 x i8] addrspace(4)* @.str, i64 0, i64 21) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([22 x i8]* addrspacecast ([22 x i8] addrspace(4)* @.str to [22 x i8]*) to i64)), i64 1))), %29 ], [ %467, %459 ]
  %35 = phi i8 addrspace(4)* [ getelementptr inbounds ([22 x i8], [22 x i8] addrspace(4)* @.str, i64 0, i64 0), %29 ], [ %468, %459 ]
  %36 = phi <2 x i64> [ %32, %29 ], [ %466, %459 ]
  %37 = icmp ugt i64 %34, 56
  %38 = extractelement <2 x i64> %36, i64 0
  %39 = or i64 %38, %30
  %40 = insertelement <2 x i64> poison, i64 %39, i64 0
  %41 = select i1 %37, <2 x i64> %36, <2 x i64> %40
  %42 = tail call i64 @llvm.umin.i64(i64 %34, i64 56)
  %43 = trunc i64 %42 to i32
  %44 = extractelement <2 x i64> %41, i64 0
  %45 = icmp ugt i32 %43, 7
  br i1 %45, label %48, label %46

46:                                               ; preds = %33
  %47 = icmp eq i32 %43, 0
  br i1 %47, label %101, label %88

48:                                               ; preds = %33
  %49 = load i8, i8 addrspace(4)* %35, align 1, !tbaa !11
  %50 = zext i8 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 1
  %52 = load i8, i8 addrspace(4)* %51, align 1, !tbaa !11
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 8
  %55 = or i64 %54, %50
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 2
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !11
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 16
  %60 = or i64 %55, %59
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 3
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !11
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 24
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 4
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !11
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 32
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 5
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !11
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 40
  %75 = or i64 %70, %74
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 6
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !11
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 48
  %80 = or i64 %75, %79
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 7
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !11
  %83 = zext i8 %82 to i64
  %84 = shl nuw i64 %83, 56
  %85 = or i64 %80, %84
  %86 = add nsw i32 %43, -8
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 8
  br label %101

88:                                               ; preds = %46, %88
  %89 = phi i32 [ %99, %88 ], [ 0, %46 ]
  %90 = phi i64 [ %98, %88 ], [ 0, %46 ]
  %91 = zext i32 %89 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 %91
  %93 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !11
  %94 = zext i8 %93 to i64
  %95 = shl i32 %89, 3
  %96 = zext i32 %95 to i64
  %97 = shl nuw i64 %94, %96
  %98 = or i64 %97, %90
  %99 = add nuw nsw i32 %89, 1
  %100 = icmp eq i32 %99, %43
  br i1 %100, label %101, label %88, !llvm.loop !12

101:                                              ; preds = %88, %48, %46
  %102 = phi i8 addrspace(4)* [ %87, %48 ], [ %35, %46 ], [ %35, %88 ]
  %103 = phi i32 [ %86, %48 ], [ 0, %46 ], [ 0, %88 ]
  %104 = phi i64 [ %85, %48 ], [ 0, %46 ], [ %98, %88 ]
  %105 = icmp ugt i32 %103, 7
  br i1 %105, label %108, label %106

106:                                              ; preds = %101
  %107 = icmp eq i32 %103, 0
  br i1 %107, label %161, label %148

108:                                              ; preds = %101
  %109 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !11
  %110 = zext i8 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 1
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !11
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 8
  %115 = or i64 %114, %110
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 2
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !11
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 16
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 3
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !11
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 24
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 4
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !11
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 32
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 5
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !11
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 40
  %135 = or i64 %130, %134
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 6
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !11
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 48
  %140 = or i64 %135, %139
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 7
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !11
  %143 = zext i8 %142 to i64
  %144 = shl nuw i64 %143, 56
  %145 = or i64 %140, %144
  %146 = add nsw i32 %103, -8
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 8
  br label %161

148:                                              ; preds = %106, %148
  %149 = phi i32 [ %159, %148 ], [ 0, %106 ]
  %150 = phi i64 [ %158, %148 ], [ 0, %106 ]
  %151 = zext i32 %149 to i64
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %102, i64 %151
  %153 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !11
  %154 = zext i8 %153 to i64
  %155 = shl i32 %149, 3
  %156 = zext i32 %155 to i64
  %157 = shl nuw i64 %154, %156
  %158 = or i64 %157, %150
  %159 = add nuw nsw i32 %149, 1
  %160 = icmp eq i32 %159, %103
  br i1 %160, label %161, label %148

161:                                              ; preds = %148, %108, %106
  %162 = phi i8 addrspace(4)* [ %147, %108 ], [ %102, %106 ], [ %102, %148 ]
  %163 = phi i32 [ %146, %108 ], [ 0, %106 ], [ 0, %148 ]
  %164 = phi i64 [ %145, %108 ], [ 0, %106 ], [ %158, %148 ]
  %165 = icmp ugt i32 %163, 7
  br i1 %165, label %168, label %166

166:                                              ; preds = %161
  %167 = icmp eq i32 %163, 0
  br i1 %167, label %221, label %208

168:                                              ; preds = %161
  %169 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !11
  %170 = zext i8 %169 to i64
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 1
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !11
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 8
  %175 = or i64 %174, %170
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 2
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !11
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 16
  %180 = or i64 %175, %179
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 3
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !11
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 24
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 4
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !11
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 32
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 5
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !11
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 40
  %195 = or i64 %190, %194
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 6
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !11
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 48
  %200 = or i64 %195, %199
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 7
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !11
  %203 = zext i8 %202 to i64
  %204 = shl nuw i64 %203, 56
  %205 = or i64 %200, %204
  %206 = add nsw i32 %163, -8
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 8
  br label %221

208:                                              ; preds = %166, %208
  %209 = phi i32 [ %219, %208 ], [ 0, %166 ]
  %210 = phi i64 [ %218, %208 ], [ 0, %166 ]
  %211 = zext i32 %209 to i64
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %162, i64 %211
  %213 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !11
  %214 = zext i8 %213 to i64
  %215 = shl i32 %209, 3
  %216 = zext i32 %215 to i64
  %217 = shl nuw i64 %214, %216
  %218 = or i64 %217, %210
  %219 = add nuw nsw i32 %209, 1
  %220 = icmp eq i32 %219, %163
  br i1 %220, label %221, label %208

221:                                              ; preds = %208, %168, %166
  %222 = phi i8 addrspace(4)* [ %207, %168 ], [ %162, %166 ], [ %162, %208 ]
  %223 = phi i32 [ %206, %168 ], [ 0, %166 ], [ 0, %208 ]
  %224 = phi i64 [ %205, %168 ], [ 0, %166 ], [ %218, %208 ]
  %225 = icmp ugt i32 %223, 7
  br i1 %225, label %228, label %226

226:                                              ; preds = %221
  %227 = icmp eq i32 %223, 0
  br i1 %227, label %281, label %268

228:                                              ; preds = %221
  %229 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !11
  %230 = zext i8 %229 to i64
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 1
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !11
  %233 = zext i8 %232 to i64
  %234 = shl nuw nsw i64 %233, 8
  %235 = or i64 %234, %230
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 2
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !11
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 16
  %240 = or i64 %235, %239
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 3
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !11
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 24
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 4
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !11
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 32
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 5
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !11
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 40
  %255 = or i64 %250, %254
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 6
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !11
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 48
  %260 = or i64 %255, %259
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 7
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !11
  %263 = zext i8 %262 to i64
  %264 = shl nuw i64 %263, 56
  %265 = or i64 %260, %264
  %266 = add nsw i32 %223, -8
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 8
  br label %281

268:                                              ; preds = %226, %268
  %269 = phi i32 [ %279, %268 ], [ 0, %226 ]
  %270 = phi i64 [ %278, %268 ], [ 0, %226 ]
  %271 = zext i32 %269 to i64
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %222, i64 %271
  %273 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !11
  %274 = zext i8 %273 to i64
  %275 = shl i32 %269, 3
  %276 = zext i32 %275 to i64
  %277 = shl nuw i64 %274, %276
  %278 = or i64 %277, %270
  %279 = add nuw nsw i32 %269, 1
  %280 = icmp eq i32 %279, %223
  br i1 %280, label %281, label %268

281:                                              ; preds = %268, %228, %226
  %282 = phi i8 addrspace(4)* [ %267, %228 ], [ %222, %226 ], [ %222, %268 ]
  %283 = phi i32 [ %266, %228 ], [ 0, %226 ], [ 0, %268 ]
  %284 = phi i64 [ %265, %228 ], [ 0, %226 ], [ %278, %268 ]
  %285 = icmp ugt i32 %283, 7
  br i1 %285, label %288, label %286

286:                                              ; preds = %281
  %287 = icmp eq i32 %283, 0
  br i1 %287, label %341, label %328

288:                                              ; preds = %281
  %289 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !11
  %290 = zext i8 %289 to i64
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 1
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !11
  %293 = zext i8 %292 to i64
  %294 = shl nuw nsw i64 %293, 8
  %295 = or i64 %294, %290
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 2
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !11
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 16
  %300 = or i64 %295, %299
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 3
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !11
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 24
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 4
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !11
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 32
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 5
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !11
  %313 = zext i8 %312 to i64
  %314 = shl nuw nsw i64 %313, 40
  %315 = or i64 %310, %314
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 6
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !11
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 48
  %320 = or i64 %315, %319
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 7
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !11
  %323 = zext i8 %322 to i64
  %324 = shl nuw i64 %323, 56
  %325 = or i64 %320, %324
  %326 = add nsw i32 %283, -8
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 8
  br label %341

328:                                              ; preds = %286, %328
  %329 = phi i32 [ %339, %328 ], [ 0, %286 ]
  %330 = phi i64 [ %338, %328 ], [ 0, %286 ]
  %331 = zext i32 %329 to i64
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %282, i64 %331
  %333 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !11
  %334 = zext i8 %333 to i64
  %335 = shl i32 %329, 3
  %336 = zext i32 %335 to i64
  %337 = shl nuw i64 %334, %336
  %338 = or i64 %337, %330
  %339 = add nuw nsw i32 %329, 1
  %340 = icmp eq i32 %339, %283
  br i1 %340, label %341, label %328

341:                                              ; preds = %328, %288, %286
  %342 = phi i8 addrspace(4)* [ %327, %288 ], [ %282, %286 ], [ %282, %328 ]
  %343 = phi i32 [ %326, %288 ], [ 0, %286 ], [ 0, %328 ]
  %344 = phi i64 [ %325, %288 ], [ 0, %286 ], [ %338, %328 ]
  %345 = icmp ugt i32 %343, 7
  br i1 %345, label %348, label %346

346:                                              ; preds = %341
  %347 = icmp eq i32 %343, 0
  br i1 %347, label %401, label %388

348:                                              ; preds = %341
  %349 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !11
  %350 = zext i8 %349 to i64
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 1
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !11
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 8
  %355 = or i64 %354, %350
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 2
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !11
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 16
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 3
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !11
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 24
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 4
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !11
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 32
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 5
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !11
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 40
  %375 = or i64 %370, %374
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 6
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !11
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 48
  %380 = or i64 %375, %379
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 7
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !11
  %383 = zext i8 %382 to i64
  %384 = shl nuw i64 %383, 56
  %385 = or i64 %380, %384
  %386 = add nsw i32 %343, -8
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 8
  br label %401

388:                                              ; preds = %346, %388
  %389 = phi i32 [ %399, %388 ], [ 0, %346 ]
  %390 = phi i64 [ %398, %388 ], [ 0, %346 ]
  %391 = zext i32 %389 to i64
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %342, i64 %391
  %393 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !11
  %394 = zext i8 %393 to i64
  %395 = shl i32 %389, 3
  %396 = zext i32 %395 to i64
  %397 = shl nuw i64 %394, %396
  %398 = or i64 %397, %390
  %399 = add nuw nsw i32 %389, 1
  %400 = icmp eq i32 %399, %343
  br i1 %400, label %401, label %388

401:                                              ; preds = %388, %348, %346
  %402 = phi i8 addrspace(4)* [ %387, %348 ], [ %342, %346 ], [ %342, %388 ]
  %403 = phi i32 [ %386, %348 ], [ 0, %346 ], [ 0, %388 ]
  %404 = phi i64 [ %385, %348 ], [ 0, %346 ], [ %398, %388 ]
  %405 = icmp ugt i32 %403, 7
  br i1 %405, label %408, label %406

406:                                              ; preds = %401
  %407 = icmp eq i32 %403, 0
  br i1 %407, label %459, label %446

408:                                              ; preds = %401
  %409 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !11
  %410 = zext i8 %409 to i64
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %402, i64 1
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !11
  %413 = zext i8 %412 to i64
  %414 = shl nuw nsw i64 %413, 8
  %415 = or i64 %414, %410
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %402, i64 2
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !11
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 16
  %420 = or i64 %415, %419
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %402, i64 3
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !11
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 24
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %402, i64 4
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !11
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 32
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %402, i64 5
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !11
  %433 = zext i8 %432 to i64
  %434 = shl nuw nsw i64 %433, 40
  %435 = or i64 %430, %434
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %402, i64 6
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !11
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 48
  %440 = or i64 %435, %439
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %402, i64 7
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !11
  %443 = zext i8 %442 to i64
  %444 = shl nuw i64 %443, 56
  %445 = or i64 %440, %444
  br label %459

446:                                              ; preds = %406, %446
  %447 = phi i32 [ %457, %446 ], [ 0, %406 ]
  %448 = phi i64 [ %456, %446 ], [ 0, %406 ]
  %449 = zext i32 %447 to i64
  %450 = getelementptr inbounds i8, i8 addrspace(4)* %402, i64 %449
  %451 = load i8, i8 addrspace(4)* %450, align 1, !tbaa !11
  %452 = zext i8 %451 to i64
  %453 = shl i32 %447, 3
  %454 = zext i32 %453 to i64
  %455 = shl nuw i64 %452, %454
  %456 = or i64 %455, %448
  %457 = add nuw nsw i32 %447, 1
  %458 = icmp eq i32 %457, %403
  br i1 %458, label %459, label %446

459:                                              ; preds = %446, %408, %406
  %460 = phi i64 [ %445, %408 ], [ 0, %406 ], [ %456, %446 ]
  %461 = shl nuw nsw i64 %42, 2
  %462 = add nuw nsw i64 %461, 28
  %463 = and i64 %462, 480
  %464 = and i64 %44, -225
  %465 = or i64 %464, %463
  %466 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %22, i64 noundef %465, i64 noundef %104, i64 noundef %164, i64 noundef %224, i64 noundef %284, i64 noundef %344, i64 noundef %404, i64 noundef %460) #10
  %467 = sub i64 %34, %42
  %468 = getelementptr inbounds i8, i8 addrspace(4)* %35, i64 %42
  %469 = icmp eq i64 %467, 0
  br i1 %469, label %470, label %33

470:                                              ; preds = %459, %25
  %471 = phi <2 x i64> [ %28, %25 ], [ %466, %459 ]
  %472 = extractelement <2 x i64> %471, i64 0
  %473 = zext i32 %16 to i64
  %474 = and i64 %472, -227
  %475 = or i64 %474, 34
  %476 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %22, i64 noundef %475, i64 noundef %473, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %477 = mul nsw i32 %16, %1
  %478 = icmp sgt i32 %2, 0
  br i1 %478, label %479, label %693

479:                                              ; preds = %470
  %480 = sub nsw i32 %1, %3
  %481 = icmp sgt i32 %3, 0
  %482 = icmp sgt i32 %1, %3
  %483 = sitofp i32 %3 to double
  %484 = sitofp i32 %480 to double
  %485 = and i32 %3, 7
  %486 = icmp ult i32 %3, 8
  %487 = and i32 %3, -8
  %488 = icmp eq i32 %485, 0
  br label %489

489:                                              ; preds = %479, %651
  %490 = phi double [ 0.000000e+00, %479 ], [ %690, %651 ]
  %491 = phi i32 [ 0, %479 ], [ %691, %651 ]
  br i1 %481, label %492, label %519

492:                                              ; preds = %489
  br i1 %486, label %493, label %522

493:                                              ; preds = %522, %492
  %494 = phi double [ undef, %492 ], [ %627, %522 ]
  %495 = phi double [ undef, %492 ], [ %629, %522 ]
  %496 = phi double [ 0.000000e+00, %492 ], [ %629, %522 ]
  %497 = phi double [ 0.000000e+00, %492 ], [ %627, %522 ]
  %498 = phi i32 [ 0, %492 ], [ %630, %522 ]
  br i1 %488, label %519, label %499

499:                                              ; preds = %493, %499
  %500 = phi double [ %515, %499 ], [ %496, %493 ]
  %501 = phi double [ %513, %499 ], [ %497, %493 ]
  %502 = phi i32 [ %516, %499 ], [ %498, %493 ]
  %503 = phi i32 [ %517, %499 ], [ 0, %493 ]
  %504 = add nsw i32 %502, %477
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %505
  %507 = load i32, i32 addrspace(1)* %506, align 4, !tbaa !14
  %508 = add nsw i32 %507, -1
  %509 = mul nsw i32 %508, %2
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds double, double addrspace(1)* %4, i64 %510
  %512 = load double, double addrspace(1)* %511, align 8, !tbaa !18
  %513 = fadd contract double %501, %512
  %514 = fmul contract double %512, %512
  %515 = fadd contract double %500, %514
  %516 = add nuw nsw i32 %502, 1
  %517 = add i32 %503, 1
  %518 = icmp eq i32 %517, %485
  br i1 %518, label %519, label %499, !llvm.loop !20

519:                                              ; preds = %493, %499, %489
  %520 = phi double [ 0.000000e+00, %489 ], [ %494, %493 ], [ %513, %499 ]
  %521 = phi double [ 0.000000e+00, %489 ], [ %495, %493 ], [ %515, %499 ]
  br i1 %482, label %633, label %651

522:                                              ; preds = %492, %522
  %523 = phi double [ %629, %522 ], [ 0.000000e+00, %492 ]
  %524 = phi double [ %627, %522 ], [ 0.000000e+00, %492 ]
  %525 = phi i32 [ %630, %522 ], [ 0, %492 ]
  %526 = phi i32 [ %631, %522 ], [ 0, %492 ]
  %527 = add nsw i32 %525, %477
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %528
  %530 = load i32, i32 addrspace(1)* %529, align 4, !tbaa !14
  %531 = add nsw i32 %530, -1
  %532 = mul nsw i32 %531, %2
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds double, double addrspace(1)* %4, i64 %533
  %535 = load double, double addrspace(1)* %534, align 8, !tbaa !18
  %536 = fadd contract double %524, %535
  %537 = fmul contract double %535, %535
  %538 = fadd contract double %523, %537
  %539 = or i32 %525, 1
  %540 = add nsw i32 %539, %477
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %541
  %543 = load i32, i32 addrspace(1)* %542, align 4, !tbaa !14
  %544 = add nsw i32 %543, -1
  %545 = mul nsw i32 %544, %2
  %546 = sext i32 %545 to i64
  %547 = getelementptr inbounds double, double addrspace(1)* %4, i64 %546
  %548 = load double, double addrspace(1)* %547, align 8, !tbaa !18
  %549 = fadd contract double %536, %548
  %550 = fmul contract double %548, %548
  %551 = fadd contract double %538, %550
  %552 = or i32 %525, 2
  %553 = add nsw i32 %552, %477
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %554
  %556 = load i32, i32 addrspace(1)* %555, align 4, !tbaa !14
  %557 = add nsw i32 %556, -1
  %558 = mul nsw i32 %557, %2
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds double, double addrspace(1)* %4, i64 %559
  %561 = load double, double addrspace(1)* %560, align 8, !tbaa !18
  %562 = fadd contract double %549, %561
  %563 = fmul contract double %561, %561
  %564 = fadd contract double %551, %563
  %565 = or i32 %525, 3
  %566 = add nsw i32 %565, %477
  %567 = sext i32 %566 to i64
  %568 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %567
  %569 = load i32, i32 addrspace(1)* %568, align 4, !tbaa !14
  %570 = add nsw i32 %569, -1
  %571 = mul nsw i32 %570, %2
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds double, double addrspace(1)* %4, i64 %572
  %574 = load double, double addrspace(1)* %573, align 8, !tbaa !18
  %575 = fadd contract double %562, %574
  %576 = fmul contract double %574, %574
  %577 = fadd contract double %564, %576
  %578 = or i32 %525, 4
  %579 = add nsw i32 %578, %477
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %580
  %582 = load i32, i32 addrspace(1)* %581, align 4, !tbaa !14
  %583 = add nsw i32 %582, -1
  %584 = mul nsw i32 %583, %2
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds double, double addrspace(1)* %4, i64 %585
  %587 = load double, double addrspace(1)* %586, align 8, !tbaa !18
  %588 = fadd contract double %575, %587
  %589 = fmul contract double %587, %587
  %590 = fadd contract double %577, %589
  %591 = or i32 %525, 5
  %592 = add nsw i32 %591, %477
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %593
  %595 = load i32, i32 addrspace(1)* %594, align 4, !tbaa !14
  %596 = add nsw i32 %595, -1
  %597 = mul nsw i32 %596, %2
  %598 = sext i32 %597 to i64
  %599 = getelementptr inbounds double, double addrspace(1)* %4, i64 %598
  %600 = load double, double addrspace(1)* %599, align 8, !tbaa !18
  %601 = fadd contract double %588, %600
  %602 = fmul contract double %600, %600
  %603 = fadd contract double %590, %602
  %604 = or i32 %525, 6
  %605 = add nsw i32 %604, %477
  %606 = sext i32 %605 to i64
  %607 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %606
  %608 = load i32, i32 addrspace(1)* %607, align 4, !tbaa !14
  %609 = add nsw i32 %608, -1
  %610 = mul nsw i32 %609, %2
  %611 = sext i32 %610 to i64
  %612 = getelementptr inbounds double, double addrspace(1)* %4, i64 %611
  %613 = load double, double addrspace(1)* %612, align 8, !tbaa !18
  %614 = fadd contract double %601, %613
  %615 = fmul contract double %613, %613
  %616 = fadd contract double %603, %615
  %617 = or i32 %525, 7
  %618 = add nsw i32 %617, %477
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %619
  %621 = load i32, i32 addrspace(1)* %620, align 4, !tbaa !14
  %622 = add nsw i32 %621, -1
  %623 = mul nsw i32 %622, %2
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds double, double addrspace(1)* %4, i64 %624
  %626 = load double, double addrspace(1)* %625, align 8, !tbaa !18
  %627 = fadd contract double %614, %626
  %628 = fmul contract double %626, %626
  %629 = fadd contract double %616, %628
  %630 = add nuw nsw i32 %525, 8
  %631 = add i32 %526, 8
  %632 = icmp eq i32 %631, %487
  br i1 %632, label %493, label %522, !llvm.loop !21

633:                                              ; preds = %519, %633
  %634 = phi double [ %648, %633 ], [ 0.000000e+00, %519 ]
  %635 = phi double [ %646, %633 ], [ 0.000000e+00, %519 ]
  %636 = phi i32 [ %649, %633 ], [ %3, %519 ]
  %637 = add nsw i32 %636, %477
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %638
  %640 = load i32, i32 addrspace(1)* %639, align 4, !tbaa !14
  %641 = add nsw i32 %640, -1
  %642 = mul nsw i32 %641, %2
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds double, double addrspace(1)* %4, i64 %643
  %645 = load double, double addrspace(1)* %644, align 8, !tbaa !18
  %646 = fadd contract double %635, %645
  %647 = fmul contract double %645, %645
  %648 = fadd contract double %634, %647
  %649 = add nsw i32 %636, 1
  %650 = icmp slt i32 %649, %1
  br i1 %650, label %633, label %651, !llvm.loop !23

651:                                              ; preds = %633, %519
  %652 = phi double [ 0.000000e+00, %519 ], [ %646, %633 ]
  %653 = phi double [ 0.000000e+00, %519 ], [ %648, %633 ]
  %654 = fdiv contract double %520, %483
  %655 = fdiv contract double %652, %484
  %656 = fdiv contract double %521, %483
  %657 = fmul contract double %654, %654
  %658 = fsub contract double %656, %657
  %659 = fdiv contract double %653, %484
  %660 = fmul contract double %655, %655
  %661 = fsub contract double %659, %660
  %662 = fsub contract double %654, %655
  %663 = fdiv contract double %658, %483
  %664 = fdiv contract double %661, %484
  %665 = fadd contract double %663, %664
  %666 = fcmp olt double %665, 0x1000000000000000
  %667 = select i1 %666, double 0x4FF0000000000000, double 1.000000e+00
  %668 = fmul double %665, %667
  %669 = tail call double @llvm.amdgcn.rsq.f64(double %668)
  %670 = fmul double %668, %669
  %671 = fmul double %669, 5.000000e-01
  %672 = fneg double %671
  %673 = tail call double @llvm.fma.f64(double %672, double %670, double 5.000000e-01)
  %674 = tail call double @llvm.fma.f64(double %671, double %673, double %671)
  %675 = tail call double @llvm.fma.f64(double %670, double %673, double %670)
  %676 = fneg double %675
  %677 = tail call double @llvm.fma.f64(double %676, double %675, double %668)
  %678 = tail call double @llvm.fma.f64(double %677, double %674, double %675)
  %679 = fneg double %678
  %680 = tail call double @llvm.fma.f64(double %679, double %678, double %668)
  %681 = tail call double @llvm.fma.f64(double %680, double %674, double %678)
  %682 = select i1 %666, double 0x37F0000000000000, double 1.000000e+00
  %683 = fmul double %682, %681
  %684 = fcmp oeq double %668, 0.000000e+00
  %685 = fcmp oeq double %668, 0x7FF0000000000000
  %686 = or i1 %684, %685
  %687 = select i1 %686, double %668, double %683
  %688 = fdiv contract double %662, %687
  %689 = fcmp contract ogt double %688, %490
  %690 = select i1 %689, double %688, double %490
  %691 = add nuw nsw i32 %491, 1
  %692 = icmp eq i32 %691, %2
  br i1 %692, label %693, label %489, !llvm.loop !24

693:                                              ; preds = %651, %470
  %694 = phi double [ 0.000000e+00, %470 ], [ %690, %651 ]
  %695 = sext i32 %16 to i64
  %696 = getelementptr inbounds double, double addrspace(1)* %6, i64 %695
  store double %694, double addrspace(1)* %696, align 8, !tbaa !18
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !25
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !27
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !7
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !27
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !29
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !27
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !27
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !25
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !30
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !33
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !30
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !33
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !30
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !33
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !34
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !33
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !27
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %110 = call i64 @llvm.read_register.i64(metadata !35) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !36
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !38
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !39
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !30
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !33
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !40
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !40
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !41
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !43
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !25
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !25
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !25
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !27
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !27
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !33
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !30
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !40
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !40
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
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
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
!18 = !{!19, !19, i64 0}
!19 = !{!"double", !16, i64 0}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
!24 = distinct !{!24, !22}
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !9, i64 0}
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !9, i64 0}
!29 = !{i64 2662}
!30 = !{!31, !26, i64 0}
!31 = !{!"", !26, i64 0, !26, i64 8, !32, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!32 = !{!"hsa_signal_s", !8, i64 0}
!33 = !{!31, !8, i64 40}
!34 = !{!31, !26, i64 8}
!35 = !{!"exec"}
!36 = !{!37, !28, i64 16}
!37 = !{!"", !8, i64 0, !8, i64 8, !28, i64 16, !28, i64 20}
!38 = !{!37, !8, i64 8}
!39 = !{!37, !28, i64 20}
!40 = !{!37, !8, i64 0}
!41 = !{!42, !8, i64 16}
!42 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !28, i64 24, !28, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!43 = !{!42, !28, i64 24}
