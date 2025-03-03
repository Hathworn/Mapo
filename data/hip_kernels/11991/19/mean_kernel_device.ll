; ModuleID = '../data/hip_kernels/11991/19/main.cu'
source_filename = "../data/hip_kernels/11991/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11mean_kernelPfiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = mul nsw i32 %3, %1
  %7 = sitofp i32 %6 to double
  %8 = fdiv contract double 1.000000e+00, %7
  %9 = fptrunc double %8 to float
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  %26 = add i32 %25, %10
  %27 = mul i32 %26, %19
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %29, %2
  br i1 %30, label %31, label %125

31:                                               ; preds = %5
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %4, i64 %32
  store float 0.000000e+00, float addrspace(1)* %33, align 4, !tbaa !16
  %34 = icmp sgt i32 %1, 0
  br i1 %34, label %35, label %122

35:                                               ; preds = %31
  %36 = icmp sgt i32 %3, 0
  %37 = and i32 %3, 7
  %38 = icmp ult i32 %3, 8
  %39 = and i32 %3, -8
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %35, %118
  %42 = phi float [ 0.000000e+00, %35 ], [ %119, %118 ]
  %43 = phi i32 [ 0, %35 ], [ %120, %118 ]
  br i1 %36, label %44, label %118

44:                                               ; preds = %41
  %45 = mul nsw i32 %43, %2
  %46 = add i32 %45, %29
  %47 = mul i32 %46, %3
  br i1 %38, label %102, label %48

48:                                               ; preds = %44, %48
  %49 = phi float [ %98, %48 ], [ %42, %44 ]
  %50 = phi i32 [ %99, %48 ], [ 0, %44 ]
  %51 = phi i32 [ %100, %48 ], [ 0, %44 ]
  %52 = add nsw i32 %50, %47
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = fadd contract float %55, %49
  store float %56, float addrspace(1)* %33, align 4, !tbaa !16
  %57 = or i32 %50, 1
  %58 = add nsw i32 %57, %47
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %62 = fadd contract float %61, %56
  store float %62, float addrspace(1)* %33, align 4, !tbaa !16
  %63 = or i32 %50, 2
  %64 = add nsw i32 %63, %47
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = fadd contract float %67, %62
  store float %68, float addrspace(1)* %33, align 4, !tbaa !16
  %69 = or i32 %50, 3
  %70 = add nsw i32 %69, %47
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = fadd contract float %73, %68
  store float %74, float addrspace(1)* %33, align 4, !tbaa !16
  %75 = or i32 %50, 4
  %76 = add nsw i32 %75, %47
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fadd contract float %79, %74
  store float %80, float addrspace(1)* %33, align 4, !tbaa !16
  %81 = or i32 %50, 5
  %82 = add nsw i32 %81, %47
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = fadd contract float %85, %80
  store float %86, float addrspace(1)* %33, align 4, !tbaa !16
  %87 = or i32 %50, 6
  %88 = add nsw i32 %87, %47
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16
  %92 = fadd contract float %91, %86
  store float %92, float addrspace(1)* %33, align 4, !tbaa !16
  %93 = or i32 %50, 7
  %94 = add nsw i32 %93, %47
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = fadd contract float %97, %92
  store float %98, float addrspace(1)* %33, align 4, !tbaa !16
  %99 = add nuw nsw i32 %50, 8
  %100 = add i32 %51, 8
  %101 = icmp eq i32 %100, %39
  br i1 %101, label %102, label %48, !llvm.loop !20

102:                                              ; preds = %48, %44
  %103 = phi float [ undef, %44 ], [ %98, %48 ]
  %104 = phi float [ %42, %44 ], [ %98, %48 ]
  %105 = phi i32 [ 0, %44 ], [ %99, %48 ]
  br i1 %40, label %118, label %106

106:                                              ; preds = %102, %106
  %107 = phi float [ %114, %106 ], [ %104, %102 ]
  %108 = phi i32 [ %115, %106 ], [ %105, %102 ]
  %109 = phi i32 [ %116, %106 ], [ 0, %102 ]
  %110 = add nsw i32 %108, %47
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  %114 = fadd contract float %113, %107
  store float %114, float addrspace(1)* %33, align 4, !tbaa !16
  %115 = add nuw nsw i32 %108, 1
  %116 = add i32 %109, 1
  %117 = icmp eq i32 %116, %37
  br i1 %117, label %118, label %106, !llvm.loop !22

118:                                              ; preds = %102, %106, %41
  %119 = phi float [ %42, %41 ], [ %103, %102 ], [ %114, %106 ]
  %120 = add nuw nsw i32 %43, 1
  %121 = icmp eq i32 %120, %1
  br i1 %121, label %122, label %41, !llvm.loop !24

122:                                              ; preds = %118, %31
  %123 = phi float [ 0.000000e+00, %31 ], [ %119, %118 ]
  %124 = fmul contract float %123, %9
  store float %124, float addrspace(1)* %33, align 4, !tbaa !16
  br label %125

125:                                              ; preds = %5, %122
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
!24 = distinct !{!24, !21}
