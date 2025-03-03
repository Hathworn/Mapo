; ModuleID = '../data/hip_kernels/1169/18/main.cu'
source_filename = "../data/hip_kernels/1169/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21gradientColumnsKernelPfS_iiiE6s_Data = internal unnamed_addr addrspace(3) global [4 x [4 x [177 x float]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21gradientColumnsKernelPfS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 2
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = mul i32 %10, 144
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add nsw i32 %12, -16
  %14 = add i32 %13, %11
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %16 = shl i32 %15, 2
  %17 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %18 = add i32 %16, %17
  %19 = mul nsw i32 %18, %3
  %20 = add nsw i32 %19, %14
  %21 = mul nsw i32 %20, %2
  %22 = add nsw i32 %9, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = shl nsw i32 %2, 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %24, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = add nuw nsw i32 %12, 16
  %30 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %29
  store float %28, float addrspace(3)* %30, align 4, !tbaa !5
  %31 = shl nsw i32 %2, 5
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %24, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = add nuw nsw i32 %12, 32
  %36 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %35
  store float %34, float addrspace(3)* %36, align 4, !tbaa !5
  %37 = mul nsw i32 %2, 48
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %24, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5, !amdgpu.noclobber !9
  %41 = add nuw nsw i32 %12, 48
  %42 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %41
  store float %40, float addrspace(3)* %42, align 4, !tbaa !5
  %43 = shl nsw i32 %2, 6
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %24, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = add nuw nsw i32 %12, 64
  %48 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %47
  store float %46, float addrspace(3)* %48, align 4, !tbaa !5
  %49 = mul nsw i32 %2, 80
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %24, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = add nuw nsw i32 %12, 80
  %54 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %53
  store float %52, float addrspace(3)* %54, align 4, !tbaa !5
  %55 = mul nsw i32 %2, 96
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %24, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = add nuw nsw i32 %12, 96
  %60 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %59
  store float %58, float addrspace(3)* %60, align 4, !tbaa !5
  %61 = mul nsw i32 %2, 112
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %24, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = add nuw nsw i32 %12, 112
  %66 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %65
  store float %64, float addrspace(3)* %66, align 4, !tbaa !5
  %67 = shl nsw i32 %2, 7
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %24, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  %71 = add nuw nsw i32 %12, 128
  %72 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %71
  store float %70, float addrspace(3)* %72, align 4, !tbaa !5
  %73 = mul nsw i32 %2, 144
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %24, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = add nuw nsw i32 %12, 144
  %78 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %77
  store float %76, float addrspace(3)* %78, align 4, !tbaa !5
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %80 = icmp sgt i32 %14, -1
  br i1 %80, label %81, label %83

81:                                               ; preds = %5
  %82 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %83

83:                                               ; preds = %5, %81
  %84 = phi contract float [ %82, %81 ], [ 0.000000e+00, %5 ]
  %85 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %12
  store float %84, float addrspace(3)* %85, align 4, !tbaa !5
  %86 = add nsw i32 %14, 160
  %87 = icmp slt i32 %86, %3
  br i1 %87, label %88, label %93

88:                                               ; preds = %83
  %89 = mul nsw i32 %2, 160
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %24, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %93

93:                                               ; preds = %83, %88
  %94 = phi contract float [ %92, %88 ], [ 0.000000e+00, %83 ]
  %95 = add nuw nsw i32 %12, 160
  %96 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %95
  store float %94, float addrspace(3)* %96, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = add nuw nsw i32 %12, 17
  %98 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %100 = fadd contract float %99, 0.000000e+00
  %101 = add nuw nsw i32 %12, 15
  %102 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %101
  %103 = load float, float addrspace(3)* %102, align 4, !tbaa !5
  %104 = fsub contract float %100, %103
  %105 = fmul contract float %104, 5.000000e-01
  %106 = getelementptr inbounds float, float addrspace(1)* %79, i64 %26
  store float %105, float addrspace(1)* %106, align 4, !tbaa !5
  %107 = add nuw nsw i32 %12, 33
  %108 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %107
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !5
  %110 = fadd contract float %109, 0.000000e+00
  %111 = add nuw nsw i32 %12, 31
  %112 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %111
  %113 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %114 = fsub contract float %110, %113
  %115 = fmul contract float %114, 5.000000e-01
  %116 = getelementptr inbounds float, float addrspace(1)* %79, i64 %32
  store float %115, float addrspace(1)* %116, align 4, !tbaa !5
  %117 = add nuw nsw i32 %12, 49
  %118 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %120 = fadd contract float %119, 0.000000e+00
  %121 = add nuw nsw i32 %12, 47
  %122 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %121
  %123 = load float, float addrspace(3)* %122, align 4, !tbaa !5
  %124 = fsub contract float %120, %123
  %125 = fmul contract float %124, 5.000000e-01
  %126 = getelementptr inbounds float, float addrspace(1)* %79, i64 %38
  store float %125, float addrspace(1)* %126, align 4, !tbaa !5
  %127 = add nuw nsw i32 %12, 65
  %128 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %127
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !5
  %130 = fadd contract float %129, 0.000000e+00
  %131 = add nuw nsw i32 %12, 63
  %132 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %131
  %133 = load float, float addrspace(3)* %132, align 4, !tbaa !5
  %134 = fsub contract float %130, %133
  %135 = fmul contract float %134, 5.000000e-01
  %136 = getelementptr inbounds float, float addrspace(1)* %79, i64 %44
  store float %135, float addrspace(1)* %136, align 4, !tbaa !5
  %137 = add nuw nsw i32 %12, 81
  %138 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %137
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !5
  %140 = fadd contract float %139, 0.000000e+00
  %141 = add nuw nsw i32 %12, 79
  %142 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %141
  %143 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %144 = fsub contract float %140, %143
  %145 = fmul contract float %144, 5.000000e-01
  %146 = getelementptr inbounds float, float addrspace(1)* %79, i64 %50
  store float %145, float addrspace(1)* %146, align 4, !tbaa !5
  %147 = add nuw nsw i32 %12, 97
  %148 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %147
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !5
  %150 = fadd contract float %149, 0.000000e+00
  %151 = add nuw nsw i32 %12, 95
  %152 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %151
  %153 = load float, float addrspace(3)* %152, align 4, !tbaa !5
  %154 = fsub contract float %150, %153
  %155 = fmul contract float %154, 5.000000e-01
  %156 = getelementptr inbounds float, float addrspace(1)* %79, i64 %56
  store float %155, float addrspace(1)* %156, align 4, !tbaa !5
  %157 = add nuw nsw i32 %12, 113
  %158 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %157
  %159 = load float, float addrspace(3)* %158, align 4, !tbaa !5
  %160 = fadd contract float %159, 0.000000e+00
  %161 = add nuw nsw i32 %12, 111
  %162 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %161
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !5
  %164 = fsub contract float %160, %163
  %165 = fmul contract float %164, 5.000000e-01
  %166 = getelementptr inbounds float, float addrspace(1)* %79, i64 %62
  store float %165, float addrspace(1)* %166, align 4, !tbaa !5
  %167 = add nuw nsw i32 %12, 129
  %168 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %167
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !5
  %170 = fadd contract float %169, 0.000000e+00
  %171 = add nuw nsw i32 %12, 127
  %172 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %171
  %173 = load float, float addrspace(3)* %172, align 4, !tbaa !5
  %174 = fsub contract float %170, %173
  %175 = fmul contract float %174, 5.000000e-01
  %176 = getelementptr inbounds float, float addrspace(1)* %79, i64 %68
  store float %175, float addrspace(1)* %176, align 4, !tbaa !5
  %177 = add nuw nsw i32 %12, 145
  %178 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %177
  %179 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %180 = fadd contract float %179, 0.000000e+00
  %181 = add nuw nsw i32 %12, 143
  %182 = getelementptr inbounds [4 x [4 x [177 x float]]], [4 x [4 x [177 x float]]] addrspace(3)* @_ZZ21gradientColumnsKernelPfS_iiiE6s_Data, i32 0, i32 %17, i32 %8, i32 %181
  %183 = load float, float addrspace(3)* %182, align 4, !tbaa !5
  %184 = fsub contract float %180, %183
  %185 = fmul contract float %184, 5.000000e-01
  %186 = getelementptr inbounds float, float addrspace(1)* %79, i64 %74
  store float %185, float addrspace(1)* %186, align 4, !tbaa !5
  ret void
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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
