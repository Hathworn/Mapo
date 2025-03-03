; ModuleID = '../data/hip_kernels/14012/18/main.cu'
source_filename = "../data/hip_kernels/14012/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13gpu_mix32_2_2PljPiS0_iPtji(i64 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i16 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = icmp slt i32 %17, %4
  br i1 %18, label %19, label %41

19:                                               ; preds = %8
  %20 = shl nsw i32 %17, 1
  %21 = sext i32 %17 to i64
  %22 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %21
  %23 = load i64, i64 addrspace(1)* %22, align 8, !tbaa !7, !amdgpu.noclobber !6
  %24 = lshr i64 %23, 32
  %25 = sext i32 %20 to i64
  %26 = getelementptr inbounds i16, i16 addrspace(1)* %5, i64 %25
  %27 = insertelement <2 x i64> poison, i64 %23, i64 0
  %28 = insertelement <2 x i64> %27, i64 %24, i64 1
  %29 = trunc <2 x i64> %28 to <2 x i32>
  %30 = insertelement <2 x i32> poison, i32 %6, i64 0
  %31 = shufflevector <2 x i32> %30, <2 x i32> poison, <2 x i32> zeroinitializer
  %32 = and <2 x i32> %31, %29
  %33 = trunc <2 x i32> %32 to <2 x i16>
  %34 = bitcast i16 addrspace(1)* %26 to <2 x i16> addrspace(1)*
  store <2 x i16> %33, <2 x i16> addrspace(1)* %34, align 2, !tbaa !11
  %35 = extractelement <2 x i32> %29, i64 0
  %36 = ashr i32 %35, %7
  %37 = extractelement <2 x i32> %29, i64 1
  %38 = ashr i32 %37, %7
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %21
  store i32 %36, i32 addrspace(1)* %39, align 4, !tbaa !13
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %21
  store i32 %38, i32 addrspace(1)* %40, align 4, !tbaa !13
  br label %41

41:                                               ; preds = %19, %8
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"short", !9, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !9, i64 0}
