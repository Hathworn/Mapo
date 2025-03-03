; ModuleID = '../data/hip_kernels/795/0/main.cu'
source_filename = "../data/hip_kernels/795/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20GPUKernel_VpVm_tilediiiiPdS_S_(i32 %0, i32 %1, i32 %2, i32 %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5, double addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 16
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 8, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = add i32 %22, %23
  %25 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !13, !invariant.load !14
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %30
  %32 = mul nsw i32 %3, %3
  %33 = mul nsw i32 %32, %2
  %34 = icmp slt i32 %31, %33
  br i1 %34, label %35, label %74

35:                                               ; preds = %7
  %36 = srem i32 %31, %3
  %37 = sub nsw i32 %31, %36
  %38 = srem i32 %37, %32
  %39 = sdiv i32 %38, %3
  %40 = icmp sgt i32 %36, %39
  br i1 %40, label %74, label %41

41:                                               ; preds = %35
  %42 = mul nsw i32 %39, %3
  %43 = sub nsw i32 %37, %42
  %44 = sdiv i32 %43, %32
  %45 = add nsw i32 %44, %1
  %46 = icmp slt i32 %45, %0
  br i1 %46, label %74, label %47

47:                                               ; preds = %41
  %48 = add nsw i32 %39, 1
  %49 = mul nsw i32 %48, %39
  %50 = sdiv i32 %49, 2
  %51 = add nsw i32 %50, %36
  %52 = add nsw i32 %3, 1
  %53 = mul nsw i32 %52, %3
  %54 = sdiv i32 %53, 2
  %55 = mul nsw i32 %44, %32
  %56 = mul nsw i32 %36, %3
  %57 = add i32 %39, %56
  %58 = add i32 %57, %55
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %4, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !16, !amdgpu.noclobber !14
  %62 = sext i32 %31 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %4, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !16, !amdgpu.noclobber !14
  %65 = fadd contract double %61, %64
  %66 = mul nsw i32 %44, %54
  %67 = add nsw i32 %51, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %5, i64 %68
  store double %65, double addrspace(1)* %69, align 8, !tbaa !16
  %70 = load double, double addrspace(1)* %60, align 8, !tbaa !16
  %71 = load double, double addrspace(1)* %63, align 8, !tbaa !16
  %72 = fsub contract double %70, %71
  %73 = getelementptr inbounds double, double addrspace(1)* %6, i64 %68
  store double %72, double addrspace(1)* %73, align 8, !tbaa !16
  br label %74

74:                                               ; preds = %35, %41, %47, %7
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
