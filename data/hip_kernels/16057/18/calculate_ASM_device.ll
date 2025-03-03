; ModuleID = '../data/hip_kernels/16057/18/main.cu'
source_filename = "../data/hip_kernels/16057/18/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [11 x i8] c"ASM %f %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z13calculate_ASMPfS_ifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, float %3, i32 %4) local_unnamed_addr #1 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %14, %23
  %25 = icmp ult i32 %24, %4
  br i1 %25, label %26, label %32

26:                                               ; preds = %5
  %27 = zext i32 %24 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = fmul contract float %29, %29
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  store float %30, float addrspace(1)* %31, align 4, !tbaa !7
  br label %32

32:                                               ; preds = %26, %5
  %33 = icmp sgt i32 %4, 1
  br i1 %33, label %34, label %37

34:                                               ; preds = %32
  %35 = zext i32 %24 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  br label %39

37:                                               ; preds = %52, %32
  %38 = icmp eq i32 %24, 0
  br i1 %38, label %54, label %521

39:                                               ; preds = %34, %52
  %40 = phi i32 [ 1, %34 ], [ %41, %52 ]
  %41 = shl nsw i32 %40, 1
  %42 = add i32 %41, 1023
  %43 = and i32 %42, %6
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %52

45:                                               ; preds = %39
  %46 = add i32 %40, %24
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %51 = fadd contract float %49, %50
  store float %51, float addrspace(1)* %36, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %45, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp slt i32 %41, %4
  br i1 %53, label %39, label %37, !llvm.loop !11

54:                                               ; preds = %37
  %55 = load float, float addrspace(1)* %1, align 4, !tbaa !7
  %56 = fpext float %55 to double
  %57 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 24
  %59 = bitcast i8 addrspace(4)* %58 to i64 addrspace(4)*
  %60 = load i64, i64 addrspace(4)* %59, align 8, !tbaa !13
  %61 = inttoptr i64 %60 to i8 addrspace(1)*
  %62 = addrspacecast i8 addrspace(1)* %61 to i8*
  %63 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %64 = extractelement <2 x i64> %63, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %65, label %69

65:                                               ; preds = %54
  %66 = and i64 %64, -225
  %67 = or i64 %66, 32
  %68 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %67, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %510

69:                                               ; preds = %54
  %70 = and i64 %64, 2
  %71 = and i64 %64, -3
  %72 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %71, i64 0
  br label %73

73:                                               ; preds = %499, %69
  %74 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([11 x i8], [11 x i8] addrspace(4)* @.str, i64 0, i64 10) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([11 x i8]* addrspacecast ([11 x i8] addrspace(4)* @.str to [11 x i8]*) to i64)), i64 1))), %69 ], [ %507, %499 ]
  %75 = phi i8 addrspace(4)* [ getelementptr inbounds ([11 x i8], [11 x i8] addrspace(4)* @.str, i64 0, i64 0), %69 ], [ %508, %499 ]
  %76 = phi <2 x i64> [ %72, %69 ], [ %506, %499 ]
  %77 = icmp ugt i64 %74, 56
  %78 = extractelement <2 x i64> %76, i64 0
  %79 = or i64 %78, %70
  %80 = insertelement <2 x i64> poison, i64 %79, i64 0
  %81 = select i1 %77, <2 x i64> %76, <2 x i64> %80
  %82 = tail call i64 @llvm.umin.i64(i64 %74, i64 56)
  %83 = trunc i64 %82 to i32
  %84 = extractelement <2 x i64> %81, i64 0
  %85 = icmp ugt i32 %83, 7
  br i1 %85, label %88, label %86

86:                                               ; preds = %73
  %87 = icmp eq i32 %83, 0
  br i1 %87, label %141, label %128

88:                                               ; preds = %73
  %89 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !17
  %90 = zext i8 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 1
  %92 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !17
  %93 = zext i8 %92 to i64
  %94 = shl nuw nsw i64 %93, 8
  %95 = or i64 %94, %90
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 2
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !17
  %98 = zext i8 %97 to i64
  %99 = shl nuw nsw i64 %98, 16
  %100 = or i64 %95, %99
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 3
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !17
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 24
  %105 = or i64 %100, %104
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 4
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !17
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 32
  %110 = or i64 %105, %109
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 5
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !17
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 40
  %115 = or i64 %110, %114
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 6
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !17
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 48
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 7
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !17
  %123 = zext i8 %122 to i64
  %124 = shl nuw i64 %123, 56
  %125 = or i64 %120, %124
  %126 = add nsw i32 %83, -8
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 8
  br label %141

128:                                              ; preds = %86, %128
  %129 = phi i32 [ %139, %128 ], [ 0, %86 ]
  %130 = phi i64 [ %138, %128 ], [ 0, %86 ]
  %131 = zext i32 %129 to i64
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 %131
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !17
  %134 = zext i8 %133 to i64
  %135 = shl i32 %129, 3
  %136 = zext i32 %135 to i64
  %137 = shl nuw i64 %134, %136
  %138 = or i64 %137, %130
  %139 = add nuw nsw i32 %129, 1
  %140 = icmp eq i32 %139, %83
  br i1 %140, label %141, label %128, !llvm.loop !18

141:                                              ; preds = %128, %88, %86
  %142 = phi i8 addrspace(4)* [ %127, %88 ], [ %75, %86 ], [ %75, %128 ]
  %143 = phi i32 [ %126, %88 ], [ 0, %86 ], [ 0, %128 ]
  %144 = phi i64 [ %125, %88 ], [ 0, %86 ], [ %138, %128 ]
  %145 = icmp ugt i32 %143, 7
  br i1 %145, label %148, label %146

146:                                              ; preds = %141
  %147 = icmp eq i32 %143, 0
  br i1 %147, label %201, label %188

148:                                              ; preds = %141
  %149 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !17
  %150 = zext i8 %149 to i64
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 1
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !17
  %153 = zext i8 %152 to i64
  %154 = shl nuw nsw i64 %153, 8
  %155 = or i64 %154, %150
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 2
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !17
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 16
  %160 = or i64 %155, %159
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 3
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !17
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 24
  %165 = or i64 %160, %164
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 4
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !17
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 32
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 5
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !17
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 40
  %175 = or i64 %170, %174
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 6
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !17
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 48
  %180 = or i64 %175, %179
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 7
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !17
  %183 = zext i8 %182 to i64
  %184 = shl nuw i64 %183, 56
  %185 = or i64 %180, %184
  %186 = add nsw i32 %143, -8
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 8
  br label %201

188:                                              ; preds = %146, %188
  %189 = phi i32 [ %199, %188 ], [ 0, %146 ]
  %190 = phi i64 [ %198, %188 ], [ 0, %146 ]
  %191 = zext i32 %189 to i64
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %142, i64 %191
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !17
  %194 = zext i8 %193 to i64
  %195 = shl i32 %189, 3
  %196 = zext i32 %195 to i64
  %197 = shl nuw i64 %194, %196
  %198 = or i64 %197, %190
  %199 = add nuw nsw i32 %189, 1
  %200 = icmp eq i32 %199, %143
  br i1 %200, label %201, label %188

201:                                              ; preds = %188, %148, %146
  %202 = phi i8 addrspace(4)* [ %187, %148 ], [ %142, %146 ], [ %142, %188 ]
  %203 = phi i32 [ %186, %148 ], [ 0, %146 ], [ 0, %188 ]
  %204 = phi i64 [ %185, %148 ], [ 0, %146 ], [ %198, %188 ]
  %205 = icmp ugt i32 %203, 7
  br i1 %205, label %208, label %206

206:                                              ; preds = %201
  %207 = icmp eq i32 %203, 0
  br i1 %207, label %261, label %248

208:                                              ; preds = %201
  %209 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !17
  %210 = zext i8 %209 to i64
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 1
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !17
  %213 = zext i8 %212 to i64
  %214 = shl nuw nsw i64 %213, 8
  %215 = or i64 %214, %210
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 2
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !17
  %218 = zext i8 %217 to i64
  %219 = shl nuw nsw i64 %218, 16
  %220 = or i64 %215, %219
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 3
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !17
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 24
  %225 = or i64 %220, %224
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 4
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !17
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 32
  %230 = or i64 %225, %229
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 5
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !17
  %233 = zext i8 %232 to i64
  %234 = shl nuw nsw i64 %233, 40
  %235 = or i64 %230, %234
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 6
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !17
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 48
  %240 = or i64 %235, %239
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 7
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !17
  %243 = zext i8 %242 to i64
  %244 = shl nuw i64 %243, 56
  %245 = or i64 %240, %244
  %246 = add nsw i32 %203, -8
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 8
  br label %261

248:                                              ; preds = %206, %248
  %249 = phi i32 [ %259, %248 ], [ 0, %206 ]
  %250 = phi i64 [ %258, %248 ], [ 0, %206 ]
  %251 = zext i32 %249 to i64
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %202, i64 %251
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !17
  %254 = zext i8 %253 to i64
  %255 = shl i32 %249, 3
  %256 = zext i32 %255 to i64
  %257 = shl nuw i64 %254, %256
  %258 = or i64 %257, %250
  %259 = add nuw nsw i32 %249, 1
  %260 = icmp eq i32 %259, %203
  br i1 %260, label %261, label %248

261:                                              ; preds = %248, %208, %206
  %262 = phi i8 addrspace(4)* [ %247, %208 ], [ %202, %206 ], [ %202, %248 ]
  %263 = phi i32 [ %246, %208 ], [ 0, %206 ], [ 0, %248 ]
  %264 = phi i64 [ %245, %208 ], [ 0, %206 ], [ %258, %248 ]
  %265 = icmp ugt i32 %263, 7
  br i1 %265, label %268, label %266

266:                                              ; preds = %261
  %267 = icmp eq i32 %263, 0
  br i1 %267, label %321, label %308

268:                                              ; preds = %261
  %269 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !17
  %270 = zext i8 %269 to i64
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 1
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !17
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 8
  %275 = or i64 %274, %270
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 2
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !17
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 16
  %280 = or i64 %275, %279
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 3
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !17
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 24
  %285 = or i64 %280, %284
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 4
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !17
  %288 = zext i8 %287 to i64
  %289 = shl nuw nsw i64 %288, 32
  %290 = or i64 %285, %289
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 5
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !17
  %293 = zext i8 %292 to i64
  %294 = shl nuw nsw i64 %293, 40
  %295 = or i64 %290, %294
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 6
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !17
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 48
  %300 = or i64 %295, %299
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 7
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !17
  %303 = zext i8 %302 to i64
  %304 = shl nuw i64 %303, 56
  %305 = or i64 %300, %304
  %306 = add nsw i32 %263, -8
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 8
  br label %321

308:                                              ; preds = %266, %308
  %309 = phi i32 [ %319, %308 ], [ 0, %266 ]
  %310 = phi i64 [ %318, %308 ], [ 0, %266 ]
  %311 = zext i32 %309 to i64
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %262, i64 %311
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !17
  %314 = zext i8 %313 to i64
  %315 = shl i32 %309, 3
  %316 = zext i32 %315 to i64
  %317 = shl nuw i64 %314, %316
  %318 = or i64 %317, %310
  %319 = add nuw nsw i32 %309, 1
  %320 = icmp eq i32 %319, %263
  br i1 %320, label %321, label %308

321:                                              ; preds = %308, %268, %266
  %322 = phi i8 addrspace(4)* [ %307, %268 ], [ %262, %266 ], [ %262, %308 ]
  %323 = phi i32 [ %306, %268 ], [ 0, %266 ], [ 0, %308 ]
  %324 = phi i64 [ %305, %268 ], [ 0, %266 ], [ %318, %308 ]
  %325 = icmp ugt i32 %323, 7
  br i1 %325, label %328, label %326

326:                                              ; preds = %321
  %327 = icmp eq i32 %323, 0
  br i1 %327, label %381, label %368

328:                                              ; preds = %321
  %329 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !17
  %330 = zext i8 %329 to i64
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 1
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !17
  %333 = zext i8 %332 to i64
  %334 = shl nuw nsw i64 %333, 8
  %335 = or i64 %334, %330
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 2
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !17
  %338 = zext i8 %337 to i64
  %339 = shl nuw nsw i64 %338, 16
  %340 = or i64 %335, %339
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 3
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !17
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 24
  %345 = or i64 %340, %344
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 4
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !17
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 32
  %350 = or i64 %345, %349
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 5
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !17
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 40
  %355 = or i64 %350, %354
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 6
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !17
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 48
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 7
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !17
  %363 = zext i8 %362 to i64
  %364 = shl nuw i64 %363, 56
  %365 = or i64 %360, %364
  %366 = add nsw i32 %323, -8
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 8
  br label %381

368:                                              ; preds = %326, %368
  %369 = phi i32 [ %379, %368 ], [ 0, %326 ]
  %370 = phi i64 [ %378, %368 ], [ 0, %326 ]
  %371 = zext i32 %369 to i64
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %322, i64 %371
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !17
  %374 = zext i8 %373 to i64
  %375 = shl i32 %369, 3
  %376 = zext i32 %375 to i64
  %377 = shl nuw i64 %374, %376
  %378 = or i64 %377, %370
  %379 = add nuw nsw i32 %369, 1
  %380 = icmp eq i32 %379, %323
  br i1 %380, label %381, label %368

381:                                              ; preds = %368, %328, %326
  %382 = phi i8 addrspace(4)* [ %367, %328 ], [ %322, %326 ], [ %322, %368 ]
  %383 = phi i32 [ %366, %328 ], [ 0, %326 ], [ 0, %368 ]
  %384 = phi i64 [ %365, %328 ], [ 0, %326 ], [ %378, %368 ]
  %385 = icmp ugt i32 %383, 7
  br i1 %385, label %388, label %386

386:                                              ; preds = %381
  %387 = icmp eq i32 %383, 0
  br i1 %387, label %441, label %428

388:                                              ; preds = %381
  %389 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !17
  %390 = zext i8 %389 to i64
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 1
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !17
  %393 = zext i8 %392 to i64
  %394 = shl nuw nsw i64 %393, 8
  %395 = or i64 %394, %390
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 2
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !17
  %398 = zext i8 %397 to i64
  %399 = shl nuw nsw i64 %398, 16
  %400 = or i64 %395, %399
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 3
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !17
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 24
  %405 = or i64 %400, %404
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 4
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !17
  %408 = zext i8 %407 to i64
  %409 = shl nuw nsw i64 %408, 32
  %410 = or i64 %405, %409
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 5
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !17
  %413 = zext i8 %412 to i64
  %414 = shl nuw nsw i64 %413, 40
  %415 = or i64 %410, %414
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 6
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !17
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 48
  %420 = or i64 %415, %419
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 7
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !17
  %423 = zext i8 %422 to i64
  %424 = shl nuw i64 %423, 56
  %425 = or i64 %420, %424
  %426 = add nsw i32 %383, -8
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 8
  br label %441

428:                                              ; preds = %386, %428
  %429 = phi i32 [ %439, %428 ], [ 0, %386 ]
  %430 = phi i64 [ %438, %428 ], [ 0, %386 ]
  %431 = zext i32 %429 to i64
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %382, i64 %431
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !17
  %434 = zext i8 %433 to i64
  %435 = shl i32 %429, 3
  %436 = zext i32 %435 to i64
  %437 = shl nuw i64 %434, %436
  %438 = or i64 %437, %430
  %439 = add nuw nsw i32 %429, 1
  %440 = icmp eq i32 %439, %383
  br i1 %440, label %441, label %428

441:                                              ; preds = %428, %388, %386
  %442 = phi i8 addrspace(4)* [ %427, %388 ], [ %382, %386 ], [ %382, %428 ]
  %443 = phi i32 [ %426, %388 ], [ 0, %386 ], [ 0, %428 ]
  %444 = phi i64 [ %425, %388 ], [ 0, %386 ], [ %438, %428 ]
  %445 = icmp ugt i32 %443, 7
  br i1 %445, label %448, label %446

446:                                              ; preds = %441
  %447 = icmp eq i32 %443, 0
  br i1 %447, label %499, label %486

448:                                              ; preds = %441
  %449 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !17
  %450 = zext i8 %449 to i64
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %442, i64 1
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !17
  %453 = zext i8 %452 to i64
  %454 = shl nuw nsw i64 %453, 8
  %455 = or i64 %454, %450
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %442, i64 2
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !17
  %458 = zext i8 %457 to i64
  %459 = shl nuw nsw i64 %458, 16
  %460 = or i64 %455, %459
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %442, i64 3
  %462 = load i8, i8 addrspace(4)* %461, align 1, !tbaa !17
  %463 = zext i8 %462 to i64
  %464 = shl nuw nsw i64 %463, 24
  %465 = or i64 %460, %464
  %466 = getelementptr inbounds i8, i8 addrspace(4)* %442, i64 4
  %467 = load i8, i8 addrspace(4)* %466, align 1, !tbaa !17
  %468 = zext i8 %467 to i64
  %469 = shl nuw nsw i64 %468, 32
  %470 = or i64 %465, %469
  %471 = getelementptr inbounds i8, i8 addrspace(4)* %442, i64 5
  %472 = load i8, i8 addrspace(4)* %471, align 1, !tbaa !17
  %473 = zext i8 %472 to i64
  %474 = shl nuw nsw i64 %473, 40
  %475 = or i64 %470, %474
  %476 = getelementptr inbounds i8, i8 addrspace(4)* %442, i64 6
  %477 = load i8, i8 addrspace(4)* %476, align 1, !tbaa !17
  %478 = zext i8 %477 to i64
  %479 = shl nuw nsw i64 %478, 48
  %480 = or i64 %475, %479
  %481 = getelementptr inbounds i8, i8 addrspace(4)* %442, i64 7
  %482 = load i8, i8 addrspace(4)* %481, align 1, !tbaa !17
  %483 = zext i8 %482 to i64
  %484 = shl nuw i64 %483, 56
  %485 = or i64 %480, %484
  br label %499

486:                                              ; preds = %446, %486
  %487 = phi i32 [ %497, %486 ], [ 0, %446 ]
  %488 = phi i64 [ %496, %486 ], [ 0, %446 ]
  %489 = zext i32 %487 to i64
  %490 = getelementptr inbounds i8, i8 addrspace(4)* %442, i64 %489
  %491 = load i8, i8 addrspace(4)* %490, align 1, !tbaa !17
  %492 = zext i8 %491 to i64
  %493 = shl i32 %487, 3
  %494 = zext i32 %493 to i64
  %495 = shl nuw i64 %492, %494
  %496 = or i64 %495, %488
  %497 = add nuw nsw i32 %487, 1
  %498 = icmp eq i32 %497, %443
  br i1 %498, label %499, label %486

499:                                              ; preds = %486, %448, %446
  %500 = phi i64 [ %485, %448 ], [ 0, %446 ], [ %496, %486 ]
  %501 = shl nuw nsw i64 %82, 2
  %502 = add nuw nsw i64 %501, 28
  %503 = and i64 %502, 480
  %504 = and i64 %84, -225
  %505 = or i64 %504, %503
  %506 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %505, i64 noundef %144, i64 noundef %204, i64 noundef %264, i64 noundef %324, i64 noundef %384, i64 noundef %444, i64 noundef %500) #11
  %507 = sub i64 %74, %82
  %508 = getelementptr inbounds i8, i8 addrspace(4)* %75, i64 %82
  %509 = icmp eq i64 %507, 0
  br i1 %509, label %510, label %73

510:                                              ; preds = %499, %65
  %511 = phi <2 x i64> [ %68, %65 ], [ %506, %499 ]
  %512 = extractelement <2 x i64> %511, i64 0
  %513 = bitcast double %56 to i64
  %514 = and i64 %512, -225
  %515 = or i64 %514, 32
  %516 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %515, i64 noundef %513, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %517 = extractelement <2 x i64> %516, i64 0
  %518 = and i64 %517, -227
  %519 = or i64 %518, 34
  %520 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %62, i64 noundef %519, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %521

521:                                              ; preds = %510, %37
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !20
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !22
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !13
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !13
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !13
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !13
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !13
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !13
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !13
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !13
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !22
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !22
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !28
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !28
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !13
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !28
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !29
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !28
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !22
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !13
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !13
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !13
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !13
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !13
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !13
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !13
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !13
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %110 = call i64 @llvm.read_register.i64(metadata !30) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !31
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !33
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !34
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !13
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !13
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !13
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !13
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !13
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !13
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !13
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !13
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !25
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !28
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !35
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !35
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !36
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !38
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
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !13
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !13
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !28
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !25
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !35
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !35
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !{!15, !15, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !15, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !15, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !21, i64 0}
!26 = !{!"", !21, i64 0, !21, i64 8, !27, i64 16, !14, i64 24, !14, i64 32, !14, i64 40}
!27 = !{!"hsa_signal_s", !14, i64 0}
!28 = !{!26, !14, i64 40}
!29 = !{!26, !21, i64 8}
!30 = !{!"exec"}
!31 = !{!32, !23, i64 16}
!32 = !{!"", !14, i64 0, !14, i64 8, !23, i64 16, !23, i64 20}
!33 = !{!32, !14, i64 8}
!34 = !{!32, !23, i64 20}
!35 = !{!32, !14, i64 0}
!36 = !{!37, !14, i64 16}
!37 = !{!"amd_signal_s", !14, i64 0, !15, i64 8, !14, i64 16, !23, i64 24, !23, i64 28, !14, i64 32, !14, i64 40, !15, i64 48, !15, i64 56}
!38 = !{!37, !23, i64 24}
