; ModuleID = '../data/hip_kernels/4932/1/main.cu'
source_filename = "../data/hip_kernels/4932/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = add nsw i32 %1, 1
  %11 = shl i32 %7, 4
  %12 = add i32 %11, %9
  %13 = mul i32 %12, %10
  %14 = add nuw nsw i32 %8, 1
  %15 = add i32 %14, %10
  %16 = add i32 %15, %13
  %17 = add nuw nsw i32 %9, 1
  %18 = add i32 %17, %11
  %19 = zext i32 %14 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = fpext float %21 to double
  %23 = fmul contract double %22, 3.000000e-01
  %24 = sext i32 %18 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = fpext float %26 to double
  %28 = fmul contract double %23, %27
  %29 = sext i32 %16 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %5, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = fpext float %31 to double
  %33 = fmul contract double %32, 3.000000e-01
  %34 = fadd contract double %28, %33
  %35 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = fpext float %36 to double
  %38 = fadd contract double %34, %37
  %39 = fptrunc double %38 to float
  store float %39, float addrspace(1)* %35, align 4, !tbaa !5
  %40 = load float, float addrspace(1)* %20, align 4, !tbaa !5
  %41 = fpext float %40 to double
  %42 = fmul contract double %41, 3.000000e-01
  %43 = load float, float addrspace(1)* %25, align 4, !tbaa !5
  %44 = fpext float %43 to double
  %45 = fmul contract double %42, %44
  %46 = load float, float addrspace(1)* %30, align 4, !tbaa !5
  %47 = fpext float %46 to double
  %48 = fmul contract double %47, 3.000000e-01
  %49 = fadd contract double %45, %48
  %50 = fptrunc double %49 to float
  store float %50, float addrspace(1)* %30, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp eq i32 %9, 0
  %52 = icmp eq i32 %7, 0
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %76

54:                                               ; preds = %6
  %55 = load float, float addrspace(1)* %20, align 4, !tbaa !5
  %56 = fpext float %55 to double
  %57 = fmul contract double %56, 3.000000e-01
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 %19
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5
  %60 = fpext float %59 to double
  %61 = fmul contract double %60, 3.000000e-01
  %62 = fadd contract double %57, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 %19
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5
  %65 = fpext float %64 to double
  %66 = fadd contract double %62, %65
  %67 = fptrunc double %66 to float
  store float %67, float addrspace(1)* %63, align 4, !tbaa !5
  %68 = load float, float addrspace(1)* %20, align 4, !tbaa !5
  %69 = fpext float %68 to double
  %70 = fmul contract double %69, 3.000000e-01
  %71 = load float, float addrspace(1)* %58, align 4, !tbaa !5
  %72 = fpext float %71 to double
  %73 = fmul contract double %72, 3.000000e-01
  %74 = fadd contract double %70, %73
  %75 = fptrunc double %74 to float
  store float %75, float addrspace(1)* %58, align 4, !tbaa !5
  br label %76

76:                                               ; preds = %54, %6
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
