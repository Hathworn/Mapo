; ModuleID = '../data/hip_kernels/17041/2/main.cu'
source_filename = "../data/hip_kernels/17041/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24find_all_sums_hub_kernelPiiPdS_S_S0_(i32 addrspace(1)* nocapture readonly %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %43

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %21
  %23 = bitcast i32 addrspace(1)* %22 to <2 x i32> addrspace(1)*
  %24 = load <2 x i32>, <2 x i32> addrspace(1)* %23, align 4, !tbaa !7
  %25 = extractelement <2 x i32> %24, i64 0
  %26 = extractelement <2 x i32> %24, i64 1
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %31, label %28

28:                                               ; preds = %31, %17
  %29 = phi double [ 0.000000e+00, %17 ], [ %40, %31 ]
  %30 = getelementptr inbounds double, double addrspace(1)* %5, i64 %21
  store double %29, double addrspace(1)* %30, align 8, !tbaa !11
  br label %43

31:                                               ; preds = %17, %31
  %32 = phi i32 [ %41, %31 ], [ %25, %17 ]
  %33 = phi double [ %40, %31 ], [ 0.000000e+00, %17 ]
  %34 = sext i32 %32 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %2, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !11, !amdgpu.noclobber !5
  %40 = fadd contract double %33, %39
  %41 = add nsw i32 %32, 1
  %42 = icmp slt i32 %41, %26
  br i1 %42, label %31, label %28, !llvm.loop !13

43:                                               ; preds = %28, %6
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
