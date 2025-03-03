; ModuleID = '../data/hip_kernels/2172/60/main.cu'
source_filename = "../data/hip_kernels/2172/60/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29backward_maxpool_layer_kerneliiiiiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, i32 addrspace(1)* nocapture readonly %9) local_unnamed_addr #0 {
  %11 = sub i32 %1, %5
  %12 = add i32 %11, %6
  %13 = sdiv i32 %12, %4
  %14 = add nsw i32 %13, 1
  %15 = sub i32 %2, %5
  %16 = add i32 %15, %6
  %17 = sdiv i32 %16, %4
  %18 = add nsw i32 %17, 1
  %19 = add nsw i32 %5, -1
  %20 = sdiv i32 %19, %4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !4
  %27 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !13, !invariant.load !14
  %30 = zext i16 %29 to i32
  %31 = udiv i32 %26, %30
  %32 = mul i32 %31, %30
  %33 = icmp ugt i32 %26, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %22
  %37 = add i32 %36, %21
  %38 = mul i32 %37, %30
  %39 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %40 = add i32 %38, %39
  %41 = icmp slt i32 %40, %0
  br i1 %41, label %42, label %103

42:                                               ; preds = %10
  %43 = freeze i32 %40
  %44 = freeze i32 %2
  %45 = sdiv i32 %43, %44
  %46 = sdiv i32 %6, -2
  %47 = sub i32 0, %20
  %48 = icmp slt i32 %20, 0
  br i1 %48, label %97, label %49

49:                                               ; preds = %42
  %50 = freeze i32 %45
  %51 = freeze i32 %1
  %52 = sdiv i32 %50, %51
  %53 = freeze i32 %52
  %54 = mul i32 %52, %51
  %55 = sub i32 %50, %54
  %56 = mul i32 %45, %44
  %57 = sub i32 %43, %56
  %58 = sub nsw i32 %57, %46
  %59 = sub nsw i32 %55, %46
  %60 = mul nsw i32 %53, %14
  %61 = sdiv i32 %58, %4
  %62 = sdiv i32 %59, %4
  br label %63

63:                                               ; preds = %49, %94
  %64 = phi float [ 0.000000e+00, %49 ], [ %91, %94 ]
  %65 = phi i32 [ %47, %49 ], [ %95, %94 ]
  %66 = add nsw i32 %62, %65
  %67 = add nsw i32 %66, %60
  %68 = mul nsw i32 %67, %18
  %69 = icmp sgt i32 %66, -1
  %70 = icmp sle i32 %66, %13
  br label %71

71:                                               ; preds = %63, %89
  %72 = phi float [ %64, %63 ], [ %91, %89 ]
  %73 = phi i32 [ %47, %63 ], [ %92, %89 ]
  %74 = add nsw i32 %61, %73
  %75 = add nsw i32 %68, %74
  %76 = icmp sgt i32 %74, -1
  br i1 %76, label %77, label %89

77:                                               ; preds = %71
  %78 = icmp sle i32 %74, %17
  %79 = select i1 %78, i1 %69, i1 false
  %80 = select i1 %79, i1 %70, i1 false
  br i1 %80, label %81, label %89

81:                                               ; preds = %77
  %82 = sext i32 %75 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !16, !amdgpu.noclobber !14
  %85 = icmp eq i32 %84, %40
  br i1 %85, label %86, label %89

86:                                               ; preds = %81
  %87 = getelementptr inbounds float, float addrspace(1)* %7, i64 %82
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !20, !amdgpu.noclobber !14
  br label %89

89:                                               ; preds = %71, %77, %81, %86
  %90 = phi contract float [ %88, %86 ], [ 0.000000e+00, %81 ], [ 0.000000e+00, %77 ], [ 0.000000e+00, %71 ]
  %91 = fadd contract float %72, %90
  %92 = add i32 %73, 1
  %93 = icmp eq i32 %73, %20
  br i1 %93, label %94, label %71, !llvm.loop !22

94:                                               ; preds = %89
  %95 = add i32 %65, 1
  %96 = icmp eq i32 %65, %20
  br i1 %96, label %97, label %63, !llvm.loop !24

97:                                               ; preds = %94, %42
  %98 = phi float [ 0.000000e+00, %42 ], [ %91, %94 ]
  %99 = sext i32 %40 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %8, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !20, !amdgpu.noclobber !14
  %102 = fadd contract float %98, %101
  store float %102, float addrspace(1)* %100, align 4, !tbaa !20
  br label %103

103:                                              ; preds = %10, %97
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
