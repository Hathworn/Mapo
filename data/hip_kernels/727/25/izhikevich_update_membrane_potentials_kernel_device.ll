; ModuleID = '../data/hip_kernels/727/25/main.cu'
source_filename = "../data/hip_kernels/727/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z44izhikevich_update_membrane_potentials_kernelPfS_S_S_S_S_S_S_ffm(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture readonly %7, float %8, float %9, i64 %10) local_unnamed_addr #0 {
  %12 = fmul contract float %9, 1.000000e+03
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !7
  %23 = mul i32 %14, %19
  %24 = add i32 %23, %13
  %25 = sext i32 %24 to i64
  %26 = icmp ult i64 %25, %10
  br i1 %26, label %27, label %74

27:                                               ; preds = %11
  %28 = udiv i32 %22, %19
  %29 = mul i32 %28, %19
  %30 = icmp ugt i32 %22, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %19
  br label %34

34:                                               ; preds = %27, %70
  %35 = phi i64 [ %25, %27 ], [ %72, %70 ]
  %36 = trunc i64 %35 to i32
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %39 = fmul contract float %38, 0x3FA47AE140000000
  %40 = fmul contract float %38, %39
  %41 = fmul contract float %38, 5.000000e+00
  %42 = fadd contract float %41, %40
  %43 = fadd contract float %42, 1.400000e+02
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %46 = fsub contract float %43, %45
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %35
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16
  %49 = fadd contract float %48, %46
  %50 = fmul contract float %12, %49
  %51 = fadd contract float %38, %50
  store float %51, float addrspace(1)* %37, align 4, !tbaa !16
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = fmul contract float %55, %51
  %57 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %58 = fsub contract float %56, %57
  %59 = fmul contract float %53, %58
  %60 = fmul contract float %12, %59
  %61 = fadd contract float %57, %60
  store float %61, float addrspace(1)* %44, align 4, !tbaa !16
  %62 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %35
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = fcmp contract ult float %62, %64
  br i1 %65, label %70, label %66

66:                                               ; preds = %34
  %67 = getelementptr inbounds float, float addrspace(1)* %7, i64 %35
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  store float %68, float addrspace(1)* %37, align 4, !tbaa !16
  %69 = getelementptr inbounds float, float addrspace(1)* %6, i64 %35
  store float %8, float addrspace(1)* %69, align 4, !tbaa !16
  br label %70

70:                                               ; preds = %66, %34
  %71 = add i32 %33, %36
  %72 = sext i32 %71 to i64
  %73 = icmp ult i64 %72, %10
  br i1 %73, label %34, label %74, !llvm.loop !20

74:                                               ; preds = %70, %11
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
