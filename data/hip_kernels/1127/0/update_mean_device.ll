; ModuleID = '../data/hip_kernels/1127/0/main.cu'
source_filename = "../data/hip_kernels/1127/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11update_meanPdS_S_S_S_S_S_S_ii(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture readonly %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 16
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 8, !tbaa !7
  %23 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %22, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %22, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %33 = icmp slt i32 %19, %9
  br i1 %33, label %34, label %107

34:                                               ; preds = %10
  %35 = sitofp i32 %8 to double
  %36 = fdiv contract double 1.000000e+00, %35
  %37 = mul i32 %31, %19
  %38 = add i32 %37, %32
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16, !amdgpu.noclobber !5
  %42 = add nsw i32 %8, -1
  %43 = sitofp i32 %42 to double
  %44 = fmul contract double %41, %43
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !16, !amdgpu.noclobber !5
  %47 = fadd contract double %44, %46
  %48 = fmul contract double %36, %47
  store double %48, double addrspace(1)* %40, align 8, !tbaa !16
  %49 = getelementptr inbounds double, double addrspace(1)* %2, i64 %39
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !16
  %51 = fmul contract double %50, %43
  %52 = getelementptr inbounds double, double addrspace(1)* %3, i64 %39
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16
  %54 = fadd contract double %51, %53
  %55 = fmul contract double %36, %54
  store double %55, double addrspace(1)* %49, align 8, !tbaa !16
  %56 = mul i32 %38, 3
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %4, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !16
  %60 = fmul contract double %59, %43
  %61 = getelementptr inbounds double, double addrspace(1)* %5, i64 %57
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !16
  %63 = fadd contract double %60, %62
  %64 = fadd contract double %63, 0.000000e+00
  %65 = fmul contract double %36, %64
  store double %65, double addrspace(1)* %58, align 8, !tbaa !16
  %66 = add nsw i32 %56, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %4, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !16
  %70 = fmul contract double %69, %43
  %71 = getelementptr inbounds double, double addrspace(1)* %5, i64 %67
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !16
  %73 = fadd contract double %70, %72
  %74 = fmul contract double %36, %73
  store double %74, double addrspace(1)* %68, align 8, !tbaa !16
  %75 = add nsw i32 %56, 2
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %4, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !16
  %79 = fmul contract double %78, %43
  %80 = getelementptr inbounds double, double addrspace(1)* %5, i64 %76
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !16
  %82 = fadd contract double %79, %81
  %83 = fmul contract double %36, %82
  store double %83, double addrspace(1)* %77, align 8, !tbaa !16
  %84 = add nsw i32 %31, 1
  %85 = mul nsw i32 %84, %19
  %86 = add nsw i32 %85, %32
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %6, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !16
  %90 = fmul contract double %89, %43
  %91 = getelementptr inbounds double, double addrspace(1)* %7, i64 %87
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !16
  %93 = fadd contract double %90, %92
  %94 = fmul contract double %36, %93
  store double %94, double addrspace(1)* %88, align 8, !tbaa !16
  %95 = add nsw i32 %31, -1
  %96 = icmp eq i32 %32, %95
  br i1 %96, label %97, label %107

97:                                               ; preds = %34
  %98 = add nsw i32 %86, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %6, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %102 = fmul contract double %101, %43
  %103 = getelementptr inbounds double, double addrspace(1)* %7, i64 %99
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !16
  %105 = fadd contract double %102, %104
  %106 = fmul contract double %36, %105
  store double %106, double addrspace(1)* %100, align 8, !tbaa !16
  br label %107

107:                                              ; preds = %34, %97, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
