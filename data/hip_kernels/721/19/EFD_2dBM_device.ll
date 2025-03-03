; ModuleID = '../data/hip_kernels/721/19/main.cu'
source_filename = "../data/hip_kernels/721/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8EFD_2dBMiiiiPfS_ff(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = icmp slt i32 %9, %1
  %12 = icmp slt i32 %10, %0
  %13 = select i1 %11, i1 %12, i1 false
  br i1 %13, label %14, label %93

14:                                               ; preds = %8
  %15 = add nsw i32 %9, 1
  %16 = sext i32 %15 to i64
  %17 = sext i32 %2 to i64
  %18 = lshr i64 %17, 2
  %19 = mul i64 %18, %16
  %20 = zext i32 %10 to i64
  %21 = add i64 %19, %20
  %22 = getelementptr inbounds float, float addrspace(1)* %4, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = add nsw i32 %9, -1
  %25 = sext i32 %24 to i64
  %26 = mul i64 %18, %25
  %27 = add i64 %26, %20
  %28 = getelementptr inbounds float, float addrspace(1)* %4, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = fadd contract float %23, %29
  %31 = fmul contract float %30, %6
  %32 = sext i32 %9 to i64
  %33 = mul i64 %18, %32
  %34 = add i64 %33, %20
  %35 = add i64 %34, 1
  %36 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = add i64 %34, -1
  %39 = getelementptr inbounds float, float addrspace(1)* %4, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5, !amdgpu.noclobber !9
  %41 = fadd contract float %37, %40
  %42 = fmul contract float %41, %7
  %43 = fadd contract float %31, %42
  %44 = fpext float %43 to double
  %45 = fpext float %6 to double
  %46 = fmul contract double %45, 2.000000e+00
  %47 = fsub contract double 1.000000e+00, %46
  %48 = fpext float %7 to double
  %49 = fmul contract double %48, 2.000000e+00
  %50 = fsub contract double %47, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %4, i64 %34
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = fpext float %52 to double
  %54 = fmul contract double %50, %53
  %55 = fadd contract double %54, %44
  %56 = fptrunc double %55 to float
  %57 = sext i32 %3 to i64
  %58 = lshr i64 %57, 2
  %59 = mul i64 %58, %32
  %60 = add i64 %59, %20
  %61 = getelementptr inbounds float, float addrspace(1)* %5, i64 %60
  store float %56, float addrspace(1)* %61, align 4, !tbaa !5
  %62 = icmp eq i32 %9, 0
  br i1 %62, label %63, label %68

63:                                               ; preds = %14
  %64 = mul nuw nsw i64 %58, %16
  %65 = add nuw nsw i64 %64, %20
  %66 = getelementptr inbounds float, float addrspace(1)* %5, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !5
  store float %67, float addrspace(1)* %61, align 4, !tbaa !5
  br label %68

68:                                               ; preds = %63, %14
  %69 = add nsw i32 %1, -1
  %70 = icmp eq i32 %9, %69
  br i1 %70, label %71, label %76

71:                                               ; preds = %68
  %72 = mul i64 %58, %25
  %73 = add i64 %72, %20
  %74 = getelementptr inbounds float, float addrspace(1)* %5, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5
  store float %75, float addrspace(1)* %61, align 4, !tbaa !5
  br label %76

76:                                               ; preds = %71, %68
  %77 = icmp eq i32 %10, 0
  br i1 %77, label %78, label %84

78:                                               ; preds = %76
  %79 = mul i64 %58, %25
  %80 = add nuw nsw i64 %20, 1
  %81 = add i64 %80, %79
  %82 = getelementptr inbounds float, float addrspace(1)* %5, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !5
  store float %83, float addrspace(1)* %61, align 4, !tbaa !5
  br label %84

84:                                               ; preds = %78, %76
  %85 = add nsw i32 %0, -1
  %86 = icmp eq i32 %9, %85
  br i1 %86, label %87, label %93

87:                                               ; preds = %84
  %88 = mul i64 %58, %25
  %89 = add nsw i64 %20, -1
  %90 = add i64 %89, %88
  %91 = getelementptr inbounds float, float addrspace(1)* %5, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  store float %92, float addrspace(1)* %61, align 4, !tbaa !5
  br label %93

93:                                               ; preds = %84, %87, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
