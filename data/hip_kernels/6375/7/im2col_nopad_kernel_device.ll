; ModuleID = '../data/hip_kernels/6375/7/main.cu'
source_filename = "../data/hip_kernels/6375/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19im2col_nopad_kernelPfiiiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = sub nsw i32 %2, %4
  %9 = sdiv i32 %8, %5
  %10 = add nsw i32 %9, 1
  %11 = sub nsw i32 %3, %4
  %12 = sdiv i32 %11, %5
  %13 = add nsw i32 %12, 1
  %14 = mul nsw i32 %4, %1
  %15 = mul nsw i32 %14, %4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !4
  %22 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %21, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %21, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %17
  %32 = add i32 %31, %16
  %33 = mul i32 %32, %25
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %35 = add i32 %33, %34
  %36 = mul i32 %10, %15
  %37 = mul i32 %36, %13
  %38 = icmp slt i32 %35, %37
  br i1 %38, label %39, label %82

39:                                               ; preds = %7
  %40 = freeze i32 %35
  %41 = freeze i32 %13
  %42 = sdiv i32 %40, %41
  %43 = mul i32 %42, %41
  %44 = sub i32 %40, %43
  %45 = freeze i32 %10
  %46 = sdiv i32 %42, %45
  %47 = mul i32 %46, %45
  %48 = sub i32 %42, %47
  %49 = srem i32 %46, %15
  %50 = freeze i32 %49
  %51 = freeze i32 %4
  %52 = sdiv i32 %50, %51
  %53 = mul i32 %52, %51
  %54 = sub i32 %50, %53
  %55 = freeze i32 %4
  %56 = sdiv i32 %52, %55
  %57 = mul i32 %56, %55
  %58 = sub i32 %52, %57
  %59 = mul nsw i32 %48, %5
  %60 = add nsw i32 %58, %59
  %61 = mul nsw i32 %44, %5
  %62 = add nsw i32 %54, %61
  %63 = icmp sgt i32 %60, -1
  %64 = icmp sgt i32 %62, -1
  %65 = select i1 %63, i1 %64, i1 false
  %66 = icmp slt i32 %60, %2
  %67 = select i1 %65, i1 %66, i1 false
  %68 = icmp slt i32 %62, %3
  %69 = select i1 %67, i1 %68, i1 false
  br i1 %69, label %70, label %78

70:                                               ; preds = %39
  %71 = mul nsw i32 %56, %2
  %72 = add nsw i32 %71, %60
  %73 = mul nsw i32 %72, %3
  %74 = add nsw i32 %73, %62
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %78

78:                                               ; preds = %39, %70
  %79 = phi contract float [ %77, %70 ], [ 0.000000e+00, %39 ]
  %80 = sext i32 %35 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %6, i64 %80
  store float %79, float addrspace(1)* %81, align 4, !tbaa !16
  br label %82

82:                                               ; preds = %7, %78
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
!4 = !{!5, !9, i64 12}
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
