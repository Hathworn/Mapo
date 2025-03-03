; ModuleID = '../data/hip_kernels/4449/9/main.cu'
source_filename = "../data/hip_kernels/4449/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23makeKernel_nonefftshiftPfiiS_(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %9
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %9
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %14, %21
  %23 = load float, float addrspace(1)* %3, align 4, !tbaa !16, !amdgpu.noclobber !5
  %24 = getelementptr inbounds float, float addrspace(1)* %3, i64 1
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !16, !amdgpu.noclobber !5
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 2
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !16, !amdgpu.noclobber !5
  %28 = getelementptr inbounds float, float addrspace(1)* %3, i64 3
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !5
  %30 = getelementptr inbounds float, float addrspace(1)* %3, i64 4
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !5
  %32 = fdiv contract float 1.000000e+00, %31
  %33 = fdiv contract float %25, %23
  %34 = fmul contract float %33, %32
  %35 = fdiv contract float %27, %29
  %36 = mul nsw i32 %2, %1
  %37 = icmp slt i32 %22, %36
  br i1 %37, label %38, label %41

38:                                               ; preds = %4
  %39 = sdiv i32 %1, 2
  %40 = fmul contract float %35, %35
  br label %42

41:                                               ; preds = %87, %4
  ret void

42:                                               ; preds = %38, %87
  %43 = phi i32 [ %22, %38 ], [ %91, %87 ]
  %44 = freeze i32 %43
  %45 = freeze i32 %1
  %46 = sdiv i32 %44, %45
  %47 = mul i32 %46, %45
  %48 = sub i32 %44, %47
  %49 = icmp sgt i32 %48, %39
  %50 = select i1 %49, i32 %1, i32 0
  %51 = sub nsw i32 %48, %50
  %52 = icmp sgt i32 %46, %39
  %53 = select i1 %52, i32 %1, i32 0
  %54 = sub nsw i32 %46, %53
  %55 = sitofp i32 %51 to float
  %56 = fmul contract float %34, %55
  %57 = sitofp i32 %54 to float
  %58 = fmul contract float %34, %57
  %59 = fmul contract float %56, %56
  %60 = fsub contract float %40, %59
  %61 = fmul contract float %58, %58
  %62 = fsub contract float %60, %61
  %63 = fcmp contract ult float %62, 0.000000e+00
  br i1 %63, label %87, label %64

64:                                               ; preds = %42
  %65 = fcmp olt float %62, 0x39F0000000000000
  %66 = select i1 %65, float 0x41F0000000000000, float 1.000000e+00
  %67 = fmul float %62, %66
  %68 = tail call float @llvm.sqrt.f32(float %67)
  %69 = bitcast float %68 to i32
  %70 = add nsw i32 %69, -1
  %71 = bitcast i32 %70 to float
  %72 = add nsw i32 %69, 1
  %73 = bitcast i32 %72 to float
  %74 = tail call i1 @llvm.amdgcn.class.f32(float %67, i32 608)
  %75 = select i1 %65, float 0x3EF0000000000000, float 1.000000e+00
  %76 = fneg float %73
  %77 = tail call float @llvm.fma.f32(float %76, float %68, float %67)
  %78 = fcmp ogt float %77, 0.000000e+00
  %79 = fneg float %71
  %80 = tail call float @llvm.fma.f32(float %79, float %68, float %67)
  %81 = fcmp ole float %80, 0.000000e+00
  %82 = select i1 %81, float %71, float %68
  %83 = select i1 %78, float %73, float %82
  %84 = fmul float %75, %83
  %85 = select i1 %74, float %67, float %84
  %86 = fsub contract float %85, %35
  br label %87

87:                                               ; preds = %42, %64
  %88 = phi contract float [ %86, %64 ], [ 0.000000e+00, %42 ]
  %89 = sext i32 %43 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  store float %88, float addrspace(1)* %90, align 4, !tbaa !16
  %91 = add nsw i32 %43, %20
  %92 = icmp slt i32 %91, %36
  br i1 %92, label %42, label %41, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
