; ModuleID = '../data/hip_kernels/15505/24/main.cu'
source_filename = "../data/hip_kernels/15505/24/main.cu"
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

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z16rand_init_kerneliP25hiprandStatePhilox4_32_10i(i32 %0, %struct.hiprandStatePhilox4_32_10 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %181

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = ashr i32 %0, 31
  %17 = ashr i32 %12, 31
  %18 = insertelement <4 x i32> <i32 0, i32 0, i32 poison, i32 poison>, i32 %12, i64 2
  %19 = insertelement <4 x i32> %18, i32 %17, i64 3
  %20 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 0, i64 0) #2, !srcloc !7
  %21 = extractvalue { i64, i64 } %20, 0
  %22 = lshr i64 %21, 32
  %23 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %12, i64 0) #2, !srcloc !7
  %24 = extractvalue { i64, i64 } %23, 0
  %25 = lshr i64 %24, 32
  %26 = trunc i64 %24 to i32
  %27 = trunc i64 %25 to i32
  %28 = xor i32 %27, %0
  %29 = xor i32 %12, %0
  %30 = ashr i32 %29, 31
  %31 = trunc i64 %22 to i32
  %32 = xor i32 %30, %31
  %33 = add i32 %0, -1640531527
  %34 = add nsw i32 %16, -1150833019
  %35 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %28, i64 0) #2, !srcloc !7
  %36 = extractvalue { i64, i64 } %35, 0
  %37 = lshr i64 %36, 32
  %38 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %32, i64 0) #2, !srcloc !7
  %39 = extractvalue { i64, i64 } %38, 0
  %40 = lshr i64 %39, 32
  %41 = trunc i64 %40 to i32
  %42 = trunc i64 %39 to i32
  %43 = xor i32 %33, %26
  %44 = xor i32 %43, %41
  %45 = xor i64 %37, %21
  %46 = trunc i64 %45 to i32
  %47 = xor i32 %34, %46
  %48 = add i32 %0, 1013904242
  %49 = add nsw i32 %16, 1993301258
  %50 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %44, i64 0) #2, !srcloc !7
  %51 = extractvalue { i64, i64 } %50, 0
  %52 = lshr i64 %51, 32
  %53 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %47, i64 0) #2, !srcloc !7
  %54 = extractvalue { i64, i64 } %53, 0
  %55 = lshr i64 %54, 32
  %56 = trunc i64 %55 to i32
  %57 = trunc i64 %54 to i32
  %58 = xor i32 %48, %42
  %59 = xor i32 %58, %56
  %60 = xor i64 %52, %36
  %61 = trunc i64 %60 to i32
  %62 = xor i32 %49, %61
  %63 = add i32 %0, -626627285
  %64 = add nsw i32 %16, 842468239
  %65 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %59, i64 0) #2, !srcloc !7
  %66 = extractvalue { i64, i64 } %65, 0
  %67 = lshr i64 %66, 32
  %68 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %62, i64 0) #2, !srcloc !7
  %69 = extractvalue { i64, i64 } %68, 0
  %70 = lshr i64 %69, 32
  %71 = trunc i64 %70 to i32
  %72 = trunc i64 %69 to i32
  %73 = xor i32 %63, %57
  %74 = xor i32 %73, %71
  %75 = xor i64 %67, %51
  %76 = trunc i64 %75 to i32
  %77 = xor i32 %64, %76
  %78 = add i32 %0, 2027808484
  %79 = add nsw i32 %16, -308364780
  %80 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %74, i64 0) #2, !srcloc !7
  %81 = extractvalue { i64, i64 } %80, 0
  %82 = lshr i64 %81, 32
  %83 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %77, i64 0) #2, !srcloc !7
  %84 = extractvalue { i64, i64 } %83, 0
  %85 = lshr i64 %84, 32
  %86 = trunc i64 %85 to i32
  %87 = trunc i64 %84 to i32
  %88 = xor i32 %78, %72
  %89 = xor i32 %88, %86
  %90 = xor i64 %82, %66
  %91 = trunc i64 %90 to i32
  %92 = xor i32 %79, %91
  %93 = add i32 %0, 387276957
  %94 = add nsw i32 %16, -1459197799
  %95 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %89, i64 0) #2, !srcloc !7
  %96 = extractvalue { i64, i64 } %95, 0
  %97 = lshr i64 %96, 32
  %98 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %92, i64 0) #2, !srcloc !7
  %99 = extractvalue { i64, i64 } %98, 0
  %100 = lshr i64 %99, 32
  %101 = trunc i64 %100 to i32
  %102 = trunc i64 %99 to i32
  %103 = xor i32 %93, %87
  %104 = xor i32 %103, %101
  %105 = xor i64 %97, %81
  %106 = trunc i64 %105 to i32
  %107 = xor i32 %94, %106
  %108 = add i32 %0, -1253254570
  %109 = add nsw i32 %16, 1684936478
  %110 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %104, i64 0) #2, !srcloc !7
  %111 = extractvalue { i64, i64 } %110, 0
  %112 = lshr i64 %111, 32
  %113 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %107, i64 0) #2, !srcloc !7
  %114 = extractvalue { i64, i64 } %113, 0
  %115 = lshr i64 %114, 32
  %116 = trunc i64 %115 to i32
  %117 = trunc i64 %114 to i32
  %118 = xor i32 %108, %102
  %119 = xor i32 %118, %116
  %120 = xor i64 %112, %96
  %121 = trunc i64 %120 to i32
  %122 = xor i32 %109, %121
  %123 = add i32 %0, 1401181199
  %124 = add nsw i32 %16, 534103459
  %125 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %119, i64 0) #2, !srcloc !7
  %126 = extractvalue { i64, i64 } %125, 0
  %127 = lshr i64 %126, 32
  %128 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %122, i64 0) #2, !srcloc !7
  %129 = extractvalue { i64, i64 } %128, 0
  %130 = lshr i64 %129, 32
  %131 = trunc i64 %130 to i32
  %132 = trunc i64 %129 to i32
  %133 = xor i32 %123, %117
  %134 = xor i32 %133, %131
  %135 = xor i64 %127, %111
  %136 = trunc i64 %135 to i32
  %137 = xor i32 %124, %136
  %138 = add i32 %0, -239350328
  %139 = add nsw i32 %16, -616729560
  %140 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %134, i64 0) #2, !srcloc !7
  %141 = extractvalue { i64, i64 } %140, 0
  %142 = lshr i64 %141, 32
  %143 = trunc i64 %141 to i32
  %144 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %137, i64 0) #2, !srcloc !7
  %145 = extractvalue { i64, i64 } %144, 0
  %146 = lshr i64 %145, 32
  %147 = trunc i64 %146 to i32
  %148 = trunc i64 %145 to i32
  %149 = xor i32 %138, %132
  %150 = xor i32 %149, %147
  %151 = xor i64 %142, %126
  %152 = trunc i64 %151 to i32
  %153 = xor i32 %139, %152
  %154 = add i32 %0, -1879881855
  %155 = add nsw i32 %16, -1767562579
  %156 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %150, i64 0) #2, !srcloc !7
  %157 = extractvalue { i64, i64 } %156, 0
  %158 = lshr i64 %157, 32
  %159 = trunc i64 %158 to i32
  %160 = trunc i64 %157 to i32
  %161 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %153, i64 0) #2, !srcloc !7
  %162 = extractvalue { i64, i64 } %161, 0
  %163 = lshr i64 %162, 32
  %164 = trunc i64 %163 to i32
  %165 = trunc i64 %162 to i32
  %166 = xor i32 %154, %148
  %167 = xor i32 %166, %164
  %168 = xor i32 %155, %143
  %169 = xor i32 %168, %159
  %170 = insertelement <4 x i32> undef, i32 %167, i64 0
  %171 = insertelement <4 x i32> %170, i32 %165, i64 1
  %172 = insertelement <4 x i32> %171, i32 %169, i64 2
  %173 = insertelement <4 x i32> %172, i32 %160, i64 3
  %174 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store <4 x i32> %19, <4 x i32> addrspace(1)* %174, align 16
  %175 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  store <4 x i32> %173, <4 x i32> addrspace(1)* %175, align 16
  %176 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0, i64 0
  store i32 %0, i32 addrspace(1)* %176, align 16
  %177 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0, i64 1
  store i32 %16, i32 addrspace(1)* %177, align 4
  %178 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 3
  store i32 0, i32 addrspace(1)* %178, align 8
  %179 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 4
  store i32 0, i32 addrspace(1)* %179, align 4
  %180 = getelementptr inbounds %struct.hiprandStatePhilox4_32_10, %struct.hiprandStatePhilox4_32_10 addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 5
  store i32 0, i32 addrspace(1)* %180, align 16
  br label %181

181:                                              ; preds = %14, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { convergent nounwind }

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
!7 = !{i64 5995752}
