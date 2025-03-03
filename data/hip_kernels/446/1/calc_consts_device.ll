; ModuleID = '../data/hip_kernels/446/1/main.cu'
source_filename = "../data/hip_kernels/446/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z11calc_constsPfPd(float addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = sub i32 0, %10
  %12 = icmp eq i32 %3, %11
  br i1 %12, label %13, label %46

13:                                               ; preds = %2
  store float 0x3E80000000000000, float addrspace(1)* %0, align 4, !tbaa !7
  store double 0x3CB0000000000000, double addrspace(1)* %1, align 8, !tbaa !11
  br label %14

14:                                               ; preds = %13, %14
  %15 = phi float [ 1.000000e+00, %13 ], [ %17, %14 ]
  %16 = phi float [ 2.000000e+00, %13 ], [ %18, %14 ]
  %17 = fmul contract float %15, 2.000000e+00
  %18 = fmul contract float %16, 2.000000e+00
  %19 = tail call float @llvm.fabs.f32(float %18) #3
  %20 = fcmp oeq float %19, 0x7FF0000000000000
  br i1 %20, label %21, label %14, !llvm.loop !13

21:                                               ; preds = %14, %21
  %22 = phi double [ %24, %21 ], [ 1.000000e+00, %14 ]
  %23 = phi double [ %25, %21 ], [ 2.000000e+00, %14 ]
  %24 = fmul contract double %22, 2.000000e+00
  %25 = fmul contract double %23, 2.000000e+00
  %26 = tail call double @llvm.fabs.f64(double %25) #3
  %27 = fcmp oeq double %26, 0x7FF0000000000000
  br i1 %27, label %28, label %21, !llvm.loop !15

28:                                               ; preds = %21
  %29 = getelementptr inbounds double, double addrspace(1)* %1, i64 2
  store double %24, double addrspace(1)* %29, align 8, !tbaa !11
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  store float %17, float addrspace(1)* %30, align 4, !tbaa !7
  br label %31

31:                                               ; preds = %28, %31
  %32 = phi float [ 2.000000e+00, %28 ], [ %34, %31 ]
  %33 = phi float [ 1.000000e+00, %28 ], [ %35, %31 ]
  %34 = fmul contract float %32, 5.000000e-01
  %35 = fmul contract float %33, 5.000000e-01
  %36 = fcmp contract une float %35, 0.000000e+00
  br i1 %36, label %31, label %37, !llvm.loop !16

37:                                               ; preds = %31, %37
  %38 = phi double [ %40, %37 ], [ 2.000000e+00, %31 ]
  %39 = phi double [ %41, %37 ], [ 1.000000e+00, %31 ]
  %40 = fmul contract double %38, 5.000000e-01
  %41 = fmul contract double %39, 5.000000e-01
  %42 = fcmp contract une double %41, 0.000000e+00
  br i1 %42, label %37, label %43, !llvm.loop !17

43:                                               ; preds = %37
  %44 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  store double %40, double addrspace(1)* %44, align 8, !tbaa !11
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  store float %34, float addrspace(1)* %45, align 4, !tbaa !7
  br label %46

46:                                               ; preds = %43, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
