; ModuleID = '../data/hip_kernels/8504/11/main.cu'
source_filename = "../data/hip_kernels/8504/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9gpu_mull2PfS_S_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = add i32 %8, %9
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = icmp sgt i32 %5, 0
  br i1 %12, label %13, label %42

13:                                               ; preds = %6
  %14 = mul nsw i32 %11, %5
  %15 = and i32 %5, 7
  %16 = icmp ult i32 %5, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %13
  %18 = and i32 %5, -8
  br label %48

19:                                               ; preds = %48, %13
  %20 = phi float [ undef, %13 ], [ %146, %48 ]
  %21 = phi i32 [ 0, %13 ], [ %147, %48 ]
  %22 = phi float [ 0.000000e+00, %13 ], [ %146, %48 ]
  %23 = icmp eq i32 %15, 0
  br i1 %23, label %42, label %24

24:                                               ; preds = %19, %24
  %25 = phi i32 [ %39, %24 ], [ %21, %19 ]
  %26 = phi float [ %38, %24 ], [ %22, %19 ]
  %27 = phi i32 [ %40, %24 ], [ 0, %19 ]
  %28 = mul nsw i32 %25, %3
  %29 = add nsw i32 %28, %10
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = add nsw i32 %25, %14
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = fmul contract float %32, %36
  %38 = fadd contract float %26, %37
  %39 = add nuw nsw i32 %25, 1
  %40 = add i32 %27, 1
  %41 = icmp eq i32 %40, %15
  br i1 %41, label %42, label %24, !llvm.loop !10

42:                                               ; preds = %19, %24, %6
  %43 = phi float [ 0.000000e+00, %6 ], [ %20, %19 ], [ %38, %24 ]
  %44 = mul nsw i32 %11, %3
  %45 = add nsw i32 %44, %10
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  store float %43, float addrspace(1)* %47, align 4, !tbaa !5
  ret void

48:                                               ; preds = %48, %17
  %49 = phi i32 [ 0, %17 ], [ %147, %48 ]
  %50 = phi float [ 0.000000e+00, %17 ], [ %146, %48 ]
  %51 = phi i32 [ 0, %17 ], [ %148, %48 ]
  %52 = mul nsw i32 %49, %3
  %53 = add nsw i32 %52, %10
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = add nsw i32 %49, %14
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = fmul contract float %56, %60
  %62 = fadd contract float %50, %61
  %63 = or i32 %49, 1
  %64 = mul nsw i32 %63, %3
  %65 = add nsw i32 %64, %10
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  %69 = add nsw i32 %63, %14
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = fmul contract float %68, %72
  %74 = fadd contract float %62, %73
  %75 = or i32 %49, 2
  %76 = mul nsw i32 %75, %3
  %77 = add nsw i32 %76, %10
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = add nsw i32 %75, %14
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5, !amdgpu.noclobber !9
  %85 = fmul contract float %80, %84
  %86 = fadd contract float %74, %85
  %87 = or i32 %49, 3
  %88 = mul nsw i32 %87, %3
  %89 = add nsw i32 %88, %10
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5, !amdgpu.noclobber !9
  %93 = add nsw i32 %87, %14
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = fmul contract float %92, %96
  %98 = fadd contract float %86, %97
  %99 = or i32 %49, 4
  %100 = mul nsw i32 %99, %3
  %101 = add nsw i32 %100, %10
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = add nsw i32 %99, %14
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %2, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5, !amdgpu.noclobber !9
  %109 = fmul contract float %104, %108
  %110 = fadd contract float %98, %109
  %111 = or i32 %49, 5
  %112 = mul nsw i32 %111, %3
  %113 = add nsw i32 %112, %10
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  %117 = add nsw i32 %111, %14
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5, !amdgpu.noclobber !9
  %121 = fmul contract float %116, %120
  %122 = fadd contract float %110, %121
  %123 = or i32 %49, 6
  %124 = mul nsw i32 %123, %3
  %125 = add nsw i32 %124, %10
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !5, !amdgpu.noclobber !9
  %129 = add nsw i32 %123, %14
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %2, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5, !amdgpu.noclobber !9
  %133 = fmul contract float %128, %132
  %134 = fadd contract float %122, %133
  %135 = or i32 %49, 7
  %136 = mul nsw i32 %135, %3
  %137 = add nsw i32 %136, %10
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !5, !amdgpu.noclobber !9
  %141 = add nsw i32 %135, %14
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !5, !amdgpu.noclobber !9
  %145 = fmul contract float %140, %144
  %146 = fadd contract float %134, %145
  %147 = add nuw nsw i32 %49, 8
  %148 = add i32 %51, 8
  %149 = icmp eq i32 %148, %18
  br i1 %149, label %19, label %48, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
