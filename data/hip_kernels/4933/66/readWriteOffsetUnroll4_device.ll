; ModuleID = '../data/hip_kernels/4933/66/main.cu'
source_filename = "../data/hip_kernels/4933/66/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22readWriteOffsetUnroll4PfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = shl i32 %6, 2
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %14, %4
  %16 = add i32 %15, %13
  %17 = mul nuw nsw i32 %11, 3
  %18 = add i32 %16, %17
  %19 = icmp ult i32 %18, %3
  br i1 %19, label %20, label %52

20:                                               ; preds = %5
  %21 = zext i32 %16 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = fadd contract float %23, %25
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %21
  store float %26, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = add i32 %16, %11
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = fadd contract float %31, %33
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  store float %34, float addrspace(1)* %35, align 4, !tbaa !7
  %36 = shl nuw nsw i32 %11, 1
  %37 = add i32 %16, %36
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fadd contract float %40, %42
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  store float %43, float addrspace(1)* %44, align 4, !tbaa !7
  %45 = zext i32 %18 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fadd contract float %47, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  store float %50, float addrspace(1)* %51, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %20, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
