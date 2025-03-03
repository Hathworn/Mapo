; ModuleID = '../data/hip_kernels/1753/32/main.cu'
source_filename = "../data/hip_kernels/1753/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12sumup_kernalPKfPfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %4
  %10 = add i32 %9, %7
  %11 = add i32 %10, %5
  %12 = icmp sgt i32 %2, 0
  br i1 %12, label %13, label %37

13:                                               ; preds = %6
  %14 = srem i32 %11, %3
  %15 = and i32 %2, 7
  %16 = icmp ult i32 %2, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %13
  %18 = and i32 %2, -8
  br label %43

19:                                               ; preds = %43, %13
  %20 = phi float [ undef, %13 ], [ %101, %43 ]
  %21 = phi float [ 0.000000e+00, %13 ], [ %101, %43 ]
  %22 = phi i32 [ 0, %13 ], [ %102, %43 ]
  %23 = icmp eq i32 %15, 0
  br i1 %23, label %37, label %24

24:                                               ; preds = %19, %24
  %25 = phi float [ %33, %24 ], [ %21, %19 ]
  %26 = phi i32 [ %34, %24 ], [ %22, %19 ]
  %27 = phi i32 [ %35, %24 ], [ 0, %19 ]
  %28 = mul nsw i32 %26, %3
  %29 = add nsw i32 %14, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fadd contract float %25, %32
  %34 = add nuw nsw i32 %26, 1
  %35 = add i32 %27, 1
  %36 = icmp eq i32 %35, %15
  br i1 %36, label %37, label %24, !llvm.loop !10

37:                                               ; preds = %19, %24, %6
  %38 = phi float [ 0.000000e+00, %6 ], [ %20, %19 ], [ %33, %24 ]
  %39 = sitofp i32 %2 to float
  %40 = fdiv contract float %38, %39
  %41 = sext i32 %11 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  store float %40, float addrspace(1)* %42, align 4, !tbaa !5
  ret void

43:                                               ; preds = %43, %17
  %44 = phi float [ 0.000000e+00, %17 ], [ %101, %43 ]
  %45 = phi i32 [ 0, %17 ], [ %102, %43 ]
  %46 = phi i32 [ 0, %17 ], [ %103, %43 ]
  %47 = mul nsw i32 %45, %3
  %48 = add nsw i32 %14, %47
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = fadd contract float %44, %51
  %53 = or i32 %45, 1
  %54 = mul nsw i32 %53, %3
  %55 = add nsw i32 %14, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = fadd contract float %52, %58
  %60 = or i32 %45, 2
  %61 = mul nsw i32 %60, %3
  %62 = add nsw i32 %14, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = fadd contract float %59, %65
  %67 = or i32 %45, 3
  %68 = mul nsw i32 %67, %3
  %69 = add nsw i32 %14, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = fadd contract float %66, %72
  %74 = or i32 %45, 4
  %75 = mul nsw i32 %74, %3
  %76 = add nsw i32 %14, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = fadd contract float %73, %79
  %81 = or i32 %45, 5
  %82 = mul nsw i32 %81, %3
  %83 = add nsw i32 %14, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  %87 = fadd contract float %80, %86
  %88 = or i32 %45, 6
  %89 = mul nsw i32 %88, %3
  %90 = add nsw i32 %14, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = fadd contract float %87, %93
  %95 = or i32 %45, 7
  %96 = mul nsw i32 %95, %3
  %97 = add nsw i32 %14, %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  %101 = fadd contract float %94, %100
  %102 = add nuw nsw i32 %45, 8
  %103 = add i32 %46, 8
  %104 = icmp eq i32 %103, %18
  br i1 %104, label %19, label %43, !llvm.loop !12
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
