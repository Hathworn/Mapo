; ModuleID = '../data/hip_kernels/17041/15/main.cu'
source_filename = "../data/hip_kernels/17041/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24find_all_sums_hub_kernelPiiPdS_S_S0_S0_(i32 addrspace(1)* nocapture readonly %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5, double addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %45

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %22
  %24 = bitcast i32 addrspace(1)* %23 to <2 x i32> addrspace(1)*
  %25 = load <2 x i32>, <2 x i32> addrspace(1)* %24, align 4, !tbaa !7
  %26 = extractelement <2 x i32> %25, i64 0
  %27 = extractelement <2 x i32> %25, i64 1
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %32, label %29

29:                                               ; preds = %32, %18
  %30 = phi double [ 0.000000e+00, %18 ], [ %41, %32 ]
  %31 = getelementptr inbounds double, double addrspace(1)* %6, i64 %22
  store double %30, double addrspace(1)* %31, align 8, !tbaa !11
  br label %45

32:                                               ; preds = %18, %32
  %33 = phi i32 [ %43, %32 ], [ %26, %18 ]
  %34 = phi double [ %41, %32 ], [ 0.000000e+00, %18 ]
  %35 = sext i32 %33 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %2, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !11
  %41 = fadd contract double %34, %40
  %42 = getelementptr inbounds double, double addrspace(1)* %5, i64 %35
  store double %41, double addrspace(1)* %42, align 8, !tbaa !11
  %43 = add nsw i32 %33, 1
  %44 = icmp slt i32 %43, %27
  br i1 %44, label %32, label %29, !llvm.loop !13

45:                                               ; preds = %29, %7
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
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
