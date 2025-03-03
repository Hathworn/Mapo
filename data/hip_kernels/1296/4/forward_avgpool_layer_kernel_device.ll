; ModuleID = '../data/hip_kernels/1296/4/main.cu'
source_filename = "../data/hip_kernels/1296/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28forward_avgpool_layer_kerneliiiiPfS_(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = freeze i32 %26
  %28 = icmp slt i32 %27, %0
  br i1 %28, label %29, label %115

29:                                               ; preds = %6
  %30 = sext i32 %27 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  store float 0.000000e+00, float addrspace(1)* %31, align 4, !tbaa !16
  %32 = mul nsw i32 %2, %1
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %111

34:                                               ; preds = %29
  %35 = mul nsw i32 %27, %32
  %36 = and i32 %32, 7
  %37 = icmp ult i32 %32, 8
  br i1 %37, label %94, label %38

38:                                               ; preds = %34
  %39 = and i32 %32, -8
  br label %40

40:                                               ; preds = %40, %38
  %41 = phi float [ 0.000000e+00, %38 ], [ %90, %40 ]
  %42 = phi i32 [ 0, %38 ], [ %91, %40 ]
  %43 = phi i32 [ 0, %38 ], [ %92, %40 ]
  %44 = add nsw i32 %42, %35
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  %48 = fadd contract float %47, %41
  store float %48, float addrspace(1)* %31, align 4, !tbaa !16
  %49 = or i32 %42, 1
  %50 = add nsw i32 %49, %35
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = fadd contract float %53, %48
  store float %54, float addrspace(1)* %31, align 4, !tbaa !16
  %55 = or i32 %42, 2
  %56 = add nsw i32 %55, %35
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = fadd contract float %59, %54
  store float %60, float addrspace(1)* %31, align 4, !tbaa !16
  %61 = or i32 %42, 3
  %62 = add nsw i32 %61, %35
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = fadd contract float %65, %60
  store float %66, float addrspace(1)* %31, align 4, !tbaa !16
  %67 = or i32 %42, 4
  %68 = add nsw i32 %67, %35
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16
  %72 = fadd contract float %71, %66
  store float %72, float addrspace(1)* %31, align 4, !tbaa !16
  %73 = or i32 %42, 5
  %74 = add nsw i32 %73, %35
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %4, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = fadd contract float %77, %72
  store float %78, float addrspace(1)* %31, align 4, !tbaa !16
  %79 = or i32 %42, 6
  %80 = add nsw i32 %79, %35
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %4, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = fadd contract float %83, %78
  store float %84, float addrspace(1)* %31, align 4, !tbaa !16
  %85 = or i32 %42, 7
  %86 = add nsw i32 %85, %35
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %4, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = fadd contract float %89, %84
  store float %90, float addrspace(1)* %31, align 4, !tbaa !16
  %91 = add nuw nsw i32 %42, 8
  %92 = add i32 %43, 8
  %93 = icmp eq i32 %92, %39
  br i1 %93, label %94, label %40, !llvm.loop !20

94:                                               ; preds = %40, %34
  %95 = phi float [ undef, %34 ], [ %90, %40 ]
  %96 = phi float [ 0.000000e+00, %34 ], [ %90, %40 ]
  %97 = phi i32 [ 0, %34 ], [ %91, %40 ]
  %98 = icmp eq i32 %36, 0
  br i1 %98, label %111, label %99

99:                                               ; preds = %94, %99
  %100 = phi float [ %107, %99 ], [ %96, %94 ]
  %101 = phi i32 [ %108, %99 ], [ %97, %94 ]
  %102 = phi i32 [ %109, %99 ], [ 0, %94 ]
  %103 = add nsw i32 %101, %35
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %4, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = fadd contract float %106, %100
  store float %107, float addrspace(1)* %31, align 4, !tbaa !16
  %108 = add nuw nsw i32 %101, 1
  %109 = add i32 %102, 1
  %110 = icmp eq i32 %109, %36
  br i1 %110, label %111, label %99, !llvm.loop !22

111:                                              ; preds = %94, %99, %29
  %112 = phi float [ 0.000000e+00, %29 ], [ %95, %94 ], [ %107, %99 ]
  %113 = sitofp i32 %32 to float
  %114 = fdiv contract float %112, %113
  store float %114, float addrspace(1)* %31, align 4, !tbaa !16
  br label %115

115:                                              ; preds = %6, %111
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
