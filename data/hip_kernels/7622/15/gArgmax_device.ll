; ModuleID = '../data/hip_kernels/7622/15/main.cu'
source_filename = "../data/hip_kernels/7622/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7gArgmaxPfPKfmm(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = zext i32 %5 to i64
  %7 = mul i64 %6, %3
  %8 = icmp eq i64 %3, 0
  br i1 %8, label %36, label %9

9:                                                ; preds = %4
  %10 = and i64 %3, 7
  %11 = icmp ult i64 %3, 8
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = and i64 %3, -8
  br label %39

14:                                               ; preds = %39, %9
  %15 = phi float [ -9.999900e+04, %9 ], [ %98, %39 ]
  %16 = phi i64 [ undef, %9 ], [ %97, %39 ]
  %17 = phi i64 [ 0, %9 ], [ %99, %39 ]
  %18 = icmp eq i64 %10, 0
  br i1 %18, label %33, label %19

19:                                               ; preds = %14, %19
  %20 = phi float [ %29, %19 ], [ %15, %14 ]
  %21 = phi i64 [ %28, %19 ], [ %16, %14 ]
  %22 = phi i64 [ %30, %19 ], [ %17, %14 ]
  %23 = phi i64 [ %31, %19 ], [ 0, %14 ]
  %24 = add i64 %22, %7
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !4, !amdgpu.noclobber !8
  %27 = fcmp contract ogt float %26, %20
  %28 = select i1 %27, i64 %22, i64 %21
  %29 = select i1 %27, float %26, float %20
  %30 = add nuw i64 %22, 1
  %31 = add i64 %23, 1
  %32 = icmp eq i64 %31, %10
  br i1 %32, label %33, label %19, !llvm.loop !9

33:                                               ; preds = %19, %14
  %34 = phi i64 [ %16, %14 ], [ %28, %19 ]
  %35 = uitofp i64 %34 to float
  br label %36

36:                                               ; preds = %33, %4
  %37 = phi float [ 0.000000e+00, %4 ], [ %35, %33 ]
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %6
  store float %37, float addrspace(1)* %38, align 4, !tbaa !4
  ret void

39:                                               ; preds = %39, %12
  %40 = phi float [ -9.999900e+04, %12 ], [ %98, %39 ]
  %41 = phi i64 [ undef, %12 ], [ %97, %39 ]
  %42 = phi i64 [ 0, %12 ], [ %99, %39 ]
  %43 = phi i64 [ 0, %12 ], [ %100, %39 ]
  %44 = add i64 %42, %7
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !4, !amdgpu.noclobber !8
  %47 = fcmp contract ogt float %46, %40
  %48 = select i1 %47, i64 %42, i64 %41
  %49 = select i1 %47, float %46, float %40
  %50 = or i64 %42, 1
  %51 = add i64 %50, %7
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !4, !amdgpu.noclobber !8
  %54 = fcmp contract ogt float %53, %49
  %55 = select i1 %54, i64 %50, i64 %48
  %56 = select i1 %54, float %53, float %49
  %57 = or i64 %42, 2
  %58 = add i64 %57, %7
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !4, !amdgpu.noclobber !8
  %61 = fcmp contract ogt float %60, %56
  %62 = select i1 %61, i64 %57, i64 %55
  %63 = select i1 %61, float %60, float %56
  %64 = or i64 %42, 3
  %65 = add i64 %64, %7
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !4, !amdgpu.noclobber !8
  %68 = fcmp contract ogt float %67, %63
  %69 = select i1 %68, i64 %64, i64 %62
  %70 = select i1 %68, float %67, float %63
  %71 = or i64 %42, 4
  %72 = add i64 %71, %7
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !4, !amdgpu.noclobber !8
  %75 = fcmp contract ogt float %74, %70
  %76 = select i1 %75, i64 %71, i64 %69
  %77 = select i1 %75, float %74, float %70
  %78 = or i64 %42, 5
  %79 = add i64 %78, %7
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !4, !amdgpu.noclobber !8
  %82 = fcmp contract ogt float %81, %77
  %83 = select i1 %82, i64 %78, i64 %76
  %84 = select i1 %82, float %81, float %77
  %85 = or i64 %42, 6
  %86 = add i64 %85, %7
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !4, !amdgpu.noclobber !8
  %89 = fcmp contract ogt float %88, %84
  %90 = select i1 %89, i64 %85, i64 %83
  %91 = select i1 %89, float %88, float %84
  %92 = or i64 %42, 7
  %93 = add i64 %92, %7
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !4, !amdgpu.noclobber !8
  %96 = fcmp contract ogt float %95, %91
  %97 = select i1 %96, i64 %92, i64 %90
  %98 = select i1 %96, float %95, float %91
  %99 = add nuw i64 %42, 8
  %100 = add i64 %43, 8
  %101 = icmp eq i64 %100, %13
  br i1 %101, label %14, label %39, !llvm.loop !11
}

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
