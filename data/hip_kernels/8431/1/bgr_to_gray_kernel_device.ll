; ModuleID = '../data/hip_kernels/8431/1/main.cu'
source_filename = "../data/hip_kernels/8431/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18bgr_to_gray_kernelPhS_iiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %2
  %25 = icmp slt i32 %23, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %55

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %4
  %29 = mul nsw i32 %15, 3
  %30 = add nsw i32 %28, %29
  %31 = mul nsw i32 %23, %5
  %32 = add nsw i32 %31, %15
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %30, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7, !amdgpu.noclobber !5
  %40 = add nsw i32 %30, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !7, !amdgpu.noclobber !5
  %44 = uitofp i8 %43 to float
  %45 = fmul contract float %44, 0x3FD3333340000000
  %46 = uitofp i8 %39 to float
  %47 = fmul contract float %46, 0x3FE2E147A0000000
  %48 = fadd contract float %47, %45
  %49 = uitofp i8 %35 to float
  %50 = fmul contract float %49, 0x3FBC28F5C0000000
  %51 = fadd contract float %50, %48
  %52 = fptoui float %51 to i8
  %53 = sext i32 %32 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %53
  store i8 %52, i8 addrspace(1)* %54, align 1, !tbaa !7
  br label %55

55:                                               ; preds = %27, %6
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
