; ModuleID = '../data/hip_kernels/90/11/main.cu'
source_filename = "../data/hip_kernels/90/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12_mat_sum_rowPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %98

15:                                               ; preds = %4
  %16 = icmp sgt i32 %3, 0
  br i1 %16, label %17, label %40

17:                                               ; preds = %15
  %18 = mul nsw i32 %13, %3
  %19 = and i32 %3, 7
  %20 = icmp ult i32 %3, 8
  br i1 %20, label %23, label %21

21:                                               ; preds = %17
  %22 = and i32 %3, -8
  br label %44

23:                                               ; preds = %44, %17
  %24 = phi float [ undef, %17 ], [ %94, %44 ]
  %25 = phi i32 [ 0, %17 ], [ %95, %44 ]
  %26 = phi float [ 0.000000e+00, %17 ], [ %94, %44 ]
  %27 = icmp eq i32 %19, 0
  br i1 %27, label %40, label %28

28:                                               ; preds = %23, %28
  %29 = phi i32 [ %37, %28 ], [ %25, %23 ]
  %30 = phi float [ %36, %28 ], [ %26, %23 ]
  %31 = phi i32 [ %38, %28 ], [ 0, %23 ]
  %32 = add nsw i32 %29, %18
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fadd contract float %30, %35
  %37 = add nuw nsw i32 %29, 1
  %38 = add i32 %31, 1
  %39 = icmp eq i32 %38, %19
  br i1 %39, label %40, label %28, !llvm.loop !11

40:                                               ; preds = %23, %28, %15
  %41 = phi float [ 0.000000e+00, %15 ], [ %24, %23 ], [ %36, %28 ]
  %42 = sext i32 %13 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  store float %41, float addrspace(1)* %43, align 4, !tbaa !7
  br label %98

44:                                               ; preds = %44, %21
  %45 = phi i32 [ 0, %21 ], [ %95, %44 ]
  %46 = phi float [ 0.000000e+00, %21 ], [ %94, %44 ]
  %47 = phi i32 [ 0, %21 ], [ %96, %44 ]
  %48 = add nsw i32 %45, %18
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fadd contract float %46, %51
  %53 = or i32 %45, 1
  %54 = add nsw i32 %53, %18
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = fadd contract float %52, %57
  %59 = or i32 %45, 2
  %60 = add nsw i32 %59, %18
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fadd contract float %58, %63
  %65 = or i32 %45, 3
  %66 = add nsw i32 %65, %18
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fadd contract float %64, %69
  %71 = or i32 %45, 4
  %72 = add nsw i32 %71, %18
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fadd contract float %70, %75
  %77 = or i32 %45, 5
  %78 = add nsw i32 %77, %18
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = fadd contract float %76, %81
  %83 = or i32 %45, 6
  %84 = add nsw i32 %83, %18
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fadd contract float %82, %87
  %89 = or i32 %45, 7
  %90 = add nsw i32 %89, %18
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fadd contract float %88, %93
  %95 = add nuw nsw i32 %45, 8
  %96 = add i32 %47, 8
  %97 = icmp eq i32 %96, %22
  br i1 %97, label %23, label %44, !llvm.loop !13

98:                                               ; preds = %40, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
