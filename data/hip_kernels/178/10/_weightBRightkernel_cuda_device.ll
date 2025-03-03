; ModuleID = '../data/hip_kernels/178/10/main.cu'
source_filename = "../data/hip_kernels/178/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24_weightBRightkernel_cudaiifPfS_S_S_(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %76

18:                                               ; preds = %7
  %19 = add nsw i32 %1, -1
  %20 = mul i32 %16, %1
  %21 = add i32 %20, %19
  %22 = mul i32 %21, %1
  %23 = add i32 %22, %19
  %24 = add nsw i32 %23, -1
  %25 = sub nsw i32 %23, %1
  %26 = add nsw i32 %25, -1
  %27 = fmul contract float %2, 2.000000e+00
  %28 = sext i32 %23 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  %30 = getelementptr inbounds float, float addrspace(1)* %6, i64 %28
  %31 = getelementptr inbounds float, float addrspace(1)* %4, i64 %28
  %32 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %33 = fmul contract float %27, %32
  %34 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %35 = fadd contract float %34, %33
  store float %35, float addrspace(1)* %29, align 4, !tbaa !7
  %36 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %37 = fmul contract float %27, %36
  %38 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %39 = sext i32 %24 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %6, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = fadd contract float %38, %41
  %43 = fmul contract float %37, %42
  %44 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %45 = fsub contract float %44, %43
  store float %45, float addrspace(1)* %31, align 4, !tbaa !7
  %46 = getelementptr inbounds float, float addrspace(1)* %5, i64 1
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = fmul contract float %27, %47
  %49 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %50 = fadd contract float %49, %48
  store float %50, float addrspace(1)* %29, align 4, !tbaa !7
  %51 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %52 = fmul contract float %27, %51
  %53 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %54 = sext i32 %25 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %6, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = fadd contract float %53, %56
  %58 = fmul contract float %52, %57
  %59 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %60 = fsub contract float %59, %58
  store float %60, float addrspace(1)* %31, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %5, i64 2
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fmul contract float %27, %62
  %64 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %65 = fadd contract float %64, %63
  store float %65, float addrspace(1)* %29, align 4, !tbaa !7
  %66 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %67 = fmul contract float %27, %66
  %68 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %69 = sext i32 %26 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %6, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = fadd contract float %68, %71
  %73 = fmul contract float %67, %72
  %74 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %75 = fsub contract float %74, %73
  store float %75, float addrspace(1)* %31, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %18, %7
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
