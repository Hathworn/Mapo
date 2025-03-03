; ModuleID = '../data/hip_kernels/6809/11/main.cu'
source_filename = "../data/hip_kernels/6809/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6DividePfmmff(float addrspace(1)* nocapture %0, i64 %1, i64 %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = sext i32 %17 to i64
  %19 = icmp ult i64 %18, %2
  br i1 %19, label %20, label %31

20:                                               ; preds = %5
  %21 = add i64 %1, -2
  %22 = mul i64 %21, %2
  %23 = add i64 %1, -1
  %24 = mul i64 %23, %2
  %25 = udiv i32 %14, %11
  %26 = mul i32 %25, %11
  %27 = icmp ugt i32 %14, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %11
  br label %32

31:                                               ; preds = %48, %5
  ret void

32:                                               ; preds = %20, %48
  %33 = phi i64 [ %18, %20 ], [ %51, %48 ]
  %34 = trunc i64 %33 to i32
  %35 = add i64 %33, %22
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %38 = tail call float @llvm.fabs.f32(float %37)
  %39 = fpext float %38 to double
  %40 = fcmp contract ogt double %39, 1.000000e-08
  br i1 %40, label %41, label %48

41:                                               ; preds = %32
  %42 = add i64 %33, %24
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !16
  %45 = fmul contract float %44, %3
  %46 = fmul contract float %37, %4
  %47 = fdiv contract float %45, %46
  br label %48

48:                                               ; preds = %32, %41
  %49 = phi float [ %47, %41 ], [ 1.000000e+00, %32 ]
  store float %49, float addrspace(1)* %36, align 4, !tbaa !16
  %50 = add i32 %30, %34
  %51 = sext i32 %50 to i64
  %52 = icmp ult i64 %51, %2
  br i1 %52, label %32, label %31, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
