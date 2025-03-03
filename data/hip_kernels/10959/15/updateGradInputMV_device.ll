; ModuleID = '../data/hip_kernels/10959/15/main.cu'
source_filename = "../data/hip_kernels/10959/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17updateGradInputMVPKfS0_S0_S0_S0_S0_llliPf(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i64 %6, i64 %7, i64 %8, i32 %9, float addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = zext i32 %12 to i64
  %14 = mul nsw i64 %13, %6
  %15 = getelementptr inbounds float, float addrspace(1)* %10, i64 %14
  %16 = mul nsw i64 %13, %8
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = getelementptr inbounds float, float addrspace(1)* %5, i64 %13
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !4, !amdgpu.noclobber !8
  %20 = fadd contract float %19, -5.000000e-01
  %21 = fptosi float %20 to i32
  %22 = shl nsw i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !4, !amdgpu.noclobber !8
  %26 = fadd contract float %25, -5.000000e-01
  %27 = fptosi float %26 to i32
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %4, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !4, !amdgpu.noclobber !8
  %31 = fadd contract float %30, 5.000000e-01
  %32 = fptosi float %31 to i32
  %33 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !4, !amdgpu.noclobber !8
  %35 = fadd contract float %34, 5.000000e-01
  %36 = fptosi float %35 to i32
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %38 = shl i32 %37, 7
  %39 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %40 = add i32 %38, %39
  %41 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %42 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 12
  %43 = bitcast i8 addrspace(4)* %42 to i32 addrspace(4)*
  %44 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !10
  %45 = getelementptr i8, i8 addrspace(4)* %41, i64 4
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 4, !range !19, !invariant.load !8
  %48 = zext i16 %47 to i32
  %49 = udiv i32 %44, %48
  %50 = mul i32 %49, %48
  %51 = icmp ugt i32 %44, %50
  %52 = zext i1 %51 to i32
  %53 = add i32 %49, %52
  %54 = shl i32 %53, 7
  %55 = sext i32 %32 to i64
  %56 = mul nsw i64 %55, %7
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = icmp slt i32 %40, %9
  br i1 %58, label %59, label %65

59:                                               ; preds = %11
  %60 = icmp sgt i32 %36, 0
  %61 = and i32 %36, 3
  %62 = icmp ult i32 %36, 4
  %63 = and i32 %36, -4
  %64 = icmp eq i32 %61, 0
  br label %66

65:                                               ; preds = %90, %11
  ret void

66:                                               ; preds = %59, %90
  %67 = phi i32 [ %40, %59 ], [ %93, %90 ]
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %57, i64 %68
  br i1 %60, label %70, label %90

70:                                               ; preds = %66
  br i1 %62, label %71, label %95

71:                                               ; preds = %95, %70
  %72 = phi float [ undef, %70 ], [ %133, %95 ]
  %73 = phi i32 [ 0, %70 ], [ %134, %95 ]
  %74 = phi float [ 0.000000e+00, %70 ], [ %133, %95 ]
  br i1 %64, label %90, label %75

75:                                               ; preds = %71, %75
  %76 = phi i32 [ %87, %75 ], [ %73, %71 ]
  %77 = phi float [ %86, %75 ], [ %74, %71 ]
  %78 = phi i32 [ %88, %75 ], [ 0, %71 ]
  %79 = zext i32 %76 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %17, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !4
  %82 = mul nsw i64 %79, %7
  %83 = getelementptr inbounds float, float addrspace(1)* %69, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !4
  %85 = fmul contract float %81, %84
  %86 = fadd contract float %77, %85
  %87 = add nuw nsw i32 %76, 1
  %88 = add i32 %78, 1
  %89 = icmp eq i32 %88, %61
  br i1 %89, label %90, label %75, !llvm.loop !20

90:                                               ; preds = %71, %75, %66
  %91 = phi float [ 0.000000e+00, %66 ], [ %72, %71 ], [ %86, %75 ]
  %92 = getelementptr inbounds float, float addrspace(1)* %15, i64 %68
  store float %91, float addrspace(1)* %92, align 4, !tbaa !4
  %93 = add nsw i32 %67, %54
  %94 = icmp slt i32 %93, %9
  br i1 %94, label %66, label %65, !llvm.loop !22

95:                                               ; preds = %70, %95
  %96 = phi i32 [ %134, %95 ], [ 0, %70 ]
  %97 = phi float [ %133, %95 ], [ 0.000000e+00, %70 ]
  %98 = phi i32 [ %135, %95 ], [ 0, %70 ]
  %99 = zext i32 %96 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %17, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !4
  %102 = mul nsw i64 %99, %7
  %103 = getelementptr inbounds float, float addrspace(1)* %69, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !4
  %105 = fmul contract float %101, %104
  %106 = fadd contract float %97, %105
  %107 = or i32 %96, 1
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %17, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !4
  %111 = mul nsw i64 %108, %7
  %112 = getelementptr inbounds float, float addrspace(1)* %69, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !4
  %114 = fmul contract float %110, %113
  %115 = fadd contract float %106, %114
  %116 = or i32 %96, 2
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %17, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !4
  %120 = mul nsw i64 %117, %7
  %121 = getelementptr inbounds float, float addrspace(1)* %69, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !4
  %123 = fmul contract float %119, %122
  %124 = fadd contract float %115, %123
  %125 = or i32 %96, 3
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %17, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !4
  %129 = mul nsw i64 %126, %7
  %130 = getelementptr inbounds float, float addrspace(1)* %69, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !4
  %132 = fmul contract float %128, %131
  %133 = fadd contract float %124, %132
  %134 = add nuw nsw i32 %96, 4
  %135 = add i32 %98, 4
  %136 = icmp eq i32 %135, %63
  br i1 %136, label %71, label %95, !llvm.loop !24
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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !15, i64 12}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i16 1, i16 1025}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
