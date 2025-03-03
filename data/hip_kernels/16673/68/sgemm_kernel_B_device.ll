; ModuleID = '../data/hip_kernels/16673/68/main.cu'
source_filename = "../data/hip_kernels/16673/68/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14sgemm_kernel_BPKfS0_Pfiiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp sgt i32 %5, 0
  br i1 %26, label %27, label %56

27:                                               ; preds = %8
  %28 = mul nsw i32 %25, %5
  %29 = and i32 %5, 7
  %30 = icmp ult i32 %5, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %27
  %32 = and i32 %5, -8
  br label %66

33:                                               ; preds = %66, %27
  %34 = phi float [ undef, %27 ], [ %164, %66 ]
  %35 = phi i32 [ 0, %27 ], [ %165, %66 ]
  %36 = phi float [ 0.000000e+00, %27 ], [ %164, %66 ]
  %37 = icmp eq i32 %29, 0
  br i1 %37, label %56, label %38

38:                                               ; preds = %33, %38
  %39 = phi i32 [ %53, %38 ], [ %35, %33 ]
  %40 = phi float [ %52, %38 ], [ %36, %33 ]
  %41 = phi i32 [ %54, %38 ], [ 0, %33 ]
  %42 = add nsw i32 %39, %28
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = mul nsw i32 %39, %5
  %47 = add nsw i32 %46, %17
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract float %45, %50
  %52 = fadd contract float %40, %51
  %53 = add nuw nsw i32 %39, 1
  %54 = add i32 %41, 1
  %55 = icmp eq i32 %54, %29
  br i1 %55, label %56, label %38, !llvm.loop !11

56:                                               ; preds = %33, %38, %8
  %57 = phi float [ 0.000000e+00, %8 ], [ %34, %33 ], [ %52, %38 ]
  %58 = fmul contract float %57, %6
  %59 = mul nsw i32 %25, %4
  %60 = add nsw i32 %59, %17
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fmul contract float %63, %7
  %65 = fadd contract float %58, %64
  store float %65, float addrspace(1)* %62, align 4, !tbaa !7
  ret void

66:                                               ; preds = %66, %31
  %67 = phi i32 [ 0, %31 ], [ %165, %66 ]
  %68 = phi float [ 0.000000e+00, %31 ], [ %164, %66 ]
  %69 = phi i32 [ 0, %31 ], [ %166, %66 ]
  %70 = add nsw i32 %67, %28
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = mul nsw i32 %67, %5
  %75 = add nsw i32 %74, %17
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract float %73, %78
  %80 = fadd contract float %68, %79
  %81 = or i32 %67, 1
  %82 = add nsw i32 %81, %28
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = mul nsw i32 %81, %5
  %87 = add nsw i32 %86, %17
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract float %85, %90
  %92 = fadd contract float %80, %91
  %93 = or i32 %67, 2
  %94 = add nsw i32 %93, %28
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = mul nsw i32 %93, %5
  %99 = add nsw i32 %98, %17
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = fmul contract float %97, %102
  %104 = fadd contract float %92, %103
  %105 = or i32 %67, 3
  %106 = add nsw i32 %105, %28
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = mul nsw i32 %105, %5
  %111 = add nsw i32 %110, %17
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = fmul contract float %109, %114
  %116 = fadd contract float %104, %115
  %117 = or i32 %67, 4
  %118 = add nsw i32 %117, %28
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = mul nsw i32 %117, %5
  %123 = add nsw i32 %122, %17
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fmul contract float %121, %126
  %128 = fadd contract float %116, %127
  %129 = or i32 %67, 5
  %130 = add nsw i32 %129, %28
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = mul nsw i32 %129, %5
  %135 = add nsw i32 %134, %17
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = fmul contract float %133, %138
  %140 = fadd contract float %128, %139
  %141 = or i32 %67, 6
  %142 = add nsw i32 %141, %28
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = mul nsw i32 %141, %5
  %147 = add nsw i32 %146, %17
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = fmul contract float %145, %150
  %152 = fadd contract float %140, %151
  %153 = or i32 %67, 7
  %154 = add nsw i32 %153, %28
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = mul nsw i32 %153, %5
  %159 = add nsw i32 %158, %17
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %1, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7, !amdgpu.noclobber !5
  %163 = fmul contract float %157, %162
  %164 = fadd contract float %152, %163
  %165 = add nuw nsw i32 %67, 8
  %166 = add i32 %69, 8
  %167 = icmp eq i32 %166, %32
  br i1 %167, label %33, label %66, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
