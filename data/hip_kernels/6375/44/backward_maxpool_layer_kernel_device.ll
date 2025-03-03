; ModuleID = '../data/hip_kernels/6375/44/main.cu'
source_filename = "../data/hip_kernels/6375/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29backward_maxpool_layer_kerneliiiiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7, i32 addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = add nsw i32 %1, -1
  %11 = sdiv i32 %10, %4
  %12 = add nsw i32 %11, 1
  %13 = add nsw i32 %2, -1
  %14 = sdiv i32 %13, %4
  %15 = add nsw i32 %14, 1
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
  br i1 %38, label %39, label %102

39:                                               ; preds = %9
  %40 = freeze i32 %37
  %41 = freeze i32 %2
  %42 = sdiv i32 %40, %41
  %43 = xor i32 %5, -1
  %44 = sdiv i32 %43, 2
  %45 = add nsw i32 %44, 1
  %46 = sub i32 0, %17
  %47 = icmp slt i32 %17, 0
  br i1 %47, label %96, label %48

48:                                               ; preds = %39
  %49 = freeze i32 %42
  %50 = freeze i32 %1
  %51 = sdiv i32 %49, %50
  %52 = freeze i32 %51
  %53 = mul i32 %51, %50
  %54 = sub i32 %49, %53
  %55 = mul i32 %42, %41
  %56 = sub i32 %40, %55
  %57 = sub nsw i32 %56, %45
  %58 = sub nsw i32 %54, %45
  %59 = mul nsw i32 %52, %12
  %60 = sdiv i32 %57, %4
  %61 = sdiv i32 %58, %4
  br label %62

62:                                               ; preds = %48, %93
  %63 = phi float [ 0.000000e+00, %48 ], [ %90, %93 ]
  %64 = phi i32 [ %46, %48 ], [ %94, %93 ]
  %65 = add nsw i32 %61, %64
  %66 = add nsw i32 %65, %59
  %67 = mul nsw i32 %66, %15
  %68 = icmp sgt i32 %65, -1
  %69 = icmp sle i32 %65, %11
  br label %70

70:                                               ; preds = %62, %88
  %71 = phi float [ %63, %62 ], [ %90, %88 ]
  %72 = phi i32 [ %46, %62 ], [ %91, %88 ]
  %73 = add nsw i32 %60, %72
  %74 = add nsw i32 %67, %73
  %75 = icmp sgt i32 %73, -1
  br i1 %75, label %76, label %88

76:                                               ; preds = %70
  %77 = icmp sle i32 %73, %14
  %78 = select i1 %77, i1 %68, i1 false
  %79 = select i1 %78, i1 %69, i1 false
  br i1 %79, label %80, label %88

80:                                               ; preds = %76
  %81 = sext i32 %74 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !14
  %84 = icmp eq i32 %83, %37
  br i1 %84, label %85, label %88

85:                                               ; preds = %80
  %86 = getelementptr inbounds float, float addrspace(1)* %6, i64 %81
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !20, !amdgpu.noclobber !14
  br label %88

88:                                               ; preds = %70, %76, %80, %85
  %89 = phi contract float [ %87, %85 ], [ 0.000000e+00, %80 ], [ 0.000000e+00, %76 ], [ 0.000000e+00, %70 ]
  %90 = fadd contract float %71, %89
  %91 = add i32 %72, 1
  %92 = icmp eq i32 %72, %17
  br i1 %92, label %93, label %70, !llvm.loop !22

93:                                               ; preds = %88
  %94 = add i32 %64, 1
  %95 = icmp eq i32 %64, %17
  br i1 %95, label %96, label %62, !llvm.loop !24

96:                                               ; preds = %93, %39
  %97 = phi float [ 0.000000e+00, %39 ], [ %90, %93 ]
  %98 = sext i32 %37 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %7, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !20, !amdgpu.noclobber !14
  %101 = fadd contract float %97, %100
  store float %101, float addrspace(1)* %99, align 4, !tbaa !20
  br label %102

102:                                              ; preds = %9, %96
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
