; ModuleID = '../data/hip_kernels/9275/3/main.cu'
source_filename = "../data/hip_kernels/9275/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23d_addToCurrentTransformPfS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = load float, float addrspace(1)* %1, align 4, !tbaa !4
  %4 = load float, float addrspace(1)* %0, align 4, !tbaa !4
  %5 = fmul contract float %3, %4
  %6 = fadd contract float %5, 0.000000e+00
  %7 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %8 = load float, float addrspace(1)* %7, align 4, !tbaa !4
  %9 = getelementptr inbounds float, float addrspace(1)* %0, i64 4
  %10 = load float, float addrspace(1)* %9, align 4, !tbaa !4
  %11 = fmul contract float %8, %10
  %12 = fadd contract float %6, %11
  %13 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !4
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 8
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !4
  %17 = fmul contract float %14, %16
  %18 = fadd contract float %12, %17
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 3
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !4
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 12
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !4
  %23 = fmul contract float %20, %22
  %24 = fadd contract float %18, %23
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !4
  %27 = fmul contract float %3, %26
  %28 = fadd contract float %27, 0.000000e+00
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 5
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !4
  %31 = fmul contract float %8, %30
  %32 = fadd contract float %28, %31
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 9
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !4
  %35 = fmul contract float %14, %34
  %36 = fadd contract float %32, %35
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 13
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !4
  %39 = fmul contract float %20, %38
  %40 = fadd contract float %36, %39
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !4
  %43 = fmul contract float %3, %42
  %44 = fadd contract float %43, 0.000000e+00
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 6
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !4
  %47 = fmul contract float %8, %46
  %48 = fadd contract float %44, %47
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 10
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !4
  %51 = fmul contract float %14, %50
  %52 = fadd contract float %48, %51
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 14
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !4
  %55 = fmul contract float %20, %54
  %56 = fadd contract float %52, %55
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 3
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !4
  %59 = fmul contract float %3, %58
  %60 = fadd contract float %59, 0.000000e+00
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 7
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !4
  %63 = fmul contract float %8, %62
  %64 = fadd contract float %60, %63
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 11
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !4
  %67 = fmul contract float %14, %66
  %68 = fadd contract float %64, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 15
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !4
  %71 = fmul contract float %20, %70
  %72 = fadd contract float %68, %71
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 4
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !4
  %75 = fmul contract float %74, %4
  %76 = fadd contract float %75, 0.000000e+00
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 5
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !4
  %79 = fmul contract float %78, %10
  %80 = fadd contract float %76, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 6
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !4
  %83 = fmul contract float %82, %16
  %84 = fadd contract float %80, %83
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 7
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !4
  %87 = fmul contract float %86, %22
  %88 = fadd contract float %84, %87
  %89 = fmul contract float %74, %26
  %90 = fadd contract float %89, 0.000000e+00
  %91 = fmul contract float %78, %30
  %92 = fadd contract float %90, %91
  %93 = fmul contract float %82, %34
  %94 = fadd contract float %92, %93
  %95 = fmul contract float %86, %38
  %96 = fadd contract float %94, %95
  %97 = fmul contract float %74, %42
  %98 = fadd contract float %97, 0.000000e+00
  %99 = fmul contract float %78, %46
  %100 = fadd contract float %98, %99
  %101 = fmul contract float %82, %50
  %102 = fadd contract float %100, %101
  %103 = fmul contract float %86, %54
  %104 = fadd contract float %102, %103
  %105 = fmul contract float %74, %58
  %106 = fadd contract float %105, 0.000000e+00
  %107 = fmul contract float %78, %62
  %108 = fadd contract float %106, %107
  %109 = fmul contract float %82, %66
  %110 = fadd contract float %108, %109
  %111 = fmul contract float %86, %70
  %112 = fadd contract float %110, %111
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 8
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !4
  %115 = load float, float addrspace(1)* %0, align 4, !tbaa !4, !amdgpu.noclobber !8
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %116, 0.000000e+00
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 9
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !4
  %120 = load float, float addrspace(1)* %9, align 4, !tbaa !4, !amdgpu.noclobber !8
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %117, %121
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 10
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !4
  %125 = load float, float addrspace(1)* %15, align 4, !tbaa !4, !amdgpu.noclobber !8
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %122, %126
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 11
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !4
  %130 = load float, float addrspace(1)* %21, align 4, !tbaa !4, !amdgpu.noclobber !8
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %127, %131
  %133 = load float, float addrspace(1)* %25, align 4, !tbaa !4, !amdgpu.noclobber !8
  %134 = fmul contract float %114, %133
  %135 = fadd contract float %134, 0.000000e+00
  %136 = load float, float addrspace(1)* %29, align 4, !tbaa !4, !amdgpu.noclobber !8
  %137 = fmul contract float %119, %136
  %138 = fadd contract float %135, %137
  %139 = load float, float addrspace(1)* %33, align 4, !tbaa !4, !amdgpu.noclobber !8
  %140 = fmul contract float %124, %139
  %141 = fadd contract float %138, %140
  %142 = load float, float addrspace(1)* %37, align 4, !tbaa !4, !amdgpu.noclobber !8
  %143 = fmul contract float %129, %142
  %144 = fadd contract float %141, %143
  %145 = load float, float addrspace(1)* %41, align 4, !tbaa !4, !amdgpu.noclobber !8
  %146 = fmul contract float %114, %145
  %147 = fadd contract float %146, 0.000000e+00
  %148 = load float, float addrspace(1)* %45, align 4, !tbaa !4, !amdgpu.noclobber !8
  %149 = fmul contract float %119, %148
  %150 = fadd contract float %147, %149
  %151 = load float, float addrspace(1)* %49, align 4, !tbaa !4, !amdgpu.noclobber !8
  %152 = fmul contract float %124, %151
  %153 = fadd contract float %150, %152
  %154 = load float, float addrspace(1)* %53, align 4, !tbaa !4, !amdgpu.noclobber !8
  %155 = fmul contract float %129, %154
  %156 = fadd contract float %153, %155
  %157 = fmul contract float %114, %58
  %158 = fadd contract float %157, 0.000000e+00
  %159 = fmul contract float %119, %62
  %160 = fadd contract float %158, %159
  %161 = fmul contract float %124, %66
  %162 = fadd contract float %160, %161
  %163 = fmul contract float %129, %70
  %164 = fadd contract float %162, %163
  store float %24, float addrspace(1)* %0, align 4, !tbaa !4
  store float %40, float addrspace(1)* %25, align 4, !tbaa !4
  store float %56, float addrspace(1)* %41, align 4, !tbaa !4
  store float %72, float addrspace(1)* %57, align 4, !tbaa !4
  store float %88, float addrspace(1)* %9, align 4, !tbaa !4
  store float %96, float addrspace(1)* %29, align 4, !tbaa !4
  store float %104, float addrspace(1)* %45, align 4, !tbaa !4
  store float %112, float addrspace(1)* %61, align 4, !tbaa !4
  store float %132, float addrspace(1)* %15, align 4, !tbaa !4
  store float %144, float addrspace(1)* %33, align 4, !tbaa !4
  store float %156, float addrspace(1)* %49, align 4, !tbaa !4
  store float %164, float addrspace(1)* %65, align 4, !tbaa !4
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
