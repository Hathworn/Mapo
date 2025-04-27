; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/12/ComputeKernelParam.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/12/ComputeKernelParam.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @ComputeKernelParam(%struct.HIP_vector_type addrspace(1)* noalias nocapture %0, i32 %1, i32 %2, i32 %3, float %4, float %5, float %6, float %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %19, %1
  %29 = icmp slt i32 %27, %2
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %199

31:                                               ; preds = %10
  %32 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %33 = mul nsw i32 %27, %3
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 %34
  %36 = bitcast i8 addrspace(1)* %35 to %struct.HIP_vector_type addrspace(1)*
  %37 = sext i32 %19 to i64
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %36, i64 %37, i32 0, i32 0, i32 0, i32 0, i64 0
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %36, i64 %37, i32 0, i32 0, i32 0, i32 0, i64 1
  %40 = bitcast float addrspace(1)* %38 to <2 x float> addrspace(1)*
  %41 = load <2 x float>, <2 x float> addrspace(1)* %40, align 4
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %36, i64 %37, i32 0, i32 0, i32 0, i32 0, i64 2
  %43 = load float, float addrspace(1)* %42, align 4, !amdgpu.noclobber !5
  %44 = extractelement <2 x float> %41, i64 0
  %45 = extractelement <2 x float> %41, i64 1
  %46 = fsub contract float %45, %44
  %47 = fmul contract float %46, %46
  %48 = fmul contract float %43, 4.000000e+00
  %49 = fmul contract float %43, %48
  %50 = fadd contract float %47, %49
  %51 = fcmp olt float %50, 0x39F0000000000000
  %52 = select i1 %51, float 0x41F0000000000000, float 1.000000e+00
  %53 = fmul float %50, %52
  %54 = tail call float @llvm.sqrt.f32(float %53)
  %55 = bitcast float %54 to i32
  %56 = add nsw i32 %55, -1
  %57 = bitcast i32 %56 to float
  %58 = add nsw i32 %55, 1
  %59 = bitcast i32 %58 to float
  %60 = tail call i1 @llvm.amdgcn.class.f32(float %53, i32 608)
  %61 = select i1 %51, float 0x3EF0000000000000, float 1.000000e+00
  %62 = fneg float %59
  %63 = tail call float @llvm.fma.f32(float %62, float %54, float %53)
  %64 = fcmp ogt float %63, 0.000000e+00
  %65 = fneg float %57
  %66 = tail call float @llvm.fma.f32(float %65, float %54, float %53)
  %67 = fcmp ole float %66, 0.000000e+00
  %68 = select i1 %67, float %57, float %54
  %69 = select i1 %64, float %59, float %68
  %70 = fmul float %61, %69
  %71 = select i1 %60, float %53, float %70
  %72 = fmul contract float %43, 2.000000e+00
  %73 = fadd contract float %46, %71
  %74 = fmul contract float %72, %72
  %75 = fmul contract float %73, %73
  %76 = fadd contract float %74, %75
  %77 = fcmp olt float %76, 0x39F0000000000000
  %78 = select i1 %77, float 0x41F0000000000000, float 1.000000e+00
  %79 = fmul float %76, %78
  %80 = tail call float @llvm.sqrt.f32(float %79)
  %81 = bitcast float %80 to i32
  %82 = add nsw i32 %81, -1
  %83 = bitcast i32 %82 to float
  %84 = add nsw i32 %81, 1
  %85 = bitcast i32 %84 to float
  %86 = tail call i1 @llvm.amdgcn.class.f32(float %79, i32 608)
  %87 = select i1 %77, float 0x3EF0000000000000, float 1.000000e+00
  %88 = fneg float %85
  %89 = tail call float @llvm.fma.f32(float %88, float %80, float %79)
  %90 = fcmp ogt float %89, 0.000000e+00
  %91 = fneg float %83
  %92 = tail call float @llvm.fma.f32(float %91, float %80, float %79)
  %93 = fcmp ole float %92, 0.000000e+00
  %94 = select i1 %93, float %83, float %80
  %95 = select i1 %90, float %85, float %94
  %96 = fmul float %87, %95
  %97 = select i1 %86, float %79, float %96
  %98 = fcmp contract ogt float %97, 0.000000e+00
  br i1 %98, label %99, label %102

99:                                               ; preds = %31
  %100 = fdiv contract float %72, %97
  %101 = fdiv contract float %73, %97
  br label %102

102:                                              ; preds = %31, %99
  %103 = phi float [ %101, %99 ], [ 0.000000e+00, %31 ]
  %104 = phi float [ %100, %99 ], [ 1.000000e+00, %31 ]
  %105 = fadd contract float %44, %45
  %106 = fadd contract float %105, %71
  %107 = fmul contract float %106, 5.000000e-01
  %108 = fsub contract float %105, %71
  %109 = fmul contract float %108, 5.000000e-01
  %110 = fsub contract float %107, %109
  %111 = fmul contract float %110, %110
  %112 = fadd contract float %107, %109
  %113 = fmul contract float %112, %112
  %114 = fdiv contract float %111, %113
  %115 = fcmp olt float %114, 0x39F0000000000000
  %116 = select i1 %115, float 0x41F0000000000000, float 1.000000e+00
  %117 = fmul float %114, %116
  %118 = tail call float @llvm.sqrt.f32(float %117)
  %119 = bitcast float %118 to i32
  %120 = add nsw i32 %119, -1
  %121 = bitcast i32 %120 to float
  %122 = add nsw i32 %119, 1
  %123 = bitcast i32 %122 to float
  %124 = tail call i1 @llvm.amdgcn.class.f32(float %117, i32 608)
  %125 = select i1 %115, float 0x3EF0000000000000, float 1.000000e+00
  %126 = fneg float %123
  %127 = tail call float @llvm.fma.f32(float %126, float %118, float %117)
  %128 = fcmp ogt float %127, 0.000000e+00
  %129 = fneg float %121
  %130 = tail call float @llvm.fma.f32(float %129, float %118, float %117)
  %131 = fcmp ole float %130, 0.000000e+00
  %132 = select i1 %131, float %121, float %118
  %133 = select i1 %128, float %123, float %132
  %134 = fmul float %125, %133
  %135 = select i1 %124, float %117, float %134
  %136 = fadd contract float %135, 1.000000e+00
  %137 = fcmp olt float %107, 0x39F0000000000000
  %138 = select i1 %137, float 0x41F0000000000000, float 1.000000e+00
  %139 = fmul float %107, %138
  %140 = tail call float @llvm.sqrt.f32(float %139)
  %141 = bitcast float %140 to i32
  %142 = add nsw i32 %141, -1
  %143 = bitcast i32 %142 to float
  %144 = add nsw i32 %141, 1
  %145 = bitcast i32 %144 to float
  %146 = tail call i1 @llvm.amdgcn.class.f32(float %139, i32 608)
  %147 = select i1 %137, float 0x3EF0000000000000, float 1.000000e+00
  %148 = fneg float %145
  %149 = tail call float @llvm.fma.f32(float %148, float %140, float %139)
  %150 = fcmp ogt float %149, 0.000000e+00
  %151 = fneg float %143
  %152 = tail call float @llvm.fma.f32(float %151, float %140, float %139)
  %153 = fcmp ole float %152, 0.000000e+00
  %154 = select i1 %153, float %143, float %140
  %155 = select i1 %150, float %145, float %154
  %156 = fmul float %147, %155
  %157 = select i1 %146, float %139, float %156
  %158 = fdiv contract float %157, %5
  %159 = fsub contract float 1.000000e+00, %158
  %160 = fadd contract float %159, %4
  %161 = tail call float @llvm.minnum.f32(float %160, float 1.000000e+00)
  %162 = tail call float @llvm.maxnum.f32(float %161, float 0.000000e+00)
  %163 = fmul contract float %6, %8
  %164 = fmul contract float %163, %136
  %165 = fdiv contract float %6, %9
  %166 = fmul contract float %165, %136
  %167 = fsub contract float 1.000000e+00, %162
  %168 = fmul contract float %164, %167
  %169 = fmul contract float %162, %6
  %170 = fmul contract float %169, %7
  %171 = fadd contract float %168, %170
  %172 = fmul contract float %166, %167
  %173 = fadd contract float %172, %170
  %174 = fmul contract float %171, %171
  %175 = fmul contract float %173, %173
  %176 = fneg contract float %104
  %177 = fmul contract float %174, %103
  %178 = fmul contract float %103, %177
  %179 = fmul contract float %104, %104
  %180 = fmul contract float %175, %179
  %181 = fadd contract float %178, %180
  %182 = fmul contract float %103, %104
  %183 = fmul contract float %175, %182
  %184 = fmul contract float %104, %177
  %185 = fsub contract float %183, %184
  %186 = fmul contract float %174, %176
  %187 = fmul contract float %103, %103
  %188 = fmul contract float %175, %187
  %189 = fmul contract float %104, %186
  %190 = fsub contract float %188, %189
  %191 = fmul contract float %181, %190
  %192 = fmul contract float %185, %185
  %193 = fsub contract float %191, %192
  %194 = fadd contract float %193, 0x3DDB7CDFE0000000
  %195 = fdiv contract float %190, %194
  %196 = fdiv contract float %181, %194
  %197 = fneg contract float %185
  %198 = fdiv contract float %197, %194
  store float %195, float addrspace(1)* %38, align 4
  store float %196, float addrspace(1)* %39, align 4
  store float %198, float addrspace(1)* %42, align 4
  br label %199

199:                                              ; preds = %10, %102
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
