; ModuleID = '../data/hip_kernels/1169/23/main.cu'
source_filename = "../data/hip_kernels/1169/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22erosionColumns3DKernelPtS_iiiiE4smem = internal unnamed_addr addrspace(3) global [4 x [4 x [177 x i16]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22erosionColumns3DKernelPtS_iiii(i16 addrspace(1)* nocapture writeonly %0, i16 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 2
  %11 = add i32 %10, %8
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = mul i32 %12, 144
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = add nsw i32 %14, -16
  %16 = add i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %18 = shl i32 %17, 2
  %19 = add i32 %18, %7
  %20 = mul nsw i32 %19, %3
  %21 = add nsw i32 %20, %16
  %22 = mul nsw i32 %21, %2
  %23 = add nsw i32 %11, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %24
  %26 = shl nsw i32 %2, 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %27
  %29 = load i16, i16 addrspace(1)* %28, align 2, !tbaa !5, !amdgpu.noclobber !9
  %30 = add nuw nsw i32 %14, 16
  %31 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %30
  store i16 %29, i16 addrspace(3)* %31, align 2, !tbaa !5
  %32 = shl nsw i32 %2, 5
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %33
  %35 = load i16, i16 addrspace(1)* %34, align 2, !tbaa !5, !amdgpu.noclobber !9
  %36 = add nuw nsw i32 %14, 32
  %37 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %36
  store i16 %35, i16 addrspace(3)* %37, align 2, !tbaa !5
  %38 = mul nsw i32 %2, 48
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %39
  %41 = load i16, i16 addrspace(1)* %40, align 2, !tbaa !5, !amdgpu.noclobber !9
  %42 = add nuw nsw i32 %14, 48
  %43 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %42
  store i16 %41, i16 addrspace(3)* %43, align 2, !tbaa !5
  %44 = shl nsw i32 %2, 6
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %45
  %47 = load i16, i16 addrspace(1)* %46, align 2, !tbaa !5, !amdgpu.noclobber !9
  %48 = add nuw nsw i32 %14, 64
  %49 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %48
  store i16 %47, i16 addrspace(3)* %49, align 2, !tbaa !5
  %50 = mul nsw i32 %2, 80
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %51
  %53 = load i16, i16 addrspace(1)* %52, align 2, !tbaa !5, !amdgpu.noclobber !9
  %54 = add nuw nsw i32 %14, 80
  %55 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %54
  store i16 %53, i16 addrspace(3)* %55, align 2, !tbaa !5
  %56 = mul nsw i32 %2, 96
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %57
  %59 = load i16, i16 addrspace(1)* %58, align 2, !tbaa !5, !amdgpu.noclobber !9
  %60 = add nuw nsw i32 %14, 96
  %61 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %60
  store i16 %59, i16 addrspace(3)* %61, align 2, !tbaa !5
  %62 = mul nsw i32 %2, 112
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %63
  %65 = load i16, i16 addrspace(1)* %64, align 2, !tbaa !5, !amdgpu.noclobber !9
  %66 = add nuw nsw i32 %14, 112
  %67 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %66
  store i16 %65, i16 addrspace(3)* %67, align 2, !tbaa !5
  %68 = shl nsw i32 %2, 7
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %69
  %71 = load i16, i16 addrspace(1)* %70, align 2, !tbaa !5, !amdgpu.noclobber !9
  %72 = add nuw nsw i32 %14, 128
  %73 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %72
  store i16 %71, i16 addrspace(3)* %73, align 2, !tbaa !5
  %74 = mul nsw i32 %2, 144
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %75
  %77 = load i16, i16 addrspace(1)* %76, align 2, !tbaa !5, !amdgpu.noclobber !9
  %78 = add nuw nsw i32 %14, 144
  %79 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %78
  store i16 %77, i16 addrspace(3)* %79, align 2, !tbaa !5
  %80 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %24
  %81 = icmp sgt i32 %16, -1
  br i1 %81, label %82, label %84

82:                                               ; preds = %6
  %83 = load i16, i16 addrspace(1)* %25, align 2, !tbaa !5, !amdgpu.noclobber !9
  br label %84

84:                                               ; preds = %6, %82
  %85 = phi i16 [ %83, %82 ], [ 0, %6 ]
  %86 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %14
  store i16 %85, i16 addrspace(3)* %86, align 2, !tbaa !5
  %87 = add nsw i32 %16, 160
  %88 = icmp slt i32 %87, %3
  br i1 %88, label %89, label %94

89:                                               ; preds = %84
  %90 = mul nsw i32 %2, 160
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 %91
  %93 = load i16, i16 addrspace(1)* %92, align 2, !tbaa !5, !amdgpu.noclobber !9
  br label %94

94:                                               ; preds = %84, %89
  %95 = phi i16 [ %93, %89 ], [ 0, %84 ]
  %96 = add nuw nsw i32 %14, 160
  %97 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %96
  store i16 %95, i16 addrspace(3)* %97, align 2, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = sub i32 %14, %5
  %99 = shl i32 %5, 1
  %100 = icmp slt i32 %5, 1
  %101 = tail call i32 @llvm.smax.i32(i32 %99, i32 1)
  %102 = add i32 %98, 16
  %103 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %102
  %104 = load i16, i16 addrspace(3)* %103, align 2, !tbaa !5
  br i1 %100, label %190, label %105

105:                                              ; preds = %94
  %106 = icmp ult i32 %101, 2
  br i1 %106, label %187, label %107

107:                                              ; preds = %105
  %108 = and i32 %101, 2147483646
  %109 = or i32 %101, 1
  %110 = insertelement <2 x i16> poison, i16 %104, i64 0
  %111 = shufflevector <2 x i16> %110, <2 x i16> poison, <2 x i32> zeroinitializer
  %112 = add nsw i32 %101, -2
  %113 = lshr i32 %112, 1
  %114 = add nuw i32 %113, 1
  %115 = and i32 %114, 7
  %116 = icmp ult i32 %112, 14
  br i1 %116, label %166, label %117

117:                                              ; preds = %107
  %118 = and i32 %114, -8
  br label %119

119:                                              ; preds = %119, %117
  %120 = phi i32 [ 0, %117 ], [ %163, %119 ]
  %121 = phi <2 x i16> [ %111, %117 ], [ %162, %119 ]
  %122 = phi i32 [ 0, %117 ], [ %164, %119 ]
  %123 = or i32 %120, 1
  %124 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %123
  %125 = bitcast i16 addrspace(3)* %124 to <2 x i16> addrspace(3)*
  %126 = load <2 x i16>, <2 x i16> addrspace(3)* %125, align 2, !tbaa !5
  %127 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %121, <2 x i16> %126)
  %128 = or i32 %120, 3
  %129 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %128
  %130 = bitcast i16 addrspace(3)* %129 to <2 x i16> addrspace(3)*
  %131 = load <2 x i16>, <2 x i16> addrspace(3)* %130, align 2, !tbaa !5
  %132 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %127, <2 x i16> %131)
  %133 = or i32 %120, 5
  %134 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %133
  %135 = bitcast i16 addrspace(3)* %134 to <2 x i16> addrspace(3)*
  %136 = load <2 x i16>, <2 x i16> addrspace(3)* %135, align 2, !tbaa !5
  %137 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %132, <2 x i16> %136)
  %138 = or i32 %120, 7
  %139 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %138
  %140 = bitcast i16 addrspace(3)* %139 to <2 x i16> addrspace(3)*
  %141 = load <2 x i16>, <2 x i16> addrspace(3)* %140, align 2, !tbaa !5
  %142 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %137, <2 x i16> %141)
  %143 = or i32 %120, 9
  %144 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %143
  %145 = bitcast i16 addrspace(3)* %144 to <2 x i16> addrspace(3)*
  %146 = load <2 x i16>, <2 x i16> addrspace(3)* %145, align 2, !tbaa !5
  %147 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %142, <2 x i16> %146)
  %148 = or i32 %120, 11
  %149 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %148
  %150 = bitcast i16 addrspace(3)* %149 to <2 x i16> addrspace(3)*
  %151 = load <2 x i16>, <2 x i16> addrspace(3)* %150, align 2, !tbaa !5
  %152 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %147, <2 x i16> %151)
  %153 = or i32 %120, 13
  %154 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %153
  %155 = bitcast i16 addrspace(3)* %154 to <2 x i16> addrspace(3)*
  %156 = load <2 x i16>, <2 x i16> addrspace(3)* %155, align 2, !tbaa !5
  %157 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %152, <2 x i16> %156)
  %158 = or i32 %120, 15
  %159 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %158
  %160 = bitcast i16 addrspace(3)* %159 to <2 x i16> addrspace(3)*
  %161 = load <2 x i16>, <2 x i16> addrspace(3)* %160, align 2, !tbaa !5
  %162 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %157, <2 x i16> %161)
  %163 = add nuw i32 %120, 16
  %164 = add i32 %122, 8
  %165 = icmp eq i32 %164, %118
  br i1 %165, label %166, label %119, !llvm.loop !10

166:                                              ; preds = %119, %107
  %167 = phi <2 x i16> [ undef, %107 ], [ %162, %119 ]
  %168 = phi i32 [ 0, %107 ], [ %163, %119 ]
  %169 = phi <2 x i16> [ %111, %107 ], [ %162, %119 ]
  %170 = icmp eq i32 %115, 0
  br i1 %170, label %183, label %171

171:                                              ; preds = %166, %171
  %172 = phi i32 [ %180, %171 ], [ %168, %166 ]
  %173 = phi <2 x i16> [ %179, %171 ], [ %169, %166 ]
  %174 = phi i32 [ %181, %171 ], [ 0, %166 ]
  %175 = or i32 %172, 1
  %176 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %175
  %177 = bitcast i16 addrspace(3)* %176 to <2 x i16> addrspace(3)*
  %178 = load <2 x i16>, <2 x i16> addrspace(3)* %177, align 2, !tbaa !5
  %179 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %173, <2 x i16> %178)
  %180 = add nuw i32 %172, 2
  %181 = add i32 %174, 1
  %182 = icmp eq i32 %181, %115
  br i1 %182, label %183, label %171, !llvm.loop !13

183:                                              ; preds = %171, %166
  %184 = phi <2 x i16> [ %167, %166 ], [ %179, %171 ]
  %185 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %184)
  %186 = icmp eq i32 %101, %108
  br i1 %186, label %190, label %187

187:                                              ; preds = %105, %183
  %188 = phi i32 [ 1, %105 ], [ %109, %183 ]
  %189 = phi i16 [ %104, %105 ], [ %185, %183 ]
  br label %985

190:                                              ; preds = %985, %183, %94
  %191 = phi i16 [ %104, %94 ], [ %185, %183 ], [ %990, %985 ]
  %192 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %27
  store i16 %191, i16 addrspace(1)* %192, align 2, !tbaa !5
  %193 = add i32 %98, 32
  %194 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %193
  %195 = load i16, i16 addrspace(3)* %194, align 2, !tbaa !5
  br i1 %100, label %289, label %196

196:                                              ; preds = %190
  %197 = icmp ult i32 %101, 2
  br i1 %197, label %278, label %198

198:                                              ; preds = %196
  %199 = and i32 %101, 2147483646
  %200 = or i32 %101, 1
  %201 = insertelement <2 x i16> poison, i16 %195, i64 0
  %202 = shufflevector <2 x i16> %201, <2 x i16> poison, <2 x i32> zeroinitializer
  %203 = add nsw i32 %101, -2
  %204 = lshr i32 %203, 1
  %205 = add nuw i32 %204, 1
  %206 = and i32 %205, 7
  %207 = icmp ult i32 %203, 14
  br i1 %207, label %257, label %208

208:                                              ; preds = %198
  %209 = and i32 %205, -8
  br label %210

210:                                              ; preds = %210, %208
  %211 = phi i32 [ 0, %208 ], [ %254, %210 ]
  %212 = phi <2 x i16> [ %202, %208 ], [ %253, %210 ]
  %213 = phi i32 [ 0, %208 ], [ %255, %210 ]
  %214 = or i32 %211, 1
  %215 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %214
  %216 = bitcast i16 addrspace(3)* %215 to <2 x i16> addrspace(3)*
  %217 = load <2 x i16>, <2 x i16> addrspace(3)* %216, align 2, !tbaa !5
  %218 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %212, <2 x i16> %217)
  %219 = or i32 %211, 3
  %220 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %219
  %221 = bitcast i16 addrspace(3)* %220 to <2 x i16> addrspace(3)*
  %222 = load <2 x i16>, <2 x i16> addrspace(3)* %221, align 2, !tbaa !5
  %223 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %218, <2 x i16> %222)
  %224 = or i32 %211, 5
  %225 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %224
  %226 = bitcast i16 addrspace(3)* %225 to <2 x i16> addrspace(3)*
  %227 = load <2 x i16>, <2 x i16> addrspace(3)* %226, align 2, !tbaa !5
  %228 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %223, <2 x i16> %227)
  %229 = or i32 %211, 7
  %230 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %229
  %231 = bitcast i16 addrspace(3)* %230 to <2 x i16> addrspace(3)*
  %232 = load <2 x i16>, <2 x i16> addrspace(3)* %231, align 2, !tbaa !5
  %233 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %228, <2 x i16> %232)
  %234 = or i32 %211, 9
  %235 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %234
  %236 = bitcast i16 addrspace(3)* %235 to <2 x i16> addrspace(3)*
  %237 = load <2 x i16>, <2 x i16> addrspace(3)* %236, align 2, !tbaa !5
  %238 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %233, <2 x i16> %237)
  %239 = or i32 %211, 11
  %240 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %239
  %241 = bitcast i16 addrspace(3)* %240 to <2 x i16> addrspace(3)*
  %242 = load <2 x i16>, <2 x i16> addrspace(3)* %241, align 2, !tbaa !5
  %243 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %238, <2 x i16> %242)
  %244 = or i32 %211, 13
  %245 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %244
  %246 = bitcast i16 addrspace(3)* %245 to <2 x i16> addrspace(3)*
  %247 = load <2 x i16>, <2 x i16> addrspace(3)* %246, align 2, !tbaa !5
  %248 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %243, <2 x i16> %247)
  %249 = or i32 %211, 15
  %250 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %249
  %251 = bitcast i16 addrspace(3)* %250 to <2 x i16> addrspace(3)*
  %252 = load <2 x i16>, <2 x i16> addrspace(3)* %251, align 2, !tbaa !5
  %253 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %248, <2 x i16> %252)
  %254 = add nuw i32 %211, 16
  %255 = add i32 %213, 8
  %256 = icmp eq i32 %255, %209
  br i1 %256, label %257, label %210, !llvm.loop !15

257:                                              ; preds = %210, %198
  %258 = phi <2 x i16> [ undef, %198 ], [ %253, %210 ]
  %259 = phi i32 [ 0, %198 ], [ %254, %210 ]
  %260 = phi <2 x i16> [ %202, %198 ], [ %253, %210 ]
  %261 = icmp eq i32 %206, 0
  br i1 %261, label %274, label %262

262:                                              ; preds = %257, %262
  %263 = phi i32 [ %271, %262 ], [ %259, %257 ]
  %264 = phi <2 x i16> [ %270, %262 ], [ %260, %257 ]
  %265 = phi i32 [ %272, %262 ], [ 0, %257 ]
  %266 = or i32 %263, 1
  %267 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %266
  %268 = bitcast i16 addrspace(3)* %267 to <2 x i16> addrspace(3)*
  %269 = load <2 x i16>, <2 x i16> addrspace(3)* %268, align 2, !tbaa !5
  %270 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %264, <2 x i16> %269)
  %271 = add nuw i32 %263, 2
  %272 = add i32 %265, 1
  %273 = icmp eq i32 %272, %206
  br i1 %273, label %274, label %262, !llvm.loop !16

274:                                              ; preds = %262, %257
  %275 = phi <2 x i16> [ %258, %257 ], [ %270, %262 ]
  %276 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %275)
  %277 = icmp eq i32 %101, %199
  br i1 %277, label %289, label %278

278:                                              ; preds = %196, %274
  %279 = phi i32 [ 1, %196 ], [ %200, %274 ]
  %280 = phi i16 [ %195, %196 ], [ %276, %274 ]
  br label %281

281:                                              ; preds = %278, %281
  %282 = phi i32 [ %287, %281 ], [ %279, %278 ]
  %283 = phi i16 [ %286, %281 ], [ %280, %278 ]
  %284 = getelementptr inbounds i16, i16 addrspace(3)* %194, i32 %282
  %285 = load i16, i16 addrspace(3)* %284, align 2, !tbaa !5
  %286 = tail call i16 @llvm.umin.i16(i16 %283, i16 %285)
  %287 = add nuw nsw i32 %282, 1
  %288 = icmp eq i32 %282, %101
  br i1 %288, label %289, label %281, !llvm.loop !17

289:                                              ; preds = %281, %274, %190
  %290 = phi i16 [ %195, %190 ], [ %276, %274 ], [ %286, %281 ]
  %291 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %33
  store i16 %290, i16 addrspace(1)* %291, align 2, !tbaa !5
  %292 = add i32 %98, 48
  %293 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %292
  %294 = load i16, i16 addrspace(3)* %293, align 2, !tbaa !5
  br i1 %100, label %388, label %295

295:                                              ; preds = %289
  %296 = icmp ult i32 %101, 2
  br i1 %296, label %377, label %297

297:                                              ; preds = %295
  %298 = and i32 %101, 2147483646
  %299 = or i32 %101, 1
  %300 = insertelement <2 x i16> poison, i16 %294, i64 0
  %301 = shufflevector <2 x i16> %300, <2 x i16> poison, <2 x i32> zeroinitializer
  %302 = add nsw i32 %101, -2
  %303 = lshr i32 %302, 1
  %304 = add nuw i32 %303, 1
  %305 = and i32 %304, 7
  %306 = icmp ult i32 %302, 14
  br i1 %306, label %356, label %307

307:                                              ; preds = %297
  %308 = and i32 %304, -8
  br label %309

309:                                              ; preds = %309, %307
  %310 = phi i32 [ 0, %307 ], [ %353, %309 ]
  %311 = phi <2 x i16> [ %301, %307 ], [ %352, %309 ]
  %312 = phi i32 [ 0, %307 ], [ %354, %309 ]
  %313 = or i32 %310, 1
  %314 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %313
  %315 = bitcast i16 addrspace(3)* %314 to <2 x i16> addrspace(3)*
  %316 = load <2 x i16>, <2 x i16> addrspace(3)* %315, align 2, !tbaa !5
  %317 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %311, <2 x i16> %316)
  %318 = or i32 %310, 3
  %319 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %318
  %320 = bitcast i16 addrspace(3)* %319 to <2 x i16> addrspace(3)*
  %321 = load <2 x i16>, <2 x i16> addrspace(3)* %320, align 2, !tbaa !5
  %322 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %317, <2 x i16> %321)
  %323 = or i32 %310, 5
  %324 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %323
  %325 = bitcast i16 addrspace(3)* %324 to <2 x i16> addrspace(3)*
  %326 = load <2 x i16>, <2 x i16> addrspace(3)* %325, align 2, !tbaa !5
  %327 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %322, <2 x i16> %326)
  %328 = or i32 %310, 7
  %329 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %328
  %330 = bitcast i16 addrspace(3)* %329 to <2 x i16> addrspace(3)*
  %331 = load <2 x i16>, <2 x i16> addrspace(3)* %330, align 2, !tbaa !5
  %332 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %327, <2 x i16> %331)
  %333 = or i32 %310, 9
  %334 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %333
  %335 = bitcast i16 addrspace(3)* %334 to <2 x i16> addrspace(3)*
  %336 = load <2 x i16>, <2 x i16> addrspace(3)* %335, align 2, !tbaa !5
  %337 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %332, <2 x i16> %336)
  %338 = or i32 %310, 11
  %339 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %338
  %340 = bitcast i16 addrspace(3)* %339 to <2 x i16> addrspace(3)*
  %341 = load <2 x i16>, <2 x i16> addrspace(3)* %340, align 2, !tbaa !5
  %342 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %337, <2 x i16> %341)
  %343 = or i32 %310, 13
  %344 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %343
  %345 = bitcast i16 addrspace(3)* %344 to <2 x i16> addrspace(3)*
  %346 = load <2 x i16>, <2 x i16> addrspace(3)* %345, align 2, !tbaa !5
  %347 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %342, <2 x i16> %346)
  %348 = or i32 %310, 15
  %349 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %348
  %350 = bitcast i16 addrspace(3)* %349 to <2 x i16> addrspace(3)*
  %351 = load <2 x i16>, <2 x i16> addrspace(3)* %350, align 2, !tbaa !5
  %352 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %347, <2 x i16> %351)
  %353 = add nuw i32 %310, 16
  %354 = add i32 %312, 8
  %355 = icmp eq i32 %354, %308
  br i1 %355, label %356, label %309, !llvm.loop !19

356:                                              ; preds = %309, %297
  %357 = phi <2 x i16> [ undef, %297 ], [ %352, %309 ]
  %358 = phi i32 [ 0, %297 ], [ %353, %309 ]
  %359 = phi <2 x i16> [ %301, %297 ], [ %352, %309 ]
  %360 = icmp eq i32 %305, 0
  br i1 %360, label %373, label %361

361:                                              ; preds = %356, %361
  %362 = phi i32 [ %370, %361 ], [ %358, %356 ]
  %363 = phi <2 x i16> [ %369, %361 ], [ %359, %356 ]
  %364 = phi i32 [ %371, %361 ], [ 0, %356 ]
  %365 = or i32 %362, 1
  %366 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %365
  %367 = bitcast i16 addrspace(3)* %366 to <2 x i16> addrspace(3)*
  %368 = load <2 x i16>, <2 x i16> addrspace(3)* %367, align 2, !tbaa !5
  %369 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %363, <2 x i16> %368)
  %370 = add nuw i32 %362, 2
  %371 = add i32 %364, 1
  %372 = icmp eq i32 %371, %305
  br i1 %372, label %373, label %361, !llvm.loop !20

373:                                              ; preds = %361, %356
  %374 = phi <2 x i16> [ %357, %356 ], [ %369, %361 ]
  %375 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %374)
  %376 = icmp eq i32 %101, %298
  br i1 %376, label %388, label %377

377:                                              ; preds = %295, %373
  %378 = phi i32 [ 1, %295 ], [ %299, %373 ]
  %379 = phi i16 [ %294, %295 ], [ %375, %373 ]
  br label %380

380:                                              ; preds = %377, %380
  %381 = phi i32 [ %386, %380 ], [ %378, %377 ]
  %382 = phi i16 [ %385, %380 ], [ %379, %377 ]
  %383 = getelementptr inbounds i16, i16 addrspace(3)* %293, i32 %381
  %384 = load i16, i16 addrspace(3)* %383, align 2, !tbaa !5
  %385 = tail call i16 @llvm.umin.i16(i16 %382, i16 %384)
  %386 = add nuw nsw i32 %381, 1
  %387 = icmp eq i32 %381, %101
  br i1 %387, label %388, label %380, !llvm.loop !21

388:                                              ; preds = %380, %373, %289
  %389 = phi i16 [ %294, %289 ], [ %375, %373 ], [ %385, %380 ]
  %390 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %39
  store i16 %389, i16 addrspace(1)* %390, align 2, !tbaa !5
  %391 = add i32 %98, 64
  %392 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %391
  %393 = load i16, i16 addrspace(3)* %392, align 2, !tbaa !5
  br i1 %100, label %487, label %394

394:                                              ; preds = %388
  %395 = icmp ult i32 %101, 2
  br i1 %395, label %476, label %396

396:                                              ; preds = %394
  %397 = and i32 %101, 2147483646
  %398 = or i32 %101, 1
  %399 = insertelement <2 x i16> poison, i16 %393, i64 0
  %400 = shufflevector <2 x i16> %399, <2 x i16> poison, <2 x i32> zeroinitializer
  %401 = add nsw i32 %101, -2
  %402 = lshr i32 %401, 1
  %403 = add nuw i32 %402, 1
  %404 = and i32 %403, 7
  %405 = icmp ult i32 %401, 14
  br i1 %405, label %455, label %406

406:                                              ; preds = %396
  %407 = and i32 %403, -8
  br label %408

408:                                              ; preds = %408, %406
  %409 = phi i32 [ 0, %406 ], [ %452, %408 ]
  %410 = phi <2 x i16> [ %400, %406 ], [ %451, %408 ]
  %411 = phi i32 [ 0, %406 ], [ %453, %408 ]
  %412 = or i32 %409, 1
  %413 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %412
  %414 = bitcast i16 addrspace(3)* %413 to <2 x i16> addrspace(3)*
  %415 = load <2 x i16>, <2 x i16> addrspace(3)* %414, align 2, !tbaa !5
  %416 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %410, <2 x i16> %415)
  %417 = or i32 %409, 3
  %418 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %417
  %419 = bitcast i16 addrspace(3)* %418 to <2 x i16> addrspace(3)*
  %420 = load <2 x i16>, <2 x i16> addrspace(3)* %419, align 2, !tbaa !5
  %421 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %416, <2 x i16> %420)
  %422 = or i32 %409, 5
  %423 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %422
  %424 = bitcast i16 addrspace(3)* %423 to <2 x i16> addrspace(3)*
  %425 = load <2 x i16>, <2 x i16> addrspace(3)* %424, align 2, !tbaa !5
  %426 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %421, <2 x i16> %425)
  %427 = or i32 %409, 7
  %428 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %427
  %429 = bitcast i16 addrspace(3)* %428 to <2 x i16> addrspace(3)*
  %430 = load <2 x i16>, <2 x i16> addrspace(3)* %429, align 2, !tbaa !5
  %431 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %426, <2 x i16> %430)
  %432 = or i32 %409, 9
  %433 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %432
  %434 = bitcast i16 addrspace(3)* %433 to <2 x i16> addrspace(3)*
  %435 = load <2 x i16>, <2 x i16> addrspace(3)* %434, align 2, !tbaa !5
  %436 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %431, <2 x i16> %435)
  %437 = or i32 %409, 11
  %438 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %437
  %439 = bitcast i16 addrspace(3)* %438 to <2 x i16> addrspace(3)*
  %440 = load <2 x i16>, <2 x i16> addrspace(3)* %439, align 2, !tbaa !5
  %441 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %436, <2 x i16> %440)
  %442 = or i32 %409, 13
  %443 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %442
  %444 = bitcast i16 addrspace(3)* %443 to <2 x i16> addrspace(3)*
  %445 = load <2 x i16>, <2 x i16> addrspace(3)* %444, align 2, !tbaa !5
  %446 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %441, <2 x i16> %445)
  %447 = or i32 %409, 15
  %448 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %447
  %449 = bitcast i16 addrspace(3)* %448 to <2 x i16> addrspace(3)*
  %450 = load <2 x i16>, <2 x i16> addrspace(3)* %449, align 2, !tbaa !5
  %451 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %446, <2 x i16> %450)
  %452 = add nuw i32 %409, 16
  %453 = add i32 %411, 8
  %454 = icmp eq i32 %453, %407
  br i1 %454, label %455, label %408, !llvm.loop !22

455:                                              ; preds = %408, %396
  %456 = phi <2 x i16> [ undef, %396 ], [ %451, %408 ]
  %457 = phi i32 [ 0, %396 ], [ %452, %408 ]
  %458 = phi <2 x i16> [ %400, %396 ], [ %451, %408 ]
  %459 = icmp eq i32 %404, 0
  br i1 %459, label %472, label %460

460:                                              ; preds = %455, %460
  %461 = phi i32 [ %469, %460 ], [ %457, %455 ]
  %462 = phi <2 x i16> [ %468, %460 ], [ %458, %455 ]
  %463 = phi i32 [ %470, %460 ], [ 0, %455 ]
  %464 = or i32 %461, 1
  %465 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %464
  %466 = bitcast i16 addrspace(3)* %465 to <2 x i16> addrspace(3)*
  %467 = load <2 x i16>, <2 x i16> addrspace(3)* %466, align 2, !tbaa !5
  %468 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %462, <2 x i16> %467)
  %469 = add nuw i32 %461, 2
  %470 = add i32 %463, 1
  %471 = icmp eq i32 %470, %404
  br i1 %471, label %472, label %460, !llvm.loop !23

472:                                              ; preds = %460, %455
  %473 = phi <2 x i16> [ %456, %455 ], [ %468, %460 ]
  %474 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %473)
  %475 = icmp eq i32 %101, %397
  br i1 %475, label %487, label %476

476:                                              ; preds = %394, %472
  %477 = phi i32 [ 1, %394 ], [ %398, %472 ]
  %478 = phi i16 [ %393, %394 ], [ %474, %472 ]
  br label %479

479:                                              ; preds = %476, %479
  %480 = phi i32 [ %485, %479 ], [ %477, %476 ]
  %481 = phi i16 [ %484, %479 ], [ %478, %476 ]
  %482 = getelementptr inbounds i16, i16 addrspace(3)* %392, i32 %480
  %483 = load i16, i16 addrspace(3)* %482, align 2, !tbaa !5
  %484 = tail call i16 @llvm.umin.i16(i16 %481, i16 %483)
  %485 = add nuw nsw i32 %480, 1
  %486 = icmp eq i32 %480, %101
  br i1 %486, label %487, label %479, !llvm.loop !24

487:                                              ; preds = %479, %472, %388
  %488 = phi i16 [ %393, %388 ], [ %474, %472 ], [ %484, %479 ]
  %489 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %45
  store i16 %488, i16 addrspace(1)* %489, align 2, !tbaa !5
  %490 = add i32 %98, 80
  %491 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %490
  %492 = load i16, i16 addrspace(3)* %491, align 2, !tbaa !5
  br i1 %100, label %586, label %493

493:                                              ; preds = %487
  %494 = icmp ult i32 %101, 2
  br i1 %494, label %575, label %495

495:                                              ; preds = %493
  %496 = and i32 %101, 2147483646
  %497 = or i32 %101, 1
  %498 = insertelement <2 x i16> poison, i16 %492, i64 0
  %499 = shufflevector <2 x i16> %498, <2 x i16> poison, <2 x i32> zeroinitializer
  %500 = add nsw i32 %101, -2
  %501 = lshr i32 %500, 1
  %502 = add nuw i32 %501, 1
  %503 = and i32 %502, 7
  %504 = icmp ult i32 %500, 14
  br i1 %504, label %554, label %505

505:                                              ; preds = %495
  %506 = and i32 %502, -8
  br label %507

507:                                              ; preds = %507, %505
  %508 = phi i32 [ 0, %505 ], [ %551, %507 ]
  %509 = phi <2 x i16> [ %499, %505 ], [ %550, %507 ]
  %510 = phi i32 [ 0, %505 ], [ %552, %507 ]
  %511 = or i32 %508, 1
  %512 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %511
  %513 = bitcast i16 addrspace(3)* %512 to <2 x i16> addrspace(3)*
  %514 = load <2 x i16>, <2 x i16> addrspace(3)* %513, align 2, !tbaa !5
  %515 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %509, <2 x i16> %514)
  %516 = or i32 %508, 3
  %517 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %516
  %518 = bitcast i16 addrspace(3)* %517 to <2 x i16> addrspace(3)*
  %519 = load <2 x i16>, <2 x i16> addrspace(3)* %518, align 2, !tbaa !5
  %520 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %515, <2 x i16> %519)
  %521 = or i32 %508, 5
  %522 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %521
  %523 = bitcast i16 addrspace(3)* %522 to <2 x i16> addrspace(3)*
  %524 = load <2 x i16>, <2 x i16> addrspace(3)* %523, align 2, !tbaa !5
  %525 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %520, <2 x i16> %524)
  %526 = or i32 %508, 7
  %527 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %526
  %528 = bitcast i16 addrspace(3)* %527 to <2 x i16> addrspace(3)*
  %529 = load <2 x i16>, <2 x i16> addrspace(3)* %528, align 2, !tbaa !5
  %530 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %525, <2 x i16> %529)
  %531 = or i32 %508, 9
  %532 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %531
  %533 = bitcast i16 addrspace(3)* %532 to <2 x i16> addrspace(3)*
  %534 = load <2 x i16>, <2 x i16> addrspace(3)* %533, align 2, !tbaa !5
  %535 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %530, <2 x i16> %534)
  %536 = or i32 %508, 11
  %537 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %536
  %538 = bitcast i16 addrspace(3)* %537 to <2 x i16> addrspace(3)*
  %539 = load <2 x i16>, <2 x i16> addrspace(3)* %538, align 2, !tbaa !5
  %540 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %535, <2 x i16> %539)
  %541 = or i32 %508, 13
  %542 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %541
  %543 = bitcast i16 addrspace(3)* %542 to <2 x i16> addrspace(3)*
  %544 = load <2 x i16>, <2 x i16> addrspace(3)* %543, align 2, !tbaa !5
  %545 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %540, <2 x i16> %544)
  %546 = or i32 %508, 15
  %547 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %546
  %548 = bitcast i16 addrspace(3)* %547 to <2 x i16> addrspace(3)*
  %549 = load <2 x i16>, <2 x i16> addrspace(3)* %548, align 2, !tbaa !5
  %550 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %545, <2 x i16> %549)
  %551 = add nuw i32 %508, 16
  %552 = add i32 %510, 8
  %553 = icmp eq i32 %552, %506
  br i1 %553, label %554, label %507, !llvm.loop !25

554:                                              ; preds = %507, %495
  %555 = phi <2 x i16> [ undef, %495 ], [ %550, %507 ]
  %556 = phi i32 [ 0, %495 ], [ %551, %507 ]
  %557 = phi <2 x i16> [ %499, %495 ], [ %550, %507 ]
  %558 = icmp eq i32 %503, 0
  br i1 %558, label %571, label %559

559:                                              ; preds = %554, %559
  %560 = phi i32 [ %568, %559 ], [ %556, %554 ]
  %561 = phi <2 x i16> [ %567, %559 ], [ %557, %554 ]
  %562 = phi i32 [ %569, %559 ], [ 0, %554 ]
  %563 = or i32 %560, 1
  %564 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %563
  %565 = bitcast i16 addrspace(3)* %564 to <2 x i16> addrspace(3)*
  %566 = load <2 x i16>, <2 x i16> addrspace(3)* %565, align 2, !tbaa !5
  %567 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %561, <2 x i16> %566)
  %568 = add nuw i32 %560, 2
  %569 = add i32 %562, 1
  %570 = icmp eq i32 %569, %503
  br i1 %570, label %571, label %559, !llvm.loop !26

571:                                              ; preds = %559, %554
  %572 = phi <2 x i16> [ %555, %554 ], [ %567, %559 ]
  %573 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %572)
  %574 = icmp eq i32 %101, %496
  br i1 %574, label %586, label %575

575:                                              ; preds = %493, %571
  %576 = phi i32 [ 1, %493 ], [ %497, %571 ]
  %577 = phi i16 [ %492, %493 ], [ %573, %571 ]
  br label %578

578:                                              ; preds = %575, %578
  %579 = phi i32 [ %584, %578 ], [ %576, %575 ]
  %580 = phi i16 [ %583, %578 ], [ %577, %575 ]
  %581 = getelementptr inbounds i16, i16 addrspace(3)* %491, i32 %579
  %582 = load i16, i16 addrspace(3)* %581, align 2, !tbaa !5
  %583 = tail call i16 @llvm.umin.i16(i16 %580, i16 %582)
  %584 = add nuw nsw i32 %579, 1
  %585 = icmp eq i32 %579, %101
  br i1 %585, label %586, label %578, !llvm.loop !27

586:                                              ; preds = %578, %571, %487
  %587 = phi i16 [ %492, %487 ], [ %573, %571 ], [ %583, %578 ]
  %588 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %51
  store i16 %587, i16 addrspace(1)* %588, align 2, !tbaa !5
  %589 = add i32 %98, 96
  %590 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %589
  %591 = load i16, i16 addrspace(3)* %590, align 2, !tbaa !5
  br i1 %100, label %685, label %592

592:                                              ; preds = %586
  %593 = icmp ult i32 %101, 2
  br i1 %593, label %674, label %594

594:                                              ; preds = %592
  %595 = and i32 %101, 2147483646
  %596 = or i32 %101, 1
  %597 = insertelement <2 x i16> poison, i16 %591, i64 0
  %598 = shufflevector <2 x i16> %597, <2 x i16> poison, <2 x i32> zeroinitializer
  %599 = add nsw i32 %101, -2
  %600 = lshr i32 %599, 1
  %601 = add nuw i32 %600, 1
  %602 = and i32 %601, 7
  %603 = icmp ult i32 %599, 14
  br i1 %603, label %653, label %604

604:                                              ; preds = %594
  %605 = and i32 %601, -8
  br label %606

606:                                              ; preds = %606, %604
  %607 = phi i32 [ 0, %604 ], [ %650, %606 ]
  %608 = phi <2 x i16> [ %598, %604 ], [ %649, %606 ]
  %609 = phi i32 [ 0, %604 ], [ %651, %606 ]
  %610 = or i32 %607, 1
  %611 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %610
  %612 = bitcast i16 addrspace(3)* %611 to <2 x i16> addrspace(3)*
  %613 = load <2 x i16>, <2 x i16> addrspace(3)* %612, align 2, !tbaa !5
  %614 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %608, <2 x i16> %613)
  %615 = or i32 %607, 3
  %616 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %615
  %617 = bitcast i16 addrspace(3)* %616 to <2 x i16> addrspace(3)*
  %618 = load <2 x i16>, <2 x i16> addrspace(3)* %617, align 2, !tbaa !5
  %619 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %614, <2 x i16> %618)
  %620 = or i32 %607, 5
  %621 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %620
  %622 = bitcast i16 addrspace(3)* %621 to <2 x i16> addrspace(3)*
  %623 = load <2 x i16>, <2 x i16> addrspace(3)* %622, align 2, !tbaa !5
  %624 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %619, <2 x i16> %623)
  %625 = or i32 %607, 7
  %626 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %625
  %627 = bitcast i16 addrspace(3)* %626 to <2 x i16> addrspace(3)*
  %628 = load <2 x i16>, <2 x i16> addrspace(3)* %627, align 2, !tbaa !5
  %629 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %624, <2 x i16> %628)
  %630 = or i32 %607, 9
  %631 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %630
  %632 = bitcast i16 addrspace(3)* %631 to <2 x i16> addrspace(3)*
  %633 = load <2 x i16>, <2 x i16> addrspace(3)* %632, align 2, !tbaa !5
  %634 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %629, <2 x i16> %633)
  %635 = or i32 %607, 11
  %636 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %635
  %637 = bitcast i16 addrspace(3)* %636 to <2 x i16> addrspace(3)*
  %638 = load <2 x i16>, <2 x i16> addrspace(3)* %637, align 2, !tbaa !5
  %639 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %634, <2 x i16> %638)
  %640 = or i32 %607, 13
  %641 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %640
  %642 = bitcast i16 addrspace(3)* %641 to <2 x i16> addrspace(3)*
  %643 = load <2 x i16>, <2 x i16> addrspace(3)* %642, align 2, !tbaa !5
  %644 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %639, <2 x i16> %643)
  %645 = or i32 %607, 15
  %646 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %645
  %647 = bitcast i16 addrspace(3)* %646 to <2 x i16> addrspace(3)*
  %648 = load <2 x i16>, <2 x i16> addrspace(3)* %647, align 2, !tbaa !5
  %649 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %644, <2 x i16> %648)
  %650 = add nuw i32 %607, 16
  %651 = add i32 %609, 8
  %652 = icmp eq i32 %651, %605
  br i1 %652, label %653, label %606, !llvm.loop !28

653:                                              ; preds = %606, %594
  %654 = phi <2 x i16> [ undef, %594 ], [ %649, %606 ]
  %655 = phi i32 [ 0, %594 ], [ %650, %606 ]
  %656 = phi <2 x i16> [ %598, %594 ], [ %649, %606 ]
  %657 = icmp eq i32 %602, 0
  br i1 %657, label %670, label %658

658:                                              ; preds = %653, %658
  %659 = phi i32 [ %667, %658 ], [ %655, %653 ]
  %660 = phi <2 x i16> [ %666, %658 ], [ %656, %653 ]
  %661 = phi i32 [ %668, %658 ], [ 0, %653 ]
  %662 = or i32 %659, 1
  %663 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %662
  %664 = bitcast i16 addrspace(3)* %663 to <2 x i16> addrspace(3)*
  %665 = load <2 x i16>, <2 x i16> addrspace(3)* %664, align 2, !tbaa !5
  %666 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %660, <2 x i16> %665)
  %667 = add nuw i32 %659, 2
  %668 = add i32 %661, 1
  %669 = icmp eq i32 %668, %602
  br i1 %669, label %670, label %658, !llvm.loop !29

670:                                              ; preds = %658, %653
  %671 = phi <2 x i16> [ %654, %653 ], [ %666, %658 ]
  %672 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %671)
  %673 = icmp eq i32 %101, %595
  br i1 %673, label %685, label %674

674:                                              ; preds = %592, %670
  %675 = phi i32 [ 1, %592 ], [ %596, %670 ]
  %676 = phi i16 [ %591, %592 ], [ %672, %670 ]
  br label %677

677:                                              ; preds = %674, %677
  %678 = phi i32 [ %683, %677 ], [ %675, %674 ]
  %679 = phi i16 [ %682, %677 ], [ %676, %674 ]
  %680 = getelementptr inbounds i16, i16 addrspace(3)* %590, i32 %678
  %681 = load i16, i16 addrspace(3)* %680, align 2, !tbaa !5
  %682 = tail call i16 @llvm.umin.i16(i16 %679, i16 %681)
  %683 = add nuw nsw i32 %678, 1
  %684 = icmp eq i32 %678, %101
  br i1 %684, label %685, label %677, !llvm.loop !30

685:                                              ; preds = %677, %670, %586
  %686 = phi i16 [ %591, %586 ], [ %672, %670 ], [ %682, %677 ]
  %687 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %57
  store i16 %686, i16 addrspace(1)* %687, align 2, !tbaa !5
  %688 = add i32 %98, 112
  %689 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %688
  %690 = load i16, i16 addrspace(3)* %689, align 2, !tbaa !5
  br i1 %100, label %784, label %691

691:                                              ; preds = %685
  %692 = icmp ult i32 %101, 2
  br i1 %692, label %773, label %693

693:                                              ; preds = %691
  %694 = and i32 %101, 2147483646
  %695 = or i32 %101, 1
  %696 = insertelement <2 x i16> poison, i16 %690, i64 0
  %697 = shufflevector <2 x i16> %696, <2 x i16> poison, <2 x i32> zeroinitializer
  %698 = add nsw i32 %101, -2
  %699 = lshr i32 %698, 1
  %700 = add nuw i32 %699, 1
  %701 = and i32 %700, 7
  %702 = icmp ult i32 %698, 14
  br i1 %702, label %752, label %703

703:                                              ; preds = %693
  %704 = and i32 %700, -8
  br label %705

705:                                              ; preds = %705, %703
  %706 = phi i32 [ 0, %703 ], [ %749, %705 ]
  %707 = phi <2 x i16> [ %697, %703 ], [ %748, %705 ]
  %708 = phi i32 [ 0, %703 ], [ %750, %705 ]
  %709 = or i32 %706, 1
  %710 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %709
  %711 = bitcast i16 addrspace(3)* %710 to <2 x i16> addrspace(3)*
  %712 = load <2 x i16>, <2 x i16> addrspace(3)* %711, align 2, !tbaa !5
  %713 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %707, <2 x i16> %712)
  %714 = or i32 %706, 3
  %715 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %714
  %716 = bitcast i16 addrspace(3)* %715 to <2 x i16> addrspace(3)*
  %717 = load <2 x i16>, <2 x i16> addrspace(3)* %716, align 2, !tbaa !5
  %718 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %713, <2 x i16> %717)
  %719 = or i32 %706, 5
  %720 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %719
  %721 = bitcast i16 addrspace(3)* %720 to <2 x i16> addrspace(3)*
  %722 = load <2 x i16>, <2 x i16> addrspace(3)* %721, align 2, !tbaa !5
  %723 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %718, <2 x i16> %722)
  %724 = or i32 %706, 7
  %725 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %724
  %726 = bitcast i16 addrspace(3)* %725 to <2 x i16> addrspace(3)*
  %727 = load <2 x i16>, <2 x i16> addrspace(3)* %726, align 2, !tbaa !5
  %728 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %723, <2 x i16> %727)
  %729 = or i32 %706, 9
  %730 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %729
  %731 = bitcast i16 addrspace(3)* %730 to <2 x i16> addrspace(3)*
  %732 = load <2 x i16>, <2 x i16> addrspace(3)* %731, align 2, !tbaa !5
  %733 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %728, <2 x i16> %732)
  %734 = or i32 %706, 11
  %735 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %734
  %736 = bitcast i16 addrspace(3)* %735 to <2 x i16> addrspace(3)*
  %737 = load <2 x i16>, <2 x i16> addrspace(3)* %736, align 2, !tbaa !5
  %738 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %733, <2 x i16> %737)
  %739 = or i32 %706, 13
  %740 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %739
  %741 = bitcast i16 addrspace(3)* %740 to <2 x i16> addrspace(3)*
  %742 = load <2 x i16>, <2 x i16> addrspace(3)* %741, align 2, !tbaa !5
  %743 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %738, <2 x i16> %742)
  %744 = or i32 %706, 15
  %745 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %744
  %746 = bitcast i16 addrspace(3)* %745 to <2 x i16> addrspace(3)*
  %747 = load <2 x i16>, <2 x i16> addrspace(3)* %746, align 2, !tbaa !5
  %748 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %743, <2 x i16> %747)
  %749 = add nuw i32 %706, 16
  %750 = add i32 %708, 8
  %751 = icmp eq i32 %750, %704
  br i1 %751, label %752, label %705, !llvm.loop !31

752:                                              ; preds = %705, %693
  %753 = phi <2 x i16> [ undef, %693 ], [ %748, %705 ]
  %754 = phi i32 [ 0, %693 ], [ %749, %705 ]
  %755 = phi <2 x i16> [ %697, %693 ], [ %748, %705 ]
  %756 = icmp eq i32 %701, 0
  br i1 %756, label %769, label %757

757:                                              ; preds = %752, %757
  %758 = phi i32 [ %766, %757 ], [ %754, %752 ]
  %759 = phi <2 x i16> [ %765, %757 ], [ %755, %752 ]
  %760 = phi i32 [ %767, %757 ], [ 0, %752 ]
  %761 = or i32 %758, 1
  %762 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %761
  %763 = bitcast i16 addrspace(3)* %762 to <2 x i16> addrspace(3)*
  %764 = load <2 x i16>, <2 x i16> addrspace(3)* %763, align 2, !tbaa !5
  %765 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %759, <2 x i16> %764)
  %766 = add nuw i32 %758, 2
  %767 = add i32 %760, 1
  %768 = icmp eq i32 %767, %701
  br i1 %768, label %769, label %757, !llvm.loop !32

769:                                              ; preds = %757, %752
  %770 = phi <2 x i16> [ %753, %752 ], [ %765, %757 ]
  %771 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %770)
  %772 = icmp eq i32 %101, %694
  br i1 %772, label %784, label %773

773:                                              ; preds = %691, %769
  %774 = phi i32 [ 1, %691 ], [ %695, %769 ]
  %775 = phi i16 [ %690, %691 ], [ %771, %769 ]
  br label %776

776:                                              ; preds = %773, %776
  %777 = phi i32 [ %782, %776 ], [ %774, %773 ]
  %778 = phi i16 [ %781, %776 ], [ %775, %773 ]
  %779 = getelementptr inbounds i16, i16 addrspace(3)* %689, i32 %777
  %780 = load i16, i16 addrspace(3)* %779, align 2, !tbaa !5
  %781 = tail call i16 @llvm.umin.i16(i16 %778, i16 %780)
  %782 = add nuw nsw i32 %777, 1
  %783 = icmp eq i32 %777, %101
  br i1 %783, label %784, label %776, !llvm.loop !33

784:                                              ; preds = %776, %769, %685
  %785 = phi i16 [ %690, %685 ], [ %771, %769 ], [ %781, %776 ]
  %786 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %63
  store i16 %785, i16 addrspace(1)* %786, align 2, !tbaa !5
  %787 = add i32 %98, 128
  %788 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %787
  %789 = load i16, i16 addrspace(3)* %788, align 2, !tbaa !5
  br i1 %100, label %883, label %790

790:                                              ; preds = %784
  %791 = icmp ult i32 %101, 2
  br i1 %791, label %872, label %792

792:                                              ; preds = %790
  %793 = and i32 %101, 2147483646
  %794 = or i32 %101, 1
  %795 = insertelement <2 x i16> poison, i16 %789, i64 0
  %796 = shufflevector <2 x i16> %795, <2 x i16> poison, <2 x i32> zeroinitializer
  %797 = add nsw i32 %101, -2
  %798 = lshr i32 %797, 1
  %799 = add nuw i32 %798, 1
  %800 = and i32 %799, 7
  %801 = icmp ult i32 %797, 14
  br i1 %801, label %851, label %802

802:                                              ; preds = %792
  %803 = and i32 %799, -8
  br label %804

804:                                              ; preds = %804, %802
  %805 = phi i32 [ 0, %802 ], [ %848, %804 ]
  %806 = phi <2 x i16> [ %796, %802 ], [ %847, %804 ]
  %807 = phi i32 [ 0, %802 ], [ %849, %804 ]
  %808 = or i32 %805, 1
  %809 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %808
  %810 = bitcast i16 addrspace(3)* %809 to <2 x i16> addrspace(3)*
  %811 = load <2 x i16>, <2 x i16> addrspace(3)* %810, align 2, !tbaa !5
  %812 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %806, <2 x i16> %811)
  %813 = or i32 %805, 3
  %814 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %813
  %815 = bitcast i16 addrspace(3)* %814 to <2 x i16> addrspace(3)*
  %816 = load <2 x i16>, <2 x i16> addrspace(3)* %815, align 2, !tbaa !5
  %817 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %812, <2 x i16> %816)
  %818 = or i32 %805, 5
  %819 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %818
  %820 = bitcast i16 addrspace(3)* %819 to <2 x i16> addrspace(3)*
  %821 = load <2 x i16>, <2 x i16> addrspace(3)* %820, align 2, !tbaa !5
  %822 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %817, <2 x i16> %821)
  %823 = or i32 %805, 7
  %824 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %823
  %825 = bitcast i16 addrspace(3)* %824 to <2 x i16> addrspace(3)*
  %826 = load <2 x i16>, <2 x i16> addrspace(3)* %825, align 2, !tbaa !5
  %827 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %822, <2 x i16> %826)
  %828 = or i32 %805, 9
  %829 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %828
  %830 = bitcast i16 addrspace(3)* %829 to <2 x i16> addrspace(3)*
  %831 = load <2 x i16>, <2 x i16> addrspace(3)* %830, align 2, !tbaa !5
  %832 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %827, <2 x i16> %831)
  %833 = or i32 %805, 11
  %834 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %833
  %835 = bitcast i16 addrspace(3)* %834 to <2 x i16> addrspace(3)*
  %836 = load <2 x i16>, <2 x i16> addrspace(3)* %835, align 2, !tbaa !5
  %837 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %832, <2 x i16> %836)
  %838 = or i32 %805, 13
  %839 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %838
  %840 = bitcast i16 addrspace(3)* %839 to <2 x i16> addrspace(3)*
  %841 = load <2 x i16>, <2 x i16> addrspace(3)* %840, align 2, !tbaa !5
  %842 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %837, <2 x i16> %841)
  %843 = or i32 %805, 15
  %844 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %843
  %845 = bitcast i16 addrspace(3)* %844 to <2 x i16> addrspace(3)*
  %846 = load <2 x i16>, <2 x i16> addrspace(3)* %845, align 2, !tbaa !5
  %847 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %842, <2 x i16> %846)
  %848 = add nuw i32 %805, 16
  %849 = add i32 %807, 8
  %850 = icmp eq i32 %849, %803
  br i1 %850, label %851, label %804, !llvm.loop !34

851:                                              ; preds = %804, %792
  %852 = phi <2 x i16> [ undef, %792 ], [ %847, %804 ]
  %853 = phi i32 [ 0, %792 ], [ %848, %804 ]
  %854 = phi <2 x i16> [ %796, %792 ], [ %847, %804 ]
  %855 = icmp eq i32 %800, 0
  br i1 %855, label %868, label %856

856:                                              ; preds = %851, %856
  %857 = phi i32 [ %865, %856 ], [ %853, %851 ]
  %858 = phi <2 x i16> [ %864, %856 ], [ %854, %851 ]
  %859 = phi i32 [ %866, %856 ], [ 0, %851 ]
  %860 = or i32 %857, 1
  %861 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %860
  %862 = bitcast i16 addrspace(3)* %861 to <2 x i16> addrspace(3)*
  %863 = load <2 x i16>, <2 x i16> addrspace(3)* %862, align 2, !tbaa !5
  %864 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %858, <2 x i16> %863)
  %865 = add nuw i32 %857, 2
  %866 = add i32 %859, 1
  %867 = icmp eq i32 %866, %800
  br i1 %867, label %868, label %856, !llvm.loop !35

868:                                              ; preds = %856, %851
  %869 = phi <2 x i16> [ %852, %851 ], [ %864, %856 ]
  %870 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %869)
  %871 = icmp eq i32 %101, %793
  br i1 %871, label %883, label %872

872:                                              ; preds = %790, %868
  %873 = phi i32 [ 1, %790 ], [ %794, %868 ]
  %874 = phi i16 [ %789, %790 ], [ %870, %868 ]
  br label %875

875:                                              ; preds = %872, %875
  %876 = phi i32 [ %881, %875 ], [ %873, %872 ]
  %877 = phi i16 [ %880, %875 ], [ %874, %872 ]
  %878 = getelementptr inbounds i16, i16 addrspace(3)* %788, i32 %876
  %879 = load i16, i16 addrspace(3)* %878, align 2, !tbaa !5
  %880 = tail call i16 @llvm.umin.i16(i16 %877, i16 %879)
  %881 = add nuw nsw i32 %876, 1
  %882 = icmp eq i32 %876, %101
  br i1 %882, label %883, label %875, !llvm.loop !36

883:                                              ; preds = %875, %868, %784
  %884 = phi i16 [ %789, %784 ], [ %870, %868 ], [ %880, %875 ]
  %885 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %69
  store i16 %884, i16 addrspace(1)* %885, align 2, !tbaa !5
  %886 = add i32 %98, 144
  %887 = getelementptr inbounds [4 x [4 x [177 x i16]]], [4 x [4 x [177 x i16]]] addrspace(3)* @_ZZ22erosionColumns3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %886
  %888 = load i16, i16 addrspace(3)* %887, align 2, !tbaa !5
  br i1 %100, label %982, label %889

889:                                              ; preds = %883
  %890 = icmp ult i32 %101, 2
  br i1 %890, label %971, label %891

891:                                              ; preds = %889
  %892 = and i32 %101, 2147483646
  %893 = or i32 %101, 1
  %894 = insertelement <2 x i16> poison, i16 %888, i64 0
  %895 = shufflevector <2 x i16> %894, <2 x i16> poison, <2 x i32> zeroinitializer
  %896 = add nsw i32 %101, -2
  %897 = lshr i32 %896, 1
  %898 = add nuw i32 %897, 1
  %899 = and i32 %898, 7
  %900 = icmp ult i32 %896, 14
  br i1 %900, label %950, label %901

901:                                              ; preds = %891
  %902 = and i32 %898, -8
  br label %903

903:                                              ; preds = %903, %901
  %904 = phi i32 [ 0, %901 ], [ %947, %903 ]
  %905 = phi <2 x i16> [ %895, %901 ], [ %946, %903 ]
  %906 = phi i32 [ 0, %901 ], [ %948, %903 ]
  %907 = or i32 %904, 1
  %908 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %907
  %909 = bitcast i16 addrspace(3)* %908 to <2 x i16> addrspace(3)*
  %910 = load <2 x i16>, <2 x i16> addrspace(3)* %909, align 2, !tbaa !5
  %911 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %905, <2 x i16> %910)
  %912 = or i32 %904, 3
  %913 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %912
  %914 = bitcast i16 addrspace(3)* %913 to <2 x i16> addrspace(3)*
  %915 = load <2 x i16>, <2 x i16> addrspace(3)* %914, align 2, !tbaa !5
  %916 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %911, <2 x i16> %915)
  %917 = or i32 %904, 5
  %918 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %917
  %919 = bitcast i16 addrspace(3)* %918 to <2 x i16> addrspace(3)*
  %920 = load <2 x i16>, <2 x i16> addrspace(3)* %919, align 2, !tbaa !5
  %921 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %916, <2 x i16> %920)
  %922 = or i32 %904, 7
  %923 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %922
  %924 = bitcast i16 addrspace(3)* %923 to <2 x i16> addrspace(3)*
  %925 = load <2 x i16>, <2 x i16> addrspace(3)* %924, align 2, !tbaa !5
  %926 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %921, <2 x i16> %925)
  %927 = or i32 %904, 9
  %928 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %927
  %929 = bitcast i16 addrspace(3)* %928 to <2 x i16> addrspace(3)*
  %930 = load <2 x i16>, <2 x i16> addrspace(3)* %929, align 2, !tbaa !5
  %931 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %926, <2 x i16> %930)
  %932 = or i32 %904, 11
  %933 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %932
  %934 = bitcast i16 addrspace(3)* %933 to <2 x i16> addrspace(3)*
  %935 = load <2 x i16>, <2 x i16> addrspace(3)* %934, align 2, !tbaa !5
  %936 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %931, <2 x i16> %935)
  %937 = or i32 %904, 13
  %938 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %937
  %939 = bitcast i16 addrspace(3)* %938 to <2 x i16> addrspace(3)*
  %940 = load <2 x i16>, <2 x i16> addrspace(3)* %939, align 2, !tbaa !5
  %941 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %936, <2 x i16> %940)
  %942 = or i32 %904, 15
  %943 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %942
  %944 = bitcast i16 addrspace(3)* %943 to <2 x i16> addrspace(3)*
  %945 = load <2 x i16>, <2 x i16> addrspace(3)* %944, align 2, !tbaa !5
  %946 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %941, <2 x i16> %945)
  %947 = add nuw i32 %904, 16
  %948 = add i32 %906, 8
  %949 = icmp eq i32 %948, %902
  br i1 %949, label %950, label %903, !llvm.loop !37

950:                                              ; preds = %903, %891
  %951 = phi <2 x i16> [ undef, %891 ], [ %946, %903 ]
  %952 = phi i32 [ 0, %891 ], [ %947, %903 ]
  %953 = phi <2 x i16> [ %895, %891 ], [ %946, %903 ]
  %954 = icmp eq i32 %899, 0
  br i1 %954, label %967, label %955

955:                                              ; preds = %950, %955
  %956 = phi i32 [ %964, %955 ], [ %952, %950 ]
  %957 = phi <2 x i16> [ %963, %955 ], [ %953, %950 ]
  %958 = phi i32 [ %965, %955 ], [ 0, %950 ]
  %959 = or i32 %956, 1
  %960 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %959
  %961 = bitcast i16 addrspace(3)* %960 to <2 x i16> addrspace(3)*
  %962 = load <2 x i16>, <2 x i16> addrspace(3)* %961, align 2, !tbaa !5
  %963 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %957, <2 x i16> %962)
  %964 = add nuw i32 %956, 2
  %965 = add i32 %958, 1
  %966 = icmp eq i32 %965, %899
  br i1 %966, label %967, label %955, !llvm.loop !38

967:                                              ; preds = %955, %950
  %968 = phi <2 x i16> [ %951, %950 ], [ %963, %955 ]
  %969 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %968)
  %970 = icmp eq i32 %101, %892
  br i1 %970, label %982, label %971

971:                                              ; preds = %889, %967
  %972 = phi i32 [ 1, %889 ], [ %893, %967 ]
  %973 = phi i16 [ %888, %889 ], [ %969, %967 ]
  br label %974

974:                                              ; preds = %971, %974
  %975 = phi i32 [ %980, %974 ], [ %972, %971 ]
  %976 = phi i16 [ %979, %974 ], [ %973, %971 ]
  %977 = getelementptr inbounds i16, i16 addrspace(3)* %887, i32 %975
  %978 = load i16, i16 addrspace(3)* %977, align 2, !tbaa !5
  %979 = tail call i16 @llvm.umin.i16(i16 %976, i16 %978)
  %980 = add nuw nsw i32 %975, 1
  %981 = icmp eq i32 %975, %101
  br i1 %981, label %982, label %974, !llvm.loop !39

982:                                              ; preds = %974, %967, %883
  %983 = phi i16 [ %888, %883 ], [ %969, %967 ], [ %979, %974 ]
  %984 = getelementptr inbounds i16, i16 addrspace(1)* %80, i64 %75
  store i16 %983, i16 addrspace(1)* %984, align 2, !tbaa !5
  ret void

985:                                              ; preds = %187, %985
  %986 = phi i32 [ %991, %985 ], [ %188, %187 ]
  %987 = phi i16 [ %990, %985 ], [ %189, %187 ]
  %988 = getelementptr inbounds i16, i16 addrspace(3)* %103, i32 %986
  %989 = load i16, i16 addrspace(3)* %988, align 2, !tbaa !5
  %990 = tail call i16 @llvm.umin.i16(i16 %987, i16 %989)
  %991 = add nuw nsw i32 %986, 1
  %992 = icmp eq i32 %986, %101
  br i1 %992, label %190, label %985, !llvm.loop !40
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
!19 = distinct !{!19, !11, !12}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !11, !18, !12}
!22 = distinct !{!22, !11, !12}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !11, !18, !12}
!25 = distinct !{!25, !11, !12}
!26 = distinct !{!26, !14}
!27 = distinct !{!27, !11, !18, !12}
!28 = distinct !{!28, !11, !12}
!29 = distinct !{!29, !14}
!30 = distinct !{!30, !11, !18, !12}
!31 = distinct !{!31, !11, !12}
!32 = distinct !{!32, !14}
!33 = distinct !{!33, !11, !18, !12}
!34 = distinct !{!34, !11, !12}
!35 = distinct !{!35, !14}
!36 = distinct !{!36, !11, !18, !12}
!37 = distinct !{!37, !11, !12}
!38 = distinct !{!38, !14}
!39 = distinct !{!39, !11, !18, !12}
!40 = distinct !{!40, !11, !18, !12}
