; ModuleID = '../data/hip_kernels/9978/1/main.cu'
source_filename = "../data/hip_kernels/9978/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10CNU_kernelPsS_(i16 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = trunc i32 %3 to i16
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = trunc i32 %5 to i16
  %11 = mul i16 %9, %10
  %12 = add i16 %11, %4
  %13 = mul i16 %12, 3
  %14 = sext i16 %13 to i64
  %15 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %14
  %16 = load i16, i16 addrspace(1)* %15, align 2, !tbaa !7, !amdgpu.noclobber !6
  %17 = sext i16 %13 to i32
  %18 = sext i16 %16 to i32
  %19 = add nsw i32 %17, %18
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %20
  %22 = load i16, i16 addrspace(1)* %21, align 2, !tbaa !7, !amdgpu.noclobber !6
  %23 = add nsw i32 %19, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %24
  %26 = load i16, i16 addrspace(1)* %25, align 2, !tbaa !7, !amdgpu.noclobber !6
  %27 = add nsw i32 %19, 2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %28
  %30 = load i16, i16 addrspace(1)* %29, align 2, !tbaa !7, !amdgpu.noclobber !6
  %31 = icmp sgt i16 %22, -1
  %32 = select i1 %31, i16 1, i16 -1
  %33 = icmp slt i16 %26, 0
  %34 = sub nsw i16 0, %32
  %35 = select i1 %33, i16 %34, i16 %32
  %36 = icmp slt i16 %30, 0
  %37 = sub nsw i16 0, %35
  %38 = select i1 %36, i16 %37, i16 %35
  %39 = tail call i16 @llvm.abs.i16(i16 %22, i1 false)
  %40 = tail call i16 @llvm.abs.i16(i16 %26, i1 false)
  %41 = icmp ugt i16 %39, %40
  %42 = select i1 %41, i16 %26, i16 %22
  %43 = select i1 %41, i16 %22, i16 %26
  %44 = tail call i16 @llvm.abs.i16(i16 %30, i1 false)
  %45 = tail call i16 @llvm.abs.i16(i16 %42, i1 false)
  %46 = icmp ugt i16 %44, %45
  %47 = tail call i16 @llvm.abs.i16(i16 %43, i1 false)
  %48 = icmp ugt i16 %44, %47
  %49 = select i1 %48, i16 %43, i16 %30
  %50 = select i1 %46, i16 %42, i16 %30
  %51 = select i1 %46, i16 %49, i16 %42
  %52 = mul i16 %51, %38
  %53 = sext i16 %16 to i64
  %54 = add nsw i64 %14, %53
  %55 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %54
  store i16 %52, i16 addrspace(1)* %55, align 2, !tbaa !7
  %56 = mul i16 %50, %38
  %57 = add nsw i64 %54, 1
  %58 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %57
  %59 = insertelement <2 x i16> poison, i16 %56, i64 0
  %60 = shufflevector <2 x i16> %59, <2 x i16> poison, <2 x i32> zeroinitializer
  %61 = bitcast i16 addrspace(1)* %58 to <2 x i16> addrspace(1)*
  store <2 x i16> %60, <2 x i16> addrspace(1)* %61, align 2, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.abs.i16(i16, i1 immarg) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
