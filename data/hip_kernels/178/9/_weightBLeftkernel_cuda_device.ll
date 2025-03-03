; ModuleID = '../data/hip_kernels/178/9/main.cu'
source_filename = "../data/hip_kernels/178/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23_weightBLeftkernel_cudaiifPfS_S_S_(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %75

18:                                               ; preds = %7
  %19 = add nsw i32 %1, -1
  %20 = mul nsw i32 %16, %1
  %21 = add i32 %19, %20
  %22 = mul i32 %21, %1
  %23 = add nsw i32 %22, 1
  %24 = sub nsw i32 %22, %1
  %25 = add nsw i32 %24, 1
  %26 = fmul contract float %2, 2.000000e+00
  %27 = sext i32 %22 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %3, i64 %27
  %29 = getelementptr inbounds float, float addrspace(1)* %6, i64 %27
  %30 = getelementptr inbounds float, float addrspace(1)* %4, i64 %27
  %31 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %32 = fmul contract float %26, %31
  %33 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %34 = fadd contract float %33, %32
  store float %34, float addrspace(1)* %28, align 4, !tbaa !7
  %35 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %36 = fmul contract float %26, %35
  %37 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %38 = sext i32 %23 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %6, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = fadd contract float %37, %40
  %42 = fmul contract float %36, %41
  %43 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %44 = fsub contract float %43, %42
  store float %44, float addrspace(1)* %30, align 4, !tbaa !7
  %45 = getelementptr inbounds float, float addrspace(1)* %5, i64 1
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fmul contract float %26, %46
  %48 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %49 = fadd contract float %48, %47
  store float %49, float addrspace(1)* %28, align 4, !tbaa !7
  %50 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %51 = fmul contract float %26, %50
  %52 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %53 = sext i32 %24 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %6, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fadd contract float %52, %55
  %57 = fmul contract float %51, %56
  %58 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %59 = fsub contract float %58, %57
  store float %59, float addrspace(1)* %30, align 4, !tbaa !7
  %60 = getelementptr inbounds float, float addrspace(1)* %5, i64 2
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fmul contract float %26, %61
  %63 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %64 = fadd contract float %63, %62
  store float %64, float addrspace(1)* %28, align 4, !tbaa !7
  %65 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %66 = fmul contract float %26, %65
  %67 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %68 = sext i32 %25 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %6, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fadd contract float %67, %70
  %72 = fmul contract float %66, %71
  %73 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %74 = fsub contract float %73, %72
  store float %74, float addrspace(1)* %30, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %18, %7
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
