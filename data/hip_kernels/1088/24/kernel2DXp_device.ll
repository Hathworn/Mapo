; ModuleID = '../data/hip_kernels/1088/24/main.cu'
source_filename = "../data/hip_kernels/1088/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@memory = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10kernel2DXpPdS_PKdiiiiiii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = mul nsw i32 %7, %6
  %12 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %11
  %13 = icmp sgt i32 %3, 0
  br i1 %13, label %14, label %32

14:                                               ; preds = %10
  %15 = and i32 %3, 7
  %16 = icmp ult i32 %3, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = and i32 %3, -8
  br label %60

19:                                               ; preds = %60, %14
  %20 = phi i32 [ 0, %14 ], [ %102, %60 ]
  %21 = icmp eq i32 %15, 0
  br i1 %21, label %32, label %22

22:                                               ; preds = %19, %22
  %23 = phi i32 [ %29, %22 ], [ %20, %19 ]
  %24 = phi i32 [ %30, %22 ], [ 0, %19 ]
  %25 = zext i32 %23 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !4, !amdgpu.noclobber !8
  %28 = getelementptr inbounds double, double addrspace(3)* %12, i32 %23
  store double %27, double addrspace(3)* %28, align 8, !tbaa !4
  %29 = add nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 %24, 1
  %31 = icmp eq i32 %30, %15
  br i1 %31, label %32, label %22, !llvm.loop !9

32:                                               ; preds = %22, %19, %10
  %33 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %35 = getelementptr i8, i8 addrspace(4)* %33, i64 4
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 4, !range !11, !invariant.load !8
  %38 = zext i16 %37 to i32
  %39 = mul i32 %34, %38
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %41 = add i32 %39, %40
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %43 = getelementptr i8, i8 addrspace(4)* %33, i64 6
  %44 = bitcast i8 addrspace(4)* %43 to i16 addrspace(4)*
  %45 = load i16, i16 addrspace(4)* %44, align 2, !range !11, !invariant.load !8
  %46 = zext i16 %45 to i32
  %47 = mul i32 %42, %46
  %48 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !12
  %49 = add i32 %47, %48
  %50 = add i32 %40, %4
  %51 = mul nsw i32 %49, %9
  %52 = add nsw i32 %51, %41
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !4, !amdgpu.noclobber !8
  %56 = mul nsw i32 %48, %6
  %57 = add i32 %56, %50
  %58 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %57
  store double %55, double addrspace(3)* %58, align 8, !tbaa !4
  %59 = icmp eq i32 %34, 0
  br i1 %59, label %121, label %105

60:                                               ; preds = %60, %17
  %61 = phi i32 [ 0, %17 ], [ %102, %60 ]
  %62 = phi i32 [ 0, %17 ], [ %103, %60 ]
  %63 = zext i32 %61 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %2, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !4, !amdgpu.noclobber !8
  %66 = getelementptr inbounds double, double addrspace(3)* %12, i32 %61
  store double %65, double addrspace(3)* %66, align 8, !tbaa !4
  %67 = or i32 %61, 1
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %2, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !4, !amdgpu.noclobber !8
  %71 = getelementptr inbounds double, double addrspace(3)* %12, i32 %67
  store double %70, double addrspace(3)* %71, align 8, !tbaa !4
  %72 = or i32 %61, 2
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %2, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !4, !amdgpu.noclobber !8
  %76 = getelementptr inbounds double, double addrspace(3)* %12, i32 %72
  store double %75, double addrspace(3)* %76, align 8, !tbaa !4
  %77 = or i32 %61, 3
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %2, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !4, !amdgpu.noclobber !8
  %81 = getelementptr inbounds double, double addrspace(3)* %12, i32 %77
  store double %80, double addrspace(3)* %81, align 8, !tbaa !4
  %82 = or i32 %61, 4
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %2, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !4, !amdgpu.noclobber !8
  %86 = getelementptr inbounds double, double addrspace(3)* %12, i32 %82
  store double %85, double addrspace(3)* %86, align 8, !tbaa !4
  %87 = or i32 %61, 5
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %2, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !4, !amdgpu.noclobber !8
  %91 = getelementptr inbounds double, double addrspace(3)* %12, i32 %87
  store double %90, double addrspace(3)* %91, align 8, !tbaa !4
  %92 = or i32 %61, 6
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %2, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !4, !amdgpu.noclobber !8
  %96 = getelementptr inbounds double, double addrspace(3)* %12, i32 %92
  store double %95, double addrspace(3)* %96, align 8, !tbaa !4
  %97 = or i32 %61, 7
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %2, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !4, !amdgpu.noclobber !8
  %101 = getelementptr inbounds double, double addrspace(3)* %12, i32 %97
  store double %100, double addrspace(3)* %101, align 8, !tbaa !4
  %102 = add nuw nsw i32 %61, 8
  %103 = add nuw i32 %62, 8
  %104 = icmp eq i32 %103, %18
  br i1 %104, label %19, label %60, !llvm.loop !13

105:                                              ; preds = %32
  %106 = sdiv i32 %9, %8
  %107 = add nsw i32 %106, -1
  %108 = icmp eq i32 %34, %107
  br i1 %108, label %141, label %109

109:                                              ; preds = %105
  %110 = icmp ult i32 %40, %4
  br i1 %110, label %111, label %119

111:                                              ; preds = %109
  %112 = sub i32 %41, %4
  %113 = add nsw i32 %112, %51
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %1, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !4, !amdgpu.noclobber !8
  %117 = add i32 %56, %40
  %118 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %117
  store double %116, double addrspace(3)* %118, align 8, !tbaa !4
  br label %119

119:                                              ; preds = %111, %109
  %120 = icmp ult i32 %40, %5
  br i1 %120, label %134, label %141

121:                                              ; preds = %32
  store double %55, double addrspace(3)* %58, align 8, !tbaa !4
  %122 = icmp ult i32 %40, %4
  br i1 %122, label %123, label %132

123:                                              ; preds = %121
  %124 = add i32 %51, %40
  %125 = sub i32 %124, %4
  %126 = add i32 %125, %9
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds double, double addrspace(1)* %1, i64 %127
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !4, !amdgpu.noclobber !8
  %130 = add i32 %56, %40
  %131 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %130
  store double %129, double addrspace(3)* %131, align 8, !tbaa !4
  br label %132

132:                                              ; preds = %123, %121
  %133 = icmp ult i32 %40, %5
  br i1 %133, label %134, label %141

134:                                              ; preds = %132, %119
  %135 = add nsw i32 %52, %8
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %1, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !4
  %139 = add i32 %57, %8
  %140 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %139
  store double %138, double addrspace(3)* %140, align 8, !tbaa !4
  br label %141

141:                                              ; preds = %134, %105, %119, %132
  %142 = sdiv i32 %9, %8
  %143 = add nsw i32 %142, -1
  %144 = icmp eq i32 %34, %143
  %145 = add i32 %56, %40
  br i1 %144, label %146, label %166

146:                                              ; preds = %141
  %147 = add i32 %145, %4
  %148 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %147
  store double %55, double addrspace(3)* %148, align 8, !tbaa !4
  %149 = icmp ult i32 %40, %4
  br i1 %149, label %150, label %157

150:                                              ; preds = %146
  %151 = sub i32 %41, %4
  %152 = add nsw i32 %151, %51
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds double, double addrspace(1)* %1, i64 %153
  %155 = load double, double addrspace(1)* %154, align 8, !tbaa !4, !amdgpu.noclobber !8
  %156 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %145
  store double %155, double addrspace(3)* %156, align 8, !tbaa !4
  br label %157

157:                                              ; preds = %150, %146
  %158 = icmp ult i32 %40, %5
  br i1 %158, label %159, label %166

159:                                              ; preds = %157
  %160 = add i32 %51, %40
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds double, double addrspace(1)* %1, i64 %161
  %163 = load double, double addrspace(1)* %162, align 8, !tbaa !4, !amdgpu.noclobber !8
  %164 = add i32 %57, %8
  %165 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %164
  store double %163, double addrspace(3)* %165, align 8, !tbaa !4
  br label %166

166:                                              ; preds = %141, %157, %159
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %13, label %167, label %191

167:                                              ; preds = %166
  %168 = and i32 %3, 7
  %169 = icmp ult i32 %3, 8
  br i1 %169, label %172, label %170

170:                                              ; preds = %167
  %171 = and i32 %3, -8
  br label %194

172:                                              ; preds = %194, %167
  %173 = phi double [ undef, %167 ], [ %260, %194 ]
  %174 = phi i32 [ 0, %167 ], [ %261, %194 ]
  %175 = phi double [ 0.000000e+00, %167 ], [ %260, %194 ]
  %176 = icmp eq i32 %168, 0
  br i1 %176, label %191, label %177

177:                                              ; preds = %172, %177
  %178 = phi i32 [ %188, %177 ], [ %174, %172 ]
  %179 = phi double [ %187, %177 ], [ %175, %172 ]
  %180 = phi i32 [ %189, %177 ], [ 0, %172 ]
  %181 = getelementptr inbounds double, double addrspace(3)* %12, i32 %178
  %182 = load double, double addrspace(3)* %181, align 8, !tbaa !4
  %183 = add nsw i32 %145, %178
  %184 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %183
  %185 = load double, double addrspace(3)* %184, align 8, !tbaa !4
  %186 = fmul contract double %182, %185
  %187 = fadd contract double %179, %186
  %188 = add nuw nsw i32 %178, 1
  %189 = add nuw nsw i32 %180, 1
  %190 = icmp eq i32 %189, %168
  br i1 %190, label %191, label %177, !llvm.loop !15

191:                                              ; preds = %177, %172, %166
  %192 = phi double [ 0.000000e+00, %166 ], [ %173, %172 ], [ %187, %177 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %193 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  store double %192, double addrspace(1)* %193, align 8, !tbaa !4
  ret void

194:                                              ; preds = %194, %170
  %195 = phi i32 [ 0, %170 ], [ %261, %194 ]
  %196 = phi double [ 0.000000e+00, %170 ], [ %260, %194 ]
  %197 = phi i32 [ 0, %170 ], [ %262, %194 ]
  %198 = getelementptr inbounds double, double addrspace(3)* %12, i32 %195
  %199 = load double, double addrspace(3)* %198, align 8, !tbaa !4
  %200 = add nsw i32 %145, %195
  %201 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %200
  %202 = load double, double addrspace(3)* %201, align 8, !tbaa !4
  %203 = fmul contract double %199, %202
  %204 = fadd contract double %196, %203
  %205 = or i32 %195, 1
  %206 = getelementptr inbounds double, double addrspace(3)* %12, i32 %205
  %207 = load double, double addrspace(3)* %206, align 8, !tbaa !4
  %208 = add nsw i32 %145, %205
  %209 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %208
  %210 = load double, double addrspace(3)* %209, align 8, !tbaa !4
  %211 = fmul contract double %207, %210
  %212 = fadd contract double %204, %211
  %213 = or i32 %195, 2
  %214 = getelementptr inbounds double, double addrspace(3)* %12, i32 %213
  %215 = load double, double addrspace(3)* %214, align 8, !tbaa !4
  %216 = add nsw i32 %145, %213
  %217 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %216
  %218 = load double, double addrspace(3)* %217, align 8, !tbaa !4
  %219 = fmul contract double %215, %218
  %220 = fadd contract double %212, %219
  %221 = or i32 %195, 3
  %222 = getelementptr inbounds double, double addrspace(3)* %12, i32 %221
  %223 = load double, double addrspace(3)* %222, align 8, !tbaa !4
  %224 = add nsw i32 %145, %221
  %225 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %224
  %226 = load double, double addrspace(3)* %225, align 8, !tbaa !4
  %227 = fmul contract double %223, %226
  %228 = fadd contract double %220, %227
  %229 = or i32 %195, 4
  %230 = getelementptr inbounds double, double addrspace(3)* %12, i32 %229
  %231 = load double, double addrspace(3)* %230, align 8, !tbaa !4
  %232 = add nsw i32 %145, %229
  %233 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %232
  %234 = load double, double addrspace(3)* %233, align 8, !tbaa !4
  %235 = fmul contract double %231, %234
  %236 = fadd contract double %228, %235
  %237 = or i32 %195, 5
  %238 = getelementptr inbounds double, double addrspace(3)* %12, i32 %237
  %239 = load double, double addrspace(3)* %238, align 8, !tbaa !4
  %240 = add nsw i32 %145, %237
  %241 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %240
  %242 = load double, double addrspace(3)* %241, align 8, !tbaa !4
  %243 = fmul contract double %239, %242
  %244 = fadd contract double %236, %243
  %245 = or i32 %195, 6
  %246 = getelementptr inbounds double, double addrspace(3)* %12, i32 %245
  %247 = load double, double addrspace(3)* %246, align 8, !tbaa !4
  %248 = add nsw i32 %145, %245
  %249 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %248
  %250 = load double, double addrspace(3)* %249, align 8, !tbaa !4
  %251 = fmul contract double %247, %250
  %252 = fadd contract double %244, %251
  %253 = or i32 %195, 7
  %254 = getelementptr inbounds double, double addrspace(3)* %12, i32 %253
  %255 = load double, double addrspace(3)* %254, align 8, !tbaa !4
  %256 = add nsw i32 %145, %253
  %257 = getelementptr inbounds double, double addrspace(3)* bitcast ([0 x i32] addrspace(3)* @memory to double addrspace(3)*), i32 %256
  %258 = load double, double addrspace(3)* %257, align 8, !tbaa !4
  %259 = fmul contract double %255, %258
  %260 = fadd contract double %252, %259
  %261 = add nuw nsw i32 %195, 8
  %262 = add nuw i32 %197, 8
  %263 = icmp eq i32 %262, %171
  br i1 %263, label %172, label %194, !llvm.loop !16
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{i16 1, i16 1025}
!12 = !{i32 0, i32 1024}
!13 = distinct !{!13, !14, !10}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !14, !10}
