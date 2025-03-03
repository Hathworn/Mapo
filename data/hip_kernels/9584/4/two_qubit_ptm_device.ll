; ModuleID = '../data/hip_kernels/9584/4/main.cu'
source_filename = "../data/hip_kernels/9584/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@ptm = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13two_qubit_ptmPdS_jjj(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.umax.i32(i32 %2, i32 %3)
  %15 = tail call i32 @llvm.umin.i32(i32 %2, i32 %3)
  %16 = shl nsw i32 %14, 1
  %17 = add nsw i32 %16, 2
  %18 = shl nsw i32 -1, %17
  %19 = xor i32 %18, -1
  %20 = shl nsw i32 %15, 1
  %21 = add nsw i32 %20, 4
  %22 = shl nsw i32 -1, %21
  %23 = and i32 %22, %19
  %24 = or i32 %18, %22
  %25 = xor i32 %24, -1
  %26 = or i32 %13, %6
  %27 = and i32 %23, %26
  %28 = ashr i32 %27, 2
  %29 = and i32 %26, %25
  %30 = ashr i32 %29, 4
  %31 = and i32 %26, 3
  %32 = shl i32 %2, 1
  %33 = shl i32 %31, %32
  %34 = lshr i32 %26, 2
  %35 = and i32 %34, 3
  %36 = shl i32 %3, 1
  %37 = shl i32 %35, %36
  %38 = udiv i32 255, %12
  %39 = add nuw nsw i32 %38, 1
  %40 = and i32 %39, 7
  %41 = icmp ugt i16 %11, 36
  br i1 %41, label %44, label %42

42:                                               ; preds = %5
  %43 = and i32 %39, -8
  br label %66

44:                                               ; preds = %139, %5
  %45 = phi i32 [ 0, %5 ], [ %140, %139 ]
  %46 = icmp eq i32 %40, 0
  br i1 %46, label %61, label %47

47:                                               ; preds = %44, %57
  %48 = phi i32 [ %58, %57 ], [ %45, %44 ]
  %49 = phi i32 [ %59, %57 ], [ 0, %44 ]
  %50 = add nuw nsw i32 %48, %6
  %51 = icmp ult i32 %50, 256
  br i1 %51, label %52, label %57

52:                                               ; preds = %47
  %53 = zext i32 %50 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !6
  %56 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %50
  store double %55, double addrspace(3)* %56, align 8, !tbaa !7
  br label %57

57:                                               ; preds = %52, %47
  %58 = add nuw nsw i32 %48, %12
  %59 = add i32 %49, 1
  %60 = icmp eq i32 %59, %40
  br i1 %60, label %61, label %47, !llvm.loop !11

61:                                               ; preds = %57, %44
  %62 = add i32 %13, %6
  %63 = shl i32 %4, 1
  %64 = lshr i32 %62, %63
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %143, label %282

66:                                               ; preds = %139, %42
  %67 = phi i32 [ 0, %42 ], [ %140, %139 ]
  %68 = phi i32 [ 0, %42 ], [ %141, %139 ]
  %69 = add nuw nsw i32 %67, %6
  %70 = icmp ult i32 %69, 256
  br i1 %70, label %71, label %76

71:                                               ; preds = %66
  %72 = zext i32 %69 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %1, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7, !amdgpu.noclobber !6
  %75 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %69
  store double %74, double addrspace(3)* %75, align 8, !tbaa !7
  br label %76

76:                                               ; preds = %66, %71
  %77 = add nuw nsw i32 %67, %12
  %78 = add nuw nsw i32 %77, %6
  %79 = icmp ult i32 %78, 256
  br i1 %79, label %80, label %85

80:                                               ; preds = %76
  %81 = zext i32 %78 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %1, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7, !amdgpu.noclobber !6
  %84 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %78
  store double %83, double addrspace(3)* %84, align 8, !tbaa !7
  br label %85

85:                                               ; preds = %80, %76
  %86 = add nuw nsw i32 %77, %12
  %87 = add nuw nsw i32 %86, %6
  %88 = icmp ult i32 %87, 256
  br i1 %88, label %89, label %94

89:                                               ; preds = %85
  %90 = zext i32 %87 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %1, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7, !amdgpu.noclobber !6
  %93 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %87
  store double %92, double addrspace(3)* %93, align 8, !tbaa !7
  br label %94

94:                                               ; preds = %89, %85
  %95 = add nuw nsw i32 %86, %12
  %96 = add nuw nsw i32 %95, %6
  %97 = icmp ult i32 %96, 256
  br i1 %97, label %98, label %103

98:                                               ; preds = %94
  %99 = zext i32 %96 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %1, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7, !amdgpu.noclobber !6
  %102 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %96
  store double %101, double addrspace(3)* %102, align 8, !tbaa !7
  br label %103

103:                                              ; preds = %98, %94
  %104 = add nuw nsw i32 %95, %12
  %105 = add nuw nsw i32 %104, %6
  %106 = icmp ult i32 %105, 256
  br i1 %106, label %107, label %112

107:                                              ; preds = %103
  %108 = zext i32 %105 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %1, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !7, !amdgpu.noclobber !6
  %111 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %105
  store double %110, double addrspace(3)* %111, align 8, !tbaa !7
  br label %112

112:                                              ; preds = %107, %103
  %113 = add nuw nsw i32 %104, %12
  %114 = add nuw nsw i32 %113, %6
  %115 = icmp ult i32 %114, 256
  br i1 %115, label %116, label %121

116:                                              ; preds = %112
  %117 = zext i32 %114 to i64
  %118 = getelementptr inbounds double, double addrspace(1)* %1, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !7, !amdgpu.noclobber !6
  %120 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %114
  store double %119, double addrspace(3)* %120, align 8, !tbaa !7
  br label %121

121:                                              ; preds = %116, %112
  %122 = add nuw nsw i32 %113, %12
  %123 = add nuw nsw i32 %122, %6
  %124 = icmp ult i32 %123, 256
  br i1 %124, label %125, label %130

125:                                              ; preds = %121
  %126 = zext i32 %123 to i64
  %127 = getelementptr inbounds double, double addrspace(1)* %1, i64 %126
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !7, !amdgpu.noclobber !6
  %129 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %123
  store double %128, double addrspace(3)* %129, align 8, !tbaa !7
  br label %130

130:                                              ; preds = %125, %121
  %131 = add nuw nsw i32 %122, %12
  %132 = add nuw nsw i32 %131, %6
  %133 = icmp ult i32 %132, 256
  br i1 %133, label %134, label %139

134:                                              ; preds = %130
  %135 = zext i32 %132 to i64
  %136 = getelementptr inbounds double, double addrspace(1)* %1, i64 %135
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !7, !amdgpu.noclobber !6
  %138 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %132
  store double %137, double addrspace(3)* %138, align 8, !tbaa !7
  br label %139

139:                                              ; preds = %134, %130
  %140 = add nuw nsw i32 %131, %12
  %141 = add i32 %68, 8
  %142 = icmp eq i32 %141, %43
  br i1 %142, label %44, label %66, !llvm.loop !13

143:                                              ; preds = %61
  %144 = and i32 %26, %18
  %145 = or i32 %28, %144
  %146 = or i32 %145, %30
  %147 = or i32 %146, %33
  %148 = or i32 %147, %37
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds double, double addrspace(1)* %0, i64 %149
  %151 = load double, double addrspace(1)* %150, align 8, !tbaa !7, !amdgpu.noclobber !6
  %152 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %6
  store double %151, double addrspace(3)* %152, align 8, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %153 = and i32 %6, 1008
  %154 = shl nuw nsw i32 %6, 4
  %155 = and i32 %154, 240
  %156 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %155
  %157 = load double, double addrspace(3)* %156, align 8, !tbaa !7
  %158 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %153
  %159 = load double, double addrspace(3)* %158, align 8, !tbaa !7
  %160 = fmul contract double %157, %159
  %161 = fadd contract double %160, 0.000000e+00
  %162 = or i32 %155, 1
  %163 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %162
  %164 = load double, double addrspace(3)* %163, align 8, !tbaa !7
  %165 = or i32 %153, 1
  %166 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %165
  %167 = load double, double addrspace(3)* %166, align 8, !tbaa !7
  %168 = fmul contract double %164, %167
  %169 = fadd contract double %161, %168
  %170 = or i32 %155, 2
  %171 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %170
  %172 = load double, double addrspace(3)* %171, align 8, !tbaa !7
  %173 = or i32 %153, 2
  %174 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %173
  %175 = load double, double addrspace(3)* %174, align 8, !tbaa !7
  %176 = fmul contract double %172, %175
  %177 = fadd contract double %169, %176
  %178 = or i32 %155, 3
  %179 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %178
  %180 = load double, double addrspace(3)* %179, align 8, !tbaa !7
  %181 = or i32 %153, 3
  %182 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %181
  %183 = load double, double addrspace(3)* %182, align 8, !tbaa !7
  %184 = fmul contract double %180, %183
  %185 = fadd contract double %177, %184
  %186 = or i32 %155, 4
  %187 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %186
  %188 = load double, double addrspace(3)* %187, align 8, !tbaa !7
  %189 = or i32 %153, 4
  %190 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %189
  %191 = load double, double addrspace(3)* %190, align 8, !tbaa !7
  %192 = fmul contract double %188, %191
  %193 = fadd contract double %185, %192
  %194 = or i32 %155, 5
  %195 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %194
  %196 = load double, double addrspace(3)* %195, align 8, !tbaa !7
  %197 = or i32 %153, 5
  %198 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %197
  %199 = load double, double addrspace(3)* %198, align 8, !tbaa !7
  %200 = fmul contract double %196, %199
  %201 = fadd contract double %193, %200
  %202 = or i32 %155, 6
  %203 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %202
  %204 = load double, double addrspace(3)* %203, align 8, !tbaa !7
  %205 = or i32 %153, 6
  %206 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %205
  %207 = load double, double addrspace(3)* %206, align 8, !tbaa !7
  %208 = fmul contract double %204, %207
  %209 = fadd contract double %201, %208
  %210 = or i32 %155, 7
  %211 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %210
  %212 = load double, double addrspace(3)* %211, align 8, !tbaa !7
  %213 = or i32 %153, 7
  %214 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %213
  %215 = load double, double addrspace(3)* %214, align 8, !tbaa !7
  %216 = fmul contract double %212, %215
  %217 = fadd contract double %209, %216
  %218 = or i32 %155, 8
  %219 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %218
  %220 = load double, double addrspace(3)* %219, align 8, !tbaa !7
  %221 = or i32 %153, 8
  %222 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %221
  %223 = load double, double addrspace(3)* %222, align 8, !tbaa !7
  %224 = fmul contract double %220, %223
  %225 = fadd contract double %217, %224
  %226 = or i32 %155, 9
  %227 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %226
  %228 = load double, double addrspace(3)* %227, align 8, !tbaa !7
  %229 = or i32 %153, 9
  %230 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %229
  %231 = load double, double addrspace(3)* %230, align 8, !tbaa !7
  %232 = fmul contract double %228, %231
  %233 = fadd contract double %225, %232
  %234 = or i32 %155, 10
  %235 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %234
  %236 = load double, double addrspace(3)* %235, align 8, !tbaa !7
  %237 = or i32 %153, 10
  %238 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %237
  %239 = load double, double addrspace(3)* %238, align 8, !tbaa !7
  %240 = fmul contract double %236, %239
  %241 = fadd contract double %233, %240
  %242 = or i32 %155, 11
  %243 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %242
  %244 = load double, double addrspace(3)* %243, align 8, !tbaa !7
  %245 = or i32 %153, 11
  %246 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %245
  %247 = load double, double addrspace(3)* %246, align 8, !tbaa !7
  %248 = fmul contract double %244, %247
  %249 = fadd contract double %241, %248
  %250 = or i32 %155, 12
  %251 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %250
  %252 = load double, double addrspace(3)* %251, align 8, !tbaa !7
  %253 = or i32 %153, 12
  %254 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %253
  %255 = load double, double addrspace(3)* %254, align 8, !tbaa !7
  %256 = fmul contract double %252, %255
  %257 = fadd contract double %249, %256
  %258 = or i32 %155, 13
  %259 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %258
  %260 = load double, double addrspace(3)* %259, align 8, !tbaa !7
  %261 = or i32 %153, 13
  %262 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %261
  %263 = load double, double addrspace(3)* %262, align 8, !tbaa !7
  %264 = fmul contract double %260, %263
  %265 = fadd contract double %257, %264
  %266 = or i32 %155, 14
  %267 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %266
  %268 = load double, double addrspace(3)* %267, align 8, !tbaa !7
  %269 = or i32 %153, 14
  %270 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %269
  %271 = load double, double addrspace(3)* %270, align 8, !tbaa !7
  %272 = fmul contract double %268, %271
  %273 = fadd contract double %265, %272
  %274 = or i32 %155, 15
  %275 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %274
  %276 = load double, double addrspace(3)* %275, align 8, !tbaa !7
  %277 = or i32 %6, 15
  %278 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 256), i32 %277
  %279 = load double, double addrspace(3)* %278, align 8, !tbaa !7
  %280 = fmul contract double %276, %279
  %281 = fadd contract double %273, %280
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store double %281, double addrspace(1)* %150, align 8, !tbaa !7
  br label %282

282:                                              ; preds = %61, %143
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
