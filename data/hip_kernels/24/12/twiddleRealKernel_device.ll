; ModuleID = '../data/hip_kernels/24/12/main.cu'
source_filename = "../data/hip_kernels/24/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17twiddleRealKernelPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %138

14:                                               ; preds = %3
  %15 = icmp eq i32 %12, 0
  br i1 %15, label %16, label %52

16:                                               ; preds = %14
  %17 = icmp sgt i32 %2, 0
  br i1 %17, label %18, label %138

18:                                               ; preds = %16
  %19 = and i32 %2, 7
  %20 = icmp ult i32 %2, 8
  br i1 %20, label %109, label %21

21:                                               ; preds = %18
  %22 = and i32 %2, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %49, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %50, %23 ]
  %26 = zext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  store float 1.000000e+00, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = or i32 %24, 1
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  store float 1.000000e+00, float addrspace(1)* %30, align 4, !tbaa !7
  %31 = or i32 %24, 2
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  store float 1.000000e+00, float addrspace(1)* %33, align 4, !tbaa !7
  %34 = or i32 %24, 3
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  store float 1.000000e+00, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = or i32 %24, 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  store float 1.000000e+00, float addrspace(1)* %39, align 4, !tbaa !7
  %40 = or i32 %24, 5
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float 1.000000e+00, float addrspace(1)* %42, align 4, !tbaa !7
  %43 = or i32 %24, 6
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  store float 1.000000e+00, float addrspace(1)* %45, align 4, !tbaa !7
  %46 = or i32 %24, 7
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float 1.000000e+00, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = add nuw nsw i32 %24, 8
  %50 = add i32 %25, 8
  %51 = icmp eq i32 %50, %22
  br i1 %51, label %109, label %23, !llvm.loop !11

52:                                               ; preds = %14
  %53 = mul nsw i32 %12, %2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  store float 1.000000e+00, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = icmp sgt i32 %2, 1
  br i1 %56, label %57, label %138

57:                                               ; preds = %52
  %58 = add i32 %2, -1
  %59 = add i32 %2, -2
  %60 = and i32 %58, 3
  %61 = icmp ult i32 %59, 3
  br i1 %61, label %120, label %62

62:                                               ; preds = %57
  %63 = and i32 %58, -4
  br label %64

64:                                               ; preds = %64, %62
  %65 = phi i32 [ 1, %62 ], [ %106, %64 ]
  %66 = phi i32 [ 0, %62 ], [ %107, %64 ]
  %67 = mul nsw i32 %65, %12
  %68 = srem i32 %67, %2
  %69 = shl nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = add nsw i32 %65, %53
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  store float %72, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = add nuw nsw i32 %65, 1
  %77 = mul nsw i32 %76, %12
  %78 = srem i32 %77, %2
  %79 = shl nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = add nsw i32 %76, %53
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  store float %82, float addrspace(1)* %85, align 4, !tbaa !7
  %86 = add nuw nsw i32 %65, 2
  %87 = mul nsw i32 %86, %12
  %88 = srem i32 %87, %2
  %89 = shl nsw i32 %88, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = add nsw i32 %86, %53
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  store float %92, float addrspace(1)* %95, align 4, !tbaa !7
  %96 = add nuw nsw i32 %65, 3
  %97 = mul nsw i32 %96, %12
  %98 = srem i32 %97, %2
  %99 = shl nsw i32 %98, 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = add nsw i32 %96, %53
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  store float %102, float addrspace(1)* %105, align 4, !tbaa !7
  %106 = add nuw nsw i32 %65, 4
  %107 = add i32 %66, 4
  %108 = icmp eq i32 %107, %63
  br i1 %108, label %120, label %64, !llvm.loop !13

109:                                              ; preds = %23, %18
  %110 = phi i32 [ 0, %18 ], [ %49, %23 ]
  %111 = icmp eq i32 %19, 0
  br i1 %111, label %138, label %112

112:                                              ; preds = %109, %112
  %113 = phi i32 [ %117, %112 ], [ %110, %109 ]
  %114 = phi i32 [ %118, %112 ], [ 0, %109 ]
  %115 = zext i32 %113 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  store float 1.000000e+00, float addrspace(1)* %116, align 4, !tbaa !7
  %117 = add nuw nsw i32 %113, 1
  %118 = add i32 %114, 1
  %119 = icmp eq i32 %118, %19
  br i1 %119, label %138, label %112, !llvm.loop !14

120:                                              ; preds = %64, %57
  %121 = phi i32 [ 1, %57 ], [ %106, %64 ]
  %122 = icmp eq i32 %60, 0
  br i1 %122, label %138, label %123

123:                                              ; preds = %120, %123
  %124 = phi i32 [ %135, %123 ], [ %121, %120 ]
  %125 = phi i32 [ %136, %123 ], [ 0, %120 ]
  %126 = mul nsw i32 %124, %12
  %127 = srem i32 %126, %2
  %128 = shl nsw i32 %127, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = add nsw i32 %124, %53
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  store float %131, float addrspace(1)* %134, align 4, !tbaa !7
  %135 = add nuw nsw i32 %124, 1
  %136 = add i32 %125, 1
  %137 = icmp eq i32 %136, %60
  br i1 %137, label %138, label %123, !llvm.loop !16

138:                                              ; preds = %120, %123, %109, %112, %52, %16, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
