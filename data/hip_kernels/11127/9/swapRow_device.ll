; ModuleID = '../data/hip_kernels/11127/9/main.cu'
source_filename = "../data/hip_kernels/11127/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@greatest_row = protected addrspace(1) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @greatest_row to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7swapRowPfS_S_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = load i32, i32 addrspace(1)* @greatest_row, align 4, !tbaa !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !8, !invariant.load !9
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %16 = add i32 %14, %15
  %17 = icmp eq i32 %7, %5
  br i1 %17, label %40, label %18

18:                                               ; preds = %6
  %19 = icmp slt i32 %16, %4
  br i1 %19, label %20, label %31

20:                                               ; preds = %18
  %21 = mul nsw i32 %5, %4
  %22 = add nsw i32 %16, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !11, !amdgpu.noclobber !9
  %26 = mul nsw i32 %7, %4
  %27 = add nsw i32 %16, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !11, !amdgpu.noclobber !9
  store float %30, float addrspace(1)* %24, align 4, !tbaa !11
  store float %25, float addrspace(1)* %29, align 4, !tbaa !11
  br label %40

31:                                               ; preds = %18
  %32 = icmp eq i32 %16, %4
  br i1 %32, label %33, label %40

33:                                               ; preds = %31
  %34 = sext i32 %5 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !11, !amdgpu.noclobber !9
  %37 = sext i32 %7 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !11, !amdgpu.noclobber !9
  store float %39, float addrspace(1)* %35, align 4, !tbaa !11
  store float %36, float addrspace(1)* %38, align 4, !tbaa !11
  br label %40

40:                                               ; preds = %20, %33, %31, %6
  %41 = icmp slt i32 %16, %3
  br i1 %41, label %42, label %50

42:                                               ; preds = %40
  %43 = mul nsw i32 %16, %4
  %44 = add nsw i32 %43, %5
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !11
  %48 = sext i32 %16 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  store float %47, float addrspace(1)* %49, align 4, !tbaa !11
  br label %50

50:                                               ; preds = %42, %40
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
