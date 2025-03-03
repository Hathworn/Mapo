; ModuleID = '../data/hip_kernels/16057/10/main.cu'
source_filename = "../data/hip_kernels/16057/10/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [13 x i8] c"contrast %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z18calculate_contrastPfS_Piifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float %4, i32 %5) local_unnamed_addr #1 {
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
  %26 = mul nsw i32 %3, %3
  %27 = icmp ult i32 %25, %26
  br i1 %27, label %28, label %524

28:                                               ; preds = %6
  %29 = icmp ult i32 %25, %5
  br i1 %29, label %30, label %39

30:                                               ; preds = %28
  %31 = zext i32 %25 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !11, !amdgpu.noclobber !6
  %36 = sitofp i32 %35 to float
  %37 = fmul contract float %33, %36
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  store float %37, float addrspace(1)* %38, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %39

39:                                               ; preds = %30, %28
  %40 = icmp sgt i32 %3, 1
  br i1 %40, label %41, label %44

41:                                               ; preds = %39
  %42 = zext i32 %25 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  br label %46

44:                                               ; preds = %59, %39
  %45 = icmp eq i32 %25, 0
  br i1 %45, label %61, label %524

46:                                               ; preds = %41, %59
  %47 = phi i32 [ 1, %41 ], [ %48, %59 ]
  %48 = shl nsw i32 %47, 1
  %49 = add i32 %48, 1023
  %50 = and i32 %49, %7
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %59

52:                                               ; preds = %46
  %53 = add i32 %47, %25
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %58 = fadd contract float %56, %57
  store float %58, float addrspace(1)* %43, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %52, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = icmp slt i32 %48, %3
  br i1 %60, label %46, label %44, !llvm.loop !13

61:                                               ; preds = %44
  %62 = load float, float addrspace(1)* %1, align 4, !tbaa !7
  %63 = fpext float %62 to double
  %64 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %64, i64 24
  %66 = bitcast i8 addrspace(4)* %65 to i64 addrspace(4)*
  %67 = load i64, i64 addrspace(4)* %66, align 8, !tbaa !15
  %68 = inttoptr i64 %67 to i8 addrspace(1)*
  %69 = addrspacecast i8 addrspace(1)* %68 to i8*
  %70 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %69, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %71 = extractelement <2 x i64> %70, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %72, label %76

72:                                               ; preds = %61
  %73 = and i64 %71, -225
  %74 = or i64 %73, 32
  %75 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %69, i64 noundef %74, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %517

76:                                               ; preds = %61
  %77 = and i64 %71, 2
  %78 = and i64 %71, -3
  %79 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %78, i64 0
  br label %80

80:                                               ; preds = %506, %76
  %81 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str, i64 0, i64 12) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([13 x i8]* addrspacecast ([13 x i8] addrspace(4)* @.str to [13 x i8]*) to i64)), i64 1))), %76 ], [ %514, %506 ]
  %82 = phi i8 addrspace(4)* [ getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str, i64 0, i64 0), %76 ], [ %515, %506 ]
  %83 = phi <2 x i64> [ %79, %76 ], [ %513, %506 ]
  %84 = icmp ugt i64 %81, 56
  %85 = extractelement <2 x i64> %83, i64 0
  %86 = or i64 %85, %77
  %87 = insertelement <2 x i64> poison, i64 %86, i64 0
  %88 = select i1 %84, <2 x i64> %83, <2 x i64> %87
  %89 = tail call i64 @llvm.umin.i64(i64 %81, i64 56)
  %90 = trunc i64 %89 to i32
  %91 = extractelement <2 x i64> %88, i64 0
  %92 = icmp ugt i32 %90, 7
  br i1 %92, label %95, label %93

93:                                               ; preds = %80
  %94 = icmp eq i32 %90, 0
  br i1 %94, label %148, label %135

95:                                               ; preds = %80
  %96 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !19
  %97 = zext i8 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 1
  %99 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !19
  %100 = zext i8 %99 to i64
  %101 = shl nuw nsw i64 %100, 8
  %102 = or i64 %101, %97
  %103 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 2
  %104 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !19
  %105 = zext i8 %104 to i64
  %106 = shl nuw nsw i64 %105, 16
  %107 = or i64 %102, %106
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 3
  %109 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !19
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 24
  %112 = or i64 %107, %111
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 4
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !19
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 32
  %117 = or i64 %112, %116
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 5
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !19
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 40
  %122 = or i64 %117, %121
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 6
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !19
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 48
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 7
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !19
  %130 = zext i8 %129 to i64
  %131 = shl nuw i64 %130, 56
  %132 = or i64 %127, %131
  %133 = add nsw i32 %90, -8
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 8
  br label %148

135:                                              ; preds = %93, %135
  %136 = phi i32 [ %146, %135 ], [ 0, %93 ]
  %137 = phi i64 [ %145, %135 ], [ 0, %93 ]
  %138 = zext i32 %136 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 %138
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !19
  %141 = zext i8 %140 to i64
  %142 = shl i32 %136, 3
  %143 = zext i32 %142 to i64
  %144 = shl nuw i64 %141, %143
  %145 = or i64 %144, %137
  %146 = add nuw nsw i32 %136, 1
  %147 = icmp eq i32 %146, %90
  br i1 %147, label %148, label %135, !llvm.loop !20

148:                                              ; preds = %135, %95, %93
  %149 = phi i8 addrspace(4)* [ %134, %95 ], [ %82, %93 ], [ %82, %135 ]
  %150 = phi i32 [ %133, %95 ], [ 0, %93 ], [ 0, %135 ]
  %151 = phi i64 [ %132, %95 ], [ 0, %93 ], [ %145, %135 ]
  %152 = icmp ugt i32 %150, 7
  br i1 %152, label %155, label %153

153:                                              ; preds = %148
  %154 = icmp eq i32 %150, 0
  br i1 %154, label %208, label %195

155:                                              ; preds = %148
  %156 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !19
  %157 = zext i8 %156 to i64
  %158 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 1
  %159 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !19
  %160 = zext i8 %159 to i64
  %161 = shl nuw nsw i64 %160, 8
  %162 = or i64 %161, %157
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 2
  %164 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !19
  %165 = zext i8 %164 to i64
  %166 = shl nuw nsw i64 %165, 16
  %167 = or i64 %162, %166
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 3
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !19
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 24
  %172 = or i64 %167, %171
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 4
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !19
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 32
  %177 = or i64 %172, %176
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 5
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !19
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 40
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 6
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !19
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 48
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 7
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !19
  %190 = zext i8 %189 to i64
  %191 = shl nuw i64 %190, 56
  %192 = or i64 %187, %191
  %193 = add nsw i32 %150, -8
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 8
  br label %208

195:                                              ; preds = %153, %195
  %196 = phi i32 [ %206, %195 ], [ 0, %153 ]
  %197 = phi i64 [ %205, %195 ], [ 0, %153 ]
  %198 = zext i32 %196 to i64
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 %198
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !19
  %201 = zext i8 %200 to i64
  %202 = shl i32 %196, 3
  %203 = zext i32 %202 to i64
  %204 = shl nuw i64 %201, %203
  %205 = or i64 %204, %197
  %206 = add nuw nsw i32 %196, 1
  %207 = icmp eq i32 %206, %150
  br i1 %207, label %208, label %195

208:                                              ; preds = %195, %155, %153
  %209 = phi i8 addrspace(4)* [ %194, %155 ], [ %149, %153 ], [ %149, %195 ]
  %210 = phi i32 [ %193, %155 ], [ 0, %153 ], [ 0, %195 ]
  %211 = phi i64 [ %192, %155 ], [ 0, %153 ], [ %205, %195 ]
  %212 = icmp ugt i32 %210, 7
  br i1 %212, label %215, label %213

213:                                              ; preds = %208
  %214 = icmp eq i32 %210, 0
  br i1 %214, label %268, label %255

215:                                              ; preds = %208
  %216 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !19
  %217 = zext i8 %216 to i64
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 1
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !19
  %220 = zext i8 %219 to i64
  %221 = shl nuw nsw i64 %220, 8
  %222 = or i64 %221, %217
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 2
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !19
  %225 = zext i8 %224 to i64
  %226 = shl nuw nsw i64 %225, 16
  %227 = or i64 %222, %226
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 3
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !19
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 24
  %232 = or i64 %227, %231
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 4
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !19
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 32
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 5
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !19
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 40
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 6
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !19
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 48
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 7
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !19
  %250 = zext i8 %249 to i64
  %251 = shl nuw i64 %250, 56
  %252 = or i64 %247, %251
  %253 = add nsw i32 %210, -8
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 8
  br label %268

255:                                              ; preds = %213, %255
  %256 = phi i32 [ %266, %255 ], [ 0, %213 ]
  %257 = phi i64 [ %265, %255 ], [ 0, %213 ]
  %258 = zext i32 %256 to i64
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 %258
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !19
  %261 = zext i8 %260 to i64
  %262 = shl i32 %256, 3
  %263 = zext i32 %262 to i64
  %264 = shl nuw i64 %261, %263
  %265 = or i64 %264, %257
  %266 = add nuw nsw i32 %256, 1
  %267 = icmp eq i32 %266, %210
  br i1 %267, label %268, label %255

268:                                              ; preds = %255, %215, %213
  %269 = phi i8 addrspace(4)* [ %254, %215 ], [ %209, %213 ], [ %209, %255 ]
  %270 = phi i32 [ %253, %215 ], [ 0, %213 ], [ 0, %255 ]
  %271 = phi i64 [ %252, %215 ], [ 0, %213 ], [ %265, %255 ]
  %272 = icmp ugt i32 %270, 7
  br i1 %272, label %275, label %273

273:                                              ; preds = %268
  %274 = icmp eq i32 %270, 0
  br i1 %274, label %328, label %315

275:                                              ; preds = %268
  %276 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !19
  %277 = zext i8 %276 to i64
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 1
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !19
  %280 = zext i8 %279 to i64
  %281 = shl nuw nsw i64 %280, 8
  %282 = or i64 %281, %277
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 2
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !19
  %285 = zext i8 %284 to i64
  %286 = shl nuw nsw i64 %285, 16
  %287 = or i64 %282, %286
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 3
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !19
  %290 = zext i8 %289 to i64
  %291 = shl nuw nsw i64 %290, 24
  %292 = or i64 %287, %291
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 4
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !19
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 32
  %297 = or i64 %292, %296
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 5
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !19
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 40
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 6
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !19
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 48
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 7
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !19
  %310 = zext i8 %309 to i64
  %311 = shl nuw i64 %310, 56
  %312 = or i64 %307, %311
  %313 = add nsw i32 %270, -8
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 8
  br label %328

315:                                              ; preds = %273, %315
  %316 = phi i32 [ %326, %315 ], [ 0, %273 ]
  %317 = phi i64 [ %325, %315 ], [ 0, %273 ]
  %318 = zext i32 %316 to i64
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 %318
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !19
  %321 = zext i8 %320 to i64
  %322 = shl i32 %316, 3
  %323 = zext i32 %322 to i64
  %324 = shl nuw i64 %321, %323
  %325 = or i64 %324, %317
  %326 = add nuw nsw i32 %316, 1
  %327 = icmp eq i32 %326, %270
  br i1 %327, label %328, label %315

328:                                              ; preds = %315, %275, %273
  %329 = phi i8 addrspace(4)* [ %314, %275 ], [ %269, %273 ], [ %269, %315 ]
  %330 = phi i32 [ %313, %275 ], [ 0, %273 ], [ 0, %315 ]
  %331 = phi i64 [ %312, %275 ], [ 0, %273 ], [ %325, %315 ]
  %332 = icmp ugt i32 %330, 7
  br i1 %332, label %335, label %333

333:                                              ; preds = %328
  %334 = icmp eq i32 %330, 0
  br i1 %334, label %388, label %375

335:                                              ; preds = %328
  %336 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !19
  %337 = zext i8 %336 to i64
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 1
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !19
  %340 = zext i8 %339 to i64
  %341 = shl nuw nsw i64 %340, 8
  %342 = or i64 %341, %337
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 2
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !19
  %345 = zext i8 %344 to i64
  %346 = shl nuw nsw i64 %345, 16
  %347 = or i64 %342, %346
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 3
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !19
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 24
  %352 = or i64 %347, %351
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 4
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !19
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 32
  %357 = or i64 %352, %356
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 5
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !19
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 40
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 6
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !19
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 48
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 7
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !19
  %370 = zext i8 %369 to i64
  %371 = shl nuw i64 %370, 56
  %372 = or i64 %367, %371
  %373 = add nsw i32 %330, -8
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 8
  br label %388

375:                                              ; preds = %333, %375
  %376 = phi i32 [ %386, %375 ], [ 0, %333 ]
  %377 = phi i64 [ %385, %375 ], [ 0, %333 ]
  %378 = zext i32 %376 to i64
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 %378
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !19
  %381 = zext i8 %380 to i64
  %382 = shl i32 %376, 3
  %383 = zext i32 %382 to i64
  %384 = shl nuw i64 %381, %383
  %385 = or i64 %384, %377
  %386 = add nuw nsw i32 %376, 1
  %387 = icmp eq i32 %386, %330
  br i1 %387, label %388, label %375

388:                                              ; preds = %375, %335, %333
  %389 = phi i8 addrspace(4)* [ %374, %335 ], [ %329, %333 ], [ %329, %375 ]
  %390 = phi i32 [ %373, %335 ], [ 0, %333 ], [ 0, %375 ]
  %391 = phi i64 [ %372, %335 ], [ 0, %333 ], [ %385, %375 ]
  %392 = icmp ugt i32 %390, 7
  br i1 %392, label %395, label %393

393:                                              ; preds = %388
  %394 = icmp eq i32 %390, 0
  br i1 %394, label %448, label %435

395:                                              ; preds = %388
  %396 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !19
  %397 = zext i8 %396 to i64
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 1
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !19
  %400 = zext i8 %399 to i64
  %401 = shl nuw nsw i64 %400, 8
  %402 = or i64 %401, %397
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 2
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !19
  %405 = zext i8 %404 to i64
  %406 = shl nuw nsw i64 %405, 16
  %407 = or i64 %402, %406
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 3
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !19
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 24
  %412 = or i64 %407, %411
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 4
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !19
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 32
  %417 = or i64 %412, %416
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 5
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !19
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 40
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 6
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !19
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 48
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 7
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !19
  %430 = zext i8 %429 to i64
  %431 = shl nuw i64 %430, 56
  %432 = or i64 %427, %431
  %433 = add nsw i32 %390, -8
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 8
  br label %448

435:                                              ; preds = %393, %435
  %436 = phi i32 [ %446, %435 ], [ 0, %393 ]
  %437 = phi i64 [ %445, %435 ], [ 0, %393 ]
  %438 = zext i32 %436 to i64
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 %438
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !19
  %441 = zext i8 %440 to i64
  %442 = shl i32 %436, 3
  %443 = zext i32 %442 to i64
  %444 = shl nuw i64 %441, %443
  %445 = or i64 %444, %437
  %446 = add nuw nsw i32 %436, 1
  %447 = icmp eq i32 %446, %390
  br i1 %447, label %448, label %435

448:                                              ; preds = %435, %395, %393
  %449 = phi i8 addrspace(4)* [ %434, %395 ], [ %389, %393 ], [ %389, %435 ]
  %450 = phi i32 [ %433, %395 ], [ 0, %393 ], [ 0, %435 ]
  %451 = phi i64 [ %432, %395 ], [ 0, %393 ], [ %445, %435 ]
  %452 = icmp ugt i32 %450, 7
  br i1 %452, label %455, label %453

453:                                              ; preds = %448
  %454 = icmp eq i32 %450, 0
  br i1 %454, label %506, label %493

455:                                              ; preds = %448
  %456 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !19
  %457 = zext i8 %456 to i64
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %449, i64 1
  %459 = load i8, i8 addrspace(4)* %458, align 1, !tbaa !19
  %460 = zext i8 %459 to i64
  %461 = shl nuw nsw i64 %460, 8
  %462 = or i64 %461, %457
  %463 = getelementptr inbounds i8, i8 addrspace(4)* %449, i64 2
  %464 = load i8, i8 addrspace(4)* %463, align 1, !tbaa !19
  %465 = zext i8 %464 to i64
  %466 = shl nuw nsw i64 %465, 16
  %467 = or i64 %462, %466
  %468 = getelementptr inbounds i8, i8 addrspace(4)* %449, i64 3
  %469 = load i8, i8 addrspace(4)* %468, align 1, !tbaa !19
  %470 = zext i8 %469 to i64
  %471 = shl nuw nsw i64 %470, 24
  %472 = or i64 %467, %471
  %473 = getelementptr inbounds i8, i8 addrspace(4)* %449, i64 4
  %474 = load i8, i8 addrspace(4)* %473, align 1, !tbaa !19
  %475 = zext i8 %474 to i64
  %476 = shl nuw nsw i64 %475, 32
  %477 = or i64 %472, %476
  %478 = getelementptr inbounds i8, i8 addrspace(4)* %449, i64 5
  %479 = load i8, i8 addrspace(4)* %478, align 1, !tbaa !19
  %480 = zext i8 %479 to i64
  %481 = shl nuw nsw i64 %480, 40
  %482 = or i64 %477, %481
  %483 = getelementptr inbounds i8, i8 addrspace(4)* %449, i64 6
  %484 = load i8, i8 addrspace(4)* %483, align 1, !tbaa !19
  %485 = zext i8 %484 to i64
  %486 = shl nuw nsw i64 %485, 48
  %487 = or i64 %482, %486
  %488 = getelementptr inbounds i8, i8 addrspace(4)* %449, i64 7
  %489 = load i8, i8 addrspace(4)* %488, align 1, !tbaa !19
  %490 = zext i8 %489 to i64
  %491 = shl nuw i64 %490, 56
  %492 = or i64 %487, %491
  br label %506

493:                                              ; preds = %453, %493
  %494 = phi i32 [ %504, %493 ], [ 0, %453 ]
  %495 = phi i64 [ %503, %493 ], [ 0, %453 ]
  %496 = zext i32 %494 to i64
  %497 = getelementptr inbounds i8, i8 addrspace(4)* %449, i64 %496
  %498 = load i8, i8 addrspace(4)* %497, align 1, !tbaa !19
  %499 = zext i8 %498 to i64
  %500 = shl i32 %494, 3
  %501 = zext i32 %500 to i64
  %502 = shl nuw i64 %499, %501
  %503 = or i64 %502, %495
  %504 = add nuw nsw i32 %494, 1
  %505 = icmp eq i32 %504, %450
  br i1 %505, label %506, label %493

506:                                              ; preds = %493, %455, %453
  %507 = phi i64 [ %492, %455 ], [ 0, %453 ], [ %503, %493 ]
  %508 = shl nuw nsw i64 %89, 2
  %509 = add nuw nsw i64 %508, 28
  %510 = and i64 %509, 480
  %511 = and i64 %91, -225
  %512 = or i64 %511, %510
  %513 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %69, i64 noundef %512, i64 noundef %151, i64 noundef %211, i64 noundef %271, i64 noundef %331, i64 noundef %391, i64 noundef %451, i64 noundef %507) #11
  %514 = sub i64 %81, %89
  %515 = getelementptr inbounds i8, i8 addrspace(4)* %82, i64 %89
  %516 = icmp eq i64 %514, 0
  br i1 %516, label %517, label %80

517:                                              ; preds = %506, %72
  %518 = phi <2 x i64> [ %75, %72 ], [ %513, %506 ]
  %519 = extractelement <2 x i64> %518, i64 0
  %520 = bitcast double %63 to i64
  %521 = and i64 %519, -227
  %522 = or i64 %521, 34
  %523 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %69, i64 noundef %522, i64 noundef %520, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %524

524:                                              ; preds = %44, %517, %6
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
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
