; ModuleID = '../data/hip_kernels/1753/38/main.cu'
source_filename = "../data/hip_kernels/1753/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12stats_kernalPKfPfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %4
  %10 = add i32 %9, %7
  %11 = add i32 %10, %5
  %12 = freeze i32 %11
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %14, label %45

14:                                               ; preds = %6
  %15 = srem i32 %12, %2
  %16 = sub nsw i32 %12, %15
  %17 = and i32 %2, 7
  %18 = icmp ult i32 %2, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %14
  %20 = and i32 %2, -8
  br label %53

21:                                               ; preds = %53, %14
  %22 = phi float [ undef, %14 ], [ %134, %53 ]
  %23 = phi float [ undef, %14 ], [ %136, %53 ]
  %24 = phi float [ 0.000000e+00, %14 ], [ %134, %53 ]
  %25 = phi float [ 0.000000e+00, %14 ], [ %136, %53 ]
  %26 = phi i32 [ 0, %14 ], [ %137, %53 ]
  %27 = icmp eq i32 %17, 0
  br i1 %27, label %45, label %28

28:                                               ; preds = %21, %28
  %29 = phi float [ %39, %28 ], [ %24, %21 ]
  %30 = phi float [ %41, %28 ], [ %25, %21 ]
  %31 = phi i32 [ %42, %28 ], [ %26, %21 ]
  %32 = phi i32 [ %43, %28 ], [ 0, %21 ]
  %33 = add i32 %16, %31
  %34 = mul i32 %33, %2
  %35 = add i32 %34, %15
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = fadd contract float %29, %38
  %40 = fmul contract float %38, %38
  %41 = fadd contract float %30, %40
  %42 = add nuw nsw i32 %31, 1
  %43 = add i32 %32, 1
  %44 = icmp eq i32 %43, %17
  br i1 %44, label %45, label %28, !llvm.loop !10

45:                                               ; preds = %21, %28, %6
  %46 = phi float [ 0.000000e+00, %6 ], [ %23, %21 ], [ %41, %28 ]
  %47 = phi float [ 0.000000e+00, %6 ], [ %22, %21 ], [ %39, %28 ]
  %48 = sext i32 %12 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  store float %47, float addrspace(1)* %49, align 4, !tbaa !5
  %50 = add nsw i32 %12, %3
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %46, float addrspace(1)* %52, align 4, !tbaa !5
  ret void

53:                                               ; preds = %53, %19
  %54 = phi float [ 0.000000e+00, %19 ], [ %134, %53 ]
  %55 = phi float [ 0.000000e+00, %19 ], [ %136, %53 ]
  %56 = phi i32 [ 0, %19 ], [ %137, %53 ]
  %57 = phi i32 [ 0, %19 ], [ %138, %53 ]
  %58 = add i32 %16, %56
  %59 = mul i32 %58, %2
  %60 = add i32 %59, %15
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fadd contract float %54, %63
  %65 = fmul contract float %63, %63
  %66 = fadd contract float %55, %65
  %67 = or i32 %56, 1
  %68 = add i32 %16, %67
  %69 = mul i32 %68, %2
  %70 = add i32 %69, %15
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = fadd contract float %64, %73
  %75 = fmul contract float %73, %73
  %76 = fadd contract float %66, %75
  %77 = or i32 %56, 2
  %78 = add i32 %16, %77
  %79 = mul i32 %78, %2
  %80 = add i32 %79, %15
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = fadd contract float %74, %83
  %85 = fmul contract float %83, %83
  %86 = fadd contract float %76, %85
  %87 = or i32 %56, 3
  %88 = add i32 %16, %87
  %89 = mul i32 %88, %2
  %90 = add i32 %89, %15
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = fadd contract float %84, %93
  %95 = fmul contract float %93, %93
  %96 = fadd contract float %86, %95
  %97 = or i32 %56, 4
  %98 = add i32 %16, %97
  %99 = mul i32 %98, %2
  %100 = add i32 %99, %15
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = fadd contract float %94, %103
  %105 = fmul contract float %103, %103
  %106 = fadd contract float %96, %105
  %107 = or i32 %56, 5
  %108 = add i32 %16, %107
  %109 = mul i32 %108, %2
  %110 = add i32 %109, %15
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5, !amdgpu.noclobber !9
  %114 = fadd contract float %104, %113
  %115 = fmul contract float %113, %113
  %116 = fadd contract float %106, %115
  %117 = or i32 %56, 6
  %118 = add i32 %16, %117
  %119 = mul i32 %118, %2
  %120 = add i32 %119, %15
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  %124 = fadd contract float %114, %123
  %125 = fmul contract float %123, %123
  %126 = fadd contract float %116, %125
  %127 = or i32 %56, 7
  %128 = add i32 %16, %127
  %129 = mul i32 %128, %2
  %130 = add i32 %129, %15
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5, !amdgpu.noclobber !9
  %134 = fadd contract float %124, %133
  %135 = fmul contract float %133, %133
  %136 = fadd contract float %126, %135
  %137 = add nuw nsw i32 %56, 8
  %138 = add i32 %57, 8
  %139 = icmp eq i32 %138, %20
  br i1 %139, label %21, label %53, !llvm.loop !12
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
