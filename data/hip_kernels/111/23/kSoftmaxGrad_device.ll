; ModuleID = '../data/hip_kernels/111/23/main.cu'
source_filename = "../data/hip_kernels/111/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12kSoftmaxGradPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 5
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 2
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %13, %3
  %15 = add nsw i32 %14, %9
  %16 = icmp slt i32 %13, %4
  %17 = icmp slt i32 %9, %3
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %167

19:                                               ; preds = %5
  %20 = icmp sgt i32 %4, 0
  br i1 %20, label %21, label %50

21:                                               ; preds = %19
  %22 = and i32 %4, 7
  %23 = icmp ult i32 %4, 8
  br i1 %23, label %26, label %24

24:                                               ; preds = %21
  %25 = and i32 %4, -8
  br label %57

26:                                               ; preds = %57, %21
  %27 = phi float [ undef, %21 ], [ %163, %57 ]
  %28 = phi i32 [ 0, %21 ], [ %164, %57 ]
  %29 = phi float [ 0.000000e+00, %21 ], [ %163, %57 ]
  %30 = icmp eq i32 %22, 0
  br i1 %30, label %50, label %31

31:                                               ; preds = %26, %31
  %32 = phi i32 [ %47, %31 ], [ %28, %26 ]
  %33 = phi float [ %46, %31 ], [ %29, %26 ]
  %34 = phi i32 [ %48, %31 ], [ 0, %26 ]
  %35 = mul nsw i32 %32, %3
  %36 = add nsw i32 %35, %9
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = icmp eq i32 %32, %13
  %41 = uitofp i1 %40 to float
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = fsub contract float %41, %43
  %45 = fmul contract float %39, %44
  %46 = fadd contract float %33, %45
  %47 = add nuw nsw i32 %32, 1
  %48 = add i32 %34, 1
  %49 = icmp eq i32 %48, %22
  br i1 %49, label %50, label %31, !llvm.loop !10

50:                                               ; preds = %26, %31, %19
  %51 = phi float [ 0.000000e+00, %19 ], [ %27, %26 ], [ %46, %31 ]
  %52 = sext i32 %15 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = fmul contract float %51, %54
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  store float %55, float addrspace(1)* %56, align 4, !tbaa !5
  br label %167

57:                                               ; preds = %57, %24
  %58 = phi i32 [ 0, %24 ], [ %164, %57 ]
  %59 = phi float [ 0.000000e+00, %24 ], [ %163, %57 ]
  %60 = phi i32 [ 0, %24 ], [ %165, %57 ]
  %61 = mul nsw i32 %58, %3
  %62 = add nsw i32 %61, %9
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5, !amdgpu.noclobber !9
  %66 = icmp eq i32 %58, %13
  %67 = uitofp i1 %66 to float
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = fsub contract float %67, %69
  %71 = fmul contract float %65, %70
  %72 = fadd contract float %59, %71
  %73 = or i32 %58, 1
  %74 = mul nsw i32 %73, %3
  %75 = add nsw i32 %74, %9
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  %79 = icmp eq i32 %73, %13
  %80 = uitofp i1 %79 to float
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = fsub contract float %80, %82
  %84 = fmul contract float %78, %83
  %85 = fadd contract float %72, %84
  %86 = or i32 %58, 2
  %87 = mul nsw i32 %86, %3
  %88 = add nsw i32 %87, %9
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = icmp eq i32 %86, %13
  %93 = uitofp i1 %92 to float
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = fsub contract float %93, %95
  %97 = fmul contract float %91, %96
  %98 = fadd contract float %85, %97
  %99 = or i32 %58, 3
  %100 = mul nsw i32 %99, %3
  %101 = add nsw i32 %100, %9
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = icmp eq i32 %99, %13
  %106 = uitofp i1 %105 to float
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = fsub contract float %106, %108
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %98, %110
  %112 = or i32 %58, 4
  %113 = mul nsw i32 %112, %3
  %114 = add nsw i32 %113, %9
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = icmp eq i32 %112, %13
  %119 = uitofp i1 %118 to float
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = fsub contract float %119, %121
  %123 = fmul contract float %117, %122
  %124 = fadd contract float %111, %123
  %125 = or i32 %58, 5
  %126 = mul nsw i32 %125, %3
  %127 = add nsw i32 %126, %9
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5, !amdgpu.noclobber !9
  %131 = icmp eq i32 %125, %13
  %132 = uitofp i1 %131 to float
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !5, !amdgpu.noclobber !9
  %135 = fsub contract float %132, %134
  %136 = fmul contract float %130, %135
  %137 = fadd contract float %124, %136
  %138 = or i32 %58, 6
  %139 = mul nsw i32 %138, %3
  %140 = add nsw i32 %139, %9
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = icmp eq i32 %138, %13
  %145 = uitofp i1 %144 to float
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !5, !amdgpu.noclobber !9
  %148 = fsub contract float %145, %147
  %149 = fmul contract float %143, %148
  %150 = fadd contract float %137, %149
  %151 = or i32 %58, 7
  %152 = mul nsw i32 %151, %3
  %153 = add nsw i32 %152, %9
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !5, !amdgpu.noclobber !9
  %157 = icmp eq i32 %151, %13
  %158 = uitofp i1 %157 to float
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %154
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !5, !amdgpu.noclobber !9
  %161 = fsub contract float %158, %160
  %162 = fmul contract float %156, %161
  %163 = fadd contract float %150, %162
  %164 = add nuw nsw i32 %58, 8
  %165 = add i32 %60, 8
  %166 = icmp eq i32 %165, %25
  br i1 %166, label %26, label %57, !llvm.loop !12

167:                                              ; preds = %50, %5
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
