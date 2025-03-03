; ModuleID = '../data/hip_kernels/360/13/main.cu'
source_filename = "../data/hip_kernels/360/13/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [75 x i8] c"Aggregate %d is too small but found no merges! %d / %d neighbors checked.\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z19FindDesirableMergesiiibPiS_S_S_S_(i32 %0, i32 %1, i32 %2, i1 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture %8) local_unnamed_addr #1 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %20, label %567

20:                                               ; preds = %9
  %21 = sext i32 %18 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %567, label %25

25:                                               ; preds = %20
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %21
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %21
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = add nsw i32 %18, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = icmp sgt i32 %33, %29
  br i1 %34, label %35, label %40

35:                                               ; preds = %25
  %36 = icmp slt i32 %27, %1
  %37 = sub nsw i32 %1, %27
  %38 = select i1 %36, i32 %37, i32 0
  %39 = sitofp i32 %38 to float
  br label %44

40:                                               ; preds = %82, %25
  %41 = phi i32 [ -1, %25 ], [ %83, %82 ]
  %42 = phi i32 [ 0, %25 ], [ %85, %82 ]
  %43 = icmp eq i32 %41, -1
  br i1 %43, label %88, label %89

44:                                               ; preds = %35, %82
  %45 = phi i32 [ 0, %35 ], [ %85, %82 ]
  %46 = phi float [ 0.000000e+00, %35 ], [ %84, %82 ]
  %47 = phi i32 [ -1, %35 ], [ %83, %82 ]
  %48 = phi i32 [ %29, %35 ], [ %86, %82 ]
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = icmp eq i32 %54, 1
  br i1 %55, label %82, label %56

56:                                               ; preds = %44
  %57 = add nsw i32 %45, 1
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %52
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = icmp slt i32 %59, %1
  %61 = sub nsw i32 %1, %59
  %62 = select i1 %60, i32 %61, i32 0
  %63 = sitofp i32 %62 to float
  %64 = fadd contract float %39, %63
  %65 = add nsw i32 %59, %27
  %66 = icmp sgt i32 %65, %2
  br i1 %66, label %67, label %77

67:                                               ; preds = %56
  br i1 %3, label %68, label %72

68:                                               ; preds = %67
  %69 = sub nsw i32 %65, %2
  %70 = sitofp i32 %69 to double
  %71 = fdiv contract double 1.000000e+00, %70
  br label %72

72:                                               ; preds = %67, %68
  %73 = phi contract double [ %71, %68 ], [ 0.000000e+00, %67 ]
  %74 = fpext float %64 to double
  %75 = fmul contract double %73, %74
  %76 = fptrunc double %75 to float
  br label %77

77:                                               ; preds = %72, %56
  %78 = phi float [ %76, %72 ], [ %64, %56 ]
  %79 = fcmp contract ogt float %78, %46
  %80 = select i1 %79, i32 %51, i32 %47
  %81 = select i1 %79, float %78, float %46
  br label %82

82:                                               ; preds = %77, %44
  %83 = phi i32 [ %80, %77 ], [ %47, %44 ]
  %84 = phi float [ %81, %77 ], [ %46, %44 ]
  %85 = phi i32 [ %57, %77 ], [ %45, %44 ]
  %86 = add nsw i32 %48, 1
  %87 = icmp slt i32 %86, %33
  br i1 %87, label %44, label %40, !llvm.loop !11

88:                                               ; preds = %40
  store i32 1, i32 addrspace(1)* %22, align 4, !tbaa !7
  br label %89

89:                                               ; preds = %88, %40
  %90 = icmp slt i32 %27, %1
  %91 = select i1 %90, i1 %3, i1 false
  %92 = select i1 %91, i1 %43, i1 false
  br i1 %92, label %93, label %565

93:                                               ; preds = %89
  %94 = sub nsw i32 %33, %29
  %95 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %95, i64 24
  %97 = bitcast i8 addrspace(4)* %96 to i64 addrspace(4)*
  %98 = load i64, i64 addrspace(4)* %97, align 8, !tbaa !13
  %99 = inttoptr i64 %98 to i8 addrspace(1)*
  %100 = addrspacecast i8 addrspace(1)* %99 to i8*
  %101 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %100, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %102 = extractelement <2 x i64> %101, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([75 x i8], [75 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %103, label %107

103:                                              ; preds = %93
  %104 = and i64 %102, -225
  %105 = or i64 %104, 32
  %106 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %100, i64 noundef %105, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %548

107:                                              ; preds = %93
  %108 = and i64 %102, 2
  %109 = and i64 %102, -3
  %110 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %109, i64 0
  br label %111

111:                                              ; preds = %537, %107
  %112 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([75 x i8], [75 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([75 x i8], [75 x i8] addrspace(4)* @.str, i64 0, i64 74) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([75 x i8]* addrspacecast ([75 x i8] addrspace(4)* @.str to [75 x i8]*) to i64)), i64 1))), %107 ], [ %545, %537 ]
  %113 = phi i8 addrspace(4)* [ getelementptr inbounds ([75 x i8], [75 x i8] addrspace(4)* @.str, i64 0, i64 0), %107 ], [ %546, %537 ]
  %114 = phi <2 x i64> [ %110, %107 ], [ %544, %537 ]
  %115 = icmp ugt i64 %112, 56
  %116 = extractelement <2 x i64> %114, i64 0
  %117 = or i64 %116, %108
  %118 = insertelement <2 x i64> poison, i64 %117, i64 0
  %119 = select i1 %115, <2 x i64> %114, <2 x i64> %118
  %120 = tail call i64 @llvm.umin.i64(i64 %112, i64 56)
  %121 = trunc i64 %120 to i32
  %122 = extractelement <2 x i64> %119, i64 0
  %123 = icmp ugt i32 %121, 7
  br i1 %123, label %126, label %124

124:                                              ; preds = %111
  %125 = icmp eq i32 %121, 0
  br i1 %125, label %179, label %166

126:                                              ; preds = %111
  %127 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !17
  %128 = zext i8 %127 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 1
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !17
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 8
  %133 = or i64 %132, %128
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 2
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !17
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 16
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 3
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !17
  %141 = zext i8 %140 to i64
  %142 = shl nuw nsw i64 %141, 24
  %143 = or i64 %138, %142
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 4
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !17
  %146 = zext i8 %145 to i64
  %147 = shl nuw nsw i64 %146, 32
  %148 = or i64 %143, %147
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 5
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !17
  %151 = zext i8 %150 to i64
  %152 = shl nuw nsw i64 %151, 40
  %153 = or i64 %148, %152
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 6
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !17
  %156 = zext i8 %155 to i64
  %157 = shl nuw nsw i64 %156, 48
  %158 = or i64 %153, %157
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 7
  %160 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !17
  %161 = zext i8 %160 to i64
  %162 = shl nuw i64 %161, 56
  %163 = or i64 %158, %162
  %164 = add nsw i32 %121, -8
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 8
  br label %179

166:                                              ; preds = %124, %166
  %167 = phi i32 [ %177, %166 ], [ 0, %124 ]
  %168 = phi i64 [ %176, %166 ], [ 0, %124 ]
  %169 = zext i32 %167 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 %169
  %171 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !17
  %172 = zext i8 %171 to i64
  %173 = shl i32 %167, 3
  %174 = zext i32 %173 to i64
  %175 = shl nuw i64 %172, %174
  %176 = or i64 %175, %168
  %177 = add nuw nsw i32 %167, 1
  %178 = icmp eq i32 %177, %121
  br i1 %178, label %179, label %166, !llvm.loop !18

179:                                              ; preds = %166, %126, %124
  %180 = phi i8 addrspace(4)* [ %165, %126 ], [ %113, %124 ], [ %113, %166 ]
  %181 = phi i32 [ %164, %126 ], [ 0, %124 ], [ 0, %166 ]
  %182 = phi i64 [ %163, %126 ], [ 0, %124 ], [ %176, %166 ]
  %183 = icmp ugt i32 %181, 7
  br i1 %183, label %186, label %184

184:                                              ; preds = %179
  %185 = icmp eq i32 %181, 0
  br i1 %185, label %239, label %226

186:                                              ; preds = %179
  %187 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !17
  %188 = zext i8 %187 to i64
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 1
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !17
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 8
  %193 = or i64 %192, %188
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 2
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !17
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 16
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 3
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !17
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 24
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 4
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !17
  %206 = zext i8 %205 to i64
  %207 = shl nuw nsw i64 %206, 32
  %208 = or i64 %203, %207
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 5
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !17
  %211 = zext i8 %210 to i64
  %212 = shl nuw nsw i64 %211, 40
  %213 = or i64 %208, %212
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 6
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !17
  %216 = zext i8 %215 to i64
  %217 = shl nuw nsw i64 %216, 48
  %218 = or i64 %213, %217
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 7
  %220 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !17
  %221 = zext i8 %220 to i64
  %222 = shl nuw i64 %221, 56
  %223 = or i64 %218, %222
  %224 = add nsw i32 %181, -8
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 8
  br label %239

226:                                              ; preds = %184, %226
  %227 = phi i32 [ %237, %226 ], [ 0, %184 ]
  %228 = phi i64 [ %236, %226 ], [ 0, %184 ]
  %229 = zext i32 %227 to i64
  %230 = getelementptr inbounds i8, i8 addrspace(4)* %180, i64 %229
  %231 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !17
  %232 = zext i8 %231 to i64
  %233 = shl i32 %227, 3
  %234 = zext i32 %233 to i64
  %235 = shl nuw i64 %232, %234
  %236 = or i64 %235, %228
  %237 = add nuw nsw i32 %227, 1
  %238 = icmp eq i32 %237, %181
  br i1 %238, label %239, label %226

239:                                              ; preds = %226, %186, %184
  %240 = phi i8 addrspace(4)* [ %225, %186 ], [ %180, %184 ], [ %180, %226 ]
  %241 = phi i32 [ %224, %186 ], [ 0, %184 ], [ 0, %226 ]
  %242 = phi i64 [ %223, %186 ], [ 0, %184 ], [ %236, %226 ]
  %243 = icmp ugt i32 %241, 7
  br i1 %243, label %246, label %244

244:                                              ; preds = %239
  %245 = icmp eq i32 %241, 0
  br i1 %245, label %299, label %286

246:                                              ; preds = %239
  %247 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !17
  %248 = zext i8 %247 to i64
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 1
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !17
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 8
  %253 = or i64 %252, %248
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 2
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !17
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 16
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 3
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !17
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 24
  %263 = or i64 %258, %262
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 4
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !17
  %266 = zext i8 %265 to i64
  %267 = shl nuw nsw i64 %266, 32
  %268 = or i64 %263, %267
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 5
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !17
  %271 = zext i8 %270 to i64
  %272 = shl nuw nsw i64 %271, 40
  %273 = or i64 %268, %272
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 6
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !17
  %276 = zext i8 %275 to i64
  %277 = shl nuw nsw i64 %276, 48
  %278 = or i64 %273, %277
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 7
  %280 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !17
  %281 = zext i8 %280 to i64
  %282 = shl nuw i64 %281, 56
  %283 = or i64 %278, %282
  %284 = add nsw i32 %241, -8
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 8
  br label %299

286:                                              ; preds = %244, %286
  %287 = phi i32 [ %297, %286 ], [ 0, %244 ]
  %288 = phi i64 [ %296, %286 ], [ 0, %244 ]
  %289 = zext i32 %287 to i64
  %290 = getelementptr inbounds i8, i8 addrspace(4)* %240, i64 %289
  %291 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !17
  %292 = zext i8 %291 to i64
  %293 = shl i32 %287, 3
  %294 = zext i32 %293 to i64
  %295 = shl nuw i64 %292, %294
  %296 = or i64 %295, %288
  %297 = add nuw nsw i32 %287, 1
  %298 = icmp eq i32 %297, %241
  br i1 %298, label %299, label %286

299:                                              ; preds = %286, %246, %244
  %300 = phi i8 addrspace(4)* [ %285, %246 ], [ %240, %244 ], [ %240, %286 ]
  %301 = phi i32 [ %284, %246 ], [ 0, %244 ], [ 0, %286 ]
  %302 = phi i64 [ %283, %246 ], [ 0, %244 ], [ %296, %286 ]
  %303 = icmp ugt i32 %301, 7
  br i1 %303, label %306, label %304

304:                                              ; preds = %299
  %305 = icmp eq i32 %301, 0
  br i1 %305, label %359, label %346

306:                                              ; preds = %299
  %307 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !17
  %308 = zext i8 %307 to i64
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 1
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !17
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 8
  %313 = or i64 %312, %308
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 2
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !17
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 16
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 3
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !17
  %321 = zext i8 %320 to i64
  %322 = shl nuw nsw i64 %321, 24
  %323 = or i64 %318, %322
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 4
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !17
  %326 = zext i8 %325 to i64
  %327 = shl nuw nsw i64 %326, 32
  %328 = or i64 %323, %327
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 5
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !17
  %331 = zext i8 %330 to i64
  %332 = shl nuw nsw i64 %331, 40
  %333 = or i64 %328, %332
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 6
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !17
  %336 = zext i8 %335 to i64
  %337 = shl nuw nsw i64 %336, 48
  %338 = or i64 %333, %337
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 7
  %340 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !17
  %341 = zext i8 %340 to i64
  %342 = shl nuw i64 %341, 56
  %343 = or i64 %338, %342
  %344 = add nsw i32 %301, -8
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 8
  br label %359

346:                                              ; preds = %304, %346
  %347 = phi i32 [ %357, %346 ], [ 0, %304 ]
  %348 = phi i64 [ %356, %346 ], [ 0, %304 ]
  %349 = zext i32 %347 to i64
  %350 = getelementptr inbounds i8, i8 addrspace(4)* %300, i64 %349
  %351 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !17
  %352 = zext i8 %351 to i64
  %353 = shl i32 %347, 3
  %354 = zext i32 %353 to i64
  %355 = shl nuw i64 %352, %354
  %356 = or i64 %355, %348
  %357 = add nuw nsw i32 %347, 1
  %358 = icmp eq i32 %357, %301
  br i1 %358, label %359, label %346

359:                                              ; preds = %346, %306, %304
  %360 = phi i8 addrspace(4)* [ %345, %306 ], [ %300, %304 ], [ %300, %346 ]
  %361 = phi i32 [ %344, %306 ], [ 0, %304 ], [ 0, %346 ]
  %362 = phi i64 [ %343, %306 ], [ 0, %304 ], [ %356, %346 ]
  %363 = icmp ugt i32 %361, 7
  br i1 %363, label %366, label %364

364:                                              ; preds = %359
  %365 = icmp eq i32 %361, 0
  br i1 %365, label %419, label %406

366:                                              ; preds = %359
  %367 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !17
  %368 = zext i8 %367 to i64
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 1
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !17
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 8
  %373 = or i64 %372, %368
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 2
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !17
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 16
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 3
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !17
  %381 = zext i8 %380 to i64
  %382 = shl nuw nsw i64 %381, 24
  %383 = or i64 %378, %382
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 4
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !17
  %386 = zext i8 %385 to i64
  %387 = shl nuw nsw i64 %386, 32
  %388 = or i64 %383, %387
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 5
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !17
  %391 = zext i8 %390 to i64
  %392 = shl nuw nsw i64 %391, 40
  %393 = or i64 %388, %392
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 6
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !17
  %396 = zext i8 %395 to i64
  %397 = shl nuw nsw i64 %396, 48
  %398 = or i64 %393, %397
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 7
  %400 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !17
  %401 = zext i8 %400 to i64
  %402 = shl nuw i64 %401, 56
  %403 = or i64 %398, %402
  %404 = add nsw i32 %361, -8
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 8
  br label %419

406:                                              ; preds = %364, %406
  %407 = phi i32 [ %417, %406 ], [ 0, %364 ]
  %408 = phi i64 [ %416, %406 ], [ 0, %364 ]
  %409 = zext i32 %407 to i64
  %410 = getelementptr inbounds i8, i8 addrspace(4)* %360, i64 %409
  %411 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !17
  %412 = zext i8 %411 to i64
  %413 = shl i32 %407, 3
  %414 = zext i32 %413 to i64
  %415 = shl nuw i64 %412, %414
  %416 = or i64 %415, %408
  %417 = add nuw nsw i32 %407, 1
  %418 = icmp eq i32 %417, %361
  br i1 %418, label %419, label %406

419:                                              ; preds = %406, %366, %364
  %420 = phi i8 addrspace(4)* [ %405, %366 ], [ %360, %364 ], [ %360, %406 ]
  %421 = phi i32 [ %404, %366 ], [ 0, %364 ], [ 0, %406 ]
  %422 = phi i64 [ %403, %366 ], [ 0, %364 ], [ %416, %406 ]
  %423 = icmp ugt i32 %421, 7
  br i1 %423, label %426, label %424

424:                                              ; preds = %419
  %425 = icmp eq i32 %421, 0
  br i1 %425, label %479, label %466

426:                                              ; preds = %419
  %427 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !17
  %428 = zext i8 %427 to i64
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 1
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !17
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 8
  %433 = or i64 %432, %428
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 2
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !17
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 16
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 3
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !17
  %441 = zext i8 %440 to i64
  %442 = shl nuw nsw i64 %441, 24
  %443 = or i64 %438, %442
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 4
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !17
  %446 = zext i8 %445 to i64
  %447 = shl nuw nsw i64 %446, 32
  %448 = or i64 %443, %447
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 5
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !17
  %451 = zext i8 %450 to i64
  %452 = shl nuw nsw i64 %451, 40
  %453 = or i64 %448, %452
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 6
  %455 = load i8, i8 addrspace(4)* %454, align 1, !tbaa !17
  %456 = zext i8 %455 to i64
  %457 = shl nuw nsw i64 %456, 48
  %458 = or i64 %453, %457
  %459 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 7
  %460 = load i8, i8 addrspace(4)* %459, align 1, !tbaa !17
  %461 = zext i8 %460 to i64
  %462 = shl nuw i64 %461, 56
  %463 = or i64 %458, %462
  %464 = add nsw i32 %421, -8
  %465 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 8
  br label %479

466:                                              ; preds = %424, %466
  %467 = phi i32 [ %477, %466 ], [ 0, %424 ]
  %468 = phi i64 [ %476, %466 ], [ 0, %424 ]
  %469 = zext i32 %467 to i64
  %470 = getelementptr inbounds i8, i8 addrspace(4)* %420, i64 %469
  %471 = load i8, i8 addrspace(4)* %470, align 1, !tbaa !17
  %472 = zext i8 %471 to i64
  %473 = shl i32 %467, 3
  %474 = zext i32 %473 to i64
  %475 = shl nuw i64 %472, %474
  %476 = or i64 %475, %468
  %477 = add nuw nsw i32 %467, 1
  %478 = icmp eq i32 %477, %421
  br i1 %478, label %479, label %466

479:                                              ; preds = %466, %426, %424
  %480 = phi i8 addrspace(4)* [ %465, %426 ], [ %420, %424 ], [ %420, %466 ]
  %481 = phi i32 [ %464, %426 ], [ 0, %424 ], [ 0, %466 ]
  %482 = phi i64 [ %463, %426 ], [ 0, %424 ], [ %476, %466 ]
  %483 = icmp ugt i32 %481, 7
  br i1 %483, label %486, label %484

484:                                              ; preds = %479
  %485 = icmp eq i32 %481, 0
  br i1 %485, label %537, label %524

486:                                              ; preds = %479
  %487 = load i8, i8 addrspace(4)* %480, align 1, !tbaa !17
  %488 = zext i8 %487 to i64
  %489 = getelementptr inbounds i8, i8 addrspace(4)* %480, i64 1
  %490 = load i8, i8 addrspace(4)* %489, align 1, !tbaa !17
  %491 = zext i8 %490 to i64
  %492 = shl nuw nsw i64 %491, 8
  %493 = or i64 %492, %488
  %494 = getelementptr inbounds i8, i8 addrspace(4)* %480, i64 2
  %495 = load i8, i8 addrspace(4)* %494, align 1, !tbaa !17
  %496 = zext i8 %495 to i64
  %497 = shl nuw nsw i64 %496, 16
  %498 = or i64 %493, %497
  %499 = getelementptr inbounds i8, i8 addrspace(4)* %480, i64 3
  %500 = load i8, i8 addrspace(4)* %499, align 1, !tbaa !17
  %501 = zext i8 %500 to i64
  %502 = shl nuw nsw i64 %501, 24
  %503 = or i64 %498, %502
  %504 = getelementptr inbounds i8, i8 addrspace(4)* %480, i64 4
  %505 = load i8, i8 addrspace(4)* %504, align 1, !tbaa !17
  %506 = zext i8 %505 to i64
  %507 = shl nuw nsw i64 %506, 32
  %508 = or i64 %503, %507
  %509 = getelementptr inbounds i8, i8 addrspace(4)* %480, i64 5
  %510 = load i8, i8 addrspace(4)* %509, align 1, !tbaa !17
  %511 = zext i8 %510 to i64
  %512 = shl nuw nsw i64 %511, 40
  %513 = or i64 %508, %512
  %514 = getelementptr inbounds i8, i8 addrspace(4)* %480, i64 6
  %515 = load i8, i8 addrspace(4)* %514, align 1, !tbaa !17
  %516 = zext i8 %515 to i64
  %517 = shl nuw nsw i64 %516, 48
  %518 = or i64 %513, %517
  %519 = getelementptr inbounds i8, i8 addrspace(4)* %480, i64 7
  %520 = load i8, i8 addrspace(4)* %519, align 1, !tbaa !17
  %521 = zext i8 %520 to i64
  %522 = shl nuw i64 %521, 56
  %523 = or i64 %518, %522
  br label %537

524:                                              ; preds = %484, %524
  %525 = phi i32 [ %535, %524 ], [ 0, %484 ]
  %526 = phi i64 [ %534, %524 ], [ 0, %484 ]
  %527 = zext i32 %525 to i64
  %528 = getelementptr inbounds i8, i8 addrspace(4)* %480, i64 %527
  %529 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !17
  %530 = zext i8 %529 to i64
  %531 = shl i32 %525, 3
  %532 = zext i32 %531 to i64
  %533 = shl nuw i64 %530, %532
  %534 = or i64 %533, %526
  %535 = add nuw nsw i32 %525, 1
  %536 = icmp eq i32 %535, %481
  br i1 %536, label %537, label %524

537:                                              ; preds = %524, %486, %484
  %538 = phi i64 [ %523, %486 ], [ 0, %484 ], [ %534, %524 ]
  %539 = shl nuw nsw i64 %120, 2
  %540 = add nuw nsw i64 %539, 28
  %541 = and i64 %540, 480
  %542 = and i64 %122, -225
  %543 = or i64 %542, %541
  %544 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %100, i64 noundef %543, i64 noundef %182, i64 noundef %242, i64 noundef %302, i64 noundef %362, i64 noundef %422, i64 noundef %482, i64 noundef %538) #10
  %545 = sub i64 %112, %120
  %546 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 %120
  %547 = icmp eq i64 %545, 0
  br i1 %547, label %548, label %111

548:                                              ; preds = %537, %103
  %549 = phi <2 x i64> [ %106, %103 ], [ %544, %537 ]
  %550 = extractelement <2 x i64> %549, i64 0
  %551 = zext i32 %18 to i64
  %552 = and i64 %550, -225
  %553 = or i64 %552, 32
  %554 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %100, i64 noundef %553, i64 noundef %551, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %555 = extractelement <2 x i64> %554, i64 0
  %556 = zext i32 %42 to i64
  %557 = and i64 %555, -225
  %558 = or i64 %557, 32
  %559 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %100, i64 noundef %558, i64 noundef %556, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %560 = extractelement <2 x i64> %559, i64 0
  %561 = zext i32 %94 to i64
  %562 = and i64 %560, -227
  %563 = or i64 %562, 34
  %564 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %100, i64 noundef %563, i64 noundef %561, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %565

565:                                              ; preds = %548, %89
  %566 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %21
  store i32 %41, i32 addrspace(1)* %566, align 4, !tbaa !7
  br label %567

567:                                              ; preds = %20, %565, %9
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
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !22
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !22
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
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
  %110 = call i64 @llvm.read_register.i64(metadata !30) #11
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
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
