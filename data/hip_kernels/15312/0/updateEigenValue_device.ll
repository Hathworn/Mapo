; ModuleID = '../data/hip_kernels/15312/0/main.cu'
source_filename = "../data/hip_kernels/15312/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [46 x i8] c"threadIdx: %d  index: %d  start; %d  end: %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [33 x i8] c"threadIdx: %d  i: %d  value: %f\0A\00", align 1
@_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache1 = internal unnamed_addr addrspace(3) global [2 x float] undef, align 4
@_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache2 = internal unnamed_addr addrspace(3) global [2 x float] undef, align 4
@_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache3 = internal unnamed_addr addrspace(3) global [2 x float] undef, align 4
@.str.2 = private unnamed_addr addrspace(4) constant [34 x i8] c"threadIdx.x: %d  cache value: %f\0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [45 x i8] c"cache1[0]: %f  cache2[0]: %f  cache3[0]: %f\0A\00", align 1
@.str.4 = private unnamed_addr addrspace(4) constant [37 x i8] c"norm AB: %f  alpha1: %f  alpha2: %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z16updateEigenValuePiS_PfS0_S0_S0_S0_S0_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7, i32 %8) local_unnamed_addr #1 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !7
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = mul i32 %19, %15
  %21 = add i32 %20, %10
  %22 = icmp slt i32 %21, %8
  br i1 %22, label %23, label %1033

23:                                               ; preds = %9
  %24 = sext i32 %21 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = add nsw i32 %21, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %30 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 24
  %31 = bitcast i8 addrspace(4)* %30 to i64 addrspace(4)*
  %32 = load i64, i64 addrspace(4)* %31, align 8, !tbaa !16
  %33 = inttoptr i64 %32 to i8 addrspace(1)*
  %34 = addrspacecast i8 addrspace(1)* %33 to i8*
  %35 = zext i32 %10 to i64
  %36 = zext i32 %21 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %4, i64 %24
  %38 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !17
  br label %47

39:                                               ; preds = %521
  br i1 %22, label %40, label %1033

40:                                               ; preds = %39
  %41 = udiv i32 %18, %15
  %42 = mul i32 %41, %15
  %43 = icmp ugt i32 %18, %42
  %44 = zext i1 %43 to i32
  %45 = add i32 %41, %44
  %46 = mul i32 %45, %15
  br label %1013

47:                                               ; preds = %23, %521
  %48 = phi i32 [ %38, %23 ], [ %522, %521 ]
  %49 = phi i32 [ 0, %23 ], [ %529, %521 ]
  %50 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !17
  %51 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %52 = extractelement <2 x i64> %51, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([46 x i8], [46 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %53, label %57

53:                                               ; preds = %47
  %54 = and i64 %52, -225
  %55 = or i64 %54, 32
  %56 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %55, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %498

57:                                               ; preds = %47
  %58 = and i64 %52, 2
  %59 = and i64 %52, -3
  %60 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %59, i64 0
  br label %61

61:                                               ; preds = %487, %57
  %62 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([46 x i8], [46 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([46 x i8], [46 x i8] addrspace(4)* @.str, i64 0, i64 45) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([46 x i8]* addrspacecast ([46 x i8] addrspace(4)* @.str to [46 x i8]*) to i64)), i64 1))), %57 ], [ %495, %487 ]
  %63 = phi i8 addrspace(4)* [ getelementptr inbounds ([46 x i8], [46 x i8] addrspace(4)* @.str, i64 0, i64 0), %57 ], [ %496, %487 ]
  %64 = phi <2 x i64> [ %60, %57 ], [ %494, %487 ]
  %65 = icmp ugt i64 %62, 56
  %66 = extractelement <2 x i64> %64, i64 0
  %67 = or i64 %66, %58
  %68 = insertelement <2 x i64> poison, i64 %67, i64 0
  %69 = select i1 %65, <2 x i64> %64, <2 x i64> %68
  %70 = tail call i64 @llvm.umin.i64(i64 %62, i64 56)
  %71 = trunc i64 %70 to i32
  %72 = extractelement <2 x i64> %69, i64 0
  %73 = icmp ugt i32 %71, 7
  br i1 %73, label %76, label %74

74:                                               ; preds = %61
  %75 = icmp eq i32 %71, 0
  br i1 %75, label %129, label %116

76:                                               ; preds = %61
  %77 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !21
  %78 = zext i8 %77 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 1
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !21
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 8
  %83 = or i64 %82, %78
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 2
  %85 = load i8, i8 addrspace(4)* %84, align 1, !tbaa !21
  %86 = zext i8 %85 to i64
  %87 = shl nuw nsw i64 %86, 16
  %88 = or i64 %83, %87
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 3
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !21
  %91 = zext i8 %90 to i64
  %92 = shl nuw nsw i64 %91, 24
  %93 = or i64 %88, %92
  %94 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 4
  %95 = load i8, i8 addrspace(4)* %94, align 1, !tbaa !21
  %96 = zext i8 %95 to i64
  %97 = shl nuw nsw i64 %96, 32
  %98 = or i64 %93, %97
  %99 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 5
  %100 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !21
  %101 = zext i8 %100 to i64
  %102 = shl nuw nsw i64 %101, 40
  %103 = or i64 %98, %102
  %104 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 6
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !21
  %106 = zext i8 %105 to i64
  %107 = shl nuw nsw i64 %106, 48
  %108 = or i64 %103, %107
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 7
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !21
  %111 = zext i8 %110 to i64
  %112 = shl nuw i64 %111, 56
  %113 = or i64 %108, %112
  %114 = add nsw i32 %71, -8
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 8
  br label %129

116:                                              ; preds = %74, %116
  %117 = phi i32 [ %127, %116 ], [ 0, %74 ]
  %118 = phi i64 [ %126, %116 ], [ 0, %74 ]
  %119 = zext i32 %117 to i64
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 %119
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !21
  %122 = zext i8 %121 to i64
  %123 = shl i32 %117, 3
  %124 = zext i32 %123 to i64
  %125 = shl nuw i64 %122, %124
  %126 = or i64 %125, %118
  %127 = add nuw nsw i32 %117, 1
  %128 = icmp eq i32 %127, %71
  br i1 %128, label %129, label %116, !llvm.loop !22

129:                                              ; preds = %116, %76, %74
  %130 = phi i8 addrspace(4)* [ %115, %76 ], [ %63, %74 ], [ %63, %116 ]
  %131 = phi i32 [ %114, %76 ], [ 0, %74 ], [ 0, %116 ]
  %132 = phi i64 [ %113, %76 ], [ 0, %74 ], [ %126, %116 ]
  %133 = icmp ugt i32 %131, 7
  br i1 %133, label %136, label %134

134:                                              ; preds = %129
  %135 = icmp eq i32 %131, 0
  br i1 %135, label %189, label %176

136:                                              ; preds = %129
  %137 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !21
  %138 = zext i8 %137 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 1
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !21
  %141 = zext i8 %140 to i64
  %142 = shl nuw nsw i64 %141, 8
  %143 = or i64 %142, %138
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 2
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !21
  %146 = zext i8 %145 to i64
  %147 = shl nuw nsw i64 %146, 16
  %148 = or i64 %143, %147
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 3
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !21
  %151 = zext i8 %150 to i64
  %152 = shl nuw nsw i64 %151, 24
  %153 = or i64 %148, %152
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 4
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !21
  %156 = zext i8 %155 to i64
  %157 = shl nuw nsw i64 %156, 32
  %158 = or i64 %153, %157
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 5
  %160 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !21
  %161 = zext i8 %160 to i64
  %162 = shl nuw nsw i64 %161, 40
  %163 = or i64 %158, %162
  %164 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 6
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !21
  %166 = zext i8 %165 to i64
  %167 = shl nuw nsw i64 %166, 48
  %168 = or i64 %163, %167
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 7
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !21
  %171 = zext i8 %170 to i64
  %172 = shl nuw i64 %171, 56
  %173 = or i64 %168, %172
  %174 = add nsw i32 %131, -8
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 8
  br label %189

176:                                              ; preds = %134, %176
  %177 = phi i32 [ %187, %176 ], [ 0, %134 ]
  %178 = phi i64 [ %186, %176 ], [ 0, %134 ]
  %179 = zext i32 %177 to i64
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %130, i64 %179
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !21
  %182 = zext i8 %181 to i64
  %183 = shl i32 %177, 3
  %184 = zext i32 %183 to i64
  %185 = shl nuw i64 %182, %184
  %186 = or i64 %185, %178
  %187 = add nuw nsw i32 %177, 1
  %188 = icmp eq i32 %187, %131
  br i1 %188, label %189, label %176

189:                                              ; preds = %176, %136, %134
  %190 = phi i8 addrspace(4)* [ %175, %136 ], [ %130, %134 ], [ %130, %176 ]
  %191 = phi i32 [ %174, %136 ], [ 0, %134 ], [ 0, %176 ]
  %192 = phi i64 [ %173, %136 ], [ 0, %134 ], [ %186, %176 ]
  %193 = icmp ugt i32 %191, 7
  br i1 %193, label %196, label %194

194:                                              ; preds = %189
  %195 = icmp eq i32 %191, 0
  br i1 %195, label %249, label %236

196:                                              ; preds = %189
  %197 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !21
  %198 = zext i8 %197 to i64
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 1
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !21
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 8
  %203 = or i64 %202, %198
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 2
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !21
  %206 = zext i8 %205 to i64
  %207 = shl nuw nsw i64 %206, 16
  %208 = or i64 %203, %207
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 3
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !21
  %211 = zext i8 %210 to i64
  %212 = shl nuw nsw i64 %211, 24
  %213 = or i64 %208, %212
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 4
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !21
  %216 = zext i8 %215 to i64
  %217 = shl nuw nsw i64 %216, 32
  %218 = or i64 %213, %217
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 5
  %220 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !21
  %221 = zext i8 %220 to i64
  %222 = shl nuw nsw i64 %221, 40
  %223 = or i64 %218, %222
  %224 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 6
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !21
  %226 = zext i8 %225 to i64
  %227 = shl nuw nsw i64 %226, 48
  %228 = or i64 %223, %227
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 7
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !21
  %231 = zext i8 %230 to i64
  %232 = shl nuw i64 %231, 56
  %233 = or i64 %228, %232
  %234 = add nsw i32 %191, -8
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 8
  br label %249

236:                                              ; preds = %194, %236
  %237 = phi i32 [ %247, %236 ], [ 0, %194 ]
  %238 = phi i64 [ %246, %236 ], [ 0, %194 ]
  %239 = zext i32 %237 to i64
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %190, i64 %239
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !21
  %242 = zext i8 %241 to i64
  %243 = shl i32 %237, 3
  %244 = zext i32 %243 to i64
  %245 = shl nuw i64 %242, %244
  %246 = or i64 %245, %238
  %247 = add nuw nsw i32 %237, 1
  %248 = icmp eq i32 %247, %191
  br i1 %248, label %249, label %236

249:                                              ; preds = %236, %196, %194
  %250 = phi i8 addrspace(4)* [ %235, %196 ], [ %190, %194 ], [ %190, %236 ]
  %251 = phi i32 [ %234, %196 ], [ 0, %194 ], [ 0, %236 ]
  %252 = phi i64 [ %233, %196 ], [ 0, %194 ], [ %246, %236 ]
  %253 = icmp ugt i32 %251, 7
  br i1 %253, label %256, label %254

254:                                              ; preds = %249
  %255 = icmp eq i32 %251, 0
  br i1 %255, label %309, label %296

256:                                              ; preds = %249
  %257 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !21
  %258 = zext i8 %257 to i64
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 1
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !21
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 8
  %263 = or i64 %262, %258
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 2
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !21
  %266 = zext i8 %265 to i64
  %267 = shl nuw nsw i64 %266, 16
  %268 = or i64 %263, %267
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 3
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !21
  %271 = zext i8 %270 to i64
  %272 = shl nuw nsw i64 %271, 24
  %273 = or i64 %268, %272
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 4
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !21
  %276 = zext i8 %275 to i64
  %277 = shl nuw nsw i64 %276, 32
  %278 = or i64 %273, %277
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 5
  %280 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !21
  %281 = zext i8 %280 to i64
  %282 = shl nuw nsw i64 %281, 40
  %283 = or i64 %278, %282
  %284 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 6
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !21
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 48
  %288 = or i64 %283, %287
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 7
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !21
  %291 = zext i8 %290 to i64
  %292 = shl nuw i64 %291, 56
  %293 = or i64 %288, %292
  %294 = add nsw i32 %251, -8
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 8
  br label %309

296:                                              ; preds = %254, %296
  %297 = phi i32 [ %307, %296 ], [ 0, %254 ]
  %298 = phi i64 [ %306, %296 ], [ 0, %254 ]
  %299 = zext i32 %297 to i64
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %250, i64 %299
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !21
  %302 = zext i8 %301 to i64
  %303 = shl i32 %297, 3
  %304 = zext i32 %303 to i64
  %305 = shl nuw i64 %302, %304
  %306 = or i64 %305, %298
  %307 = add nuw nsw i32 %297, 1
  %308 = icmp eq i32 %307, %251
  br i1 %308, label %309, label %296

309:                                              ; preds = %296, %256, %254
  %310 = phi i8 addrspace(4)* [ %295, %256 ], [ %250, %254 ], [ %250, %296 ]
  %311 = phi i32 [ %294, %256 ], [ 0, %254 ], [ 0, %296 ]
  %312 = phi i64 [ %293, %256 ], [ 0, %254 ], [ %306, %296 ]
  %313 = icmp ugt i32 %311, 7
  br i1 %313, label %316, label %314

314:                                              ; preds = %309
  %315 = icmp eq i32 %311, 0
  br i1 %315, label %369, label %356

316:                                              ; preds = %309
  %317 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !21
  %318 = zext i8 %317 to i64
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 1
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !21
  %321 = zext i8 %320 to i64
  %322 = shl nuw nsw i64 %321, 8
  %323 = or i64 %322, %318
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 2
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !21
  %326 = zext i8 %325 to i64
  %327 = shl nuw nsw i64 %326, 16
  %328 = or i64 %323, %327
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 3
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !21
  %331 = zext i8 %330 to i64
  %332 = shl nuw nsw i64 %331, 24
  %333 = or i64 %328, %332
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 4
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !21
  %336 = zext i8 %335 to i64
  %337 = shl nuw nsw i64 %336, 32
  %338 = or i64 %333, %337
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 5
  %340 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !21
  %341 = zext i8 %340 to i64
  %342 = shl nuw nsw i64 %341, 40
  %343 = or i64 %338, %342
  %344 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 6
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !21
  %346 = zext i8 %345 to i64
  %347 = shl nuw nsw i64 %346, 48
  %348 = or i64 %343, %347
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 7
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !21
  %351 = zext i8 %350 to i64
  %352 = shl nuw i64 %351, 56
  %353 = or i64 %348, %352
  %354 = add nsw i32 %311, -8
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 8
  br label %369

356:                                              ; preds = %314, %356
  %357 = phi i32 [ %367, %356 ], [ 0, %314 ]
  %358 = phi i64 [ %366, %356 ], [ 0, %314 ]
  %359 = zext i32 %357 to i64
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %310, i64 %359
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !21
  %362 = zext i8 %361 to i64
  %363 = shl i32 %357, 3
  %364 = zext i32 %363 to i64
  %365 = shl nuw i64 %362, %364
  %366 = or i64 %365, %358
  %367 = add nuw nsw i32 %357, 1
  %368 = icmp eq i32 %367, %311
  br i1 %368, label %369, label %356

369:                                              ; preds = %356, %316, %314
  %370 = phi i8 addrspace(4)* [ %355, %316 ], [ %310, %314 ], [ %310, %356 ]
  %371 = phi i32 [ %354, %316 ], [ 0, %314 ], [ 0, %356 ]
  %372 = phi i64 [ %353, %316 ], [ 0, %314 ], [ %366, %356 ]
  %373 = icmp ugt i32 %371, 7
  br i1 %373, label %376, label %374

374:                                              ; preds = %369
  %375 = icmp eq i32 %371, 0
  br i1 %375, label %429, label %416

376:                                              ; preds = %369
  %377 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !21
  %378 = zext i8 %377 to i64
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 1
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !21
  %381 = zext i8 %380 to i64
  %382 = shl nuw nsw i64 %381, 8
  %383 = or i64 %382, %378
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 2
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !21
  %386 = zext i8 %385 to i64
  %387 = shl nuw nsw i64 %386, 16
  %388 = or i64 %383, %387
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 3
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !21
  %391 = zext i8 %390 to i64
  %392 = shl nuw nsw i64 %391, 24
  %393 = or i64 %388, %392
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 4
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !21
  %396 = zext i8 %395 to i64
  %397 = shl nuw nsw i64 %396, 32
  %398 = or i64 %393, %397
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 5
  %400 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !21
  %401 = zext i8 %400 to i64
  %402 = shl nuw nsw i64 %401, 40
  %403 = or i64 %398, %402
  %404 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 6
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !21
  %406 = zext i8 %405 to i64
  %407 = shl nuw nsw i64 %406, 48
  %408 = or i64 %403, %407
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 7
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !21
  %411 = zext i8 %410 to i64
  %412 = shl nuw i64 %411, 56
  %413 = or i64 %408, %412
  %414 = add nsw i32 %371, -8
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 8
  br label %429

416:                                              ; preds = %374, %416
  %417 = phi i32 [ %427, %416 ], [ 0, %374 ]
  %418 = phi i64 [ %426, %416 ], [ 0, %374 ]
  %419 = zext i32 %417 to i64
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %370, i64 %419
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !21
  %422 = zext i8 %421 to i64
  %423 = shl i32 %417, 3
  %424 = zext i32 %423 to i64
  %425 = shl nuw i64 %422, %424
  %426 = or i64 %425, %418
  %427 = add nuw nsw i32 %417, 1
  %428 = icmp eq i32 %427, %371
  br i1 %428, label %429, label %416

429:                                              ; preds = %416, %376, %374
  %430 = phi i8 addrspace(4)* [ %415, %376 ], [ %370, %374 ], [ %370, %416 ]
  %431 = phi i32 [ %414, %376 ], [ 0, %374 ], [ 0, %416 ]
  %432 = phi i64 [ %413, %376 ], [ 0, %374 ], [ %426, %416 ]
  %433 = icmp ugt i32 %431, 7
  br i1 %433, label %436, label %434

434:                                              ; preds = %429
  %435 = icmp eq i32 %431, 0
  br i1 %435, label %487, label %474

436:                                              ; preds = %429
  %437 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !21
  %438 = zext i8 %437 to i64
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %430, i64 1
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !21
  %441 = zext i8 %440 to i64
  %442 = shl nuw nsw i64 %441, 8
  %443 = or i64 %442, %438
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %430, i64 2
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !21
  %446 = zext i8 %445 to i64
  %447 = shl nuw nsw i64 %446, 16
  %448 = or i64 %443, %447
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %430, i64 3
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !21
  %451 = zext i8 %450 to i64
  %452 = shl nuw nsw i64 %451, 24
  %453 = or i64 %448, %452
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %430, i64 4
  %455 = load i8, i8 addrspace(4)* %454, align 1, !tbaa !21
  %456 = zext i8 %455 to i64
  %457 = shl nuw nsw i64 %456, 32
  %458 = or i64 %453, %457
  %459 = getelementptr inbounds i8, i8 addrspace(4)* %430, i64 5
  %460 = load i8, i8 addrspace(4)* %459, align 1, !tbaa !21
  %461 = zext i8 %460 to i64
  %462 = shl nuw nsw i64 %461, 40
  %463 = or i64 %458, %462
  %464 = getelementptr inbounds i8, i8 addrspace(4)* %430, i64 6
  %465 = load i8, i8 addrspace(4)* %464, align 1, !tbaa !21
  %466 = zext i8 %465 to i64
  %467 = shl nuw nsw i64 %466, 48
  %468 = or i64 %463, %467
  %469 = getelementptr inbounds i8, i8 addrspace(4)* %430, i64 7
  %470 = load i8, i8 addrspace(4)* %469, align 1, !tbaa !21
  %471 = zext i8 %470 to i64
  %472 = shl nuw i64 %471, 56
  %473 = or i64 %468, %472
  br label %487

474:                                              ; preds = %434, %474
  %475 = phi i32 [ %485, %474 ], [ 0, %434 ]
  %476 = phi i64 [ %484, %474 ], [ 0, %434 ]
  %477 = zext i32 %475 to i64
  %478 = getelementptr inbounds i8, i8 addrspace(4)* %430, i64 %477
  %479 = load i8, i8 addrspace(4)* %478, align 1, !tbaa !21
  %480 = zext i8 %479 to i64
  %481 = shl i32 %475, 3
  %482 = zext i32 %481 to i64
  %483 = shl nuw i64 %480, %482
  %484 = or i64 %483, %476
  %485 = add nuw nsw i32 %475, 1
  %486 = icmp eq i32 %485, %431
  br i1 %486, label %487, label %474

487:                                              ; preds = %474, %436, %434
  %488 = phi i64 [ %473, %436 ], [ 0, %434 ], [ %484, %474 ]
  %489 = shl nuw nsw i64 %70, 2
  %490 = add nuw nsw i64 %489, 28
  %491 = and i64 %490, 480
  %492 = and i64 %72, -225
  %493 = or i64 %492, %491
  %494 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %493, i64 noundef %132, i64 noundef %192, i64 noundef %252, i64 noundef %312, i64 noundef %372, i64 noundef %432, i64 noundef %488) #11
  %495 = sub i64 %62, %70
  %496 = getelementptr inbounds i8, i8 addrspace(4)* %63, i64 %70
  %497 = icmp eq i64 %495, 0
  br i1 %497, label %498, label %61

498:                                              ; preds = %487, %53
  %499 = phi <2 x i64> [ %56, %53 ], [ %494, %487 ]
  %500 = extractelement <2 x i64> %499, i64 0
  %501 = and i64 %500, -225
  %502 = or i64 %501, 32
  %503 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %502, i64 noundef %35, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %504 = extractelement <2 x i64> %503, i64 0
  %505 = and i64 %504, -225
  %506 = or i64 %505, 32
  %507 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %506, i64 noundef %36, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %508 = extractelement <2 x i64> %507, i64 0
  %509 = zext i32 %50 to i64
  %510 = and i64 %508, -225
  %511 = or i64 %510, 32
  %512 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %511, i64 noundef %509, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %513 = extractelement <2 x i64> %512, i64 0
  %514 = zext i32 %48 to i64
  %515 = and i64 %513, -227
  %516 = or i64 %515, 34
  %517 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %516, i64 noundef %514, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %518 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !17
  %519 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !17
  %520 = icmp slt i32 %518, %519
  br i1 %520, label %532, label %521

521:                                              ; preds = %985, %498
  %522 = phi i32 [ %519, %498 ], [ %1011, %985 ]
  %523 = udiv i32 %18, %15
  %524 = mul i32 %523, %15
  %525 = icmp ugt i32 %18, %524
  %526 = zext i1 %525 to i32
  %527 = add i32 %523, %526
  %528 = mul i32 %527, %15
  %529 = add i32 %528, %49
  %530 = add nsw i32 %529, %21
  %531 = icmp slt i32 %530, %8
  br i1 %531, label %47, label %39, !llvm.loop !24

532:                                              ; preds = %498, %985
  %533 = phi i32 [ %1010, %985 ], [ %518, %498 ]
  %534 = sext i32 %533 to i64
  %535 = getelementptr inbounds float, float addrspace(1)* %2, i64 %534
  %536 = load float, float addrspace(1)* %535, align 4, !tbaa !26
  %537 = fpext float %536 to double
  %538 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %539 = extractelement <2 x i64> %538, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([33 x i8], [33 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %540, label %544

540:                                              ; preds = %532
  %541 = and i64 %539, -225
  %542 = or i64 %541, 32
  %543 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %542, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %985

544:                                              ; preds = %532
  %545 = and i64 %539, 2
  %546 = and i64 %539, -3
  %547 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %546, i64 0
  br label %548

548:                                              ; preds = %974, %544
  %549 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([33 x i8], [33 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([33 x i8], [33 x i8] addrspace(4)* @.str.1, i64 0, i64 32) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([33 x i8]* addrspacecast ([33 x i8] addrspace(4)* @.str.1 to [33 x i8]*) to i64)), i64 1))), %544 ], [ %982, %974 ]
  %550 = phi i8 addrspace(4)* [ getelementptr inbounds ([33 x i8], [33 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %544 ], [ %983, %974 ]
  %551 = phi <2 x i64> [ %547, %544 ], [ %981, %974 ]
  %552 = icmp ugt i64 %549, 56
  %553 = extractelement <2 x i64> %551, i64 0
  %554 = or i64 %553, %545
  %555 = insertelement <2 x i64> poison, i64 %554, i64 0
  %556 = select i1 %552, <2 x i64> %551, <2 x i64> %555
  %557 = tail call i64 @llvm.umin.i64(i64 %549, i64 56)
  %558 = trunc i64 %557 to i32
  %559 = extractelement <2 x i64> %556, i64 0
  %560 = icmp ugt i32 %558, 7
  br i1 %560, label %563, label %561

561:                                              ; preds = %548
  %562 = icmp eq i32 %558, 0
  br i1 %562, label %616, label %603

563:                                              ; preds = %548
  %564 = load i8, i8 addrspace(4)* %550, align 1, !tbaa !21
  %565 = zext i8 %564 to i64
  %566 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 1
  %567 = load i8, i8 addrspace(4)* %566, align 1, !tbaa !21
  %568 = zext i8 %567 to i64
  %569 = shl nuw nsw i64 %568, 8
  %570 = or i64 %569, %565
  %571 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 2
  %572 = load i8, i8 addrspace(4)* %571, align 1, !tbaa !21
  %573 = zext i8 %572 to i64
  %574 = shl nuw nsw i64 %573, 16
  %575 = or i64 %570, %574
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 3
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !21
  %578 = zext i8 %577 to i64
  %579 = shl nuw nsw i64 %578, 24
  %580 = or i64 %575, %579
  %581 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 4
  %582 = load i8, i8 addrspace(4)* %581, align 1, !tbaa !21
  %583 = zext i8 %582 to i64
  %584 = shl nuw nsw i64 %583, 32
  %585 = or i64 %580, %584
  %586 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 5
  %587 = load i8, i8 addrspace(4)* %586, align 1, !tbaa !21
  %588 = zext i8 %587 to i64
  %589 = shl nuw nsw i64 %588, 40
  %590 = or i64 %585, %589
  %591 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 6
  %592 = load i8, i8 addrspace(4)* %591, align 1, !tbaa !21
  %593 = zext i8 %592 to i64
  %594 = shl nuw nsw i64 %593, 48
  %595 = or i64 %590, %594
  %596 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 7
  %597 = load i8, i8 addrspace(4)* %596, align 1, !tbaa !21
  %598 = zext i8 %597 to i64
  %599 = shl nuw i64 %598, 56
  %600 = or i64 %595, %599
  %601 = add nsw i32 %558, -8
  %602 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 8
  br label %616

603:                                              ; preds = %561, %603
  %604 = phi i32 [ %614, %603 ], [ 0, %561 ]
  %605 = phi i64 [ %613, %603 ], [ 0, %561 ]
  %606 = zext i32 %604 to i64
  %607 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 %606
  %608 = load i8, i8 addrspace(4)* %607, align 1, !tbaa !21
  %609 = zext i8 %608 to i64
  %610 = shl i32 %604, 3
  %611 = zext i32 %610 to i64
  %612 = shl nuw i64 %609, %611
  %613 = or i64 %612, %605
  %614 = add nuw nsw i32 %604, 1
  %615 = icmp eq i32 %614, %558
  br i1 %615, label %616, label %603, !llvm.loop !22

616:                                              ; preds = %603, %563, %561
  %617 = phi i8 addrspace(4)* [ %602, %563 ], [ %550, %561 ], [ %550, %603 ]
  %618 = phi i32 [ %601, %563 ], [ 0, %561 ], [ 0, %603 ]
  %619 = phi i64 [ %600, %563 ], [ 0, %561 ], [ %613, %603 ]
  %620 = icmp ugt i32 %618, 7
  br i1 %620, label %623, label %621

621:                                              ; preds = %616
  %622 = icmp eq i32 %618, 0
  br i1 %622, label %676, label %663

623:                                              ; preds = %616
  %624 = load i8, i8 addrspace(4)* %617, align 1, !tbaa !21
  %625 = zext i8 %624 to i64
  %626 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 1
  %627 = load i8, i8 addrspace(4)* %626, align 1, !tbaa !21
  %628 = zext i8 %627 to i64
  %629 = shl nuw nsw i64 %628, 8
  %630 = or i64 %629, %625
  %631 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 2
  %632 = load i8, i8 addrspace(4)* %631, align 1, !tbaa !21
  %633 = zext i8 %632 to i64
  %634 = shl nuw nsw i64 %633, 16
  %635 = or i64 %630, %634
  %636 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 3
  %637 = load i8, i8 addrspace(4)* %636, align 1, !tbaa !21
  %638 = zext i8 %637 to i64
  %639 = shl nuw nsw i64 %638, 24
  %640 = or i64 %635, %639
  %641 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 4
  %642 = load i8, i8 addrspace(4)* %641, align 1, !tbaa !21
  %643 = zext i8 %642 to i64
  %644 = shl nuw nsw i64 %643, 32
  %645 = or i64 %640, %644
  %646 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 5
  %647 = load i8, i8 addrspace(4)* %646, align 1, !tbaa !21
  %648 = zext i8 %647 to i64
  %649 = shl nuw nsw i64 %648, 40
  %650 = or i64 %645, %649
  %651 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 6
  %652 = load i8, i8 addrspace(4)* %651, align 1, !tbaa !21
  %653 = zext i8 %652 to i64
  %654 = shl nuw nsw i64 %653, 48
  %655 = or i64 %650, %654
  %656 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 7
  %657 = load i8, i8 addrspace(4)* %656, align 1, !tbaa !21
  %658 = zext i8 %657 to i64
  %659 = shl nuw i64 %658, 56
  %660 = or i64 %655, %659
  %661 = add nsw i32 %618, -8
  %662 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 8
  br label %676

663:                                              ; preds = %621, %663
  %664 = phi i32 [ %674, %663 ], [ 0, %621 ]
  %665 = phi i64 [ %673, %663 ], [ 0, %621 ]
  %666 = zext i32 %664 to i64
  %667 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 %666
  %668 = load i8, i8 addrspace(4)* %667, align 1, !tbaa !21
  %669 = zext i8 %668 to i64
  %670 = shl i32 %664, 3
  %671 = zext i32 %670 to i64
  %672 = shl nuw i64 %669, %671
  %673 = or i64 %672, %665
  %674 = add nuw nsw i32 %664, 1
  %675 = icmp eq i32 %674, %618
  br i1 %675, label %676, label %663

676:                                              ; preds = %663, %623, %621
  %677 = phi i8 addrspace(4)* [ %662, %623 ], [ %617, %621 ], [ %617, %663 ]
  %678 = phi i32 [ %661, %623 ], [ 0, %621 ], [ 0, %663 ]
  %679 = phi i64 [ %660, %623 ], [ 0, %621 ], [ %673, %663 ]
  %680 = icmp ugt i32 %678, 7
  br i1 %680, label %683, label %681

681:                                              ; preds = %676
  %682 = icmp eq i32 %678, 0
  br i1 %682, label %736, label %723

683:                                              ; preds = %676
  %684 = load i8, i8 addrspace(4)* %677, align 1, !tbaa !21
  %685 = zext i8 %684 to i64
  %686 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 1
  %687 = load i8, i8 addrspace(4)* %686, align 1, !tbaa !21
  %688 = zext i8 %687 to i64
  %689 = shl nuw nsw i64 %688, 8
  %690 = or i64 %689, %685
  %691 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 2
  %692 = load i8, i8 addrspace(4)* %691, align 1, !tbaa !21
  %693 = zext i8 %692 to i64
  %694 = shl nuw nsw i64 %693, 16
  %695 = or i64 %690, %694
  %696 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 3
  %697 = load i8, i8 addrspace(4)* %696, align 1, !tbaa !21
  %698 = zext i8 %697 to i64
  %699 = shl nuw nsw i64 %698, 24
  %700 = or i64 %695, %699
  %701 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 4
  %702 = load i8, i8 addrspace(4)* %701, align 1, !tbaa !21
  %703 = zext i8 %702 to i64
  %704 = shl nuw nsw i64 %703, 32
  %705 = or i64 %700, %704
  %706 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 5
  %707 = load i8, i8 addrspace(4)* %706, align 1, !tbaa !21
  %708 = zext i8 %707 to i64
  %709 = shl nuw nsw i64 %708, 40
  %710 = or i64 %705, %709
  %711 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 6
  %712 = load i8, i8 addrspace(4)* %711, align 1, !tbaa !21
  %713 = zext i8 %712 to i64
  %714 = shl nuw nsw i64 %713, 48
  %715 = or i64 %710, %714
  %716 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 7
  %717 = load i8, i8 addrspace(4)* %716, align 1, !tbaa !21
  %718 = zext i8 %717 to i64
  %719 = shl nuw i64 %718, 56
  %720 = or i64 %715, %719
  %721 = add nsw i32 %678, -8
  %722 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 8
  br label %736

723:                                              ; preds = %681, %723
  %724 = phi i32 [ %734, %723 ], [ 0, %681 ]
  %725 = phi i64 [ %733, %723 ], [ 0, %681 ]
  %726 = zext i32 %724 to i64
  %727 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 %726
  %728 = load i8, i8 addrspace(4)* %727, align 1, !tbaa !21
  %729 = zext i8 %728 to i64
  %730 = shl i32 %724, 3
  %731 = zext i32 %730 to i64
  %732 = shl nuw i64 %729, %731
  %733 = or i64 %732, %725
  %734 = add nuw nsw i32 %724, 1
  %735 = icmp eq i32 %734, %678
  br i1 %735, label %736, label %723

736:                                              ; preds = %723, %683, %681
  %737 = phi i8 addrspace(4)* [ %722, %683 ], [ %677, %681 ], [ %677, %723 ]
  %738 = phi i32 [ %721, %683 ], [ 0, %681 ], [ 0, %723 ]
  %739 = phi i64 [ %720, %683 ], [ 0, %681 ], [ %733, %723 ]
  %740 = icmp ugt i32 %738, 7
  br i1 %740, label %743, label %741

741:                                              ; preds = %736
  %742 = icmp eq i32 %738, 0
  br i1 %742, label %796, label %783

743:                                              ; preds = %736
  %744 = load i8, i8 addrspace(4)* %737, align 1, !tbaa !21
  %745 = zext i8 %744 to i64
  %746 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 1
  %747 = load i8, i8 addrspace(4)* %746, align 1, !tbaa !21
  %748 = zext i8 %747 to i64
  %749 = shl nuw nsw i64 %748, 8
  %750 = or i64 %749, %745
  %751 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 2
  %752 = load i8, i8 addrspace(4)* %751, align 1, !tbaa !21
  %753 = zext i8 %752 to i64
  %754 = shl nuw nsw i64 %753, 16
  %755 = or i64 %750, %754
  %756 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 3
  %757 = load i8, i8 addrspace(4)* %756, align 1, !tbaa !21
  %758 = zext i8 %757 to i64
  %759 = shl nuw nsw i64 %758, 24
  %760 = or i64 %755, %759
  %761 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 4
  %762 = load i8, i8 addrspace(4)* %761, align 1, !tbaa !21
  %763 = zext i8 %762 to i64
  %764 = shl nuw nsw i64 %763, 32
  %765 = or i64 %760, %764
  %766 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 5
  %767 = load i8, i8 addrspace(4)* %766, align 1, !tbaa !21
  %768 = zext i8 %767 to i64
  %769 = shl nuw nsw i64 %768, 40
  %770 = or i64 %765, %769
  %771 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 6
  %772 = load i8, i8 addrspace(4)* %771, align 1, !tbaa !21
  %773 = zext i8 %772 to i64
  %774 = shl nuw nsw i64 %773, 48
  %775 = or i64 %770, %774
  %776 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 7
  %777 = load i8, i8 addrspace(4)* %776, align 1, !tbaa !21
  %778 = zext i8 %777 to i64
  %779 = shl nuw i64 %778, 56
  %780 = or i64 %775, %779
  %781 = add nsw i32 %738, -8
  %782 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 8
  br label %796

783:                                              ; preds = %741, %783
  %784 = phi i32 [ %794, %783 ], [ 0, %741 ]
  %785 = phi i64 [ %793, %783 ], [ 0, %741 ]
  %786 = zext i32 %784 to i64
  %787 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 %786
  %788 = load i8, i8 addrspace(4)* %787, align 1, !tbaa !21
  %789 = zext i8 %788 to i64
  %790 = shl i32 %784, 3
  %791 = zext i32 %790 to i64
  %792 = shl nuw i64 %789, %791
  %793 = or i64 %792, %785
  %794 = add nuw nsw i32 %784, 1
  %795 = icmp eq i32 %794, %738
  br i1 %795, label %796, label %783

796:                                              ; preds = %783, %743, %741
  %797 = phi i8 addrspace(4)* [ %782, %743 ], [ %737, %741 ], [ %737, %783 ]
  %798 = phi i32 [ %781, %743 ], [ 0, %741 ], [ 0, %783 ]
  %799 = phi i64 [ %780, %743 ], [ 0, %741 ], [ %793, %783 ]
  %800 = icmp ugt i32 %798, 7
  br i1 %800, label %803, label %801

801:                                              ; preds = %796
  %802 = icmp eq i32 %798, 0
  br i1 %802, label %856, label %843

803:                                              ; preds = %796
  %804 = load i8, i8 addrspace(4)* %797, align 1, !tbaa !21
  %805 = zext i8 %804 to i64
  %806 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 1
  %807 = load i8, i8 addrspace(4)* %806, align 1, !tbaa !21
  %808 = zext i8 %807 to i64
  %809 = shl nuw nsw i64 %808, 8
  %810 = or i64 %809, %805
  %811 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 2
  %812 = load i8, i8 addrspace(4)* %811, align 1, !tbaa !21
  %813 = zext i8 %812 to i64
  %814 = shl nuw nsw i64 %813, 16
  %815 = or i64 %810, %814
  %816 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 3
  %817 = load i8, i8 addrspace(4)* %816, align 1, !tbaa !21
  %818 = zext i8 %817 to i64
  %819 = shl nuw nsw i64 %818, 24
  %820 = or i64 %815, %819
  %821 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 4
  %822 = load i8, i8 addrspace(4)* %821, align 1, !tbaa !21
  %823 = zext i8 %822 to i64
  %824 = shl nuw nsw i64 %823, 32
  %825 = or i64 %820, %824
  %826 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 5
  %827 = load i8, i8 addrspace(4)* %826, align 1, !tbaa !21
  %828 = zext i8 %827 to i64
  %829 = shl nuw nsw i64 %828, 40
  %830 = or i64 %825, %829
  %831 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 6
  %832 = load i8, i8 addrspace(4)* %831, align 1, !tbaa !21
  %833 = zext i8 %832 to i64
  %834 = shl nuw nsw i64 %833, 48
  %835 = or i64 %830, %834
  %836 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 7
  %837 = load i8, i8 addrspace(4)* %836, align 1, !tbaa !21
  %838 = zext i8 %837 to i64
  %839 = shl nuw i64 %838, 56
  %840 = or i64 %835, %839
  %841 = add nsw i32 %798, -8
  %842 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 8
  br label %856

843:                                              ; preds = %801, %843
  %844 = phi i32 [ %854, %843 ], [ 0, %801 ]
  %845 = phi i64 [ %853, %843 ], [ 0, %801 ]
  %846 = zext i32 %844 to i64
  %847 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 %846
  %848 = load i8, i8 addrspace(4)* %847, align 1, !tbaa !21
  %849 = zext i8 %848 to i64
  %850 = shl i32 %844, 3
  %851 = zext i32 %850 to i64
  %852 = shl nuw i64 %849, %851
  %853 = or i64 %852, %845
  %854 = add nuw nsw i32 %844, 1
  %855 = icmp eq i32 %854, %798
  br i1 %855, label %856, label %843

856:                                              ; preds = %843, %803, %801
  %857 = phi i8 addrspace(4)* [ %842, %803 ], [ %797, %801 ], [ %797, %843 ]
  %858 = phi i32 [ %841, %803 ], [ 0, %801 ], [ 0, %843 ]
  %859 = phi i64 [ %840, %803 ], [ 0, %801 ], [ %853, %843 ]
  %860 = icmp ugt i32 %858, 7
  br i1 %860, label %863, label %861

861:                                              ; preds = %856
  %862 = icmp eq i32 %858, 0
  br i1 %862, label %916, label %903

863:                                              ; preds = %856
  %864 = load i8, i8 addrspace(4)* %857, align 1, !tbaa !21
  %865 = zext i8 %864 to i64
  %866 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 1
  %867 = load i8, i8 addrspace(4)* %866, align 1, !tbaa !21
  %868 = zext i8 %867 to i64
  %869 = shl nuw nsw i64 %868, 8
  %870 = or i64 %869, %865
  %871 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 2
  %872 = load i8, i8 addrspace(4)* %871, align 1, !tbaa !21
  %873 = zext i8 %872 to i64
  %874 = shl nuw nsw i64 %873, 16
  %875 = or i64 %870, %874
  %876 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 3
  %877 = load i8, i8 addrspace(4)* %876, align 1, !tbaa !21
  %878 = zext i8 %877 to i64
  %879 = shl nuw nsw i64 %878, 24
  %880 = or i64 %875, %879
  %881 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 4
  %882 = load i8, i8 addrspace(4)* %881, align 1, !tbaa !21
  %883 = zext i8 %882 to i64
  %884 = shl nuw nsw i64 %883, 32
  %885 = or i64 %880, %884
  %886 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 5
  %887 = load i8, i8 addrspace(4)* %886, align 1, !tbaa !21
  %888 = zext i8 %887 to i64
  %889 = shl nuw nsw i64 %888, 40
  %890 = or i64 %885, %889
  %891 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 6
  %892 = load i8, i8 addrspace(4)* %891, align 1, !tbaa !21
  %893 = zext i8 %892 to i64
  %894 = shl nuw nsw i64 %893, 48
  %895 = or i64 %890, %894
  %896 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 7
  %897 = load i8, i8 addrspace(4)* %896, align 1, !tbaa !21
  %898 = zext i8 %897 to i64
  %899 = shl nuw i64 %898, 56
  %900 = or i64 %895, %899
  %901 = add nsw i32 %858, -8
  %902 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 8
  br label %916

903:                                              ; preds = %861, %903
  %904 = phi i32 [ %914, %903 ], [ 0, %861 ]
  %905 = phi i64 [ %913, %903 ], [ 0, %861 ]
  %906 = zext i32 %904 to i64
  %907 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 %906
  %908 = load i8, i8 addrspace(4)* %907, align 1, !tbaa !21
  %909 = zext i8 %908 to i64
  %910 = shl i32 %904, 3
  %911 = zext i32 %910 to i64
  %912 = shl nuw i64 %909, %911
  %913 = or i64 %912, %905
  %914 = add nuw nsw i32 %904, 1
  %915 = icmp eq i32 %914, %858
  br i1 %915, label %916, label %903

916:                                              ; preds = %903, %863, %861
  %917 = phi i8 addrspace(4)* [ %902, %863 ], [ %857, %861 ], [ %857, %903 ]
  %918 = phi i32 [ %901, %863 ], [ 0, %861 ], [ 0, %903 ]
  %919 = phi i64 [ %900, %863 ], [ 0, %861 ], [ %913, %903 ]
  %920 = icmp ugt i32 %918, 7
  br i1 %920, label %923, label %921

921:                                              ; preds = %916
  %922 = icmp eq i32 %918, 0
  br i1 %922, label %974, label %961

923:                                              ; preds = %916
  %924 = load i8, i8 addrspace(4)* %917, align 1, !tbaa !21
  %925 = zext i8 %924 to i64
  %926 = getelementptr inbounds i8, i8 addrspace(4)* %917, i64 1
  %927 = load i8, i8 addrspace(4)* %926, align 1, !tbaa !21
  %928 = zext i8 %927 to i64
  %929 = shl nuw nsw i64 %928, 8
  %930 = or i64 %929, %925
  %931 = getelementptr inbounds i8, i8 addrspace(4)* %917, i64 2
  %932 = load i8, i8 addrspace(4)* %931, align 1, !tbaa !21
  %933 = zext i8 %932 to i64
  %934 = shl nuw nsw i64 %933, 16
  %935 = or i64 %930, %934
  %936 = getelementptr inbounds i8, i8 addrspace(4)* %917, i64 3
  %937 = load i8, i8 addrspace(4)* %936, align 1, !tbaa !21
  %938 = zext i8 %937 to i64
  %939 = shl nuw nsw i64 %938, 24
  %940 = or i64 %935, %939
  %941 = getelementptr inbounds i8, i8 addrspace(4)* %917, i64 4
  %942 = load i8, i8 addrspace(4)* %941, align 1, !tbaa !21
  %943 = zext i8 %942 to i64
  %944 = shl nuw nsw i64 %943, 32
  %945 = or i64 %940, %944
  %946 = getelementptr inbounds i8, i8 addrspace(4)* %917, i64 5
  %947 = load i8, i8 addrspace(4)* %946, align 1, !tbaa !21
  %948 = zext i8 %947 to i64
  %949 = shl nuw nsw i64 %948, 40
  %950 = or i64 %945, %949
  %951 = getelementptr inbounds i8, i8 addrspace(4)* %917, i64 6
  %952 = load i8, i8 addrspace(4)* %951, align 1, !tbaa !21
  %953 = zext i8 %952 to i64
  %954 = shl nuw nsw i64 %953, 48
  %955 = or i64 %950, %954
  %956 = getelementptr inbounds i8, i8 addrspace(4)* %917, i64 7
  %957 = load i8, i8 addrspace(4)* %956, align 1, !tbaa !21
  %958 = zext i8 %957 to i64
  %959 = shl nuw i64 %958, 56
  %960 = or i64 %955, %959
  br label %974

961:                                              ; preds = %921, %961
  %962 = phi i32 [ %972, %961 ], [ 0, %921 ]
  %963 = phi i64 [ %971, %961 ], [ 0, %921 ]
  %964 = zext i32 %962 to i64
  %965 = getelementptr inbounds i8, i8 addrspace(4)* %917, i64 %964
  %966 = load i8, i8 addrspace(4)* %965, align 1, !tbaa !21
  %967 = zext i8 %966 to i64
  %968 = shl i32 %962, 3
  %969 = zext i32 %968 to i64
  %970 = shl nuw i64 %967, %969
  %971 = or i64 %970, %963
  %972 = add nuw nsw i32 %962, 1
  %973 = icmp eq i32 %972, %918
  br i1 %973, label %974, label %961

974:                                              ; preds = %961, %923, %921
  %975 = phi i64 [ %960, %923 ], [ 0, %921 ], [ %971, %961 ]
  %976 = shl nuw nsw i64 %557, 2
  %977 = add nuw nsw i64 %976, 28
  %978 = and i64 %977, 480
  %979 = and i64 %559, -225
  %980 = or i64 %979, %978
  %981 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %980, i64 noundef %619, i64 noundef %679, i64 noundef %739, i64 noundef %799, i64 noundef %859, i64 noundef %919, i64 noundef %975) #11
  %982 = sub i64 %549, %557
  %983 = getelementptr inbounds i8, i8 addrspace(4)* %550, i64 %557
  %984 = icmp eq i64 %982, 0
  br i1 %984, label %985, label %548

985:                                              ; preds = %974, %540
  %986 = phi <2 x i64> [ %543, %540 ], [ %981, %974 ]
  %987 = extractelement <2 x i64> %986, i64 0
  %988 = and i64 %987, -225
  %989 = or i64 %988, 32
  %990 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %989, i64 noundef %35, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %991 = extractelement <2 x i64> %990, i64 0
  %992 = zext i32 %533 to i64
  %993 = and i64 %991, -225
  %994 = or i64 %993, 32
  %995 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %994, i64 noundef %992, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %996 = extractelement <2 x i64> %995, i64 0
  %997 = bitcast double %537 to i64
  %998 = and i64 %996, -227
  %999 = or i64 %998, 34
  %1000 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %999, i64 noundef %997, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1001 = load float, float addrspace(1)* %535, align 4, !tbaa !26
  %1002 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %534
  %1003 = load i32, i32 addrspace(1)* %1002, align 4, !tbaa !17
  %1004 = sext i32 %1003 to i64
  %1005 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1004
  %1006 = load float, float addrspace(1)* %1005, align 4, !tbaa !26
  %1007 = fmul contract float %1001, %1006
  %1008 = load float, float addrspace(1)* %37, align 4, !tbaa !26
  %1009 = fadd contract float %1008, %1007
  store float %1009, float addrspace(1)* %37, align 4, !tbaa !26
  %1010 = add nsw i32 %533, 1
  %1011 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !17
  %1012 = icmp slt i32 %1010, %1011
  br i1 %1012, label %532, label %521, !llvm.loop !28

1013:                                             ; preds = %40, %1013
  %1014 = phi i32 [ %21, %40 ], [ %1031, %1013 ]
  %1015 = phi float [ 0.000000e+00, %40 ], [ %1029, %1013 ]
  %1016 = phi float [ 0.000000e+00, %40 ], [ %1027, %1013 ]
  %1017 = phi float [ 0.000000e+00, %40 ], [ %1023, %1013 ]
  %1018 = phi i32 [ 0, %40 ], [ %1030, %1013 ]
  %1019 = sext i32 %1014 to i64
  %1020 = getelementptr inbounds float, float addrspace(1)* %4, i64 %1019
  %1021 = load float, float addrspace(1)* %1020, align 4, !tbaa !26
  %1022 = fmul contract float %1021, %1021
  %1023 = fadd contract float %1017, %1022
  %1024 = getelementptr inbounds float, float addrspace(1)* %3, i64 %1019
  %1025 = load float, float addrspace(1)* %1024, align 4, !tbaa !26
  %1026 = fmul contract float %1021, %1025
  %1027 = fadd contract float %1016, %1026
  %1028 = fmul contract float %1025, %1025
  %1029 = fadd contract float %1015, %1028
  %1030 = add i32 %46, %1018
  %1031 = add nsw i32 %1030, %21
  %1032 = icmp slt i32 %1031, %8
  br i1 %1032, label %1013, label %1033, !llvm.loop !29

1033:                                             ; preds = %1013, %9, %39
  %1034 = phi float [ 0.000000e+00, %39 ], [ 0.000000e+00, %9 ], [ %1023, %1013 ]
  %1035 = phi float [ 0.000000e+00, %39 ], [ 0.000000e+00, %9 ], [ %1027, %1013 ]
  %1036 = phi float [ 0.000000e+00, %39 ], [ 0.000000e+00, %9 ], [ %1029, %1013 ]
  %1037 = getelementptr inbounds [2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache1, i32 0, i32 %10
  store float %1034, float addrspace(3)* %1037, align 4, !tbaa !26
  %1038 = getelementptr inbounds [2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache2, i32 0, i32 %10
  store float %1035, float addrspace(3)* %1038, align 4, !tbaa !26
  %1039 = getelementptr inbounds [2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache3, i32 0, i32 %10
  store float %1036, float addrspace(3)* %1039, align 4, !tbaa !26
  %1040 = fpext float %1034 to double
  %1041 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %1042 = getelementptr inbounds i8, i8 addrspace(4)* %1041, i64 24
  %1043 = bitcast i8 addrspace(4)* %1042 to i64 addrspace(4)*
  %1044 = load i64, i64 addrspace(4)* %1043, align 8, !tbaa !16
  %1045 = inttoptr i64 %1044 to i8 addrspace(1)*
  %1046 = addrspacecast i8 addrspace(1)* %1045 to i8*
  %1047 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1048 = extractelement <2 x i64> %1047, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([34 x i8], [34 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %1049, label %1053

1049:                                             ; preds = %1033
  %1050 = and i64 %1048, -225
  %1051 = or i64 %1050, 32
  %1052 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %1051, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1494

1053:                                             ; preds = %1033
  %1054 = and i64 %1048, 2
  %1055 = and i64 %1048, -3
  %1056 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1055, i64 0
  br label %1057

1057:                                             ; preds = %1483, %1053
  %1058 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([34 x i8], [34 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([34 x i8], [34 x i8] addrspace(4)* @.str.2, i64 0, i64 33) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([34 x i8]* addrspacecast ([34 x i8] addrspace(4)* @.str.2 to [34 x i8]*) to i64)), i64 1))), %1053 ], [ %1491, %1483 ]
  %1059 = phi i8 addrspace(4)* [ getelementptr inbounds ([34 x i8], [34 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1053 ], [ %1492, %1483 ]
  %1060 = phi <2 x i64> [ %1056, %1053 ], [ %1490, %1483 ]
  %1061 = icmp ugt i64 %1058, 56
  %1062 = extractelement <2 x i64> %1060, i64 0
  %1063 = or i64 %1062, %1054
  %1064 = insertelement <2 x i64> poison, i64 %1063, i64 0
  %1065 = select i1 %1061, <2 x i64> %1060, <2 x i64> %1064
  %1066 = tail call i64 @llvm.umin.i64(i64 %1058, i64 56)
  %1067 = trunc i64 %1066 to i32
  %1068 = extractelement <2 x i64> %1065, i64 0
  %1069 = icmp ugt i32 %1067, 7
  br i1 %1069, label %1072, label %1070

1070:                                             ; preds = %1057
  %1071 = icmp eq i32 %1067, 0
  br i1 %1071, label %1125, label %1112

1072:                                             ; preds = %1057
  %1073 = load i8, i8 addrspace(4)* %1059, align 1, !tbaa !21
  %1074 = zext i8 %1073 to i64
  %1075 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 1
  %1076 = load i8, i8 addrspace(4)* %1075, align 1, !tbaa !21
  %1077 = zext i8 %1076 to i64
  %1078 = shl nuw nsw i64 %1077, 8
  %1079 = or i64 %1078, %1074
  %1080 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 2
  %1081 = load i8, i8 addrspace(4)* %1080, align 1, !tbaa !21
  %1082 = zext i8 %1081 to i64
  %1083 = shl nuw nsw i64 %1082, 16
  %1084 = or i64 %1079, %1083
  %1085 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 3
  %1086 = load i8, i8 addrspace(4)* %1085, align 1, !tbaa !21
  %1087 = zext i8 %1086 to i64
  %1088 = shl nuw nsw i64 %1087, 24
  %1089 = or i64 %1084, %1088
  %1090 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 4
  %1091 = load i8, i8 addrspace(4)* %1090, align 1, !tbaa !21
  %1092 = zext i8 %1091 to i64
  %1093 = shl nuw nsw i64 %1092, 32
  %1094 = or i64 %1089, %1093
  %1095 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 5
  %1096 = load i8, i8 addrspace(4)* %1095, align 1, !tbaa !21
  %1097 = zext i8 %1096 to i64
  %1098 = shl nuw nsw i64 %1097, 40
  %1099 = or i64 %1094, %1098
  %1100 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 6
  %1101 = load i8, i8 addrspace(4)* %1100, align 1, !tbaa !21
  %1102 = zext i8 %1101 to i64
  %1103 = shl nuw nsw i64 %1102, 48
  %1104 = or i64 %1099, %1103
  %1105 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 7
  %1106 = load i8, i8 addrspace(4)* %1105, align 1, !tbaa !21
  %1107 = zext i8 %1106 to i64
  %1108 = shl nuw i64 %1107, 56
  %1109 = or i64 %1104, %1108
  %1110 = add nsw i32 %1067, -8
  %1111 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 8
  br label %1125

1112:                                             ; preds = %1070, %1112
  %1113 = phi i32 [ %1123, %1112 ], [ 0, %1070 ]
  %1114 = phi i64 [ %1122, %1112 ], [ 0, %1070 ]
  %1115 = zext i32 %1113 to i64
  %1116 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 %1115
  %1117 = load i8, i8 addrspace(4)* %1116, align 1, !tbaa !21
  %1118 = zext i8 %1117 to i64
  %1119 = shl i32 %1113, 3
  %1120 = zext i32 %1119 to i64
  %1121 = shl nuw i64 %1118, %1120
  %1122 = or i64 %1121, %1114
  %1123 = add nuw nsw i32 %1113, 1
  %1124 = icmp eq i32 %1123, %1067
  br i1 %1124, label %1125, label %1112, !llvm.loop !22

1125:                                             ; preds = %1112, %1072, %1070
  %1126 = phi i8 addrspace(4)* [ %1111, %1072 ], [ %1059, %1070 ], [ %1059, %1112 ]
  %1127 = phi i32 [ %1110, %1072 ], [ 0, %1070 ], [ 0, %1112 ]
  %1128 = phi i64 [ %1109, %1072 ], [ 0, %1070 ], [ %1122, %1112 ]
  %1129 = icmp ugt i32 %1127, 7
  br i1 %1129, label %1132, label %1130

1130:                                             ; preds = %1125
  %1131 = icmp eq i32 %1127, 0
  br i1 %1131, label %1185, label %1172

1132:                                             ; preds = %1125
  %1133 = load i8, i8 addrspace(4)* %1126, align 1, !tbaa !21
  %1134 = zext i8 %1133 to i64
  %1135 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 1
  %1136 = load i8, i8 addrspace(4)* %1135, align 1, !tbaa !21
  %1137 = zext i8 %1136 to i64
  %1138 = shl nuw nsw i64 %1137, 8
  %1139 = or i64 %1138, %1134
  %1140 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 2
  %1141 = load i8, i8 addrspace(4)* %1140, align 1, !tbaa !21
  %1142 = zext i8 %1141 to i64
  %1143 = shl nuw nsw i64 %1142, 16
  %1144 = or i64 %1139, %1143
  %1145 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 3
  %1146 = load i8, i8 addrspace(4)* %1145, align 1, !tbaa !21
  %1147 = zext i8 %1146 to i64
  %1148 = shl nuw nsw i64 %1147, 24
  %1149 = or i64 %1144, %1148
  %1150 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 4
  %1151 = load i8, i8 addrspace(4)* %1150, align 1, !tbaa !21
  %1152 = zext i8 %1151 to i64
  %1153 = shl nuw nsw i64 %1152, 32
  %1154 = or i64 %1149, %1153
  %1155 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 5
  %1156 = load i8, i8 addrspace(4)* %1155, align 1, !tbaa !21
  %1157 = zext i8 %1156 to i64
  %1158 = shl nuw nsw i64 %1157, 40
  %1159 = or i64 %1154, %1158
  %1160 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 6
  %1161 = load i8, i8 addrspace(4)* %1160, align 1, !tbaa !21
  %1162 = zext i8 %1161 to i64
  %1163 = shl nuw nsw i64 %1162, 48
  %1164 = or i64 %1159, %1163
  %1165 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 7
  %1166 = load i8, i8 addrspace(4)* %1165, align 1, !tbaa !21
  %1167 = zext i8 %1166 to i64
  %1168 = shl nuw i64 %1167, 56
  %1169 = or i64 %1164, %1168
  %1170 = add nsw i32 %1127, -8
  %1171 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 8
  br label %1185

1172:                                             ; preds = %1130, %1172
  %1173 = phi i32 [ %1183, %1172 ], [ 0, %1130 ]
  %1174 = phi i64 [ %1182, %1172 ], [ 0, %1130 ]
  %1175 = zext i32 %1173 to i64
  %1176 = getelementptr inbounds i8, i8 addrspace(4)* %1126, i64 %1175
  %1177 = load i8, i8 addrspace(4)* %1176, align 1, !tbaa !21
  %1178 = zext i8 %1177 to i64
  %1179 = shl i32 %1173, 3
  %1180 = zext i32 %1179 to i64
  %1181 = shl nuw i64 %1178, %1180
  %1182 = or i64 %1181, %1174
  %1183 = add nuw nsw i32 %1173, 1
  %1184 = icmp eq i32 %1183, %1127
  br i1 %1184, label %1185, label %1172

1185:                                             ; preds = %1172, %1132, %1130
  %1186 = phi i8 addrspace(4)* [ %1171, %1132 ], [ %1126, %1130 ], [ %1126, %1172 ]
  %1187 = phi i32 [ %1170, %1132 ], [ 0, %1130 ], [ 0, %1172 ]
  %1188 = phi i64 [ %1169, %1132 ], [ 0, %1130 ], [ %1182, %1172 ]
  %1189 = icmp ugt i32 %1187, 7
  br i1 %1189, label %1192, label %1190

1190:                                             ; preds = %1185
  %1191 = icmp eq i32 %1187, 0
  br i1 %1191, label %1245, label %1232

1192:                                             ; preds = %1185
  %1193 = load i8, i8 addrspace(4)* %1186, align 1, !tbaa !21
  %1194 = zext i8 %1193 to i64
  %1195 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 1
  %1196 = load i8, i8 addrspace(4)* %1195, align 1, !tbaa !21
  %1197 = zext i8 %1196 to i64
  %1198 = shl nuw nsw i64 %1197, 8
  %1199 = or i64 %1198, %1194
  %1200 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 2
  %1201 = load i8, i8 addrspace(4)* %1200, align 1, !tbaa !21
  %1202 = zext i8 %1201 to i64
  %1203 = shl nuw nsw i64 %1202, 16
  %1204 = or i64 %1199, %1203
  %1205 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 3
  %1206 = load i8, i8 addrspace(4)* %1205, align 1, !tbaa !21
  %1207 = zext i8 %1206 to i64
  %1208 = shl nuw nsw i64 %1207, 24
  %1209 = or i64 %1204, %1208
  %1210 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 4
  %1211 = load i8, i8 addrspace(4)* %1210, align 1, !tbaa !21
  %1212 = zext i8 %1211 to i64
  %1213 = shl nuw nsw i64 %1212, 32
  %1214 = or i64 %1209, %1213
  %1215 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 5
  %1216 = load i8, i8 addrspace(4)* %1215, align 1, !tbaa !21
  %1217 = zext i8 %1216 to i64
  %1218 = shl nuw nsw i64 %1217, 40
  %1219 = or i64 %1214, %1218
  %1220 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 6
  %1221 = load i8, i8 addrspace(4)* %1220, align 1, !tbaa !21
  %1222 = zext i8 %1221 to i64
  %1223 = shl nuw nsw i64 %1222, 48
  %1224 = or i64 %1219, %1223
  %1225 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 7
  %1226 = load i8, i8 addrspace(4)* %1225, align 1, !tbaa !21
  %1227 = zext i8 %1226 to i64
  %1228 = shl nuw i64 %1227, 56
  %1229 = or i64 %1224, %1228
  %1230 = add nsw i32 %1187, -8
  %1231 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 8
  br label %1245

1232:                                             ; preds = %1190, %1232
  %1233 = phi i32 [ %1243, %1232 ], [ 0, %1190 ]
  %1234 = phi i64 [ %1242, %1232 ], [ 0, %1190 ]
  %1235 = zext i32 %1233 to i64
  %1236 = getelementptr inbounds i8, i8 addrspace(4)* %1186, i64 %1235
  %1237 = load i8, i8 addrspace(4)* %1236, align 1, !tbaa !21
  %1238 = zext i8 %1237 to i64
  %1239 = shl i32 %1233, 3
  %1240 = zext i32 %1239 to i64
  %1241 = shl nuw i64 %1238, %1240
  %1242 = or i64 %1241, %1234
  %1243 = add nuw nsw i32 %1233, 1
  %1244 = icmp eq i32 %1243, %1187
  br i1 %1244, label %1245, label %1232

1245:                                             ; preds = %1232, %1192, %1190
  %1246 = phi i8 addrspace(4)* [ %1231, %1192 ], [ %1186, %1190 ], [ %1186, %1232 ]
  %1247 = phi i32 [ %1230, %1192 ], [ 0, %1190 ], [ 0, %1232 ]
  %1248 = phi i64 [ %1229, %1192 ], [ 0, %1190 ], [ %1242, %1232 ]
  %1249 = icmp ugt i32 %1247, 7
  br i1 %1249, label %1252, label %1250

1250:                                             ; preds = %1245
  %1251 = icmp eq i32 %1247, 0
  br i1 %1251, label %1305, label %1292

1252:                                             ; preds = %1245
  %1253 = load i8, i8 addrspace(4)* %1246, align 1, !tbaa !21
  %1254 = zext i8 %1253 to i64
  %1255 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 1
  %1256 = load i8, i8 addrspace(4)* %1255, align 1, !tbaa !21
  %1257 = zext i8 %1256 to i64
  %1258 = shl nuw nsw i64 %1257, 8
  %1259 = or i64 %1258, %1254
  %1260 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 2
  %1261 = load i8, i8 addrspace(4)* %1260, align 1, !tbaa !21
  %1262 = zext i8 %1261 to i64
  %1263 = shl nuw nsw i64 %1262, 16
  %1264 = or i64 %1259, %1263
  %1265 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 3
  %1266 = load i8, i8 addrspace(4)* %1265, align 1, !tbaa !21
  %1267 = zext i8 %1266 to i64
  %1268 = shl nuw nsw i64 %1267, 24
  %1269 = or i64 %1264, %1268
  %1270 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 4
  %1271 = load i8, i8 addrspace(4)* %1270, align 1, !tbaa !21
  %1272 = zext i8 %1271 to i64
  %1273 = shl nuw nsw i64 %1272, 32
  %1274 = or i64 %1269, %1273
  %1275 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 5
  %1276 = load i8, i8 addrspace(4)* %1275, align 1, !tbaa !21
  %1277 = zext i8 %1276 to i64
  %1278 = shl nuw nsw i64 %1277, 40
  %1279 = or i64 %1274, %1278
  %1280 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 6
  %1281 = load i8, i8 addrspace(4)* %1280, align 1, !tbaa !21
  %1282 = zext i8 %1281 to i64
  %1283 = shl nuw nsw i64 %1282, 48
  %1284 = or i64 %1279, %1283
  %1285 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 7
  %1286 = load i8, i8 addrspace(4)* %1285, align 1, !tbaa !21
  %1287 = zext i8 %1286 to i64
  %1288 = shl nuw i64 %1287, 56
  %1289 = or i64 %1284, %1288
  %1290 = add nsw i32 %1247, -8
  %1291 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 8
  br label %1305

1292:                                             ; preds = %1250, %1292
  %1293 = phi i32 [ %1303, %1292 ], [ 0, %1250 ]
  %1294 = phi i64 [ %1302, %1292 ], [ 0, %1250 ]
  %1295 = zext i32 %1293 to i64
  %1296 = getelementptr inbounds i8, i8 addrspace(4)* %1246, i64 %1295
  %1297 = load i8, i8 addrspace(4)* %1296, align 1, !tbaa !21
  %1298 = zext i8 %1297 to i64
  %1299 = shl i32 %1293, 3
  %1300 = zext i32 %1299 to i64
  %1301 = shl nuw i64 %1298, %1300
  %1302 = or i64 %1301, %1294
  %1303 = add nuw nsw i32 %1293, 1
  %1304 = icmp eq i32 %1303, %1247
  br i1 %1304, label %1305, label %1292

1305:                                             ; preds = %1292, %1252, %1250
  %1306 = phi i8 addrspace(4)* [ %1291, %1252 ], [ %1246, %1250 ], [ %1246, %1292 ]
  %1307 = phi i32 [ %1290, %1252 ], [ 0, %1250 ], [ 0, %1292 ]
  %1308 = phi i64 [ %1289, %1252 ], [ 0, %1250 ], [ %1302, %1292 ]
  %1309 = icmp ugt i32 %1307, 7
  br i1 %1309, label %1312, label %1310

1310:                                             ; preds = %1305
  %1311 = icmp eq i32 %1307, 0
  br i1 %1311, label %1365, label %1352

1312:                                             ; preds = %1305
  %1313 = load i8, i8 addrspace(4)* %1306, align 1, !tbaa !21
  %1314 = zext i8 %1313 to i64
  %1315 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 1
  %1316 = load i8, i8 addrspace(4)* %1315, align 1, !tbaa !21
  %1317 = zext i8 %1316 to i64
  %1318 = shl nuw nsw i64 %1317, 8
  %1319 = or i64 %1318, %1314
  %1320 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 2
  %1321 = load i8, i8 addrspace(4)* %1320, align 1, !tbaa !21
  %1322 = zext i8 %1321 to i64
  %1323 = shl nuw nsw i64 %1322, 16
  %1324 = or i64 %1319, %1323
  %1325 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 3
  %1326 = load i8, i8 addrspace(4)* %1325, align 1, !tbaa !21
  %1327 = zext i8 %1326 to i64
  %1328 = shl nuw nsw i64 %1327, 24
  %1329 = or i64 %1324, %1328
  %1330 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 4
  %1331 = load i8, i8 addrspace(4)* %1330, align 1, !tbaa !21
  %1332 = zext i8 %1331 to i64
  %1333 = shl nuw nsw i64 %1332, 32
  %1334 = or i64 %1329, %1333
  %1335 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 5
  %1336 = load i8, i8 addrspace(4)* %1335, align 1, !tbaa !21
  %1337 = zext i8 %1336 to i64
  %1338 = shl nuw nsw i64 %1337, 40
  %1339 = or i64 %1334, %1338
  %1340 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 6
  %1341 = load i8, i8 addrspace(4)* %1340, align 1, !tbaa !21
  %1342 = zext i8 %1341 to i64
  %1343 = shl nuw nsw i64 %1342, 48
  %1344 = or i64 %1339, %1343
  %1345 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 7
  %1346 = load i8, i8 addrspace(4)* %1345, align 1, !tbaa !21
  %1347 = zext i8 %1346 to i64
  %1348 = shl nuw i64 %1347, 56
  %1349 = or i64 %1344, %1348
  %1350 = add nsw i32 %1307, -8
  %1351 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 8
  br label %1365

1352:                                             ; preds = %1310, %1352
  %1353 = phi i32 [ %1363, %1352 ], [ 0, %1310 ]
  %1354 = phi i64 [ %1362, %1352 ], [ 0, %1310 ]
  %1355 = zext i32 %1353 to i64
  %1356 = getelementptr inbounds i8, i8 addrspace(4)* %1306, i64 %1355
  %1357 = load i8, i8 addrspace(4)* %1356, align 1, !tbaa !21
  %1358 = zext i8 %1357 to i64
  %1359 = shl i32 %1353, 3
  %1360 = zext i32 %1359 to i64
  %1361 = shl nuw i64 %1358, %1360
  %1362 = or i64 %1361, %1354
  %1363 = add nuw nsw i32 %1353, 1
  %1364 = icmp eq i32 %1363, %1307
  br i1 %1364, label %1365, label %1352

1365:                                             ; preds = %1352, %1312, %1310
  %1366 = phi i8 addrspace(4)* [ %1351, %1312 ], [ %1306, %1310 ], [ %1306, %1352 ]
  %1367 = phi i32 [ %1350, %1312 ], [ 0, %1310 ], [ 0, %1352 ]
  %1368 = phi i64 [ %1349, %1312 ], [ 0, %1310 ], [ %1362, %1352 ]
  %1369 = icmp ugt i32 %1367, 7
  br i1 %1369, label %1372, label %1370

1370:                                             ; preds = %1365
  %1371 = icmp eq i32 %1367, 0
  br i1 %1371, label %1425, label %1412

1372:                                             ; preds = %1365
  %1373 = load i8, i8 addrspace(4)* %1366, align 1, !tbaa !21
  %1374 = zext i8 %1373 to i64
  %1375 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 1
  %1376 = load i8, i8 addrspace(4)* %1375, align 1, !tbaa !21
  %1377 = zext i8 %1376 to i64
  %1378 = shl nuw nsw i64 %1377, 8
  %1379 = or i64 %1378, %1374
  %1380 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 2
  %1381 = load i8, i8 addrspace(4)* %1380, align 1, !tbaa !21
  %1382 = zext i8 %1381 to i64
  %1383 = shl nuw nsw i64 %1382, 16
  %1384 = or i64 %1379, %1383
  %1385 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 3
  %1386 = load i8, i8 addrspace(4)* %1385, align 1, !tbaa !21
  %1387 = zext i8 %1386 to i64
  %1388 = shl nuw nsw i64 %1387, 24
  %1389 = or i64 %1384, %1388
  %1390 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 4
  %1391 = load i8, i8 addrspace(4)* %1390, align 1, !tbaa !21
  %1392 = zext i8 %1391 to i64
  %1393 = shl nuw nsw i64 %1392, 32
  %1394 = or i64 %1389, %1393
  %1395 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 5
  %1396 = load i8, i8 addrspace(4)* %1395, align 1, !tbaa !21
  %1397 = zext i8 %1396 to i64
  %1398 = shl nuw nsw i64 %1397, 40
  %1399 = or i64 %1394, %1398
  %1400 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 6
  %1401 = load i8, i8 addrspace(4)* %1400, align 1, !tbaa !21
  %1402 = zext i8 %1401 to i64
  %1403 = shl nuw nsw i64 %1402, 48
  %1404 = or i64 %1399, %1403
  %1405 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 7
  %1406 = load i8, i8 addrspace(4)* %1405, align 1, !tbaa !21
  %1407 = zext i8 %1406 to i64
  %1408 = shl nuw i64 %1407, 56
  %1409 = or i64 %1404, %1408
  %1410 = add nsw i32 %1367, -8
  %1411 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 8
  br label %1425

1412:                                             ; preds = %1370, %1412
  %1413 = phi i32 [ %1423, %1412 ], [ 0, %1370 ]
  %1414 = phi i64 [ %1422, %1412 ], [ 0, %1370 ]
  %1415 = zext i32 %1413 to i64
  %1416 = getelementptr inbounds i8, i8 addrspace(4)* %1366, i64 %1415
  %1417 = load i8, i8 addrspace(4)* %1416, align 1, !tbaa !21
  %1418 = zext i8 %1417 to i64
  %1419 = shl i32 %1413, 3
  %1420 = zext i32 %1419 to i64
  %1421 = shl nuw i64 %1418, %1420
  %1422 = or i64 %1421, %1414
  %1423 = add nuw nsw i32 %1413, 1
  %1424 = icmp eq i32 %1423, %1367
  br i1 %1424, label %1425, label %1412

1425:                                             ; preds = %1412, %1372, %1370
  %1426 = phi i8 addrspace(4)* [ %1411, %1372 ], [ %1366, %1370 ], [ %1366, %1412 ]
  %1427 = phi i32 [ %1410, %1372 ], [ 0, %1370 ], [ 0, %1412 ]
  %1428 = phi i64 [ %1409, %1372 ], [ 0, %1370 ], [ %1422, %1412 ]
  %1429 = icmp ugt i32 %1427, 7
  br i1 %1429, label %1432, label %1430

1430:                                             ; preds = %1425
  %1431 = icmp eq i32 %1427, 0
  br i1 %1431, label %1483, label %1470

1432:                                             ; preds = %1425
  %1433 = load i8, i8 addrspace(4)* %1426, align 1, !tbaa !21
  %1434 = zext i8 %1433 to i64
  %1435 = getelementptr inbounds i8, i8 addrspace(4)* %1426, i64 1
  %1436 = load i8, i8 addrspace(4)* %1435, align 1, !tbaa !21
  %1437 = zext i8 %1436 to i64
  %1438 = shl nuw nsw i64 %1437, 8
  %1439 = or i64 %1438, %1434
  %1440 = getelementptr inbounds i8, i8 addrspace(4)* %1426, i64 2
  %1441 = load i8, i8 addrspace(4)* %1440, align 1, !tbaa !21
  %1442 = zext i8 %1441 to i64
  %1443 = shl nuw nsw i64 %1442, 16
  %1444 = or i64 %1439, %1443
  %1445 = getelementptr inbounds i8, i8 addrspace(4)* %1426, i64 3
  %1446 = load i8, i8 addrspace(4)* %1445, align 1, !tbaa !21
  %1447 = zext i8 %1446 to i64
  %1448 = shl nuw nsw i64 %1447, 24
  %1449 = or i64 %1444, %1448
  %1450 = getelementptr inbounds i8, i8 addrspace(4)* %1426, i64 4
  %1451 = load i8, i8 addrspace(4)* %1450, align 1, !tbaa !21
  %1452 = zext i8 %1451 to i64
  %1453 = shl nuw nsw i64 %1452, 32
  %1454 = or i64 %1449, %1453
  %1455 = getelementptr inbounds i8, i8 addrspace(4)* %1426, i64 5
  %1456 = load i8, i8 addrspace(4)* %1455, align 1, !tbaa !21
  %1457 = zext i8 %1456 to i64
  %1458 = shl nuw nsw i64 %1457, 40
  %1459 = or i64 %1454, %1458
  %1460 = getelementptr inbounds i8, i8 addrspace(4)* %1426, i64 6
  %1461 = load i8, i8 addrspace(4)* %1460, align 1, !tbaa !21
  %1462 = zext i8 %1461 to i64
  %1463 = shl nuw nsw i64 %1462, 48
  %1464 = or i64 %1459, %1463
  %1465 = getelementptr inbounds i8, i8 addrspace(4)* %1426, i64 7
  %1466 = load i8, i8 addrspace(4)* %1465, align 1, !tbaa !21
  %1467 = zext i8 %1466 to i64
  %1468 = shl nuw i64 %1467, 56
  %1469 = or i64 %1464, %1468
  br label %1483

1470:                                             ; preds = %1430, %1470
  %1471 = phi i32 [ %1481, %1470 ], [ 0, %1430 ]
  %1472 = phi i64 [ %1480, %1470 ], [ 0, %1430 ]
  %1473 = zext i32 %1471 to i64
  %1474 = getelementptr inbounds i8, i8 addrspace(4)* %1426, i64 %1473
  %1475 = load i8, i8 addrspace(4)* %1474, align 1, !tbaa !21
  %1476 = zext i8 %1475 to i64
  %1477 = shl i32 %1471, 3
  %1478 = zext i32 %1477 to i64
  %1479 = shl nuw i64 %1476, %1478
  %1480 = or i64 %1479, %1472
  %1481 = add nuw nsw i32 %1471, 1
  %1482 = icmp eq i32 %1481, %1427
  br i1 %1482, label %1483, label %1470

1483:                                             ; preds = %1470, %1432, %1430
  %1484 = phi i64 [ %1469, %1432 ], [ 0, %1430 ], [ %1480, %1470 ]
  %1485 = shl nuw nsw i64 %1066, 2
  %1486 = add nuw nsw i64 %1485, 28
  %1487 = and i64 %1486, 480
  %1488 = and i64 %1068, -225
  %1489 = or i64 %1488, %1487
  %1490 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %1489, i64 noundef %1128, i64 noundef %1188, i64 noundef %1248, i64 noundef %1308, i64 noundef %1368, i64 noundef %1428, i64 noundef %1484) #11
  %1491 = sub i64 %1058, %1066
  %1492 = getelementptr inbounds i8, i8 addrspace(4)* %1059, i64 %1066
  %1493 = icmp eq i64 %1491, 0
  br i1 %1493, label %1494, label %1057

1494:                                             ; preds = %1483, %1049
  %1495 = phi <2 x i64> [ %1052, %1049 ], [ %1490, %1483 ]
  %1496 = extractelement <2 x i64> %1495, i64 0
  %1497 = zext i32 %10 to i64
  %1498 = and i64 %1496, -225
  %1499 = or i64 %1498, 32
  %1500 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %1499, i64 noundef %1497, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1501 = extractelement <2 x i64> %1500, i64 0
  %1502 = bitcast double %1040 to i64
  %1503 = and i64 %1501, -227
  %1504 = or i64 %1503, 34
  %1505 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %1504, i64 noundef %1502, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1506 = icmp ult i16 %14, 2
  br i1 %1506, label %1530, label %1507

1507:                                             ; preds = %1494
  %1508 = lshr i32 %15, 1
  br label %1509

1509:                                             ; preds = %1507, %1526
  %1510 = phi i32 [ %1527, %1526 ], [ %1508, %1507 ]
  %1511 = icmp ult i32 %10, %1510
  br i1 %1511, label %1512, label %1526

1512:                                             ; preds = %1509
  %1513 = add nsw i32 %1510, %10
  %1514 = getelementptr inbounds [2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache1, i32 0, i32 %1513
  %1515 = load float, float addrspace(3)* %1514, align 4, !tbaa !26
  %1516 = load float, float addrspace(3)* %1037, align 4, !tbaa !26
  %1517 = fadd contract float %1515, %1516
  store float %1517, float addrspace(3)* %1037, align 4, !tbaa !26
  %1518 = getelementptr inbounds [2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache2, i32 0, i32 %1513
  %1519 = load float, float addrspace(3)* %1518, align 4, !tbaa !26
  %1520 = load float, float addrspace(3)* %1038, align 4, !tbaa !26
  %1521 = fadd contract float %1519, %1520
  store float %1521, float addrspace(3)* %1038, align 4, !tbaa !26
  %1522 = getelementptr inbounds [2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache3, i32 0, i32 %1513
  %1523 = load float, float addrspace(3)* %1522, align 4, !tbaa !26
  %1524 = load float, float addrspace(3)* %1039, align 4, !tbaa !26
  %1525 = fadd contract float %1523, %1524
  store float %1525, float addrspace(3)* %1039, align 4, !tbaa !26
  br label %1526

1526:                                             ; preds = %1512, %1509
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1527 = sdiv i32 %1510, 2
  %1528 = add nsw i32 %1510, 1
  %1529 = icmp ult i32 %1528, 3
  br i1 %1529, label %1530, label %1509, !llvm.loop !30

1530:                                             ; preds = %1526, %1494
  %1531 = icmp eq i32 %10, 0
  br i1 %1531, label %1532, label %2479

1532:                                             ; preds = %1530
  %1533 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache1, i32 0, i32 0), align 4, !tbaa !26
  %1534 = fpext float %1533 to double
  %1535 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache2, i32 0, i32 0), align 4, !tbaa !26
  %1536 = fpext float %1535 to double
  %1537 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache3, i32 0, i32 0), align 4, !tbaa !26
  %1538 = fpext float %1537 to double
  %1539 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1540 = extractelement <2 x i64> %1539, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([45 x i8], [45 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %1541, label %1545

1541:                                             ; preds = %1532
  %1542 = and i64 %1540, -225
  %1543 = or i64 %1542, 32
  %1544 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %1543, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1986

1545:                                             ; preds = %1532
  %1546 = and i64 %1540, 2
  %1547 = and i64 %1540, -3
  %1548 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1547, i64 0
  br label %1549

1549:                                             ; preds = %1975, %1545
  %1550 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([45 x i8], [45 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([45 x i8], [45 x i8] addrspace(4)* @.str.3, i64 0, i64 44) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([45 x i8]* addrspacecast ([45 x i8] addrspace(4)* @.str.3 to [45 x i8]*) to i64)), i64 1))), %1545 ], [ %1983, %1975 ]
  %1551 = phi i8 addrspace(4)* [ getelementptr inbounds ([45 x i8], [45 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %1545 ], [ %1984, %1975 ]
  %1552 = phi <2 x i64> [ %1548, %1545 ], [ %1982, %1975 ]
  %1553 = icmp ugt i64 %1550, 56
  %1554 = extractelement <2 x i64> %1552, i64 0
  %1555 = or i64 %1554, %1546
  %1556 = insertelement <2 x i64> poison, i64 %1555, i64 0
  %1557 = select i1 %1553, <2 x i64> %1552, <2 x i64> %1556
  %1558 = tail call i64 @llvm.umin.i64(i64 %1550, i64 56)
  %1559 = trunc i64 %1558 to i32
  %1560 = extractelement <2 x i64> %1557, i64 0
  %1561 = icmp ugt i32 %1559, 7
  br i1 %1561, label %1564, label %1562

1562:                                             ; preds = %1549
  %1563 = icmp eq i32 %1559, 0
  br i1 %1563, label %1617, label %1604

1564:                                             ; preds = %1549
  %1565 = load i8, i8 addrspace(4)* %1551, align 1, !tbaa !21
  %1566 = zext i8 %1565 to i64
  %1567 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 1
  %1568 = load i8, i8 addrspace(4)* %1567, align 1, !tbaa !21
  %1569 = zext i8 %1568 to i64
  %1570 = shl nuw nsw i64 %1569, 8
  %1571 = or i64 %1570, %1566
  %1572 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 2
  %1573 = load i8, i8 addrspace(4)* %1572, align 1, !tbaa !21
  %1574 = zext i8 %1573 to i64
  %1575 = shl nuw nsw i64 %1574, 16
  %1576 = or i64 %1571, %1575
  %1577 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 3
  %1578 = load i8, i8 addrspace(4)* %1577, align 1, !tbaa !21
  %1579 = zext i8 %1578 to i64
  %1580 = shl nuw nsw i64 %1579, 24
  %1581 = or i64 %1576, %1580
  %1582 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 4
  %1583 = load i8, i8 addrspace(4)* %1582, align 1, !tbaa !21
  %1584 = zext i8 %1583 to i64
  %1585 = shl nuw nsw i64 %1584, 32
  %1586 = or i64 %1581, %1585
  %1587 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 5
  %1588 = load i8, i8 addrspace(4)* %1587, align 1, !tbaa !21
  %1589 = zext i8 %1588 to i64
  %1590 = shl nuw nsw i64 %1589, 40
  %1591 = or i64 %1586, %1590
  %1592 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 6
  %1593 = load i8, i8 addrspace(4)* %1592, align 1, !tbaa !21
  %1594 = zext i8 %1593 to i64
  %1595 = shl nuw nsw i64 %1594, 48
  %1596 = or i64 %1591, %1595
  %1597 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 7
  %1598 = load i8, i8 addrspace(4)* %1597, align 1, !tbaa !21
  %1599 = zext i8 %1598 to i64
  %1600 = shl nuw i64 %1599, 56
  %1601 = or i64 %1596, %1600
  %1602 = add nsw i32 %1559, -8
  %1603 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 8
  br label %1617

1604:                                             ; preds = %1562, %1604
  %1605 = phi i32 [ %1615, %1604 ], [ 0, %1562 ]
  %1606 = phi i64 [ %1614, %1604 ], [ 0, %1562 ]
  %1607 = zext i32 %1605 to i64
  %1608 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 %1607
  %1609 = load i8, i8 addrspace(4)* %1608, align 1, !tbaa !21
  %1610 = zext i8 %1609 to i64
  %1611 = shl i32 %1605, 3
  %1612 = zext i32 %1611 to i64
  %1613 = shl nuw i64 %1610, %1612
  %1614 = or i64 %1613, %1606
  %1615 = add nuw nsw i32 %1605, 1
  %1616 = icmp eq i32 %1615, %1559
  br i1 %1616, label %1617, label %1604, !llvm.loop !22

1617:                                             ; preds = %1604, %1564, %1562
  %1618 = phi i8 addrspace(4)* [ %1603, %1564 ], [ %1551, %1562 ], [ %1551, %1604 ]
  %1619 = phi i32 [ %1602, %1564 ], [ 0, %1562 ], [ 0, %1604 ]
  %1620 = phi i64 [ %1601, %1564 ], [ 0, %1562 ], [ %1614, %1604 ]
  %1621 = icmp ugt i32 %1619, 7
  br i1 %1621, label %1624, label %1622

1622:                                             ; preds = %1617
  %1623 = icmp eq i32 %1619, 0
  br i1 %1623, label %1677, label %1664

1624:                                             ; preds = %1617
  %1625 = load i8, i8 addrspace(4)* %1618, align 1, !tbaa !21
  %1626 = zext i8 %1625 to i64
  %1627 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 1
  %1628 = load i8, i8 addrspace(4)* %1627, align 1, !tbaa !21
  %1629 = zext i8 %1628 to i64
  %1630 = shl nuw nsw i64 %1629, 8
  %1631 = or i64 %1630, %1626
  %1632 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 2
  %1633 = load i8, i8 addrspace(4)* %1632, align 1, !tbaa !21
  %1634 = zext i8 %1633 to i64
  %1635 = shl nuw nsw i64 %1634, 16
  %1636 = or i64 %1631, %1635
  %1637 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 3
  %1638 = load i8, i8 addrspace(4)* %1637, align 1, !tbaa !21
  %1639 = zext i8 %1638 to i64
  %1640 = shl nuw nsw i64 %1639, 24
  %1641 = or i64 %1636, %1640
  %1642 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 4
  %1643 = load i8, i8 addrspace(4)* %1642, align 1, !tbaa !21
  %1644 = zext i8 %1643 to i64
  %1645 = shl nuw nsw i64 %1644, 32
  %1646 = or i64 %1641, %1645
  %1647 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 5
  %1648 = load i8, i8 addrspace(4)* %1647, align 1, !tbaa !21
  %1649 = zext i8 %1648 to i64
  %1650 = shl nuw nsw i64 %1649, 40
  %1651 = or i64 %1646, %1650
  %1652 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 6
  %1653 = load i8, i8 addrspace(4)* %1652, align 1, !tbaa !21
  %1654 = zext i8 %1653 to i64
  %1655 = shl nuw nsw i64 %1654, 48
  %1656 = or i64 %1651, %1655
  %1657 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 7
  %1658 = load i8, i8 addrspace(4)* %1657, align 1, !tbaa !21
  %1659 = zext i8 %1658 to i64
  %1660 = shl nuw i64 %1659, 56
  %1661 = or i64 %1656, %1660
  %1662 = add nsw i32 %1619, -8
  %1663 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 8
  br label %1677

1664:                                             ; preds = %1622, %1664
  %1665 = phi i32 [ %1675, %1664 ], [ 0, %1622 ]
  %1666 = phi i64 [ %1674, %1664 ], [ 0, %1622 ]
  %1667 = zext i32 %1665 to i64
  %1668 = getelementptr inbounds i8, i8 addrspace(4)* %1618, i64 %1667
  %1669 = load i8, i8 addrspace(4)* %1668, align 1, !tbaa !21
  %1670 = zext i8 %1669 to i64
  %1671 = shl i32 %1665, 3
  %1672 = zext i32 %1671 to i64
  %1673 = shl nuw i64 %1670, %1672
  %1674 = or i64 %1673, %1666
  %1675 = add nuw nsw i32 %1665, 1
  %1676 = icmp eq i32 %1675, %1619
  br i1 %1676, label %1677, label %1664

1677:                                             ; preds = %1664, %1624, %1622
  %1678 = phi i8 addrspace(4)* [ %1663, %1624 ], [ %1618, %1622 ], [ %1618, %1664 ]
  %1679 = phi i32 [ %1662, %1624 ], [ 0, %1622 ], [ 0, %1664 ]
  %1680 = phi i64 [ %1661, %1624 ], [ 0, %1622 ], [ %1674, %1664 ]
  %1681 = icmp ugt i32 %1679, 7
  br i1 %1681, label %1684, label %1682

1682:                                             ; preds = %1677
  %1683 = icmp eq i32 %1679, 0
  br i1 %1683, label %1737, label %1724

1684:                                             ; preds = %1677
  %1685 = load i8, i8 addrspace(4)* %1678, align 1, !tbaa !21
  %1686 = zext i8 %1685 to i64
  %1687 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 1
  %1688 = load i8, i8 addrspace(4)* %1687, align 1, !tbaa !21
  %1689 = zext i8 %1688 to i64
  %1690 = shl nuw nsw i64 %1689, 8
  %1691 = or i64 %1690, %1686
  %1692 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 2
  %1693 = load i8, i8 addrspace(4)* %1692, align 1, !tbaa !21
  %1694 = zext i8 %1693 to i64
  %1695 = shl nuw nsw i64 %1694, 16
  %1696 = or i64 %1691, %1695
  %1697 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 3
  %1698 = load i8, i8 addrspace(4)* %1697, align 1, !tbaa !21
  %1699 = zext i8 %1698 to i64
  %1700 = shl nuw nsw i64 %1699, 24
  %1701 = or i64 %1696, %1700
  %1702 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 4
  %1703 = load i8, i8 addrspace(4)* %1702, align 1, !tbaa !21
  %1704 = zext i8 %1703 to i64
  %1705 = shl nuw nsw i64 %1704, 32
  %1706 = or i64 %1701, %1705
  %1707 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 5
  %1708 = load i8, i8 addrspace(4)* %1707, align 1, !tbaa !21
  %1709 = zext i8 %1708 to i64
  %1710 = shl nuw nsw i64 %1709, 40
  %1711 = or i64 %1706, %1710
  %1712 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 6
  %1713 = load i8, i8 addrspace(4)* %1712, align 1, !tbaa !21
  %1714 = zext i8 %1713 to i64
  %1715 = shl nuw nsw i64 %1714, 48
  %1716 = or i64 %1711, %1715
  %1717 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 7
  %1718 = load i8, i8 addrspace(4)* %1717, align 1, !tbaa !21
  %1719 = zext i8 %1718 to i64
  %1720 = shl nuw i64 %1719, 56
  %1721 = or i64 %1716, %1720
  %1722 = add nsw i32 %1679, -8
  %1723 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 8
  br label %1737

1724:                                             ; preds = %1682, %1724
  %1725 = phi i32 [ %1735, %1724 ], [ 0, %1682 ]
  %1726 = phi i64 [ %1734, %1724 ], [ 0, %1682 ]
  %1727 = zext i32 %1725 to i64
  %1728 = getelementptr inbounds i8, i8 addrspace(4)* %1678, i64 %1727
  %1729 = load i8, i8 addrspace(4)* %1728, align 1, !tbaa !21
  %1730 = zext i8 %1729 to i64
  %1731 = shl i32 %1725, 3
  %1732 = zext i32 %1731 to i64
  %1733 = shl nuw i64 %1730, %1732
  %1734 = or i64 %1733, %1726
  %1735 = add nuw nsw i32 %1725, 1
  %1736 = icmp eq i32 %1735, %1679
  br i1 %1736, label %1737, label %1724

1737:                                             ; preds = %1724, %1684, %1682
  %1738 = phi i8 addrspace(4)* [ %1723, %1684 ], [ %1678, %1682 ], [ %1678, %1724 ]
  %1739 = phi i32 [ %1722, %1684 ], [ 0, %1682 ], [ 0, %1724 ]
  %1740 = phi i64 [ %1721, %1684 ], [ 0, %1682 ], [ %1734, %1724 ]
  %1741 = icmp ugt i32 %1739, 7
  br i1 %1741, label %1744, label %1742

1742:                                             ; preds = %1737
  %1743 = icmp eq i32 %1739, 0
  br i1 %1743, label %1797, label %1784

1744:                                             ; preds = %1737
  %1745 = load i8, i8 addrspace(4)* %1738, align 1, !tbaa !21
  %1746 = zext i8 %1745 to i64
  %1747 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 1
  %1748 = load i8, i8 addrspace(4)* %1747, align 1, !tbaa !21
  %1749 = zext i8 %1748 to i64
  %1750 = shl nuw nsw i64 %1749, 8
  %1751 = or i64 %1750, %1746
  %1752 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 2
  %1753 = load i8, i8 addrspace(4)* %1752, align 1, !tbaa !21
  %1754 = zext i8 %1753 to i64
  %1755 = shl nuw nsw i64 %1754, 16
  %1756 = or i64 %1751, %1755
  %1757 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 3
  %1758 = load i8, i8 addrspace(4)* %1757, align 1, !tbaa !21
  %1759 = zext i8 %1758 to i64
  %1760 = shl nuw nsw i64 %1759, 24
  %1761 = or i64 %1756, %1760
  %1762 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 4
  %1763 = load i8, i8 addrspace(4)* %1762, align 1, !tbaa !21
  %1764 = zext i8 %1763 to i64
  %1765 = shl nuw nsw i64 %1764, 32
  %1766 = or i64 %1761, %1765
  %1767 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 5
  %1768 = load i8, i8 addrspace(4)* %1767, align 1, !tbaa !21
  %1769 = zext i8 %1768 to i64
  %1770 = shl nuw nsw i64 %1769, 40
  %1771 = or i64 %1766, %1770
  %1772 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 6
  %1773 = load i8, i8 addrspace(4)* %1772, align 1, !tbaa !21
  %1774 = zext i8 %1773 to i64
  %1775 = shl nuw nsw i64 %1774, 48
  %1776 = or i64 %1771, %1775
  %1777 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 7
  %1778 = load i8, i8 addrspace(4)* %1777, align 1, !tbaa !21
  %1779 = zext i8 %1778 to i64
  %1780 = shl nuw i64 %1779, 56
  %1781 = or i64 %1776, %1780
  %1782 = add nsw i32 %1739, -8
  %1783 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 8
  br label %1797

1784:                                             ; preds = %1742, %1784
  %1785 = phi i32 [ %1795, %1784 ], [ 0, %1742 ]
  %1786 = phi i64 [ %1794, %1784 ], [ 0, %1742 ]
  %1787 = zext i32 %1785 to i64
  %1788 = getelementptr inbounds i8, i8 addrspace(4)* %1738, i64 %1787
  %1789 = load i8, i8 addrspace(4)* %1788, align 1, !tbaa !21
  %1790 = zext i8 %1789 to i64
  %1791 = shl i32 %1785, 3
  %1792 = zext i32 %1791 to i64
  %1793 = shl nuw i64 %1790, %1792
  %1794 = or i64 %1793, %1786
  %1795 = add nuw nsw i32 %1785, 1
  %1796 = icmp eq i32 %1795, %1739
  br i1 %1796, label %1797, label %1784

1797:                                             ; preds = %1784, %1744, %1742
  %1798 = phi i8 addrspace(4)* [ %1783, %1744 ], [ %1738, %1742 ], [ %1738, %1784 ]
  %1799 = phi i32 [ %1782, %1744 ], [ 0, %1742 ], [ 0, %1784 ]
  %1800 = phi i64 [ %1781, %1744 ], [ 0, %1742 ], [ %1794, %1784 ]
  %1801 = icmp ugt i32 %1799, 7
  br i1 %1801, label %1804, label %1802

1802:                                             ; preds = %1797
  %1803 = icmp eq i32 %1799, 0
  br i1 %1803, label %1857, label %1844

1804:                                             ; preds = %1797
  %1805 = load i8, i8 addrspace(4)* %1798, align 1, !tbaa !21
  %1806 = zext i8 %1805 to i64
  %1807 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 1
  %1808 = load i8, i8 addrspace(4)* %1807, align 1, !tbaa !21
  %1809 = zext i8 %1808 to i64
  %1810 = shl nuw nsw i64 %1809, 8
  %1811 = or i64 %1810, %1806
  %1812 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 2
  %1813 = load i8, i8 addrspace(4)* %1812, align 1, !tbaa !21
  %1814 = zext i8 %1813 to i64
  %1815 = shl nuw nsw i64 %1814, 16
  %1816 = or i64 %1811, %1815
  %1817 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 3
  %1818 = load i8, i8 addrspace(4)* %1817, align 1, !tbaa !21
  %1819 = zext i8 %1818 to i64
  %1820 = shl nuw nsw i64 %1819, 24
  %1821 = or i64 %1816, %1820
  %1822 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 4
  %1823 = load i8, i8 addrspace(4)* %1822, align 1, !tbaa !21
  %1824 = zext i8 %1823 to i64
  %1825 = shl nuw nsw i64 %1824, 32
  %1826 = or i64 %1821, %1825
  %1827 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 5
  %1828 = load i8, i8 addrspace(4)* %1827, align 1, !tbaa !21
  %1829 = zext i8 %1828 to i64
  %1830 = shl nuw nsw i64 %1829, 40
  %1831 = or i64 %1826, %1830
  %1832 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 6
  %1833 = load i8, i8 addrspace(4)* %1832, align 1, !tbaa !21
  %1834 = zext i8 %1833 to i64
  %1835 = shl nuw nsw i64 %1834, 48
  %1836 = or i64 %1831, %1835
  %1837 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 7
  %1838 = load i8, i8 addrspace(4)* %1837, align 1, !tbaa !21
  %1839 = zext i8 %1838 to i64
  %1840 = shl nuw i64 %1839, 56
  %1841 = or i64 %1836, %1840
  %1842 = add nsw i32 %1799, -8
  %1843 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 8
  br label %1857

1844:                                             ; preds = %1802, %1844
  %1845 = phi i32 [ %1855, %1844 ], [ 0, %1802 ]
  %1846 = phi i64 [ %1854, %1844 ], [ 0, %1802 ]
  %1847 = zext i32 %1845 to i64
  %1848 = getelementptr inbounds i8, i8 addrspace(4)* %1798, i64 %1847
  %1849 = load i8, i8 addrspace(4)* %1848, align 1, !tbaa !21
  %1850 = zext i8 %1849 to i64
  %1851 = shl i32 %1845, 3
  %1852 = zext i32 %1851 to i64
  %1853 = shl nuw i64 %1850, %1852
  %1854 = or i64 %1853, %1846
  %1855 = add nuw nsw i32 %1845, 1
  %1856 = icmp eq i32 %1855, %1799
  br i1 %1856, label %1857, label %1844

1857:                                             ; preds = %1844, %1804, %1802
  %1858 = phi i8 addrspace(4)* [ %1843, %1804 ], [ %1798, %1802 ], [ %1798, %1844 ]
  %1859 = phi i32 [ %1842, %1804 ], [ 0, %1802 ], [ 0, %1844 ]
  %1860 = phi i64 [ %1841, %1804 ], [ 0, %1802 ], [ %1854, %1844 ]
  %1861 = icmp ugt i32 %1859, 7
  br i1 %1861, label %1864, label %1862

1862:                                             ; preds = %1857
  %1863 = icmp eq i32 %1859, 0
  br i1 %1863, label %1917, label %1904

1864:                                             ; preds = %1857
  %1865 = load i8, i8 addrspace(4)* %1858, align 1, !tbaa !21
  %1866 = zext i8 %1865 to i64
  %1867 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 1
  %1868 = load i8, i8 addrspace(4)* %1867, align 1, !tbaa !21
  %1869 = zext i8 %1868 to i64
  %1870 = shl nuw nsw i64 %1869, 8
  %1871 = or i64 %1870, %1866
  %1872 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 2
  %1873 = load i8, i8 addrspace(4)* %1872, align 1, !tbaa !21
  %1874 = zext i8 %1873 to i64
  %1875 = shl nuw nsw i64 %1874, 16
  %1876 = or i64 %1871, %1875
  %1877 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 3
  %1878 = load i8, i8 addrspace(4)* %1877, align 1, !tbaa !21
  %1879 = zext i8 %1878 to i64
  %1880 = shl nuw nsw i64 %1879, 24
  %1881 = or i64 %1876, %1880
  %1882 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 4
  %1883 = load i8, i8 addrspace(4)* %1882, align 1, !tbaa !21
  %1884 = zext i8 %1883 to i64
  %1885 = shl nuw nsw i64 %1884, 32
  %1886 = or i64 %1881, %1885
  %1887 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 5
  %1888 = load i8, i8 addrspace(4)* %1887, align 1, !tbaa !21
  %1889 = zext i8 %1888 to i64
  %1890 = shl nuw nsw i64 %1889, 40
  %1891 = or i64 %1886, %1890
  %1892 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 6
  %1893 = load i8, i8 addrspace(4)* %1892, align 1, !tbaa !21
  %1894 = zext i8 %1893 to i64
  %1895 = shl nuw nsw i64 %1894, 48
  %1896 = or i64 %1891, %1895
  %1897 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 7
  %1898 = load i8, i8 addrspace(4)* %1897, align 1, !tbaa !21
  %1899 = zext i8 %1898 to i64
  %1900 = shl nuw i64 %1899, 56
  %1901 = or i64 %1896, %1900
  %1902 = add nsw i32 %1859, -8
  %1903 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 8
  br label %1917

1904:                                             ; preds = %1862, %1904
  %1905 = phi i32 [ %1915, %1904 ], [ 0, %1862 ]
  %1906 = phi i64 [ %1914, %1904 ], [ 0, %1862 ]
  %1907 = zext i32 %1905 to i64
  %1908 = getelementptr inbounds i8, i8 addrspace(4)* %1858, i64 %1907
  %1909 = load i8, i8 addrspace(4)* %1908, align 1, !tbaa !21
  %1910 = zext i8 %1909 to i64
  %1911 = shl i32 %1905, 3
  %1912 = zext i32 %1911 to i64
  %1913 = shl nuw i64 %1910, %1912
  %1914 = or i64 %1913, %1906
  %1915 = add nuw nsw i32 %1905, 1
  %1916 = icmp eq i32 %1915, %1859
  br i1 %1916, label %1917, label %1904

1917:                                             ; preds = %1904, %1864, %1862
  %1918 = phi i8 addrspace(4)* [ %1903, %1864 ], [ %1858, %1862 ], [ %1858, %1904 ]
  %1919 = phi i32 [ %1902, %1864 ], [ 0, %1862 ], [ 0, %1904 ]
  %1920 = phi i64 [ %1901, %1864 ], [ 0, %1862 ], [ %1914, %1904 ]
  %1921 = icmp ugt i32 %1919, 7
  br i1 %1921, label %1924, label %1922

1922:                                             ; preds = %1917
  %1923 = icmp eq i32 %1919, 0
  br i1 %1923, label %1975, label %1962

1924:                                             ; preds = %1917
  %1925 = load i8, i8 addrspace(4)* %1918, align 1, !tbaa !21
  %1926 = zext i8 %1925 to i64
  %1927 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 1
  %1928 = load i8, i8 addrspace(4)* %1927, align 1, !tbaa !21
  %1929 = zext i8 %1928 to i64
  %1930 = shl nuw nsw i64 %1929, 8
  %1931 = or i64 %1930, %1926
  %1932 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 2
  %1933 = load i8, i8 addrspace(4)* %1932, align 1, !tbaa !21
  %1934 = zext i8 %1933 to i64
  %1935 = shl nuw nsw i64 %1934, 16
  %1936 = or i64 %1931, %1935
  %1937 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 3
  %1938 = load i8, i8 addrspace(4)* %1937, align 1, !tbaa !21
  %1939 = zext i8 %1938 to i64
  %1940 = shl nuw nsw i64 %1939, 24
  %1941 = or i64 %1936, %1940
  %1942 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 4
  %1943 = load i8, i8 addrspace(4)* %1942, align 1, !tbaa !21
  %1944 = zext i8 %1943 to i64
  %1945 = shl nuw nsw i64 %1944, 32
  %1946 = or i64 %1941, %1945
  %1947 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 5
  %1948 = load i8, i8 addrspace(4)* %1947, align 1, !tbaa !21
  %1949 = zext i8 %1948 to i64
  %1950 = shl nuw nsw i64 %1949, 40
  %1951 = or i64 %1946, %1950
  %1952 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 6
  %1953 = load i8, i8 addrspace(4)* %1952, align 1, !tbaa !21
  %1954 = zext i8 %1953 to i64
  %1955 = shl nuw nsw i64 %1954, 48
  %1956 = or i64 %1951, %1955
  %1957 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 7
  %1958 = load i8, i8 addrspace(4)* %1957, align 1, !tbaa !21
  %1959 = zext i8 %1958 to i64
  %1960 = shl nuw i64 %1959, 56
  %1961 = or i64 %1956, %1960
  br label %1975

1962:                                             ; preds = %1922, %1962
  %1963 = phi i32 [ %1973, %1962 ], [ 0, %1922 ]
  %1964 = phi i64 [ %1972, %1962 ], [ 0, %1922 ]
  %1965 = zext i32 %1963 to i64
  %1966 = getelementptr inbounds i8, i8 addrspace(4)* %1918, i64 %1965
  %1967 = load i8, i8 addrspace(4)* %1966, align 1, !tbaa !21
  %1968 = zext i8 %1967 to i64
  %1969 = shl i32 %1963, 3
  %1970 = zext i32 %1969 to i64
  %1971 = shl nuw i64 %1968, %1970
  %1972 = or i64 %1971, %1964
  %1973 = add nuw nsw i32 %1963, 1
  %1974 = icmp eq i32 %1973, %1919
  br i1 %1974, label %1975, label %1962

1975:                                             ; preds = %1962, %1924, %1922
  %1976 = phi i64 [ %1961, %1924 ], [ 0, %1922 ], [ %1972, %1962 ]
  %1977 = shl nuw nsw i64 %1558, 2
  %1978 = add nuw nsw i64 %1977, 28
  %1979 = and i64 %1978, 480
  %1980 = and i64 %1560, -225
  %1981 = or i64 %1980, %1979
  %1982 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %1981, i64 noundef %1620, i64 noundef %1680, i64 noundef %1740, i64 noundef %1800, i64 noundef %1860, i64 noundef %1920, i64 noundef %1976) #11
  %1983 = sub i64 %1550, %1558
  %1984 = getelementptr inbounds i8, i8 addrspace(4)* %1551, i64 %1558
  %1985 = icmp eq i64 %1983, 0
  br i1 %1985, label %1986, label %1549

1986:                                             ; preds = %1975, %1541
  %1987 = phi <2 x i64> [ %1544, %1541 ], [ %1982, %1975 ]
  %1988 = extractelement <2 x i64> %1987, i64 0
  %1989 = bitcast double %1534 to i64
  %1990 = and i64 %1988, -225
  %1991 = or i64 %1990, 32
  %1992 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %1991, i64 noundef %1989, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1993 = extractelement <2 x i64> %1992, i64 0
  %1994 = bitcast double %1536 to i64
  %1995 = and i64 %1993, -225
  %1996 = or i64 %1995, 32
  %1997 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %1996, i64 noundef %1994, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1998 = extractelement <2 x i64> %1997, i64 0
  %1999 = bitcast double %1538 to i64
  %2000 = and i64 %1998, -227
  %2001 = or i64 %2000, 34
  %2002 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %2001, i64 noundef %1999, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %2003 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache1, i32 0, i32 0), align 4, !tbaa !26
  %2004 = atomicrmw fadd float addrspace(1)* %5, float %2003 syncscope("agent-one-as") monotonic, align 4
  %2005 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache2, i32 0, i32 0), align 4, !tbaa !26
  %2006 = atomicrmw fadd float addrspace(1)* %6, float %2005 syncscope("agent-one-as") monotonic, align 4
  %2007 = load float, float addrspace(3)* getelementptr inbounds ([2 x float], [2 x float] addrspace(3)* @_ZZ16updateEigenValuePiS_PfS0_S0_S0_S0_S0_iE6cache3, i32 0, i32 0), align 4, !tbaa !26
  %2008 = atomicrmw fadd float addrspace(1)* %7, float %2007 syncscope("agent-one-as") monotonic, align 4
  %2009 = load float, float addrspace(1)* %5, align 4, !tbaa !26
  %2010 = fpext float %2009 to double
  %2011 = load float, float addrspace(1)* %6, align 4, !tbaa !26
  %2012 = fpext float %2011 to double
  %2013 = load float, float addrspace(1)* %7, align 4, !tbaa !26
  %2014 = fpext float %2013 to double
  %2015 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %2016 = extractelement <2 x i64> %2015, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([37 x i8], [37 x i8] addrspace(4)* @.str.4, i64 0, i64 0) to i8*), i8* null), label %2017, label %2021

2017:                                             ; preds = %1986
  %2018 = and i64 %2016, -225
  %2019 = or i64 %2018, 32
  %2020 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %2019, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %2462

2021:                                             ; preds = %1986
  %2022 = and i64 %2016, 2
  %2023 = and i64 %2016, -3
  %2024 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %2023, i64 0
  br label %2025

2025:                                             ; preds = %2451, %2021
  %2026 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([37 x i8], [37 x i8] addrspace(4)* @.str.4, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([37 x i8], [37 x i8] addrspace(4)* @.str.4, i64 0, i64 36) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([37 x i8]* addrspacecast ([37 x i8] addrspace(4)* @.str.4 to [37 x i8]*) to i64)), i64 1))), %2021 ], [ %2459, %2451 ]
  %2027 = phi i8 addrspace(4)* [ getelementptr inbounds ([37 x i8], [37 x i8] addrspace(4)* @.str.4, i64 0, i64 0), %2021 ], [ %2460, %2451 ]
  %2028 = phi <2 x i64> [ %2024, %2021 ], [ %2458, %2451 ]
  %2029 = icmp ugt i64 %2026, 56
  %2030 = extractelement <2 x i64> %2028, i64 0
  %2031 = or i64 %2030, %2022
  %2032 = insertelement <2 x i64> poison, i64 %2031, i64 0
  %2033 = select i1 %2029, <2 x i64> %2028, <2 x i64> %2032
  %2034 = tail call i64 @llvm.umin.i64(i64 %2026, i64 56)
  %2035 = trunc i64 %2034 to i32
  %2036 = extractelement <2 x i64> %2033, i64 0
  %2037 = icmp ugt i32 %2035, 7
  br i1 %2037, label %2040, label %2038

2038:                                             ; preds = %2025
  %2039 = icmp eq i32 %2035, 0
  br i1 %2039, label %2093, label %2080

2040:                                             ; preds = %2025
  %2041 = load i8, i8 addrspace(4)* %2027, align 1, !tbaa !21
  %2042 = zext i8 %2041 to i64
  %2043 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 1
  %2044 = load i8, i8 addrspace(4)* %2043, align 1, !tbaa !21
  %2045 = zext i8 %2044 to i64
  %2046 = shl nuw nsw i64 %2045, 8
  %2047 = or i64 %2046, %2042
  %2048 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 2
  %2049 = load i8, i8 addrspace(4)* %2048, align 1, !tbaa !21
  %2050 = zext i8 %2049 to i64
  %2051 = shl nuw nsw i64 %2050, 16
  %2052 = or i64 %2047, %2051
  %2053 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 3
  %2054 = load i8, i8 addrspace(4)* %2053, align 1, !tbaa !21
  %2055 = zext i8 %2054 to i64
  %2056 = shl nuw nsw i64 %2055, 24
  %2057 = or i64 %2052, %2056
  %2058 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 4
  %2059 = load i8, i8 addrspace(4)* %2058, align 1, !tbaa !21
  %2060 = zext i8 %2059 to i64
  %2061 = shl nuw nsw i64 %2060, 32
  %2062 = or i64 %2057, %2061
  %2063 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 5
  %2064 = load i8, i8 addrspace(4)* %2063, align 1, !tbaa !21
  %2065 = zext i8 %2064 to i64
  %2066 = shl nuw nsw i64 %2065, 40
  %2067 = or i64 %2062, %2066
  %2068 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 6
  %2069 = load i8, i8 addrspace(4)* %2068, align 1, !tbaa !21
  %2070 = zext i8 %2069 to i64
  %2071 = shl nuw nsw i64 %2070, 48
  %2072 = or i64 %2067, %2071
  %2073 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 7
  %2074 = load i8, i8 addrspace(4)* %2073, align 1, !tbaa !21
  %2075 = zext i8 %2074 to i64
  %2076 = shl nuw i64 %2075, 56
  %2077 = or i64 %2072, %2076
  %2078 = add nsw i32 %2035, -8
  %2079 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 8
  br label %2093

2080:                                             ; preds = %2038, %2080
  %2081 = phi i32 [ %2091, %2080 ], [ 0, %2038 ]
  %2082 = phi i64 [ %2090, %2080 ], [ 0, %2038 ]
  %2083 = zext i32 %2081 to i64
  %2084 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 %2083
  %2085 = load i8, i8 addrspace(4)* %2084, align 1, !tbaa !21
  %2086 = zext i8 %2085 to i64
  %2087 = shl i32 %2081, 3
  %2088 = zext i32 %2087 to i64
  %2089 = shl nuw i64 %2086, %2088
  %2090 = or i64 %2089, %2082
  %2091 = add nuw nsw i32 %2081, 1
  %2092 = icmp eq i32 %2091, %2035
  br i1 %2092, label %2093, label %2080, !llvm.loop !22

2093:                                             ; preds = %2080, %2040, %2038
  %2094 = phi i8 addrspace(4)* [ %2079, %2040 ], [ %2027, %2038 ], [ %2027, %2080 ]
  %2095 = phi i32 [ %2078, %2040 ], [ 0, %2038 ], [ 0, %2080 ]
  %2096 = phi i64 [ %2077, %2040 ], [ 0, %2038 ], [ %2090, %2080 ]
  %2097 = icmp ugt i32 %2095, 7
  br i1 %2097, label %2100, label %2098

2098:                                             ; preds = %2093
  %2099 = icmp eq i32 %2095, 0
  br i1 %2099, label %2153, label %2140

2100:                                             ; preds = %2093
  %2101 = load i8, i8 addrspace(4)* %2094, align 1, !tbaa !21
  %2102 = zext i8 %2101 to i64
  %2103 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 1
  %2104 = load i8, i8 addrspace(4)* %2103, align 1, !tbaa !21
  %2105 = zext i8 %2104 to i64
  %2106 = shl nuw nsw i64 %2105, 8
  %2107 = or i64 %2106, %2102
  %2108 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 2
  %2109 = load i8, i8 addrspace(4)* %2108, align 1, !tbaa !21
  %2110 = zext i8 %2109 to i64
  %2111 = shl nuw nsw i64 %2110, 16
  %2112 = or i64 %2107, %2111
  %2113 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 3
  %2114 = load i8, i8 addrspace(4)* %2113, align 1, !tbaa !21
  %2115 = zext i8 %2114 to i64
  %2116 = shl nuw nsw i64 %2115, 24
  %2117 = or i64 %2112, %2116
  %2118 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 4
  %2119 = load i8, i8 addrspace(4)* %2118, align 1, !tbaa !21
  %2120 = zext i8 %2119 to i64
  %2121 = shl nuw nsw i64 %2120, 32
  %2122 = or i64 %2117, %2121
  %2123 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 5
  %2124 = load i8, i8 addrspace(4)* %2123, align 1, !tbaa !21
  %2125 = zext i8 %2124 to i64
  %2126 = shl nuw nsw i64 %2125, 40
  %2127 = or i64 %2122, %2126
  %2128 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 6
  %2129 = load i8, i8 addrspace(4)* %2128, align 1, !tbaa !21
  %2130 = zext i8 %2129 to i64
  %2131 = shl nuw nsw i64 %2130, 48
  %2132 = or i64 %2127, %2131
  %2133 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 7
  %2134 = load i8, i8 addrspace(4)* %2133, align 1, !tbaa !21
  %2135 = zext i8 %2134 to i64
  %2136 = shl nuw i64 %2135, 56
  %2137 = or i64 %2132, %2136
  %2138 = add nsw i32 %2095, -8
  %2139 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 8
  br label %2153

2140:                                             ; preds = %2098, %2140
  %2141 = phi i32 [ %2151, %2140 ], [ 0, %2098 ]
  %2142 = phi i64 [ %2150, %2140 ], [ 0, %2098 ]
  %2143 = zext i32 %2141 to i64
  %2144 = getelementptr inbounds i8, i8 addrspace(4)* %2094, i64 %2143
  %2145 = load i8, i8 addrspace(4)* %2144, align 1, !tbaa !21
  %2146 = zext i8 %2145 to i64
  %2147 = shl i32 %2141, 3
  %2148 = zext i32 %2147 to i64
  %2149 = shl nuw i64 %2146, %2148
  %2150 = or i64 %2149, %2142
  %2151 = add nuw nsw i32 %2141, 1
  %2152 = icmp eq i32 %2151, %2095
  br i1 %2152, label %2153, label %2140

2153:                                             ; preds = %2140, %2100, %2098
  %2154 = phi i8 addrspace(4)* [ %2139, %2100 ], [ %2094, %2098 ], [ %2094, %2140 ]
  %2155 = phi i32 [ %2138, %2100 ], [ 0, %2098 ], [ 0, %2140 ]
  %2156 = phi i64 [ %2137, %2100 ], [ 0, %2098 ], [ %2150, %2140 ]
  %2157 = icmp ugt i32 %2155, 7
  br i1 %2157, label %2160, label %2158

2158:                                             ; preds = %2153
  %2159 = icmp eq i32 %2155, 0
  br i1 %2159, label %2213, label %2200

2160:                                             ; preds = %2153
  %2161 = load i8, i8 addrspace(4)* %2154, align 1, !tbaa !21
  %2162 = zext i8 %2161 to i64
  %2163 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 1
  %2164 = load i8, i8 addrspace(4)* %2163, align 1, !tbaa !21
  %2165 = zext i8 %2164 to i64
  %2166 = shl nuw nsw i64 %2165, 8
  %2167 = or i64 %2166, %2162
  %2168 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 2
  %2169 = load i8, i8 addrspace(4)* %2168, align 1, !tbaa !21
  %2170 = zext i8 %2169 to i64
  %2171 = shl nuw nsw i64 %2170, 16
  %2172 = or i64 %2167, %2171
  %2173 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 3
  %2174 = load i8, i8 addrspace(4)* %2173, align 1, !tbaa !21
  %2175 = zext i8 %2174 to i64
  %2176 = shl nuw nsw i64 %2175, 24
  %2177 = or i64 %2172, %2176
  %2178 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 4
  %2179 = load i8, i8 addrspace(4)* %2178, align 1, !tbaa !21
  %2180 = zext i8 %2179 to i64
  %2181 = shl nuw nsw i64 %2180, 32
  %2182 = or i64 %2177, %2181
  %2183 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 5
  %2184 = load i8, i8 addrspace(4)* %2183, align 1, !tbaa !21
  %2185 = zext i8 %2184 to i64
  %2186 = shl nuw nsw i64 %2185, 40
  %2187 = or i64 %2182, %2186
  %2188 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 6
  %2189 = load i8, i8 addrspace(4)* %2188, align 1, !tbaa !21
  %2190 = zext i8 %2189 to i64
  %2191 = shl nuw nsw i64 %2190, 48
  %2192 = or i64 %2187, %2191
  %2193 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 7
  %2194 = load i8, i8 addrspace(4)* %2193, align 1, !tbaa !21
  %2195 = zext i8 %2194 to i64
  %2196 = shl nuw i64 %2195, 56
  %2197 = or i64 %2192, %2196
  %2198 = add nsw i32 %2155, -8
  %2199 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 8
  br label %2213

2200:                                             ; preds = %2158, %2200
  %2201 = phi i32 [ %2211, %2200 ], [ 0, %2158 ]
  %2202 = phi i64 [ %2210, %2200 ], [ 0, %2158 ]
  %2203 = zext i32 %2201 to i64
  %2204 = getelementptr inbounds i8, i8 addrspace(4)* %2154, i64 %2203
  %2205 = load i8, i8 addrspace(4)* %2204, align 1, !tbaa !21
  %2206 = zext i8 %2205 to i64
  %2207 = shl i32 %2201, 3
  %2208 = zext i32 %2207 to i64
  %2209 = shl nuw i64 %2206, %2208
  %2210 = or i64 %2209, %2202
  %2211 = add nuw nsw i32 %2201, 1
  %2212 = icmp eq i32 %2211, %2155
  br i1 %2212, label %2213, label %2200

2213:                                             ; preds = %2200, %2160, %2158
  %2214 = phi i8 addrspace(4)* [ %2199, %2160 ], [ %2154, %2158 ], [ %2154, %2200 ]
  %2215 = phi i32 [ %2198, %2160 ], [ 0, %2158 ], [ 0, %2200 ]
  %2216 = phi i64 [ %2197, %2160 ], [ 0, %2158 ], [ %2210, %2200 ]
  %2217 = icmp ugt i32 %2215, 7
  br i1 %2217, label %2220, label %2218

2218:                                             ; preds = %2213
  %2219 = icmp eq i32 %2215, 0
  br i1 %2219, label %2273, label %2260

2220:                                             ; preds = %2213
  %2221 = load i8, i8 addrspace(4)* %2214, align 1, !tbaa !21
  %2222 = zext i8 %2221 to i64
  %2223 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 1
  %2224 = load i8, i8 addrspace(4)* %2223, align 1, !tbaa !21
  %2225 = zext i8 %2224 to i64
  %2226 = shl nuw nsw i64 %2225, 8
  %2227 = or i64 %2226, %2222
  %2228 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 2
  %2229 = load i8, i8 addrspace(4)* %2228, align 1, !tbaa !21
  %2230 = zext i8 %2229 to i64
  %2231 = shl nuw nsw i64 %2230, 16
  %2232 = or i64 %2227, %2231
  %2233 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 3
  %2234 = load i8, i8 addrspace(4)* %2233, align 1, !tbaa !21
  %2235 = zext i8 %2234 to i64
  %2236 = shl nuw nsw i64 %2235, 24
  %2237 = or i64 %2232, %2236
  %2238 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 4
  %2239 = load i8, i8 addrspace(4)* %2238, align 1, !tbaa !21
  %2240 = zext i8 %2239 to i64
  %2241 = shl nuw nsw i64 %2240, 32
  %2242 = or i64 %2237, %2241
  %2243 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 5
  %2244 = load i8, i8 addrspace(4)* %2243, align 1, !tbaa !21
  %2245 = zext i8 %2244 to i64
  %2246 = shl nuw nsw i64 %2245, 40
  %2247 = or i64 %2242, %2246
  %2248 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 6
  %2249 = load i8, i8 addrspace(4)* %2248, align 1, !tbaa !21
  %2250 = zext i8 %2249 to i64
  %2251 = shl nuw nsw i64 %2250, 48
  %2252 = or i64 %2247, %2251
  %2253 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 7
  %2254 = load i8, i8 addrspace(4)* %2253, align 1, !tbaa !21
  %2255 = zext i8 %2254 to i64
  %2256 = shl nuw i64 %2255, 56
  %2257 = or i64 %2252, %2256
  %2258 = add nsw i32 %2215, -8
  %2259 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 8
  br label %2273

2260:                                             ; preds = %2218, %2260
  %2261 = phi i32 [ %2271, %2260 ], [ 0, %2218 ]
  %2262 = phi i64 [ %2270, %2260 ], [ 0, %2218 ]
  %2263 = zext i32 %2261 to i64
  %2264 = getelementptr inbounds i8, i8 addrspace(4)* %2214, i64 %2263
  %2265 = load i8, i8 addrspace(4)* %2264, align 1, !tbaa !21
  %2266 = zext i8 %2265 to i64
  %2267 = shl i32 %2261, 3
  %2268 = zext i32 %2267 to i64
  %2269 = shl nuw i64 %2266, %2268
  %2270 = or i64 %2269, %2262
  %2271 = add nuw nsw i32 %2261, 1
  %2272 = icmp eq i32 %2271, %2215
  br i1 %2272, label %2273, label %2260

2273:                                             ; preds = %2260, %2220, %2218
  %2274 = phi i8 addrspace(4)* [ %2259, %2220 ], [ %2214, %2218 ], [ %2214, %2260 ]
  %2275 = phi i32 [ %2258, %2220 ], [ 0, %2218 ], [ 0, %2260 ]
  %2276 = phi i64 [ %2257, %2220 ], [ 0, %2218 ], [ %2270, %2260 ]
  %2277 = icmp ugt i32 %2275, 7
  br i1 %2277, label %2280, label %2278

2278:                                             ; preds = %2273
  %2279 = icmp eq i32 %2275, 0
  br i1 %2279, label %2333, label %2320

2280:                                             ; preds = %2273
  %2281 = load i8, i8 addrspace(4)* %2274, align 1, !tbaa !21
  %2282 = zext i8 %2281 to i64
  %2283 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 1
  %2284 = load i8, i8 addrspace(4)* %2283, align 1, !tbaa !21
  %2285 = zext i8 %2284 to i64
  %2286 = shl nuw nsw i64 %2285, 8
  %2287 = or i64 %2286, %2282
  %2288 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 2
  %2289 = load i8, i8 addrspace(4)* %2288, align 1, !tbaa !21
  %2290 = zext i8 %2289 to i64
  %2291 = shl nuw nsw i64 %2290, 16
  %2292 = or i64 %2287, %2291
  %2293 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 3
  %2294 = load i8, i8 addrspace(4)* %2293, align 1, !tbaa !21
  %2295 = zext i8 %2294 to i64
  %2296 = shl nuw nsw i64 %2295, 24
  %2297 = or i64 %2292, %2296
  %2298 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 4
  %2299 = load i8, i8 addrspace(4)* %2298, align 1, !tbaa !21
  %2300 = zext i8 %2299 to i64
  %2301 = shl nuw nsw i64 %2300, 32
  %2302 = or i64 %2297, %2301
  %2303 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 5
  %2304 = load i8, i8 addrspace(4)* %2303, align 1, !tbaa !21
  %2305 = zext i8 %2304 to i64
  %2306 = shl nuw nsw i64 %2305, 40
  %2307 = or i64 %2302, %2306
  %2308 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 6
  %2309 = load i8, i8 addrspace(4)* %2308, align 1, !tbaa !21
  %2310 = zext i8 %2309 to i64
  %2311 = shl nuw nsw i64 %2310, 48
  %2312 = or i64 %2307, %2311
  %2313 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 7
  %2314 = load i8, i8 addrspace(4)* %2313, align 1, !tbaa !21
  %2315 = zext i8 %2314 to i64
  %2316 = shl nuw i64 %2315, 56
  %2317 = or i64 %2312, %2316
  %2318 = add nsw i32 %2275, -8
  %2319 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 8
  br label %2333

2320:                                             ; preds = %2278, %2320
  %2321 = phi i32 [ %2331, %2320 ], [ 0, %2278 ]
  %2322 = phi i64 [ %2330, %2320 ], [ 0, %2278 ]
  %2323 = zext i32 %2321 to i64
  %2324 = getelementptr inbounds i8, i8 addrspace(4)* %2274, i64 %2323
  %2325 = load i8, i8 addrspace(4)* %2324, align 1, !tbaa !21
  %2326 = zext i8 %2325 to i64
  %2327 = shl i32 %2321, 3
  %2328 = zext i32 %2327 to i64
  %2329 = shl nuw i64 %2326, %2328
  %2330 = or i64 %2329, %2322
  %2331 = add nuw nsw i32 %2321, 1
  %2332 = icmp eq i32 %2331, %2275
  br i1 %2332, label %2333, label %2320

2333:                                             ; preds = %2320, %2280, %2278
  %2334 = phi i8 addrspace(4)* [ %2319, %2280 ], [ %2274, %2278 ], [ %2274, %2320 ]
  %2335 = phi i32 [ %2318, %2280 ], [ 0, %2278 ], [ 0, %2320 ]
  %2336 = phi i64 [ %2317, %2280 ], [ 0, %2278 ], [ %2330, %2320 ]
  %2337 = icmp ugt i32 %2335, 7
  br i1 %2337, label %2340, label %2338

2338:                                             ; preds = %2333
  %2339 = icmp eq i32 %2335, 0
  br i1 %2339, label %2393, label %2380

2340:                                             ; preds = %2333
  %2341 = load i8, i8 addrspace(4)* %2334, align 1, !tbaa !21
  %2342 = zext i8 %2341 to i64
  %2343 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 1
  %2344 = load i8, i8 addrspace(4)* %2343, align 1, !tbaa !21
  %2345 = zext i8 %2344 to i64
  %2346 = shl nuw nsw i64 %2345, 8
  %2347 = or i64 %2346, %2342
  %2348 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 2
  %2349 = load i8, i8 addrspace(4)* %2348, align 1, !tbaa !21
  %2350 = zext i8 %2349 to i64
  %2351 = shl nuw nsw i64 %2350, 16
  %2352 = or i64 %2347, %2351
  %2353 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 3
  %2354 = load i8, i8 addrspace(4)* %2353, align 1, !tbaa !21
  %2355 = zext i8 %2354 to i64
  %2356 = shl nuw nsw i64 %2355, 24
  %2357 = or i64 %2352, %2356
  %2358 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 4
  %2359 = load i8, i8 addrspace(4)* %2358, align 1, !tbaa !21
  %2360 = zext i8 %2359 to i64
  %2361 = shl nuw nsw i64 %2360, 32
  %2362 = or i64 %2357, %2361
  %2363 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 5
  %2364 = load i8, i8 addrspace(4)* %2363, align 1, !tbaa !21
  %2365 = zext i8 %2364 to i64
  %2366 = shl nuw nsw i64 %2365, 40
  %2367 = or i64 %2362, %2366
  %2368 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 6
  %2369 = load i8, i8 addrspace(4)* %2368, align 1, !tbaa !21
  %2370 = zext i8 %2369 to i64
  %2371 = shl nuw nsw i64 %2370, 48
  %2372 = or i64 %2367, %2371
  %2373 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 7
  %2374 = load i8, i8 addrspace(4)* %2373, align 1, !tbaa !21
  %2375 = zext i8 %2374 to i64
  %2376 = shl nuw i64 %2375, 56
  %2377 = or i64 %2372, %2376
  %2378 = add nsw i32 %2335, -8
  %2379 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 8
  br label %2393

2380:                                             ; preds = %2338, %2380
  %2381 = phi i32 [ %2391, %2380 ], [ 0, %2338 ]
  %2382 = phi i64 [ %2390, %2380 ], [ 0, %2338 ]
  %2383 = zext i32 %2381 to i64
  %2384 = getelementptr inbounds i8, i8 addrspace(4)* %2334, i64 %2383
  %2385 = load i8, i8 addrspace(4)* %2384, align 1, !tbaa !21
  %2386 = zext i8 %2385 to i64
  %2387 = shl i32 %2381, 3
  %2388 = zext i32 %2387 to i64
  %2389 = shl nuw i64 %2386, %2388
  %2390 = or i64 %2389, %2382
  %2391 = add nuw nsw i32 %2381, 1
  %2392 = icmp eq i32 %2391, %2335
  br i1 %2392, label %2393, label %2380

2393:                                             ; preds = %2380, %2340, %2338
  %2394 = phi i8 addrspace(4)* [ %2379, %2340 ], [ %2334, %2338 ], [ %2334, %2380 ]
  %2395 = phi i32 [ %2378, %2340 ], [ 0, %2338 ], [ 0, %2380 ]
  %2396 = phi i64 [ %2377, %2340 ], [ 0, %2338 ], [ %2390, %2380 ]
  %2397 = icmp ugt i32 %2395, 7
  br i1 %2397, label %2400, label %2398

2398:                                             ; preds = %2393
  %2399 = icmp eq i32 %2395, 0
  br i1 %2399, label %2451, label %2438

2400:                                             ; preds = %2393
  %2401 = load i8, i8 addrspace(4)* %2394, align 1, !tbaa !21
  %2402 = zext i8 %2401 to i64
  %2403 = getelementptr inbounds i8, i8 addrspace(4)* %2394, i64 1
  %2404 = load i8, i8 addrspace(4)* %2403, align 1, !tbaa !21
  %2405 = zext i8 %2404 to i64
  %2406 = shl nuw nsw i64 %2405, 8
  %2407 = or i64 %2406, %2402
  %2408 = getelementptr inbounds i8, i8 addrspace(4)* %2394, i64 2
  %2409 = load i8, i8 addrspace(4)* %2408, align 1, !tbaa !21
  %2410 = zext i8 %2409 to i64
  %2411 = shl nuw nsw i64 %2410, 16
  %2412 = or i64 %2407, %2411
  %2413 = getelementptr inbounds i8, i8 addrspace(4)* %2394, i64 3
  %2414 = load i8, i8 addrspace(4)* %2413, align 1, !tbaa !21
  %2415 = zext i8 %2414 to i64
  %2416 = shl nuw nsw i64 %2415, 24
  %2417 = or i64 %2412, %2416
  %2418 = getelementptr inbounds i8, i8 addrspace(4)* %2394, i64 4
  %2419 = load i8, i8 addrspace(4)* %2418, align 1, !tbaa !21
  %2420 = zext i8 %2419 to i64
  %2421 = shl nuw nsw i64 %2420, 32
  %2422 = or i64 %2417, %2421
  %2423 = getelementptr inbounds i8, i8 addrspace(4)* %2394, i64 5
  %2424 = load i8, i8 addrspace(4)* %2423, align 1, !tbaa !21
  %2425 = zext i8 %2424 to i64
  %2426 = shl nuw nsw i64 %2425, 40
  %2427 = or i64 %2422, %2426
  %2428 = getelementptr inbounds i8, i8 addrspace(4)* %2394, i64 6
  %2429 = load i8, i8 addrspace(4)* %2428, align 1, !tbaa !21
  %2430 = zext i8 %2429 to i64
  %2431 = shl nuw nsw i64 %2430, 48
  %2432 = or i64 %2427, %2431
  %2433 = getelementptr inbounds i8, i8 addrspace(4)* %2394, i64 7
  %2434 = load i8, i8 addrspace(4)* %2433, align 1, !tbaa !21
  %2435 = zext i8 %2434 to i64
  %2436 = shl nuw i64 %2435, 56
  %2437 = or i64 %2432, %2436
  br label %2451

2438:                                             ; preds = %2398, %2438
  %2439 = phi i32 [ %2449, %2438 ], [ 0, %2398 ]
  %2440 = phi i64 [ %2448, %2438 ], [ 0, %2398 ]
  %2441 = zext i32 %2439 to i64
  %2442 = getelementptr inbounds i8, i8 addrspace(4)* %2394, i64 %2441
  %2443 = load i8, i8 addrspace(4)* %2442, align 1, !tbaa !21
  %2444 = zext i8 %2443 to i64
  %2445 = shl i32 %2439, 3
  %2446 = zext i32 %2445 to i64
  %2447 = shl nuw i64 %2444, %2446
  %2448 = or i64 %2447, %2440
  %2449 = add nuw nsw i32 %2439, 1
  %2450 = icmp eq i32 %2449, %2395
  br i1 %2450, label %2451, label %2438

2451:                                             ; preds = %2438, %2400, %2398
  %2452 = phi i64 [ %2437, %2400 ], [ 0, %2398 ], [ %2448, %2438 ]
  %2453 = shl nuw nsw i64 %2034, 2
  %2454 = add nuw nsw i64 %2453, 28
  %2455 = and i64 %2454, 480
  %2456 = and i64 %2036, -225
  %2457 = or i64 %2456, %2455
  %2458 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %2457, i64 noundef %2096, i64 noundef %2156, i64 noundef %2216, i64 noundef %2276, i64 noundef %2336, i64 noundef %2396, i64 noundef %2452) #11
  %2459 = sub i64 %2026, %2034
  %2460 = getelementptr inbounds i8, i8 addrspace(4)* %2027, i64 %2034
  %2461 = icmp eq i64 %2459, 0
  br i1 %2461, label %2462, label %2025

2462:                                             ; preds = %2451, %2017
  %2463 = phi <2 x i64> [ %2020, %2017 ], [ %2458, %2451 ]
  %2464 = extractelement <2 x i64> %2463, i64 0
  %2465 = bitcast double %2010 to i64
  %2466 = and i64 %2464, -225
  %2467 = or i64 %2466, 32
  %2468 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %2467, i64 noundef %2465, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %2469 = extractelement <2 x i64> %2468, i64 0
  %2470 = bitcast double %2012 to i64
  %2471 = and i64 %2469, -225
  %2472 = or i64 %2471, 32
  %2473 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %2472, i64 noundef %2470, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %2474 = extractelement <2 x i64> %2473, i64 0
  %2475 = bitcast double %2014 to i64
  %2476 = and i64 %2474, -227
  %2477 = or i64 %2476, 34
  %2478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1046, i64 noundef %2477, i64 noundef %2475, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %2479

2479:                                             ; preds = %2462, %1530
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !31
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !32
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !16
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !16
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !16
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !16
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !16
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !16
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !16
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !16
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !32
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !32
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !33
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !32
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !32
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !32
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !31
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !31
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !31
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !32
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !32
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !34
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !36
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !34
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !36
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !16
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !31
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !34
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !36
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !31
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !31
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !37
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !36
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !31
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !31
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !31
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !32
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !16
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !16
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !16
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !16
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !16
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !16
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !16
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !16
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !32
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !32
  %110 = call i64 @llvm.read_register.i64(metadata !38) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !39
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !41
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !42
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !16
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !16
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !16
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !16
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !16
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !16
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !16
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !16
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !31
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !32
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !32
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !34
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !36
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !43
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !43
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !44
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !46
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !31
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !31
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !32
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !32
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !16
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !16
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !21
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !31
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !32
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !32
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !36
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !34
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !43
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !43
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !21
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!13, !13, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!10, !10, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = !{!27, !27, i64 0}
!27 = !{!"float", !19, i64 0}
!28 = distinct !{!28, !25}
!29 = distinct !{!29, !25}
!30 = distinct !{!30, !25}
!31 = !{!14, !14, i64 0}
!32 = !{!12, !12, i64 0}
!33 = !{i64 2662}
!34 = !{!35, !14, i64 0}
!35 = !{!"", !14, i64 0, !14, i64 8, !15, i64 16, !13, i64 24, !13, i64 32, !13, i64 40}
!36 = !{!35, !13, i64 40}
!37 = !{!35, !14, i64 8}
!38 = !{!"exec"}
!39 = !{!40, !12, i64 16}
!40 = !{!"", !13, i64 0, !13, i64 8, !12, i64 16, !12, i64 20}
!41 = !{!40, !13, i64 8}
!42 = !{!40, !12, i64 20}
!43 = !{!40, !13, i64 0}
!44 = !{!45, !13, i64 16}
!45 = !{!"amd_signal_s", !13, i64 0, !10, i64 8, !13, i64 16, !12, i64 24, !12, i64 28, !13, i64 32, !13, i64 40, !10, i64 48, !10, i64 56}
!46 = !{!45, !12, i64 24}
