; ModuleID = '../data/hip_kernels/4449/10/main.cu'
source_filename = "../data/hip_kernels/4449/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15makeKernelPhasePfiiS_(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
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
  %23 = getelementptr inbounds float, float addrspace(1)* %3, i64 1
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !16, !amdgpu.noclobber !5
  %25 = load float, float addrspace(1)* %3, align 4, !tbaa !16, !amdgpu.noclobber !5
  %26 = fdiv contract float %24, %25
  %27 = getelementptr inbounds float, float addrspace(1)* %3, i64 2
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16, !amdgpu.noclobber !5
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 3
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = fdiv contract float %28, %30
  %32 = mul nsw i32 %2, %1
  %33 = icmp slt i32 %22, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %4
  %35 = sdiv i32 %1, 2
  %36 = sitofp i32 %1 to float
  %37 = fmul contract float %31, %31
  br label %39

38:                                               ; preds = %86, %4
  ret void

39:                                               ; preds = %34, %86
  %40 = phi i32 [ %22, %34 ], [ %90, %86 ]
  %41 = freeze i32 %40
  %42 = freeze i32 %1
  %43 = sdiv i32 %41, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %41, %44
  %46 = icmp sgt i32 %45, %35
  %47 = select i1 %46, i32 %1, i32 0
  %48 = sub nsw i32 %45, %47
  %49 = icmp sgt i32 %43, %35
  %50 = select i1 %49, i32 %1, i32 0
  %51 = sub nsw i32 %43, %50
  %52 = sitofp i32 %48 to float
  %53 = fmul contract float %26, %52
  %54 = fdiv contract float %53, %36
  %55 = sitofp i32 %51 to float
  %56 = fmul contract float %26, %55
  %57 = fdiv contract float %56, %36
  %58 = fmul contract float %54, %54
  %59 = fsub contract float %37, %58
  %60 = fmul contract float %57, %57
  %61 = fsub contract float %59, %60
  %62 = fcmp contract ult float %61, 0.000000e+00
  br i1 %62, label %86, label %63

63:                                               ; preds = %39
  %64 = fcmp olt float %61, 0x39F0000000000000
  %65 = select i1 %64, float 0x41F0000000000000, float 1.000000e+00
  %66 = fmul float %61, %65
  %67 = tail call float @llvm.sqrt.f32(float %66)
  %68 = bitcast float %67 to i32
  %69 = add nsw i32 %68, -1
  %70 = bitcast i32 %69 to float
  %71 = add nsw i32 %68, 1
  %72 = bitcast i32 %71 to float
  %73 = tail call i1 @llvm.amdgcn.class.f32(float %66, i32 608)
  %74 = select i1 %64, float 0x3EF0000000000000, float 1.000000e+00
  %75 = fneg float %72
  %76 = tail call float @llvm.fma.f32(float %75, float %67, float %66)
  %77 = fcmp ogt float %76, 0.000000e+00
  %78 = fneg float %70
  %79 = tail call float @llvm.fma.f32(float %78, float %67, float %66)
  %80 = fcmp ole float %79, 0.000000e+00
  %81 = select i1 %80, float %70, float %67
  %82 = select i1 %77, float %72, float %81
  %83 = fmul float %74, %82
  %84 = select i1 %73, float %66, float %83
  %85 = fsub contract float %84, %31
  br label %86

86:                                               ; preds = %39, %63
  %87 = phi contract float [ %85, %63 ], [ 0.000000e+00, %39 ]
  %88 = sext i32 %40 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  store float %87, float addrspace(1)* %89, align 4, !tbaa !16
  %90 = add nsw i32 %40, %20
  %91 = icmp slt i32 %90, %32
  br i1 %91, label %39, label %38, !llvm.loop !20
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
