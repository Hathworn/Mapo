; ModuleID = '../data/hip_kernels/335/19/main.cu'
source_filename = "../data/hip_kernels/335/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z44izhikevich_update_membrane_potentials_kernelPfS_S_S_S_fm(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float %5, i64 %6) local_unnamed_addr #0 {
  %8 = fmul contract float %5, 1.000000e+03
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !7
  %19 = mul i32 %10, %15
  %20 = add i32 %19, %9
  %21 = sext i32 %20 to i64
  %22 = icmp ult i64 %21, %6
  br i1 %22, label %23, label %61

23:                                               ; preds = %7
  %24 = udiv i32 %18, %15
  %25 = mul i32 %24, %15
  %26 = icmp ugt i32 %18, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %15
  br label %30

30:                                               ; preds = %23, %30
  %31 = phi i64 [ %21, %23 ], [ %59, %30 ]
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16
  %35 = fmul contract float %34, 0x3FA47AE140000000
  %36 = fmul contract float %34, %35
  %37 = fmul contract float %34, 5.000000e+00
  %38 = fadd contract float %37, %36
  %39 = fadd contract float %38, 1.400000e+02
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16
  %42 = fsub contract float %39, %41
  %43 = getelementptr inbounds float, float addrspace(1)* %4, i64 %31
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !16
  %45 = fadd contract float %44, %42
  %46 = fmul contract float %8, %45
  %47 = fadd contract float %34, %46
  store float %47, float addrspace(1)* %33, align 4, !tbaa !16
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %31
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = fmul contract float %51, %47
  %53 = load float, float addrspace(1)* %40, align 4, !tbaa !16
  %54 = fsub contract float %52, %53
  %55 = fmul contract float %49, %54
  %56 = fmul contract float %8, %55
  %57 = fadd contract float %53, %56
  store float %57, float addrspace(1)* %40, align 4, !tbaa !16
  %58 = add i32 %29, %32
  %59 = sext i32 %58 to i64
  %60 = icmp ult i64 %59, %6
  br i1 %60, label %30, label %61, !llvm.loop !20

61:                                               ; preds = %30, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
