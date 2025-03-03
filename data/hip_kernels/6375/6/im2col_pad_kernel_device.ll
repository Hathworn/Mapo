; ModuleID = '../data/hip_kernels/6375/6/main.cu'
source_filename = "../data/hip_kernels/6375/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17im2col_pad_kernelPfiiiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = add nsw i32 %2, -1
  %9 = sdiv i32 %8, %5
  %10 = add nsw i32 %9, 1
  %11 = add nsw i32 %3, -1
  %12 = sdiv i32 %11, %5
  %13 = add nsw i32 %12, 1
  %14 = mul nsw i32 %4, %1
  %15 = mul nsw i32 %14, %4
  %16 = sdiv i32 %4, -2
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !4
  %23 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !13, !invariant.load !14
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %22, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %22, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %18
  %33 = add i32 %32, %17
  %34 = mul i32 %33, %26
  %35 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %36 = add i32 %34, %35
  %37 = mul i32 %10, %15
  %38 = mul i32 %37, %13
  %39 = icmp slt i32 %36, %38
  br i1 %39, label %40, label %85

40:                                               ; preds = %7
  %41 = freeze i32 %36
  %42 = freeze i32 %13
  %43 = sdiv i32 %41, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %41, %44
  %46 = freeze i32 %10
  %47 = sdiv i32 %43, %46
  %48 = mul i32 %47, %46
  %49 = sub i32 %43, %48
  %50 = srem i32 %47, %15
  %51 = freeze i32 %50
  %52 = freeze i32 %4
  %53 = sdiv i32 %51, %52
  %54 = mul i32 %53, %52
  %55 = sub i32 %51, %54
  %56 = freeze i32 %4
  %57 = sdiv i32 %53, %56
  %58 = mul i32 %57, %56
  %59 = sub i32 %53, %58
  %60 = mul nsw i32 %49, %5
  %61 = add i32 %60, %16
  %62 = add i32 %61, %59
  %63 = mul nsw i32 %45, %5
  %64 = add i32 %63, %16
  %65 = add i32 %64, %55
  %66 = icmp sgt i32 %62, -1
  %67 = icmp sgt i32 %65, -1
  %68 = select i1 %66, i1 %67, i1 false
  %69 = icmp slt i32 %62, %2
  %70 = select i1 %68, i1 %69, i1 false
  %71 = icmp slt i32 %65, %3
  %72 = select i1 %70, i1 %71, i1 false
  br i1 %72, label %73, label %81

73:                                               ; preds = %40
  %74 = mul nsw i32 %57, %2
  %75 = add nsw i32 %74, %62
  %76 = mul nsw i32 %75, %3
  %77 = add nsw i32 %76, %65
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %81

81:                                               ; preds = %40, %73
  %82 = phi contract float [ %80, %73 ], [ 0.000000e+00, %40 ]
  %83 = sext i32 %36 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %6, i64 %83
  store float %82, float addrspace(1)* %84, align 4, !tbaa !16
  br label %85

85:                                               ; preds = %7, %81
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
