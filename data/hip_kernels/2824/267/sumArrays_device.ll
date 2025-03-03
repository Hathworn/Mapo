; ModuleID = '../data/hip_kernels/2824/267/main.cu'
source_filename = "../data/hip_kernels/2824/267/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9sumArraysPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  %15 = icmp sgt i32 %3, 0
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %63

17:                                               ; preds = %4
  %18 = sext i32 %13 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %22 = and i32 %3, 7
  %23 = icmp ult i32 %3, 8
  br i1 %23, label %54, label %24

24:                                               ; preds = %17
  %25 = and i32 %3, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi i32 [ 0, %24 ], [ %52, %26 ]
  %28 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %29 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %30 = fadd contract float %28, %29
  store float %30, float addrspace(1)* %21, align 4, !tbaa !7
  %31 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %32 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %33 = fadd contract float %31, %32
  store float %33, float addrspace(1)* %21, align 4, !tbaa !7
  %34 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %35 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %36 = fadd contract float %34, %35
  store float %36, float addrspace(1)* %21, align 4, !tbaa !7
  %37 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %38 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %39 = fadd contract float %37, %38
  store float %39, float addrspace(1)* %21, align 4, !tbaa !7
  %40 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %41 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %42 = fadd contract float %40, %41
  store float %42, float addrspace(1)* %21, align 4, !tbaa !7
  %43 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %44 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %45 = fadd contract float %43, %44
  store float %45, float addrspace(1)* %21, align 4, !tbaa !7
  %46 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %47 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %48 = fadd contract float %46, %47
  store float %48, float addrspace(1)* %21, align 4, !tbaa !7
  %49 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %50 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %51 = fadd contract float %49, %50
  store float %51, float addrspace(1)* %21, align 4, !tbaa !7
  %52 = add i32 %27, 8
  %53 = icmp eq i32 %52, %25
  br i1 %53, label %54, label %26, !llvm.loop !11

54:                                               ; preds = %26, %17
  %55 = icmp eq i32 %22, 0
  br i1 %55, label %63, label %56

56:                                               ; preds = %54, %56
  %57 = phi i32 [ %61, %56 ], [ 0, %54 ]
  %58 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %59 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %60 = fadd contract float %58, %59
  store float %60, float addrspace(1)* %21, align 4, !tbaa !7
  %61 = add i32 %57, 1
  %62 = icmp eq i32 %61, %22
  br i1 %62, label %63, label %56, !llvm.loop !13

63:                                               ; preds = %54, %56, %4
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
