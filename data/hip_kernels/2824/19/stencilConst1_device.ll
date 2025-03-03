; ModuleID = '../data/hip_kernels/2824/19/main.cu'
source_filename = "../data/hip_kernels/2824/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@const_stencilWeight = protected addrspace(4) externally_initialized global [10000 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([10000 x float] addrspace(4)* @const_stencilWeight to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13stencilConst1PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add nuw nsw i32 %11, 11
  %13 = add i32 %12, %10
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %156

15:                                               ; preds = %3
  %16 = add nsw i32 %13, -10
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 0), align 16, !tbaa !7
  %21 = fmul contract float %19, %20
  %22 = fadd contract float %21, 0.000000e+00
  %23 = add nsw i32 %13, -9
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 1), align 4, !tbaa !7
  %28 = fmul contract float %26, %27
  %29 = fadd contract float %22, %28
  %30 = add nsw i32 %13, -8
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 2), align 8, !tbaa !7
  %35 = fmul contract float %33, %34
  %36 = fadd contract float %29, %35
  %37 = add nsw i32 %13, -7
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 3), align 4, !tbaa !7
  %42 = fmul contract float %40, %41
  %43 = fadd contract float %36, %42
  %44 = add nsw i32 %13, -6
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 4), align 16, !tbaa !7
  %49 = fmul contract float %47, %48
  %50 = fadd contract float %43, %49
  %51 = add nsw i32 %13, -5
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 5), align 4, !tbaa !7
  %56 = fmul contract float %54, %55
  %57 = fadd contract float %50, %56
  %58 = add nsw i32 %13, -4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 6), align 8, !tbaa !7
  %63 = fmul contract float %61, %62
  %64 = fadd contract float %57, %63
  %65 = add nsw i32 %13, -3
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 7), align 4, !tbaa !7
  %70 = fmul contract float %68, %69
  %71 = fadd contract float %64, %70
  %72 = add nsw i32 %13, -2
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 8), align 16, !tbaa !7
  %77 = fmul contract float %75, %76
  %78 = fadd contract float %71, %77
  %79 = add nsw i32 %13, -1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 9), align 4, !tbaa !7
  %84 = fmul contract float %82, %83
  %85 = fadd contract float %78, %84
  %86 = sext i32 %13 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 10), align 8, !tbaa !7
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %85, %90
  %92 = add nsw i32 %13, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 11), align 4, !tbaa !7
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %91, %97
  %99 = add nsw i32 %13, 2
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 12), align 16, !tbaa !7
  %104 = fmul contract float %102, %103
  %105 = fadd contract float %98, %104
  %106 = add nsw i32 %13, 3
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 13), align 4, !tbaa !7
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %105, %111
  %113 = add nsw i32 %13, 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 14), align 8, !tbaa !7
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %112, %118
  %120 = add nsw i32 %13, 5
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 15), align 4, !tbaa !7
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %119, %125
  %127 = add nsw i32 %13, 6
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 16), align 16, !tbaa !7
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %126, %132
  %134 = add nsw i32 %13, 7
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 17), align 4, !tbaa !7
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %133, %139
  %141 = add nsw i32 %13, 8
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 18), align 8, !tbaa !7
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %140, %146
  %148 = add nsw i32 %13, 9
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = load float, float addrspace(4)* getelementptr inbounds ([10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 19), align 4, !tbaa !7
  %153 = fmul contract float %151, %152
  %154 = fadd contract float %147, %153
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  store float %154, float addrspace(1)* %155, align 4, !tbaa !7
  br label %156

156:                                              ; preds = %3, %15
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
