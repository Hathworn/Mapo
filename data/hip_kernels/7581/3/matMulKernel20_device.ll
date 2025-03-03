; ModuleID = '../data/hip_kernels/7581/3/main.cu'
source_filename = "../data/hip_kernels/7581/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14matMulKernel20PfS_S_iE5Mds20 = internal unnamed_addr addrspace(3) global [20 x [20 x float]] undef, align 16
@_ZZ14matMulKernel20PfS_S_iE5Nds20 = internal unnamed_addr addrspace(3) global [20 x [20 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14matMulKernel20PfS_S_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = mul nsw i32 %6, 20
  %10 = add nsw i32 %9, %8
  %11 = mul nsw i32 %5, 20
  %12 = add nsw i32 %11, %7
  %13 = sdiv i32 %3, 20
  %14 = icmp sgt i32 %3, 19
  %15 = mul nsw i32 %10, %3
  br i1 %14, label %16, label %60

16:                                               ; preds = %4
  %17 = add i32 %15, %7
  %18 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 %7
  %19 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 %8, i32 %7
  %20 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 0
  %21 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 0, i32 %7
  %22 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 1
  %23 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 1, i32 %7
  %24 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 2
  %25 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 2, i32 %7
  %26 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 3
  %27 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 3, i32 %7
  %28 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 4
  %29 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 4, i32 %7
  %30 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 5
  %31 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 5, i32 %7
  %32 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 6
  %33 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 6, i32 %7
  %34 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 7
  %35 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 7, i32 %7
  %36 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 8
  %37 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 8, i32 %7
  %38 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 9
  %39 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 9, i32 %7
  %40 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 10
  %41 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 10, i32 %7
  %42 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 11
  %43 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 11, i32 %7
  %44 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 12
  %45 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 12, i32 %7
  %46 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 13
  %47 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 13, i32 %7
  %48 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 14
  %49 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 14, i32 %7
  %50 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 15
  %51 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 15, i32 %7
  %52 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 16
  %53 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 16, i32 %7
  %54 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 17
  %55 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 17, i32 %7
  %56 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 18
  %57 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 18, i32 %7
  %58 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Mds20, i32 0, i32 %8, i32 19
  %59 = getelementptr inbounds [20 x [20 x float]], [20 x [20 x float]] addrspace(3)* @_ZZ14matMulKernel20PfS_S_iE5Nds20, i32 0, i32 19, i32 %7
  br label %65

60:                                               ; preds = %65, %4
  %61 = phi float [ 0.000000e+00, %4 ], [ %158, %65 ]
  %62 = add nsw i32 %15, %12
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  store float %61, float addrspace(1)* %64, align 4, !tbaa !5
  ret void

65:                                               ; preds = %16, %65
  %66 = phi i32 [ 0, %16 ], [ %159, %65 ]
  %67 = phi float [ 0.000000e+00, %16 ], [ %158, %65 ]
  %68 = mul nuw nsw i32 %66, 20
  %69 = add i32 %17, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %72, float addrspace(3)* %18, align 4, !tbaa !5
  %73 = add nuw nsw i32 %68, %8
  %74 = mul nsw i32 %73, %3
  %75 = add nsw i32 %74, %12
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %78, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = load float, float addrspace(3)* %20, align 16, !tbaa !5
  %80 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %81 = fmul contract float %79, %80
  %82 = fadd contract float %67, %81
  %83 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %84 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %85 = fmul contract float %83, %84
  %86 = fadd contract float %82, %85
  %87 = load float, float addrspace(3)* %24, align 8, !tbaa !5
  %88 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %86, %89
  %91 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %92 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %93 = fmul contract float %91, %92
  %94 = fadd contract float %90, %93
  %95 = load float, float addrspace(3)* %28, align 16, !tbaa !5
  %96 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %97 = fmul contract float %95, %96
  %98 = fadd contract float %94, %97
  %99 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %100 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %101 = fmul contract float %99, %100
  %102 = fadd contract float %98, %101
  %103 = load float, float addrspace(3)* %32, align 8, !tbaa !5
  %104 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %105 = fmul contract float %103, %104
  %106 = fadd contract float %102, %105
  %107 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %108 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %109 = fmul contract float %107, %108
  %110 = fadd contract float %106, %109
  %111 = load float, float addrspace(3)* %36, align 16, !tbaa !5
  %112 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %110, %113
  %115 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %116 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %114, %117
  %119 = load float, float addrspace(3)* %40, align 8, !tbaa !5
  %120 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %121 = fmul contract float %119, %120
  %122 = fadd contract float %118, %121
  %123 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %124 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %122, %125
  %127 = load float, float addrspace(3)* %44, align 16, !tbaa !5
  %128 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %129 = fmul contract float %127, %128
  %130 = fadd contract float %126, %129
  %131 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %132 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %133 = fmul contract float %131, %132
  %134 = fadd contract float %130, %133
  %135 = load float, float addrspace(3)* %48, align 8, !tbaa !5
  %136 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %137 = fmul contract float %135, %136
  %138 = fadd contract float %134, %137
  %139 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %140 = load float, float addrspace(3)* %51, align 4, !tbaa !5
  %141 = fmul contract float %139, %140
  %142 = fadd contract float %138, %141
  %143 = load float, float addrspace(3)* %52, align 16, !tbaa !5
  %144 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %142, %145
  %147 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %148 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %146, %149
  %151 = load float, float addrspace(3)* %56, align 8, !tbaa !5
  %152 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %153 = fmul contract float %151, %152
  %154 = fadd contract float %150, %153
  %155 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %156 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %157 = fmul contract float %155, %156
  %158 = fadd contract float %154, %157
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %159 = add nuw nsw i32 %66, 1
  %160 = icmp eq i32 %159, %13
  br i1 %160, label %60, label %65, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
