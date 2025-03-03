; ModuleID = '../data/hip_kernels/9978/0/main.cu'
source_filename = "../data/hip_kernels/9978/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10VNU_kernelPsS_S_S_(i16 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture readonly %1, i16 addrspace(1)* nocapture writeonly %2, i16 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = trunc i32 %5 to i16
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = trunc i32 %7 to i16
  %13 = mul i16 %11, %12
  %14 = add i16 %13, %6
  %15 = shl i16 %14, 1
  %16 = sext i16 %15 to i64
  %17 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %16
  %18 = load i16, i16 addrspace(1)* %17, align 2, !tbaa !7, !amdgpu.noclobber !6
  %19 = sext i16 %15 to i32
  %20 = sext i16 %18 to i32
  %21 = add nsw i32 %19, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %22
  %24 = add nsw i32 %21, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %25
  %27 = ashr exact i32 %19, 1
  %28 = add nsw i32 %27, %20
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %29
  %31 = load i16, i16 addrspace(1)* %30, align 2, !tbaa !7, !amdgpu.noclobber !6
  %32 = sext i16 %18 to i64
  %33 = add nsw i64 %16, %32
  %34 = getelementptr inbounds i16, i16 addrspace(1)* %3, i64 %33
  %35 = load i16, i16 addrspace(1)* %23, align 2, !tbaa !7, !amdgpu.noclobber !6
  %36 = load i16, i16 addrspace(1)* %26, align 2, !tbaa !7, !amdgpu.noclobber !6
  %37 = add i16 %36, %35
  %38 = add i16 %37, %31
  %39 = lshr i16 %38, 15
  %40 = insertelement <2 x i16> poison, i16 %38, i64 0
  %41 = shufflevector <2 x i16> %40, <2 x i16> poison, <2 x i32> zeroinitializer
  %42 = insertelement <2 x i16> poison, i16 %35, i64 0
  %43 = insertelement <2 x i16> %42, i16 %36, i64 1
  %44 = sub <2 x i16> %41, %43
  %45 = bitcast i16 addrspace(1)* %34 to <2 x i16> addrspace(1)*
  store <2 x i16> %44, <2 x i16> addrspace(1)* %45, align 2, !tbaa !7
  %46 = getelementptr inbounds i16, i16 addrspace(1)* %2, i64 %33
  %47 = insertelement <2 x i16> poison, i16 %39, i64 0
  %48 = shufflevector <2 x i16> %47, <2 x i16> poison, <2 x i32> zeroinitializer
  %49 = bitcast i16 addrspace(1)* %46 to <2 x i16> addrspace(1)*
  store <2 x i16> %48, <2 x i16> addrspace(1)* %49, align 2, !tbaa !7
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
