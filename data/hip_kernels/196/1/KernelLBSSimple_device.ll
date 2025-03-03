; ModuleID = '../data/hip_kernels/196/1/main.cu'
source_filename = "../data/hip_kernels/196/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15KernelLBSSimpleiPKiiPiE11data_shared = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15KernelLBSSimpleiPKiiPi(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp slt i32 %5, %2
  br i1 %6, label %7, label %12

7:                                                ; preds = %4
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %8
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = insertelement <8 x i32> undef, i32 %10, i64 0
  br label %12

12:                                               ; preds = %7, %4
  %13 = phi <8 x i32> [ %11, %7 ], [ undef, %4 ]
  %14 = add nuw nsw i32 %5, 128
  %15 = icmp slt i32 %14, %2
  br i1 %15, label %16, label %21

16:                                               ; preds = %12
  %17 = zext i32 %14 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = insertelement <8 x i32> %13, i32 %19, i64 1
  br label %21

21:                                               ; preds = %16, %12
  %22 = phi <8 x i32> [ %20, %16 ], [ %13, %12 ]
  %23 = add nuw nsw i32 %5, 256
  %24 = icmp slt i32 %23, %2
  br i1 %24, label %25, label %30

25:                                               ; preds = %21
  %26 = zext i32 %23 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = insertelement <8 x i32> %22, i32 %28, i64 2
  br label %30

30:                                               ; preds = %25, %21
  %31 = phi <8 x i32> [ %29, %25 ], [ %22, %21 ]
  %32 = add nuw nsw i32 %5, 384
  %33 = icmp slt i32 %32, %2
  br i1 %33, label %34, label %39

34:                                               ; preds = %30
  %35 = zext i32 %32 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = insertelement <8 x i32> %31, i32 %37, i64 3
  br label %39

39:                                               ; preds = %34, %30
  %40 = phi <8 x i32> [ %38, %34 ], [ %31, %30 ]
  %41 = add nuw nsw i32 %5, 512
  %42 = icmp slt i32 %41, %2
  br i1 %42, label %43, label %48

43:                                               ; preds = %39
  %44 = zext i32 %41 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = insertelement <8 x i32> %40, i32 %46, i64 4
  br label %48

48:                                               ; preds = %43, %39
  %49 = phi <8 x i32> [ %47, %43 ], [ %40, %39 ]
  %50 = add nuw nsw i32 %5, 640
  %51 = icmp slt i32 %50, %2
  br i1 %51, label %52, label %57

52:                                               ; preds = %48
  %53 = zext i32 %50 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = insertelement <8 x i32> %49, i32 %55, i64 5
  br label %57

57:                                               ; preds = %52, %48
  %58 = phi <8 x i32> [ %56, %52 ], [ %49, %48 ]
  %59 = add nuw nsw i32 %5, 768
  %60 = icmp slt i32 %59, %2
  br i1 %60, label %61, label %66

61:                                               ; preds = %57
  %62 = zext i32 %59 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = insertelement <8 x i32> %58, i32 %64, i64 6
  br label %66

66:                                               ; preds = %61, %57
  %67 = phi <8 x i32> [ %65, %61 ], [ %58, %57 ]
  %68 = add nuw nsw i32 %5, 896
  %69 = icmp slt i32 %68, %2
  br i1 %69, label %70, label %75

70:                                               ; preds = %66
  %71 = zext i32 %68 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = insertelement <8 x i32> %67, i32 %73, i64 7
  br label %75

75:                                               ; preds = %70, %66
  %76 = phi <8 x i32> [ %74, %70 ], [ %67, %66 ]
  %77 = extractelement <8 x i32> %76, i64 0
  %78 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %5
  store i32 %77, i32 addrspace(3)* %78, align 4, !tbaa !5
  %79 = extractelement <8 x i32> %76, i64 1
  %80 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %14
  store i32 %79, i32 addrspace(3)* %80, align 4, !tbaa !5
  %81 = extractelement <8 x i32> %76, i64 2
  %82 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %23
  store i32 %81, i32 addrspace(3)* %82, align 4, !tbaa !5
  %83 = extractelement <8 x i32> %76, i64 3
  %84 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %32
  store i32 %83, i32 addrspace(3)* %84, align 4, !tbaa !5
  %85 = extractelement <8 x i32> %76, i64 4
  %86 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %41
  store i32 %85, i32 addrspace(3)* %86, align 4, !tbaa !5
  %87 = extractelement <8 x i32> %76, i64 5
  %88 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %50
  store i32 %87, i32 addrspace(3)* %88, align 4, !tbaa !5
  %89 = extractelement <8 x i32> %76, i64 6
  %90 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %59
  store i32 %89, i32 addrspace(3)* %90, align 4, !tbaa !5
  %91 = extractelement <8 x i32> %76, i64 7
  %92 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %68
  store i32 %91, i32 addrspace(3)* %92, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %93 = shl nuw nsw i32 %5, 3
  %94 = sub nsw i32 %93, %2
  %95 = tail call i32 @llvm.smax.i32(i32 %94, i32 0)
  %96 = tail call i32 @llvm.smin.i32(i32 %93, i32 %0)
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %112

98:                                               ; preds = %75, %98
  %99 = phi i32 [ %110, %98 ], [ %95, %75 ]
  %100 = phi i32 [ %109, %98 ], [ %96, %75 ]
  %101 = add nsw i32 %99, %100
  %102 = ashr i32 %101, 1
  %103 = sub nsw i32 %93, %102
  %104 = add nsw i32 %103, -1
  %105 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %104
  %106 = load i32, i32 addrspace(3)* %105, align 4, !tbaa !5
  %107 = icmp slt i32 %102, %106
  %108 = add nsw i32 %102, 1
  %109 = select i1 %107, i32 %100, i32 %102
  %110 = select i1 %107, i32 %108, i32 %99
  %111 = icmp slt i32 %110, %109
  br i1 %111, label %98, label %112, !llvm.loop !10

112:                                              ; preds = %98, %75
  %113 = phi i32 [ %95, %75 ], [ %110, %98 ]
  %114 = sub nsw i32 %93, %113
  %115 = icmp slt i32 %114, %2
  br i1 %115, label %116, label %122

116:                                              ; preds = %112
  %117 = icmp slt i32 %113, %0
  br i1 %117, label %118, label %127

118:                                              ; preds = %116
  %119 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %114
  %120 = load i32, i32 addrspace(3)* %119, align 4, !tbaa !5
  %121 = icmp slt i32 %113, %120
  br i1 %121, label %122, label %127

122:                                              ; preds = %112, %118
  %123 = add nsw i32 %114, -1
  %124 = add nsw i32 %113, 1
  %125 = add nsw i32 %113, %2
  %126 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %125
  store i32 %123, i32 addrspace(3)* %126, align 4, !tbaa !5
  br label %129

127:                                              ; preds = %116, %118
  %128 = add nsw i32 %114, 1
  br label %129

129:                                              ; preds = %127, %122
  %130 = phi i32 [ %124, %122 ], [ %113, %127 ]
  %131 = phi i32 [ %114, %122 ], [ %128, %127 ]
  %132 = icmp slt i32 %131, %2
  br i1 %132, label %133, label %141

133:                                              ; preds = %129
  %134 = icmp slt i32 %130, %0
  br i1 %134, label %135, label %139

135:                                              ; preds = %133
  %136 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %131
  %137 = load i32, i32 addrspace(3)* %136, align 4, !tbaa !5
  %138 = icmp slt i32 %130, %137
  br i1 %138, label %141, label %139

139:                                              ; preds = %135, %133
  %140 = add nsw i32 %131, 1
  br label %146

141:                                              ; preds = %135, %129
  %142 = add nsw i32 %131, -1
  %143 = add nsw i32 %130, 1
  %144 = add nsw i32 %130, %2
  %145 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %144
  store i32 %142, i32 addrspace(3)* %145, align 4, !tbaa !5
  br label %146

146:                                              ; preds = %141, %139
  %147 = phi i32 [ %143, %141 ], [ %130, %139 ]
  %148 = phi i32 [ %131, %141 ], [ %140, %139 ]
  %149 = icmp slt i32 %148, %2
  br i1 %149, label %150, label %158

150:                                              ; preds = %146
  %151 = icmp slt i32 %147, %0
  br i1 %151, label %152, label %156

152:                                              ; preds = %150
  %153 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %148
  %154 = load i32, i32 addrspace(3)* %153, align 4, !tbaa !5
  %155 = icmp slt i32 %147, %154
  br i1 %155, label %158, label %156

156:                                              ; preds = %152, %150
  %157 = add nsw i32 %148, 1
  br label %163

158:                                              ; preds = %152, %146
  %159 = add nsw i32 %148, -1
  %160 = add nsw i32 %147, 1
  %161 = add nsw i32 %147, %2
  %162 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %161
  store i32 %159, i32 addrspace(3)* %162, align 4, !tbaa !5
  br label %163

163:                                              ; preds = %158, %156
  %164 = phi i32 [ %160, %158 ], [ %147, %156 ]
  %165 = phi i32 [ %148, %158 ], [ %157, %156 ]
  %166 = icmp slt i32 %165, %2
  br i1 %166, label %167, label %175

167:                                              ; preds = %163
  %168 = icmp slt i32 %164, %0
  br i1 %168, label %169, label %173

169:                                              ; preds = %167
  %170 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %165
  %171 = load i32, i32 addrspace(3)* %170, align 4, !tbaa !5
  %172 = icmp slt i32 %164, %171
  br i1 %172, label %175, label %173

173:                                              ; preds = %169, %167
  %174 = add nsw i32 %165, 1
  br label %180

175:                                              ; preds = %169, %163
  %176 = add nsw i32 %165, -1
  %177 = add nsw i32 %164, 1
  %178 = add nsw i32 %164, %2
  %179 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %178
  store i32 %176, i32 addrspace(3)* %179, align 4, !tbaa !5
  br label %180

180:                                              ; preds = %175, %173
  %181 = phi i32 [ %177, %175 ], [ %164, %173 ]
  %182 = phi i32 [ %165, %175 ], [ %174, %173 ]
  %183 = icmp slt i32 %182, %2
  br i1 %183, label %184, label %192

184:                                              ; preds = %180
  %185 = icmp slt i32 %181, %0
  br i1 %185, label %186, label %190

186:                                              ; preds = %184
  %187 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %182
  %188 = load i32, i32 addrspace(3)* %187, align 4, !tbaa !5
  %189 = icmp slt i32 %181, %188
  br i1 %189, label %192, label %190

190:                                              ; preds = %186, %184
  %191 = add nsw i32 %182, 1
  br label %197

192:                                              ; preds = %186, %180
  %193 = add nsw i32 %182, -1
  %194 = add nsw i32 %181, 1
  %195 = add nsw i32 %181, %2
  %196 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %195
  store i32 %193, i32 addrspace(3)* %196, align 4, !tbaa !5
  br label %197

197:                                              ; preds = %192, %190
  %198 = phi i32 [ %194, %192 ], [ %181, %190 ]
  %199 = phi i32 [ %182, %192 ], [ %191, %190 ]
  %200 = icmp slt i32 %199, %2
  br i1 %200, label %201, label %209

201:                                              ; preds = %197
  %202 = icmp slt i32 %198, %0
  br i1 %202, label %203, label %207

203:                                              ; preds = %201
  %204 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %199
  %205 = load i32, i32 addrspace(3)* %204, align 4, !tbaa !5
  %206 = icmp slt i32 %198, %205
  br i1 %206, label %209, label %207

207:                                              ; preds = %203, %201
  %208 = add nsw i32 %199, 1
  br label %214

209:                                              ; preds = %203, %197
  %210 = add nsw i32 %199, -1
  %211 = add nsw i32 %198, 1
  %212 = add nsw i32 %198, %2
  %213 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %212
  store i32 %210, i32 addrspace(3)* %213, align 4, !tbaa !5
  br label %214

214:                                              ; preds = %209, %207
  %215 = phi i32 [ %211, %209 ], [ %198, %207 ]
  %216 = phi i32 [ %199, %209 ], [ %208, %207 ]
  %217 = icmp slt i32 %216, %2
  br i1 %217, label %218, label %226

218:                                              ; preds = %214
  %219 = icmp slt i32 %215, %0
  br i1 %219, label %220, label %224

220:                                              ; preds = %218
  %221 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %216
  %222 = load i32, i32 addrspace(3)* %221, align 4, !tbaa !5
  %223 = icmp slt i32 %215, %222
  br i1 %223, label %226, label %224

224:                                              ; preds = %220, %218
  %225 = add nsw i32 %216, 1
  br label %231

226:                                              ; preds = %220, %214
  %227 = add nsw i32 %216, -1
  %228 = add nsw i32 %215, 1
  %229 = add nsw i32 %215, %2
  %230 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %229
  store i32 %227, i32 addrspace(3)* %230, align 4, !tbaa !5
  br label %231

231:                                              ; preds = %226, %224
  %232 = phi i32 [ %228, %226 ], [ %215, %224 ]
  %233 = phi i32 [ %216, %226 ], [ %225, %224 ]
  %234 = icmp slt i32 %233, %2
  br i1 %234, label %235, label %241

235:                                              ; preds = %231
  %236 = icmp slt i32 %232, %0
  br i1 %236, label %237, label %245

237:                                              ; preds = %235
  %238 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %233
  %239 = load i32, i32 addrspace(3)* %238, align 4, !tbaa !5
  %240 = icmp slt i32 %232, %239
  br i1 %240, label %241, label %245

241:                                              ; preds = %237, %231
  %242 = add nsw i32 %233, -1
  %243 = add nsw i32 %232, %2
  %244 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %243
  store i32 %242, i32 addrspace(3)* %244, align 4, !tbaa !5
  br label %245

245:                                              ; preds = %235, %237, %241
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %246 = icmp slt i32 %5, %0
  br i1 %246, label %248, label %247

247:                                              ; preds = %248, %245
  ret void

248:                                              ; preds = %245, %248
  %249 = phi i32 [ %255, %248 ], [ %5, %245 ]
  %250 = add nsw i32 %249, %2
  %251 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15KernelLBSSimpleiPKiiPiE11data_shared, i32 0, i32 %250
  %252 = load i32, i32 addrspace(3)* %251, align 4, !tbaa !5
  %253 = zext i32 %249 to i64
  %254 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %253
  store i32 %252, i32 addrspace(1)* %254, align 4, !tbaa !5
  %255 = add nuw nsw i32 %249, 128
  %256 = icmp slt i32 %255, %0
  br i1 %256, label %248, label %247, !llvm.loop !12
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
