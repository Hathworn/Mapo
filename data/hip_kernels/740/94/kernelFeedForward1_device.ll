; ModuleID = '../data/hip_kernels/740/94/main.cu'
source_filename = "../data/hip_kernels/740/94/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18kernelFeedForward1PfiS_iS_(float addrspace(1)* nocapture %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds float, float addrspace(1)* %0, i64 %7
  store float 0.000000e+00, float addrspace(1)* %8, align 4, !tbaa !5
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %10, label %123

10:                                               ; preds = %5
  %11 = mul i32 %6, %1
  %12 = add i32 %11, %3
  %13 = and i32 %1, 7
  %14 = icmp ult i32 %1, 8
  br i1 %14, label %103, label %15

15:                                               ; preds = %10
  %16 = and i32 %1, -8
  br label %17

17:                                               ; preds = %17, %15
  %18 = phi float [ 0.000000e+00, %15 ], [ %99, %17 ]
  %19 = phi i32 [ 0, %15 ], [ %100, %17 ]
  %20 = phi i32 [ 0, %15 ], [ %101, %17 ]
  %21 = add i32 %12, %19
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5
  %25 = zext i32 %19 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %4, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5
  %28 = fmul contract float %24, %27
  %29 = fadd contract float %18, %28
  store float %29, float addrspace(1)* %8, align 4, !tbaa !5
  %30 = or i32 %19, 1
  %31 = add i32 %12, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  %35 = zext i32 %30 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5
  %38 = fmul contract float %34, %37
  %39 = fadd contract float %29, %38
  store float %39, float addrspace(1)* %8, align 4, !tbaa !5
  %40 = or i32 %19, 2
  %41 = add i32 %12, %40
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5
  %45 = zext i32 %40 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5
  %48 = fmul contract float %44, %47
  %49 = fadd contract float %39, %48
  store float %49, float addrspace(1)* %8, align 4, !tbaa !5
  %50 = or i32 %19, 3
  %51 = add i32 %12, %50
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5
  %55 = zext i32 %50 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %4, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5
  %58 = fmul contract float %54, %57
  %59 = fadd contract float %49, %58
  store float %59, float addrspace(1)* %8, align 4, !tbaa !5
  %60 = or i32 %19, 4
  %61 = add i32 %12, %60
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5
  %65 = zext i32 %60 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %4, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5
  %68 = fmul contract float %64, %67
  %69 = fadd contract float %59, %68
  store float %69, float addrspace(1)* %8, align 4, !tbaa !5
  %70 = or i32 %19, 5
  %71 = add i32 %12, %70
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5
  %75 = zext i32 %70 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %4, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5
  %78 = fmul contract float %74, %77
  %79 = fadd contract float %69, %78
  store float %79, float addrspace(1)* %8, align 4, !tbaa !5
  %80 = or i32 %19, 6
  %81 = add i32 %12, %80
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5
  %85 = zext i32 %80 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = fmul contract float %84, %87
  %89 = fadd contract float %79, %88
  store float %89, float addrspace(1)* %8, align 4, !tbaa !5
  %90 = or i32 %19, 7
  %91 = add i32 %12, %90
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5
  %95 = zext i32 %90 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = fmul contract float %94, %97
  %99 = fadd contract float %89, %98
  store float %99, float addrspace(1)* %8, align 4, !tbaa !5
  %100 = add nuw nsw i32 %19, 8
  %101 = add i32 %20, 8
  %102 = icmp eq i32 %101, %16
  br i1 %102, label %103, label %17, !llvm.loop !9

103:                                              ; preds = %17, %10
  %104 = phi float [ 0.000000e+00, %10 ], [ %99, %17 ]
  %105 = phi i32 [ 0, %10 ], [ %100, %17 ]
  %106 = icmp eq i32 %13, 0
  br i1 %106, label %123, label %107

107:                                              ; preds = %103, %107
  %108 = phi float [ %119, %107 ], [ %104, %103 ]
  %109 = phi i32 [ %120, %107 ], [ %105, %103 ]
  %110 = phi i32 [ %121, %107 ], [ 0, %103 ]
  %111 = add i32 %12, %109
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5
  %115 = zext i32 %109 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %4, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5
  %118 = fmul contract float %114, %117
  %119 = fadd contract float %108, %118
  store float %119, float addrspace(1)* %8, align 4, !tbaa !5
  %120 = add nuw nsw i32 %109, 1
  %121 = add i32 %110, 1
  %122 = icmp eq i32 %121, %13
  br i1 %122, label %123, label %107, !llvm.loop !11

123:                                              ; preds = %103, %107, %5
  ret void
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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
