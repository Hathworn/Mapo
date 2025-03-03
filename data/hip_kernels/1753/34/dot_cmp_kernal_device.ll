; ModuleID = '../data/hip_kernels/1753/34/main.cu'
source_filename = "../data/hip_kernels/1753/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14dot_cmp_kernalPKfS0_Pfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %4
  %10 = add i32 %9, %7
  %11 = add i32 %10, %5
  %12 = freeze i32 %11
  %13 = icmp sgt i32 %3, 0
  br i1 %13, label %14, label %43

14:                                               ; preds = %6
  %15 = srem i32 %12, %3
  %16 = sub nsw i32 %12, %15
  %17 = and i32 %3, 7
  %18 = icmp ult i32 %3, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %14
  %20 = and i32 %3, -8
  br label %49

21:                                               ; preds = %49, %14
  %22 = phi float [ undef, %14 ], [ %139, %49 ]
  %23 = phi float [ 0.000000e+00, %14 ], [ %139, %49 ]
  %24 = phi i32 [ 0, %14 ], [ %140, %49 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %43, label %26

26:                                               ; preds = %21, %26
  %27 = phi float [ %39, %26 ], [ %23, %21 ]
  %28 = phi i32 [ %40, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %41, %26 ], [ 0, %21 ]
  %30 = add i32 %16, %28
  %31 = mul i32 %30, %3
  %32 = add i32 %31, %15
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = fmul contract float %35, %37
  %39 = fadd contract float %27, %38
  %40 = add nuw nsw i32 %28, 1
  %41 = add i32 %29, 1
  %42 = icmp eq i32 %41, %17
  br i1 %42, label %43, label %26, !llvm.loop !10

43:                                               ; preds = %21, %26, %6
  %44 = phi float [ 0.000000e+00, %6 ], [ %22, %21 ], [ %39, %26 ]
  %45 = sitofp i32 %3 to float
  %46 = fdiv contract float %44, %45
  %47 = sext i32 %12 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  store float %46, float addrspace(1)* %48, align 4, !tbaa !5
  ret void

49:                                               ; preds = %49, %19
  %50 = phi float [ 0.000000e+00, %19 ], [ %139, %49 ]
  %51 = phi i32 [ 0, %19 ], [ %140, %49 ]
  %52 = phi i32 [ 0, %19 ], [ %141, %49 ]
  %53 = add i32 %16, %51
  %54 = mul i32 %53, %3
  %55 = add i32 %54, %15
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = fmul contract float %58, %60
  %62 = fadd contract float %50, %61
  %63 = or i32 %51, 1
  %64 = add i32 %16, %63
  %65 = mul i32 %64, %3
  %66 = add i32 %65, %15
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  %72 = fmul contract float %69, %71
  %73 = fadd contract float %62, %72
  %74 = or i32 %51, 2
  %75 = add i32 %16, %74
  %76 = mul i32 %75, %3
  %77 = add i32 %76, %15
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = fmul contract float %80, %82
  %84 = fadd contract float %73, %83
  %85 = or i32 %51, 3
  %86 = add i32 %16, %85
  %87 = mul i32 %86, %3
  %88 = add i32 %87, %15
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = fmul contract float %91, %93
  %95 = fadd contract float %84, %94
  %96 = or i32 %51, 4
  %97 = add i32 %16, %96
  %98 = mul i32 %97, %3
  %99 = add i32 %98, %15
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = fmul contract float %102, %104
  %106 = fadd contract float %95, %105
  %107 = or i32 %51, 5
  %108 = add i32 %16, %107
  %109 = mul i32 %108, %3
  %110 = add i32 %109, %15
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  %116 = fmul contract float %113, %115
  %117 = fadd contract float %106, %116
  %118 = or i32 %51, 6
  %119 = add i32 %16, %118
  %120 = mul i32 %119, %3
  %121 = add i32 %120, %15
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = fmul contract float %124, %126
  %128 = fadd contract float %117, %127
  %129 = or i32 %51, 7
  %130 = add i32 %16, %129
  %131 = mul i32 %130, %3
  %132 = add i32 %131, %15
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5, !amdgpu.noclobber !9
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5, !amdgpu.noclobber !9
  %138 = fmul contract float %135, %137
  %139 = fadd contract float %128, %138
  %140 = add nuw nsw i32 %51, 8
  %141 = add i32 %52, 8
  %142 = icmp eq i32 %141, %20
  br i1 %142, label %21, label %49, !llvm.loop !12
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
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
