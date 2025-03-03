; ModuleID = '../data/hip_kernels/17269/1/main.cu'
source_filename = "../data/hip_kernels/17269/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8kernel_1iiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %7, label %30

7:                                                ; preds = %4
  %8 = and i32 %1, 7
  %9 = icmp ult i32 %1, 8
  br i1 %9, label %12, label %10

10:                                               ; preds = %7
  %11 = and i32 %1, -8
  br label %34

12:                                               ; preds = %34, %7
  %13 = phi float [ undef, %7 ], [ %92, %34 ]
  %14 = phi i32 [ 0, %7 ], [ %93, %34 ]
  %15 = phi float [ 0.000000e+00, %7 ], [ %92, %34 ]
  %16 = icmp eq i32 %8, 0
  br i1 %16, label %30, label %17

17:                                               ; preds = %12, %17
  %18 = phi i32 [ %27, %17 ], [ %14, %12 ]
  %19 = phi float [ %26, %17 ], [ %15, %12 ]
  %20 = phi i32 [ %28, %17 ], [ 0, %12 ]
  %21 = mul nsw i32 %18, %0
  %22 = add nsw i32 %21, %5
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  %26 = fadd contract float %19, %25
  %27 = add nuw nsw i32 %18, 1
  %28 = add i32 %20, 1
  %29 = icmp eq i32 %28, %8
  br i1 %29, label %30, label %17, !llvm.loop !10

30:                                               ; preds = %12, %17, %4
  %31 = phi float [ 0.000000e+00, %4 ], [ %13, %12 ], [ %26, %17 ]
  %32 = zext i32 %5 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  store float %31, float addrspace(1)* %33, align 4, !tbaa !5
  ret void

34:                                               ; preds = %34, %10
  %35 = phi i32 [ 0, %10 ], [ %93, %34 ]
  %36 = phi float [ 0.000000e+00, %10 ], [ %92, %34 ]
  %37 = phi i32 [ 0, %10 ], [ %94, %34 ]
  %38 = mul nsw i32 %35, %0
  %39 = add nsw i32 %38, %5
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = fadd contract float %36, %42
  %44 = or i32 %35, 1
  %45 = mul nsw i32 %44, %0
  %46 = add nsw i32 %45, %5
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = fadd contract float %43, %49
  %51 = or i32 %35, 2
  %52 = mul nsw i32 %51, %0
  %53 = add nsw i32 %52, %5
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = fadd contract float %50, %56
  %58 = or i32 %35, 3
  %59 = mul nsw i32 %58, %0
  %60 = add nsw i32 %59, %5
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fadd contract float %57, %63
  %65 = or i32 %35, 4
  %66 = mul nsw i32 %65, %0
  %67 = add nsw i32 %66, %5
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  %71 = fadd contract float %64, %70
  %72 = or i32 %35, 5
  %73 = mul nsw i32 %72, %0
  %74 = add nsw i32 %73, %5
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = fadd contract float %71, %77
  %79 = or i32 %35, 6
  %80 = mul nsw i32 %79, %0
  %81 = add nsw i32 %80, %5
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5, !amdgpu.noclobber !9
  %85 = fadd contract float %78, %84
  %86 = or i32 %35, 7
  %87 = mul nsw i32 %86, %0
  %88 = add nsw i32 %87, %5
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = fadd contract float %85, %91
  %93 = add nuw nsw i32 %35, 8
  %94 = add i32 %37, 8
  %95 = icmp eq i32 %94, %11
  br i1 %95, label %12, label %34, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
