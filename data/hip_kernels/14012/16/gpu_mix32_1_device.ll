; ModuleID = '../data/hip_kernels/14012/16/main.cu'
source_filename = "../data/hip_kernels/14012/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11gpu_mix32_1PljPiS0_iPtijiii(i64 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i16 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = icmp slt i32 %20, %4
  br i1 %21, label %22, label %49

22:                                               ; preds = %11
  %23 = shl nsw i32 %20, 1
  %24 = sext i32 %20 to i64
  %25 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %24
  %26 = load i64, i64 addrspace(1)* %25, align 8, !tbaa !7, !amdgpu.noclobber !6
  %27 = lshr i64 %26, 32
  %28 = sext i32 %23 to i64
  %29 = getelementptr inbounds i16, i16 addrspace(1)* %5, i64 %28
  %30 = insertelement <2 x i64> poison, i64 %26, i64 0
  %31 = insertelement <2 x i64> %30, i64 %27, i64 1
  %32 = trunc <2 x i64> %31 to <2 x i32>
  %33 = insertelement <2 x i32> poison, i32 %7, i64 0
  %34 = shufflevector <2 x i32> %33, <2 x i32> poison, <2 x i32> zeroinitializer
  %35 = and <2 x i32> %34, %32
  %36 = trunc <2 x i32> %35 to <2 x i16>
  %37 = bitcast i16 addrspace(1)* %29 to <2 x i16> addrspace(1)*
  store <2 x i16> %36, <2 x i16> addrspace(1)* %37, align 2, !tbaa !11
  %38 = extractelement <2 x i32> %32, i64 0
  %39 = ashr i32 %38, %10
  %40 = extractelement <2 x i32> %32, i64 1
  %41 = ashr i32 %40, %10
  %42 = mul nsw i32 %39, %6
  %43 = mul nsw i32 %41, %8
  %44 = add nsw i32 %43, %42
  %45 = ashr i32 %44, %9
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %24
  store i32 %45, i32 addrspace(1)* %46, align 4, !tbaa !13
  %47 = sub nsw i32 %39, %41
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %24
  store i32 %47, i32 addrspace(1)* %48, align 4, !tbaa !13
  br label %49

49:                                               ; preds = %22, %11
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
