; ModuleID = '../data/hip_kernels/15412/54/main.cu'
source_filename = "../data/hip_kernels/15412/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11mean_kernelPfiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = mul nsw i32 %3, %1
  %7 = sitofp i32 %6 to float
  %8 = fdiv contract float 1.000000e+00, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !4
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !13, !invariant.load !14
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %9
  %26 = mul i32 %25, %18
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %28, %2
  br i1 %29, label %30, label %124

30:                                               ; preds = %5
  %31 = sext i32 %28 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %4, i64 %31
  store float 0.000000e+00, float addrspace(1)* %32, align 4, !tbaa !16
  %33 = icmp sgt i32 %1, 0
  br i1 %33, label %34, label %121

34:                                               ; preds = %30
  %35 = icmp sgt i32 %3, 0
  %36 = and i32 %3, 7
  %37 = icmp ult i32 %3, 8
  %38 = and i32 %3, -8
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %34, %117
  %41 = phi float [ 0.000000e+00, %34 ], [ %118, %117 ]
  %42 = phi i32 [ 0, %34 ], [ %119, %117 ]
  br i1 %35, label %43, label %117

43:                                               ; preds = %40
  %44 = mul nsw i32 %42, %2
  %45 = add i32 %44, %28
  %46 = mul i32 %45, %3
  br i1 %37, label %101, label %47

47:                                               ; preds = %43, %47
  %48 = phi float [ %97, %47 ], [ %41, %43 ]
  %49 = phi i32 [ %98, %47 ], [ 0, %43 ]
  %50 = phi i32 [ %99, %47 ], [ 0, %43 ]
  %51 = add nsw i32 %49, %46
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = fadd contract float %54, %48
  store float %55, float addrspace(1)* %32, align 4, !tbaa !16
  %56 = or i32 %49, 1
  %57 = add nsw i32 %56, %46
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = fadd contract float %60, %55
  store float %61, float addrspace(1)* %32, align 4, !tbaa !16
  %62 = or i32 %49, 2
  %63 = add nsw i32 %62, %46
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = fadd contract float %66, %61
  store float %67, float addrspace(1)* %32, align 4, !tbaa !16
  %68 = or i32 %49, 3
  %69 = add nsw i32 %68, %46
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16
  %73 = fadd contract float %72, %67
  store float %73, float addrspace(1)* %32, align 4, !tbaa !16
  %74 = or i32 %49, 4
  %75 = add nsw i32 %74, %46
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = fadd contract float %78, %73
  store float %79, float addrspace(1)* %32, align 4, !tbaa !16
  %80 = or i32 %49, 5
  %81 = add nsw i32 %80, %46
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16
  %85 = fadd contract float %84, %79
  store float %85, float addrspace(1)* %32, align 4, !tbaa !16
  %86 = or i32 %49, 6
  %87 = add nsw i32 %86, %46
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fadd contract float %90, %85
  store float %91, float addrspace(1)* %32, align 4, !tbaa !16
  %92 = or i32 %49, 7
  %93 = add nsw i32 %92, %46
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = fadd contract float %96, %91
  store float %97, float addrspace(1)* %32, align 4, !tbaa !16
  %98 = add nuw nsw i32 %49, 8
  %99 = add i32 %50, 8
  %100 = icmp eq i32 %99, %38
  br i1 %100, label %101, label %47, !llvm.loop !20

101:                                              ; preds = %47, %43
  %102 = phi float [ undef, %43 ], [ %97, %47 ]
  %103 = phi float [ %41, %43 ], [ %97, %47 ]
  %104 = phi i32 [ 0, %43 ], [ %98, %47 ]
  br i1 %39, label %117, label %105

105:                                              ; preds = %101, %105
  %106 = phi float [ %113, %105 ], [ %103, %101 ]
  %107 = phi i32 [ %114, %105 ], [ %104, %101 ]
  %108 = phi i32 [ %115, %105 ], [ 0, %101 ]
  %109 = add nsw i32 %107, %46
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = fadd contract float %112, %106
  store float %113, float addrspace(1)* %32, align 4, !tbaa !16
  %114 = add nuw nsw i32 %107, 1
  %115 = add i32 %108, 1
  %116 = icmp eq i32 %115, %36
  br i1 %116, label %117, label %105, !llvm.loop !22

117:                                              ; preds = %101, %105, %40
  %118 = phi float [ %41, %40 ], [ %102, %101 ], [ %113, %105 ]
  %119 = add nuw nsw i32 %42, 1
  %120 = icmp eq i32 %119, %1
  br i1 %120, label %121, label %40, !llvm.loop !24

121:                                              ; preds = %117, %30
  %122 = phi float [ 0.000000e+00, %30 ], [ %118, %117 ]
  %123 = fmul contract float %8, %122
  store float %123, float addrspace(1)* %32, align 4, !tbaa !16
  br label %124

124:                                              ; preds = %5, %121
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
