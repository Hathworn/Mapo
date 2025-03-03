; ModuleID = '../data/hip_kernels/795/2/main.cu'
source_filename = "../data/hip_kernels/795/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14GPUKernel_VpVmiiPdS_S_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 8, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = add i32 %20, %21
  %23 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !13, !invariant.load !14
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = mul nsw i32 %1, %1
  %31 = mul nsw i32 %30, %1
  %32 = icmp slt i32 %29, %31
  br i1 %32, label %33, label %75

33:                                               ; preds = %5
  %34 = srem i32 %29, %1
  %35 = sub nsw i32 %29, %34
  %36 = srem i32 %35, %30
  %37 = sdiv i32 %36, %1
  %38 = icmp slt i32 %37, %0
  br i1 %38, label %75, label %39

39:                                               ; preds = %33
  %40 = sub nsw i32 %37, %0
  %41 = mul nsw i32 %37, %1
  %42 = sub nsw i32 %35, %41
  %43 = sdiv i32 %42, %30
  %44 = icmp sgt i32 %34, %43
  br i1 %44, label %75, label %45

45:                                               ; preds = %39
  %46 = add nsw i32 %43, 1
  %47 = mul nsw i32 %46, %43
  %48 = sdiv i32 %47, 2
  %49 = add nsw i32 %1, 1
  %50 = mul nsw i32 %49, %1
  %51 = sdiv i32 %50, 2
  %52 = mul nsw i32 %40, %30
  %53 = mul nsw i32 %34, %1
  %54 = add nsw i32 %52, %53
  %55 = add nsw i32 %54, %43
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %2, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !16, !amdgpu.noclobber !14
  %59 = mul nsw i32 %43, %1
  %60 = add i32 %52, %34
  %61 = add i32 %60, %59
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %2, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !16, !amdgpu.noclobber !14
  %65 = fadd contract double %58, %64
  %66 = mul nsw i32 %40, %51
  %67 = add i32 %66, %34
  %68 = add i32 %67, %48
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %3, i64 %69
  store double %65, double addrspace(1)* %70, align 8, !tbaa !16
  %71 = load double, double addrspace(1)* %57, align 8, !tbaa !16
  %72 = load double, double addrspace(1)* %63, align 8, !tbaa !16
  %73 = fsub contract double %71, %72
  %74 = getelementptr inbounds double, double addrspace(1)* %4, i64 %69
  store double %73, double addrspace(1)* %74, align 8, !tbaa !16
  br label %75

75:                                               ; preds = %33, %39, %45, %5
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
!4 = !{!5, !9, i64 16}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
