; ModuleID = '../data/hip_kernels/1169/24/main.cu'
source_filename = "../data/hip_kernels/1169/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21erosionLayers3DKernelPtS_iiiiE4smem = internal unnamed_addr addrspace(3) global [8 x [8 x [25 x i16]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21erosionLayers3DKernelPtS_iiii(i16 addrspace(1)* nocapture writeonly %0, i16 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 3
  %11 = add i32 %10, %7
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = shl i32 %12, 3
  %14 = add i32 %13, %8
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %16 = shl i32 %15, 3
  %17 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %18 = add nsw i32 %17, -8
  %19 = add i32 %18, %16
  %20 = mul nsw i32 %19, %3
  %21 = add nsw i32 %14, %20
  %22 = mul nsw i32 %21, %2
  %23 = add nsw i32 %11, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %24
  %26 = mul nsw i32 %3, %2
  %27 = shl nsw i32 %26, 3
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %28
  %30 = load i16, i16 addrspace(1)* %29, align 2, !tbaa !5, !amdgpu.noclobber !9
  %31 = add nuw nsw i32 %17, 8
  %32 = getelementptr inbounds [8 x [8 x [25 x i16]]], [8 x [8 x [25 x i16]]] addrspace(3)* @_ZZ21erosionLayers3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %31
  store i16 %30, i16 addrspace(3)* %32, align 2, !tbaa !5
  %33 = mul nsw i32 %26, 12
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %34
  %36 = load i16, i16 addrspace(1)* %35, align 2, !tbaa !5, !amdgpu.noclobber !9
  %37 = add nuw nsw i32 %17, 12
  %38 = getelementptr inbounds [8 x [8 x [25 x i16]]], [8 x [8 x [25 x i16]]] addrspace(3)* @_ZZ21erosionLayers3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %37
  store i16 %36, i16 addrspace(3)* %38, align 2, !tbaa !5
  %39 = icmp sgt i32 %19, -1
  br i1 %39, label %40, label %42

40:                                               ; preds = %6
  %41 = load i16, i16 addrspace(1)* %25, align 2, !tbaa !5, !amdgpu.noclobber !9
  br label %42

42:                                               ; preds = %6, %40
  %43 = phi i16 [ %41, %40 ], [ 0, %6 ]
  %44 = getelementptr inbounds [8 x [8 x [25 x i16]]], [8 x [8 x [25 x i16]]] addrspace(3)* @_ZZ21erosionLayers3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %17
  store i16 %43, i16 addrspace(3)* %44, align 2, !tbaa !5
  %45 = icmp sgt i32 %19, -5
  br i1 %45, label %46, label %51

46:                                               ; preds = %42
  %47 = shl nsw i32 %26, 2
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %48
  %50 = load i16, i16 addrspace(1)* %49, align 2, !tbaa !5, !amdgpu.noclobber !9
  br label %51

51:                                               ; preds = %46, %42
  %52 = phi i16 [ %50, %46 ], [ 0, %42 ]
  %53 = add nuw nsw i32 %17, 4
  %54 = getelementptr inbounds [8 x [8 x [25 x i16]]], [8 x [8 x [25 x i16]]] addrspace(3)* @_ZZ21erosionLayers3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %53
  store i16 %52, i16 addrspace(3)* %54, align 2, !tbaa !5
  %55 = add nsw i32 %19, 16
  %56 = icmp slt i32 %55, %4
  br i1 %56, label %57, label %62

57:                                               ; preds = %51
  %58 = shl nsw i32 %26, 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %59
  %61 = load i16, i16 addrspace(1)* %60, align 2, !tbaa !5, !amdgpu.noclobber !9
  br label %62

62:                                               ; preds = %51, %57
  %63 = phi i16 [ %61, %57 ], [ 0, %51 ]
  %64 = add nuw nsw i32 %17, 16
  %65 = getelementptr inbounds [8 x [8 x [25 x i16]]], [8 x [8 x [25 x i16]]] addrspace(3)* @_ZZ21erosionLayers3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %64
  store i16 %63, i16 addrspace(3)* %65, align 2, !tbaa !5
  %66 = add nsw i32 %19, 20
  %67 = icmp slt i32 %66, %4
  br i1 %67, label %68, label %73

68:                                               ; preds = %62
  %69 = mul nsw i32 %26, 20
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %70
  %72 = load i16, i16 addrspace(1)* %71, align 2, !tbaa !5, !amdgpu.noclobber !9
  br label %73

73:                                               ; preds = %68, %62
  %74 = phi i16 [ %72, %68 ], [ 0, %62 ]
  %75 = add nuw nsw i32 %17, 20
  %76 = getelementptr inbounds [8 x [8 x [25 x i16]]], [8 x [8 x [25 x i16]]] addrspace(3)* @_ZZ21erosionLayers3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %75
  store i16 %74, i16 addrspace(3)* %76, align 2, !tbaa !5
  %77 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = sub i32 %17, %5
  %79 = shl i32 %5, 1
  %80 = icmp slt i32 %5, 1
  %81 = tail call i32 @llvm.smax.i32(i32 %79, i32 1)
  %82 = add i32 %78, 8
  %83 = getelementptr inbounds [8 x [8 x [25 x i16]]], [8 x [8 x [25 x i16]]] addrspace(3)* @_ZZ21erosionLayers3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %82
  %84 = load i16, i16 addrspace(3)* %83, align 2, !tbaa !5
  br i1 %80, label %170, label %85

85:                                               ; preds = %73
  %86 = icmp ult i32 %81, 2
  br i1 %86, label %167, label %87

87:                                               ; preds = %85
  %88 = and i32 %81, 2147483646
  %89 = or i32 %81, 1
  %90 = insertelement <2 x i16> poison, i16 %84, i64 0
  %91 = shufflevector <2 x i16> %90, <2 x i16> poison, <2 x i32> zeroinitializer
  %92 = add nsw i32 %81, -2
  %93 = lshr i32 %92, 1
  %94 = add nuw i32 %93, 1
  %95 = and i32 %94, 7
  %96 = icmp ult i32 %92, 14
  br i1 %96, label %146, label %97

97:                                               ; preds = %87
  %98 = and i32 %94, -8
  br label %99

99:                                               ; preds = %99, %97
  %100 = phi i32 [ 0, %97 ], [ %143, %99 ]
  %101 = phi <2 x i16> [ %91, %97 ], [ %142, %99 ]
  %102 = phi i32 [ 0, %97 ], [ %144, %99 ]
  %103 = or i32 %100, 1
  %104 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %103
  %105 = bitcast i16 addrspace(3)* %104 to <2 x i16> addrspace(3)*
  %106 = load <2 x i16>, <2 x i16> addrspace(3)* %105, align 2, !tbaa !5
  %107 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %101, <2 x i16> %106)
  %108 = or i32 %100, 3
  %109 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %108
  %110 = bitcast i16 addrspace(3)* %109 to <2 x i16> addrspace(3)*
  %111 = load <2 x i16>, <2 x i16> addrspace(3)* %110, align 2, !tbaa !5
  %112 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %107, <2 x i16> %111)
  %113 = or i32 %100, 5
  %114 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %113
  %115 = bitcast i16 addrspace(3)* %114 to <2 x i16> addrspace(3)*
  %116 = load <2 x i16>, <2 x i16> addrspace(3)* %115, align 2, !tbaa !5
  %117 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %112, <2 x i16> %116)
  %118 = or i32 %100, 7
  %119 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %118
  %120 = bitcast i16 addrspace(3)* %119 to <2 x i16> addrspace(3)*
  %121 = load <2 x i16>, <2 x i16> addrspace(3)* %120, align 2, !tbaa !5
  %122 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %117, <2 x i16> %121)
  %123 = or i32 %100, 9
  %124 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %123
  %125 = bitcast i16 addrspace(3)* %124 to <2 x i16> addrspace(3)*
  %126 = load <2 x i16>, <2 x i16> addrspace(3)* %125, align 2, !tbaa !5
  %127 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %122, <2 x i16> %126)
  %128 = or i32 %100, 11
  %129 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %128
  %130 = bitcast i16 addrspace(3)* %129 to <2 x i16> addrspace(3)*
  %131 = load <2 x i16>, <2 x i16> addrspace(3)* %130, align 2, !tbaa !5
  %132 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %127, <2 x i16> %131)
  %133 = or i32 %100, 13
  %134 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %133
  %135 = bitcast i16 addrspace(3)* %134 to <2 x i16> addrspace(3)*
  %136 = load <2 x i16>, <2 x i16> addrspace(3)* %135, align 2, !tbaa !5
  %137 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %132, <2 x i16> %136)
  %138 = or i32 %100, 15
  %139 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %138
  %140 = bitcast i16 addrspace(3)* %139 to <2 x i16> addrspace(3)*
  %141 = load <2 x i16>, <2 x i16> addrspace(3)* %140, align 2, !tbaa !5
  %142 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %137, <2 x i16> %141)
  %143 = add nuw i32 %100, 16
  %144 = add i32 %102, 8
  %145 = icmp eq i32 %144, %98
  br i1 %145, label %146, label %99, !llvm.loop !10

146:                                              ; preds = %99, %87
  %147 = phi <2 x i16> [ undef, %87 ], [ %142, %99 ]
  %148 = phi i32 [ 0, %87 ], [ %143, %99 ]
  %149 = phi <2 x i16> [ %91, %87 ], [ %142, %99 ]
  %150 = icmp eq i32 %95, 0
  br i1 %150, label %163, label %151

151:                                              ; preds = %146, %151
  %152 = phi i32 [ %160, %151 ], [ %148, %146 ]
  %153 = phi <2 x i16> [ %159, %151 ], [ %149, %146 ]
  %154 = phi i32 [ %161, %151 ], [ 0, %146 ]
  %155 = or i32 %152, 1
  %156 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %155
  %157 = bitcast i16 addrspace(3)* %156 to <2 x i16> addrspace(3)*
  %158 = load <2 x i16>, <2 x i16> addrspace(3)* %157, align 2, !tbaa !5
  %159 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %153, <2 x i16> %158)
  %160 = add nuw i32 %152, 2
  %161 = add i32 %154, 1
  %162 = icmp eq i32 %161, %95
  br i1 %162, label %163, label %151, !llvm.loop !13

163:                                              ; preds = %151, %146
  %164 = phi <2 x i16> [ %147, %146 ], [ %159, %151 ]
  %165 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %164)
  %166 = icmp eq i32 %81, %88
  br i1 %166, label %170, label %167

167:                                              ; preds = %85, %163
  %168 = phi i32 [ 1, %85 ], [ %89, %163 ]
  %169 = phi i16 [ %84, %85 ], [ %165, %163 ]
  br label %272

170:                                              ; preds = %272, %163, %73
  %171 = phi i16 [ %84, %73 ], [ %165, %163 ], [ %277, %272 ]
  %172 = getelementptr inbounds i16, i16 addrspace(1)* %77, i64 %28
  store i16 %171, i16 addrspace(1)* %172, align 2, !tbaa !5
  %173 = add i32 %78, 12
  %174 = getelementptr inbounds [8 x [8 x [25 x i16]]], [8 x [8 x [25 x i16]]] addrspace(3)* @_ZZ21erosionLayers3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %173
  %175 = load i16, i16 addrspace(3)* %174, align 2, !tbaa !5
  br i1 %80, label %269, label %176

176:                                              ; preds = %170
  %177 = icmp ult i32 %81, 2
  br i1 %177, label %258, label %178

178:                                              ; preds = %176
  %179 = and i32 %81, 2147483646
  %180 = or i32 %81, 1
  %181 = insertelement <2 x i16> poison, i16 %175, i64 0
  %182 = shufflevector <2 x i16> %181, <2 x i16> poison, <2 x i32> zeroinitializer
  %183 = add nsw i32 %81, -2
  %184 = lshr i32 %183, 1
  %185 = add nuw i32 %184, 1
  %186 = and i32 %185, 7
  %187 = icmp ult i32 %183, 14
  br i1 %187, label %237, label %188

188:                                              ; preds = %178
  %189 = and i32 %185, -8
  br label %190

190:                                              ; preds = %190, %188
  %191 = phi i32 [ 0, %188 ], [ %234, %190 ]
  %192 = phi <2 x i16> [ %182, %188 ], [ %233, %190 ]
  %193 = phi i32 [ 0, %188 ], [ %235, %190 ]
  %194 = or i32 %191, 1
  %195 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %194
  %196 = bitcast i16 addrspace(3)* %195 to <2 x i16> addrspace(3)*
  %197 = load <2 x i16>, <2 x i16> addrspace(3)* %196, align 2, !tbaa !5
  %198 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %192, <2 x i16> %197)
  %199 = or i32 %191, 3
  %200 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %199
  %201 = bitcast i16 addrspace(3)* %200 to <2 x i16> addrspace(3)*
  %202 = load <2 x i16>, <2 x i16> addrspace(3)* %201, align 2, !tbaa !5
  %203 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %198, <2 x i16> %202)
  %204 = or i32 %191, 5
  %205 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %204
  %206 = bitcast i16 addrspace(3)* %205 to <2 x i16> addrspace(3)*
  %207 = load <2 x i16>, <2 x i16> addrspace(3)* %206, align 2, !tbaa !5
  %208 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %203, <2 x i16> %207)
  %209 = or i32 %191, 7
  %210 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %209
  %211 = bitcast i16 addrspace(3)* %210 to <2 x i16> addrspace(3)*
  %212 = load <2 x i16>, <2 x i16> addrspace(3)* %211, align 2, !tbaa !5
  %213 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %208, <2 x i16> %212)
  %214 = or i32 %191, 9
  %215 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %214
  %216 = bitcast i16 addrspace(3)* %215 to <2 x i16> addrspace(3)*
  %217 = load <2 x i16>, <2 x i16> addrspace(3)* %216, align 2, !tbaa !5
  %218 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %213, <2 x i16> %217)
  %219 = or i32 %191, 11
  %220 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %219
  %221 = bitcast i16 addrspace(3)* %220 to <2 x i16> addrspace(3)*
  %222 = load <2 x i16>, <2 x i16> addrspace(3)* %221, align 2, !tbaa !5
  %223 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %218, <2 x i16> %222)
  %224 = or i32 %191, 13
  %225 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %224
  %226 = bitcast i16 addrspace(3)* %225 to <2 x i16> addrspace(3)*
  %227 = load <2 x i16>, <2 x i16> addrspace(3)* %226, align 2, !tbaa !5
  %228 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %223, <2 x i16> %227)
  %229 = or i32 %191, 15
  %230 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %229
  %231 = bitcast i16 addrspace(3)* %230 to <2 x i16> addrspace(3)*
  %232 = load <2 x i16>, <2 x i16> addrspace(3)* %231, align 2, !tbaa !5
  %233 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %228, <2 x i16> %232)
  %234 = add nuw i32 %191, 16
  %235 = add i32 %193, 8
  %236 = icmp eq i32 %235, %189
  br i1 %236, label %237, label %190, !llvm.loop !15

237:                                              ; preds = %190, %178
  %238 = phi <2 x i16> [ undef, %178 ], [ %233, %190 ]
  %239 = phi i32 [ 0, %178 ], [ %234, %190 ]
  %240 = phi <2 x i16> [ %182, %178 ], [ %233, %190 ]
  %241 = icmp eq i32 %186, 0
  br i1 %241, label %254, label %242

242:                                              ; preds = %237, %242
  %243 = phi i32 [ %251, %242 ], [ %239, %237 ]
  %244 = phi <2 x i16> [ %250, %242 ], [ %240, %237 ]
  %245 = phi i32 [ %252, %242 ], [ 0, %237 ]
  %246 = or i32 %243, 1
  %247 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %246
  %248 = bitcast i16 addrspace(3)* %247 to <2 x i16> addrspace(3)*
  %249 = load <2 x i16>, <2 x i16> addrspace(3)* %248, align 2, !tbaa !5
  %250 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %244, <2 x i16> %249)
  %251 = add nuw i32 %243, 2
  %252 = add i32 %245, 1
  %253 = icmp eq i32 %252, %186
  br i1 %253, label %254, label %242, !llvm.loop !16

254:                                              ; preds = %242, %237
  %255 = phi <2 x i16> [ %238, %237 ], [ %250, %242 ]
  %256 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %255)
  %257 = icmp eq i32 %81, %179
  br i1 %257, label %269, label %258

258:                                              ; preds = %176, %254
  %259 = phi i32 [ 1, %176 ], [ %180, %254 ]
  %260 = phi i16 [ %175, %176 ], [ %256, %254 ]
  br label %261

261:                                              ; preds = %258, %261
  %262 = phi i32 [ %267, %261 ], [ %259, %258 ]
  %263 = phi i16 [ %266, %261 ], [ %260, %258 ]
  %264 = getelementptr inbounds i16, i16 addrspace(3)* %174, i32 %262
  %265 = load i16, i16 addrspace(3)* %264, align 2, !tbaa !5
  %266 = tail call i16 @llvm.umin.i16(i16 %263, i16 %265)
  %267 = add nuw nsw i32 %262, 1
  %268 = icmp eq i32 %262, %81
  br i1 %268, label %269, label %261, !llvm.loop !17

269:                                              ; preds = %261, %254, %170
  %270 = phi i16 [ %175, %170 ], [ %256, %254 ], [ %266, %261 ]
  %271 = getelementptr inbounds i16, i16 addrspace(1)* %77, i64 %34
  store i16 %270, i16 addrspace(1)* %271, align 2, !tbaa !5
  ret void

272:                                              ; preds = %167, %272
  %273 = phi i32 [ %278, %272 ], [ %168, %167 ]
  %274 = phi i16 [ %277, %272 ], [ %169, %167 ]
  %275 = getelementptr inbounds i16, i16 addrspace(3)* %83, i32 %273
  %276 = load i16, i16 addrspace(3)* %275, align 2, !tbaa !5
  %277 = tail call i16 @llvm.umin.i16(i16 %274, i16 %276)
  %278 = add nuw nsw i32 %273, 1
  %279 = icmp eq i32 %273, %81
  br i1 %279, label %170, label %272, !llvm.loop !19
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.umin.i16(i16, i16) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <2 x i16> @llvm.umin.v2i16(<2 x i16>, <2 x i16>) #3

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i16 @llvm.vector.reduce.umin.v2i16(<2 x i16>) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !11, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !11, !18, !12}
!18 = !{!"llvm.loop.unroll.runtime.disable"}
!19 = distinct !{!19, !11, !18, !12}
