; ModuleID = '../data/hip_kernels/1753/28/main.cu'
source_filename = "../data/hip_kernels/1753/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10column_sumPKfPfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %4
  %10 = add i32 %9, %7
  %11 = add i32 %10, %5
  %12 = icmp sgt i32 %3, 0
  br i1 %12, label %13, label %36

13:                                               ; preds = %6
  %14 = and i32 %3, 7
  %15 = icmp ult i32 %3, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %13
  %17 = and i32 %3, -8
  br label %40

18:                                               ; preds = %40, %13
  %19 = phi float [ undef, %13 ], [ %98, %40 ]
  %20 = phi i32 [ 0, %13 ], [ %99, %40 ]
  %21 = phi float [ 0.000000e+00, %13 ], [ %98, %40 ]
  %22 = icmp eq i32 %14, 0
  br i1 %22, label %36, label %23

23:                                               ; preds = %18, %23
  %24 = phi i32 [ %33, %23 ], [ %20, %18 ]
  %25 = phi float [ %32, %23 ], [ %21, %18 ]
  %26 = phi i32 [ %34, %23 ], [ 0, %18 ]
  %27 = mul nsw i32 %24, %2
  %28 = add i32 %27, %11
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = fadd contract float %25, %31
  %33 = add nuw nsw i32 %24, 1
  %34 = add i32 %26, 1
  %35 = icmp eq i32 %34, %14
  br i1 %35, label %36, label %23, !llvm.loop !10

36:                                               ; preds = %18, %23, %6
  %37 = phi float [ 0.000000e+00, %6 ], [ %19, %18 ], [ %32, %23 ]
  %38 = zext i32 %11 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  store float %37, float addrspace(1)* %39, align 4, !tbaa !5
  ret void

40:                                               ; preds = %40, %16
  %41 = phi i32 [ 0, %16 ], [ %99, %40 ]
  %42 = phi float [ 0.000000e+00, %16 ], [ %98, %40 ]
  %43 = phi i32 [ 0, %16 ], [ %100, %40 ]
  %44 = mul nsw i32 %41, %2
  %45 = add i32 %44, %11
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  %49 = fadd contract float %42, %48
  %50 = or i32 %41, 1
  %51 = mul nsw i32 %50, %2
  %52 = add i32 %51, %11
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = fadd contract float %49, %55
  %57 = or i32 %41, 2
  %58 = mul nsw i32 %57, %2
  %59 = add i32 %58, %11
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = fadd contract float %56, %62
  %64 = or i32 %41, 3
  %65 = mul nsw i32 %64, %2
  %66 = add i32 %65, %11
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = fadd contract float %63, %69
  %71 = or i32 %41, 4
  %72 = mul nsw i32 %71, %2
  %73 = add i32 %72, %11
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = fadd contract float %70, %76
  %78 = or i32 %41, 5
  %79 = mul nsw i32 %78, %2
  %80 = add i32 %79, %11
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = fadd contract float %77, %83
  %85 = or i32 %41, 6
  %86 = mul nsw i32 %85, %2
  %87 = add i32 %86, %11
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5, !amdgpu.noclobber !9
  %91 = fadd contract float %84, %90
  %92 = or i32 %41, 7
  %93 = mul nsw i32 %92, %2
  %94 = add i32 %93, %11
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5, !amdgpu.noclobber !9
  %98 = fadd contract float %91, %97
  %99 = add nuw nsw i32 %41, 8
  %100 = add i32 %43, 8
  %101 = icmp eq i32 %100, %17
  br i1 %101, label %18, label %40, !llvm.loop !12
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
