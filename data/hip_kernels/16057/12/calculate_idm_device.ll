; ModuleID = '../data/hip_kernels/16057/12/main.cu'
source_filename = "../data/hip_kernels/16057/12/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [8 x i8] c"idm %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z13calculate_idmPfS_Piifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float %4, i32 %5) local_unnamed_addr #1 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = mul nsw i32 %23, %3
  %25 = add nsw i32 %15, %24
  %26 = icmp ult i32 %25, %5
  br i1 %26, label %27, label %38

27:                                               ; preds = %6
  %28 = zext i32 %25 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = add nsw i32 %30, 1
  %32 = sitofp i32 %31 to float
  %33 = fdiv contract float 1.000000e+00, %32
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !11, !amdgpu.noclobber !6
  %36 = fmul contract float %35, %33
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  store float %36, float addrspace(1)* %37, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %38

38:                                               ; preds = %27, %6
  %39 = icmp ugt i16 %12, 1
  br i1 %39, label %40, label %43

40:                                               ; preds = %38
  %41 = zext i32 %25 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  br label %45

43:                                               ; preds = %58, %38
  %44 = icmp eq i32 %25, 0
  br i1 %44, label %60, label %523

45:                                               ; preds = %40, %58
  %46 = phi i32 [ 1, %40 ], [ %47, %58 ]
  %47 = shl nsw i32 %46, 1
  %48 = add i32 %47, 1023
  %49 = and i32 %48, %7
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %58

51:                                               ; preds = %45
  %52 = add i32 %46, %25
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !11
  %56 = load float, float addrspace(1)* %42, align 4, !tbaa !11
  %57 = fadd contract float %55, %56
  store float %57, float addrspace(1)* %42, align 4, !tbaa !11
  br label %58

58:                                               ; preds = %51, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = icmp ult i32 %47, %13
  br i1 %59, label %45, label %43, !llvm.loop !13

60:                                               ; preds = %43
  %61 = load float, float addrspace(1)* %1, align 4, !tbaa !11
  %62 = fpext float %61 to double
  %63 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 24
  %65 = bitcast i8 addrspace(4)* %64 to i64 addrspace(4)*
  %66 = load i64, i64 addrspace(4)* %65, align 8, !tbaa !15
  %67 = inttoptr i64 %66 to i8 addrspace(1)*
  %68 = addrspacecast i8 addrspace(1)* %67 to i8*
  %69 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %68, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %70 = extractelement <2 x i64> %69, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %71, label %75

71:                                               ; preds = %60
  %72 = and i64 %70, -225
  %73 = or i64 %72, 32
  %74 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %68, i64 noundef %73, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %516

75:                                               ; preds = %60
  %76 = and i64 %70, 2
  %77 = and i64 %70, -3
  %78 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %77, i64 0
  br label %79

79:                                               ; preds = %505, %75
  %80 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 7) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([8 x i8]* addrspacecast ([8 x i8] addrspace(4)* @.str to [8 x i8]*) to i64)), i64 1))), %75 ], [ %513, %505 ]
  %81 = phi i8 addrspace(4)* [ getelementptr inbounds ([8 x i8], [8 x i8] addrspace(4)* @.str, i64 0, i64 0), %75 ], [ %514, %505 ]
  %82 = phi <2 x i64> [ %78, %75 ], [ %512, %505 ]
  %83 = icmp ugt i64 %80, 56
  %84 = extractelement <2 x i64> %82, i64 0
  %85 = or i64 %84, %76
  %86 = insertelement <2 x i64> poison, i64 %85, i64 0
  %87 = select i1 %83, <2 x i64> %82, <2 x i64> %86
  %88 = tail call i64 @llvm.umin.i64(i64 %80, i64 56)
  %89 = trunc i64 %88 to i32
  %90 = extractelement <2 x i64> %87, i64 0
  %91 = icmp ugt i32 %89, 7
  br i1 %91, label %94, label %92

92:                                               ; preds = %79
  %93 = icmp eq i32 %89, 0
  br i1 %93, label %147, label %134

94:                                               ; preds = %79
  %95 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !19
  %96 = zext i8 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 1
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !19
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 8
  %101 = or i64 %100, %96
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 2
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !19
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 16
  %106 = or i64 %101, %105
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 3
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !19
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 24
  %111 = or i64 %106, %110
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 4
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !19
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 32
  %116 = or i64 %111, %115
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 5
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !19
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 40
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 6
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !19
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 48
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 7
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !19
  %129 = zext i8 %128 to i64
  %130 = shl nuw i64 %129, 56
  %131 = or i64 %126, %130
  %132 = add nsw i32 %89, -8
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 8
  br label %147

134:                                              ; preds = %92, %134
  %135 = phi i32 [ %145, %134 ], [ 0, %92 ]
  %136 = phi i64 [ %144, %134 ], [ 0, %92 ]
  %137 = zext i32 %135 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 %137
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !19
  %140 = zext i8 %139 to i64
  %141 = shl i32 %135, 3
  %142 = zext i32 %141 to i64
  %143 = shl nuw i64 %140, %142
  %144 = or i64 %143, %136
  %145 = add nuw nsw i32 %135, 1
  %146 = icmp eq i32 %145, %89
  br i1 %146, label %147, label %134, !llvm.loop !20

147:                                              ; preds = %134, %94, %92
  %148 = phi i8 addrspace(4)* [ %133, %94 ], [ %81, %92 ], [ %81, %134 ]
  %149 = phi i32 [ %132, %94 ], [ 0, %92 ], [ 0, %134 ]
  %150 = phi i64 [ %131, %94 ], [ 0, %92 ], [ %144, %134 ]
  %151 = icmp ugt i32 %149, 7
  br i1 %151, label %154, label %152

152:                                              ; preds = %147
  %153 = icmp eq i32 %149, 0
  br i1 %153, label %207, label %194

154:                                              ; preds = %147
  %155 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !19
  %156 = zext i8 %155 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 1
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !19
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 8
  %161 = or i64 %160, %156
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 2
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !19
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 16
  %166 = or i64 %161, %165
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 3
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !19
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 24
  %171 = or i64 %166, %170
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 4
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !19
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 32
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 5
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !19
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 40
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 6
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !19
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 48
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 7
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !19
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
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !19
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
  %215 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !19
  %216 = zext i8 %215 to i64
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 1
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !19
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 8
  %221 = or i64 %220, %216
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 2
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !19
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 16
  %226 = or i64 %221, %225
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 3
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !19
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 24
  %231 = or i64 %226, %230
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 4
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !19
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 32
  %236 = or i64 %231, %235
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 5
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !19
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 40
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 6
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !19
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 48
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 7
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !19
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
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !19
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
  %275 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !19
  %276 = zext i8 %275 to i64
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 1
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !19
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 8
  %281 = or i64 %280, %276
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 2
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !19
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 16
  %286 = or i64 %281, %285
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 3
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !19
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 24
  %291 = or i64 %286, %290
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 4
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !19
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 32
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 5
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !19
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 40
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 6
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !19
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 48
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 7
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !19
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
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !19
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
  %335 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !19
  %336 = zext i8 %335 to i64
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 1
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !19
  %339 = zext i8 %338 to i64
  %340 = shl nuw nsw i64 %339, 8
  %341 = or i64 %340, %336
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 2
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !19
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 16
  %346 = or i64 %341, %345
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 3
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !19
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 24
  %351 = or i64 %346, %350
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 4
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !19
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 32
  %356 = or i64 %351, %355
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 5
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !19
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 40
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 6
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !19
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 48
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 7
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !19
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
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !19
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
  br i1 %393, label %447, label %434

394:                                              ; preds = %387
  %395 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !19
  %396 = zext i8 %395 to i64
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 1
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !19
  %399 = zext i8 %398 to i64
  %400 = shl nuw nsw i64 %399, 8
  %401 = or i64 %400, %396
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 2
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !19
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 16
  %406 = or i64 %401, %405
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 3
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !19
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 24
  %411 = or i64 %406, %410
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 4
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !19
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 32
  %416 = or i64 %411, %415
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 5
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !19
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 40
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 6
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !19
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 48
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 7
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !19
  %429 = zext i8 %428 to i64
  %430 = shl nuw i64 %429, 56
  %431 = or i64 %426, %430
  %432 = add nsw i32 %389, -8
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 8
  br label %447

434:                                              ; preds = %392, %434
  %435 = phi i32 [ %445, %434 ], [ 0, %392 ]
  %436 = phi i64 [ %444, %434 ], [ 0, %392 ]
  %437 = zext i32 %435 to i64
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 %437
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !19
  %440 = zext i8 %439 to i64
  %441 = shl i32 %435, 3
  %442 = zext i32 %441 to i64
  %443 = shl nuw i64 %440, %442
  %444 = or i64 %443, %436
  %445 = add nuw nsw i32 %435, 1
  %446 = icmp eq i32 %445, %389
  br i1 %446, label %447, label %434

447:                                              ; preds = %434, %394, %392
  %448 = phi i8 addrspace(4)* [ %433, %394 ], [ %388, %392 ], [ %388, %434 ]
  %449 = phi i32 [ %432, %394 ], [ 0, %392 ], [ 0, %434 ]
  %450 = phi i64 [ %431, %394 ], [ 0, %392 ], [ %444, %434 ]
  %451 = icmp ugt i32 %449, 7
  br i1 %451, label %454, label %452

452:                                              ; preds = %447
  %453 = icmp eq i32 %449, 0
  br i1 %453, label %505, label %492

454:                                              ; preds = %447
  %455 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !19
  %456 = zext i8 %455 to i64
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %448, i64 1
  %458 = load i8, i8 addrspace(4)* %457, align 1, !tbaa !19
  %459 = zext i8 %458 to i64
  %460 = shl nuw nsw i64 %459, 8
  %461 = or i64 %460, %456
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %448, i64 2
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !19
  %464 = zext i8 %463 to i64
  %465 = shl nuw nsw i64 %464, 16
  %466 = or i64 %461, %465
  %467 = getelementptr inbounds i8, i8 addrspace(4)* %448, i64 3
  %468 = load i8, i8 addrspace(4)* %467, align 1, !tbaa !19
  %469 = zext i8 %468 to i64
  %470 = shl nuw nsw i64 %469, 24
  %471 = or i64 %466, %470
  %472 = getelementptr inbounds i8, i8 addrspace(4)* %448, i64 4
  %473 = load i8, i8 addrspace(4)* %472, align 1, !tbaa !19
  %474 = zext i8 %473 to i64
  %475 = shl nuw nsw i64 %474, 32
  %476 = or i64 %471, %475
  %477 = getelementptr inbounds i8, i8 addrspace(4)* %448, i64 5
  %478 = load i8, i8 addrspace(4)* %477, align 1, !tbaa !19
  %479 = zext i8 %478 to i64
  %480 = shl nuw nsw i64 %479, 40
  %481 = or i64 %476, %480
  %482 = getelementptr inbounds i8, i8 addrspace(4)* %448, i64 6
  %483 = load i8, i8 addrspace(4)* %482, align 1, !tbaa !19
  %484 = zext i8 %483 to i64
  %485 = shl nuw nsw i64 %484, 48
  %486 = or i64 %481, %485
  %487 = getelementptr inbounds i8, i8 addrspace(4)* %448, i64 7
  %488 = load i8, i8 addrspace(4)* %487, align 1, !tbaa !19
  %489 = zext i8 %488 to i64
  %490 = shl nuw i64 %489, 56
  %491 = or i64 %486, %490
  br label %505

492:                                              ; preds = %452, %492
  %493 = phi i32 [ %503, %492 ], [ 0, %452 ]
  %494 = phi i64 [ %502, %492 ], [ 0, %452 ]
  %495 = zext i32 %493 to i64
  %496 = getelementptr inbounds i8, i8 addrspace(4)* %448, i64 %495
  %497 = load i8, i8 addrspace(4)* %496, align 1, !tbaa !19
  %498 = zext i8 %497 to i64
  %499 = shl i32 %493, 3
  %500 = zext i32 %499 to i64
  %501 = shl nuw i64 %498, %500
  %502 = or i64 %501, %494
  %503 = add nuw nsw i32 %493, 1
  %504 = icmp eq i32 %503, %449
  br i1 %504, label %505, label %492

505:                                              ; preds = %492, %454, %452
  %506 = phi i64 [ %491, %454 ], [ 0, %452 ], [ %502, %492 ]
  %507 = shl nuw nsw i64 %88, 2
  %508 = add nuw nsw i64 %507, 28
  %509 = and i64 %508, 480
  %510 = and i64 %90, -225
  %511 = or i64 %510, %509
  %512 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %68, i64 noundef %511, i64 noundef %150, i64 noundef %210, i64 noundef %270, i64 noundef %330, i64 noundef %390, i64 noundef %450, i64 noundef %506) #11
  %513 = sub i64 %80, %88
  %514 = getelementptr inbounds i8, i8 addrspace(4)* %81, i64 %88
  %515 = icmp eq i64 %513, 0
  br i1 %515, label %516, label %79

516:                                              ; preds = %505, %71
  %517 = phi <2 x i64> [ %74, %71 ], [ %512, %505 ]
  %518 = extractelement <2 x i64> %517, i64 0
  %519 = bitcast double %62 to i64
  %520 = and i64 %518, -227
  %521 = or i64 %520, 34
  %522 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %68, i64 noundef %521, i64 noundef %519, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %523

523:                                              ; preds = %516, %43
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !22
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !24
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !24
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !26
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !24
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !24
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !22
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !27
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !30
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !31
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !30
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !24
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !15
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !15
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !15
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !15
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !15
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !15
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !15
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !15
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %110 = call i64 @llvm.read_register.i64(metadata !32) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !33
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !35
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !36
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !27
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !30
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !37
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !37
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !38
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !40
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
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
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !19
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !15
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !30
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !27
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !37
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !37
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !19
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !{!17, !17, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !17, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !17, i64 0}
!26 = !{i64 2662}
!27 = !{!28, !23, i64 0}
!28 = !{!"", !23, i64 0, !23, i64 8, !29, i64 16, !16, i64 24, !16, i64 32, !16, i64 40}
!29 = !{!"hsa_signal_s", !16, i64 0}
!30 = !{!28, !16, i64 40}
!31 = !{!28, !23, i64 8}
!32 = !{!"exec"}
!33 = !{!34, !25, i64 16}
!34 = !{!"", !16, i64 0, !16, i64 8, !25, i64 16, !25, i64 20}
!35 = !{!34, !16, i64 8}
!36 = !{!34, !25, i64 20}
!37 = !{!34, !16, i64 0}
!38 = !{!39, !16, i64 16}
!39 = !{!"amd_signal_s", !16, i64 0, !17, i64 8, !16, i64 16, !25, i64 24, !25, i64 28, !16, i64 32, !16, i64 40, !17, i64 48, !17, i64 56}
!40 = !{!39, !25, i64 24}
