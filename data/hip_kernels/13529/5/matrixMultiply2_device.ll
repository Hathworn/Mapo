; ModuleID = '../data/hip_kernels/13529/5/main.cu'
source_filename = "../data/hip_kernels/13529/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15matrixMultiply2PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 5
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %5, %6
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = shl i32 %8, 5
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = add i32 %9, %10
  %12 = icmp slt i32 %7, %2
  %13 = icmp slt i32 %11, %2
  %14 = select i1 %12, i1 %13, i1 false
  br i1 %14, label %15, label %153

15:                                               ; preds = %3
  %16 = icmp sgt i32 %2, 0
  br i1 %16, label %17, label %45

17:                                               ; preds = %15
  %18 = and i32 %2, 7
  %19 = icmp ult i32 %2, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i32 %2, -8
  br label %51

22:                                               ; preds = %51, %17
  %23 = phi float [ undef, %17 ], [ %149, %51 ]
  %24 = phi i32 [ 0, %17 ], [ %150, %51 ]
  %25 = phi float [ 0.000000e+00, %17 ], [ %149, %51 ]
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %45, label %27

27:                                               ; preds = %22, %27
  %28 = phi i32 [ %42, %27 ], [ %24, %22 ]
  %29 = phi float [ %41, %27 ], [ %25, %22 ]
  %30 = phi i32 [ %43, %27 ], [ 0, %22 ]
  %31 = mul nsw i32 %28, %2
  %32 = add nsw i32 %31, %11
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = add nsw i32 %31, %7
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = fmul contract float %35, %39
  %41 = fadd contract float %29, %40
  %42 = add nuw nsw i32 %28, 1
  %43 = add i32 %30, 1
  %44 = icmp eq i32 %43, %18
  br i1 %44, label %45, label %27, !llvm.loop !10

45:                                               ; preds = %22, %27, %15
  %46 = phi float [ 0.000000e+00, %15 ], [ %23, %22 ], [ %41, %27 ]
  %47 = mul nsw i32 %11, %2
  %48 = add nsw i32 %47, %7
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  store float %46, float addrspace(1)* %50, align 4, !tbaa !5
  br label %153

51:                                               ; preds = %51, %20
  %52 = phi i32 [ 0, %20 ], [ %150, %51 ]
  %53 = phi float [ 0.000000e+00, %20 ], [ %149, %51 ]
  %54 = phi i32 [ 0, %20 ], [ %151, %51 ]
  %55 = mul nsw i32 %52, %2
  %56 = add nsw i32 %55, %11
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  %60 = add nsw i32 %55, %7
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fmul contract float %59, %63
  %65 = fadd contract float %53, %64
  %66 = or i32 %52, 1
  %67 = mul nsw i32 %66, %2
  %68 = add nsw i32 %67, %11
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  %72 = add nsw i32 %67, %7
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = fmul contract float %71, %75
  %77 = fadd contract float %65, %76
  %78 = or i32 %52, 2
  %79 = mul nsw i32 %78, %2
  %80 = add nsw i32 %79, %11
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5, !amdgpu.noclobber !9
  %84 = add nsw i32 %79, %7
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  %88 = fmul contract float %83, %87
  %89 = fadd contract float %77, %88
  %90 = or i32 %52, 3
  %91 = mul nsw i32 %90, %2
  %92 = add nsw i32 %91, %11
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = add nsw i32 %91, %7
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  %100 = fmul contract float %95, %99
  %101 = fadd contract float %89, %100
  %102 = or i32 %52, 4
  %103 = mul nsw i32 %102, %2
  %104 = add nsw i32 %103, %11
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5, !amdgpu.noclobber !9
  %108 = add nsw i32 %103, %7
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !5, !amdgpu.noclobber !9
  %112 = fmul contract float %107, %111
  %113 = fadd contract float %101, %112
  %114 = or i32 %52, 5
  %115 = mul nsw i32 %114, %2
  %116 = add nsw i32 %115, %11
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5, !amdgpu.noclobber !9
  %120 = add nsw i32 %115, %7
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  %124 = fmul contract float %119, %123
  %125 = fadd contract float %113, %124
  %126 = or i32 %52, 6
  %127 = mul nsw i32 %126, %2
  %128 = add nsw i32 %127, %11
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !5, !amdgpu.noclobber !9
  %132 = add nsw i32 %127, %7
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5, !amdgpu.noclobber !9
  %136 = fmul contract float %131, %135
  %137 = fadd contract float %125, %136
  %138 = or i32 %52, 7
  %139 = mul nsw i32 %138, %2
  %140 = add nsw i32 %139, %11
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = add nsw i32 %139, %7
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !5, !amdgpu.noclobber !9
  %148 = fmul contract float %143, %147
  %149 = fadd contract float %137, %148
  %150 = add nuw nsw i32 %52, 8
  %151 = add i32 %54, 8
  %152 = icmp eq i32 %151, %21
  br i1 %152, label %22, label %51, !llvm.loop !12

153:                                              ; preds = %45, %3
  ret void
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
