; ModuleID = '../data/hip_kernels/5766/2/main.cu'
source_filename = "../data/hip_kernels/5766/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10MeanUpdatePfjjPi(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %6
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !5, !amdgpu.noclobber !9
  %9 = tail call i32 @llvm.smax.i32(i32 %8, i32 1)
  %10 = sitofp i32 %9 to float
  %11 = fdiv contract float 1.000000e+00, %10
  %12 = icmp eq i32 %2, 0
  br i1 %12, label %33, label %13

13:                                               ; preds = %4
  %14 = mul i32 %5, %2
  %15 = and i32 %2, 7
  %16 = icmp ult i32 %2, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %13
  %18 = and i32 %2, -8
  br label %34

19:                                               ; preds = %34, %13
  %20 = phi i32 [ 0, %13 ], [ %84, %34 ]
  %21 = icmp eq i32 %15, 0
  br i1 %21, label %33, label %22

22:                                               ; preds = %19, %22
  %23 = phi i32 [ %30, %22 ], [ %20, %19 ]
  %24 = phi i32 [ %31, %22 ], [ 0, %19 ]
  %25 = add i32 %23, %14
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !10
  %29 = fmul contract float %11, %28
  store float %29, float addrspace(1)* %27, align 4, !tbaa !10
  %30 = add nuw nsw i32 %23, 1
  %31 = add i32 %24, 1
  %32 = icmp eq i32 %31, %15
  br i1 %32, label %33, label %22, !llvm.loop !12

33:                                               ; preds = %19, %22, %4
  ret void

34:                                               ; preds = %34, %17
  %35 = phi i32 [ 0, %17 ], [ %84, %34 ]
  %36 = phi i32 [ 0, %17 ], [ %85, %34 ]
  %37 = add i32 %35, %14
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !10
  %41 = fmul contract float %11, %40
  store float %41, float addrspace(1)* %39, align 4, !tbaa !10
  %42 = or i32 %35, 1
  %43 = add i32 %42, %14
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !10
  %47 = fmul contract float %11, %46
  store float %47, float addrspace(1)* %45, align 4, !tbaa !10
  %48 = or i32 %35, 2
  %49 = add i32 %48, %14
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !10
  %53 = fmul contract float %11, %52
  store float %53, float addrspace(1)* %51, align 4, !tbaa !10
  %54 = or i32 %35, 3
  %55 = add i32 %54, %14
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !10
  %59 = fmul contract float %11, %58
  store float %59, float addrspace(1)* %57, align 4, !tbaa !10
  %60 = or i32 %35, 4
  %61 = add i32 %60, %14
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !10
  %65 = fmul contract float %11, %64
  store float %65, float addrspace(1)* %63, align 4, !tbaa !10
  %66 = or i32 %35, 5
  %67 = add i32 %66, %14
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !10
  %71 = fmul contract float %11, %70
  store float %71, float addrspace(1)* %69, align 4, !tbaa !10
  %72 = or i32 %35, 6
  %73 = add i32 %72, %14
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !10
  %77 = fmul contract float %11, %76
  store float %77, float addrspace(1)* %75, align 4, !tbaa !10
  %78 = or i32 %35, 7
  %79 = add i32 %78, %14
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !10
  %83 = fmul contract float %11, %82
  store float %83, float addrspace(1)* %81, align 4, !tbaa !10
  %84 = add nuw nsw i32 %35, 8
  %85 = add i32 %36, 8
  %86 = icmp eq i32 %85, %18
  br i1 %86, label %19, label %34, !llvm.loop !14
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
