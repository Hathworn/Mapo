; ModuleID = '../data/hip_kernels/16673/31/main.cu'
source_filename = "../data/hip_kernels/16673/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13vecAdd_kernelPfPKfS1_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  br label %18

17:                                               ; preds = %18
  ret void

18:                                               ; preds = %18, %3
  %19 = phi i32 [ 0, %3 ], [ %80, %18 ]
  %20 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %21 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %22 = fadd contract float %20, %21
  store float %22, float addrspace(1)* %16, align 4, !tbaa !7
  %23 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %24 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %25 = fadd contract float %23, %24
  store float %25, float addrspace(1)* %16, align 4, !tbaa !7
  %26 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %27 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %28 = fadd contract float %26, %27
  store float %28, float addrspace(1)* %16, align 4, !tbaa !7
  %29 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %30 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %31 = fadd contract float %29, %30
  store float %31, float addrspace(1)* %16, align 4, !tbaa !7
  %32 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %33 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %34 = fadd contract float %32, %33
  store float %34, float addrspace(1)* %16, align 4, !tbaa !7
  %35 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %36 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %37 = fadd contract float %35, %36
  store float %37, float addrspace(1)* %16, align 4, !tbaa !7
  %38 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %39 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %40 = fadd contract float %38, %39
  store float %40, float addrspace(1)* %16, align 4, !tbaa !7
  %41 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %42 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %43 = fadd contract float %41, %42
  store float %43, float addrspace(1)* %16, align 4, !tbaa !7
  %44 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %45 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %46 = fadd contract float %44, %45
  store float %46, float addrspace(1)* %16, align 4, !tbaa !7
  %47 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %48 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %49 = fadd contract float %47, %48
  store float %49, float addrspace(1)* %16, align 4, !tbaa !7
  %50 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %51 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %52 = fadd contract float %50, %51
  store float %52, float addrspace(1)* %16, align 4, !tbaa !7
  %53 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %54 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %55 = fadd contract float %53, %54
  store float %55, float addrspace(1)* %16, align 4, !tbaa !7
  %56 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %57 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %58 = fadd contract float %56, %57
  store float %58, float addrspace(1)* %16, align 4, !tbaa !7
  %59 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %60 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(1)* %16, align 4, !tbaa !7
  %62 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %63 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %64 = fadd contract float %62, %63
  store float %64, float addrspace(1)* %16, align 4, !tbaa !7
  %65 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %66 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %67 = fadd contract float %65, %66
  store float %67, float addrspace(1)* %16, align 4, !tbaa !7
  %68 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %69 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %70 = fadd contract float %68, %69
  store float %70, float addrspace(1)* %16, align 4, !tbaa !7
  %71 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %72 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %73 = fadd contract float %71, %72
  store float %73, float addrspace(1)* %16, align 4, !tbaa !7
  %74 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %75 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %76 = fadd contract float %74, %75
  store float %76, float addrspace(1)* %16, align 4, !tbaa !7
  %77 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %78 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %79 = fadd contract float %77, %78
  store float %79, float addrspace(1)* %16, align 4, !tbaa !7
  %80 = add nuw nsw i32 %19, 20
  %81 = icmp eq i32 %80, 500
  br i1 %81, label %17, label %18, !llvm.loop !11
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
!12 = !{!"llvm.loop.mustprogress"}
