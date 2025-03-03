; ModuleID = '../data/hip_kernels/14174/11/main.cu'
source_filename = "../data/hip_kernels/14174/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18divideByCSCColSumsPKfPKiPfm(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = zext i32 %13 to i64
  %15 = icmp ult i64 %14, %3
  br i1 %15, label %16, label %41

16:                                               ; preds = %4
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %18 = bitcast i32 addrspace(1)* %17 to <2 x i32> addrspace(1)*
  %19 = load <2 x i32>, <2 x i32> addrspace(1)* %18, align 4, !tbaa !7
  %20 = extractelement <2 x i32> %19, i64 1
  %21 = sext i32 %20 to i64
  %22 = extractelement <2 x i32> %19, i64 0
  %23 = icmp ult i32 %22, %20
  br i1 %23, label %24, label %28

24:                                               ; preds = %16
  %25 = sext i32 %22 to i64
  br label %33

26:                                               ; preds = %33
  %27 = fadd contract float %38, 0x3EB0C6F7A0000000
  br label %28

28:                                               ; preds = %26, %16
  %29 = phi float [ 0x3EB0C6F7A0000000, %16 ], [ %27, %26 ]
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !11, !amdgpu.noclobber !5
  %32 = fdiv contract float %31, %29
  store float %32, float addrspace(1)* %30, align 4, !tbaa !11
  br label %41

33:                                               ; preds = %24, %33
  %34 = phi i64 [ %39, %33 ], [ %25, %24 ]
  %35 = phi float [ %38, %33 ], [ 0.000000e+00, %24 ]
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !11, !amdgpu.noclobber !5
  %38 = fadd contract float %35, %37
  %39 = add nuw i64 %34, 1
  %40 = icmp ult i64 %39, %21
  br i1 %40, label %33, label %26, !llvm.loop !13

41:                                               ; preds = %4, %28
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
