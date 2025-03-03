; ModuleID = '../data/hip_kernels/1212/61/main.cu'
source_filename = "../data/hip_kernels/1212/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12sgemm_kernelPKfS0_Pfiiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
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
  %25 = add nuw nsw i32 %24, 1
  %26 = add i32 %25, %23
  %27 = icmp sgt i32 %5, 0
  br i1 %27, label %28, label %57

28:                                               ; preds = %8
  %29 = mul nsw i32 %26, %5
  %30 = and i32 %5, 7
  %31 = icmp ult i32 %5, 8
  br i1 %31, label %34, label %32

32:                                               ; preds = %28
  %33 = and i32 %5, -8
  br label %67

34:                                               ; preds = %67, %28
  %35 = phi float [ undef, %28 ], [ %165, %67 ]
  %36 = phi i32 [ 0, %28 ], [ %166, %67 ]
  %37 = phi float [ 0.000000e+00, %28 ], [ %165, %67 ]
  %38 = icmp eq i32 %30, 0
  br i1 %38, label %57, label %39

39:                                               ; preds = %34, %39
  %40 = phi i32 [ %54, %39 ], [ %36, %34 ]
  %41 = phi float [ %53, %39 ], [ %37, %34 ]
  %42 = phi i32 [ %55, %39 ], [ 0, %34 ]
  %43 = add nsw i32 %40, %29
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = mul nsw i32 %40, %5
  %48 = add nsw i32 %47, %17
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fmul contract float %46, %51
  %53 = fadd contract float %41, %52
  %54 = add nuw nsw i32 %40, 1
  %55 = add i32 %42, 1
  %56 = icmp eq i32 %55, %30
  br i1 %56, label %57, label %39, !llvm.loop !11

57:                                               ; preds = %34, %39, %8
  %58 = phi float [ 0.000000e+00, %8 ], [ %35, %34 ], [ %53, %39 ]
  %59 = fmul contract float %58, %6
  %60 = mul nsw i32 %26, %4
  %61 = add nsw i32 %60, %17
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fmul contract float %64, %7
  %66 = fadd contract float %59, %65
  store float %66, float addrspace(1)* %63, align 4, !tbaa !7
  ret void

67:                                               ; preds = %67, %32
  %68 = phi i32 [ 0, %32 ], [ %166, %67 ]
  %69 = phi float [ 0.000000e+00, %32 ], [ %165, %67 ]
  %70 = phi i32 [ 0, %32 ], [ %167, %67 ]
  %71 = add nsw i32 %68, %29
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = mul nsw i32 %68, %5
  %76 = add nsw i32 %75, %17
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract float %74, %79
  %81 = fadd contract float %69, %80
  %82 = or i32 %68, 1
  %83 = add nsw i32 %82, %29
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = mul nsw i32 %82, %5
  %88 = add nsw i32 %87, %17
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = fmul contract float %86, %91
  %93 = fadd contract float %81, %92
  %94 = or i32 %68, 2
  %95 = add nsw i32 %94, %29
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = mul nsw i32 %94, %5
  %100 = add nsw i32 %99, %17
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = fmul contract float %98, %103
  %105 = fadd contract float %93, %104
  %106 = or i32 %68, 3
  %107 = add nsw i32 %106, %29
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = mul nsw i32 %106, %5
  %112 = add nsw i32 %111, %17
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fmul contract float %110, %115
  %117 = fadd contract float %105, %116
  %118 = or i32 %68, 4
  %119 = add nsw i32 %118, %29
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = mul nsw i32 %118, %5
  %124 = add nsw i32 %123, %17
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = fmul contract float %122, %127
  %129 = fadd contract float %117, %128
  %130 = or i32 %68, 5
  %131 = add nsw i32 %130, %29
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = mul nsw i32 %130, %5
  %136 = add nsw i32 %135, %17
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = fmul contract float %134, %139
  %141 = fadd contract float %129, %140
  %142 = or i32 %68, 6
  %143 = add nsw i32 %142, %29
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = mul nsw i32 %142, %5
  %148 = add nsw i32 %147, %17
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = fmul contract float %146, %151
  %153 = fadd contract float %141, %152
  %154 = or i32 %68, 7
  %155 = add nsw i32 %154, %29
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = mul nsw i32 %154, %5
  %160 = add nsw i32 %159, %17
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !5
  %164 = fmul contract float %158, %163
  %165 = fadd contract float %153, %164
  %166 = add nuw nsw i32 %68, 8
  %167 = add i32 %70, 8
  %168 = icmp eq i32 %167, %33
  br i1 %168, label %34, label %67, !llvm.loop !13
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
