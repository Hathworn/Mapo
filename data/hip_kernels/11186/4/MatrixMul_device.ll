; ModuleID = '../data/hip_kernels/11186/4/main.cu'
source_filename = "../data/hip_kernels/11186/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9MatrixMulPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 1
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = icmp sgt i32 %3, 0
  br i1 %9, label %10, label %46

10:                                               ; preds = %4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = shl i32 %11, 1
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = add i32 %12, %13
  %15 = mul i32 %14, %3
  %16 = add i32 %15, %8
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !5
  %20 = and i32 %3, 7
  %21 = icmp ult i32 %3, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %10
  %23 = and i32 %3, -8
  br label %47

24:                                               ; preds = %47, %10
  %25 = phi float [ %19, %10 ], [ %145, %47 ]
  %26 = phi i32 [ 0, %10 ], [ %146, %47 ]
  %27 = icmp eq i32 %20, 0
  br i1 %27, label %46, label %28

28:                                               ; preds = %24, %28
  %29 = phi float [ %42, %28 ], [ %25, %24 ]
  %30 = phi i32 [ %43, %28 ], [ %26, %24 ]
  %31 = phi i32 [ %44, %28 ], [ 0, %24 ]
  %32 = add i32 %30, %15
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5
  %36 = mul nsw i32 %30, %3
  %37 = add i32 %36, %8
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  %41 = fmul contract float %35, %40
  %42 = fadd contract float %29, %41
  store float %42, float addrspace(1)* %18, align 4, !tbaa !5
  %43 = add nuw nsw i32 %30, 1
  %44 = add i32 %31, 1
  %45 = icmp eq i32 %44, %20
  br i1 %45, label %46, label %28, !llvm.loop !9

46:                                               ; preds = %24, %28, %4
  ret void

47:                                               ; preds = %47, %22
  %48 = phi float [ %19, %22 ], [ %145, %47 ]
  %49 = phi i32 [ 0, %22 ], [ %146, %47 ]
  %50 = phi i32 [ 0, %22 ], [ %147, %47 ]
  %51 = add i32 %49, %15
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5
  %55 = mul nsw i32 %49, %3
  %56 = add i32 %55, %8
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5
  %60 = fmul contract float %54, %59
  %61 = fadd contract float %48, %60
  store float %61, float addrspace(1)* %18, align 4, !tbaa !5
  %62 = or i32 %49, 1
  %63 = add i32 %62, %15
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = mul nsw i32 %62, %3
  %68 = add i32 %67, %8
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5
  %72 = fmul contract float %66, %71
  %73 = fadd contract float %61, %72
  store float %73, float addrspace(1)* %18, align 4, !tbaa !5
  %74 = or i32 %49, 2
  %75 = add i32 %74, %15
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = mul nsw i32 %74, %3
  %80 = add i32 %79, %8
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5
  %84 = fmul contract float %78, %83
  %85 = fadd contract float %73, %84
  store float %85, float addrspace(1)* %18, align 4, !tbaa !5
  %86 = or i32 %49, 3
  %87 = add i32 %86, %15
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  %91 = mul nsw i32 %86, %3
  %92 = add i32 %91, %8
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5
  %96 = fmul contract float %90, %95
  %97 = fadd contract float %85, %96
  store float %97, float addrspace(1)* %18, align 4, !tbaa !5
  %98 = or i32 %49, 4
  %99 = add i32 %98, %15
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = mul nsw i32 %98, %3
  %104 = add i32 %103, %8
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5
  %108 = fmul contract float %102, %107
  %109 = fadd contract float %97, %108
  store float %109, float addrspace(1)* %18, align 4, !tbaa !5
  %110 = or i32 %49, 5
  %111 = add i32 %110, %15
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5
  %115 = mul nsw i32 %110, %3
  %116 = add i32 %115, %8
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5
  %120 = fmul contract float %114, %119
  %121 = fadd contract float %109, %120
  store float %121, float addrspace(1)* %18, align 4, !tbaa !5
  %122 = or i32 %49, 6
  %123 = add i32 %122, %15
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5
  %127 = mul nsw i32 %122, %3
  %128 = add i32 %127, %8
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5
  %132 = fmul contract float %126, %131
  %133 = fadd contract float %121, %132
  store float %133, float addrspace(1)* %18, align 4, !tbaa !5
  %134 = or i32 %49, 7
  %135 = add i32 %134, %15
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5
  %139 = mul nsw i32 %134, %3
  %140 = add i32 %139, %8
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5
  %144 = fmul contract float %138, %143
  %145 = fadd contract float %133, %144
  store float %145, float addrspace(1)* %18, align 4, !tbaa !5
  %146 = add nuw nsw i32 %49, 8
  %147 = add i32 %50, 8
  %148 = icmp eq i32 %147, %23
  br i1 %148, label %24, label %47, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
