; ModuleID = '../data/hip_kernels/16910/32/main.cu'
source_filename = "../data/hip_kernels/16910/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7sum_dWUPKdPKfPf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %5 = load double, double addrspace(1)* %4, align 8, !tbaa !4, !amdgpu.noclobber !8
  %6 = fptosi double %5 to i32
  %7 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %8 = load double, double addrspace(1)* %7, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !9, !invariant.load !8
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !10
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = mul i32 %21, %17
  %23 = udiv i32 %20, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %25 = mul nsw i32 %12, %9
  %26 = add nsw i32 %22, %24
  %27 = icmp slt i32 %26, %25
  br i1 %27, label %28, label %141

28:                                               ; preds = %3
  %29 = mul i32 %23, %17
  %30 = icmp ugt i32 %20, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %23, %31
  %33 = icmp sgt i32 %6, 0
  %34 = add i32 %6, -1
  %35 = mul nsw i32 %32, %17
  %36 = and i32 %6, 7
  %37 = icmp ult i32 %6, 8
  %38 = and i32 %6, -8
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %28, %133
  %41 = phi i32 [ %26, %28 ], [ %139, %133 ]
  br i1 %33, label %42, label %133

42:                                               ; preds = %40
  %43 = sdiv i32 %41, %9
  %44 = mul i32 %43, %34
  br i1 %37, label %115, label %45

45:                                               ; preds = %42, %45
  %46 = phi i32 [ %112, %45 ], [ 0, %42 ]
  %47 = phi float [ %111, %45 ], [ 0.000000e+00, %42 ]
  %48 = phi i32 [ %113, %45 ], [ 0, %42 ]
  %49 = add i32 %44, %46
  %50 = mul i32 %49, %9
  %51 = add i32 %50, %41
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !20
  %55 = fadd contract float %47, %54
  %56 = or i32 %46, 1
  %57 = add i32 %44, %56
  %58 = mul i32 %57, %9
  %59 = add i32 %58, %41
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !20
  %63 = fadd contract float %55, %62
  %64 = or i32 %46, 2
  %65 = add i32 %44, %64
  %66 = mul i32 %65, %9
  %67 = add i32 %66, %41
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !20
  %71 = fadd contract float %63, %70
  %72 = or i32 %46, 3
  %73 = add i32 %44, %72
  %74 = mul i32 %73, %9
  %75 = add i32 %74, %41
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !20
  %79 = fadd contract float %71, %78
  %80 = or i32 %46, 4
  %81 = add i32 %44, %80
  %82 = mul i32 %81, %9
  %83 = add i32 %82, %41
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !20
  %87 = fadd contract float %79, %86
  %88 = or i32 %46, 5
  %89 = add i32 %44, %88
  %90 = mul i32 %89, %9
  %91 = add i32 %90, %41
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !20
  %95 = fadd contract float %87, %94
  %96 = or i32 %46, 6
  %97 = add i32 %44, %96
  %98 = mul i32 %97, %9
  %99 = add i32 %98, %41
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !20
  %103 = fadd contract float %95, %102
  %104 = or i32 %46, 7
  %105 = add i32 %44, %104
  %106 = mul i32 %105, %9
  %107 = add i32 %106, %41
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !20
  %111 = fadd contract float %103, %110
  %112 = add nuw nsw i32 %46, 8
  %113 = add i32 %48, 8
  %114 = icmp eq i32 %113, %38
  br i1 %114, label %115, label %45, !llvm.loop !22

115:                                              ; preds = %45, %42
  %116 = phi float [ undef, %42 ], [ %111, %45 ]
  %117 = phi i32 [ 0, %42 ], [ %112, %45 ]
  %118 = phi float [ 0.000000e+00, %42 ], [ %111, %45 ]
  br i1 %39, label %133, label %119

119:                                              ; preds = %115, %119
  %120 = phi i32 [ %130, %119 ], [ %117, %115 ]
  %121 = phi float [ %129, %119 ], [ %118, %115 ]
  %122 = phi i32 [ %131, %119 ], [ 0, %115 ]
  %123 = add i32 %44, %120
  %124 = mul i32 %123, %9
  %125 = add i32 %124, %41
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !20
  %129 = fadd contract float %121, %128
  %130 = add nuw nsw i32 %120, 1
  %131 = add i32 %122, 1
  %132 = icmp eq i32 %131, %36
  br i1 %132, label %133, label %119, !llvm.loop !24

133:                                              ; preds = %115, %119, %40
  %134 = phi float [ 0.000000e+00, %40 ], [ %116, %115 ], [ %129, %119 ]
  %135 = sext i32 %41 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !20
  %138 = fadd contract float %134, %137
  store float %138, float addrspace(1)* %136, align 4, !tbaa !20
  %139 = add nsw i32 %41, %35
  %140 = icmp slt i32 %139, %25
  br i1 %140, label %40, label %141, !llvm.loop !26

141:                                              ; preds = %133, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{!11, !15, i64 12}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i32 0, i32 1024}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !6, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
!26 = distinct !{!26, !23}
