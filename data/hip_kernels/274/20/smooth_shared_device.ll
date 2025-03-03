; ModuleID = '../data/hip_kernels/274/20/main.cu'
source_filename = "../data/hip_kernels/274/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13smooth_sharedPfPKf(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !6
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %7
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %14 = add i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !16, !amdgpu.noclobber !5
  %18 = add nuw nsw i32 %13, 1
  %19 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %18
  store float %17, float addrspace(3)* %19, align 4, !tbaa !16
  %20 = icmp eq i32 %13, 0
  br i1 %20, label %21, label %44

21:                                               ; preds = %2
  %22 = tail call i32 @llvm.smax.i32(i32 %12, i32 1)
  %23 = add nsw i32 %22, -1
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !16, !amdgpu.noclobber !5
  store float %26, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 0), align 4, !tbaa !16
  %27 = udiv i32 %10, %7
  %28 = mul i32 %27, %7
  %29 = icmp ugt i32 %10, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %7
  %33 = add nsw i32 %32, -1
  %34 = add i32 %12, %7
  %35 = sitofp i32 %33 to double
  %36 = uitofp i32 %34 to double
  %37 = tail call double @llvm.minnum.f64(double %35, double %36)
  %38 = fptosi double %37 to i32
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !5
  %42 = add nuw nsw i32 %7, 1
  %43 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %42
  store float %41, float addrspace(3)* %43, align 4, !tbaa !16
  br label %44

44:                                               ; preds = %21, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %13
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !16
  %47 = fmul contract float %46, 2.500000e-01
  %48 = load float, float addrspace(3)* %19, align 4, !tbaa !16
  %49 = fmul contract float %48, 5.000000e-01
  %50 = fadd contract float %47, %49
  %51 = add nuw nsw i32 %13, 2
  %52 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !16
  %54 = fmul contract float %53, 2.500000e-01
  %55 = fadd contract float %50, %54
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  store float %55, float addrspace(1)* %56, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
