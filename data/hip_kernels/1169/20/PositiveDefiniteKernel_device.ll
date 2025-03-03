; ModuleID = '../data/hip_kernels/1169/20/main.cu'
source_filename = "../data/hip_kernels/1169/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22PositiveDefiniteKernelPcPfiii(i8 addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 3
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 3
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %15 = shl i32 %14, 3
  %16 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %17 = add i32 %15, %16
  %18 = mul nsw i32 %3, %2
  %19 = mul nsw i32 %18, %4
  %20 = mul nsw i32 %17, %3
  %21 = add nsw i32 %13, %20
  %22 = mul nsw i32 %21, %2
  %23 = add nsw i32 %9, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = add nsw i32 %23, %19
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = shl nsw i32 %19, 1
  %32 = add nsw i32 %23, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = mul nsw i32 %19, 3
  %37 = add nsw i32 %23, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5, !amdgpu.noclobber !9
  %41 = shl nsw i32 %19, 2
  %42 = add nsw i32 %23, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = mul nsw i32 %19, 5
  %47 = add nsw i32 %23, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = fcmp contract olt float %26, 0.000000e+00
  br i1 %51, label %52, label %73

52:                                               ; preds = %5
  %53 = fmul contract float %26, %40
  %54 = fmul contract float %30, %30
  %55 = fsub contract float %53, %54
  %56 = fcmp contract ogt float %55, 0.000000e+00
  br i1 %56, label %57, label %73

57:                                               ; preds = %52
  %58 = fmul contract float %53, %50
  %59 = fmul contract float %30, 2.000000e+00
  %60 = fmul contract float %59, %45
  %61 = fmul contract float %35, %60
  %62 = fadd contract float %58, %61
  %63 = fmul contract float %26, %45
  %64 = fmul contract float %45, %63
  %65 = fsub contract float %62, %64
  %66 = fmul contract float %35, %40
  %67 = fmul contract float %35, %66
  %68 = fsub contract float %65, %67
  %69 = fmul contract float %30, %50
  %70 = fmul contract float %30, %69
  %71 = fsub contract float %68, %70
  %72 = fcmp contract olt float %71, 0.000000e+00
  br label %73

73:                                               ; preds = %57, %52, %5
  %74 = phi i1 [ false, %52 ], [ false, %5 ], [ %72, %57 ]
  %75 = zext i1 %74 to i8
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %24
  store i8 %75, i8 addrspace(1)* %76, align 1, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!10 = !{!7, !7, i64 0}
