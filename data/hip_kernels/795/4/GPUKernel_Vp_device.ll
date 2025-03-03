; ModuleID = '../data/hip_kernels/795/4/main.cu'
source_filename = "../data/hip_kernels/795/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12GPUKernel_VpiiPdS_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 16
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 8, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %5
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = add i32 %19, %20
  %22 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %27
  %29 = mul i32 %1, %1
  %30 = mul nsw i32 %29, %1
  %31 = icmp slt i32 %28, %30
  br i1 %31, label %32, label %70

32:                                               ; preds = %4
  %33 = srem i32 %28, %1
  %34 = sub nsw i32 %28, %33
  %35 = srem i32 %34, %29
  %36 = sdiv i32 %35, %1
  %37 = mul nsw i32 %36, %1
  %38 = sub nsw i32 %34, %37
  %39 = sdiv i32 %38, %29
  %40 = icmp slt i32 %36, %0
  %41 = icmp sgt i32 %33, %39
  %42 = select i1 %40, i1 true, i1 %41
  br i1 %42, label %70, label %43

43:                                               ; preds = %32
  %44 = add nsw i32 %39, 1
  %45 = mul nsw i32 %44, %39
  %46 = sdiv i32 %45, 2
  %47 = add nsw i32 %1, 1
  %48 = mul nsw i32 %47, %1
  %49 = sdiv i32 %48, 2
  %50 = sub nsw i32 %36, %0
  %51 = mul i32 %29, %50
  %52 = mul nsw i32 %33, %1
  %53 = add i32 %39, %52
  %54 = add i32 %53, %51
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %2, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !16, !amdgpu.noclobber !14
  %58 = mul nsw i32 %39, %1
  %59 = add i32 %58, %33
  %60 = add i32 %59, %51
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %2, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !16, !amdgpu.noclobber !14
  %64 = fadd contract double %57, %63
  %65 = mul nsw i32 %50, %49
  %66 = add i32 %65, %33
  %67 = add i32 %66, %46
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %3, i64 %68
  store double %64, double addrspace(1)* %69, align 8, !tbaa !16
  br label %70

70:                                               ; preds = %43, %32, %4
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
