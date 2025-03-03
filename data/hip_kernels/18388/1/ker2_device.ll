; ModuleID = '../data/hip_kernels/18388/1/main.cu'
source_filename = "../data/hip_kernels/18388/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z4ker2PfS_iixiix(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i64 %4, i32 %5, i32 %6, i64 %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = zext i16 %12 to i64
  %15 = zext i32 %13 to i64
  %16 = mul nuw nsw i64 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = zext i32 %17 to i64
  %19 = add nuw nsw i64 %16, %18
  %20 = sext i32 %3 to i64
  %21 = freeze i64 %19
  %22 = freeze i64 %20
  %23 = sdiv i64 %21, %22
  %24 = mul i64 %23, %22
  %25 = sub i64 %21, %24
  %26 = icmp slt i64 %23, %25
  br i1 %26, label %27, label %46

27:                                               ; preds = %8
  %28 = sext i32 %2 to i64
  %29 = icmp slt i64 %23, %28
  %30 = icmp sgt i32 %3, -1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %46

32:                                               ; preds = %27
  %33 = add nsw i64 %23, 1
  %34 = mul nsw i64 %33, %23
  %35 = sdiv i64 %34, -2
  %36 = mul nsw i64 %23, %20
  %37 = mul nsw i64 %25, %28
  %38 = add nsw i64 %37, %23
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = xor i64 %23, -1
  %42 = add i64 %36, %41
  %43 = add i64 %42, %25
  %44 = add i64 %43, %35
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  store float %40, float addrspace(1)* %45, align 4, !tbaa !7
  br label %46

46:                                               ; preds = %32, %27, %8
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
