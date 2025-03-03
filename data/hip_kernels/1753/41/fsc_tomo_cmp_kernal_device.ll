; ModuleID = '../data/hip_kernels/1753/41/main.cu'
source_filename = "../data/hip_kernels/1753/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19fsc_tomo_cmp_kernalPKfS0_Pfffiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float %3, float %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl i32 %11, 7
  %13 = add i32 %12, %10
  %14 = add i32 %13, %8
  %15 = icmp sgt i32 %6, 0
  br i1 %15, label %16, label %70

16:                                               ; preds = %9
  %17 = srem i32 %14, %5
  %18 = sdiv i32 %17, 2
  %19 = shl nsw i32 %18, 1
  %20 = shl nsw i32 %14, 1
  %21 = sdiv i32 %20, %5
  %22 = mul i32 %7, %6
  %23 = mul i32 %22, %21
  %24 = and i32 %6, 1
  %25 = icmp eq i32 %6, 1
  br i1 %25, label %28, label %26

26:                                               ; preds = %16
  %27 = and i32 %6, -2
  br label %83

28:                                               ; preds = %158, %16
  %29 = phi float [ undef, %16 ], [ %159, %158 ]
  %30 = phi float [ undef, %16 ], [ %160, %158 ]
  %31 = phi float [ undef, %16 ], [ %161, %158 ]
  %32 = phi float [ 0.000000e+00, %16 ], [ %161, %158 ]
  %33 = phi float [ 0.000000e+00, %16 ], [ %160, %158 ]
  %34 = phi float [ 0.000000e+00, %16 ], [ %159, %158 ]
  %35 = phi i32 [ 0, %16 ], [ %162, %158 ]
  %36 = icmp eq i32 %24, 0
  br i1 %36, label %70, label %37

37:                                               ; preds = %28
  %38 = mul nsw i32 %35, %5
  %39 = add nsw i32 %19, %38
  %40 = add nsw i32 %39, %23
  %41 = add i32 %40, 1
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = sext i32 %41 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = fmul contract float %44, %44
  %53 = fmul contract float %47, %47
  %54 = fadd contract float %52, %53
  %55 = fcmp contract ogt float %54, %3
  br i1 %55, label %56, label %70

56:                                               ; preds = %37
  %57 = fmul contract float %49, %49
  %58 = fmul contract float %51, %51
  %59 = fadd contract float %57, %58
  %60 = fcmp contract ogt float %59, %4
  %61 = fmul contract float %44, %49
  %62 = fmul contract float %47, %51
  %63 = fadd contract float %61, %62
  %64 = select i1 %60, float %63, float -0.000000e+00
  %65 = fadd contract float %34, %64
  %66 = select i1 %60, float %59, float -0.000000e+00
  %67 = fadd contract float %33, %66
  %68 = select i1 %60, float %54, float -0.000000e+00
  %69 = fadd contract float %32, %68
  br label %70

70:                                               ; preds = %28, %56, %37, %9
  %71 = phi float [ 0.000000e+00, %9 ], [ %29, %28 ], [ %34, %37 ], [ %65, %56 ]
  %72 = phi float [ 0.000000e+00, %9 ], [ %30, %28 ], [ %33, %37 ], [ %67, %56 ]
  %73 = phi float [ 0.000000e+00, %9 ], [ %31, %28 ], [ %32, %37 ], [ %69, %56 ]
  %74 = mul nsw i32 %14, 3
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  store float %71, float addrspace(1)* %76, align 4, !tbaa !5
  %77 = add nsw i32 %74, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  store float %73, float addrspace(1)* %79, align 4, !tbaa !5
  %80 = add nsw i32 %74, 2
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  store float %72, float addrspace(1)* %82, align 4, !tbaa !5
  ret void

83:                                               ; preds = %158, %26
  %84 = phi float [ 0.000000e+00, %26 ], [ %161, %158 ]
  %85 = phi float [ 0.000000e+00, %26 ], [ %160, %158 ]
  %86 = phi float [ 0.000000e+00, %26 ], [ %159, %158 ]
  %87 = phi i32 [ 0, %26 ], [ %162, %158 ]
  %88 = phi i32 [ 0, %26 ], [ %163, %158 ]
  %89 = mul nsw i32 %87, %5
  %90 = add nsw i32 %19, %89
  %91 = add nsw i32 %90, %23
  %92 = add i32 %91, 1
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = sext i32 %92 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = fmul contract float %95, %95
  %104 = fmul contract float %98, %98
  %105 = fadd contract float %103, %104
  %106 = fcmp contract ogt float %105, %3
  br i1 %106, label %107, label %121

107:                                              ; preds = %83
  %108 = fmul contract float %100, %100
  %109 = fmul contract float %102, %102
  %110 = fadd contract float %108, %109
  %111 = fcmp contract ogt float %110, %4
  %112 = fmul contract float %95, %100
  %113 = fmul contract float %98, %102
  %114 = fadd contract float %112, %113
  %115 = select i1 %111, float %114, float -0.000000e+00
  %116 = fadd contract float %86, %115
  %117 = select i1 %111, float %110, float -0.000000e+00
  %118 = fadd contract float %85, %117
  %119 = select i1 %111, float %105, float -0.000000e+00
  %120 = fadd contract float %84, %119
  br label %121

121:                                              ; preds = %107, %83
  %122 = phi float [ %86, %83 ], [ %116, %107 ]
  %123 = phi float [ %85, %83 ], [ %118, %107 ]
  %124 = phi float [ %84, %83 ], [ %120, %107 ]
  %125 = or i32 %87, 1
  %126 = mul nsw i32 %125, %5
  %127 = add nsw i32 %19, %126
  %128 = add nsw i32 %127, %23
  %129 = add i32 %128, 1
  %130 = sext i32 %128 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5, !amdgpu.noclobber !9
  %133 = sext i32 %129 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5, !amdgpu.noclobber !9
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !5, !amdgpu.noclobber !9
  %140 = fmul contract float %132, %132
  %141 = fmul contract float %135, %135
  %142 = fadd contract float %140, %141
  %143 = fcmp contract ogt float %142, %3
  br i1 %143, label %144, label %158

144:                                              ; preds = %121
  %145 = fmul contract float %137, %137
  %146 = fmul contract float %139, %139
  %147 = fadd contract float %145, %146
  %148 = fcmp contract ogt float %147, %4
  %149 = fmul contract float %132, %137
  %150 = fmul contract float %135, %139
  %151 = fadd contract float %149, %150
  %152 = select i1 %148, float %151, float -0.000000e+00
  %153 = fadd contract float %122, %152
  %154 = select i1 %148, float %147, float -0.000000e+00
  %155 = fadd contract float %123, %154
  %156 = select i1 %148, float %142, float -0.000000e+00
  %157 = fadd contract float %124, %156
  br label %158

158:                                              ; preds = %144, %121
  %159 = phi float [ %122, %121 ], [ %153, %144 ]
  %160 = phi float [ %123, %121 ], [ %155, %144 ]
  %161 = phi float [ %124, %121 ], [ %157, %144 ]
  %162 = add nuw nsw i32 %87, 2
  %163 = add i32 %88, 2
  %164 = icmp eq i32 %163, %27
  br i1 %164, label %28, label %83, !llvm.loop !10
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
