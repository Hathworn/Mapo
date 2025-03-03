; ModuleID = '../data/hip_kernels/1753/31/main.cu'
source_filename = "../data/hip_kernels/1753/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17meansquare_kernalPKfPfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %4
  %10 = add i32 %9, %7
  %11 = add i32 %10, %5
  %12 = freeze i32 %11
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %14, label %41

14:                                               ; preds = %6
  %15 = srem i32 %12, %2
  %16 = sub nsw i32 %12, %15
  %17 = and i32 %2, 7
  %18 = icmp ult i32 %2, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %14
  %20 = and i32 %2, -8
  br label %47

21:                                               ; preds = %47, %14
  %22 = phi float [ undef, %14 ], [ %121, %47 ]
  %23 = phi float [ 0.000000e+00, %14 ], [ %121, %47 ]
  %24 = phi i32 [ 0, %14 ], [ %122, %47 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %41, label %26

26:                                               ; preds = %21, %26
  %27 = phi float [ %37, %26 ], [ %23, %21 ]
  %28 = phi i32 [ %38, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %39, %26 ], [ 0, %21 ]
  %30 = add i32 %16, %28
  %31 = mul i32 %30, %2
  %32 = add i32 %31, %15
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fmul contract float %35, %35
  %37 = fadd contract float %27, %36
  %38 = add nuw nsw i32 %28, 1
  %39 = add i32 %29, 1
  %40 = icmp eq i32 %39, %17
  br i1 %40, label %41, label %26, !llvm.loop !10

41:                                               ; preds = %21, %26, %6
  %42 = phi float [ 0.000000e+00, %6 ], [ %22, %21 ], [ %37, %26 ]
  %43 = sitofp i32 %2 to float
  %44 = fdiv contract float %42, %43
  %45 = sext i32 %12 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  store float %44, float addrspace(1)* %46, align 4, !tbaa !5
  ret void

47:                                               ; preds = %47, %19
  %48 = phi float [ 0.000000e+00, %19 ], [ %121, %47 ]
  %49 = phi i32 [ 0, %19 ], [ %122, %47 ]
  %50 = phi i32 [ 0, %19 ], [ %123, %47 ]
  %51 = add i32 %16, %49
  %52 = mul i32 %51, %2
  %53 = add i32 %52, %15
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = fmul contract float %56, %56
  %58 = fadd contract float %48, %57
  %59 = or i32 %49, 1
  %60 = add i32 %16, %59
  %61 = mul i32 %60, %2
  %62 = add i32 %61, %15
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = fmul contract float %65, %65
  %67 = fadd contract float %58, %66
  %68 = or i32 %49, 2
  %69 = add i32 %16, %68
  %70 = mul i32 %69, %2
  %71 = add i32 %70, %15
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = fmul contract float %74, %74
  %76 = fadd contract float %67, %75
  %77 = or i32 %49, 3
  %78 = add i32 %16, %77
  %79 = mul i32 %78, %2
  %80 = add i32 %79, %15
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = fmul contract float %83, %83
  %85 = fadd contract float %76, %84
  %86 = or i32 %49, 4
  %87 = add i32 %16, %86
  %88 = mul i32 %87, %2
  %89 = add i32 %88, %15
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = fmul contract float %92, %92
  %94 = fadd contract float %85, %93
  %95 = or i32 %49, 5
  %96 = add i32 %16, %95
  %97 = mul i32 %96, %2
  %98 = add i32 %97, %15
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  %102 = fmul contract float %101, %101
  %103 = fadd contract float %94, %102
  %104 = or i32 %49, 6
  %105 = add i32 %16, %104
  %106 = mul i32 %105, %2
  %107 = add i32 %106, %15
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = fmul contract float %110, %110
  %112 = fadd contract float %103, %111
  %113 = or i32 %49, 7
  %114 = add i32 %16, %113
  %115 = mul i32 %114, %2
  %116 = add i32 %115, %15
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5, !amdgpu.noclobber !9
  %120 = fmul contract float %119, %119
  %121 = fadd contract float %112, %120
  %122 = add nuw nsw i32 %49, 8
  %123 = add i32 %50, 8
  %124 = icmp eq i32 %123, %20
  br i1 %124, label %21, label %47, !llvm.loop !12
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
