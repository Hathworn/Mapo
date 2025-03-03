; ModuleID = '../data/hip_kernels/2764/0/main.cu'
source_filename = "../data/hip_kernels/2764/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7matMultPfS_iS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nsw i32 %2, 5
  %10 = mul nsw i32 %9, %6
  %11 = mul nsw i32 %8, %2
  %12 = add nsw i32 %10, %11
  %13 = shl nsw i32 %5, 5
  %14 = add i32 %13, %7
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %44

16:                                               ; preds = %4
  %17 = and i32 %2, 7
  %18 = icmp ult i32 %2, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %16
  %20 = and i32 %2, -8
  br label %50

21:                                               ; preds = %50, %16
  %22 = phi float [ undef, %16 ], [ %148, %50 ]
  %23 = phi float [ 0.000000e+00, %16 ], [ %148, %50 ]
  %24 = phi i32 [ 0, %16 ], [ %149, %50 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %44, label %26

26:                                               ; preds = %21, %26
  %27 = phi float [ %40, %26 ], [ %23, %21 ]
  %28 = phi i32 [ %41, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %42, %26 ], [ 0, %21 ]
  %30 = add nsw i32 %12, %28
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = mul nsw i32 %28, %2
  %35 = add nsw i32 %14, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = fmul contract float %33, %38
  %40 = fadd contract float %27, %39
  %41 = add nuw nsw i32 %28, 1
  %42 = add i32 %29, 1
  %43 = icmp eq i32 %42, %17
  br i1 %43, label %44, label %26, !llvm.loop !10

44:                                               ; preds = %21, %26, %4
  %45 = phi float [ 0.000000e+00, %4 ], [ %22, %21 ], [ %40, %26 ]
  %46 = add i32 %14, %11
  %47 = add i32 %46, %10
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  store float %45, float addrspace(1)* %49, align 4, !tbaa !5
  ret void

50:                                               ; preds = %50, %19
  %51 = phi float [ 0.000000e+00, %19 ], [ %148, %50 ]
  %52 = phi i32 [ 0, %19 ], [ %149, %50 ]
  %53 = phi i32 [ 0, %19 ], [ %150, %50 ]
  %54 = add nsw i32 %12, %52
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = mul nsw i32 %52, %2
  %59 = add nsw i32 %14, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  %63 = fmul contract float %57, %62
  %64 = fadd contract float %51, %63
  %65 = or i32 %52, 1
  %66 = add nsw i32 %12, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = mul nsw i32 %65, %2
  %71 = add nsw i32 %14, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = fmul contract float %69, %74
  %76 = fadd contract float %64, %75
  %77 = or i32 %52, 2
  %78 = add nsw i32 %12, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = mul nsw i32 %77, %2
  %83 = add nsw i32 %14, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  %87 = fmul contract float %81, %86
  %88 = fadd contract float %76, %87
  %89 = or i32 %52, 3
  %90 = add nsw i32 %12, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = mul nsw i32 %89, %2
  %95 = add nsw i32 %14, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !5, !amdgpu.noclobber !9
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %88, %99
  %101 = or i32 %52, 4
  %102 = add nsw i32 %12, %101
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = mul nsw i32 %101, %2
  %107 = add nsw i32 %14, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = fmul contract float %105, %110
  %112 = fadd contract float %100, %111
  %113 = or i32 %52, 5
  %114 = add nsw i32 %12, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = mul nsw i32 %113, %2
  %119 = add nsw i32 %14, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !5, !amdgpu.noclobber !9
  %123 = fmul contract float %117, %122
  %124 = fadd contract float %112, %123
  %125 = or i32 %52, 6
  %126 = add nsw i32 %12, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !5, !amdgpu.noclobber !9
  %130 = mul nsw i32 %125, %2
  %131 = add nsw i32 %14, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  %135 = fmul contract float %129, %134
  %136 = fadd contract float %124, %135
  %137 = or i32 %52, 7
  %138 = add nsw i32 %12, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !5, !amdgpu.noclobber !9
  %142 = mul nsw i32 %137, %2
  %143 = add nsw i32 %14, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5, !amdgpu.noclobber !9
  %147 = fmul contract float %141, %146
  %148 = fadd contract float %136, %147
  %149 = add nuw nsw i32 %52, 8
  %150 = add i32 %53, 8
  %151 = icmp eq i32 %150, %20
  br i1 %151, label %21, label %50, !llvm.loop !12
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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
