; ModuleID = '../data/hip_kernels/7184/2/main.cu'
source_filename = "../data/hip_kernels/7184/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17pointToThreadMoveiidPdS_(i32 %0, i32 %1, double %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = udiv i32 %13, %10
  %16 = mul i32 %15, %10
  %17 = icmp ugt i32 %13, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, -1
  %20 = add i32 %19, %18
  %21 = icmp eq i32 %14, %20
  br i1 %21, label %24, label %22

22:                                               ; preds = %5
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  br label %28

24:                                               ; preds = %5
  %25 = urem i32 %0, %10
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = icmp ugt i32 %25, %26
  br i1 %27, label %28, label %48

28:                                               ; preds = %22, %24
  %29 = phi i32 [ %23, %22 ], [ %26, %24 ]
  %30 = mul i32 %14, %1
  %31 = add i32 %30, %29
  %32 = shl i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %4, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16
  %36 = fmul contract double %35, %2
  %37 = getelementptr inbounds double, double addrspace(1)* %3, i64 %33
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !16
  %39 = fadd contract double %38, %36
  store double %39, double addrspace(1)* %37, align 8, !tbaa !16
  %40 = add nuw nsw i32 %32, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %4, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !16
  %44 = fmul contract double %43, %2
  %45 = getelementptr inbounds double, double addrspace(1)* %3, i64 %41
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !16
  %47 = fadd contract double %46, %44
  store double %47, double addrspace(1)* %45, align 8, !tbaa !16
  br label %48

48:                                               ; preds = %28, %24
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
