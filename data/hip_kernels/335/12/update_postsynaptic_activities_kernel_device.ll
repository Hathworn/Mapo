; ModuleID = '../data/hip_kernels/335/12/main.cu'
source_filename = "../data/hip_kernels/335/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z37update_postsynaptic_activities_kernelfmPfS_fff(float %0, i64 %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, float %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = mul i32 %9, %14
  %19 = add i32 %18, %8
  %20 = sext i32 %19 to i64
  %21 = icmp ult i64 %20, %1
  br i1 %21, label %22, label %48

22:                                               ; preds = %7
  %23 = fdiv contract float %0, %5
  %24 = fsub contract float 1.000000e+00, %23
  %25 = fmul contract float %0, %6
  %26 = udiv i32 %17, %14
  %27 = mul i32 %26, %14
  %28 = icmp ugt i32 %17, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %14
  br label %32

32:                                               ; preds = %22, %32
  %33 = phi i64 [ %20, %22 ], [ %46, %32 ]
  %34 = trunc i64 %33 to i32
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = fmul contract float %24, %36
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %33
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %40 = fcmp contract oeq float %39, %4
  %41 = fsub contract float 1.000000e+00, %36
  %42 = fmul contract float %25, %41
  %43 = select i1 %40, float %42, float -0.000000e+00
  %44 = fadd contract float %37, %43
  store float %44, float addrspace(1)* %35, align 4, !tbaa !16
  %45 = add i32 %31, %34
  %46 = sext i32 %45 to i64
  %47 = icmp ult i64 %46, %1
  br i1 %47, label %32, label %48, !llvm.loop !20

48:                                               ; preds = %32, %7
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
