; ModuleID = '../data/hip_kernels/15412/39/main.cu'
source_filename = "../data/hip_kernels/15412/39/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [44 x i8] c" i: %d - one = %f, two = %f, diff = %f %% \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z23compare_2_arrays_kernelPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %505

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = fsub contract float %17, %19
  %21 = tail call float @llvm.fabs.f32(float %20)
  %22 = fmul contract float %21, 1.000000e+02
  %23 = tail call float @llvm.fabs.f32(float %17)
  %24 = fdiv contract float %22, %23
  %25 = fcmp contract ogt float %24, 1.000000e+01
  br i1 %25, label %26, label %505

26:                                               ; preds = %14
  %27 = fpext float %17 to double
  %28 = fpext float %19 to double
  %29 = fpext float %24 to double
  %30 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %31 = getelementptr inbounds i8, i8 addrspace(4)* %30, i64 24
  %32 = bitcast i8 addrspace(4)* %31 to i64 addrspace(4)*
  %33 = load i64, i64 addrspace(4)* %32, align 8, !tbaa !11
  %34 = inttoptr i64 %33 to i8 addrspace(1)*
  %35 = addrspacecast i8 addrspace(1)* %34 to i8*
  %36 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %37 = extractelement <2 x i64> %36, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %38, label %42

38:                                               ; preds = %26
  %39 = and i64 %37, -225
  %40 = or i64 %39, 32
  %41 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %40, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %483

42:                                               ; preds = %26
  %43 = and i64 %37, 2
  %44 = and i64 %37, -3
  %45 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %44, i64 0
  br label %46

46:                                               ; preds = %472, %42
  %47 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str, i64 0, i64 43) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([44 x i8]* addrspacecast ([44 x i8] addrspace(4)* @.str to [44 x i8]*) to i64)), i64 1))), %42 ], [ %480, %472 ]
  %48 = phi i8 addrspace(4)* [ getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str, i64 0, i64 0), %42 ], [ %481, %472 ]
  %49 = phi <2 x i64> [ %45, %42 ], [ %479, %472 ]
  %50 = icmp ugt i64 %47, 56
  %51 = extractelement <2 x i64> %49, i64 0
  %52 = or i64 %51, %43
  %53 = insertelement <2 x i64> poison, i64 %52, i64 0
  %54 = select i1 %50, <2 x i64> %49, <2 x i64> %53
  %55 = tail call i64 @llvm.umin.i64(i64 %47, i64 56)
  %56 = trunc i64 %55 to i32
  %57 = extractelement <2 x i64> %54, i64 0
  %58 = icmp ugt i32 %56, 7
  br i1 %58, label %61, label %59

59:                                               ; preds = %46
  %60 = icmp eq i32 %56, 0
  br i1 %60, label %114, label %101

61:                                               ; preds = %46
  %62 = load i8, i8 addrspace(4)* %48, align 1, !tbaa !15
  %63 = zext i8 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 1
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !15
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 8
  %68 = or i64 %67, %63
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 2
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !15
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 16
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 3
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !15
  %76 = zext i8 %75 to i64
  %77 = shl nuw nsw i64 %76, 24
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 4
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !15
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 32
  %83 = or i64 %78, %82
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 5
  %85 = load i8, i8 addrspace(4)* %84, align 1, !tbaa !15
  %86 = zext i8 %85 to i64
  %87 = shl nuw nsw i64 %86, 40
  %88 = or i64 %83, %87
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 6
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !15
  %91 = zext i8 %90 to i64
  %92 = shl nuw nsw i64 %91, 48
  %93 = or i64 %88, %92
  %94 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 7
  %95 = load i8, i8 addrspace(4)* %94, align 1, !tbaa !15
  %96 = zext i8 %95 to i64
  %97 = shl nuw i64 %96, 56
  %98 = or i64 %93, %97
  %99 = add nsw i32 %56, -8
  %100 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 8
  br label %114

101:                                              ; preds = %59, %101
  %102 = phi i32 [ %112, %101 ], [ 0, %59 ]
  %103 = phi i64 [ %111, %101 ], [ 0, %59 ]
  %104 = zext i32 %102 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 %104
  %106 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !15
  %107 = zext i8 %106 to i64
  %108 = shl i32 %102, 3
  %109 = zext i32 %108 to i64
  %110 = shl nuw i64 %107, %109
  %111 = or i64 %110, %103
  %112 = add nuw nsw i32 %102, 1
  %113 = icmp eq i32 %112, %56
  br i1 %113, label %114, label %101, !llvm.loop !16

114:                                              ; preds = %101, %61, %59
  %115 = phi i8 addrspace(4)* [ %100, %61 ], [ %48, %59 ], [ %48, %101 ]
  %116 = phi i32 [ %99, %61 ], [ 0, %59 ], [ 0, %101 ]
  %117 = phi i64 [ %98, %61 ], [ 0, %59 ], [ %111, %101 ]
  %118 = icmp ugt i32 %116, 7
  br i1 %118, label %121, label %119

119:                                              ; preds = %114
  %120 = icmp eq i32 %116, 0
  br i1 %120, label %174, label %161

121:                                              ; preds = %114
  %122 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !15
  %123 = zext i8 %122 to i64
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 1
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !15
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 8
  %128 = or i64 %127, %123
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 2
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !15
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 16
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 3
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !15
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 24
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 4
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !15
  %141 = zext i8 %140 to i64
  %142 = shl nuw nsw i64 %141, 32
  %143 = or i64 %138, %142
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 5
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !15
  %146 = zext i8 %145 to i64
  %147 = shl nuw nsw i64 %146, 40
  %148 = or i64 %143, %147
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 6
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !15
  %151 = zext i8 %150 to i64
  %152 = shl nuw nsw i64 %151, 48
  %153 = or i64 %148, %152
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 7
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !15
  %156 = zext i8 %155 to i64
  %157 = shl nuw i64 %156, 56
  %158 = or i64 %153, %157
  %159 = add nsw i32 %116, -8
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 8
  br label %174

161:                                              ; preds = %119, %161
  %162 = phi i32 [ %172, %161 ], [ 0, %119 ]
  %163 = phi i64 [ %171, %161 ], [ 0, %119 ]
  %164 = zext i32 %162 to i64
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 %164
  %166 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !15
  %167 = zext i8 %166 to i64
  %168 = shl i32 %162, 3
  %169 = zext i32 %168 to i64
  %170 = shl nuw i64 %167, %169
  %171 = or i64 %170, %163
  %172 = add nuw nsw i32 %162, 1
  %173 = icmp eq i32 %172, %116
  br i1 %173, label %174, label %161

174:                                              ; preds = %161, %121, %119
  %175 = phi i8 addrspace(4)* [ %160, %121 ], [ %115, %119 ], [ %115, %161 ]
  %176 = phi i32 [ %159, %121 ], [ 0, %119 ], [ 0, %161 ]
  %177 = phi i64 [ %158, %121 ], [ 0, %119 ], [ %171, %161 ]
  %178 = icmp ugt i32 %176, 7
  br i1 %178, label %181, label %179

179:                                              ; preds = %174
  %180 = icmp eq i32 %176, 0
  br i1 %180, label %234, label %221

181:                                              ; preds = %174
  %182 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !15
  %183 = zext i8 %182 to i64
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 1
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !15
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 8
  %188 = or i64 %187, %183
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 2
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !15
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 16
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 3
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !15
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 24
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 4
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !15
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 32
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 5
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !15
  %206 = zext i8 %205 to i64
  %207 = shl nuw nsw i64 %206, 40
  %208 = or i64 %203, %207
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 6
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !15
  %211 = zext i8 %210 to i64
  %212 = shl nuw nsw i64 %211, 48
  %213 = or i64 %208, %212
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 7
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !15
  %216 = zext i8 %215 to i64
  %217 = shl nuw i64 %216, 56
  %218 = or i64 %213, %217
  %219 = add nsw i32 %176, -8
  %220 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 8
  br label %234

221:                                              ; preds = %179, %221
  %222 = phi i32 [ %232, %221 ], [ 0, %179 ]
  %223 = phi i64 [ %231, %221 ], [ 0, %179 ]
  %224 = zext i32 %222 to i64
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %175, i64 %224
  %226 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !15
  %227 = zext i8 %226 to i64
  %228 = shl i32 %222, 3
  %229 = zext i32 %228 to i64
  %230 = shl nuw i64 %227, %229
  %231 = or i64 %230, %223
  %232 = add nuw nsw i32 %222, 1
  %233 = icmp eq i32 %232, %176
  br i1 %233, label %234, label %221

234:                                              ; preds = %221, %181, %179
  %235 = phi i8 addrspace(4)* [ %220, %181 ], [ %175, %179 ], [ %175, %221 ]
  %236 = phi i32 [ %219, %181 ], [ 0, %179 ], [ 0, %221 ]
  %237 = phi i64 [ %218, %181 ], [ 0, %179 ], [ %231, %221 ]
  %238 = icmp ugt i32 %236, 7
  br i1 %238, label %241, label %239

239:                                              ; preds = %234
  %240 = icmp eq i32 %236, 0
  br i1 %240, label %294, label %281

241:                                              ; preds = %234
  %242 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !15
  %243 = zext i8 %242 to i64
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 1
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !15
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 8
  %248 = or i64 %247, %243
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 2
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !15
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 16
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 3
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !15
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 24
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 4
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !15
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 32
  %263 = or i64 %258, %262
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 5
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !15
  %266 = zext i8 %265 to i64
  %267 = shl nuw nsw i64 %266, 40
  %268 = or i64 %263, %267
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 6
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !15
  %271 = zext i8 %270 to i64
  %272 = shl nuw nsw i64 %271, 48
  %273 = or i64 %268, %272
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 7
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !15
  %276 = zext i8 %275 to i64
  %277 = shl nuw i64 %276, 56
  %278 = or i64 %273, %277
  %279 = add nsw i32 %236, -8
  %280 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 8
  br label %294

281:                                              ; preds = %239, %281
  %282 = phi i32 [ %292, %281 ], [ 0, %239 ]
  %283 = phi i64 [ %291, %281 ], [ 0, %239 ]
  %284 = zext i32 %282 to i64
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %235, i64 %284
  %286 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !15
  %287 = zext i8 %286 to i64
  %288 = shl i32 %282, 3
  %289 = zext i32 %288 to i64
  %290 = shl nuw i64 %287, %289
  %291 = or i64 %290, %283
  %292 = add nuw nsw i32 %282, 1
  %293 = icmp eq i32 %292, %236
  br i1 %293, label %294, label %281

294:                                              ; preds = %281, %241, %239
  %295 = phi i8 addrspace(4)* [ %280, %241 ], [ %235, %239 ], [ %235, %281 ]
  %296 = phi i32 [ %279, %241 ], [ 0, %239 ], [ 0, %281 ]
  %297 = phi i64 [ %278, %241 ], [ 0, %239 ], [ %291, %281 ]
  %298 = icmp ugt i32 %296, 7
  br i1 %298, label %301, label %299

299:                                              ; preds = %294
  %300 = icmp eq i32 %296, 0
  br i1 %300, label %354, label %341

301:                                              ; preds = %294
  %302 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !15
  %303 = zext i8 %302 to i64
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 1
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !15
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 8
  %308 = or i64 %307, %303
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 2
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !15
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 16
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 3
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !15
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 24
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 4
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !15
  %321 = zext i8 %320 to i64
  %322 = shl nuw nsw i64 %321, 32
  %323 = or i64 %318, %322
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 5
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !15
  %326 = zext i8 %325 to i64
  %327 = shl nuw nsw i64 %326, 40
  %328 = or i64 %323, %327
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 6
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !15
  %331 = zext i8 %330 to i64
  %332 = shl nuw nsw i64 %331, 48
  %333 = or i64 %328, %332
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 7
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !15
  %336 = zext i8 %335 to i64
  %337 = shl nuw i64 %336, 56
  %338 = or i64 %333, %337
  %339 = add nsw i32 %296, -8
  %340 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 8
  br label %354

341:                                              ; preds = %299, %341
  %342 = phi i32 [ %352, %341 ], [ 0, %299 ]
  %343 = phi i64 [ %351, %341 ], [ 0, %299 ]
  %344 = zext i32 %342 to i64
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %295, i64 %344
  %346 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !15
  %347 = zext i8 %346 to i64
  %348 = shl i32 %342, 3
  %349 = zext i32 %348 to i64
  %350 = shl nuw i64 %347, %349
  %351 = or i64 %350, %343
  %352 = add nuw nsw i32 %342, 1
  %353 = icmp eq i32 %352, %296
  br i1 %353, label %354, label %341

354:                                              ; preds = %341, %301, %299
  %355 = phi i8 addrspace(4)* [ %340, %301 ], [ %295, %299 ], [ %295, %341 ]
  %356 = phi i32 [ %339, %301 ], [ 0, %299 ], [ 0, %341 ]
  %357 = phi i64 [ %338, %301 ], [ 0, %299 ], [ %351, %341 ]
  %358 = icmp ugt i32 %356, 7
  br i1 %358, label %361, label %359

359:                                              ; preds = %354
  %360 = icmp eq i32 %356, 0
  br i1 %360, label %414, label %401

361:                                              ; preds = %354
  %362 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !15
  %363 = zext i8 %362 to i64
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 1
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !15
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 8
  %368 = or i64 %367, %363
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 2
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !15
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 16
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 3
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !15
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 24
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 4
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !15
  %381 = zext i8 %380 to i64
  %382 = shl nuw nsw i64 %381, 32
  %383 = or i64 %378, %382
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 5
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !15
  %386 = zext i8 %385 to i64
  %387 = shl nuw nsw i64 %386, 40
  %388 = or i64 %383, %387
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 6
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !15
  %391 = zext i8 %390 to i64
  %392 = shl nuw nsw i64 %391, 48
  %393 = or i64 %388, %392
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 7
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !15
  %396 = zext i8 %395 to i64
  %397 = shl nuw i64 %396, 56
  %398 = or i64 %393, %397
  %399 = add nsw i32 %356, -8
  %400 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 8
  br label %414

401:                                              ; preds = %359, %401
  %402 = phi i32 [ %412, %401 ], [ 0, %359 ]
  %403 = phi i64 [ %411, %401 ], [ 0, %359 ]
  %404 = zext i32 %402 to i64
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %355, i64 %404
  %406 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !15
  %407 = zext i8 %406 to i64
  %408 = shl i32 %402, 3
  %409 = zext i32 %408 to i64
  %410 = shl nuw i64 %407, %409
  %411 = or i64 %410, %403
  %412 = add nuw nsw i32 %402, 1
  %413 = icmp eq i32 %412, %356
  br i1 %413, label %414, label %401

414:                                              ; preds = %401, %361, %359
  %415 = phi i8 addrspace(4)* [ %400, %361 ], [ %355, %359 ], [ %355, %401 ]
  %416 = phi i32 [ %399, %361 ], [ 0, %359 ], [ 0, %401 ]
  %417 = phi i64 [ %398, %361 ], [ 0, %359 ], [ %411, %401 ]
  %418 = icmp ugt i32 %416, 7
  br i1 %418, label %421, label %419

419:                                              ; preds = %414
  %420 = icmp eq i32 %416, 0
  br i1 %420, label %472, label %459

421:                                              ; preds = %414
  %422 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !15
  %423 = zext i8 %422 to i64
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 1
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !15
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 8
  %428 = or i64 %427, %423
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 2
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !15
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 16
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 3
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !15
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 24
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 4
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !15
  %441 = zext i8 %440 to i64
  %442 = shl nuw nsw i64 %441, 32
  %443 = or i64 %438, %442
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 5
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !15
  %446 = zext i8 %445 to i64
  %447 = shl nuw nsw i64 %446, 40
  %448 = or i64 %443, %447
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 6
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !15
  %451 = zext i8 %450 to i64
  %452 = shl nuw nsw i64 %451, 48
  %453 = or i64 %448, %452
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 7
  %455 = load i8, i8 addrspace(4)* %454, align 1, !tbaa !15
  %456 = zext i8 %455 to i64
  %457 = shl nuw i64 %456, 56
  %458 = or i64 %453, %457
  br label %472

459:                                              ; preds = %419, %459
  %460 = phi i32 [ %470, %459 ], [ 0, %419 ]
  %461 = phi i64 [ %469, %459 ], [ 0, %419 ]
  %462 = zext i32 %460 to i64
  %463 = getelementptr inbounds i8, i8 addrspace(4)* %415, i64 %462
  %464 = load i8, i8 addrspace(4)* %463, align 1, !tbaa !15
  %465 = zext i8 %464 to i64
  %466 = shl i32 %460, 3
  %467 = zext i32 %466 to i64
  %468 = shl nuw i64 %465, %467
  %469 = or i64 %468, %461
  %470 = add nuw nsw i32 %460, 1
  %471 = icmp eq i32 %470, %416
  br i1 %471, label %472, label %459

472:                                              ; preds = %459, %421, %419
  %473 = phi i64 [ %458, %421 ], [ 0, %419 ], [ %469, %459 ]
  %474 = shl nuw nsw i64 %55, 2
  %475 = add nuw nsw i64 %474, 28
  %476 = and i64 %475, 480
  %477 = and i64 %57, -225
  %478 = or i64 %477, %476
  %479 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %478, i64 noundef %117, i64 noundef %177, i64 noundef %237, i64 noundef %297, i64 noundef %357, i64 noundef %417, i64 noundef %473) #10
  %480 = sub i64 %47, %55
  %481 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 %55
  %482 = icmp eq i64 %480, 0
  br i1 %482, label %483, label %46

483:                                              ; preds = %472, %38
  %484 = phi <2 x i64> [ %41, %38 ], [ %479, %472 ]
  %485 = extractelement <2 x i64> %484, i64 0
  %486 = zext i32 %12 to i64
  %487 = and i64 %485, -225
  %488 = or i64 %487, 32
  %489 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %488, i64 noundef %486, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %490 = extractelement <2 x i64> %489, i64 0
  %491 = bitcast double %27 to i64
  %492 = and i64 %490, -225
  %493 = or i64 %492, 32
  %494 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %493, i64 noundef %491, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %495 = extractelement <2 x i64> %494, i64 0
  %496 = bitcast double %28 to i64
  %497 = and i64 %495, -225
  %498 = or i64 %497, 32
  %499 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %498, i64 noundef %496, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %500 = extractelement <2 x i64> %499, i64 0
  %501 = bitcast double %29 to i64
  %502 = and i64 %500, -227
  %503 = or i64 %502, 34
  %504 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %35, i64 noundef %503, i64 noundef %501, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %505

505:                                              ; preds = %14, %483, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

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
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !20
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !20
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !20
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !18
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
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
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
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
