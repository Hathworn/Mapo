; ModuleID = '../data/hip_kernels/17853/75/main.cu'
source_filename = "../data/hip_kernels/17853/75/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16fm_order2_kernelPKfPfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = icmp slt i32 %6, %4
  %9 = icmp slt i32 %7, %2
  %10 = select i1 %8, i1 %9, i1 false
  br i1 %10, label %11, label %140

11:                                               ; preds = %5
  %12 = mul i32 %7, %3
  %13 = icmp sgt i32 %3, 0
  br i1 %13, label %14, label %43

14:                                               ; preds = %11
  %15 = and i32 %3, 7
  %16 = icmp ult i32 %3, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = and i32 %3, -8
  br label %53

19:                                               ; preds = %53, %14
  %20 = phi float [ undef, %14 ], [ %134, %53 ]
  %21 = phi float [ undef, %14 ], [ %136, %53 ]
  %22 = phi float [ 0.000000e+00, %14 ], [ %134, %53 ]
  %23 = phi i32 [ 0, %14 ], [ %137, %53 ]
  %24 = phi float [ 0.000000e+00, %14 ], [ %136, %53 ]
  %25 = icmp eq i32 %15, 0
  br i1 %25, label %43, label %26

26:                                               ; preds = %19, %26
  %27 = phi float [ %37, %26 ], [ %22, %19 ]
  %28 = phi i32 [ %40, %26 ], [ %23, %19 ]
  %29 = phi float [ %39, %26 ], [ %24, %19 ]
  %30 = phi i32 [ %41, %26 ], [ 0, %19 ]
  %31 = add i32 %28, %12
  %32 = mul i32 %31, %4
  %33 = add i32 %32, %6
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = fadd contract float %27, %36
  %38 = fmul contract float %36, %36
  %39 = fadd contract float %29, %38
  %40 = add nuw nsw i32 %28, 1
  %41 = add i32 %30, 1
  %42 = icmp eq i32 %41, %15
  br i1 %42, label %43, label %26, !llvm.loop !10

43:                                               ; preds = %19, %26, %11
  %44 = phi float [ 0.000000e+00, %11 ], [ %21, %19 ], [ %39, %26 ]
  %45 = phi float [ 0.000000e+00, %11 ], [ %20, %19 ], [ %37, %26 ]
  %46 = fmul contract float %45, %45
  %47 = fsub contract float %46, %44
  %48 = fmul contract float %47, 5.000000e-01
  %49 = mul nsw i32 %7, %4
  %50 = add nsw i32 %49, %6
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %48, float addrspace(1)* %52, align 4, !tbaa !5
  br label %140

53:                                               ; preds = %53, %17
  %54 = phi float [ 0.000000e+00, %17 ], [ %134, %53 ]
  %55 = phi i32 [ 0, %17 ], [ %137, %53 ]
  %56 = phi float [ 0.000000e+00, %17 ], [ %136, %53 ]
  %57 = phi i32 [ 0, %17 ], [ %138, %53 ]
  %58 = add i32 %55, %12
  %59 = mul i32 %58, %4
  %60 = add i32 %59, %6
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fadd contract float %54, %63
  %65 = fmul contract float %63, %63
  %66 = fadd contract float %56, %65
  %67 = or i32 %55, 1
  %68 = add i32 %67, %12
  %69 = mul i32 %68, %4
  %70 = add i32 %69, %6
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = fadd contract float %64, %73
  %75 = fmul contract float %73, %73
  %76 = fadd contract float %66, %75
  %77 = or i32 %55, 2
  %78 = add i32 %77, %12
  %79 = mul i32 %78, %4
  %80 = add i32 %79, %6
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = fadd contract float %74, %83
  %85 = fmul contract float %83, %83
  %86 = fadd contract float %76, %85
  %87 = or i32 %55, 3
  %88 = add i32 %87, %12
  %89 = mul i32 %88, %4
  %90 = add i32 %89, %6
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = fadd contract float %84, %93
  %95 = fmul contract float %93, %93
  %96 = fadd contract float %86, %95
  %97 = or i32 %55, 4
  %98 = add i32 %97, %12
  %99 = mul i32 %98, %4
  %100 = add i32 %99, %6
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = fadd contract float %94, %103
  %105 = fmul contract float %103, %103
  %106 = fadd contract float %96, %105
  %107 = or i32 %55, 5
  %108 = add i32 %107, %12
  %109 = mul i32 %108, %4
  %110 = add i32 %109, %6
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  %114 = fadd contract float %104, %113
  %115 = fmul contract float %113, %113
  %116 = fadd contract float %106, %115
  %117 = or i32 %55, 6
  %118 = add i32 %117, %12
  %119 = mul i32 %118, %4
  %120 = add i32 %119, %6
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  %124 = fadd contract float %114, %123
  %125 = fmul contract float %123, %123
  %126 = fadd contract float %116, %125
  %127 = or i32 %55, 7
  %128 = add i32 %127, %12
  %129 = mul i32 %128, %4
  %130 = add i32 %129, %6
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5, !amdgpu.noclobber !9
  %134 = fadd contract float %124, %133
  %135 = fmul contract float %133, %133
  %136 = fadd contract float %126, %135
  %137 = add nuw nsw i32 %55, 8
  %138 = add i32 %57, 8
  %139 = icmp eq i32 %138, %18
  br i1 %139, label %19, label %53, !llvm.loop !12

140:                                              ; preds = %43, %5
  ret void
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
