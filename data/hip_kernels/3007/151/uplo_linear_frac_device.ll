; ModuleID = '../data/hip_kernels/3007/151/main.cu'
source_filename = "../data/hip_kernels/3007/151/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16uplo_linear_fraciiiPKfiiS0_iiffffPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, float %9, float %10, float %11, float %12, float addrspace(1)* nocapture writeonly %13, i32 %14, i32 %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %17, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !4, !invariant.load !5
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %33 = add i32 %31, %32
  %34 = icmp slt i32 %25, %0
  %35 = icmp slt i32 %33, %0
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %67

37:                                               ; preds = %16
  %38 = icmp eq i32 %1, 132
  %39 = mul nsw i32 %25, %2
  %40 = mul nsw i32 %33, %2
  %41 = icmp sgt i32 %39, %40
  %42 = icmp sge i32 %39, %40
  %43 = select i1 %38, i1 %41, i1 %42
  br i1 %43, label %44, label %67

44:                                               ; preds = %37
  %45 = add nsw i32 %25, %4
  %46 = mul nsw i32 %33, %5
  %47 = add nsw i32 %45, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract float %50, %9
  %52 = fadd contract float %51, %10
  %53 = add nsw i32 %25, %7
  %54 = mul nsw i32 %33, %8
  %55 = add nsw i32 %53, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %6, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = fmul contract float %58, %11
  %60 = fadd contract float %59, %12
  %61 = fdiv contract float %52, %60
  %62 = add nsw i32 %25, %14
  %63 = mul nsw i32 %33, %15
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %13, i64 %65
  store float %61, float addrspace(1)* %66, align 4, !tbaa !7
  br label %67

67:                                               ; preds = %16, %44, %37
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
