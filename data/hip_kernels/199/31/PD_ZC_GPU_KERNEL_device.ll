; ModuleID = '../data/hip_kernels/199/31/main.cu'
source_filename = "../data/hip_kernels/199/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16PD_ZC_GPU_KERNELPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = shl i32 %15, 10
  %17 = add i32 %16, 1024
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = or i32 %17, %18
  %20 = add nsw i32 %2, -1
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !7
  %24 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !4, !invariant.load !5
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %23, %27
  %29 = icmp sgt i32 %4, 0
  br i1 %29, label %30, label %77

30:                                               ; preds = %5
  %31 = mul i32 %28, %27
  %32 = icmp ugt i32 %23, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %28, %33
  %35 = mul i32 %34, %14
  %36 = mul i32 %14, %3
  %37 = icmp slt i32 %19, %3
  %38 = icmp ult i32 %18, %20
  %39 = select i1 %37, i1 %38, i1 false
  %40 = add nsw i32 %36, %19
  %41 = add i32 %35, %15
  %42 = mul i32 %41, %20
  %43 = add i32 %42, %18
  br i1 %39, label %49, label %44

44:                                               ; preds = %30
  %45 = and i32 %4, 7
  %46 = icmp ult i32 %4, 8
  br i1 %46, label %71, label %47

47:                                               ; preds = %44
  %48 = and i32 %4, -8
  br label %78

49:                                               ; preds = %30
  %50 = and i32 %4, 7
  %51 = icmp ult i32 %4, 8
  br i1 %51, label %54, label %52

52:                                               ; preds = %49
  %53 = and i32 %4, -8
  br label %82

54:                                               ; preds = %82, %49
  %55 = phi i32 [ 0, %49 ], [ %156, %82 ]
  %56 = icmp eq i32 %50, 0
  br i1 %56, label %77, label %57

57:                                               ; preds = %54, %57
  %58 = phi i32 [ %68, %57 ], [ %55, %54 ]
  %59 = phi i32 [ %69, %57 ], [ 0, %54 ]
  %60 = shl nsw i32 %58, 5
  %61 = add nsw i32 %40, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = add i32 %43, %60
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  store float %64, float addrspace(1)* %67, align 4, !tbaa !16
  %68 = add nuw nsw i32 %58, 1
  %69 = add i32 %59, 1
  %70 = icmp eq i32 %69, %50
  br i1 %70, label %77, label %57, !llvm.loop !20

71:                                               ; preds = %78, %44
  %72 = icmp eq i32 %45, 0
  br i1 %72, label %77, label %73

73:                                               ; preds = %71, %73
  %74 = phi i32 [ %75, %73 ], [ 0, %71 ]
  %75 = add i32 %74, 1
  %76 = icmp eq i32 %75, %45
  br i1 %76, label %77, label %73, !llvm.loop !22

77:                                               ; preds = %57, %54, %73, %71, %5
  ret void

78:                                               ; preds = %78, %47
  %79 = phi i32 [ 0, %47 ], [ %80, %78 ]
  %80 = add i32 %79, 8
  %81 = icmp eq i32 %80, %48
  br i1 %81, label %71, label %78, !llvm.loop !23

82:                                               ; preds = %82, %52
  %83 = phi i32 [ 0, %52 ], [ %156, %82 ]
  %84 = phi i32 [ 0, %52 ], [ %157, %82 ]
  %85 = shl nsw i32 %83, 5
  %86 = add nsw i32 %40, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = add i32 %43, %85
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  store float %89, float addrspace(1)* %92, align 4, !tbaa !16
  %93 = shl i32 %83, 5
  %94 = or i32 %93, 32
  %95 = add nsw i32 %40, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = add i32 %43, %94
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  store float %98, float addrspace(1)* %101, align 4, !tbaa !16
  %102 = shl i32 %83, 5
  %103 = or i32 %102, 64
  %104 = add nsw i32 %40, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = add i32 %43, %103
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  store float %107, float addrspace(1)* %110, align 4, !tbaa !16
  %111 = shl i32 %83, 5
  %112 = or i32 %111, 96
  %113 = add nsw i32 %40, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !16
  %117 = add i32 %43, %112
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  store float %116, float addrspace(1)* %119, align 4, !tbaa !16
  %120 = shl i32 %83, 5
  %121 = or i32 %120, 128
  %122 = add nsw i32 %40, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16
  %126 = add i32 %43, %121
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  store float %125, float addrspace(1)* %128, align 4, !tbaa !16
  %129 = shl i32 %83, 5
  %130 = or i32 %129, 160
  %131 = add nsw i32 %40, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = add i32 %43, %130
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  store float %134, float addrspace(1)* %137, align 4, !tbaa !16
  %138 = shl i32 %83, 5
  %139 = or i32 %138, 192
  %140 = add nsw i32 %40, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !16
  %144 = add i32 %43, %139
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  store float %143, float addrspace(1)* %146, align 4, !tbaa !16
  %147 = shl i32 %83, 5
  %148 = or i32 %147, 224
  %149 = add nsw i32 %40, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !16
  %153 = add i32 %43, %148
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %154
  store float %152, float addrspace(1)* %155, align 4, !tbaa !16
  %156 = add nuw nsw i32 %83, 8
  %157 = add i32 %84, 8
  %158 = icmp eq i32 %157, %53
  br i1 %158, label %54, label %82, !llvm.loop !23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
