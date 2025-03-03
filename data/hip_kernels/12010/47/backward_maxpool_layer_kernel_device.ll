; ModuleID = '../data/hip_kernels/12010/47/main.cu'
source_filename = "../data/hip_kernels/12010/47/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29backward_maxpool_layer_kerneliiiiiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, i32 addrspace(1)* nocapture readonly %9) local_unnamed_addr #0 {
  %11 = shl nsw i32 %6, 1
  %12 = add nsw i32 %11, %1
  %13 = sdiv i32 %12, %4
  %14 = add nsw i32 %11, %2
  %15 = sdiv i32 %14, %4
  %16 = add nsw i32 %5, -1
  %17 = sdiv i32 %16, %4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !4
  %24 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %23, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %19
  %34 = add i32 %33, %18
  %35 = mul i32 %34, %27
  %36 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %37 = add i32 %35, %36
  %38 = icmp slt i32 %37, %0
  br i1 %38, label %39, label %99

39:                                               ; preds = %10
  %40 = freeze i32 %37
  %41 = freeze i32 %2
  %42 = sdiv i32 %40, %41
  %43 = sub i32 0, %17
  %44 = icmp slt i32 %17, 0
  br i1 %44, label %93, label %45

45:                                               ; preds = %39
  %46 = freeze i32 %42
  %47 = freeze i32 %1
  %48 = sdiv i32 %46, %47
  %49 = freeze i32 %48
  %50 = mul i32 %48, %47
  %51 = sub i32 %46, %50
  %52 = mul i32 %42, %41
  %53 = sub i32 %40, %52
  %54 = add nsw i32 %53, %6
  %55 = add nsw i32 %51, %6
  %56 = mul nsw i32 %49, %13
  %57 = sdiv i32 %54, %4
  %58 = sdiv i32 %55, %4
  br label %59

59:                                               ; preds = %45, %90
  %60 = phi float [ 0.000000e+00, %45 ], [ %87, %90 ]
  %61 = phi i32 [ %43, %45 ], [ %91, %90 ]
  %62 = add nsw i32 %58, %61
  %63 = add nsw i32 %62, %56
  %64 = mul nsw i32 %63, %15
  %65 = icmp sgt i32 %62, -1
  %66 = icmp slt i32 %62, %13
  br label %67

67:                                               ; preds = %59, %85
  %68 = phi float [ %60, %59 ], [ %87, %85 ]
  %69 = phi i32 [ %43, %59 ], [ %88, %85 ]
  %70 = add nsw i32 %57, %69
  %71 = add nsw i32 %64, %70
  %72 = icmp sgt i32 %70, -1
  br i1 %72, label %73, label %85

73:                                               ; preds = %67
  %74 = icmp slt i32 %70, %15
  %75 = select i1 %74, i1 %65, i1 false
  %76 = select i1 %75, i1 %66, i1 false
  br i1 %76, label %77, label %85

77:                                               ; preds = %73
  %78 = sext i32 %71 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !16, !amdgpu.noclobber !14
  %81 = icmp eq i32 %80, %37
  br i1 %81, label %82, label %85

82:                                               ; preds = %77
  %83 = getelementptr inbounds float, float addrspace(1)* %7, i64 %78
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !20, !amdgpu.noclobber !14
  br label %85

85:                                               ; preds = %67, %73, %77, %82
  %86 = phi contract float [ %84, %82 ], [ 0.000000e+00, %77 ], [ 0.000000e+00, %73 ], [ 0.000000e+00, %67 ]
  %87 = fadd contract float %68, %86
  %88 = add i32 %69, 1
  %89 = icmp eq i32 %69, %17
  br i1 %89, label %90, label %67, !llvm.loop !22

90:                                               ; preds = %85
  %91 = add i32 %61, 1
  %92 = icmp eq i32 %61, %17
  br i1 %92, label %93, label %59, !llvm.loop !24

93:                                               ; preds = %90, %39
  %94 = phi float [ 0.000000e+00, %39 ], [ %87, %90 ]
  %95 = sext i32 %37 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %8, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !20, !amdgpu.noclobber !14
  %98 = fadd contract float %94, %97
  store float %98, float addrspace(1)* %96, align 4, !tbaa !20
  br label %99

99:                                               ; preds = %10, %93
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
