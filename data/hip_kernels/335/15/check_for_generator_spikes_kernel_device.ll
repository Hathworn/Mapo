; ModuleID = '../data/hip_kernels/335/15/main.cu'
source_filename = "../data/hip_kernels/335/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z33check_for_generator_spikes_kernelPiPfS0_Phiiffmb(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i8 addrspace(1)* nocapture %3, i32 %4, i32 %5, float %6, float %7, i64 %8, i1 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %12, %17
  %22 = add i32 %21, %11
  %23 = sext i32 %22 to i64
  %24 = icmp ult i64 %23, %8
  br i1 %24, label %25, label %85

25:                                               ; preds = %10
  %26 = fpext float %7 to double
  %27 = fmul contract double %26, 5.000000e-01
  %28 = fdiv contract float %6, %7
  %29 = tail call float @llvm.round.f32(float %28)
  %30 = fptosi float %29 to i32
  %31 = udiv i32 %20, %17
  %32 = mul i32 %31, %17
  %33 = icmp ugt i32 %20, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %17
  br label %37

37:                                               ; preds = %25, %81
  %38 = phi i64 [ %23, %25 ], [ %83, %81 ]
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16
  %42 = fsub contract float %6, %41
  %43 = tail call float @llvm.fabs.f32(float %42)
  %44 = fpext float %43 to double
  %45 = fcmp contract ogt double %27, %44
  br i1 %45, label %46, label %64

46:                                               ; preds = %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !20
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  store float %6, float addrspace(1)* %50, align 4, !tbaa !16
  br i1 %9, label %51, label %81

51:                                               ; preds = %46
  %52 = mul nsw i32 %48, %4
  %53 = srem i32 %30, %5
  %54 = sdiv i32 %53, 8
  %55 = shl nsw i32 %54, 3
  %56 = sub nsw i32 %53, %55
  %57 = add nsw i32 %54, %52
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !22
  %61 = shl nuw i32 1, %56
  %62 = trunc i32 %61 to i8
  %63 = or i8 %60, %62
  store i8 %63, i8 addrspace(1)* %59, align 1, !tbaa !22
  br label %81

64:                                               ; preds = %37
  br i1 %9, label %65, label %81

65:                                               ; preds = %64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !20
  %68 = mul nsw i32 %67, %4
  %69 = srem i32 %30, %5
  %70 = sdiv i32 %69, 8
  %71 = shl nsw i32 %70, 3
  %72 = sub nsw i32 %69, %71
  %73 = add nsw i32 %70, %68
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !22
  %77 = shl nuw i32 1, %72
  %78 = trunc i32 %77 to i8
  %79 = xor i8 %78, -1
  %80 = and i8 %76, %79
  store i8 %80, i8 addrspace(1)* %75, align 1, !tbaa !22
  br label %81

81:                                               ; preds = %64, %65, %46, %51
  %82 = add i32 %36, %39
  %83 = sext i32 %82 to i64
  %84 = icmp ult i64 %83, %8
  br i1 %84, label %37, label %85, !llvm.loop !23

85:                                               ; preds = %81, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = !{!18, !18, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
