; ModuleID = '../data/hip_kernels/8192/384/main.cu'
source_filename = "../data/hip_kernels/8192/384/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z40RetinaTransform_HaveAtLeastOneValueTherePfS_iiS_iS_iiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = udiv i32 %18, %15
  %22 = mul i32 %21, %15
  %23 = icmp ugt i32 %18, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %20
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %19
  %29 = mul i32 %28, %15
  %30 = add i32 %29, %27
  %31 = sitofp i32 %2 to float
  %32 = sitofp i32 %3 to float
  %33 = icmp slt i32 %30, %5
  br i1 %33, label %34, label %90

34:                                               ; preds = %10
  %35 = add nsw i32 %2, -1
  %36 = add nsw i32 %3, -1
  %37 = tail call i32 @llvm.smin.i32(i32 %35, i32 %36)
  %38 = tail call float @llvm.minnum.f32(float %31, float %32)
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !5
  %41 = fmul contract float %38, %40
  %42 = fptosi float %41 to i32
  %43 = tail call i32 @llvm.smax.i32(i32 %42, i32 1)
  %44 = tail call i32 @llvm.smin.i32(i32 %37, i32 %43)
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !5
  %47 = fadd contract float %46, 1.000000e+00
  %48 = fmul contract float %47, %32
  %49 = fmul contract float %48, 5.000000e-01
  %50 = fptosi float %49 to i32
  %51 = load float, float addrspace(1)* %0, align 4, !tbaa !16, !amdgpu.noclobber !5
  %52 = fadd contract float %51, 1.000000e+00
  %53 = fmul contract float %52, %31
  %54 = fmul contract float %53, 5.000000e-01
  %55 = fptosi float %54 to i32
  %56 = sext i32 %30 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  store float 0.000000e+00, float addrspace(1)* %57, align 4, !tbaa !16
  %58 = mul nsw i32 %30, %8
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %6, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %62 = sitofp i32 %44 to float
  %63 = fmul contract float %61, %62
  %64 = add nsw i32 %58, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %6, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = fmul contract float %67, %62
  %69 = sitofp i32 %55 to float
  %70 = fadd contract float %63, %69
  %71 = fptosi float %70 to i32
  %72 = sitofp i32 %50 to float
  %73 = fadd contract float %68, %72
  %74 = fptosi float %73 to i32
  %75 = icmp slt i32 %71, %2
  br i1 %75, label %76, label %90

76:                                               ; preds = %34
  %77 = icmp slt i32 %74, %3
  %78 = or i32 %71, %74
  %79 = icmp sgt i32 %78, -1
  %80 = select i1 %77, i1 %79, i1 false
  br i1 %80, label %81, label %90

81:                                               ; preds = %76
  %82 = mul nsw i32 %74, %2
  %83 = add nsw i32 %82, %71
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  store float %86, float addrspace(1)* %57, align 4, !tbaa !16
  %87 = atomicrmw fadd float addrspace(1)* %57, float %86 syncscope("agent-one-as") monotonic, align 4
  %88 = getelementptr inbounds float, float addrspace(1)* %9, i64 %56
  %89 = atomicrmw fadd float addrspace(1)* %88, float 1.000000e+00 syncscope("agent-one-as") monotonic, align 4
  br label %90

90:                                               ; preds = %34, %76, %81, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
