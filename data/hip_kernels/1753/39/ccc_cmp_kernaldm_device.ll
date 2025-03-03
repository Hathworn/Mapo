; ModuleID = '../data/hip_kernels/1753/39/main.cu'
source_filename = "../data/hip_kernels/1753/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16ccc_cmp_kernaldmPKfS0_S0_Pfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %6
  %12 = add i32 %11, %9
  %13 = add i32 %12, %7
  %14 = freeze i32 %13
  %15 = icmp sgt i32 %4, 0
  br i1 %15, label %16, label %60

16:                                               ; preds = %8
  %17 = srem i32 %14, %4
  %18 = sub nsw i32 %14, %17
  %19 = and i32 %4, 1
  %20 = icmp eq i32 %4, 1
  br i1 %20, label %23, label %21

21:                                               ; preds = %16
  %22 = and i32 %4, -2
  br label %89

23:                                               ; preds = %148, %16
  %24 = phi float [ undef, %16 ], [ %149, %148 ]
  %25 = phi float [ undef, %16 ], [ %150, %148 ]
  %26 = phi float [ undef, %16 ], [ %151, %148 ]
  %27 = phi float [ undef, %16 ], [ %152, %148 ]
  %28 = phi float [ undef, %16 ], [ %153, %148 ]
  %29 = phi float [ undef, %16 ], [ %154, %148 ]
  %30 = phi float [ 0.000000e+00, %16 ], [ %154, %148 ]
  %31 = phi i32 [ 0, %16 ], [ %155, %148 ]
  %32 = phi float [ 0.000000e+00, %16 ], [ %153, %148 ]
  %33 = phi float [ 0.000000e+00, %16 ], [ %152, %148 ]
  %34 = phi float [ 0.000000e+00, %16 ], [ %151, %148 ]
  %35 = phi float [ 0.000000e+00, %16 ], [ %150, %148 ]
  %36 = phi float [ 0.000000e+00, %16 ], [ %149, %148 ]
  %37 = icmp eq i32 %19, 0
  br i1 %37, label %60, label %38

38:                                               ; preds = %23
  %39 = add i32 %18, %31
  %40 = mul i32 %39, %4
  %41 = add i32 %40, %17
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = fcmp contract ogt float %44, 5.000000e-01
  br i1 %45, label %46, label %60

46:                                               ; preds = %38
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = fadd contract float %30, %48
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = fadd contract float %32, %51
  %53 = fmul contract float %48, %48
  %54 = fadd contract float %33, %53
  %55 = fmul contract float %51, %51
  %56 = fadd contract float %34, %55
  %57 = fmul contract float %48, %51
  %58 = fadd contract float %36, %57
  %59 = fadd contract float %35, 1.000000e+00
  br label %60

60:                                               ; preds = %23, %46, %38, %8
  %61 = phi float [ 0.000000e+00, %8 ], [ %24, %23 ], [ %58, %46 ], [ %36, %38 ]
  %62 = phi float [ 0.000000e+00, %8 ], [ %25, %23 ], [ %59, %46 ], [ %35, %38 ]
  %63 = phi float [ 0.000000e+00, %8 ], [ %26, %23 ], [ %56, %46 ], [ %34, %38 ]
  %64 = phi float [ 0.000000e+00, %8 ], [ %27, %23 ], [ %54, %46 ], [ %33, %38 ]
  %65 = phi float [ 0.000000e+00, %8 ], [ %28, %23 ], [ %52, %46 ], [ %32, %38 ]
  %66 = phi float [ 0.000000e+00, %8 ], [ %29, %23 ], [ %49, %46 ], [ %30, %38 ]
  %67 = fdiv contract float %66, %62
  %68 = sext i32 %14 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %3, i64 %68
  store float %67, float addrspace(1)* %69, align 4, !tbaa !5
  %70 = fdiv contract float %65, %62
  %71 = add nsw i32 %14, %5
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %3, i64 %72
  store float %70, float addrspace(1)* %73, align 4, !tbaa !5
  %74 = fdiv contract float %64, %62
  %75 = shl nsw i32 %5, 1
  %76 = add nsw i32 %14, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  store float %74, float addrspace(1)* %78, align 4, !tbaa !5
  %79 = fdiv contract float %63, %62
  %80 = mul nsw i32 %5, 3
  %81 = add nsw i32 %14, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %3, i64 %82
  store float %79, float addrspace(1)* %83, align 4, !tbaa !5
  %84 = fdiv contract float %61, %62
  %85 = shl nsw i32 %5, 2
  %86 = add nsw i32 %14, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %3, i64 %87
  store float %84, float addrspace(1)* %88, align 4, !tbaa !5
  ret void

89:                                               ; preds = %148, %21
  %90 = phi float [ 0.000000e+00, %21 ], [ %154, %148 ]
  %91 = phi i32 [ 0, %21 ], [ %155, %148 ]
  %92 = phi float [ 0.000000e+00, %21 ], [ %153, %148 ]
  %93 = phi float [ 0.000000e+00, %21 ], [ %152, %148 ]
  %94 = phi float [ 0.000000e+00, %21 ], [ %151, %148 ]
  %95 = phi float [ 0.000000e+00, %21 ], [ %150, %148 ]
  %96 = phi float [ 0.000000e+00, %21 ], [ %149, %148 ]
  %97 = phi i32 [ 0, %21 ], [ %156, %148 ]
  %98 = add i32 %18, %91
  %99 = mul i32 %98, %4
  %100 = add i32 %99, %17
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = fcmp contract ogt float %103, 5.000000e-01
  br i1 %104, label %105, label %119

105:                                              ; preds = %89
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5, !amdgpu.noclobber !9
  %108 = fadd contract float %90, %107
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = fadd contract float %92, %110
  %112 = fmul contract float %107, %107
  %113 = fadd contract float %93, %112
  %114 = fmul contract float %110, %110
  %115 = fadd contract float %94, %114
  %116 = fmul contract float %107, %110
  %117 = fadd contract float %96, %116
  %118 = fadd contract float %95, 1.000000e+00
  br label %119

119:                                              ; preds = %105, %89
  %120 = phi float [ %117, %105 ], [ %96, %89 ]
  %121 = phi float [ %118, %105 ], [ %95, %89 ]
  %122 = phi float [ %115, %105 ], [ %94, %89 ]
  %123 = phi float [ %113, %105 ], [ %93, %89 ]
  %124 = phi float [ %111, %105 ], [ %92, %89 ]
  %125 = phi float [ %108, %105 ], [ %90, %89 ]
  %126 = or i32 %91, 1
  %127 = add i32 %18, %126
  %128 = mul i32 %127, %4
  %129 = add i32 %128, %17
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5, !amdgpu.noclobber !9
  %133 = fcmp contract ogt float %132, 5.000000e-01
  br i1 %133, label %134, label %148

134:                                              ; preds = %119
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = fadd contract float %125, %136
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !5, !amdgpu.noclobber !9
  %140 = fadd contract float %124, %139
  %141 = fmul contract float %136, %136
  %142 = fadd contract float %123, %141
  %143 = fmul contract float %139, %139
  %144 = fadd contract float %122, %143
  %145 = fmul contract float %136, %139
  %146 = fadd contract float %120, %145
  %147 = fadd contract float %121, 1.000000e+00
  br label %148

148:                                              ; preds = %134, %119
  %149 = phi float [ %146, %134 ], [ %120, %119 ]
  %150 = phi float [ %147, %134 ], [ %121, %119 ]
  %151 = phi float [ %144, %134 ], [ %122, %119 ]
  %152 = phi float [ %142, %134 ], [ %123, %119 ]
  %153 = phi float [ %140, %134 ], [ %124, %119 ]
  %154 = phi float [ %137, %134 ], [ %125, %119 ]
  %155 = add nuw nsw i32 %91, 2
  %156 = add i32 %97, 2
  %157 = icmp eq i32 %156, %22
  br i1 %157, label %23, label %89, !llvm.loop !10
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
