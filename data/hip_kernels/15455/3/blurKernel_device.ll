; ModuleID = '../data/hip_kernels/15455/3/main.cu'
source_filename = "../data/hip_kernels/15455/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" }
%"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" = type { [3 x i8] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10blurKernelP15HIP_vector_typeIhLj3EES1_ii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %415

25:                                               ; preds = %4
  %26 = add nsw i32 %13, -7
  %27 = icmp sgt i32 %13, 6
  %28 = icmp slt i32 %26, %2
  %29 = add nsw i32 %13, -6
  %30 = icmp sgt i32 %13, 5
  %31 = icmp slt i32 %29, %2
  %32 = add nsw i32 %13, -5
  %33 = icmp sgt i32 %13, 4
  %34 = icmp slt i32 %32, %2
  %35 = add nsw i32 %13, -4
  %36 = icmp sgt i32 %13, 3
  %37 = icmp slt i32 %35, %2
  %38 = add nsw i32 %13, -3
  %39 = icmp sgt i32 %13, 2
  %40 = icmp slt i32 %38, %2
  %41 = add nsw i32 %13, -2
  %42 = icmp sgt i32 %13, 1
  %43 = icmp slt i32 %41, %2
  %44 = add nsw i32 %13, -1
  %45 = icmp sgt i32 %13, 0
  %46 = icmp sgt i32 %13, -1
  %47 = add nsw i32 %13, 1
  %48 = icmp sgt i32 %13, -2
  %49 = icmp slt i32 %47, %2
  %50 = add nsw i32 %13, 2
  %51 = icmp sgt i32 %13, -3
  %52 = icmp slt i32 %50, %2
  %53 = add nsw i32 %13, 3
  %54 = icmp sgt i32 %13, -4
  %55 = icmp slt i32 %53, %2
  %56 = add nsw i32 %13, 4
  %57 = icmp sgt i32 %13, -5
  %58 = icmp slt i32 %56, %2
  %59 = add nsw i32 %13, 5
  %60 = icmp sgt i32 %13, -6
  %61 = icmp slt i32 %59, %2
  %62 = add nsw i32 %13, 6
  %63 = icmp sgt i32 %13, -7
  %64 = icmp slt i32 %62, %2
  %65 = add nsw i32 %13, 7
  %66 = icmp sgt i32 %13, -8
  %67 = icmp slt i32 %65, %2
  br label %68

68:                                               ; preds = %25, %410
  %69 = phi i32 [ %412, %410 ], [ 0, %25 ]
  %70 = phi i32 [ %411, %410 ], [ 0, %25 ]
  %71 = phi i32 [ %413, %410 ], [ -7, %25 ]
  %72 = add nsw i32 %71, %21
  %73 = icmp sgt i32 %72, -1
  %74 = icmp slt i32 %72, %3
  %75 = mul nsw i32 %72, %2
  %76 = select i1 %73, i1 %74, i1 false
  %77 = select i1 %76, i1 %27, i1 false
  %78 = select i1 %77, i1 %28, i1 false
  br i1 %78, label %88, label %104

79:                                               ; preds = %410
  %80 = sdiv i32 %412, %411
  %81 = trunc i32 %80 to i8
  %82 = mul nsw i32 %21, %2
  %83 = add nsw i32 %82, %13
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %84, i32 0, i32 0, i32 0, i32 0, i64 0
  store i8 %81, i8 addrspace(1)* %85, align 1, !tbaa !7
  %86 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %84, i32 0, i32 0, i32 0, i32 0, i64 1
  store i8 %81, i8 addrspace(1)* %86, align 1, !tbaa !7
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %84, i32 0, i32 0, i32 0, i32 0, i64 2
  store i8 %81, i8 addrspace(1)* %87, align 1, !tbaa !7
  br label %415

88:                                               ; preds = %68
  %89 = add nsw i32 %26, %75
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 0
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7, !amdgpu.noclobber !5
  %93 = zext i8 %92 to i32
  %94 = add nsw i32 %69, %93
  %95 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 1
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !7, !amdgpu.noclobber !5
  %97 = zext i8 %96 to i32
  %98 = add nsw i32 %94, %97
  %99 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 0, i32 0, i64 2
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !7, !amdgpu.noclobber !5
  %101 = zext i8 %100 to i32
  %102 = add nsw i32 %98, %101
  %103 = add nsw i32 %70, 3
  br label %104

104:                                              ; preds = %88, %68
  %105 = phi i32 [ %103, %88 ], [ %70, %68 ]
  %106 = phi i32 [ %102, %88 ], [ %69, %68 ]
  %107 = select i1 %73, i1 %74, i1 false
  %108 = select i1 %107, i1 %30, i1 false
  %109 = select i1 %108, i1 %31, i1 false
  br i1 %109, label %110, label %126

110:                                              ; preds = %104
  %111 = add nsw i32 %29, %75
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %112, i32 0, i32 0, i32 0, i32 0, i64 0
  %114 = load i8, i8 addrspace(1)* %113, align 1, !tbaa !7, !amdgpu.noclobber !5
  %115 = zext i8 %114 to i32
  %116 = add nsw i32 %106, %115
  %117 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %112, i32 0, i32 0, i32 0, i32 0, i64 1
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !7, !amdgpu.noclobber !5
  %119 = zext i8 %118 to i32
  %120 = add nsw i32 %116, %119
  %121 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %112, i32 0, i32 0, i32 0, i32 0, i64 2
  %122 = load i8, i8 addrspace(1)* %121, align 1, !tbaa !7, !amdgpu.noclobber !5
  %123 = zext i8 %122 to i32
  %124 = add nsw i32 %120, %123
  %125 = add nsw i32 %105, 3
  br label %126

126:                                              ; preds = %110, %104
  %127 = phi i32 [ %125, %110 ], [ %105, %104 ]
  %128 = phi i32 [ %124, %110 ], [ %106, %104 ]
  %129 = select i1 %73, i1 %74, i1 false
  %130 = select i1 %129, i1 %33, i1 false
  %131 = select i1 %130, i1 %34, i1 false
  br i1 %131, label %132, label %148

132:                                              ; preds = %126
  %133 = add nsw i32 %32, %75
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %134, i32 0, i32 0, i32 0, i32 0, i64 0
  %136 = load i8, i8 addrspace(1)* %135, align 1, !tbaa !7, !amdgpu.noclobber !5
  %137 = zext i8 %136 to i32
  %138 = add nsw i32 %128, %137
  %139 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %134, i32 0, i32 0, i32 0, i32 0, i64 1
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !7, !amdgpu.noclobber !5
  %141 = zext i8 %140 to i32
  %142 = add nsw i32 %138, %141
  %143 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %134, i32 0, i32 0, i32 0, i32 0, i64 2
  %144 = load i8, i8 addrspace(1)* %143, align 1, !tbaa !7, !amdgpu.noclobber !5
  %145 = zext i8 %144 to i32
  %146 = add nsw i32 %142, %145
  %147 = add nsw i32 %127, 3
  br label %148

148:                                              ; preds = %132, %126
  %149 = phi i32 [ %147, %132 ], [ %127, %126 ]
  %150 = phi i32 [ %146, %132 ], [ %128, %126 ]
  %151 = select i1 %73, i1 %74, i1 false
  %152 = select i1 %151, i1 %36, i1 false
  %153 = select i1 %152, i1 %37, i1 false
  br i1 %153, label %154, label %170

154:                                              ; preds = %148
  %155 = add nsw i32 %35, %75
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %156, i32 0, i32 0, i32 0, i32 0, i64 0
  %158 = load i8, i8 addrspace(1)* %157, align 1, !tbaa !7, !amdgpu.noclobber !5
  %159 = zext i8 %158 to i32
  %160 = add nsw i32 %150, %159
  %161 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %156, i32 0, i32 0, i32 0, i32 0, i64 1
  %162 = load i8, i8 addrspace(1)* %161, align 1, !tbaa !7, !amdgpu.noclobber !5
  %163 = zext i8 %162 to i32
  %164 = add nsw i32 %160, %163
  %165 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %156, i32 0, i32 0, i32 0, i32 0, i64 2
  %166 = load i8, i8 addrspace(1)* %165, align 1, !tbaa !7, !amdgpu.noclobber !5
  %167 = zext i8 %166 to i32
  %168 = add nsw i32 %164, %167
  %169 = add nsw i32 %149, 3
  br label %170

170:                                              ; preds = %154, %148
  %171 = phi i32 [ %169, %154 ], [ %149, %148 ]
  %172 = phi i32 [ %168, %154 ], [ %150, %148 ]
  %173 = select i1 %73, i1 %74, i1 false
  %174 = select i1 %173, i1 %39, i1 false
  %175 = select i1 %174, i1 %40, i1 false
  br i1 %175, label %176, label %192

176:                                              ; preds = %170
  %177 = add nsw i32 %38, %75
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %178, i32 0, i32 0, i32 0, i32 0, i64 0
  %180 = load i8, i8 addrspace(1)* %179, align 1, !tbaa !7, !amdgpu.noclobber !5
  %181 = zext i8 %180 to i32
  %182 = add nsw i32 %172, %181
  %183 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %178, i32 0, i32 0, i32 0, i32 0, i64 1
  %184 = load i8, i8 addrspace(1)* %183, align 1, !tbaa !7, !amdgpu.noclobber !5
  %185 = zext i8 %184 to i32
  %186 = add nsw i32 %182, %185
  %187 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %178, i32 0, i32 0, i32 0, i32 0, i64 2
  %188 = load i8, i8 addrspace(1)* %187, align 1, !tbaa !7, !amdgpu.noclobber !5
  %189 = zext i8 %188 to i32
  %190 = add nsw i32 %186, %189
  %191 = add nsw i32 %171, 3
  br label %192

192:                                              ; preds = %176, %170
  %193 = phi i32 [ %191, %176 ], [ %171, %170 ]
  %194 = phi i32 [ %190, %176 ], [ %172, %170 ]
  %195 = select i1 %73, i1 %74, i1 false
  %196 = select i1 %195, i1 %42, i1 false
  %197 = select i1 %196, i1 %43, i1 false
  br i1 %197, label %198, label %214

198:                                              ; preds = %192
  %199 = add nsw i32 %41, %75
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %200, i32 0, i32 0, i32 0, i32 0, i64 0
  %202 = load i8, i8 addrspace(1)* %201, align 1, !tbaa !7, !amdgpu.noclobber !5
  %203 = zext i8 %202 to i32
  %204 = add nsw i32 %194, %203
  %205 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %200, i32 0, i32 0, i32 0, i32 0, i64 1
  %206 = load i8, i8 addrspace(1)* %205, align 1, !tbaa !7, !amdgpu.noclobber !5
  %207 = zext i8 %206 to i32
  %208 = add nsw i32 %204, %207
  %209 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %200, i32 0, i32 0, i32 0, i32 0, i64 2
  %210 = load i8, i8 addrspace(1)* %209, align 1, !tbaa !7, !amdgpu.noclobber !5
  %211 = zext i8 %210 to i32
  %212 = add nsw i32 %208, %211
  %213 = add nsw i32 %193, 3
  br label %214

214:                                              ; preds = %198, %192
  %215 = phi i32 [ %213, %198 ], [ %193, %192 ]
  %216 = phi i32 [ %212, %198 ], [ %194, %192 ]
  %217 = select i1 %73, i1 %74, i1 false
  %218 = select i1 %217, i1 %45, i1 false
  br i1 %218, label %219, label %235

219:                                              ; preds = %214
  %220 = add nsw i32 %44, %75
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %221, i32 0, i32 0, i32 0, i32 0, i64 0
  %223 = load i8, i8 addrspace(1)* %222, align 1, !tbaa !7, !amdgpu.noclobber !5
  %224 = zext i8 %223 to i32
  %225 = add nsw i32 %216, %224
  %226 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %221, i32 0, i32 0, i32 0, i32 0, i64 1
  %227 = load i8, i8 addrspace(1)* %226, align 1, !tbaa !7, !amdgpu.noclobber !5
  %228 = zext i8 %227 to i32
  %229 = add nsw i32 %225, %228
  %230 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %221, i32 0, i32 0, i32 0, i32 0, i64 2
  %231 = load i8, i8 addrspace(1)* %230, align 1, !tbaa !7, !amdgpu.noclobber !5
  %232 = zext i8 %231 to i32
  %233 = add nsw i32 %229, %232
  %234 = add nsw i32 %215, 3
  br label %235

235:                                              ; preds = %219, %214
  %236 = phi i32 [ %234, %219 ], [ %215, %214 ]
  %237 = phi i32 [ %233, %219 ], [ %216, %214 ]
  %238 = select i1 %73, i1 %74, i1 false
  %239 = select i1 %238, i1 %46, i1 false
  br i1 %239, label %240, label %256

240:                                              ; preds = %235
  %241 = add nsw i32 %13, %75
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %242, i32 0, i32 0, i32 0, i32 0, i64 0
  %244 = load i8, i8 addrspace(1)* %243, align 1, !tbaa !7, !amdgpu.noclobber !5
  %245 = zext i8 %244 to i32
  %246 = add nsw i32 %237, %245
  %247 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %242, i32 0, i32 0, i32 0, i32 0, i64 1
  %248 = load i8, i8 addrspace(1)* %247, align 1, !tbaa !7, !amdgpu.noclobber !5
  %249 = zext i8 %248 to i32
  %250 = add nsw i32 %246, %249
  %251 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %242, i32 0, i32 0, i32 0, i32 0, i64 2
  %252 = load i8, i8 addrspace(1)* %251, align 1, !tbaa !7, !amdgpu.noclobber !5
  %253 = zext i8 %252 to i32
  %254 = add nsw i32 %250, %253
  %255 = add nsw i32 %236, 3
  br label %256

256:                                              ; preds = %240, %235
  %257 = phi i32 [ %255, %240 ], [ %236, %235 ]
  %258 = phi i32 [ %254, %240 ], [ %237, %235 ]
  %259 = select i1 %73, i1 %74, i1 false
  %260 = select i1 %259, i1 %48, i1 false
  %261 = select i1 %260, i1 %49, i1 false
  br i1 %261, label %262, label %278

262:                                              ; preds = %256
  %263 = add nsw i32 %47, %75
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %264, i32 0, i32 0, i32 0, i32 0, i64 0
  %266 = load i8, i8 addrspace(1)* %265, align 1, !tbaa !7, !amdgpu.noclobber !5
  %267 = zext i8 %266 to i32
  %268 = add nsw i32 %258, %267
  %269 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %264, i32 0, i32 0, i32 0, i32 0, i64 1
  %270 = load i8, i8 addrspace(1)* %269, align 1, !tbaa !7, !amdgpu.noclobber !5
  %271 = zext i8 %270 to i32
  %272 = add nsw i32 %268, %271
  %273 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %264, i32 0, i32 0, i32 0, i32 0, i64 2
  %274 = load i8, i8 addrspace(1)* %273, align 1, !tbaa !7, !amdgpu.noclobber !5
  %275 = zext i8 %274 to i32
  %276 = add nsw i32 %272, %275
  %277 = add nsw i32 %257, 3
  br label %278

278:                                              ; preds = %262, %256
  %279 = phi i32 [ %277, %262 ], [ %257, %256 ]
  %280 = phi i32 [ %276, %262 ], [ %258, %256 ]
  %281 = select i1 %73, i1 %74, i1 false
  %282 = select i1 %281, i1 %51, i1 false
  %283 = select i1 %282, i1 %52, i1 false
  br i1 %283, label %284, label %300

284:                                              ; preds = %278
  %285 = add nsw i32 %50, %75
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %286, i32 0, i32 0, i32 0, i32 0, i64 0
  %288 = load i8, i8 addrspace(1)* %287, align 1, !tbaa !7, !amdgpu.noclobber !5
  %289 = zext i8 %288 to i32
  %290 = add nsw i32 %280, %289
  %291 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %286, i32 0, i32 0, i32 0, i32 0, i64 1
  %292 = load i8, i8 addrspace(1)* %291, align 1, !tbaa !7, !amdgpu.noclobber !5
  %293 = zext i8 %292 to i32
  %294 = add nsw i32 %290, %293
  %295 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %286, i32 0, i32 0, i32 0, i32 0, i64 2
  %296 = load i8, i8 addrspace(1)* %295, align 1, !tbaa !7, !amdgpu.noclobber !5
  %297 = zext i8 %296 to i32
  %298 = add nsw i32 %294, %297
  %299 = add nsw i32 %279, 3
  br label %300

300:                                              ; preds = %284, %278
  %301 = phi i32 [ %299, %284 ], [ %279, %278 ]
  %302 = phi i32 [ %298, %284 ], [ %280, %278 ]
  %303 = select i1 %73, i1 %74, i1 false
  %304 = select i1 %303, i1 %54, i1 false
  %305 = select i1 %304, i1 %55, i1 false
  br i1 %305, label %306, label %322

306:                                              ; preds = %300
  %307 = add nsw i32 %53, %75
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %308, i32 0, i32 0, i32 0, i32 0, i64 0
  %310 = load i8, i8 addrspace(1)* %309, align 1, !tbaa !7, !amdgpu.noclobber !5
  %311 = zext i8 %310 to i32
  %312 = add nsw i32 %302, %311
  %313 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %308, i32 0, i32 0, i32 0, i32 0, i64 1
  %314 = load i8, i8 addrspace(1)* %313, align 1, !tbaa !7, !amdgpu.noclobber !5
  %315 = zext i8 %314 to i32
  %316 = add nsw i32 %312, %315
  %317 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %308, i32 0, i32 0, i32 0, i32 0, i64 2
  %318 = load i8, i8 addrspace(1)* %317, align 1, !tbaa !7, !amdgpu.noclobber !5
  %319 = zext i8 %318 to i32
  %320 = add nsw i32 %316, %319
  %321 = add nsw i32 %301, 3
  br label %322

322:                                              ; preds = %306, %300
  %323 = phi i32 [ %321, %306 ], [ %301, %300 ]
  %324 = phi i32 [ %320, %306 ], [ %302, %300 ]
  %325 = select i1 %73, i1 %74, i1 false
  %326 = select i1 %325, i1 %57, i1 false
  %327 = select i1 %326, i1 %58, i1 false
  br i1 %327, label %328, label %344

328:                                              ; preds = %322
  %329 = add nsw i32 %56, %75
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %330, i32 0, i32 0, i32 0, i32 0, i64 0
  %332 = load i8, i8 addrspace(1)* %331, align 1, !tbaa !7, !amdgpu.noclobber !5
  %333 = zext i8 %332 to i32
  %334 = add nsw i32 %324, %333
  %335 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %330, i32 0, i32 0, i32 0, i32 0, i64 1
  %336 = load i8, i8 addrspace(1)* %335, align 1, !tbaa !7, !amdgpu.noclobber !5
  %337 = zext i8 %336 to i32
  %338 = add nsw i32 %334, %337
  %339 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %330, i32 0, i32 0, i32 0, i32 0, i64 2
  %340 = load i8, i8 addrspace(1)* %339, align 1, !tbaa !7, !amdgpu.noclobber !5
  %341 = zext i8 %340 to i32
  %342 = add nsw i32 %338, %341
  %343 = add nsw i32 %323, 3
  br label %344

344:                                              ; preds = %328, %322
  %345 = phi i32 [ %343, %328 ], [ %323, %322 ]
  %346 = phi i32 [ %342, %328 ], [ %324, %322 ]
  %347 = select i1 %73, i1 %74, i1 false
  %348 = select i1 %347, i1 %60, i1 false
  %349 = select i1 %348, i1 %61, i1 false
  br i1 %349, label %350, label %366

350:                                              ; preds = %344
  %351 = add nsw i32 %59, %75
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %352, i32 0, i32 0, i32 0, i32 0, i64 0
  %354 = load i8, i8 addrspace(1)* %353, align 1, !tbaa !7, !amdgpu.noclobber !5
  %355 = zext i8 %354 to i32
  %356 = add nsw i32 %346, %355
  %357 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %352, i32 0, i32 0, i32 0, i32 0, i64 1
  %358 = load i8, i8 addrspace(1)* %357, align 1, !tbaa !7, !amdgpu.noclobber !5
  %359 = zext i8 %358 to i32
  %360 = add nsw i32 %356, %359
  %361 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %352, i32 0, i32 0, i32 0, i32 0, i64 2
  %362 = load i8, i8 addrspace(1)* %361, align 1, !tbaa !7, !amdgpu.noclobber !5
  %363 = zext i8 %362 to i32
  %364 = add nsw i32 %360, %363
  %365 = add nsw i32 %345, 3
  br label %366

366:                                              ; preds = %350, %344
  %367 = phi i32 [ %365, %350 ], [ %345, %344 ]
  %368 = phi i32 [ %364, %350 ], [ %346, %344 ]
  %369 = select i1 %73, i1 %74, i1 false
  %370 = select i1 %369, i1 %63, i1 false
  %371 = select i1 %370, i1 %64, i1 false
  br i1 %371, label %372, label %388

372:                                              ; preds = %366
  %373 = add nsw i32 %62, %75
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %374, i32 0, i32 0, i32 0, i32 0, i64 0
  %376 = load i8, i8 addrspace(1)* %375, align 1, !tbaa !7, !amdgpu.noclobber !5
  %377 = zext i8 %376 to i32
  %378 = add nsw i32 %368, %377
  %379 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %374, i32 0, i32 0, i32 0, i32 0, i64 1
  %380 = load i8, i8 addrspace(1)* %379, align 1, !tbaa !7, !amdgpu.noclobber !5
  %381 = zext i8 %380 to i32
  %382 = add nsw i32 %378, %381
  %383 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %374, i32 0, i32 0, i32 0, i32 0, i64 2
  %384 = load i8, i8 addrspace(1)* %383, align 1, !tbaa !7, !amdgpu.noclobber !5
  %385 = zext i8 %384 to i32
  %386 = add nsw i32 %382, %385
  %387 = add nsw i32 %367, 3
  br label %388

388:                                              ; preds = %372, %366
  %389 = phi i32 [ %387, %372 ], [ %367, %366 ]
  %390 = phi i32 [ %386, %372 ], [ %368, %366 ]
  %391 = select i1 %73, i1 %74, i1 false
  %392 = select i1 %391, i1 %66, i1 false
  %393 = select i1 %392, i1 %67, i1 false
  br i1 %393, label %394, label %410

394:                                              ; preds = %388
  %395 = add nsw i32 %65, %75
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %396, i32 0, i32 0, i32 0, i32 0, i64 0
  %398 = load i8, i8 addrspace(1)* %397, align 1, !tbaa !7, !amdgpu.noclobber !5
  %399 = zext i8 %398 to i32
  %400 = add nsw i32 %390, %399
  %401 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %396, i32 0, i32 0, i32 0, i32 0, i64 1
  %402 = load i8, i8 addrspace(1)* %401, align 1, !tbaa !7, !amdgpu.noclobber !5
  %403 = zext i8 %402 to i32
  %404 = add nsw i32 %400, %403
  %405 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %396, i32 0, i32 0, i32 0, i32 0, i64 2
  %406 = load i8, i8 addrspace(1)* %405, align 1, !tbaa !7, !amdgpu.noclobber !5
  %407 = zext i8 %406 to i32
  %408 = add nsw i32 %404, %407
  %409 = add nsw i32 %389, 3
  br label %410

410:                                              ; preds = %394, %388
  %411 = phi i32 [ %409, %394 ], [ %389, %388 ]
  %412 = phi i32 [ %408, %394 ], [ %390, %388 ]
  %413 = add nsw i32 %71, 1
  %414 = icmp eq i32 %413, 8
  br i1 %414, label %79, label %68, !llvm.loop !10

415:                                              ; preds = %79, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
