; ModuleID = '../data/hip_kernels/2818/15/main.cu'
source_filename = "../data/hip_kernels/2818/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z43_bcnn_backward_depthwise_conv_weight_kerneliPfS_iiiiiiiiiS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, float addrspace(1)* nocapture %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !6
  %23 = mul i32 %14, %19
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  br i1 %26, label %27, label %111

27:                                               ; preds = %13
  %28 = mul i32 %9, %9
  %29 = icmp sgt i32 %9, 0
  %30 = udiv i32 %22, %19
  %31 = mul i32 %30, %19
  %32 = icmp ugt i32 %22, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %19
  br label %36

36:                                               ; preds = %27, %108
  %37 = phi i32 [ %25, %27 ], [ %109, %108 ]
  %38 = sdiv i32 %37, %7
  %39 = sdiv i32 %38, %8
  %40 = srem i32 %39, %4
  br i1 %29, label %41, label %108

41:                                               ; preds = %36
  %42 = mul i32 %28, %40
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %12, i64 %43
  %45 = freeze i32 %37
  %46 = freeze i32 %8
  %47 = sdiv i32 %45, %46
  %48 = mul i32 %47, %46
  %49 = sub i32 %45, %48
  %50 = srem i32 %47, %7
  %51 = sdiv i32 %37, %4
  %52 = sdiv i32 %51, %7
  %53 = sdiv i32 %52, %8
  %54 = add nsw i32 %50, %11
  %55 = add nsw i32 %49, %11
  %56 = mul nsw i32 %53, %4
  %57 = add nsw i32 %40, %56
  %58 = mul nsw i32 %57, %5
  %59 = sext i32 %37 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  br label %61

61:                                               ; preds = %41, %105
  %62 = phi float addrspace(1)* [ %44, %41 ], [ %102, %105 ]
  %63 = phi i32 [ 0, %41 ], [ %106, %105 ]
  %64 = sub i32 %54, %63
  %65 = freeze i32 %64
  %66 = freeze i32 %10
  %67 = sdiv i32 %65, %66
  %68 = mul i32 %67, %66
  %69 = sub i32 %65, %68
  %70 = icmp eq i32 %69, 0
  br label %71

71:                                               ; preds = %61, %101
  %72 = phi float addrspace(1)* [ %62, %61 ], [ %102, %101 ]
  %73 = phi i32 [ 0, %61 ], [ %103, %101 ]
  %74 = sub i32 %55, %73
  br i1 %70, label %75, label %101

75:                                               ; preds = %71
  %76 = freeze i32 %74
  %77 = freeze i32 %10
  %78 = sdiv i32 %76, %77
  %79 = mul i32 %78, %77
  %80 = sub i32 %76, %79
  %81 = icmp eq i32 %80, 0
  %82 = icmp sgt i32 %67, -1
  %83 = and i1 %81, %82
  br i1 %83, label %84, label %101

84:                                               ; preds = %75
  %85 = icmp slt i32 %67, %5
  %86 = icmp sgt i32 %78, -1
  %87 = select i1 %85, i1 %86, i1 false
  %88 = icmp slt i32 %78, %6
  %89 = select i1 %87, i1 %88, i1 false
  br i1 %89, label %90, label %101

90:                                               ; preds = %84
  %91 = add nsw i32 %67, %58
  %92 = mul nsw i32 %91, %6
  %93 = add nsw i32 %92, %78
  %94 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %95 = sext i32 %93 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = fmul contract float %94, %97
  %99 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %100 = fadd contract float %99, %98
  store float %100, float addrspace(1)* %72, align 4, !tbaa !16
  br label %101

101:                                              ; preds = %84, %90, %75, %71
  %102 = getelementptr inbounds float, float addrspace(1)* %72, i64 1
  %103 = add nuw nsw i32 %73, 1
  %104 = icmp eq i32 %103, %9
  br i1 %104, label %105, label %71, !llvm.loop !20

105:                                              ; preds = %101
  %106 = add nuw nsw i32 %63, 1
  %107 = icmp eq i32 %106, %9
  br i1 %107, label %108, label %61, !llvm.loop !22

108:                                              ; preds = %105, %36
  %109 = add i32 %35, %37
  %110 = icmp slt i32 %109, %0
  br i1 %110, label %36, label %111, !llvm.loop !23

111:                                              ; preds = %108, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
