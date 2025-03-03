; ModuleID = '../data/hip_kernels/565/12/main.cu'
source_filename = "../data/hip_kernels/565/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10stencil_1diPdS_(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %0
  br i1 %13, label %14, label %41

14:                                               ; preds = %3
  %15 = icmp sgt i32 %12, 4
  %16 = add nsw i32 %0, -5
  %17 = icmp slt i32 %12, %16
  %18 = select i1 %15, i1 %17, i1 false
  br i1 %18, label %23, label %19

19:                                               ; preds = %14
  %20 = sitofp i32 %12 to double
  %21 = fmul contract double %20, 1.100000e+01
  %22 = sext i32 %12 to i64
  br label %37

23:                                               ; preds = %14
  %24 = add nsw i32 %12, -5
  %25 = add nuw nsw i32 %12, 5
  br label %28

26:                                               ; preds = %28
  %27 = zext i32 %12 to i64
  br label %37

28:                                               ; preds = %23, %28
  %29 = phi i32 [ %24, %23 ], [ %35, %28 ]
  %30 = phi double [ 0.000000e+00, %23 ], [ %34, %28 ]
  %31 = sext i32 %29 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %1, i64 %31
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !7, !amdgpu.noclobber !5
  %34 = fadd contract double %30, %33
  %35 = add nsw i32 %29, 1
  %36 = icmp slt i32 %29, %25
  br i1 %36, label %28, label %26, !llvm.loop !11

37:                                               ; preds = %19, %26
  %38 = phi i64 [ %27, %26 ], [ %22, %19 ]
  %39 = phi double [ %34, %26 ], [ %21, %19 ]
  %40 = getelementptr inbounds double, double addrspace(1)* %2, i64 %38
  store double %39, double addrspace(1)* %40, align 8, !tbaa !7
  br label %41

41:                                               ; preds = %37, %3
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
