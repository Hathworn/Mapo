; ModuleID = '../data/hip_kernels/6425/1/main.cu'
source_filename = "../data/hip_kernels/6425/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ26gauss_elimination_cuda_newPfS_iE4temp = internal unnamed_addr addrspace(3) global [110 x [110 x float]] undef, align 16

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26gauss_elimination_cuda_newPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #1 {
  %4 = alloca [110 x float], align 16, addrspace(5)
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = add i32 %2, 1
  %7 = icmp slt i32 %2, 0
  br i1 %7, label %81, label %8

8:                                                ; preds = %3
  %9 = mul nsw i32 %6, %5
  %10 = and i32 %6, 7
  %11 = icmp ult i32 %2, 7
  br i1 %11, label %67, label %12

12:                                               ; preds = %8
  %13 = and i32 %6, -8
  br label %14

14:                                               ; preds = %14, %12
  %15 = phi i32 [ 0, %12 ], [ %64, %14 ]
  %16 = phi i32 [ 0, %12 ], [ %65, %14 ]
  %17 = add nsw i32 %15, %9
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %15
  store float %20, float addrspace(3)* %21, align 8, !tbaa !5
  %22 = or i32 %15, 1
  %23 = add nsw i32 %22, %9
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %22
  store float %26, float addrspace(3)* %27, align 4, !tbaa !5
  %28 = or i32 %15, 2
  %29 = add nsw i32 %28, %9
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %28
  store float %32, float addrspace(3)* %33, align 8, !tbaa !5
  %34 = or i32 %15, 3
  %35 = add nsw i32 %34, %9
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %34
  store float %38, float addrspace(3)* %39, align 4, !tbaa !5
  %40 = or i32 %15, 4
  %41 = add nsw i32 %40, %9
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %40
  store float %44, float addrspace(3)* %45, align 8, !tbaa !5
  %46 = or i32 %15, 5
  %47 = add nsw i32 %46, %9
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %46
  store float %50, float addrspace(3)* %51, align 4, !tbaa !5
  %52 = or i32 %15, 6
  %53 = add nsw i32 %52, %9
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %52
  store float %56, float addrspace(3)* %57, align 8, !tbaa !5
  %58 = or i32 %15, 7
  %59 = add nsw i32 %58, %9
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %58
  store float %62, float addrspace(3)* %63, align 4, !tbaa !5
  %64 = add nuw i32 %15, 8
  %65 = add i32 %16, 8
  %66 = icmp eq i32 %65, %13
  br i1 %66, label %67, label %14, !llvm.loop !10

67:                                               ; preds = %14, %8
  %68 = phi i32 [ 0, %8 ], [ %64, %14 ]
  %69 = icmp eq i32 %10, 0
  br i1 %69, label %81, label %70

70:                                               ; preds = %67, %70
  %71 = phi i32 [ %78, %70 ], [ %68, %67 ]
  %72 = phi i32 [ %79, %70 ], [ 0, %67 ]
  %73 = add nsw i32 %71, %9
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %71
  store float %76, float addrspace(3)* %77, align 4, !tbaa !5
  %78 = add nuw i32 %71, 1
  %79 = add i32 %72, 1
  %80 = icmp eq i32 %79, %10
  br i1 %80, label %81, label %70, !llvm.loop !12

81:                                               ; preds = %67, %70, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = icmp sgt i32 %2, 1
  br i1 %82, label %83, label %92

83:                                               ; preds = %81
  %84 = bitcast [110 x float] addrspace(5)* %4 to i8 addrspace(5)*
  %85 = and i32 %6, 1
  %86 = and i32 %6, -2
  %87 = icmp eq i32 %85, 0
  %88 = and i32 %6, 7
  %89 = icmp ult i32 %2, 7
  %90 = and i32 %6, -8
  %91 = icmp eq i32 %88, 0
  br label %99

92:                                               ; preds = %231, %81
  br i1 %7, label %301, label %93

93:                                               ; preds = %92
  %94 = mul nsw i32 %6, %5
  %95 = and i32 %6, 7
  %96 = icmp ult i32 %2, 7
  br i1 %96, label %287, label %97

97:                                               ; preds = %93
  %98 = and i32 %6, -8
  br label %234

99:                                               ; preds = %83, %231
  %100 = phi i32 [ 1, %83 ], [ %232, %231 ]
  %101 = icmp ult i32 %5, %100
  br i1 %101, label %231, label %102

102:                                              ; preds = %99
  call void @llvm.lifetime.start.p5i8(i64 440, i8 addrspace(5)* %84) #4
  %103 = add nsw i32 %100, -1
  %104 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %103, i32 %103
  %105 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %103
  br label %106

106:                                              ; preds = %135, %102
  %107 = phi i32 [ 0, %102 ], [ %136, %135 ]
  %108 = phi i32 [ 0, %102 ], [ %137, %135 ]
  %109 = icmp ult i32 %107, %103
  br i1 %109, label %121, label %110

110:                                              ; preds = %106
  %111 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %103, i32 %107
  %112 = load float, float addrspace(3)* %111, align 8, !tbaa !5
  %113 = load float, float addrspace(3)* %104, align 4, !tbaa !5
  %114 = load float, float addrspace(3)* %105, align 4, !tbaa !5
  %115 = fdiv contract float %113, %114
  %116 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %107
  %117 = load float, float addrspace(3)* %116, align 8, !tbaa !5
  %118 = fmul contract float %115, %117
  %119 = fsub contract float %112, %118
  %120 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %107
  store float %119, float addrspace(5)* %120, align 8, !tbaa !5
  br label %121

121:                                              ; preds = %106, %110
  %122 = or i32 %107, 1
  %123 = icmp ult i32 %122, %103
  br i1 %123, label %135, label %124

124:                                              ; preds = %121
  %125 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %103, i32 %122
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !5
  %127 = load float, float addrspace(3)* %104, align 4, !tbaa !5
  %128 = load float, float addrspace(3)* %105, align 4, !tbaa !5
  %129 = fdiv contract float %127, %128
  %130 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %122
  %131 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %132 = fmul contract float %129, %131
  %133 = fsub contract float %126, %132
  %134 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %122
  store float %133, float addrspace(5)* %134, align 4, !tbaa !5
  br label %135

135:                                              ; preds = %124, %121
  %136 = add nuw i32 %107, 2
  %137 = add nuw i32 %108, 2
  %138 = icmp eq i32 %137, %86
  br i1 %138, label %139, label %106, !llvm.loop !14

139:                                              ; preds = %135
  %140 = icmp ult i32 %136, %103
  %141 = select i1 %87, i1 true, i1 %140
  br i1 %141, label %153, label %142

142:                                              ; preds = %139
  %143 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %103, i32 %136
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !5
  %145 = load float, float addrspace(3)* %104, align 4, !tbaa !5
  %146 = load float, float addrspace(3)* %105, align 4, !tbaa !5
  %147 = fdiv contract float %145, %146
  %148 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %136
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %150 = fmul contract float %147, %149
  %151 = fsub contract float %144, %150
  %152 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %136
  store float %151, float addrspace(5)* %152, align 4, !tbaa !5
  br label %153

153:                                              ; preds = %142, %139
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = add nsw i32 %100, -1
  br i1 %89, label %216, label %155

155:                                              ; preds = %153, %212
  %156 = phi i32 [ %213, %212 ], [ 0, %153 ]
  %157 = phi i32 [ %214, %212 ], [ 0, %153 ]
  %158 = icmp ult i32 %156, %154
  br i1 %158, label %163, label %159

159:                                              ; preds = %155
  %160 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %156
  %161 = load float, float addrspace(5)* %160, align 16, !tbaa !5
  %162 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %156
  store float %161, float addrspace(3)* %162, align 8, !tbaa !5
  br label %163

163:                                              ; preds = %155, %159
  %164 = or i32 %156, 1
  %165 = icmp ult i32 %164, %154
  br i1 %165, label %170, label %166

166:                                              ; preds = %163
  %167 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %164
  %168 = load float, float addrspace(5)* %167, align 4, !tbaa !5
  %169 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %164
  store float %168, float addrspace(3)* %169, align 4, !tbaa !5
  br label %170

170:                                              ; preds = %166, %163
  %171 = or i32 %156, 2
  %172 = icmp ult i32 %171, %154
  br i1 %172, label %177, label %173

173:                                              ; preds = %170
  %174 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %171
  %175 = load float, float addrspace(5)* %174, align 8, !tbaa !5
  %176 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %171
  store float %175, float addrspace(3)* %176, align 8, !tbaa !5
  br label %177

177:                                              ; preds = %173, %170
  %178 = or i32 %156, 3
  %179 = icmp ult i32 %178, %154
  br i1 %179, label %184, label %180

180:                                              ; preds = %177
  %181 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %178
  %182 = load float, float addrspace(5)* %181, align 4, !tbaa !5
  %183 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %178
  store float %182, float addrspace(3)* %183, align 4, !tbaa !5
  br label %184

184:                                              ; preds = %180, %177
  %185 = or i32 %156, 4
  %186 = icmp ult i32 %185, %154
  br i1 %186, label %191, label %187

187:                                              ; preds = %184
  %188 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %185
  %189 = load float, float addrspace(5)* %188, align 16, !tbaa !5
  %190 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %185
  store float %189, float addrspace(3)* %190, align 8, !tbaa !5
  br label %191

191:                                              ; preds = %187, %184
  %192 = or i32 %156, 5
  %193 = icmp ult i32 %192, %154
  br i1 %193, label %198, label %194

194:                                              ; preds = %191
  %195 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %192
  %196 = load float, float addrspace(5)* %195, align 4, !tbaa !5
  %197 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %192
  store float %196, float addrspace(3)* %197, align 4, !tbaa !5
  br label %198

198:                                              ; preds = %194, %191
  %199 = or i32 %156, 6
  %200 = icmp ult i32 %199, %154
  br i1 %200, label %205, label %201

201:                                              ; preds = %198
  %202 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %199
  %203 = load float, float addrspace(5)* %202, align 8, !tbaa !5
  %204 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %199
  store float %203, float addrspace(3)* %204, align 8, !tbaa !5
  br label %205

205:                                              ; preds = %201, %198
  %206 = or i32 %156, 7
  %207 = icmp ult i32 %206, %154
  br i1 %207, label %212, label %208

208:                                              ; preds = %205
  %209 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %206
  %210 = load float, float addrspace(5)* %209, align 4, !tbaa !5
  %211 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %206
  store float %210, float addrspace(3)* %211, align 4, !tbaa !5
  br label %212

212:                                              ; preds = %208, %205
  %213 = add nuw i32 %156, 8
  %214 = add i32 %157, 8
  %215 = icmp eq i32 %214, %90
  br i1 %215, label %216, label %155, !llvm.loop !15

216:                                              ; preds = %212, %153
  %217 = phi i32 [ 0, %153 ], [ %213, %212 ]
  br i1 %91, label %230, label %218

218:                                              ; preds = %216, %226
  %219 = phi i32 [ %227, %226 ], [ %217, %216 ]
  %220 = phi i32 [ %228, %226 ], [ 0, %216 ]
  %221 = icmp ult i32 %219, %154
  br i1 %221, label %226, label %222

222:                                              ; preds = %218
  %223 = getelementptr inbounds [110 x float], [110 x float] addrspace(5)* %4, i32 0, i32 %219
  %224 = load float, float addrspace(5)* %223, align 4, !tbaa !5
  %225 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %219
  store float %224, float addrspace(3)* %225, align 4, !tbaa !5
  br label %226

226:                                              ; preds = %222, %218
  %227 = add nuw i32 %219, 1
  %228 = add i32 %220, 1
  %229 = icmp eq i32 %228, %88
  br i1 %229, label %230, label %218, !llvm.loop !16

230:                                              ; preds = %226, %216
  call void @llvm.lifetime.end.p5i8(i64 440, i8 addrspace(5)* %84) #4
  br label %231

231:                                              ; preds = %230, %99
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %232 = add nuw nsw i32 %100, 1
  %233 = icmp eq i32 %232, %2
  br i1 %233, label %92, label %99, !llvm.loop !17

234:                                              ; preds = %234, %97
  %235 = phi i32 [ 0, %97 ], [ %284, %234 ]
  %236 = phi i32 [ 0, %97 ], [ %285, %234 ]
  %237 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %235
  %238 = load float, float addrspace(3)* %237, align 8, !tbaa !5
  %239 = add nsw i32 %235, %94
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds float, float addrspace(1)* %1, i64 %240
  store float %238, float addrspace(1)* %241, align 4, !tbaa !5
  %242 = or i32 %235, 1
  %243 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %242
  %244 = load float, float addrspace(3)* %243, align 4, !tbaa !5
  %245 = add nsw i32 %242, %94
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %1, i64 %246
  store float %244, float addrspace(1)* %247, align 4, !tbaa !5
  %248 = or i32 %235, 2
  %249 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %248
  %250 = load float, float addrspace(3)* %249, align 8, !tbaa !5
  %251 = add nsw i32 %248, %94
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %1, i64 %252
  store float %250, float addrspace(1)* %253, align 4, !tbaa !5
  %254 = or i32 %235, 3
  %255 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %254
  %256 = load float, float addrspace(3)* %255, align 4, !tbaa !5
  %257 = add nsw i32 %254, %94
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds float, float addrspace(1)* %1, i64 %258
  store float %256, float addrspace(1)* %259, align 4, !tbaa !5
  %260 = or i32 %235, 4
  %261 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %260
  %262 = load float, float addrspace(3)* %261, align 8, !tbaa !5
  %263 = add nsw i32 %260, %94
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %1, i64 %264
  store float %262, float addrspace(1)* %265, align 4, !tbaa !5
  %266 = or i32 %235, 5
  %267 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %266
  %268 = load float, float addrspace(3)* %267, align 4, !tbaa !5
  %269 = add nsw i32 %266, %94
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds float, float addrspace(1)* %1, i64 %270
  store float %268, float addrspace(1)* %271, align 4, !tbaa !5
  %272 = or i32 %235, 6
  %273 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %272
  %274 = load float, float addrspace(3)* %273, align 8, !tbaa !5
  %275 = add nsw i32 %272, %94
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds float, float addrspace(1)* %1, i64 %276
  store float %274, float addrspace(1)* %277, align 4, !tbaa !5
  %278 = or i32 %235, 7
  %279 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %278
  %280 = load float, float addrspace(3)* %279, align 4, !tbaa !5
  %281 = add nsw i32 %278, %94
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds float, float addrspace(1)* %1, i64 %282
  store float %280, float addrspace(1)* %283, align 4, !tbaa !5
  %284 = add nuw i32 %235, 8
  %285 = add i32 %236, 8
  %286 = icmp eq i32 %285, %98
  br i1 %286, label %287, label %234, !llvm.loop !18

287:                                              ; preds = %234, %93
  %288 = phi i32 [ 0, %93 ], [ %284, %234 ]
  %289 = icmp eq i32 %95, 0
  br i1 %289, label %301, label %290

290:                                              ; preds = %287, %290
  %291 = phi i32 [ %298, %290 ], [ %288, %287 ]
  %292 = phi i32 [ %299, %290 ], [ 0, %287 ]
  %293 = getelementptr inbounds [110 x [110 x float]], [110 x [110 x float]] addrspace(3)* @_ZZ26gauss_elimination_cuda_newPfS_iE4temp, i32 0, i32 %5, i32 %291
  %294 = load float, float addrspace(3)* %293, align 4, !tbaa !5
  %295 = add nsw i32 %291, %94
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds float, float addrspace(1)* %1, i64 %296
  store float %294, float addrspace(1)* %297, align 4, !tbaa !5
  %298 = add nuw i32 %291, 1
  %299 = add i32 %292, 1
  %300 = icmp eq i32 %299, %95
  br i1 %300, label %301, label %290, !llvm.loop !19

301:                                              ; preds = %287, %290, %92
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !13}
