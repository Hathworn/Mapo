; ModuleID = '../data/hip_kernels/13989/0/main.cu'
source_filename = "../data/hip_kernels/13989/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8convolvePfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul nsw i32 %7, %4
  %9 = add nsw i32 %8, %6
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds float, float addrspace(1)* %1, i64 %10
  store float 0.000000e+00, float addrspace(1)* %11, align 4, !tbaa !5
  %12 = icmp sgt i32 %3, 0
  br i1 %12, label %13, label %42

13:                                               ; preds = %5
  %14 = and i32 %3, 3
  %15 = icmp ult i32 %3, 4
  br i1 %15, label %18, label %16

16:                                               ; preds = %13
  %17 = and i32 %3, -4
  br label %43

18:                                               ; preds = %100, %13
  %19 = phi float [ 0.000000e+00, %13 ], [ %101, %100 ]
  %20 = phi i32 [ 0, %13 ], [ %102, %100 ]
  %21 = icmp eq i32 %14, 0
  br i1 %21, label %42, label %22

22:                                               ; preds = %18, %37
  %23 = phi float [ %38, %37 ], [ %19, %18 ]
  %24 = phi i32 [ %39, %37 ], [ %20, %18 ]
  %25 = phi i32 [ %40, %37 ], [ 0, %18 ]
  %26 = sub nsw i32 %9, %24
  %27 = icmp sgt i32 %26, -1
  br i1 %27, label %28, label %37

28:                                               ; preds = %22
  %29 = zext i32 %24 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5
  %32 = zext i32 %26 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  %35 = fmul contract float %31, %34
  %36 = fadd contract float %23, %35
  store float %36, float addrspace(1)* %11, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %28, %22
  %38 = phi float [ %23, %22 ], [ %36, %28 ]
  %39 = add nuw nsw i32 %24, 1
  %40 = add i32 %25, 1
  %41 = icmp eq i32 %40, %14
  br i1 %41, label %42, label %22, !llvm.loop !9

42:                                               ; preds = %18, %37, %5
  ret void

43:                                               ; preds = %100, %16
  %44 = phi float [ 0.000000e+00, %16 ], [ %101, %100 ]
  %45 = phi i32 [ 0, %16 ], [ %102, %100 ]
  %46 = phi i32 [ 0, %16 ], [ %103, %100 ]
  %47 = sub nsw i32 %9, %45
  %48 = icmp sgt i32 %47, -1
  br i1 %48, label %49, label %58

49:                                               ; preds = %43
  %50 = zext i32 %45 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5
  %53 = zext i32 %47 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5
  %56 = fmul contract float %52, %55
  %57 = fadd contract float %44, %56
  store float %57, float addrspace(1)* %11, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %43, %49
  %59 = phi float [ %44, %43 ], [ %57, %49 ]
  %60 = or i32 %45, 1
  %61 = sub nsw i32 %9, %60
  %62 = icmp sgt i32 %61, -1
  br i1 %62, label %63, label %72

63:                                               ; preds = %58
  %64 = zext i32 %60 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = zext i32 %61 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5
  %70 = fmul contract float %66, %69
  %71 = fadd contract float %59, %70
  store float %71, float addrspace(1)* %11, align 4, !tbaa !5
  br label %72

72:                                               ; preds = %63, %58
  %73 = phi float [ %59, %58 ], [ %71, %63 ]
  %74 = or i32 %45, 2
  %75 = sub nsw i32 %9, %74
  %76 = icmp sgt i32 %75, -1
  br i1 %76, label %77, label %86

77:                                               ; preds = %72
  %78 = zext i32 %74 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5
  %81 = zext i32 %75 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5
  %84 = fmul contract float %80, %83
  %85 = fadd contract float %73, %84
  store float %85, float addrspace(1)* %11, align 4, !tbaa !5
  br label %86

86:                                               ; preds = %77, %72
  %87 = phi float [ %73, %72 ], [ %85, %77 ]
  %88 = or i32 %45, 3
  %89 = sub nsw i32 %9, %88
  %90 = icmp sgt i32 %89, -1
  br i1 %90, label %91, label %100

91:                                               ; preds = %86
  %92 = zext i32 %88 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5
  %95 = zext i32 %89 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = fmul contract float %94, %97
  %99 = fadd contract float %87, %98
  store float %99, float addrspace(1)* %11, align 4, !tbaa !5
  br label %100

100:                                              ; preds = %91, %86
  %101 = phi float [ %87, %86 ], [ %99, %91 ]
  %102 = add nuw nsw i32 %45, 4
  %103 = add i32 %46, 4
  %104 = icmp eq i32 %103, %17
  br i1 %104, label %18, label %43, !llvm.loop !11
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
