; ModuleID = '../data/hip_kernels/335/17/main.cu'
source_filename = "../data/hip_kernels/335/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z30check_for_neuron_spikes_kernelPfS_S_S_Phiiffmb(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i8 addrspace(1)* nocapture %4, i32 %5, i32 %6, float %7, float %8, i64 %9, i1 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !7
  %22 = mul i32 %13, %18
  %23 = add i32 %22, %12
  %24 = sext i32 %23 to i64
  %25 = icmp ult i64 %24, %9
  br i1 %25, label %26, label %80

26:                                               ; preds = %11
  %27 = fdiv contract float %7, %8
  %28 = tail call float @llvm.round.f32(float %27)
  %29 = fptosi float %28 to i32
  %30 = udiv i32 %21, %18
  %31 = mul i32 %30, %18
  %32 = icmp ugt i32 %21, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %18
  br label %36

36:                                               ; preds = %26, %76
  %37 = phi i64 [ %24, %26 ], [ %78, %76 ]
  %38 = trunc i64 %37 to i32
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !16
  %43 = fcmp contract ult float %40, %42
  br i1 %43, label %61, label %44

44:                                               ; preds = %36
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  store float %7, float addrspace(1)* %45, align 4, !tbaa !16
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  store float %47, float addrspace(1)* %39, align 4, !tbaa !16
  br i1 %10, label %48, label %76

48:                                               ; preds = %44
  %49 = mul nsw i32 %38, %5
  %50 = srem i32 %29, %6
  %51 = sdiv i32 %50, 8
  %52 = shl nsw i32 %51, 3
  %53 = sub nsw i32 %50, %52
  %54 = add nsw i32 %51, %49
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !20
  %58 = shl nuw i32 1, %53
  %59 = trunc i32 %58 to i8
  %60 = or i8 %57, %59
  store i8 %60, i8 addrspace(1)* %56, align 1, !tbaa !20
  br label %76

61:                                               ; preds = %36
  br i1 %10, label %62, label %76

62:                                               ; preds = %61
  %63 = mul nsw i32 %38, %5
  %64 = srem i32 %29, %6
  %65 = sdiv i32 %64, 8
  %66 = shl nsw i32 %65, 3
  %67 = sub nsw i32 %64, %66
  %68 = add nsw i32 %65, %63
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %69
  %71 = load i8, i8 addrspace(1)* %70, align 1, !tbaa !20
  %72 = shl nuw i32 1, %67
  %73 = trunc i32 %72 to i8
  %74 = xor i8 %73, -1
  %75 = and i8 %71, %74
  store i8 %75, i8 addrspace(1)* %70, align 1, !tbaa !20
  br label %76

76:                                               ; preds = %61, %62, %44, %48
  %77 = add i32 %35, %38
  %78 = sext i32 %77 to i64
  %79 = icmp ult i64 %78, %9
  br i1 %79, label %36, label %80, !llvm.loop !21

80:                                               ; preds = %76, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.round.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!20 = !{!18, !18, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
