; ModuleID = '../data/hip_kernels/1169/22/main.cu'
source_filename = "../data/hip_kernels/1169/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19erosionRows3DKernelPtS_iiiiE4smem = internal unnamed_addr addrspace(3) global [4 x [4 x [160 x i16]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19erosionRows3DKernelPtS_iiii(i16 addrspace(1)* nocapture writeonly %0, i16 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 7
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add nsw i32 %11, -16
  %13 = add i32 %12, %10
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = shl i32 %14, 2
  %16 = add i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %18 = shl i32 %17, 2
  %19 = add i32 %18, %7
  %20 = mul nsw i32 %19, %3
  %21 = add nsw i32 %16, %20
  %22 = mul nsw i32 %21, %2
  %23 = add nsw i32 %22, %13
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %24
  %26 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 16
  %27 = load i16, i16 addrspace(1)* %26, align 2, !tbaa !5, !amdgpu.noclobber !9
  %28 = add nuw nsw i32 %11, 16
  %29 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %28
  store i16 %27, i16 addrspace(3)* %29, align 2, !tbaa !5
  %30 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 32
  %31 = load i16, i16 addrspace(1)* %30, align 2, !tbaa !5, !amdgpu.noclobber !9
  %32 = add nuw nsw i32 %11, 32
  %33 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %32
  store i16 %31, i16 addrspace(3)* %33, align 2, !tbaa !5
  %34 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 48
  %35 = load i16, i16 addrspace(1)* %34, align 2, !tbaa !5, !amdgpu.noclobber !9
  %36 = add nuw nsw i32 %11, 48
  %37 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %36
  store i16 %35, i16 addrspace(3)* %37, align 2, !tbaa !5
  %38 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 64
  %39 = load i16, i16 addrspace(1)* %38, align 2, !tbaa !5, !amdgpu.noclobber !9
  %40 = add nuw nsw i32 %11, 64
  %41 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %40
  store i16 %39, i16 addrspace(3)* %41, align 2, !tbaa !5
  %42 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 80
  %43 = load i16, i16 addrspace(1)* %42, align 2, !tbaa !5, !amdgpu.noclobber !9
  %44 = add nuw nsw i32 %11, 80
  %45 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %44
  store i16 %43, i16 addrspace(3)* %45, align 2, !tbaa !5
  %46 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 96
  %47 = load i16, i16 addrspace(1)* %46, align 2, !tbaa !5, !amdgpu.noclobber !9
  %48 = add nuw nsw i32 %11, 96
  %49 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %48
  store i16 %47, i16 addrspace(3)* %49, align 2, !tbaa !5
  %50 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 112
  %51 = load i16, i16 addrspace(1)* %50, align 2, !tbaa !5, !amdgpu.noclobber !9
  %52 = add nuw nsw i32 %11, 112
  %53 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %52
  store i16 %51, i16 addrspace(3)* %53, align 2, !tbaa !5
  %54 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 128
  %55 = load i16, i16 addrspace(1)* %54, align 2, !tbaa !5, !amdgpu.noclobber !9
  %56 = add nuw nsw i32 %11, 128
  %57 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %56
  store i16 %55, i16 addrspace(3)* %57, align 2, !tbaa !5
  %58 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %24
  %59 = icmp sgt i32 %13, -1
  br i1 %59, label %60, label %62

60:                                               ; preds = %6
  %61 = load i16, i16 addrspace(1)* %25, align 2, !tbaa !5, !amdgpu.noclobber !9
  br label %62

62:                                               ; preds = %6, %60
  %63 = phi i16 [ %61, %60 ], [ 0, %6 ]
  %64 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %11
  store i16 %63, i16 addrspace(3)* %64, align 2, !tbaa !5
  %65 = add nsw i32 %13, 144
  %66 = icmp slt i32 %65, %2
  br i1 %66, label %67, label %70

67:                                               ; preds = %62
  %68 = getelementptr inbounds i16, i16 addrspace(1)* %25, i64 144
  %69 = load i16, i16 addrspace(1)* %68, align 2, !tbaa !5, !amdgpu.noclobber !9
  br label %70

70:                                               ; preds = %62, %67
  %71 = phi i16 [ %69, %67 ], [ 0, %62 ]
  %72 = add nuw nsw i32 %11, 144
  %73 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %72
  store i16 %71, i16 addrspace(3)* %73, align 2, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = sub i32 %11, %5
  %75 = shl i32 %5, 1
  %76 = icmp slt i32 %5, 1
  %77 = tail call i32 @llvm.smax.i32(i32 %75, i32 1)
  %78 = add i32 %74, 16
  %79 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %78
  %80 = load i16, i16 addrspace(3)* %79, align 2, !tbaa !5
  br i1 %76, label %166, label %81

81:                                               ; preds = %70
  %82 = icmp ult i32 %77, 2
  br i1 %82, label %163, label %83

83:                                               ; preds = %81
  %84 = and i32 %77, 2147483646
  %85 = or i32 %77, 1
  %86 = insertelement <2 x i16> poison, i16 %80, i64 0
  %87 = shufflevector <2 x i16> %86, <2 x i16> poison, <2 x i32> zeroinitializer
  %88 = add nsw i32 %77, -2
  %89 = lshr i32 %88, 1
  %90 = add nuw i32 %89, 1
  %91 = and i32 %90, 7
  %92 = icmp ult i32 %88, 14
  br i1 %92, label %142, label %93

93:                                               ; preds = %83
  %94 = and i32 %90, -8
  br label %95

95:                                               ; preds = %95, %93
  %96 = phi i32 [ 0, %93 ], [ %139, %95 ]
  %97 = phi <2 x i16> [ %87, %93 ], [ %138, %95 ]
  %98 = phi i32 [ 0, %93 ], [ %140, %95 ]
  %99 = or i32 %96, 1
  %100 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %99
  %101 = bitcast i16 addrspace(3)* %100 to <2 x i16> addrspace(3)*
  %102 = load <2 x i16>, <2 x i16> addrspace(3)* %101, align 2, !tbaa !5
  %103 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %97, <2 x i16> %102)
  %104 = or i32 %96, 3
  %105 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %104
  %106 = bitcast i16 addrspace(3)* %105 to <2 x i16> addrspace(3)*
  %107 = load <2 x i16>, <2 x i16> addrspace(3)* %106, align 2, !tbaa !5
  %108 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %103, <2 x i16> %107)
  %109 = or i32 %96, 5
  %110 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %109
  %111 = bitcast i16 addrspace(3)* %110 to <2 x i16> addrspace(3)*
  %112 = load <2 x i16>, <2 x i16> addrspace(3)* %111, align 2, !tbaa !5
  %113 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %108, <2 x i16> %112)
  %114 = or i32 %96, 7
  %115 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %114
  %116 = bitcast i16 addrspace(3)* %115 to <2 x i16> addrspace(3)*
  %117 = load <2 x i16>, <2 x i16> addrspace(3)* %116, align 2, !tbaa !5
  %118 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %113, <2 x i16> %117)
  %119 = or i32 %96, 9
  %120 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %119
  %121 = bitcast i16 addrspace(3)* %120 to <2 x i16> addrspace(3)*
  %122 = load <2 x i16>, <2 x i16> addrspace(3)* %121, align 2, !tbaa !5
  %123 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %118, <2 x i16> %122)
  %124 = or i32 %96, 11
  %125 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %124
  %126 = bitcast i16 addrspace(3)* %125 to <2 x i16> addrspace(3)*
  %127 = load <2 x i16>, <2 x i16> addrspace(3)* %126, align 2, !tbaa !5
  %128 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %123, <2 x i16> %127)
  %129 = or i32 %96, 13
  %130 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %129
  %131 = bitcast i16 addrspace(3)* %130 to <2 x i16> addrspace(3)*
  %132 = load <2 x i16>, <2 x i16> addrspace(3)* %131, align 2, !tbaa !5
  %133 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %128, <2 x i16> %132)
  %134 = or i32 %96, 15
  %135 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %134
  %136 = bitcast i16 addrspace(3)* %135 to <2 x i16> addrspace(3)*
  %137 = load <2 x i16>, <2 x i16> addrspace(3)* %136, align 2, !tbaa !5
  %138 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %133, <2 x i16> %137)
  %139 = add nuw i32 %96, 16
  %140 = add i32 %98, 8
  %141 = icmp eq i32 %140, %94
  br i1 %141, label %142, label %95, !llvm.loop !10

142:                                              ; preds = %95, %83
  %143 = phi <2 x i16> [ undef, %83 ], [ %138, %95 ]
  %144 = phi i32 [ 0, %83 ], [ %139, %95 ]
  %145 = phi <2 x i16> [ %87, %83 ], [ %138, %95 ]
  %146 = icmp eq i32 %91, 0
  br i1 %146, label %159, label %147

147:                                              ; preds = %142, %147
  %148 = phi i32 [ %156, %147 ], [ %144, %142 ]
  %149 = phi <2 x i16> [ %155, %147 ], [ %145, %142 ]
  %150 = phi i32 [ %157, %147 ], [ 0, %142 ]
  %151 = or i32 %148, 1
  %152 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %151
  %153 = bitcast i16 addrspace(3)* %152 to <2 x i16> addrspace(3)*
  %154 = load <2 x i16>, <2 x i16> addrspace(3)* %153, align 2, !tbaa !5
  %155 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %149, <2 x i16> %154)
  %156 = add nuw i32 %148, 2
  %157 = add i32 %150, 1
  %158 = icmp eq i32 %157, %91
  br i1 %158, label %159, label %147, !llvm.loop !13

159:                                              ; preds = %147, %142
  %160 = phi <2 x i16> [ %143, %142 ], [ %155, %147 ]
  %161 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %160)
  %162 = icmp eq i32 %77, %84
  br i1 %162, label %166, label %163

163:                                              ; preds = %81, %159
  %164 = phi i32 [ 1, %81 ], [ %85, %159 ]
  %165 = phi i16 [ %80, %81 ], [ %161, %159 ]
  br label %862

166:                                              ; preds = %862, %159, %70
  %167 = phi i16 [ %80, %70 ], [ %161, %159 ], [ %867, %862 ]
  %168 = getelementptr inbounds i16, i16 addrspace(1)* %58, i64 16
  store i16 %167, i16 addrspace(1)* %168, align 2, !tbaa !5
  %169 = add i32 %74, 32
  %170 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %169
  %171 = load i16, i16 addrspace(3)* %170, align 2, !tbaa !5
  br i1 %76, label %265, label %172

172:                                              ; preds = %166
  %173 = icmp ult i32 %77, 2
  br i1 %173, label %254, label %174

174:                                              ; preds = %172
  %175 = and i32 %77, 2147483646
  %176 = or i32 %77, 1
  %177 = insertelement <2 x i16> poison, i16 %171, i64 0
  %178 = shufflevector <2 x i16> %177, <2 x i16> poison, <2 x i32> zeroinitializer
  %179 = add nsw i32 %77, -2
  %180 = lshr i32 %179, 1
  %181 = add nuw i32 %180, 1
  %182 = and i32 %181, 7
  %183 = icmp ult i32 %179, 14
  br i1 %183, label %233, label %184

184:                                              ; preds = %174
  %185 = and i32 %181, -8
  br label %186

186:                                              ; preds = %186, %184
  %187 = phi i32 [ 0, %184 ], [ %230, %186 ]
  %188 = phi <2 x i16> [ %178, %184 ], [ %229, %186 ]
  %189 = phi i32 [ 0, %184 ], [ %231, %186 ]
  %190 = or i32 %187, 1
  %191 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %190
  %192 = bitcast i16 addrspace(3)* %191 to <2 x i16> addrspace(3)*
  %193 = load <2 x i16>, <2 x i16> addrspace(3)* %192, align 2, !tbaa !5
  %194 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %188, <2 x i16> %193)
  %195 = or i32 %187, 3
  %196 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %195
  %197 = bitcast i16 addrspace(3)* %196 to <2 x i16> addrspace(3)*
  %198 = load <2 x i16>, <2 x i16> addrspace(3)* %197, align 2, !tbaa !5
  %199 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %194, <2 x i16> %198)
  %200 = or i32 %187, 5
  %201 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %200
  %202 = bitcast i16 addrspace(3)* %201 to <2 x i16> addrspace(3)*
  %203 = load <2 x i16>, <2 x i16> addrspace(3)* %202, align 2, !tbaa !5
  %204 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %199, <2 x i16> %203)
  %205 = or i32 %187, 7
  %206 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %205
  %207 = bitcast i16 addrspace(3)* %206 to <2 x i16> addrspace(3)*
  %208 = load <2 x i16>, <2 x i16> addrspace(3)* %207, align 2, !tbaa !5
  %209 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %204, <2 x i16> %208)
  %210 = or i32 %187, 9
  %211 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %210
  %212 = bitcast i16 addrspace(3)* %211 to <2 x i16> addrspace(3)*
  %213 = load <2 x i16>, <2 x i16> addrspace(3)* %212, align 2, !tbaa !5
  %214 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %209, <2 x i16> %213)
  %215 = or i32 %187, 11
  %216 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %215
  %217 = bitcast i16 addrspace(3)* %216 to <2 x i16> addrspace(3)*
  %218 = load <2 x i16>, <2 x i16> addrspace(3)* %217, align 2, !tbaa !5
  %219 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %214, <2 x i16> %218)
  %220 = or i32 %187, 13
  %221 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %220
  %222 = bitcast i16 addrspace(3)* %221 to <2 x i16> addrspace(3)*
  %223 = load <2 x i16>, <2 x i16> addrspace(3)* %222, align 2, !tbaa !5
  %224 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %219, <2 x i16> %223)
  %225 = or i32 %187, 15
  %226 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %225
  %227 = bitcast i16 addrspace(3)* %226 to <2 x i16> addrspace(3)*
  %228 = load <2 x i16>, <2 x i16> addrspace(3)* %227, align 2, !tbaa !5
  %229 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %224, <2 x i16> %228)
  %230 = add nuw i32 %187, 16
  %231 = add i32 %189, 8
  %232 = icmp eq i32 %231, %185
  br i1 %232, label %233, label %186, !llvm.loop !15

233:                                              ; preds = %186, %174
  %234 = phi <2 x i16> [ undef, %174 ], [ %229, %186 ]
  %235 = phi i32 [ 0, %174 ], [ %230, %186 ]
  %236 = phi <2 x i16> [ %178, %174 ], [ %229, %186 ]
  %237 = icmp eq i32 %182, 0
  br i1 %237, label %250, label %238

238:                                              ; preds = %233, %238
  %239 = phi i32 [ %247, %238 ], [ %235, %233 ]
  %240 = phi <2 x i16> [ %246, %238 ], [ %236, %233 ]
  %241 = phi i32 [ %248, %238 ], [ 0, %233 ]
  %242 = or i32 %239, 1
  %243 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %242
  %244 = bitcast i16 addrspace(3)* %243 to <2 x i16> addrspace(3)*
  %245 = load <2 x i16>, <2 x i16> addrspace(3)* %244, align 2, !tbaa !5
  %246 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %240, <2 x i16> %245)
  %247 = add nuw i32 %239, 2
  %248 = add i32 %241, 1
  %249 = icmp eq i32 %248, %182
  br i1 %249, label %250, label %238, !llvm.loop !16

250:                                              ; preds = %238, %233
  %251 = phi <2 x i16> [ %234, %233 ], [ %246, %238 ]
  %252 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %251)
  %253 = icmp eq i32 %77, %175
  br i1 %253, label %265, label %254

254:                                              ; preds = %172, %250
  %255 = phi i32 [ 1, %172 ], [ %176, %250 ]
  %256 = phi i16 [ %171, %172 ], [ %252, %250 ]
  br label %257

257:                                              ; preds = %254, %257
  %258 = phi i32 [ %263, %257 ], [ %255, %254 ]
  %259 = phi i16 [ %262, %257 ], [ %256, %254 ]
  %260 = getelementptr inbounds i16, i16 addrspace(3)* %170, i32 %258
  %261 = load i16, i16 addrspace(3)* %260, align 2, !tbaa !5
  %262 = tail call i16 @llvm.umin.i16(i16 %259, i16 %261)
  %263 = add nuw nsw i32 %258, 1
  %264 = icmp eq i32 %258, %77
  br i1 %264, label %265, label %257, !llvm.loop !17

265:                                              ; preds = %257, %250, %166
  %266 = phi i16 [ %171, %166 ], [ %252, %250 ], [ %262, %257 ]
  %267 = getelementptr inbounds i16, i16 addrspace(1)* %58, i64 32
  store i16 %266, i16 addrspace(1)* %267, align 2, !tbaa !5
  %268 = add i32 %74, 48
  %269 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %268
  %270 = load i16, i16 addrspace(3)* %269, align 2, !tbaa !5
  br i1 %76, label %364, label %271

271:                                              ; preds = %265
  %272 = icmp ult i32 %77, 2
  br i1 %272, label %353, label %273

273:                                              ; preds = %271
  %274 = and i32 %77, 2147483646
  %275 = or i32 %77, 1
  %276 = insertelement <2 x i16> poison, i16 %270, i64 0
  %277 = shufflevector <2 x i16> %276, <2 x i16> poison, <2 x i32> zeroinitializer
  %278 = add nsw i32 %77, -2
  %279 = lshr i32 %278, 1
  %280 = add nuw i32 %279, 1
  %281 = and i32 %280, 7
  %282 = icmp ult i32 %278, 14
  br i1 %282, label %332, label %283

283:                                              ; preds = %273
  %284 = and i32 %280, -8
  br label %285

285:                                              ; preds = %285, %283
  %286 = phi i32 [ 0, %283 ], [ %329, %285 ]
  %287 = phi <2 x i16> [ %277, %283 ], [ %328, %285 ]
  %288 = phi i32 [ 0, %283 ], [ %330, %285 ]
  %289 = or i32 %286, 1
  %290 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %289
  %291 = bitcast i16 addrspace(3)* %290 to <2 x i16> addrspace(3)*
  %292 = load <2 x i16>, <2 x i16> addrspace(3)* %291, align 2, !tbaa !5
  %293 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %287, <2 x i16> %292)
  %294 = or i32 %286, 3
  %295 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %294
  %296 = bitcast i16 addrspace(3)* %295 to <2 x i16> addrspace(3)*
  %297 = load <2 x i16>, <2 x i16> addrspace(3)* %296, align 2, !tbaa !5
  %298 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %293, <2 x i16> %297)
  %299 = or i32 %286, 5
  %300 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %299
  %301 = bitcast i16 addrspace(3)* %300 to <2 x i16> addrspace(3)*
  %302 = load <2 x i16>, <2 x i16> addrspace(3)* %301, align 2, !tbaa !5
  %303 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %298, <2 x i16> %302)
  %304 = or i32 %286, 7
  %305 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %304
  %306 = bitcast i16 addrspace(3)* %305 to <2 x i16> addrspace(3)*
  %307 = load <2 x i16>, <2 x i16> addrspace(3)* %306, align 2, !tbaa !5
  %308 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %303, <2 x i16> %307)
  %309 = or i32 %286, 9
  %310 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %309
  %311 = bitcast i16 addrspace(3)* %310 to <2 x i16> addrspace(3)*
  %312 = load <2 x i16>, <2 x i16> addrspace(3)* %311, align 2, !tbaa !5
  %313 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %308, <2 x i16> %312)
  %314 = or i32 %286, 11
  %315 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %314
  %316 = bitcast i16 addrspace(3)* %315 to <2 x i16> addrspace(3)*
  %317 = load <2 x i16>, <2 x i16> addrspace(3)* %316, align 2, !tbaa !5
  %318 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %313, <2 x i16> %317)
  %319 = or i32 %286, 13
  %320 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %319
  %321 = bitcast i16 addrspace(3)* %320 to <2 x i16> addrspace(3)*
  %322 = load <2 x i16>, <2 x i16> addrspace(3)* %321, align 2, !tbaa !5
  %323 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %318, <2 x i16> %322)
  %324 = or i32 %286, 15
  %325 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %324
  %326 = bitcast i16 addrspace(3)* %325 to <2 x i16> addrspace(3)*
  %327 = load <2 x i16>, <2 x i16> addrspace(3)* %326, align 2, !tbaa !5
  %328 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %323, <2 x i16> %327)
  %329 = add nuw i32 %286, 16
  %330 = add i32 %288, 8
  %331 = icmp eq i32 %330, %284
  br i1 %331, label %332, label %285, !llvm.loop !19

332:                                              ; preds = %285, %273
  %333 = phi <2 x i16> [ undef, %273 ], [ %328, %285 ]
  %334 = phi i32 [ 0, %273 ], [ %329, %285 ]
  %335 = phi <2 x i16> [ %277, %273 ], [ %328, %285 ]
  %336 = icmp eq i32 %281, 0
  br i1 %336, label %349, label %337

337:                                              ; preds = %332, %337
  %338 = phi i32 [ %346, %337 ], [ %334, %332 ]
  %339 = phi <2 x i16> [ %345, %337 ], [ %335, %332 ]
  %340 = phi i32 [ %347, %337 ], [ 0, %332 ]
  %341 = or i32 %338, 1
  %342 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %341
  %343 = bitcast i16 addrspace(3)* %342 to <2 x i16> addrspace(3)*
  %344 = load <2 x i16>, <2 x i16> addrspace(3)* %343, align 2, !tbaa !5
  %345 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %339, <2 x i16> %344)
  %346 = add nuw i32 %338, 2
  %347 = add i32 %340, 1
  %348 = icmp eq i32 %347, %281
  br i1 %348, label %349, label %337, !llvm.loop !20

349:                                              ; preds = %337, %332
  %350 = phi <2 x i16> [ %333, %332 ], [ %345, %337 ]
  %351 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %350)
  %352 = icmp eq i32 %77, %274
  br i1 %352, label %364, label %353

353:                                              ; preds = %271, %349
  %354 = phi i32 [ 1, %271 ], [ %275, %349 ]
  %355 = phi i16 [ %270, %271 ], [ %351, %349 ]
  br label %356

356:                                              ; preds = %353, %356
  %357 = phi i32 [ %362, %356 ], [ %354, %353 ]
  %358 = phi i16 [ %361, %356 ], [ %355, %353 ]
  %359 = getelementptr inbounds i16, i16 addrspace(3)* %269, i32 %357
  %360 = load i16, i16 addrspace(3)* %359, align 2, !tbaa !5
  %361 = tail call i16 @llvm.umin.i16(i16 %358, i16 %360)
  %362 = add nuw nsw i32 %357, 1
  %363 = icmp eq i32 %357, %77
  br i1 %363, label %364, label %356, !llvm.loop !21

364:                                              ; preds = %356, %349, %265
  %365 = phi i16 [ %270, %265 ], [ %351, %349 ], [ %361, %356 ]
  %366 = getelementptr inbounds i16, i16 addrspace(1)* %58, i64 48
  store i16 %365, i16 addrspace(1)* %366, align 2, !tbaa !5
  %367 = add i32 %74, 64
  %368 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %367
  %369 = load i16, i16 addrspace(3)* %368, align 2, !tbaa !5
  br i1 %76, label %463, label %370

370:                                              ; preds = %364
  %371 = icmp ult i32 %77, 2
  br i1 %371, label %452, label %372

372:                                              ; preds = %370
  %373 = and i32 %77, 2147483646
  %374 = or i32 %77, 1
  %375 = insertelement <2 x i16> poison, i16 %369, i64 0
  %376 = shufflevector <2 x i16> %375, <2 x i16> poison, <2 x i32> zeroinitializer
  %377 = add nsw i32 %77, -2
  %378 = lshr i32 %377, 1
  %379 = add nuw i32 %378, 1
  %380 = and i32 %379, 7
  %381 = icmp ult i32 %377, 14
  br i1 %381, label %431, label %382

382:                                              ; preds = %372
  %383 = and i32 %379, -8
  br label %384

384:                                              ; preds = %384, %382
  %385 = phi i32 [ 0, %382 ], [ %428, %384 ]
  %386 = phi <2 x i16> [ %376, %382 ], [ %427, %384 ]
  %387 = phi i32 [ 0, %382 ], [ %429, %384 ]
  %388 = or i32 %385, 1
  %389 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %388
  %390 = bitcast i16 addrspace(3)* %389 to <2 x i16> addrspace(3)*
  %391 = load <2 x i16>, <2 x i16> addrspace(3)* %390, align 2, !tbaa !5
  %392 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %386, <2 x i16> %391)
  %393 = or i32 %385, 3
  %394 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %393
  %395 = bitcast i16 addrspace(3)* %394 to <2 x i16> addrspace(3)*
  %396 = load <2 x i16>, <2 x i16> addrspace(3)* %395, align 2, !tbaa !5
  %397 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %392, <2 x i16> %396)
  %398 = or i32 %385, 5
  %399 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %398
  %400 = bitcast i16 addrspace(3)* %399 to <2 x i16> addrspace(3)*
  %401 = load <2 x i16>, <2 x i16> addrspace(3)* %400, align 2, !tbaa !5
  %402 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %397, <2 x i16> %401)
  %403 = or i32 %385, 7
  %404 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %403
  %405 = bitcast i16 addrspace(3)* %404 to <2 x i16> addrspace(3)*
  %406 = load <2 x i16>, <2 x i16> addrspace(3)* %405, align 2, !tbaa !5
  %407 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %402, <2 x i16> %406)
  %408 = or i32 %385, 9
  %409 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %408
  %410 = bitcast i16 addrspace(3)* %409 to <2 x i16> addrspace(3)*
  %411 = load <2 x i16>, <2 x i16> addrspace(3)* %410, align 2, !tbaa !5
  %412 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %407, <2 x i16> %411)
  %413 = or i32 %385, 11
  %414 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %413
  %415 = bitcast i16 addrspace(3)* %414 to <2 x i16> addrspace(3)*
  %416 = load <2 x i16>, <2 x i16> addrspace(3)* %415, align 2, !tbaa !5
  %417 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %412, <2 x i16> %416)
  %418 = or i32 %385, 13
  %419 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %418
  %420 = bitcast i16 addrspace(3)* %419 to <2 x i16> addrspace(3)*
  %421 = load <2 x i16>, <2 x i16> addrspace(3)* %420, align 2, !tbaa !5
  %422 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %417, <2 x i16> %421)
  %423 = or i32 %385, 15
  %424 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %423
  %425 = bitcast i16 addrspace(3)* %424 to <2 x i16> addrspace(3)*
  %426 = load <2 x i16>, <2 x i16> addrspace(3)* %425, align 2, !tbaa !5
  %427 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %422, <2 x i16> %426)
  %428 = add nuw i32 %385, 16
  %429 = add i32 %387, 8
  %430 = icmp eq i32 %429, %383
  br i1 %430, label %431, label %384, !llvm.loop !22

431:                                              ; preds = %384, %372
  %432 = phi <2 x i16> [ undef, %372 ], [ %427, %384 ]
  %433 = phi i32 [ 0, %372 ], [ %428, %384 ]
  %434 = phi <2 x i16> [ %376, %372 ], [ %427, %384 ]
  %435 = icmp eq i32 %380, 0
  br i1 %435, label %448, label %436

436:                                              ; preds = %431, %436
  %437 = phi i32 [ %445, %436 ], [ %433, %431 ]
  %438 = phi <2 x i16> [ %444, %436 ], [ %434, %431 ]
  %439 = phi i32 [ %446, %436 ], [ 0, %431 ]
  %440 = or i32 %437, 1
  %441 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %440
  %442 = bitcast i16 addrspace(3)* %441 to <2 x i16> addrspace(3)*
  %443 = load <2 x i16>, <2 x i16> addrspace(3)* %442, align 2, !tbaa !5
  %444 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %438, <2 x i16> %443)
  %445 = add nuw i32 %437, 2
  %446 = add i32 %439, 1
  %447 = icmp eq i32 %446, %380
  br i1 %447, label %448, label %436, !llvm.loop !23

448:                                              ; preds = %436, %431
  %449 = phi <2 x i16> [ %432, %431 ], [ %444, %436 ]
  %450 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %449)
  %451 = icmp eq i32 %77, %373
  br i1 %451, label %463, label %452

452:                                              ; preds = %370, %448
  %453 = phi i32 [ 1, %370 ], [ %374, %448 ]
  %454 = phi i16 [ %369, %370 ], [ %450, %448 ]
  br label %455

455:                                              ; preds = %452, %455
  %456 = phi i32 [ %461, %455 ], [ %453, %452 ]
  %457 = phi i16 [ %460, %455 ], [ %454, %452 ]
  %458 = getelementptr inbounds i16, i16 addrspace(3)* %368, i32 %456
  %459 = load i16, i16 addrspace(3)* %458, align 2, !tbaa !5
  %460 = tail call i16 @llvm.umin.i16(i16 %457, i16 %459)
  %461 = add nuw nsw i32 %456, 1
  %462 = icmp eq i32 %456, %77
  br i1 %462, label %463, label %455, !llvm.loop !24

463:                                              ; preds = %455, %448, %364
  %464 = phi i16 [ %369, %364 ], [ %450, %448 ], [ %460, %455 ]
  %465 = getelementptr inbounds i16, i16 addrspace(1)* %58, i64 64
  store i16 %464, i16 addrspace(1)* %465, align 2, !tbaa !5
  %466 = add i32 %74, 80
  %467 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %466
  %468 = load i16, i16 addrspace(3)* %467, align 2, !tbaa !5
  br i1 %76, label %562, label %469

469:                                              ; preds = %463
  %470 = icmp ult i32 %77, 2
  br i1 %470, label %551, label %471

471:                                              ; preds = %469
  %472 = and i32 %77, 2147483646
  %473 = or i32 %77, 1
  %474 = insertelement <2 x i16> poison, i16 %468, i64 0
  %475 = shufflevector <2 x i16> %474, <2 x i16> poison, <2 x i32> zeroinitializer
  %476 = add nsw i32 %77, -2
  %477 = lshr i32 %476, 1
  %478 = add nuw i32 %477, 1
  %479 = and i32 %478, 7
  %480 = icmp ult i32 %476, 14
  br i1 %480, label %530, label %481

481:                                              ; preds = %471
  %482 = and i32 %478, -8
  br label %483

483:                                              ; preds = %483, %481
  %484 = phi i32 [ 0, %481 ], [ %527, %483 ]
  %485 = phi <2 x i16> [ %475, %481 ], [ %526, %483 ]
  %486 = phi i32 [ 0, %481 ], [ %528, %483 ]
  %487 = or i32 %484, 1
  %488 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %487
  %489 = bitcast i16 addrspace(3)* %488 to <2 x i16> addrspace(3)*
  %490 = load <2 x i16>, <2 x i16> addrspace(3)* %489, align 2, !tbaa !5
  %491 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %485, <2 x i16> %490)
  %492 = or i32 %484, 3
  %493 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %492
  %494 = bitcast i16 addrspace(3)* %493 to <2 x i16> addrspace(3)*
  %495 = load <2 x i16>, <2 x i16> addrspace(3)* %494, align 2, !tbaa !5
  %496 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %491, <2 x i16> %495)
  %497 = or i32 %484, 5
  %498 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %497
  %499 = bitcast i16 addrspace(3)* %498 to <2 x i16> addrspace(3)*
  %500 = load <2 x i16>, <2 x i16> addrspace(3)* %499, align 2, !tbaa !5
  %501 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %496, <2 x i16> %500)
  %502 = or i32 %484, 7
  %503 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %502
  %504 = bitcast i16 addrspace(3)* %503 to <2 x i16> addrspace(3)*
  %505 = load <2 x i16>, <2 x i16> addrspace(3)* %504, align 2, !tbaa !5
  %506 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %501, <2 x i16> %505)
  %507 = or i32 %484, 9
  %508 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %507
  %509 = bitcast i16 addrspace(3)* %508 to <2 x i16> addrspace(3)*
  %510 = load <2 x i16>, <2 x i16> addrspace(3)* %509, align 2, !tbaa !5
  %511 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %506, <2 x i16> %510)
  %512 = or i32 %484, 11
  %513 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %512
  %514 = bitcast i16 addrspace(3)* %513 to <2 x i16> addrspace(3)*
  %515 = load <2 x i16>, <2 x i16> addrspace(3)* %514, align 2, !tbaa !5
  %516 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %511, <2 x i16> %515)
  %517 = or i32 %484, 13
  %518 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %517
  %519 = bitcast i16 addrspace(3)* %518 to <2 x i16> addrspace(3)*
  %520 = load <2 x i16>, <2 x i16> addrspace(3)* %519, align 2, !tbaa !5
  %521 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %516, <2 x i16> %520)
  %522 = or i32 %484, 15
  %523 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %522
  %524 = bitcast i16 addrspace(3)* %523 to <2 x i16> addrspace(3)*
  %525 = load <2 x i16>, <2 x i16> addrspace(3)* %524, align 2, !tbaa !5
  %526 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %521, <2 x i16> %525)
  %527 = add nuw i32 %484, 16
  %528 = add i32 %486, 8
  %529 = icmp eq i32 %528, %482
  br i1 %529, label %530, label %483, !llvm.loop !25

530:                                              ; preds = %483, %471
  %531 = phi <2 x i16> [ undef, %471 ], [ %526, %483 ]
  %532 = phi i32 [ 0, %471 ], [ %527, %483 ]
  %533 = phi <2 x i16> [ %475, %471 ], [ %526, %483 ]
  %534 = icmp eq i32 %479, 0
  br i1 %534, label %547, label %535

535:                                              ; preds = %530, %535
  %536 = phi i32 [ %544, %535 ], [ %532, %530 ]
  %537 = phi <2 x i16> [ %543, %535 ], [ %533, %530 ]
  %538 = phi i32 [ %545, %535 ], [ 0, %530 ]
  %539 = or i32 %536, 1
  %540 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %539
  %541 = bitcast i16 addrspace(3)* %540 to <2 x i16> addrspace(3)*
  %542 = load <2 x i16>, <2 x i16> addrspace(3)* %541, align 2, !tbaa !5
  %543 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %537, <2 x i16> %542)
  %544 = add nuw i32 %536, 2
  %545 = add i32 %538, 1
  %546 = icmp eq i32 %545, %479
  br i1 %546, label %547, label %535, !llvm.loop !26

547:                                              ; preds = %535, %530
  %548 = phi <2 x i16> [ %531, %530 ], [ %543, %535 ]
  %549 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %548)
  %550 = icmp eq i32 %77, %472
  br i1 %550, label %562, label %551

551:                                              ; preds = %469, %547
  %552 = phi i32 [ 1, %469 ], [ %473, %547 ]
  %553 = phi i16 [ %468, %469 ], [ %549, %547 ]
  br label %554

554:                                              ; preds = %551, %554
  %555 = phi i32 [ %560, %554 ], [ %552, %551 ]
  %556 = phi i16 [ %559, %554 ], [ %553, %551 ]
  %557 = getelementptr inbounds i16, i16 addrspace(3)* %467, i32 %555
  %558 = load i16, i16 addrspace(3)* %557, align 2, !tbaa !5
  %559 = tail call i16 @llvm.umin.i16(i16 %556, i16 %558)
  %560 = add nuw nsw i32 %555, 1
  %561 = icmp eq i32 %555, %77
  br i1 %561, label %562, label %554, !llvm.loop !27

562:                                              ; preds = %554, %547, %463
  %563 = phi i16 [ %468, %463 ], [ %549, %547 ], [ %559, %554 ]
  %564 = getelementptr inbounds i16, i16 addrspace(1)* %58, i64 80
  store i16 %563, i16 addrspace(1)* %564, align 2, !tbaa !5
  %565 = add i32 %74, 96
  %566 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %565
  %567 = load i16, i16 addrspace(3)* %566, align 2, !tbaa !5
  br i1 %76, label %661, label %568

568:                                              ; preds = %562
  %569 = icmp ult i32 %77, 2
  br i1 %569, label %650, label %570

570:                                              ; preds = %568
  %571 = and i32 %77, 2147483646
  %572 = or i32 %77, 1
  %573 = insertelement <2 x i16> poison, i16 %567, i64 0
  %574 = shufflevector <2 x i16> %573, <2 x i16> poison, <2 x i32> zeroinitializer
  %575 = add nsw i32 %77, -2
  %576 = lshr i32 %575, 1
  %577 = add nuw i32 %576, 1
  %578 = and i32 %577, 7
  %579 = icmp ult i32 %575, 14
  br i1 %579, label %629, label %580

580:                                              ; preds = %570
  %581 = and i32 %577, -8
  br label %582

582:                                              ; preds = %582, %580
  %583 = phi i32 [ 0, %580 ], [ %626, %582 ]
  %584 = phi <2 x i16> [ %574, %580 ], [ %625, %582 ]
  %585 = phi i32 [ 0, %580 ], [ %627, %582 ]
  %586 = or i32 %583, 1
  %587 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %586
  %588 = bitcast i16 addrspace(3)* %587 to <2 x i16> addrspace(3)*
  %589 = load <2 x i16>, <2 x i16> addrspace(3)* %588, align 2, !tbaa !5
  %590 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %584, <2 x i16> %589)
  %591 = or i32 %583, 3
  %592 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %591
  %593 = bitcast i16 addrspace(3)* %592 to <2 x i16> addrspace(3)*
  %594 = load <2 x i16>, <2 x i16> addrspace(3)* %593, align 2, !tbaa !5
  %595 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %590, <2 x i16> %594)
  %596 = or i32 %583, 5
  %597 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %596
  %598 = bitcast i16 addrspace(3)* %597 to <2 x i16> addrspace(3)*
  %599 = load <2 x i16>, <2 x i16> addrspace(3)* %598, align 2, !tbaa !5
  %600 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %595, <2 x i16> %599)
  %601 = or i32 %583, 7
  %602 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %601
  %603 = bitcast i16 addrspace(3)* %602 to <2 x i16> addrspace(3)*
  %604 = load <2 x i16>, <2 x i16> addrspace(3)* %603, align 2, !tbaa !5
  %605 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %600, <2 x i16> %604)
  %606 = or i32 %583, 9
  %607 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %606
  %608 = bitcast i16 addrspace(3)* %607 to <2 x i16> addrspace(3)*
  %609 = load <2 x i16>, <2 x i16> addrspace(3)* %608, align 2, !tbaa !5
  %610 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %605, <2 x i16> %609)
  %611 = or i32 %583, 11
  %612 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %611
  %613 = bitcast i16 addrspace(3)* %612 to <2 x i16> addrspace(3)*
  %614 = load <2 x i16>, <2 x i16> addrspace(3)* %613, align 2, !tbaa !5
  %615 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %610, <2 x i16> %614)
  %616 = or i32 %583, 13
  %617 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %616
  %618 = bitcast i16 addrspace(3)* %617 to <2 x i16> addrspace(3)*
  %619 = load <2 x i16>, <2 x i16> addrspace(3)* %618, align 2, !tbaa !5
  %620 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %615, <2 x i16> %619)
  %621 = or i32 %583, 15
  %622 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %621
  %623 = bitcast i16 addrspace(3)* %622 to <2 x i16> addrspace(3)*
  %624 = load <2 x i16>, <2 x i16> addrspace(3)* %623, align 2, !tbaa !5
  %625 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %620, <2 x i16> %624)
  %626 = add nuw i32 %583, 16
  %627 = add i32 %585, 8
  %628 = icmp eq i32 %627, %581
  br i1 %628, label %629, label %582, !llvm.loop !28

629:                                              ; preds = %582, %570
  %630 = phi <2 x i16> [ undef, %570 ], [ %625, %582 ]
  %631 = phi i32 [ 0, %570 ], [ %626, %582 ]
  %632 = phi <2 x i16> [ %574, %570 ], [ %625, %582 ]
  %633 = icmp eq i32 %578, 0
  br i1 %633, label %646, label %634

634:                                              ; preds = %629, %634
  %635 = phi i32 [ %643, %634 ], [ %631, %629 ]
  %636 = phi <2 x i16> [ %642, %634 ], [ %632, %629 ]
  %637 = phi i32 [ %644, %634 ], [ 0, %629 ]
  %638 = or i32 %635, 1
  %639 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %638
  %640 = bitcast i16 addrspace(3)* %639 to <2 x i16> addrspace(3)*
  %641 = load <2 x i16>, <2 x i16> addrspace(3)* %640, align 2, !tbaa !5
  %642 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %636, <2 x i16> %641)
  %643 = add nuw i32 %635, 2
  %644 = add i32 %637, 1
  %645 = icmp eq i32 %644, %578
  br i1 %645, label %646, label %634, !llvm.loop !29

646:                                              ; preds = %634, %629
  %647 = phi <2 x i16> [ %630, %629 ], [ %642, %634 ]
  %648 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %647)
  %649 = icmp eq i32 %77, %571
  br i1 %649, label %661, label %650

650:                                              ; preds = %568, %646
  %651 = phi i32 [ 1, %568 ], [ %572, %646 ]
  %652 = phi i16 [ %567, %568 ], [ %648, %646 ]
  br label %653

653:                                              ; preds = %650, %653
  %654 = phi i32 [ %659, %653 ], [ %651, %650 ]
  %655 = phi i16 [ %658, %653 ], [ %652, %650 ]
  %656 = getelementptr inbounds i16, i16 addrspace(3)* %566, i32 %654
  %657 = load i16, i16 addrspace(3)* %656, align 2, !tbaa !5
  %658 = tail call i16 @llvm.umin.i16(i16 %655, i16 %657)
  %659 = add nuw nsw i32 %654, 1
  %660 = icmp eq i32 %654, %77
  br i1 %660, label %661, label %653, !llvm.loop !30

661:                                              ; preds = %653, %646, %562
  %662 = phi i16 [ %567, %562 ], [ %648, %646 ], [ %658, %653 ]
  %663 = getelementptr inbounds i16, i16 addrspace(1)* %58, i64 96
  store i16 %662, i16 addrspace(1)* %663, align 2, !tbaa !5
  %664 = add i32 %74, 112
  %665 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %664
  %666 = load i16, i16 addrspace(3)* %665, align 2, !tbaa !5
  br i1 %76, label %760, label %667

667:                                              ; preds = %661
  %668 = icmp ult i32 %77, 2
  br i1 %668, label %749, label %669

669:                                              ; preds = %667
  %670 = and i32 %77, 2147483646
  %671 = or i32 %77, 1
  %672 = insertelement <2 x i16> poison, i16 %666, i64 0
  %673 = shufflevector <2 x i16> %672, <2 x i16> poison, <2 x i32> zeroinitializer
  %674 = add nsw i32 %77, -2
  %675 = lshr i32 %674, 1
  %676 = add nuw i32 %675, 1
  %677 = and i32 %676, 7
  %678 = icmp ult i32 %674, 14
  br i1 %678, label %728, label %679

679:                                              ; preds = %669
  %680 = and i32 %676, -8
  br label %681

681:                                              ; preds = %681, %679
  %682 = phi i32 [ 0, %679 ], [ %725, %681 ]
  %683 = phi <2 x i16> [ %673, %679 ], [ %724, %681 ]
  %684 = phi i32 [ 0, %679 ], [ %726, %681 ]
  %685 = or i32 %682, 1
  %686 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %685
  %687 = bitcast i16 addrspace(3)* %686 to <2 x i16> addrspace(3)*
  %688 = load <2 x i16>, <2 x i16> addrspace(3)* %687, align 2, !tbaa !5
  %689 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %683, <2 x i16> %688)
  %690 = or i32 %682, 3
  %691 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %690
  %692 = bitcast i16 addrspace(3)* %691 to <2 x i16> addrspace(3)*
  %693 = load <2 x i16>, <2 x i16> addrspace(3)* %692, align 2, !tbaa !5
  %694 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %689, <2 x i16> %693)
  %695 = or i32 %682, 5
  %696 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %695
  %697 = bitcast i16 addrspace(3)* %696 to <2 x i16> addrspace(3)*
  %698 = load <2 x i16>, <2 x i16> addrspace(3)* %697, align 2, !tbaa !5
  %699 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %694, <2 x i16> %698)
  %700 = or i32 %682, 7
  %701 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %700
  %702 = bitcast i16 addrspace(3)* %701 to <2 x i16> addrspace(3)*
  %703 = load <2 x i16>, <2 x i16> addrspace(3)* %702, align 2, !tbaa !5
  %704 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %699, <2 x i16> %703)
  %705 = or i32 %682, 9
  %706 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %705
  %707 = bitcast i16 addrspace(3)* %706 to <2 x i16> addrspace(3)*
  %708 = load <2 x i16>, <2 x i16> addrspace(3)* %707, align 2, !tbaa !5
  %709 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %704, <2 x i16> %708)
  %710 = or i32 %682, 11
  %711 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %710
  %712 = bitcast i16 addrspace(3)* %711 to <2 x i16> addrspace(3)*
  %713 = load <2 x i16>, <2 x i16> addrspace(3)* %712, align 2, !tbaa !5
  %714 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %709, <2 x i16> %713)
  %715 = or i32 %682, 13
  %716 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %715
  %717 = bitcast i16 addrspace(3)* %716 to <2 x i16> addrspace(3)*
  %718 = load <2 x i16>, <2 x i16> addrspace(3)* %717, align 2, !tbaa !5
  %719 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %714, <2 x i16> %718)
  %720 = or i32 %682, 15
  %721 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %720
  %722 = bitcast i16 addrspace(3)* %721 to <2 x i16> addrspace(3)*
  %723 = load <2 x i16>, <2 x i16> addrspace(3)* %722, align 2, !tbaa !5
  %724 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %719, <2 x i16> %723)
  %725 = add nuw i32 %682, 16
  %726 = add i32 %684, 8
  %727 = icmp eq i32 %726, %680
  br i1 %727, label %728, label %681, !llvm.loop !31

728:                                              ; preds = %681, %669
  %729 = phi <2 x i16> [ undef, %669 ], [ %724, %681 ]
  %730 = phi i32 [ 0, %669 ], [ %725, %681 ]
  %731 = phi <2 x i16> [ %673, %669 ], [ %724, %681 ]
  %732 = icmp eq i32 %677, 0
  br i1 %732, label %745, label %733

733:                                              ; preds = %728, %733
  %734 = phi i32 [ %742, %733 ], [ %730, %728 ]
  %735 = phi <2 x i16> [ %741, %733 ], [ %731, %728 ]
  %736 = phi i32 [ %743, %733 ], [ 0, %728 ]
  %737 = or i32 %734, 1
  %738 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %737
  %739 = bitcast i16 addrspace(3)* %738 to <2 x i16> addrspace(3)*
  %740 = load <2 x i16>, <2 x i16> addrspace(3)* %739, align 2, !tbaa !5
  %741 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %735, <2 x i16> %740)
  %742 = add nuw i32 %734, 2
  %743 = add i32 %736, 1
  %744 = icmp eq i32 %743, %677
  br i1 %744, label %745, label %733, !llvm.loop !32

745:                                              ; preds = %733, %728
  %746 = phi <2 x i16> [ %729, %728 ], [ %741, %733 ]
  %747 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %746)
  %748 = icmp eq i32 %77, %670
  br i1 %748, label %760, label %749

749:                                              ; preds = %667, %745
  %750 = phi i32 [ 1, %667 ], [ %671, %745 ]
  %751 = phi i16 [ %666, %667 ], [ %747, %745 ]
  br label %752

752:                                              ; preds = %749, %752
  %753 = phi i32 [ %758, %752 ], [ %750, %749 ]
  %754 = phi i16 [ %757, %752 ], [ %751, %749 ]
  %755 = getelementptr inbounds i16, i16 addrspace(3)* %665, i32 %753
  %756 = load i16, i16 addrspace(3)* %755, align 2, !tbaa !5
  %757 = tail call i16 @llvm.umin.i16(i16 %754, i16 %756)
  %758 = add nuw nsw i32 %753, 1
  %759 = icmp eq i32 %753, %77
  br i1 %759, label %760, label %752, !llvm.loop !33

760:                                              ; preds = %752, %745, %661
  %761 = phi i16 [ %666, %661 ], [ %747, %745 ], [ %757, %752 ]
  %762 = getelementptr inbounds i16, i16 addrspace(1)* %58, i64 112
  store i16 %761, i16 addrspace(1)* %762, align 2, !tbaa !5
  %763 = add i32 %74, 128
  %764 = getelementptr inbounds [4 x [4 x [160 x i16]]], [4 x [4 x [160 x i16]]] addrspace(3)* @_ZZ19erosionRows3DKernelPtS_iiiiE4smem, i32 0, i32 %7, i32 %8, i32 %763
  %765 = load i16, i16 addrspace(3)* %764, align 2, !tbaa !5
  br i1 %76, label %859, label %766

766:                                              ; preds = %760
  %767 = icmp ult i32 %77, 2
  br i1 %767, label %848, label %768

768:                                              ; preds = %766
  %769 = and i32 %77, 2147483646
  %770 = or i32 %77, 1
  %771 = insertelement <2 x i16> poison, i16 %765, i64 0
  %772 = shufflevector <2 x i16> %771, <2 x i16> poison, <2 x i32> zeroinitializer
  %773 = add nsw i32 %77, -2
  %774 = lshr i32 %773, 1
  %775 = add nuw i32 %774, 1
  %776 = and i32 %775, 7
  %777 = icmp ult i32 %773, 14
  br i1 %777, label %827, label %778

778:                                              ; preds = %768
  %779 = and i32 %775, -8
  br label %780

780:                                              ; preds = %780, %778
  %781 = phi i32 [ 0, %778 ], [ %824, %780 ]
  %782 = phi <2 x i16> [ %772, %778 ], [ %823, %780 ]
  %783 = phi i32 [ 0, %778 ], [ %825, %780 ]
  %784 = or i32 %781, 1
  %785 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %784
  %786 = bitcast i16 addrspace(3)* %785 to <2 x i16> addrspace(3)*
  %787 = load <2 x i16>, <2 x i16> addrspace(3)* %786, align 2, !tbaa !5
  %788 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %782, <2 x i16> %787)
  %789 = or i32 %781, 3
  %790 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %789
  %791 = bitcast i16 addrspace(3)* %790 to <2 x i16> addrspace(3)*
  %792 = load <2 x i16>, <2 x i16> addrspace(3)* %791, align 2, !tbaa !5
  %793 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %788, <2 x i16> %792)
  %794 = or i32 %781, 5
  %795 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %794
  %796 = bitcast i16 addrspace(3)* %795 to <2 x i16> addrspace(3)*
  %797 = load <2 x i16>, <2 x i16> addrspace(3)* %796, align 2, !tbaa !5
  %798 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %793, <2 x i16> %797)
  %799 = or i32 %781, 7
  %800 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %799
  %801 = bitcast i16 addrspace(3)* %800 to <2 x i16> addrspace(3)*
  %802 = load <2 x i16>, <2 x i16> addrspace(3)* %801, align 2, !tbaa !5
  %803 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %798, <2 x i16> %802)
  %804 = or i32 %781, 9
  %805 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %804
  %806 = bitcast i16 addrspace(3)* %805 to <2 x i16> addrspace(3)*
  %807 = load <2 x i16>, <2 x i16> addrspace(3)* %806, align 2, !tbaa !5
  %808 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %803, <2 x i16> %807)
  %809 = or i32 %781, 11
  %810 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %809
  %811 = bitcast i16 addrspace(3)* %810 to <2 x i16> addrspace(3)*
  %812 = load <2 x i16>, <2 x i16> addrspace(3)* %811, align 2, !tbaa !5
  %813 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %808, <2 x i16> %812)
  %814 = or i32 %781, 13
  %815 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %814
  %816 = bitcast i16 addrspace(3)* %815 to <2 x i16> addrspace(3)*
  %817 = load <2 x i16>, <2 x i16> addrspace(3)* %816, align 2, !tbaa !5
  %818 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %813, <2 x i16> %817)
  %819 = or i32 %781, 15
  %820 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %819
  %821 = bitcast i16 addrspace(3)* %820 to <2 x i16> addrspace(3)*
  %822 = load <2 x i16>, <2 x i16> addrspace(3)* %821, align 2, !tbaa !5
  %823 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %818, <2 x i16> %822)
  %824 = add nuw i32 %781, 16
  %825 = add i32 %783, 8
  %826 = icmp eq i32 %825, %779
  br i1 %826, label %827, label %780, !llvm.loop !34

827:                                              ; preds = %780, %768
  %828 = phi <2 x i16> [ undef, %768 ], [ %823, %780 ]
  %829 = phi i32 [ 0, %768 ], [ %824, %780 ]
  %830 = phi <2 x i16> [ %772, %768 ], [ %823, %780 ]
  %831 = icmp eq i32 %776, 0
  br i1 %831, label %844, label %832

832:                                              ; preds = %827, %832
  %833 = phi i32 [ %841, %832 ], [ %829, %827 ]
  %834 = phi <2 x i16> [ %840, %832 ], [ %830, %827 ]
  %835 = phi i32 [ %842, %832 ], [ 0, %827 ]
  %836 = or i32 %833, 1
  %837 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %836
  %838 = bitcast i16 addrspace(3)* %837 to <2 x i16> addrspace(3)*
  %839 = load <2 x i16>, <2 x i16> addrspace(3)* %838, align 2, !tbaa !5
  %840 = tail call <2 x i16> @llvm.umin.v2i16(<2 x i16> %834, <2 x i16> %839)
  %841 = add nuw i32 %833, 2
  %842 = add i32 %835, 1
  %843 = icmp eq i32 %842, %776
  br i1 %843, label %844, label %832, !llvm.loop !35

844:                                              ; preds = %832, %827
  %845 = phi <2 x i16> [ %828, %827 ], [ %840, %832 ]
  %846 = tail call i16 @llvm.vector.reduce.umin.v2i16(<2 x i16> %845)
  %847 = icmp eq i32 %77, %769
  br i1 %847, label %859, label %848

848:                                              ; preds = %766, %844
  %849 = phi i32 [ 1, %766 ], [ %770, %844 ]
  %850 = phi i16 [ %765, %766 ], [ %846, %844 ]
  br label %851

851:                                              ; preds = %848, %851
  %852 = phi i32 [ %857, %851 ], [ %849, %848 ]
  %853 = phi i16 [ %856, %851 ], [ %850, %848 ]
  %854 = getelementptr inbounds i16, i16 addrspace(3)* %764, i32 %852
  %855 = load i16, i16 addrspace(3)* %854, align 2, !tbaa !5
  %856 = tail call i16 @llvm.umin.i16(i16 %853, i16 %855)
  %857 = add nuw nsw i32 %852, 1
  %858 = icmp eq i32 %852, %77
  br i1 %858, label %859, label %851, !llvm.loop !36

859:                                              ; preds = %851, %844, %760
  %860 = phi i16 [ %765, %760 ], [ %846, %844 ], [ %856, %851 ]
  %861 = getelementptr inbounds i16, i16 addrspace(1)* %58, i64 128
  store i16 %860, i16 addrspace(1)* %861, align 2, !tbaa !5
  ret void

862:                                              ; preds = %163, %862
  %863 = phi i32 [ %868, %862 ], [ %164, %163 ]
  %864 = phi i16 [ %867, %862 ], [ %165, %163 ]
  %865 = getelementptr inbounds i16, i16 addrspace(3)* %79, i32 %863
  %866 = load i16, i16 addrspace(3)* %865, align 2, !tbaa !5
  %867 = tail call i16 @llvm.umin.i16(i16 %864, i16 %866)
  %868 = add nuw nsw i32 %863, 1
  %869 = icmp eq i32 %863, %77
  br i1 %869, label %166, label %862, !llvm.loop !37
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
!37 = distinct !{!37, !11, !18, !12}
