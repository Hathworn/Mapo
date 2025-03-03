; ModuleID = '../data/hip_kernels/16612/10/main.cu'
source_filename = "../data/hip_kernels/16612/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25backward_bias_conn_kernelPfS_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = mul i32 %21, %14
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %3
  br i1 %25, label %26, label %119

26:                                               ; preds = %4
  %27 = icmp sgt i32 %2, 0
  br i1 %27, label %28, label %113

28:                                               ; preds = %26
  %29 = and i32 %2, 7
  %30 = icmp ult i32 %2, 8
  br i1 %30, label %95, label %31

31:                                               ; preds = %28
  %32 = and i32 %2, -8
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi float [ 0.000000e+00, %31 ], [ %91, %33 ]
  %35 = phi i32 [ 0, %31 ], [ %92, %33 ]
  %36 = phi i32 [ 0, %31 ], [ %93, %33 ]
  %37 = mul nsw i32 %35, %3
  %38 = add nsw i32 %37, %24
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !14
  %42 = fadd contract float %34, %41
  %43 = or i32 %35, 1
  %44 = mul nsw i32 %43, %3
  %45 = add nsw i32 %44, %24
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !14
  %49 = fadd contract float %42, %48
  %50 = or i32 %35, 2
  %51 = mul nsw i32 %50, %3
  %52 = add nsw i32 %51, %24
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16, !amdgpu.noclobber !14
  %56 = fadd contract float %49, %55
  %57 = or i32 %35, 3
  %58 = mul nsw i32 %57, %3
  %59 = add nsw i32 %58, %24
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !14
  %63 = fadd contract float %56, %62
  %64 = or i32 %35, 4
  %65 = mul nsw i32 %64, %3
  %66 = add nsw i32 %65, %24
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !14
  %70 = fadd contract float %63, %69
  %71 = or i32 %35, 5
  %72 = mul nsw i32 %71, %3
  %73 = add nsw i32 %72, %24
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !14
  %77 = fadd contract float %70, %76
  %78 = or i32 %35, 6
  %79 = mul nsw i32 %78, %3
  %80 = add nsw i32 %79, %24
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !14
  %84 = fadd contract float %77, %83
  %85 = or i32 %35, 7
  %86 = mul nsw i32 %85, %3
  %87 = add nsw i32 %86, %24
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !14
  %91 = fadd contract float %84, %90
  %92 = add nuw nsw i32 %35, 8
  %93 = add i32 %36, 8
  %94 = icmp eq i32 %93, %32
  br i1 %94, label %95, label %33, !llvm.loop !20

95:                                               ; preds = %33, %28
  %96 = phi float [ undef, %28 ], [ %91, %33 ]
  %97 = phi float [ 0.000000e+00, %28 ], [ %91, %33 ]
  %98 = phi i32 [ 0, %28 ], [ %92, %33 ]
  %99 = icmp eq i32 %29, 0
  br i1 %99, label %113, label %100

100:                                              ; preds = %95, %100
  %101 = phi float [ %109, %100 ], [ %97, %95 ]
  %102 = phi i32 [ %110, %100 ], [ %98, %95 ]
  %103 = phi i32 [ %111, %100 ], [ 0, %95 ]
  %104 = mul nsw i32 %102, %3
  %105 = add nsw i32 %104, %24
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16, !amdgpu.noclobber !14
  %109 = fadd contract float %101, %108
  %110 = add nuw nsw i32 %102, 1
  %111 = add i32 %103, 1
  %112 = icmp eq i32 %111, %29
  br i1 %112, label %113, label %100, !llvm.loop !22

113:                                              ; preds = %95, %100, %26
  %114 = phi float [ 0.000000e+00, %26 ], [ %96, %95 ], [ %109, %100 ]
  %115 = sext i32 %24 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16, !amdgpu.noclobber !14
  %118 = fadd contract float %114, %117
  store float %118, float addrspace(1)* %116, align 4, !tbaa !16
  br label %119

119:                                              ; preds = %4, %113
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
