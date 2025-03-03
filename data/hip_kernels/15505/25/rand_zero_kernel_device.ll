; ModuleID = '../data/hip_kernels/15505/25/main.cu'
source_filename = "../data/hip_kernels/15505/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandStatePhilox4_32_10 = type { %"class.rocrand_device::philox4x32_10_engine" }
%"class.rocrand_device::philox4x32_10_engine" = type { %"struct.rocrand_device::philox4x32_10_engine::philox4x32_10_state" }
%"struct.rocrand_device::philox4x32_10_engine::philox4x32_10_state" = type { %struct.HIP_vector_type, %struct.HIP_vector_type, %struct.HIP_vector_type.0, i32, i32, i32, float, double }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <2 x i32> }
%struct.HIP_vector_type.4 = type { %struct.HIP_vector_base.5 }
%struct.HIP_vector_base.5 = type { %union.anon.6 }
%union.anon.6 = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16rand_zero_kernelPfifP25hiprandStatePhilox4_32_10(float addrspace(1)* nocapture writeonly %0, i32 %1, float %2, %struct.hiprandStatePhilox4_32_10 addrspace(1)* nocapture %3) local_unnamed_addr #1 {
  %5 = alloca %struct.HIP_vector_type.4, align 16, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = sext i32 %14 to i64
  %16 = shl nsw i32 %14, 2
  %17 = bitcast %struct.HIP_vector_type.4 addrspace(5)* %5 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %17) #3
  %18 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %3, i64 %15, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %19 = load <4 x i32>, <4 x i32> addrspace(1)* %18, align 16, !amdgpu.noclobber !6
  %20 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %3, i64 %15, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %21 = load <4 x i32>, <4 x i32> addrspace(1)* %20, align 16, !amdgpu.noclobber !6
  %22 = extractelement <4 x i32> %21, i64 0
  %23 = add i32 %22, 1
  %24 = insertelement <4 x i32> poison, i32 %23, i64 0
  %25 = icmp eq i32 %23, 0
  %26 = zext i1 %25 to i32
  %27 = extractelement <4 x i32> %21, i64 1
  %28 = add i32 %27, %26
  %29 = insertelement <4 x i32> %24, i32 %28, i64 1
  %30 = icmp eq i32 %28, 0
  %31 = select i1 %30, i32 %26, i32 0
  %32 = extractelement <4 x i32> %21, i64 2
  %33 = add i32 %31, %32
  %34 = insertelement <4 x i32> %29, i32 %33, i64 2
  %35 = icmp eq i32 %33, 0
  %36 = select i1 %35, i32 %31, i32 0
  %37 = extractelement <4 x i32> %21, i64 3
  %38 = add i32 %36, %37
  %39 = insertelement <4 x i32> %34, i32 %38, i64 3
  store <4 x i32> %39, <4 x i32> addrspace(1)* %20, align 16
  %40 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %3, i64 %15, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0, i64 0
  %41 = load i32, i32 addrspace(1)* %40, align 16, !amdgpu.noclobber !6
  %42 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %3, i64 %15, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0, i64 1
  %43 = load i32, i32 addrspace(1)* %42, align 4, !amdgpu.noclobber !6
  %44 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %23, i64 0) #4, !srcloc !7
  %45 = extractvalue { i64, i64 } %44, 0
  %46 = lshr i64 %45, 32
  %47 = trunc i64 %46 to i32
  %48 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %33, i64 0) #4, !srcloc !7
  %49 = extractvalue { i64, i64 } %48, 0
  %50 = lshr i64 %49, 32
  %51 = trunc i64 %50 to i32
  %52 = trunc i64 %49 to i32
  %53 = xor i32 %28, %41
  %54 = xor i32 %53, %51
  %55 = xor i32 %43, %47
  %56 = xor i32 %55, %38
  %57 = add i32 %41, -1640531527
  %58 = add i32 %43, -1150833019
  %59 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %54, i64 0) #4, !srcloc !7
  %60 = extractvalue { i64, i64 } %59, 0
  %61 = lshr i64 %60, 32
  %62 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %56, i64 0) #4, !srcloc !7
  %63 = extractvalue { i64, i64 } %62, 0
  %64 = lshr i64 %63, 32
  %65 = trunc i64 %64 to i32
  %66 = trunc i64 %63 to i32
  %67 = xor i32 %57, %52
  %68 = xor i32 %67, %65
  %69 = xor i64 %61, %45
  %70 = trunc i64 %69 to i32
  %71 = xor i32 %58, %70
  %72 = add i32 %41, 1013904242
  %73 = add i32 %43, 1993301258
  %74 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %68, i64 0) #4, !srcloc !7
  %75 = extractvalue { i64, i64 } %74, 0
  %76 = lshr i64 %75, 32
  %77 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %71, i64 0) #4, !srcloc !7
  %78 = extractvalue { i64, i64 } %77, 0
  %79 = lshr i64 %78, 32
  %80 = trunc i64 %79 to i32
  %81 = trunc i64 %78 to i32
  %82 = xor i32 %72, %66
  %83 = xor i32 %82, %80
  %84 = xor i64 %76, %60
  %85 = trunc i64 %84 to i32
  %86 = xor i32 %73, %85
  %87 = add i32 %41, -626627285
  %88 = add i32 %43, 842468239
  %89 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %83, i64 0) #4, !srcloc !7
  %90 = extractvalue { i64, i64 } %89, 0
  %91 = lshr i64 %90, 32
  %92 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %86, i64 0) #4, !srcloc !7
  %93 = extractvalue { i64, i64 } %92, 0
  %94 = lshr i64 %93, 32
  %95 = trunc i64 %94 to i32
  %96 = trunc i64 %93 to i32
  %97 = xor i32 %87, %81
  %98 = xor i32 %97, %95
  %99 = xor i64 %91, %75
  %100 = trunc i64 %99 to i32
  %101 = xor i32 %88, %100
  %102 = add i32 %41, 2027808484
  %103 = add i32 %43, -308364780
  %104 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %98, i64 0) #4, !srcloc !7
  %105 = extractvalue { i64, i64 } %104, 0
  %106 = lshr i64 %105, 32
  %107 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %101, i64 0) #4, !srcloc !7
  %108 = extractvalue { i64, i64 } %107, 0
  %109 = lshr i64 %108, 32
  %110 = trunc i64 %109 to i32
  %111 = trunc i64 %108 to i32
  %112 = xor i32 %102, %96
  %113 = xor i32 %112, %110
  %114 = xor i64 %106, %90
  %115 = trunc i64 %114 to i32
  %116 = xor i32 %103, %115
  %117 = add i32 %41, 387276957
  %118 = add i32 %43, -1459197799
  %119 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %113, i64 0) #4, !srcloc !7
  %120 = extractvalue { i64, i64 } %119, 0
  %121 = lshr i64 %120, 32
  %122 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %116, i64 0) #4, !srcloc !7
  %123 = extractvalue { i64, i64 } %122, 0
  %124 = lshr i64 %123, 32
  %125 = trunc i64 %124 to i32
  %126 = trunc i64 %123 to i32
  %127 = xor i32 %117, %111
  %128 = xor i32 %127, %125
  %129 = xor i64 %121, %105
  %130 = trunc i64 %129 to i32
  %131 = xor i32 %118, %130
  %132 = add i32 %41, -1253254570
  %133 = add i32 %43, 1684936478
  %134 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %128, i64 0) #4, !srcloc !7
  %135 = extractvalue { i64, i64 } %134, 0
  %136 = lshr i64 %135, 32
  %137 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %131, i64 0) #4, !srcloc !7
  %138 = extractvalue { i64, i64 } %137, 0
  %139 = lshr i64 %138, 32
  %140 = trunc i64 %139 to i32
  %141 = trunc i64 %138 to i32
  %142 = xor i32 %132, %126
  %143 = xor i32 %142, %140
  %144 = xor i64 %136, %120
  %145 = trunc i64 %144 to i32
  %146 = xor i32 %133, %145
  %147 = add i32 %41, 1401181199
  %148 = add i32 %43, 534103459
  %149 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %143, i64 0) #4, !srcloc !7
  %150 = extractvalue { i64, i64 } %149, 0
  %151 = lshr i64 %150, 32
  %152 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %146, i64 0) #4, !srcloc !7
  %153 = extractvalue { i64, i64 } %152, 0
  %154 = lshr i64 %153, 32
  %155 = trunc i64 %154 to i32
  %156 = trunc i64 %153 to i32
  %157 = xor i32 %147, %141
  %158 = xor i32 %157, %155
  %159 = xor i64 %151, %135
  %160 = trunc i64 %159 to i32
  %161 = xor i32 %148, %160
  %162 = add i32 %41, -239350328
  %163 = add i32 %43, -616729560
  %164 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %158, i64 0) #4, !srcloc !7
  %165 = extractvalue { i64, i64 } %164, 0
  %166 = lshr i64 %165, 32
  %167 = trunc i64 %165 to i32
  %168 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %161, i64 0) #4, !srcloc !7
  %169 = extractvalue { i64, i64 } %168, 0
  %170 = lshr i64 %169, 32
  %171 = trunc i64 %170 to i32
  %172 = trunc i64 %169 to i32
  %173 = xor i32 %162, %156
  %174 = xor i32 %173, %171
  %175 = xor i64 %166, %150
  %176 = trunc i64 %175 to i32
  %177 = xor i32 %163, %176
  %178 = add i32 %41, -1879881855
  %179 = add i32 %43, -1767562579
  %180 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %174, i64 0) #4, !srcloc !7
  %181 = extractvalue { i64, i64 } %180, 0
  %182 = lshr i64 %181, 32
  %183 = trunc i64 %182 to i32
  %184 = trunc i64 %181 to i32
  %185 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %177, i64 0) #4, !srcloc !7
  %186 = extractvalue { i64, i64 } %185, 0
  %187 = lshr i64 %186, 32
  %188 = trunc i64 %187 to i32
  %189 = trunc i64 %186 to i32
  %190 = xor i32 %178, %172
  %191 = xor i32 %190, %188
  %192 = xor i32 %179, %167
  %193 = xor i32 %192, %183
  %194 = insertelement <4 x i32> undef, i32 %191, i64 0
  %195 = insertelement <4 x i32> %194, i32 %189, i64 1
  %196 = insertelement <4 x i32> %195, i32 %193, i64 2
  %197 = insertelement <4 x i32> %196, i32 %184, i64 3
  store <4 x i32> %197, <4 x i32> addrspace(1)* %18, align 16
  %198 = getelementptr %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %3, i64 %15, i32 0, i32 0, i32 3
  %199 = load i32, i32 addrspace(1)* %198, align 8, !tbaa !8
  switch i32 %199, label %206 [
    i32 0, label %207
    i32 1, label %200
    i32 2, label %202
    i32 3, label %204
  ]

200:                                              ; preds = %4
  %201 = shufflevector <4 x i32> %19, <4 x i32> %194, <4 x i32> <i32 1, i32 2, i32 3, i32 4>
  br label %207

202:                                              ; preds = %4
  %203 = shufflevector <4 x i32> %19, <4 x i32> %195, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
  br label %207

204:                                              ; preds = %4
  %205 = shufflevector <4 x i32> %19, <4 x i32> %196, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  br label %207

206:                                              ; preds = %4
  unreachable

207:                                              ; preds = %4, %200, %202, %204
  %208 = phi <4 x i32> [ %205, %204 ], [ %203, %202 ], [ %201, %200 ], [ %19, %4 ]
  %209 = extractelement <4 x i32> %208, i64 0
  %210 = uitofp i32 %209 to float
  %211 = fmul contract float %210, 0x3DF0000000000000
  %212 = fadd contract float %211, 0x3DF0000000000000
  %213 = extractelement <4 x i32> %208, i64 1
  %214 = uitofp i32 %213 to float
  %215 = fmul contract float %214, 0x3DF0000000000000
  %216 = fadd contract float %215, 0x3DF0000000000000
  %217 = extractelement <4 x i32> %208, i64 2
  %218 = uitofp i32 %217 to float
  %219 = fmul contract float %218, 0x3DF0000000000000
  %220 = fadd contract float %219, 0x3DF0000000000000
  %221 = extractelement <4 x i32> %208, i64 3
  %222 = uitofp i32 %221 to float
  %223 = fmul contract float %222, 0x3DF0000000000000
  %224 = fadd contract float %223, 0x3DF0000000000000
  %225 = insertelement <4 x float> undef, float %212, i64 0
  %226 = insertelement <4 x float> %225, float %216, i64 1
  %227 = insertelement <4 x float> %226, float %220, i64 2
  %228 = insertelement <4 x float> %227, float %224, i64 3
  %229 = getelementptr inbounds %struct.HIP_vector_type.4, %struct.HIP_vector_type.4 addrspace(5)* %5, i32 0, i32 0, i32 0, i32 0
  store <4 x float> %228, <4 x float> addrspace(5)* %229, align 16
  %230 = icmp slt i32 %16, %1
  br i1 %230, label %231, label %246

231:                                              ; preds = %207, %240
  %232 = phi i32 [ %241, %240 ], [ 0, %207 ]
  %233 = phi i32 [ %242, %240 ], [ %16, %207 ]
  %234 = getelementptr inbounds %struct.HIP_vector_type.4, %struct.HIP_vector_type.4 addrspace(5)* %5, i32 0, i32 0, i32 0, i32 0, i32 %232
  %235 = load float, float addrspace(5)* %234, align 4, !tbaa !20
  %236 = fcmp contract olt float %235, %2
  br i1 %236, label %237, label %240

237:                                              ; preds = %231
  %238 = sext i32 %233 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %0, i64 %238
  store float 0.000000e+00, float addrspace(1)* %239, align 4, !tbaa !20
  br label %240

240:                                              ; preds = %231, %237
  %241 = add nuw nsw i32 %232, 1
  %242 = add nsw i32 %233, 1
  %243 = icmp ult i32 %232, 3
  %244 = icmp slt i32 %242, %1
  %245 = select i1 %243, i1 %244, i1 false
  br i1 %245, label %231, label %246, !llvm.loop !21

246:                                              ; preds = %240, %207
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %17) #3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }
attributes #4 = { convergent nounwind }

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
!7 = !{i64 5995808}
!8 = !{!9, !17, i64 40}
!9 = !{!"_ZTSN14rocrand_device20philox4x32_10_engineE", !10, i64 0}
!10 = !{!"_ZTSN14rocrand_device20philox4x32_10_engine19philox4x32_10_stateE", !11, i64 0, !11, i64 16, !15, i64 32, !17, i64 40, !17, i64 44, !17, i64 48, !18, i64 52, !19, i64 56}
!11 = !{!"_ZTS15HIP_vector_typeIjLj4EE", !12, i64 0}
!12 = !{!"_ZTS15HIP_vector_baseIjLj4EE", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!"_ZTS15HIP_vector_typeIjLj2EE", !16, i64 0}
!16 = !{!"_ZTS15HIP_vector_baseIjLj2EE", !13, i64 0}
!17 = !{!"int", !13, i64 0}
!18 = !{!"float", !13, i64 0}
!19 = !{!"double", !13, i64 0}
!20 = !{!18, !18, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
