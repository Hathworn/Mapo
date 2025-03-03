; ModuleID = '../data/hip_kernels/10483/11/main.cu'
source_filename = "../data/hip_kernels/10483/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8mmKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp slt i32 %5, %3
  br i1 %6, label %7, label %102

7:                                                ; preds = %4
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %5
  store float 0.000000e+00, float addrspace(3)* %9, align 4, !tbaa !5
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %8
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = mul nsw i32 %5, %3
  %13 = add i32 %3, -1
  %14 = and i32 %3, 7
  %15 = icmp ult i32 %13, 7
  br i1 %15, label %18, label %16

16:                                               ; preds = %7
  %17 = and i32 %3, -8
  br label %40

18:                                               ; preds = %40, %7
  %19 = phi float [ undef, %7 ], [ %98, %40 ]
  %20 = phi float [ 0.000000e+00, %7 ], [ %98, %40 ]
  %21 = phi i32 [ 0, %7 ], [ %99, %40 ]
  %22 = icmp eq i32 %14, 0
  br i1 %22, label %36, label %23

23:                                               ; preds = %18, %23
  %24 = phi float [ %32, %23 ], [ %20, %18 ]
  %25 = phi i32 [ %33, %23 ], [ %21, %18 ]
  %26 = phi i32 [ %34, %23 ], [ 0, %18 ]
  %27 = add nsw i32 %25, %12
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = fmul contract float %11, %30
  %32 = fadd contract float %24, %31
  %33 = add nuw nsw i32 %25, 1
  %34 = add i32 %26, 1
  %35 = icmp eq i32 %34, %14
  br i1 %35, label %36, label %23, !llvm.loop !10

36:                                               ; preds = %23, %18
  %37 = phi float [ %19, %18 ], [ %32, %23 ]
  store float %37, float addrspace(3)* %9, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %8
  store float %38, float addrspace(1)* %39, align 4, !tbaa !5
  br label %102

40:                                               ; preds = %40, %16
  %41 = phi float [ 0.000000e+00, %16 ], [ %98, %40 ]
  %42 = phi i32 [ 0, %16 ], [ %99, %40 ]
  %43 = phi i32 [ 0, %16 ], [ %100, %40 ]
  %44 = add nsw i32 %42, %12
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = fmul contract float %11, %47
  %49 = fadd contract float %41, %48
  %50 = or i32 %42, 1
  %51 = add nsw i32 %50, %12
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = fmul contract float %11, %54
  %56 = fadd contract float %49, %55
  %57 = or i32 %42, 2
  %58 = add nsw i32 %57, %12
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = fmul contract float %11, %61
  %63 = fadd contract float %56, %62
  %64 = or i32 %42, 3
  %65 = add nsw i32 %64, %12
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  %69 = fmul contract float %11, %68
  %70 = fadd contract float %63, %69
  %71 = or i32 %42, 4
  %72 = add nsw i32 %71, %12
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = fmul contract float %11, %75
  %77 = fadd contract float %70, %76
  %78 = or i32 %42, 5
  %79 = add nsw i32 %78, %12
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = fmul contract float %11, %82
  %84 = fadd contract float %77, %83
  %85 = or i32 %42, 6
  %86 = add nsw i32 %85, %12
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  %90 = fmul contract float %11, %89
  %91 = fadd contract float %84, %90
  %92 = or i32 %42, 7
  %93 = add nsw i32 %92, %12
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = fmul contract float %11, %96
  %98 = fadd contract float %91, %97
  %99 = add nuw nsw i32 %42, 8
  %100 = add i32 %43, 8
  %101 = icmp eq i32 %100, %17
  br i1 %101, label %18, label %40, !llvm.loop !12

102:                                              ; preds = %36, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
