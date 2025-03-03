; ModuleID = '../data/hip_kernels/17205/2/main.cu'
source_filename = "../data/hip_kernels/17205/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21poisson_jacobi_kernelPfS_Piiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = add i32 %11, %6
  %20 = add i32 %19, %18
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %21, %8
  %29 = add i32 %28, %27
  %30 = icmp sgt i32 %3, 0
  br i1 %30, label %31, label %39

31:                                               ; preds = %10
  %32 = mul nsw i32 %29, %4
  %33 = add nsw i32 %32, %20
  %34 = mul i32 %5, %4
  %35 = add nsw i32 %29, -1
  %36 = mul nsw i32 %35, %4
  %37 = add nsw i32 %29, 1
  %38 = mul nsw i32 %37, %4
  br label %40

39:                                               ; preds = %93, %10
  ret void

40:                                               ; preds = %31, %93
  %41 = phi i32 [ 0, %31 ], [ %94, %93 ]
  %42 = mul i32 %34, %41
  %43 = add nsw i32 %33, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %93

48:                                               ; preds = %40
  %49 = add i32 %42, %20
  %50 = add i32 %49, %36
  %51 = add i32 %49, %38
  %52 = add nsw i32 %49, -1
  %53 = add i32 %52, %32
  %54 = add i32 %49, 1
  %55 = add i32 %54, %32
  %56 = sext i32 %51 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !11
  %59 = sext i32 %55 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11
  %62 = fadd contract float %58, %61
  %63 = sext i32 %53 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !11
  %66 = fadd contract float %62, %65
  %67 = sext i32 %50 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11
  %70 = fadd contract float %66, %69
  %71 = fpext float %70 to double
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !11
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !11
  %76 = fadd contract float %73, %75
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !11
  %79 = fadd contract float %76, %78
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11
  %82 = fadd contract float %79, %81
  %83 = fpext float %82 to double
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11
  %86 = fmul contract float %85, 4.000000e+00
  %87 = fpext float %86 to double
  %88 = fsub contract double %87, %71
  %89 = fadd contract double %88, %83
  %90 = fmul contract double %89, 2.500000e-01
  %91 = fptrunc double %90 to float
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  store float %91, float addrspace(1)* %92, align 4, !tbaa !11
  br label %93

93:                                               ; preds = %48, %40
  %94 = add nuw nsw i32 %41, 1
  %95 = icmp eq i32 %94, %3
  br i1 %95, label %39, label %40, !llvm.loop !13
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
