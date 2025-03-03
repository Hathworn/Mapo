; ModuleID = '../data/hip_kernels/16079/30/main.cu'
source_filename = "../data/hip_kernels/16079/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17TgvSolveEtaKernelffPfS_S_S_S_S_iii(float %0, float %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %9
  %30 = icmp slt i32 %28, %8
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %68

32:                                               ; preds = %11
  %33 = mul nsw i32 %20, %10
  %34 = add nsw i32 %28, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract float %37, %37
  %43 = fmul contract float %39, %39
  %44 = fadd contract float %42, %43
  %45 = fmul contract float %41, 2.000000e+00
  %46 = fmul contract float %41, %45
  %47 = fadd contract float %44, %46
  %48 = fadd contract float %37, %41
  %49 = fmul contract float %48, %48
  %50 = fadd contract float %49, %47
  %51 = fadd contract float %39, %41
  %52 = fmul contract float %51, %51
  %53 = fadd contract float %52, %50
  %54 = fmul contract float %1, %1
  %55 = fmul contract float %54, %53
  %56 = getelementptr inbounds float, float addrspace(1)* %5, i64 %35
  store float %55, float addrspace(1)* %56, align 4, !tbaa !7
  %57 = fmul contract float %41, %41
  %58 = fadd contract float %43, %57
  %59 = fmul contract float %54, %58
  %60 = fmul contract float %0, 4.000000e+00
  %61 = fmul contract float %60, %0
  %62 = fadd contract float %61, %59
  %63 = getelementptr inbounds float, float addrspace(1)* %6, i64 %35
  store float %62, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = fadd contract float %42, %57
  %65 = fmul contract float %54, %64
  %66 = fadd contract float %61, %65
  %67 = getelementptr inbounds float, float addrspace(1)* %7, i64 %35
  store float %66, float addrspace(1)* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %32, %11
  ret void
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
