; ModuleID = '../data/hip_kernels/4449/8/main.cu'
source_filename = "../data/hip_kernels/4449/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10makeKernelPfiiS_f(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %10
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %10
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %15, %22
  %24 = getelementptr inbounds float, float addrspace(1)* %3, i64 1
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !16, !amdgpu.noclobber !5
  %26 = load float, float addrspace(1)* %3, align 4, !tbaa !16, !amdgpu.noclobber !5
  %27 = getelementptr inbounds float, float addrspace(1)* %3, i64 2
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16, !amdgpu.noclobber !5
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 3
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = fdiv contract float %25, %26
  %32 = fmul contract float %31, %4
  %33 = fdiv contract float %28, %30
  %34 = mul nsw i32 %2, %1
  %35 = icmp slt i32 %23, %34
  br i1 %35, label %36, label %39

36:                                               ; preds = %5
  %37 = sdiv i32 %1, 2
  %38 = fmul contract float %33, %33
  br label %40

39:                                               ; preds = %81, %5
  ret void

40:                                               ; preds = %36, %81
  %41 = phi i32 [ %23, %36 ], [ %85, %81 ]
  %42 = freeze i32 %41
  %43 = freeze i32 %1
  %44 = sdiv i32 %42, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %42, %45
  %47 = sub nsw i32 %46, %37
  %48 = sitofp i32 %47 to float
  %49 = fmul contract float %32, %48
  %50 = sub nsw i32 %44, %37
  %51 = sitofp i32 %50 to float
  %52 = fmul contract float %32, %51
  %53 = fmul contract float %49, %49
  %54 = fsub contract float %38, %53
  %55 = fmul contract float %52, %52
  %56 = fsub contract float %54, %55
  %57 = fcmp contract ult float %56, 0.000000e+00
  br i1 %57, label %81, label %58

58:                                               ; preds = %40
  %59 = fcmp olt float %56, 0x39F0000000000000
  %60 = select i1 %59, float 0x41F0000000000000, float 1.000000e+00
  %61 = fmul float %56, %60
  %62 = tail call float @llvm.sqrt.f32(float %61)
  %63 = bitcast float %62 to i32
  %64 = add nsw i32 %63, -1
  %65 = bitcast i32 %64 to float
  %66 = add nsw i32 %63, 1
  %67 = bitcast i32 %66 to float
  %68 = tail call i1 @llvm.amdgcn.class.f32(float %61, i32 608)
  %69 = select i1 %59, float 0x3EF0000000000000, float 1.000000e+00
  %70 = fneg float %67
  %71 = tail call float @llvm.fma.f32(float %70, float %62, float %61)
  %72 = fcmp ogt float %71, 0.000000e+00
  %73 = fneg float %65
  %74 = tail call float @llvm.fma.f32(float %73, float %62, float %61)
  %75 = fcmp ole float %74, 0.000000e+00
  %76 = select i1 %75, float %65, float %62
  %77 = select i1 %72, float %67, float %76
  %78 = fmul float %69, %77
  %79 = select i1 %68, float %61, float %78
  %80 = fsub contract float %79, %33
  br label %81

81:                                               ; preds = %40, %58
  %82 = phi contract float [ %80, %58 ], [ 0.000000e+00, %40 ]
  %83 = sext i32 %41 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  store float %82, float addrspace(1)* %84, align 4, !tbaa !16
  %85 = add nsw i32 %41, %21
  %86 = icmp slt i32 %85, %34
  br i1 %86, label %40, label %39, !llvm.loop !20
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
