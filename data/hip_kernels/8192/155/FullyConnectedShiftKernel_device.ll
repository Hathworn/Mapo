; ModuleID = '../data/hip_kernels/8192/155/main.cu'
source_filename = "../data/hip_kernels/8192/155/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25FullyConnectedShiftKernelPfS_S_S_S_S_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = udiv i32 %17, %14
  %21 = mul i32 %20, %14
  %22 = icmp ugt i32 %17, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %19
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %18
  %28 = mul i32 %27, %14
  %29 = add i32 %28, %26
  %30 = icmp slt i32 %29, %8
  br i1 %30, label %31, label %135

31:                                               ; preds = %9
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %6, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !5
  %35 = fcmp contract une float %34, 0.000000e+00
  br i1 %35, label %135, label %36

36:                                               ; preds = %31
  %37 = icmp sgt i32 %7, 0
  br i1 %37, label %38, label %128

38:                                               ; preds = %36
  %39 = and i32 %7, 7
  %40 = icmp ult i32 %7, 8
  br i1 %40, label %112, label %41

41:                                               ; preds = %38
  %42 = and i32 %7, -8
  br label %43

43:                                               ; preds = %43, %41
  %44 = phi i32 [ %29, %41 ], [ %109, %43 ]
  %45 = phi i32 [ 0, %41 ], [ %110, %43 ]
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16
  %49 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = fadd contract float %48, %50
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  store float %51, float addrspace(1)* %52, align 4, !tbaa !16
  %53 = add nsw i32 %44, %8
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = fadd contract float %56, %58
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  store float %59, float addrspace(1)* %60, align 4, !tbaa !16
  %61 = add nsw i32 %53, %8
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = getelementptr inbounds float, float addrspace(1)* %4, i64 %62
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = fadd contract float %64, %66
  %68 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  store float %67, float addrspace(1)* %68, align 4, !tbaa !16
  %69 = add nsw i32 %61, %8
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16
  %73 = getelementptr inbounds float, float addrspace(1)* %4, i64 %70
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %75 = fadd contract float %72, %74
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  store float %75, float addrspace(1)* %76, align 4, !tbaa !16
  %77 = add nsw i32 %69, %8
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %81 = getelementptr inbounds float, float addrspace(1)* %4, i64 %78
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = fadd contract float %80, %82
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  store float %83, float addrspace(1)* %84, align 4, !tbaa !16
  %85 = add nsw i32 %77, %8
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %86
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = fadd contract float %88, %90
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  store float %91, float addrspace(1)* %92, align 4, !tbaa !16
  %93 = add nsw i32 %85, %8
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = getelementptr inbounds float, float addrspace(1)* %4, i64 %94
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = fadd contract float %96, %98
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  store float %99, float addrspace(1)* %100, align 4, !tbaa !16
  %101 = add nsw i32 %93, %8
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = getelementptr inbounds float, float addrspace(1)* %4, i64 %102
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !16
  %107 = fadd contract float %104, %106
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  store float %107, float addrspace(1)* %108, align 4, !tbaa !16
  %109 = add nsw i32 %101, %8
  %110 = add i32 %45, 8
  %111 = icmp eq i32 %110, %42
  br i1 %111, label %112, label %43, !llvm.loop !20

112:                                              ; preds = %43, %38
  %113 = phi i32 [ %29, %38 ], [ %109, %43 ]
  %114 = icmp eq i32 %39, 0
  br i1 %114, label %128, label %115

115:                                              ; preds = %112, %115
  %116 = phi i32 [ %125, %115 ], [ %113, %112 ]
  %117 = phi i32 [ %126, %115 ], [ 0, %112 ]
  %118 = sext i32 %116 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = getelementptr inbounds float, float addrspace(1)* %4, i64 %118
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = fadd contract float %120, %122
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  store float %123, float addrspace(1)* %124, align 4, !tbaa !16
  %125 = add nsw i32 %116, %8
  %126 = add i32 %117, 1
  %127 = icmp eq i32 %126, %39
  br i1 %127, label %128, label %115, !llvm.loop !22

128:                                              ; preds = %112, %115, %36
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16
  %133 = fsub contract float %130, %132
  %134 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  store float %133, float addrspace(1)* %134, align 4, !tbaa !16
  br label %135

135:                                              ; preds = %31, %128, %9
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
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
