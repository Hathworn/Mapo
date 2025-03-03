; ModuleID = '../data/hip_kernels/16079/31/main.cu'
source_filename = "../data/hip_kernels/16079/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23TgvSolveEtaMaskedKernelPfffS_S_S_S_S_S_iii(float addrspace(1)* nocapture readonly %0, float %1, float %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %21, %10
  %31 = icmp slt i32 %29, %9
  %32 = select i1 %30, i1 true, i1 %31
  br i1 %32, label %33, label %73

33:                                               ; preds = %12
  %34 = mul nsw i32 %21, %11
  %35 = add nsw i32 %29, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = fcmp contract oeq float %38, 0.000000e+00
  br i1 %39, label %73, label %40

40:                                               ; preds = %33
  %41 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = getelementptr inbounds float, float addrspace(1)* %4, i64 %36
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = getelementptr inbounds float, float addrspace(1)* %5, i64 %36
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fmul contract float %42, %42
  %48 = fmul contract float %44, %44
  %49 = fadd contract float %47, %48
  %50 = fmul contract float %46, 2.000000e+00
  %51 = fmul contract float %46, %50
  %52 = fadd contract float %49, %51
  %53 = fadd contract float %42, %46
  %54 = fmul contract float %53, %53
  %55 = fadd contract float %54, %52
  %56 = fadd contract float %44, %46
  %57 = fmul contract float %56, %56
  %58 = fadd contract float %57, %55
  %59 = fmul contract float %2, %2
  %60 = fmul contract float %59, %58
  %61 = getelementptr inbounds float, float addrspace(1)* %6, i64 %36
  store float %60, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = fmul contract float %46, %46
  %63 = fadd contract float %48, %62
  %64 = fmul contract float %59, %63
  %65 = fmul contract float %1, 4.000000e+00
  %66 = fmul contract float %65, %1
  %67 = fadd contract float %66, %64
  %68 = getelementptr inbounds float, float addrspace(1)* %7, i64 %36
  store float %67, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = fadd contract float %47, %62
  %70 = fmul contract float %59, %69
  %71 = fadd contract float %66, %70
  %72 = getelementptr inbounds float, float addrspace(1)* %8, i64 %36
  store float %71, float addrspace(1)* %72, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %40, %33, %12
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
