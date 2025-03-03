; ModuleID = '../data/hip_kernels/15063/1/main.cu'
source_filename = "../data/hip_kernels/15063/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [21 x i8] c"total: %f, Bias: %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z11FirstHiddenPfS_S_iS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #1 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = icmp sgt i32 %3, 0
  br i1 %15, label %16, label %43

16:                                               ; preds = %5
  %17 = mul nsw i32 %14, %3
  %18 = and i32 %3, 7
  %19 = icmp ult i32 %3, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %16
  %21 = and i32 %3, -8
  br label %56

22:                                               ; preds = %56, %16
  %23 = phi float [ undef, %16 ], [ %138, %56 ]
  %24 = phi float [ 0.000000e+00, %16 ], [ %138, %56 ]
  %25 = phi i32 [ 0, %16 ], [ %139, %56 ]
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %43, label %27

27:                                               ; preds = %22, %27
  %28 = phi float [ %39, %27 ], [ %24, %22 ]
  %29 = phi i32 [ %40, %27 ], [ %25, %22 ]
  %30 = phi i32 [ %41, %27 ], [ 0, %22 ]
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = add nsw i32 %29, %17
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = fmul contract float %33, %37
  %39 = fadd contract float %28, %38
  %40 = add nuw nsw i32 %29, 1
  %41 = add i32 %30, 1
  %42 = icmp eq i32 %41, %18
  br i1 %42, label %43, label %27, !llvm.loop !11

43:                                               ; preds = %22, %27, %5
  %44 = phi float [ 0.000000e+00, %5 ], [ %23, %22 ], [ %39, %27 ]
  %45 = sext i32 %14 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !6
  %48 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 24
  %50 = bitcast i8 addrspace(4)* %49 to i64 addrspace(4)*
  %51 = load i64, i64 addrspace(4)* %50, align 8, !tbaa !13
  %52 = inttoptr i64 %51 to i8 addrspace(1)*
  %53 = addrspacecast i8 addrspace(1)* %52 to i8*
  %54 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %55 = extractelement <2 x i64> %54, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %142, label %146

56:                                               ; preds = %56, %20
  %57 = phi float [ 0.000000e+00, %20 ], [ %138, %56 ]
  %58 = phi i32 [ 0, %20 ], [ %139, %56 ]
  %59 = phi i32 [ 0, %20 ], [ %140, %56 ]
  %60 = zext i32 %58 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = add nsw i32 %58, %17
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = fmul contract float %62, %66
  %68 = fadd contract float %57, %67
  %69 = or i32 %58, 1
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !6
  %73 = add nsw i32 %69, %17
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = fmul contract float %72, %76
  %78 = fadd contract float %68, %77
  %79 = or i32 %58, 2
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = add nsw i32 %79, %17
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = fmul contract float %82, %86
  %88 = fadd contract float %78, %87
  %89 = or i32 %58, 3
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = add nsw i32 %89, %17
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !6
  %97 = fmul contract float %92, %96
  %98 = fadd contract float %88, %97
  %99 = or i32 %58, 4
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !6
  %103 = add nsw i32 %99, %17
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = fmul contract float %102, %106
  %108 = fadd contract float %98, %107
  %109 = or i32 %58, 5
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !6
  %113 = add nsw i32 %109, %17
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !6
  %117 = fmul contract float %112, %116
  %118 = fadd contract float %108, %117
  %119 = or i32 %58, 6
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = add nsw i32 %119, %17
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %118, %127
  %129 = or i32 %58, 7
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !6
  %133 = add nsw i32 %129, %17
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !6
  %137 = fmul contract float %132, %136
  %138 = fadd contract float %128, %137
  %139 = add nuw nsw i32 %58, 8
  %140 = add i32 %59, 8
  %141 = icmp eq i32 %140, %21
  br i1 %141, label %22, label %56, !llvm.loop !17

142:                                              ; preds = %43
  %143 = and i64 %55, -225
  %144 = or i64 %143, 32
  %145 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %144, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %587

146:                                              ; preds = %43
  %147 = and i64 %55, 2
  %148 = and i64 %55, -3
  %149 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %148, i64 0
  br label %150

150:                                              ; preds = %576, %146
  %151 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str to [21 x i8]*) to i64)), i64 1))), %146 ], [ %584, %576 ]
  %152 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str, i64 0, i64 0), %146 ], [ %585, %576 ]
  %153 = phi <2 x i64> [ %149, %146 ], [ %583, %576 ]
  %154 = icmp ugt i64 %151, 56
  %155 = extractelement <2 x i64> %153, i64 0
  %156 = or i64 %155, %147
  %157 = insertelement <2 x i64> poison, i64 %156, i64 0
  %158 = select i1 %154, <2 x i64> %153, <2 x i64> %157
  %159 = tail call i64 @llvm.umin.i64(i64 %151, i64 56)
  %160 = trunc i64 %159 to i32
  %161 = extractelement <2 x i64> %158, i64 0
  %162 = icmp ugt i32 %160, 7
  br i1 %162, label %165, label %163

163:                                              ; preds = %150
  %164 = icmp eq i32 %160, 0
  br i1 %164, label %218, label %205

165:                                              ; preds = %150
  %166 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !19
  %167 = zext i8 %166 to i64
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 1
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !19
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 8
  %172 = or i64 %171, %167
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 2
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !19
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 16
  %177 = or i64 %172, %176
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 3
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !19
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 24
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 4
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !19
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 32
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 5
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !19
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 40
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 6
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !19
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 48
  %197 = or i64 %192, %196
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 7
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !19
  %200 = zext i8 %199 to i64
  %201 = shl nuw i64 %200, 56
  %202 = or i64 %197, %201
  %203 = add nsw i32 %160, -8
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 8
  br label %218

205:                                              ; preds = %163, %205
  %206 = phi i32 [ %216, %205 ], [ 0, %163 ]
  %207 = phi i64 [ %215, %205 ], [ 0, %163 ]
  %208 = zext i32 %206 to i64
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 %208
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !19
  %211 = zext i8 %210 to i64
  %212 = shl i32 %206, 3
  %213 = zext i32 %212 to i64
  %214 = shl nuw i64 %211, %213
  %215 = or i64 %214, %207
  %216 = add nuw nsw i32 %206, 1
  %217 = icmp eq i32 %216, %160
  br i1 %217, label %218, label %205, !llvm.loop !20

218:                                              ; preds = %205, %165, %163
  %219 = phi i8 addrspace(4)* [ %204, %165 ], [ %152, %163 ], [ %152, %205 ]
  %220 = phi i32 [ %203, %165 ], [ 0, %163 ], [ 0, %205 ]
  %221 = phi i64 [ %202, %165 ], [ 0, %163 ], [ %215, %205 ]
  %222 = icmp ugt i32 %220, 7
  br i1 %222, label %225, label %223

223:                                              ; preds = %218
  %224 = icmp eq i32 %220, 0
  br i1 %224, label %278, label %265

225:                                              ; preds = %218
  %226 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !19
  %227 = zext i8 %226 to i64
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 1
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !19
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 8
  %232 = or i64 %231, %227
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 2
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !19
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 16
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 3
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !19
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 24
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 4
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !19
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 32
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 5
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !19
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 40
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 6
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !19
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 48
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 7
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !19
  %260 = zext i8 %259 to i64
  %261 = shl nuw i64 %260, 56
  %262 = or i64 %257, %261
  %263 = add nsw i32 %220, -8
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 8
  br label %278

265:                                              ; preds = %223, %265
  %266 = phi i32 [ %276, %265 ], [ 0, %223 ]
  %267 = phi i64 [ %275, %265 ], [ 0, %223 ]
  %268 = zext i32 %266 to i64
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 %268
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !19
  %271 = zext i8 %270 to i64
  %272 = shl i32 %266, 3
  %273 = zext i32 %272 to i64
  %274 = shl nuw i64 %271, %273
  %275 = or i64 %274, %267
  %276 = add nuw nsw i32 %266, 1
  %277 = icmp eq i32 %276, %220
  br i1 %277, label %278, label %265

278:                                              ; preds = %265, %225, %223
  %279 = phi i8 addrspace(4)* [ %264, %225 ], [ %219, %223 ], [ %219, %265 ]
  %280 = phi i32 [ %263, %225 ], [ 0, %223 ], [ 0, %265 ]
  %281 = phi i64 [ %262, %225 ], [ 0, %223 ], [ %275, %265 ]
  %282 = icmp ugt i32 %280, 7
  br i1 %282, label %285, label %283

283:                                              ; preds = %278
  %284 = icmp eq i32 %280, 0
  br i1 %284, label %338, label %325

285:                                              ; preds = %278
  %286 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !19
  %287 = zext i8 %286 to i64
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 1
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !19
  %290 = zext i8 %289 to i64
  %291 = shl nuw nsw i64 %290, 8
  %292 = or i64 %291, %287
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 2
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !19
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 16
  %297 = or i64 %292, %296
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 3
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !19
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 24
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 4
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !19
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 32
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 5
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !19
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 40
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 6
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !19
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 48
  %317 = or i64 %312, %316
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 7
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !19
  %320 = zext i8 %319 to i64
  %321 = shl nuw i64 %320, 56
  %322 = or i64 %317, %321
  %323 = add nsw i32 %280, -8
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 8
  br label %338

325:                                              ; preds = %283, %325
  %326 = phi i32 [ %336, %325 ], [ 0, %283 ]
  %327 = phi i64 [ %335, %325 ], [ 0, %283 ]
  %328 = zext i32 %326 to i64
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 %328
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !19
  %331 = zext i8 %330 to i64
  %332 = shl i32 %326, 3
  %333 = zext i32 %332 to i64
  %334 = shl nuw i64 %331, %333
  %335 = or i64 %334, %327
  %336 = add nuw nsw i32 %326, 1
  %337 = icmp eq i32 %336, %280
  br i1 %337, label %338, label %325

338:                                              ; preds = %325, %285, %283
  %339 = phi i8 addrspace(4)* [ %324, %285 ], [ %279, %283 ], [ %279, %325 ]
  %340 = phi i32 [ %323, %285 ], [ 0, %283 ], [ 0, %325 ]
  %341 = phi i64 [ %322, %285 ], [ 0, %283 ], [ %335, %325 ]
  %342 = icmp ugt i32 %340, 7
  br i1 %342, label %345, label %343

343:                                              ; preds = %338
  %344 = icmp eq i32 %340, 0
  br i1 %344, label %398, label %385

345:                                              ; preds = %338
  %346 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !19
  %347 = zext i8 %346 to i64
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 1
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !19
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 8
  %352 = or i64 %351, %347
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 2
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !19
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 16
  %357 = or i64 %352, %356
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 3
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !19
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 24
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 4
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !19
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 32
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 5
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !19
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 40
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 6
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !19
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 48
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 7
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !19
  %380 = zext i8 %379 to i64
  %381 = shl nuw i64 %380, 56
  %382 = or i64 %377, %381
  %383 = add nsw i32 %340, -8
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 8
  br label %398

385:                                              ; preds = %343, %385
  %386 = phi i32 [ %396, %385 ], [ 0, %343 ]
  %387 = phi i64 [ %395, %385 ], [ 0, %343 ]
  %388 = zext i32 %386 to i64
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 %388
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !19
  %391 = zext i8 %390 to i64
  %392 = shl i32 %386, 3
  %393 = zext i32 %392 to i64
  %394 = shl nuw i64 %391, %393
  %395 = or i64 %394, %387
  %396 = add nuw nsw i32 %386, 1
  %397 = icmp eq i32 %396, %340
  br i1 %397, label %398, label %385

398:                                              ; preds = %385, %345, %343
  %399 = phi i8 addrspace(4)* [ %384, %345 ], [ %339, %343 ], [ %339, %385 ]
  %400 = phi i32 [ %383, %345 ], [ 0, %343 ], [ 0, %385 ]
  %401 = phi i64 [ %382, %345 ], [ 0, %343 ], [ %395, %385 ]
  %402 = icmp ugt i32 %400, 7
  br i1 %402, label %405, label %403

403:                                              ; preds = %398
  %404 = icmp eq i32 %400, 0
  br i1 %404, label %458, label %445

405:                                              ; preds = %398
  %406 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !19
  %407 = zext i8 %406 to i64
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 1
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !19
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 8
  %412 = or i64 %411, %407
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 2
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !19
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 16
  %417 = or i64 %412, %416
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 3
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !19
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 24
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 4
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !19
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 32
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 5
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !19
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 40
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 6
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !19
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 48
  %437 = or i64 %432, %436
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 7
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !19
  %440 = zext i8 %439 to i64
  %441 = shl nuw i64 %440, 56
  %442 = or i64 %437, %441
  %443 = add nsw i32 %400, -8
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 8
  br label %458

445:                                              ; preds = %403, %445
  %446 = phi i32 [ %456, %445 ], [ 0, %403 ]
  %447 = phi i64 [ %455, %445 ], [ 0, %403 ]
  %448 = zext i32 %446 to i64
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 %448
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !19
  %451 = zext i8 %450 to i64
  %452 = shl i32 %446, 3
  %453 = zext i32 %452 to i64
  %454 = shl nuw i64 %451, %453
  %455 = or i64 %454, %447
  %456 = add nuw nsw i32 %446, 1
  %457 = icmp eq i32 %456, %400
  br i1 %457, label %458, label %445

458:                                              ; preds = %445, %405, %403
  %459 = phi i8 addrspace(4)* [ %444, %405 ], [ %399, %403 ], [ %399, %445 ]
  %460 = phi i32 [ %443, %405 ], [ 0, %403 ], [ 0, %445 ]
  %461 = phi i64 [ %442, %405 ], [ 0, %403 ], [ %455, %445 ]
  %462 = icmp ugt i32 %460, 7
  br i1 %462, label %465, label %463

463:                                              ; preds = %458
  %464 = icmp eq i32 %460, 0
  br i1 %464, label %518, label %505

465:                                              ; preds = %458
  %466 = load i8, i8 addrspace(4)* %459, align 1, !tbaa !19
  %467 = zext i8 %466 to i64
  %468 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 1
  %469 = load i8, i8 addrspace(4)* %468, align 1, !tbaa !19
  %470 = zext i8 %469 to i64
  %471 = shl nuw nsw i64 %470, 8
  %472 = or i64 %471, %467
  %473 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 2
  %474 = load i8, i8 addrspace(4)* %473, align 1, !tbaa !19
  %475 = zext i8 %474 to i64
  %476 = shl nuw nsw i64 %475, 16
  %477 = or i64 %472, %476
  %478 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 3
  %479 = load i8, i8 addrspace(4)* %478, align 1, !tbaa !19
  %480 = zext i8 %479 to i64
  %481 = shl nuw nsw i64 %480, 24
  %482 = or i64 %477, %481
  %483 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 4
  %484 = load i8, i8 addrspace(4)* %483, align 1, !tbaa !19
  %485 = zext i8 %484 to i64
  %486 = shl nuw nsw i64 %485, 32
  %487 = or i64 %482, %486
  %488 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 5
  %489 = load i8, i8 addrspace(4)* %488, align 1, !tbaa !19
  %490 = zext i8 %489 to i64
  %491 = shl nuw nsw i64 %490, 40
  %492 = or i64 %487, %491
  %493 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 6
  %494 = load i8, i8 addrspace(4)* %493, align 1, !tbaa !19
  %495 = zext i8 %494 to i64
  %496 = shl nuw nsw i64 %495, 48
  %497 = or i64 %492, %496
  %498 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 7
  %499 = load i8, i8 addrspace(4)* %498, align 1, !tbaa !19
  %500 = zext i8 %499 to i64
  %501 = shl nuw i64 %500, 56
  %502 = or i64 %497, %501
  %503 = add nsw i32 %460, -8
  %504 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 8
  br label %518

505:                                              ; preds = %463, %505
  %506 = phi i32 [ %516, %505 ], [ 0, %463 ]
  %507 = phi i64 [ %515, %505 ], [ 0, %463 ]
  %508 = zext i32 %506 to i64
  %509 = getelementptr inbounds i8, i8 addrspace(4)* %459, i64 %508
  %510 = load i8, i8 addrspace(4)* %509, align 1, !tbaa !19
  %511 = zext i8 %510 to i64
  %512 = shl i32 %506, 3
  %513 = zext i32 %512 to i64
  %514 = shl nuw i64 %511, %513
  %515 = or i64 %514, %507
  %516 = add nuw nsw i32 %506, 1
  %517 = icmp eq i32 %516, %460
  br i1 %517, label %518, label %505

518:                                              ; preds = %505, %465, %463
  %519 = phi i8 addrspace(4)* [ %504, %465 ], [ %459, %463 ], [ %459, %505 ]
  %520 = phi i32 [ %503, %465 ], [ 0, %463 ], [ 0, %505 ]
  %521 = phi i64 [ %502, %465 ], [ 0, %463 ], [ %515, %505 ]
  %522 = icmp ugt i32 %520, 7
  br i1 %522, label %525, label %523

523:                                              ; preds = %518
  %524 = icmp eq i32 %520, 0
  br i1 %524, label %576, label %563

525:                                              ; preds = %518
  %526 = load i8, i8 addrspace(4)* %519, align 1, !tbaa !19
  %527 = zext i8 %526 to i64
  %528 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 1
  %529 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !19
  %530 = zext i8 %529 to i64
  %531 = shl nuw nsw i64 %530, 8
  %532 = or i64 %531, %527
  %533 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 2
  %534 = load i8, i8 addrspace(4)* %533, align 1, !tbaa !19
  %535 = zext i8 %534 to i64
  %536 = shl nuw nsw i64 %535, 16
  %537 = or i64 %532, %536
  %538 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 3
  %539 = load i8, i8 addrspace(4)* %538, align 1, !tbaa !19
  %540 = zext i8 %539 to i64
  %541 = shl nuw nsw i64 %540, 24
  %542 = or i64 %537, %541
  %543 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 4
  %544 = load i8, i8 addrspace(4)* %543, align 1, !tbaa !19
  %545 = zext i8 %544 to i64
  %546 = shl nuw nsw i64 %545, 32
  %547 = or i64 %542, %546
  %548 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 5
  %549 = load i8, i8 addrspace(4)* %548, align 1, !tbaa !19
  %550 = zext i8 %549 to i64
  %551 = shl nuw nsw i64 %550, 40
  %552 = or i64 %547, %551
  %553 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 6
  %554 = load i8, i8 addrspace(4)* %553, align 1, !tbaa !19
  %555 = zext i8 %554 to i64
  %556 = shl nuw nsw i64 %555, 48
  %557 = or i64 %552, %556
  %558 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 7
  %559 = load i8, i8 addrspace(4)* %558, align 1, !tbaa !19
  %560 = zext i8 %559 to i64
  %561 = shl nuw i64 %560, 56
  %562 = or i64 %557, %561
  br label %576

563:                                              ; preds = %523, %563
  %564 = phi i32 [ %574, %563 ], [ 0, %523 ]
  %565 = phi i64 [ %573, %563 ], [ 0, %523 ]
  %566 = zext i32 %564 to i64
  %567 = getelementptr inbounds i8, i8 addrspace(4)* %519, i64 %566
  %568 = load i8, i8 addrspace(4)* %567, align 1, !tbaa !19
  %569 = zext i8 %568 to i64
  %570 = shl i32 %564, 3
  %571 = zext i32 %570 to i64
  %572 = shl nuw i64 %569, %571
  %573 = or i64 %572, %565
  %574 = add nuw nsw i32 %564, 1
  %575 = icmp eq i32 %574, %520
  br i1 %575, label %576, label %563

576:                                              ; preds = %563, %525, %523
  %577 = phi i64 [ %562, %525 ], [ 0, %523 ], [ %573, %563 ]
  %578 = shl nuw nsw i64 %159, 2
  %579 = add nuw nsw i64 %578, 28
  %580 = and i64 %579, 480
  %581 = and i64 %161, -225
  %582 = or i64 %581, %580
  %583 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %582, i64 noundef %221, i64 noundef %281, i64 noundef %341, i64 noundef %401, i64 noundef %461, i64 noundef %521, i64 noundef %577) #10
  %584 = sub i64 %151, %159
  %585 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 %159
  %586 = icmp eq i64 %584, 0
  br i1 %586, label %587, label %150

587:                                              ; preds = %576, %142
  %588 = phi <2 x i64> [ %145, %142 ], [ %583, %576 ]
  %589 = fpext float %44 to double
  %590 = fpext float %47 to double
  %591 = extractelement <2 x i64> %588, i64 0
  %592 = bitcast double %589 to i64
  %593 = and i64 %591, -225
  %594 = or i64 %593, 32
  %595 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %594, i64 noundef %592, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %596 = extractelement <2 x i64> %595, i64 0
  %597 = bitcast double %590 to i64
  %598 = and i64 %596, -227
  %599 = or i64 %598, 34
  %600 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %599, i64 noundef %597, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %601 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %602 = fadd contract float %44, %601
  %603 = fneg contract float %602
  %604 = fmul float %602, 0xBFF7154760000000
  %605 = tail call float @llvm.rint.f32(float %604)
  %606 = fcmp olt float %602, 0xC0562E4300000000
  %607 = fcmp ogt float %602, 0x4059D1DA00000000
  %608 = fneg float %604
  %609 = tail call float @llvm.fma.f32(float %603, float 0x3FF7154760000000, float %608)
  %610 = tail call float @llvm.fma.f32(float %603, float 0x3E54AE0BE0000000, float %609)
  %611 = fsub float %604, %605
  %612 = fadd float %610, %611
  %613 = tail call float @llvm.exp2.f32(float %612)
  %614 = fptosi float %605 to i32
  %615 = tail call float @llvm.amdgcn.ldexp.f32(float %613, i32 %614)
  %616 = fadd contract float %615, 1.000000e+00
  %617 = fdiv contract float 1.000000e+00, %616
  %618 = select i1 %607, float 1.000000e+00, float %617
  %619 = select i1 %606, float 0.000000e+00, float %618
  %620 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  store float %619, float addrspace(1)* %620, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !21
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !23
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !23
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !25
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !23
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !23
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !21
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !26
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !29
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !26
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !29
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !26
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !29
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !30
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !29
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !23
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !13
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !13
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !13
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !13
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !13
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !13
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !13
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !13
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %110 = call i64 @llvm.read_register.i64(metadata !31) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !32
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !34
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !35
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !26
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !29
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !36
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !36
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !37
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !39
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
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
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !19
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !29
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !26
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !36
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !36
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!15, !15, i64 0}
!20 = distinct !{!20, !12}
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !15, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !15, i64 0}
!25 = !{i64 2662}
!26 = !{!27, !22, i64 0}
!27 = !{!"", !22, i64 0, !22, i64 8, !28, i64 16, !14, i64 24, !14, i64 32, !14, i64 40}
!28 = !{!"hsa_signal_s", !14, i64 0}
!29 = !{!27, !14, i64 40}
!30 = !{!27, !22, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !24, i64 16}
!33 = !{!"", !14, i64 0, !14, i64 8, !24, i64 16, !24, i64 20}
!34 = !{!33, !14, i64 8}
!35 = !{!33, !24, i64 20}
!36 = !{!33, !14, i64 0}
!37 = !{!38, !14, i64 16}
!38 = !{!"amd_signal_s", !14, i64 0, !15, i64 8, !14, i64 16, !24, i64 24, !24, i64 28, !14, i64 32, !14, i64 40, !15, i64 48, !15, i64 56}
!39 = !{!38, !24, i64 24}
