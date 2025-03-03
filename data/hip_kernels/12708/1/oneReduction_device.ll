; ModuleID = '../data/hip_kernels/12708/1/main.cu'
source_filename = "../data/hip_kernels/12708/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12oneReductionPiiiE5begin = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ12oneReductionPiiiE3end = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ12oneReductionPiiiE5tmp_T = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12oneReductionPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp eq i32 %4, 0
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br i1 %5, label %7, label %10

7:                                                ; preds = %3
  %8 = mul i32 %6, %1
  store i32 %8, i32 addrspace(3)* @_ZZ12oneReductionPiiiE5begin, align 4, !tbaa !5
  %9 = add i32 %8, %1
  store i32 %9, i32 addrspace(3)* @_ZZ12oneReductionPiiiE3end, align 4, !tbaa !5
  br label %10

10:                                               ; preds = %3, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %11 = urem i32 %6, %2
  %12 = sdiv i32 %2, 2
  %13 = icmp ult i32 %11, %12
  %14 = icmp sgt i32 %1, 2047
  br i1 %13, label %23, label %15

15:                                               ; preds = %10
  br i1 %14, label %16, label %213

16:                                               ; preds = %15
  %17 = icmp ult i32 %4, 512
  %18 = add nsw i32 %4, -512
  %19 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %4
  %20 = add nuw nsw i32 %4, 512
  %21 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %20
  %22 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE3end, align 4, !tbaa !5
  br label %274

23:                                               ; preds = %10
  br i1 %14, label %24, label %35

24:                                               ; preds = %23
  %25 = icmp ult i32 %4, 512
  %26 = add nsw i32 %4, -512
  %27 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %4
  %28 = add nuw nsw i32 %4, 512
  %29 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %28
  %30 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE3end, align 4, !tbaa !5
  br label %96

31:                                               ; preds = %114, %96
  %32 = phi i32 [ %97, %96 ], [ %115, %114 ]
  %33 = phi i32 [ %98, %96 ], [ %115, %114 ]
  %34 = icmp sgt i32 %99, 4095
  br i1 %34, label %96, label %35, !llvm.loop !9

35:                                               ; preds = %31, %23
  %36 = icmp sgt i32 %1, 0
  br i1 %36, label %37, label %387

37:                                               ; preds = %35
  %38 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE5begin, align 4, !tbaa !5
  %39 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %4
  %40 = icmp ult i32 %4, 512
  %41 = add nuw nsw i32 %4, 512
  %42 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %41
  %43 = and i32 %4, 256
  %44 = icmp ne i32 %43, 0
  %45 = icmp ugt i32 %4, 767
  %46 = add nuw nsw i32 %4, 256
  %47 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %46
  %48 = and i32 %4, 128
  %49 = icmp ne i32 %48, 0
  %50 = icmp ugt i32 %4, 895
  %51 = add nuw nsw i32 %4, 128
  %52 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %51
  %53 = and i32 %4, 64
  %54 = icmp ne i32 %53, 0
  %55 = icmp ugt i32 %4, 959
  %56 = add nuw nsw i32 %4, 64
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %56
  %58 = and i32 %4, 32
  %59 = icmp ne i32 %58, 0
  %60 = icmp ugt i32 %4, 991
  %61 = add nuw nsw i32 %4, 32
  %62 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %61
  %63 = and i32 %4, 16
  %64 = icmp ne i32 %63, 0
  %65 = icmp ugt i32 %4, 1007
  %66 = add nuw nsw i32 %4, 16
  %67 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %66
  %68 = and i32 %4, 8
  %69 = icmp ne i32 %68, 0
  %70 = icmp ugt i32 %4, 1015
  %71 = add nuw nsw i32 %4, 8
  %72 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %71
  %73 = and i32 %4, 4
  %74 = icmp ne i32 %73, 0
  %75 = icmp ugt i32 %4, 1019
  %76 = add nuw nsw i32 %4, 4
  %77 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %76
  %78 = and i32 %4, 2
  %79 = icmp ne i32 %78, 0
  %80 = icmp ugt i32 %4, 1021
  %81 = add nuw nsw i32 %4, 2
  %82 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %81
  %83 = add nuw nsw i32 %4, 1
  %84 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %83
  %85 = or i1 %44, %45
  %86 = or i1 %49, %50
  %87 = or i1 %54, %55
  %88 = or i1 %59, %60
  %89 = or i1 %64, %65
  %90 = or i1 %69, %70
  %91 = or i1 %74, %75
  %92 = or i1 %79, %80
  %93 = and i32 %4, 1
  %94 = icmp eq i32 %93, 0
  %95 = bitcast i32 addrspace(3)* %39 to <2 x i32> addrspace(3)*
  br label %137

96:                                               ; preds = %24, %31
  %97 = phi i32 [ %30, %24 ], [ %32, %31 ]
  %98 = phi i32 [ %30, %24 ], [ %33, %31 ]
  %99 = phi i32 [ %1, %24 ], [ %100, %31 ]
  %100 = sdiv i32 %99, 2
  %101 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE5begin, align 4, !tbaa !5
  %102 = icmp slt i32 %101, %98
  br i1 %102, label %103, label %31

103:                                              ; preds = %96
  %104 = add nsw i32 %26, %100
  %105 = shl nsw i32 %100, 1
  %106 = icmp sgt i32 %99, 1
  %107 = select i1 %25, i32 %4, i32 %104
  br label %108

108:                                              ; preds = %103, %114
  %109 = phi i32 [ %97, %103 ], [ %115, %114 ]
  %110 = phi i32 [ %101, %103 ], [ %116, %114 ]
  %111 = add nsw i32 %110, %100
  br i1 %106, label %118, label %114

112:                                              ; preds = %129
  %113 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE3end, align 4, !tbaa !5
  br label %114

114:                                              ; preds = %112, %108
  %115 = phi i32 [ %113, %112 ], [ %109, %108 ]
  %116 = add nsw i32 %110, %105
  %117 = icmp slt i32 %116, %115
  br i1 %117, label %108, label %31, !llvm.loop !11

118:                                              ; preds = %108, %129
  %119 = phi i32 [ %135, %129 ], [ %110, %108 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %120 = add i32 %119, %107
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !5
  store i32 %123, i32 addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %25, label %124, label %129

124:                                              ; preds = %118
  %125 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %126 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %127 = icmp sgt i32 %125, %126
  br i1 %127, label %128, label %129

128:                                              ; preds = %124
  store i32 %125, i32 addrspace(3)* %29, align 4, !tbaa !5
  store i32 %126, i32 addrspace(3)* %27, align 4, !tbaa !5
  br label %129

129:                                              ; preds = %128, %124, %118
  %130 = phi i32 [ %4, %128 ], [ %4, %124 ], [ %104, %118 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %131 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %132 = add i32 %119, %130
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %133
  store i32 %131, i32 addrspace(1)* %134, align 4, !tbaa !5
  %135 = add nsw i32 %119, 512
  %136 = icmp slt i32 %135, %111
  br i1 %136, label %118, label %112, !llvm.loop !12

137:                                              ; preds = %37, %203
  %138 = phi i32 [ %38, %37 ], [ %205, %203 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %139 = add i32 %138, %4
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !5
  store i32 %142, i32 addrspace(3)* %39, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %40, label %143, label %148

143:                                              ; preds = %137
  %144 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %145 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %146 = icmp sgt i32 %144, %145
  br i1 %146, label %147, label %148

147:                                              ; preds = %143
  store i32 %144, i32 addrspace(3)* %42, align 4, !tbaa !5
  store i32 %145, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %148

148:                                              ; preds = %147, %143, %137
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %85, label %154, label %149

149:                                              ; preds = %148
  %150 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %151 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !5
  %152 = icmp sgt i32 %150, %151
  br i1 %152, label %153, label %154

153:                                              ; preds = %149
  store i32 %150, i32 addrspace(3)* %47, align 4, !tbaa !5
  store i32 %151, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %154

154:                                              ; preds = %148, %153, %149
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %86, label %160, label %155

155:                                              ; preds = %154
  %156 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %157 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %158 = icmp sgt i32 %156, %157
  br i1 %158, label %159, label %160

159:                                              ; preds = %155
  store i32 %156, i32 addrspace(3)* %52, align 4, !tbaa !5
  store i32 %157, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %160

160:                                              ; preds = %154, %159, %155
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %87, label %166, label %161

161:                                              ; preds = %160
  %162 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %163 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !5
  %164 = icmp sgt i32 %162, %163
  br i1 %164, label %165, label %166

165:                                              ; preds = %161
  store i32 %162, i32 addrspace(3)* %57, align 4, !tbaa !5
  store i32 %163, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %166

166:                                              ; preds = %160, %165, %161
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %88, label %172, label %167

167:                                              ; preds = %166
  %168 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %169 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !5
  %170 = icmp sgt i32 %168, %169
  br i1 %170, label %171, label %172

171:                                              ; preds = %167
  store i32 %168, i32 addrspace(3)* %62, align 4, !tbaa !5
  store i32 %169, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %172

172:                                              ; preds = %166, %171, %167
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %89, label %178, label %173

173:                                              ; preds = %172
  %174 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %175 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %176 = icmp sgt i32 %174, %175
  br i1 %176, label %177, label %178

177:                                              ; preds = %173
  store i32 %174, i32 addrspace(3)* %67, align 4, !tbaa !5
  store i32 %175, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %178

178:                                              ; preds = %172, %177, %173
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %90, label %184, label %179

179:                                              ; preds = %178
  %180 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %181 = load i32, i32 addrspace(3)* %72, align 4, !tbaa !5
  %182 = icmp sgt i32 %180, %181
  br i1 %182, label %183, label %184

183:                                              ; preds = %179
  store i32 %180, i32 addrspace(3)* %72, align 4, !tbaa !5
  store i32 %181, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %184

184:                                              ; preds = %178, %183, %179
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %91, label %190, label %185

185:                                              ; preds = %184
  %186 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %187 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %188 = icmp sgt i32 %186, %187
  br i1 %188, label %189, label %190

189:                                              ; preds = %185
  store i32 %186, i32 addrspace(3)* %77, align 4, !tbaa !5
  store i32 %187, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %190

190:                                              ; preds = %184, %189, %185
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %92, label %196, label %191

191:                                              ; preds = %190
  %192 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %193 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !5
  %194 = icmp sgt i32 %192, %193
  br i1 %194, label %195, label %196

195:                                              ; preds = %191
  store i32 %192, i32 addrspace(3)* %82, align 4, !tbaa !5
  store i32 %193, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %196

196:                                              ; preds = %190, %195, %191
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %94, label %197, label %203

197:                                              ; preds = %196
  %198 = load <2 x i32>, <2 x i32> addrspace(3)* %95, align 4, !tbaa !5
  %199 = extractelement <2 x i32> %198, i64 0
  %200 = extractelement <2 x i32> %198, i64 1
  %201 = icmp sgt i32 %199, %200
  br i1 %201, label %202, label %203

202:                                              ; preds = %197
  store i32 %199, i32 addrspace(3)* %84, align 4, !tbaa !5
  store i32 %200, i32 addrspace(3)* %39, align 4, !tbaa !5
  br label %203

203:                                              ; preds = %196, %202, %197
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %204 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  store i32 %204, i32 addrspace(1)* %141, align 4, !tbaa !5
  %205 = add nsw i32 %138, 1024
  %206 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE5begin, align 4, !tbaa !5
  %207 = add nsw i32 %206, %1
  %208 = icmp slt i32 %205, %207
  br i1 %208, label %137, label %387, !llvm.loop !13

209:                                              ; preds = %292, %274
  %210 = phi i32 [ %275, %274 ], [ %293, %292 ]
  %211 = phi i32 [ %276, %274 ], [ %293, %292 ]
  %212 = icmp sgt i32 %277, 4095
  br i1 %212, label %274, label %213, !llvm.loop !14

213:                                              ; preds = %209, %15
  %214 = icmp sgt i32 %1, 0
  br i1 %214, label %215, label %387

215:                                              ; preds = %213
  %216 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE5begin, align 4, !tbaa !5
  %217 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %4
  %218 = icmp ult i32 %4, 512
  %219 = add nuw nsw i32 %4, 512
  %220 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %219
  %221 = and i32 %4, 256
  %222 = icmp ne i32 %221, 0
  %223 = icmp ugt i32 %4, 767
  %224 = add nuw nsw i32 %4, 256
  %225 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %224
  %226 = and i32 %4, 128
  %227 = icmp ne i32 %226, 0
  %228 = icmp ugt i32 %4, 895
  %229 = add nuw nsw i32 %4, 128
  %230 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %229
  %231 = and i32 %4, 64
  %232 = icmp ne i32 %231, 0
  %233 = icmp ugt i32 %4, 959
  %234 = add nuw nsw i32 %4, 64
  %235 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %234
  %236 = and i32 %4, 32
  %237 = icmp ne i32 %236, 0
  %238 = icmp ugt i32 %4, 991
  %239 = add nuw nsw i32 %4, 32
  %240 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %239
  %241 = and i32 %4, 16
  %242 = icmp ne i32 %241, 0
  %243 = icmp ugt i32 %4, 1007
  %244 = add nuw nsw i32 %4, 16
  %245 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %244
  %246 = and i32 %4, 8
  %247 = icmp ne i32 %246, 0
  %248 = icmp ugt i32 %4, 1015
  %249 = add nuw nsw i32 %4, 8
  %250 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %249
  %251 = and i32 %4, 4
  %252 = icmp ne i32 %251, 0
  %253 = icmp ugt i32 %4, 1019
  %254 = add nuw nsw i32 %4, 4
  %255 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %254
  %256 = and i32 %4, 2
  %257 = icmp ne i32 %256, 0
  %258 = icmp ugt i32 %4, 1021
  %259 = add nuw nsw i32 %4, 2
  %260 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %259
  %261 = add nuw nsw i32 %4, 1
  %262 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ12oneReductionPiiiE5tmp_T, i32 0, i32 %261
  %263 = or i1 %222, %223
  %264 = or i1 %227, %228
  %265 = or i1 %232, %233
  %266 = or i1 %237, %238
  %267 = or i1 %242, %243
  %268 = or i1 %247, %248
  %269 = or i1 %252, %253
  %270 = or i1 %257, %258
  %271 = and i32 %4, 1
  %272 = icmp eq i32 %271, 0
  %273 = bitcast i32 addrspace(3)* %217 to <2 x i32> addrspace(3)*
  br label %315

274:                                              ; preds = %16, %209
  %275 = phi i32 [ %22, %16 ], [ %210, %209 ]
  %276 = phi i32 [ %22, %16 ], [ %211, %209 ]
  %277 = phi i32 [ %1, %16 ], [ %278, %209 ]
  %278 = sdiv i32 %277, 2
  %279 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE5begin, align 4, !tbaa !5
  %280 = icmp slt i32 %279, %276
  br i1 %280, label %281, label %209

281:                                              ; preds = %274
  %282 = add nsw i32 %18, %278
  %283 = shl nsw i32 %278, 1
  %284 = icmp sgt i32 %277, 1
  %285 = select i1 %17, i32 %4, i32 %282
  br label %286

286:                                              ; preds = %281, %292
  %287 = phi i32 [ %275, %281 ], [ %293, %292 ]
  %288 = phi i32 [ %279, %281 ], [ %294, %292 ]
  %289 = add nsw i32 %288, %278
  br i1 %284, label %296, label %292

290:                                              ; preds = %307
  %291 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE3end, align 4, !tbaa !5
  br label %292

292:                                              ; preds = %290, %286
  %293 = phi i32 [ %291, %290 ], [ %287, %286 ]
  %294 = add nsw i32 %288, %283
  %295 = icmp slt i32 %294, %293
  br i1 %295, label %286, label %209, !llvm.loop !15

296:                                              ; preds = %286, %307
  %297 = phi i32 [ %313, %307 ], [ %288, %286 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %298 = add i32 %297, %285
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %299
  %301 = load i32, i32 addrspace(1)* %300, align 4, !tbaa !5
  store i32 %301, i32 addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %17, label %302, label %307

302:                                              ; preds = %296
  %303 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !5
  %304 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !5
  %305 = icmp slt i32 %303, %304
  br i1 %305, label %306, label %307

306:                                              ; preds = %302
  store i32 %303, i32 addrspace(3)* %21, align 4, !tbaa !5
  store i32 %304, i32 addrspace(3)* %19, align 4, !tbaa !5
  br label %307

307:                                              ; preds = %306, %302, %296
  %308 = phi i32 [ %4, %306 ], [ %4, %302 ], [ %282, %296 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %309 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !5
  %310 = add i32 %297, %308
  %311 = zext i32 %310 to i64
  %312 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %311
  store i32 %309, i32 addrspace(1)* %312, align 4, !tbaa !5
  %313 = add nsw i32 %297, 512
  %314 = icmp slt i32 %313, %289
  br i1 %314, label %296, label %290, !llvm.loop !16

315:                                              ; preds = %215, %381
  %316 = phi i32 [ %216, %215 ], [ %383, %381 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %317 = add i32 %316, %4
  %318 = zext i32 %317 to i64
  %319 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %318
  %320 = load i32, i32 addrspace(1)* %319, align 4, !tbaa !5
  store i32 %320, i32 addrspace(3)* %217, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %218, label %321, label %326

321:                                              ; preds = %315
  %322 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %323 = load i32, i32 addrspace(3)* %220, align 4, !tbaa !5
  %324 = icmp slt i32 %322, %323
  br i1 %324, label %325, label %326

325:                                              ; preds = %321
  store i32 %322, i32 addrspace(3)* %220, align 4, !tbaa !5
  store i32 %323, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %326

326:                                              ; preds = %325, %321, %315
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %263, label %332, label %327

327:                                              ; preds = %326
  %328 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %329 = load i32, i32 addrspace(3)* %225, align 4, !tbaa !5
  %330 = icmp slt i32 %328, %329
  br i1 %330, label %331, label %332

331:                                              ; preds = %327
  store i32 %328, i32 addrspace(3)* %225, align 4, !tbaa !5
  store i32 %329, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %332

332:                                              ; preds = %326, %331, %327
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %264, label %338, label %333

333:                                              ; preds = %332
  %334 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %335 = load i32, i32 addrspace(3)* %230, align 4, !tbaa !5
  %336 = icmp slt i32 %334, %335
  br i1 %336, label %337, label %338

337:                                              ; preds = %333
  store i32 %334, i32 addrspace(3)* %230, align 4, !tbaa !5
  store i32 %335, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %338

338:                                              ; preds = %332, %337, %333
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %265, label %344, label %339

339:                                              ; preds = %338
  %340 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %341 = load i32, i32 addrspace(3)* %235, align 4, !tbaa !5
  %342 = icmp slt i32 %340, %341
  br i1 %342, label %343, label %344

343:                                              ; preds = %339
  store i32 %340, i32 addrspace(3)* %235, align 4, !tbaa !5
  store i32 %341, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %344

344:                                              ; preds = %338, %343, %339
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %266, label %350, label %345

345:                                              ; preds = %344
  %346 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %347 = load i32, i32 addrspace(3)* %240, align 4, !tbaa !5
  %348 = icmp slt i32 %346, %347
  br i1 %348, label %349, label %350

349:                                              ; preds = %345
  store i32 %346, i32 addrspace(3)* %240, align 4, !tbaa !5
  store i32 %347, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %350

350:                                              ; preds = %344, %349, %345
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %267, label %356, label %351

351:                                              ; preds = %350
  %352 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %353 = load i32, i32 addrspace(3)* %245, align 4, !tbaa !5
  %354 = icmp slt i32 %352, %353
  br i1 %354, label %355, label %356

355:                                              ; preds = %351
  store i32 %352, i32 addrspace(3)* %245, align 4, !tbaa !5
  store i32 %353, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %356

356:                                              ; preds = %350, %355, %351
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %268, label %362, label %357

357:                                              ; preds = %356
  %358 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %359 = load i32, i32 addrspace(3)* %250, align 4, !tbaa !5
  %360 = icmp slt i32 %358, %359
  br i1 %360, label %361, label %362

361:                                              ; preds = %357
  store i32 %358, i32 addrspace(3)* %250, align 4, !tbaa !5
  store i32 %359, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %362

362:                                              ; preds = %356, %361, %357
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %269, label %368, label %363

363:                                              ; preds = %362
  %364 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %365 = load i32, i32 addrspace(3)* %255, align 4, !tbaa !5
  %366 = icmp slt i32 %364, %365
  br i1 %366, label %367, label %368

367:                                              ; preds = %363
  store i32 %364, i32 addrspace(3)* %255, align 4, !tbaa !5
  store i32 %365, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %368

368:                                              ; preds = %362, %367, %363
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %270, label %374, label %369

369:                                              ; preds = %368
  %370 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  %371 = load i32, i32 addrspace(3)* %260, align 4, !tbaa !5
  %372 = icmp slt i32 %370, %371
  br i1 %372, label %373, label %374

373:                                              ; preds = %369
  store i32 %370, i32 addrspace(3)* %260, align 4, !tbaa !5
  store i32 %371, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %374

374:                                              ; preds = %368, %373, %369
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %272, label %375, label %381

375:                                              ; preds = %374
  %376 = load <2 x i32>, <2 x i32> addrspace(3)* %273, align 4, !tbaa !5
  %377 = extractelement <2 x i32> %376, i64 0
  %378 = extractelement <2 x i32> %376, i64 1
  %379 = icmp slt i32 %377, %378
  br i1 %379, label %380, label %381

380:                                              ; preds = %375
  store i32 %377, i32 addrspace(3)* %262, align 4, !tbaa !5
  store i32 %378, i32 addrspace(3)* %217, align 4, !tbaa !5
  br label %381

381:                                              ; preds = %374, %380, %375
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %382 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !5
  store i32 %382, i32 addrspace(1)* %319, align 4, !tbaa !5
  %383 = add nsw i32 %316, 1024
  %384 = load i32, i32 addrspace(3)* @_ZZ12oneReductionPiiiE5begin, align 4, !tbaa !5
  %385 = add nsw i32 %384, %1
  %386 = icmp slt i32 %383, %385
  br i1 %386, label %315, label %387, !llvm.loop !17

387:                                              ; preds = %381, %203, %213, %35
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
