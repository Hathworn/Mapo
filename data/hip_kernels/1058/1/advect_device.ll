; ModuleID = '../data/hip_kernels/1058/1/main.cu'
source_filename = "../data/hip_kernels/1058/1/main.cu"
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

@_ZZ6advectPfS_S_fiifE2dt = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ6advectPfS_S_fiifE11timeElapsed = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ6advectPfS_S_fiifE7counter = internal unnamed_addr addrspace(3) global i32 undef, align 4
@.str = private unnamed_addr addrspace(4) constant [14 x i8] c"%10f\09%10d\09%f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z6advectPfS_S_fiif(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float %3, i32 %4, i32 %5, float %6) local_unnamed_addr #1 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  store float 0.000000e+00, float addrspace(3)* @_ZZ6advectPfS_S_fiifE11timeElapsed, align 4, !tbaa !7
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %7
  %19 = load float, float addrspace(1)* %2, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = fdiv contract float %19, %3
  %21 = fdiv contract float %20, 5.000000e+02
  store float %21, float addrspace(3)* @_ZZ6advectPfS_S_fiifE2dt, align 4, !tbaa !7
  store i32 0, i32 addrspace(3)* @_ZZ6advectPfS_S_fiifE7counter, align 4, !tbaa !11
  br label %22

22:                                               ; preds = %18, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = load float, float addrspace(3)* @_ZZ6advectPfS_S_fiifE11timeElapsed, align 4, !tbaa !7
  %24 = fcmp contract olt float %23, %6
  br i1 %24, label %25, label %659

25:                                               ; preds = %22
  %26 = icmp ult i32 %16, %4
  %27 = icmp uge i32 %16, %4
  %28 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %29 = getelementptr inbounds i8, i8 addrspace(4)* %28, i64 24
  %30 = bitcast i8 addrspace(4)* %29 to i64 addrspace(4)*
  %31 = icmp sgt i32 %5, 0
  %32 = and i32 %5, 3
  %33 = icmp ult i32 %5, 4
  %34 = and i32 %5, -4
  %35 = icmp eq i32 %32, 0
  br label %36

36:                                               ; preds = %25, %656
  br i1 %26, label %37, label %40

37:                                               ; preds = %36
  %38 = load float, float addrspace(3)* @_ZZ6advectPfS_S_fiifE2dt, align 4, !tbaa !7
  %39 = fmul contract float %38, %3
  br label %48

40:                                               ; preds = %48, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = load i32, i32 addrspace(3)* @_ZZ6advectPfS_S_fiifE7counter, align 4, !tbaa !11
  %42 = icmp ne i32 %41, 0
  %43 = select i1 %42, i1 true, i1 %27
  br i1 %43, label %561, label %44

44:                                               ; preds = %40
  %45 = load i64, i64 addrspace(4)* %30, align 8, !tbaa !13
  %46 = inttoptr i64 %45 to i8 addrspace(1)*
  %47 = addrspacecast i8 addrspace(1)* %46 to i8*
  br label %83

48:                                               ; preds = %37, %48
  %49 = phi i32 [ %16, %37 ], [ %81, %48 ]
  %50 = phi i32 [ 0, %37 ], [ %79, %48 ]
  %51 = add i32 %49, %5
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = getelementptr inbounds float, float addrspace(1)* %53, i64 1
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = getelementptr inbounds float, float addrspace(1)* %53, i64 -1
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = fsub contract float %56, %58
  %60 = fpext float %59 to double
  %61 = fmul contract double %60, 0x3FE2AAAAAAAAAAAB
  %62 = getelementptr inbounds float, float addrspace(1)* %53, i64 2
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = fadd contract float %58, %63
  %65 = getelementptr inbounds float, float addrspace(1)* %53, i64 -2
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fadd contract float %56, %66
  %68 = fsub contract float %64, %67
  %69 = fpext float %68 to double
  %70 = fmul contract double %69, 0x3FB5555555555555
  %71 = fsub contract double %61, %70
  %72 = fptrunc double %71 to float
  %73 = fmul contract float %39, %72
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = fdiv contract float %73, %75
  %77 = fsub contract float %54, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  store float %77, float addrspace(1)* %78, align 4, !tbaa !7
  store float %77, float addrspace(1)* %53, align 4, !tbaa !7
  %79 = add nuw nsw i32 %50, 1
  %80 = mul i32 %79, %13
  %81 = add i32 %80, %16
  %82 = icmp ult i32 %81, %4
  br i1 %82, label %48, label %40, !llvm.loop !17

83:                                               ; preds = %44, %540
  %84 = phi i32 [ %16, %44 ], [ %559, %540 ]
  %85 = phi i32 [ 0, %44 ], [ %557, %540 ]
  %86 = add i32 %84, %5
  %87 = load float, float addrspace(3)* @_ZZ6advectPfS_S_fiifE11timeElapsed, align 4, !tbaa !7
  %88 = fpext float %87 to double
  %89 = sext i32 %86 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fpext float %91 to double
  %93 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %47, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %94 = extractelement <2 x i64> %93, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %95, label %99

95:                                               ; preds = %83
  %96 = and i64 %94, -225
  %97 = or i64 %96, 32
  %98 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %47, i64 noundef %97, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %540

99:                                               ; preds = %83
  %100 = and i64 %94, 2
  %101 = and i64 %94, -3
  %102 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %101, i64 0
  br label %103

103:                                              ; preds = %529, %99
  %104 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 13) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([14 x i8]* addrspacecast ([14 x i8] addrspace(4)* @.str to [14 x i8]*) to i64)), i64 1))), %99 ], [ %537, %529 ]
  %105 = phi i8 addrspace(4)* [ getelementptr inbounds ([14 x i8], [14 x i8] addrspace(4)* @.str, i64 0, i64 0), %99 ], [ %538, %529 ]
  %106 = phi <2 x i64> [ %102, %99 ], [ %536, %529 ]
  %107 = icmp ugt i64 %104, 56
  %108 = extractelement <2 x i64> %106, i64 0
  %109 = or i64 %108, %100
  %110 = insertelement <2 x i64> poison, i64 %109, i64 0
  %111 = select i1 %107, <2 x i64> %106, <2 x i64> %110
  %112 = tail call i64 @llvm.umin.i64(i64 %104, i64 56)
  %113 = trunc i64 %112 to i32
  %114 = extractelement <2 x i64> %111, i64 0
  %115 = icmp ugt i32 %113, 7
  br i1 %115, label %118, label %116

116:                                              ; preds = %103
  %117 = icmp eq i32 %113, 0
  br i1 %117, label %171, label %158

118:                                              ; preds = %103
  %119 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !19
  %120 = zext i8 %119 to i64
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 1
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !19
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 8
  %125 = or i64 %124, %120
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 2
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !19
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 16
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 3
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !19
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 24
  %135 = or i64 %130, %134
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 4
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !19
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 32
  %140 = or i64 %135, %139
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 5
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !19
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 40
  %145 = or i64 %140, %144
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 6
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !19
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 48
  %150 = or i64 %145, %149
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 7
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !19
  %153 = zext i8 %152 to i64
  %154 = shl nuw i64 %153, 56
  %155 = or i64 %150, %154
  %156 = add nsw i32 %113, -8
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 8
  br label %171

158:                                              ; preds = %116, %158
  %159 = phi i32 [ %169, %158 ], [ 0, %116 ]
  %160 = phi i64 [ %168, %158 ], [ 0, %116 ]
  %161 = zext i32 %159 to i64
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 %161
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !19
  %164 = zext i8 %163 to i64
  %165 = shl i32 %159, 3
  %166 = zext i32 %165 to i64
  %167 = shl nuw i64 %164, %166
  %168 = or i64 %167, %160
  %169 = add nuw nsw i32 %159, 1
  %170 = icmp eq i32 %169, %113
  br i1 %170, label %171, label %158, !llvm.loop !20

171:                                              ; preds = %158, %118, %116
  %172 = phi i8 addrspace(4)* [ %157, %118 ], [ %105, %116 ], [ %105, %158 ]
  %173 = phi i32 [ %156, %118 ], [ 0, %116 ], [ 0, %158 ]
  %174 = phi i64 [ %155, %118 ], [ 0, %116 ], [ %168, %158 ]
  %175 = icmp ugt i32 %173, 7
  br i1 %175, label %178, label %176

176:                                              ; preds = %171
  %177 = icmp eq i32 %173, 0
  br i1 %177, label %231, label %218

178:                                              ; preds = %171
  %179 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !19
  %180 = zext i8 %179 to i64
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 1
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !19
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 8
  %185 = or i64 %184, %180
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 2
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !19
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 16
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 3
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !19
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 24
  %195 = or i64 %190, %194
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 4
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !19
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 32
  %200 = or i64 %195, %199
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 5
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !19
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 40
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 6
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !19
  %208 = zext i8 %207 to i64
  %209 = shl nuw nsw i64 %208, 48
  %210 = or i64 %205, %209
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 7
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !19
  %213 = zext i8 %212 to i64
  %214 = shl nuw i64 %213, 56
  %215 = or i64 %210, %214
  %216 = add nsw i32 %173, -8
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 8
  br label %231

218:                                              ; preds = %176, %218
  %219 = phi i32 [ %229, %218 ], [ 0, %176 ]
  %220 = phi i64 [ %228, %218 ], [ 0, %176 ]
  %221 = zext i32 %219 to i64
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 %221
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !19
  %224 = zext i8 %223 to i64
  %225 = shl i32 %219, 3
  %226 = zext i32 %225 to i64
  %227 = shl nuw i64 %224, %226
  %228 = or i64 %227, %220
  %229 = add nuw nsw i32 %219, 1
  %230 = icmp eq i32 %229, %173
  br i1 %230, label %231, label %218

231:                                              ; preds = %218, %178, %176
  %232 = phi i8 addrspace(4)* [ %217, %178 ], [ %172, %176 ], [ %172, %218 ]
  %233 = phi i32 [ %216, %178 ], [ 0, %176 ], [ 0, %218 ]
  %234 = phi i64 [ %215, %178 ], [ 0, %176 ], [ %228, %218 ]
  %235 = icmp ugt i32 %233, 7
  br i1 %235, label %238, label %236

236:                                              ; preds = %231
  %237 = icmp eq i32 %233, 0
  br i1 %237, label %291, label %278

238:                                              ; preds = %231
  %239 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !19
  %240 = zext i8 %239 to i64
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 1
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !19
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 8
  %245 = or i64 %244, %240
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 2
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !19
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 16
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 3
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !19
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 24
  %255 = or i64 %250, %254
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 4
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !19
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 32
  %260 = or i64 %255, %259
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 5
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !19
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 40
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 6
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !19
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 48
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 7
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !19
  %273 = zext i8 %272 to i64
  %274 = shl nuw i64 %273, 56
  %275 = or i64 %270, %274
  %276 = add nsw i32 %233, -8
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 8
  br label %291

278:                                              ; preds = %236, %278
  %279 = phi i32 [ %289, %278 ], [ 0, %236 ]
  %280 = phi i64 [ %288, %278 ], [ 0, %236 ]
  %281 = zext i32 %279 to i64
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 %281
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !19
  %284 = zext i8 %283 to i64
  %285 = shl i32 %279, 3
  %286 = zext i32 %285 to i64
  %287 = shl nuw i64 %284, %286
  %288 = or i64 %287, %280
  %289 = add nuw nsw i32 %279, 1
  %290 = icmp eq i32 %289, %233
  br i1 %290, label %291, label %278

291:                                              ; preds = %278, %238, %236
  %292 = phi i8 addrspace(4)* [ %277, %238 ], [ %232, %236 ], [ %232, %278 ]
  %293 = phi i32 [ %276, %238 ], [ 0, %236 ], [ 0, %278 ]
  %294 = phi i64 [ %275, %238 ], [ 0, %236 ], [ %288, %278 ]
  %295 = icmp ugt i32 %293, 7
  br i1 %295, label %298, label %296

296:                                              ; preds = %291
  %297 = icmp eq i32 %293, 0
  br i1 %297, label %351, label %338

298:                                              ; preds = %291
  %299 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !19
  %300 = zext i8 %299 to i64
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 1
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !19
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 8
  %305 = or i64 %304, %300
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 2
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !19
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 16
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 3
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !19
  %313 = zext i8 %312 to i64
  %314 = shl nuw nsw i64 %313, 24
  %315 = or i64 %310, %314
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 4
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !19
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 32
  %320 = or i64 %315, %319
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 5
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !19
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 40
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 6
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !19
  %328 = zext i8 %327 to i64
  %329 = shl nuw nsw i64 %328, 48
  %330 = or i64 %325, %329
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 7
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !19
  %333 = zext i8 %332 to i64
  %334 = shl nuw i64 %333, 56
  %335 = or i64 %330, %334
  %336 = add nsw i32 %293, -8
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 8
  br label %351

338:                                              ; preds = %296, %338
  %339 = phi i32 [ %349, %338 ], [ 0, %296 ]
  %340 = phi i64 [ %348, %338 ], [ 0, %296 ]
  %341 = zext i32 %339 to i64
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 %341
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !19
  %344 = zext i8 %343 to i64
  %345 = shl i32 %339, 3
  %346 = zext i32 %345 to i64
  %347 = shl nuw i64 %344, %346
  %348 = or i64 %347, %340
  %349 = add nuw nsw i32 %339, 1
  %350 = icmp eq i32 %349, %293
  br i1 %350, label %351, label %338

351:                                              ; preds = %338, %298, %296
  %352 = phi i8 addrspace(4)* [ %337, %298 ], [ %292, %296 ], [ %292, %338 ]
  %353 = phi i32 [ %336, %298 ], [ 0, %296 ], [ 0, %338 ]
  %354 = phi i64 [ %335, %298 ], [ 0, %296 ], [ %348, %338 ]
  %355 = icmp ugt i32 %353, 7
  br i1 %355, label %358, label %356

356:                                              ; preds = %351
  %357 = icmp eq i32 %353, 0
  br i1 %357, label %411, label %398

358:                                              ; preds = %351
  %359 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !19
  %360 = zext i8 %359 to i64
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 1
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !19
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 8
  %365 = or i64 %364, %360
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 2
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !19
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 16
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 3
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !19
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 24
  %375 = or i64 %370, %374
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 4
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !19
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 32
  %380 = or i64 %375, %379
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 5
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !19
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 40
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 6
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !19
  %388 = zext i8 %387 to i64
  %389 = shl nuw nsw i64 %388, 48
  %390 = or i64 %385, %389
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 7
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !19
  %393 = zext i8 %392 to i64
  %394 = shl nuw i64 %393, 56
  %395 = or i64 %390, %394
  %396 = add nsw i32 %353, -8
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 8
  br label %411

398:                                              ; preds = %356, %398
  %399 = phi i32 [ %409, %398 ], [ 0, %356 ]
  %400 = phi i64 [ %408, %398 ], [ 0, %356 ]
  %401 = zext i32 %399 to i64
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 %401
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !19
  %404 = zext i8 %403 to i64
  %405 = shl i32 %399, 3
  %406 = zext i32 %405 to i64
  %407 = shl nuw i64 %404, %406
  %408 = or i64 %407, %400
  %409 = add nuw nsw i32 %399, 1
  %410 = icmp eq i32 %409, %353
  br i1 %410, label %411, label %398

411:                                              ; preds = %398, %358, %356
  %412 = phi i8 addrspace(4)* [ %397, %358 ], [ %352, %356 ], [ %352, %398 ]
  %413 = phi i32 [ %396, %358 ], [ 0, %356 ], [ 0, %398 ]
  %414 = phi i64 [ %395, %358 ], [ 0, %356 ], [ %408, %398 ]
  %415 = icmp ugt i32 %413, 7
  br i1 %415, label %418, label %416

416:                                              ; preds = %411
  %417 = icmp eq i32 %413, 0
  br i1 %417, label %471, label %458

418:                                              ; preds = %411
  %419 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !19
  %420 = zext i8 %419 to i64
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 1
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !19
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 8
  %425 = or i64 %424, %420
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 2
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !19
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 16
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 3
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !19
  %433 = zext i8 %432 to i64
  %434 = shl nuw nsw i64 %433, 24
  %435 = or i64 %430, %434
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 4
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !19
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 32
  %440 = or i64 %435, %439
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 5
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !19
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 40
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 6
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !19
  %448 = zext i8 %447 to i64
  %449 = shl nuw nsw i64 %448, 48
  %450 = or i64 %445, %449
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 7
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !19
  %453 = zext i8 %452 to i64
  %454 = shl nuw i64 %453, 56
  %455 = or i64 %450, %454
  %456 = add nsw i32 %413, -8
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 8
  br label %471

458:                                              ; preds = %416, %458
  %459 = phi i32 [ %469, %458 ], [ 0, %416 ]
  %460 = phi i64 [ %468, %458 ], [ 0, %416 ]
  %461 = zext i32 %459 to i64
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 %461
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !19
  %464 = zext i8 %463 to i64
  %465 = shl i32 %459, 3
  %466 = zext i32 %465 to i64
  %467 = shl nuw i64 %464, %466
  %468 = or i64 %467, %460
  %469 = add nuw nsw i32 %459, 1
  %470 = icmp eq i32 %469, %413
  br i1 %470, label %471, label %458

471:                                              ; preds = %458, %418, %416
  %472 = phi i8 addrspace(4)* [ %457, %418 ], [ %412, %416 ], [ %412, %458 ]
  %473 = phi i32 [ %456, %418 ], [ 0, %416 ], [ 0, %458 ]
  %474 = phi i64 [ %455, %418 ], [ 0, %416 ], [ %468, %458 ]
  %475 = icmp ugt i32 %473, 7
  br i1 %475, label %478, label %476

476:                                              ; preds = %471
  %477 = icmp eq i32 %473, 0
  br i1 %477, label %529, label %516

478:                                              ; preds = %471
  %479 = load i8, i8 addrspace(4)* %472, align 1, !tbaa !19
  %480 = zext i8 %479 to i64
  %481 = getelementptr inbounds i8, i8 addrspace(4)* %472, i64 1
  %482 = load i8, i8 addrspace(4)* %481, align 1, !tbaa !19
  %483 = zext i8 %482 to i64
  %484 = shl nuw nsw i64 %483, 8
  %485 = or i64 %484, %480
  %486 = getelementptr inbounds i8, i8 addrspace(4)* %472, i64 2
  %487 = load i8, i8 addrspace(4)* %486, align 1, !tbaa !19
  %488 = zext i8 %487 to i64
  %489 = shl nuw nsw i64 %488, 16
  %490 = or i64 %485, %489
  %491 = getelementptr inbounds i8, i8 addrspace(4)* %472, i64 3
  %492 = load i8, i8 addrspace(4)* %491, align 1, !tbaa !19
  %493 = zext i8 %492 to i64
  %494 = shl nuw nsw i64 %493, 24
  %495 = or i64 %490, %494
  %496 = getelementptr inbounds i8, i8 addrspace(4)* %472, i64 4
  %497 = load i8, i8 addrspace(4)* %496, align 1, !tbaa !19
  %498 = zext i8 %497 to i64
  %499 = shl nuw nsw i64 %498, 32
  %500 = or i64 %495, %499
  %501 = getelementptr inbounds i8, i8 addrspace(4)* %472, i64 5
  %502 = load i8, i8 addrspace(4)* %501, align 1, !tbaa !19
  %503 = zext i8 %502 to i64
  %504 = shl nuw nsw i64 %503, 40
  %505 = or i64 %500, %504
  %506 = getelementptr inbounds i8, i8 addrspace(4)* %472, i64 6
  %507 = load i8, i8 addrspace(4)* %506, align 1, !tbaa !19
  %508 = zext i8 %507 to i64
  %509 = shl nuw nsw i64 %508, 48
  %510 = or i64 %505, %509
  %511 = getelementptr inbounds i8, i8 addrspace(4)* %472, i64 7
  %512 = load i8, i8 addrspace(4)* %511, align 1, !tbaa !19
  %513 = zext i8 %512 to i64
  %514 = shl nuw i64 %513, 56
  %515 = or i64 %510, %514
  br label %529

516:                                              ; preds = %476, %516
  %517 = phi i32 [ %527, %516 ], [ 0, %476 ]
  %518 = phi i64 [ %526, %516 ], [ 0, %476 ]
  %519 = zext i32 %517 to i64
  %520 = getelementptr inbounds i8, i8 addrspace(4)* %472, i64 %519
  %521 = load i8, i8 addrspace(4)* %520, align 1, !tbaa !19
  %522 = zext i8 %521 to i64
  %523 = shl i32 %517, 3
  %524 = zext i32 %523 to i64
  %525 = shl nuw i64 %522, %524
  %526 = or i64 %525, %518
  %527 = add nuw nsw i32 %517, 1
  %528 = icmp eq i32 %527, %473
  br i1 %528, label %529, label %516

529:                                              ; preds = %516, %478, %476
  %530 = phi i64 [ %515, %478 ], [ 0, %476 ], [ %526, %516 ]
  %531 = shl nuw nsw i64 %112, 2
  %532 = add nuw nsw i64 %531, 28
  %533 = and i64 %532, 480
  %534 = and i64 %114, -225
  %535 = or i64 %534, %533
  %536 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %47, i64 noundef %535, i64 noundef %174, i64 noundef %234, i64 noundef %294, i64 noundef %354, i64 noundef %414, i64 noundef %474, i64 noundef %530) #11
  %537 = sub i64 %104, %112
  %538 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 %112
  %539 = icmp eq i64 %537, 0
  br i1 %539, label %540, label %103

540:                                              ; preds = %529, %95
  %541 = phi <2 x i64> [ %98, %95 ], [ %536, %529 ]
  %542 = extractelement <2 x i64> %541, i64 0
  %543 = bitcast double %88 to i64
  %544 = and i64 %542, -225
  %545 = or i64 %544, 32
  %546 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %47, i64 noundef %545, i64 noundef %543, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %547 = extractelement <2 x i64> %546, i64 0
  %548 = zext i32 %84 to i64
  %549 = and i64 %547, -225
  %550 = or i64 %549, 32
  %551 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %47, i64 noundef %550, i64 noundef %548, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %552 = extractelement <2 x i64> %551, i64 0
  %553 = bitcast double %92 to i64
  %554 = and i64 %552, -227
  %555 = or i64 %554, 34
  %556 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %47, i64 noundef %555, i64 noundef %553, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %557 = add nuw nsw i32 %85, 1
  %558 = mul i32 %557, %13
  %559 = add i32 %558, %16
  %560 = icmp ult i32 %559, %4
  br i1 %560, label %83, label %561, !llvm.loop !22

561:                                              ; preds = %540, %40
  br i1 %17, label %564, label %562

562:                                              ; preds = %561
  %563 = load float, float addrspace(3)* @_ZZ6advectPfS_S_fiifE11timeElapsed, align 4, !tbaa !7
  br label %656

564:                                              ; preds = %561
  br i1 %31, label %565, label %587

565:                                              ; preds = %564
  br i1 %33, label %566, label %595

566:                                              ; preds = %595, %565
  %567 = phi i32 [ 0, %565 ], [ %653, %595 ]
  br i1 %35, label %587, label %568

568:                                              ; preds = %566, %568
  %569 = phi i32 [ %584, %568 ], [ %567, %566 ]
  %570 = phi i32 [ %585, %568 ], [ 0, %566 ]
  %571 = add nsw i32 %569, %4
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds float, float addrspace(1)* %0, i64 %572
  %574 = load float, float addrspace(1)* %573, align 4, !tbaa !7
  %575 = zext i32 %569 to i64
  %576 = getelementptr inbounds float, float addrspace(1)* %0, i64 %575
  store float %574, float addrspace(1)* %576, align 4, !tbaa !7
  %577 = add i32 %569, %5
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds float, float addrspace(1)* %0, i64 %578
  %580 = load float, float addrspace(1)* %579, align 4, !tbaa !7
  %581 = add i32 %577, %4
  %582 = sext i32 %581 to i64
  %583 = getelementptr inbounds float, float addrspace(1)* %0, i64 %582
  store float %580, float addrspace(1)* %583, align 4, !tbaa !7
  %584 = add nuw nsw i32 %569, 1
  %585 = add i32 %570, 1
  %586 = icmp eq i32 %585, %32
  br i1 %586, label %587, label %568, !llvm.loop !23

587:                                              ; preds = %566, %568, %564
  %588 = load float, float addrspace(3)* @_ZZ6advectPfS_S_fiifE2dt, align 4, !tbaa !7
  %589 = load float, float addrspace(3)* @_ZZ6advectPfS_S_fiifE11timeElapsed, align 4, !tbaa !7
  %590 = fadd contract float %588, %589
  store float %590, float addrspace(3)* @_ZZ6advectPfS_S_fiifE11timeElapsed, align 4, !tbaa !7
  %591 = load i32, i32 addrspace(3)* @_ZZ6advectPfS_S_fiifE7counter, align 4, !tbaa !11
  %592 = add nsw i32 %591, 1
  %593 = icmp eq i32 %592, 10000
  %594 = select i1 %593, i32 0, i32 %592
  store i32 %594, i32 addrspace(3)* @_ZZ6advectPfS_S_fiifE7counter, align 4
  br label %656

595:                                              ; preds = %565, %595
  %596 = phi i32 [ %653, %595 ], [ 0, %565 ]
  %597 = phi i32 [ %654, %595 ], [ 0, %565 ]
  %598 = add nsw i32 %596, %4
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds float, float addrspace(1)* %0, i64 %599
  %601 = load float, float addrspace(1)* %600, align 4, !tbaa !7
  %602 = zext i32 %596 to i64
  %603 = getelementptr inbounds float, float addrspace(1)* %0, i64 %602
  store float %601, float addrspace(1)* %603, align 4, !tbaa !7
  %604 = add i32 %596, %5
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds float, float addrspace(1)* %0, i64 %605
  %607 = load float, float addrspace(1)* %606, align 4, !tbaa !7
  %608 = add i32 %604, %4
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds float, float addrspace(1)* %0, i64 %609
  store float %607, float addrspace(1)* %610, align 4, !tbaa !7
  %611 = or i32 %596, 1
  %612 = add nsw i32 %611, %4
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds float, float addrspace(1)* %0, i64 %613
  %615 = load float, float addrspace(1)* %614, align 4, !tbaa !7
  %616 = zext i32 %611 to i64
  %617 = getelementptr inbounds float, float addrspace(1)* %0, i64 %616
  store float %615, float addrspace(1)* %617, align 4, !tbaa !7
  %618 = add i32 %611, %5
  %619 = sext i32 %618 to i64
  %620 = getelementptr inbounds float, float addrspace(1)* %0, i64 %619
  %621 = load float, float addrspace(1)* %620, align 4, !tbaa !7
  %622 = add i32 %618, %4
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds float, float addrspace(1)* %0, i64 %623
  store float %621, float addrspace(1)* %624, align 4, !tbaa !7
  %625 = or i32 %596, 2
  %626 = add nsw i32 %625, %4
  %627 = sext i32 %626 to i64
  %628 = getelementptr inbounds float, float addrspace(1)* %0, i64 %627
  %629 = load float, float addrspace(1)* %628, align 4, !tbaa !7
  %630 = zext i32 %625 to i64
  %631 = getelementptr inbounds float, float addrspace(1)* %0, i64 %630
  store float %629, float addrspace(1)* %631, align 4, !tbaa !7
  %632 = add i32 %625, %5
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds float, float addrspace(1)* %0, i64 %633
  %635 = load float, float addrspace(1)* %634, align 4, !tbaa !7
  %636 = add i32 %632, %4
  %637 = sext i32 %636 to i64
  %638 = getelementptr inbounds float, float addrspace(1)* %0, i64 %637
  store float %635, float addrspace(1)* %638, align 4, !tbaa !7
  %639 = or i32 %596, 3
  %640 = add nsw i32 %639, %4
  %641 = sext i32 %640 to i64
  %642 = getelementptr inbounds float, float addrspace(1)* %0, i64 %641
  %643 = load float, float addrspace(1)* %642, align 4, !tbaa !7
  %644 = zext i32 %639 to i64
  %645 = getelementptr inbounds float, float addrspace(1)* %0, i64 %644
  store float %643, float addrspace(1)* %645, align 4, !tbaa !7
  %646 = add i32 %639, %5
  %647 = sext i32 %646 to i64
  %648 = getelementptr inbounds float, float addrspace(1)* %0, i64 %647
  %649 = load float, float addrspace(1)* %648, align 4, !tbaa !7
  %650 = add i32 %646, %4
  %651 = sext i32 %650 to i64
  %652 = getelementptr inbounds float, float addrspace(1)* %0, i64 %651
  store float %649, float addrspace(1)* %652, align 4, !tbaa !7
  %653 = add nuw nsw i32 %596, 4
  %654 = add i32 %597, 4
  %655 = icmp eq i32 %654, %34
  br i1 %655, label %566, label %595, !llvm.loop !24

656:                                              ; preds = %562, %587
  %657 = phi float [ %563, %562 ], [ %590, %587 ]
  %658 = fcmp contract olt float %657, %6
  br i1 %658, label %36, label %659, !llvm.loop !25

659:                                              ; preds = %656, %22
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !26
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !28
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !28
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !30
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !28
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !28
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !26
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !31
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !34
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !31
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !34
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !31
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !34
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !26
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !35
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !34
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !26
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !26
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !26
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !28
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !13
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !13
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !13
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !13
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !13
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !13
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !13
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !13
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
  %110 = call i64 @llvm.read_register.i64(metadata !36) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !37
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !39
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !40
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !31
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !34
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !41
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !41
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !42
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !44
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !26
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !26
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !26
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !28
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !28
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !34
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !31
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !41
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !41
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!15, !15, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !18}
!25 = distinct !{!25, !18}
!26 = !{!27, !27, i64 0}
!27 = !{!"any pointer", !15, i64 0}
!28 = !{!29, !29, i64 0}
!29 = !{!"int", !15, i64 0}
!30 = !{i64 2662}
!31 = !{!32, !27, i64 0}
!32 = !{!"", !27, i64 0, !27, i64 8, !33, i64 16, !14, i64 24, !14, i64 32, !14, i64 40}
!33 = !{!"hsa_signal_s", !14, i64 0}
!34 = !{!32, !14, i64 40}
!35 = !{!32, !27, i64 8}
!36 = !{!"exec"}
!37 = !{!38, !29, i64 16}
!38 = !{!"", !14, i64 0, !14, i64 8, !29, i64 16, !29, i64 20}
!39 = !{!38, !14, i64 8}
!40 = !{!38, !29, i64 20}
!41 = !{!38, !14, i64 0}
!42 = !{!43, !14, i64 16}
!43 = !{!"amd_signal_s", !14, i64 0, !15, i64 8, !14, i64 16, !29, i64 24, !29, i64 28, !14, i64 32, !14, i64 40, !15, i64 48, !15, i64 56}
!44 = !{!43, !29, i64 24}
