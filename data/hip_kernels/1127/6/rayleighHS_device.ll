; ModuleID = '../data/hip_kernels/1127/6/main.cu'
source_filename = "../data/hip_kernels/1127/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10rayleighHSPdS_S_S_ddddi(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double %4, double %5, double %6, double %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 16
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 8, !tbaa !7
  %22 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %21, %25
  %27 = icmp slt i32 %18, %8
  br i1 %27, label %28, label %81

28:                                               ; preds = %9
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %30 = mul i32 %26, %25
  %31 = icmp ugt i32 %21, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %26, %32
  %34 = mul i32 %33, %18
  %35 = add nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !16, !amdgpu.noclobber !5
  %39 = sext i32 %34 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %2, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16, !amdgpu.noclobber !5
  %42 = fmul contract double %41, %6
  %43 = load double, double addrspace(1)* %3, align 8, !tbaa !16, !amdgpu.noclobber !5
  %44 = fneg contract double %43
  %45 = getelementptr inbounds double, double addrspace(1)* %3, i64 1
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !16, !amdgpu.noclobber !5
  %47 = fsub contract double %44, %46
  %48 = fmul contract double %42, %47
  %49 = fsub contract double %38, %48
  %50 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !16, !amdgpu.noclobber !5
  %52 = fadd contract double %51, %49
  %53 = fmul contract double %52, 5.000000e-01
  %54 = add i32 %34, %29
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !16, !amdgpu.noclobber !5
  %58 = fdiv contract double %57, %53
  %59 = fsub contract double %58, %5
  %60 = fsub contract double 1.000000e+00, %5
  %61 = fdiv contract double %59, %60
  %62 = tail call double @llvm.maxnum.f64(double %61, double 0.000000e+00)
  %63 = fmul contract double %62, %4
  %64 = mul i32 %54, 3
  %65 = fmul contract double %63, %7
  %66 = fadd contract double %65, 1.000000e+00
  %67 = sext i32 %64 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !16
  %70 = fdiv contract double %69, %66
  store double %70, double addrspace(1)* %68, align 8, !tbaa !16
  %71 = add i32 %64, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %0, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !16
  %75 = fdiv contract double %74, %66
  store double %75, double addrspace(1)* %73, align 8, !tbaa !16
  %76 = add i32 %64, 2
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %0, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !16
  %80 = fdiv contract double %79, %66
  store double %80, double addrspace(1)* %78, align 8, !tbaa !16
  br label %81

81:                                               ; preds = %28, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !12, i64 16}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
