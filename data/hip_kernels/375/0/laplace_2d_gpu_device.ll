; ModuleID = '../data/hip_kernels/375/0/main.cu'
source_filename = "../data/hip_kernels/375/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14laplace_2d_gpuPdS_ii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = icmp eq i32 %16, 0
  br i1 %25, label %68, label %26

26:                                               ; preds = %4
  %27 = add nsw i32 %2, 1
  %28 = icmp ult i32 %16, %27
  %29 = icmp ne i32 %24, 0
  %30 = select i1 %28, i1 %29, i1 false
  %31 = add nsw i32 %3, 1
  %32 = icmp ult i32 %24, %31
  %33 = select i1 %30, i1 %32, i1 false
  br i1 %33, label %34, label %68

34:                                               ; preds = %26
  %35 = udiv i32 %14, %11
  %36 = mul i32 %35, %11
  %37 = icmp ugt i32 %14, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %11
  %41 = mul i32 %40, %24
  %42 = add i32 %41, %16
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %1, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !16, !amdgpu.noclobber !6
  %46 = fmul contract double %45, 4.000000e+00
  %47 = add i32 %42, -1
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !16, !amdgpu.noclobber !6
  %51 = add i32 %42, 1
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !16, !amdgpu.noclobber !6
  %55 = fadd contract double %50, %54
  %56 = sub i32 %42, %40
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !16, !amdgpu.noclobber !6
  %60 = fadd contract double %55, %59
  %61 = add i32 %42, %40
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !16, !amdgpu.noclobber !6
  %65 = fadd contract double %60, %64
  %66 = fsub contract double %46, %65
  %67 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  store double %66, double addrspace(1)* %67, align 8, !tbaa !16
  br label %68

68:                                               ; preds = %34, %26, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
