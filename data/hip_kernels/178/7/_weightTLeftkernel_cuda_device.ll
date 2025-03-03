; ModuleID = '../data/hip_kernels/178/7/main.cu'
source_filename = "../data/hip_kernels/178/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23_weightTLeftkernel_cudaiifPfS_S_S_(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %73

18:                                               ; preds = %7
  %19 = mul i32 %1, %1
  %20 = mul i32 %19, %16
  %21 = add nsw i32 %20, 1
  %22 = add nsw i32 %20, %1
  %23 = add nsw i32 %22, 1
  %24 = fmul contract float %2, 2.000000e+00
  %25 = sext i32 %20 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %25
  %27 = getelementptr inbounds float, float addrspace(1)* %6, i64 %25
  %28 = getelementptr inbounds float, float addrspace(1)* %4, i64 %25
  %29 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %30 = fmul contract float %24, %29
  %31 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %32 = fadd contract float %31, %30
  store float %32, float addrspace(1)* %26, align 4, !tbaa !7
  %33 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %34 = fmul contract float %24, %33
  %35 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %36 = sext i32 %21 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %6, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = fadd contract float %35, %38
  %40 = fmul contract float %34, %39
  %41 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %42 = fsub contract float %41, %40
  store float %42, float addrspace(1)* %28, align 4, !tbaa !7
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 1
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = fmul contract float %24, %44
  %46 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %47 = fadd contract float %46, %45
  store float %47, float addrspace(1)* %26, align 4, !tbaa !7
  %48 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %49 = fmul contract float %24, %48
  %50 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %51 = sext i32 %22 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %6, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fadd contract float %50, %53
  %55 = fmul contract float %49, %54
  %56 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %57 = fsub contract float %56, %55
  store float %57, float addrspace(1)* %28, align 4, !tbaa !7
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 2
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fmul contract float %24, %59
  %61 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %62 = fadd contract float %61, %60
  store float %62, float addrspace(1)* %26, align 4, !tbaa !7
  %63 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %64 = fmul contract float %24, %63
  %65 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %66 = sext i32 %23 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %6, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fadd contract float %65, %68
  %70 = fmul contract float %64, %69
  %71 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %72 = fsub contract float %71, %70
  store float %72, float addrspace(1)* %28, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %18, %7
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
