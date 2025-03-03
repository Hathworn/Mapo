; ModuleID = '../data/hip_kernels/5330/4/main.cu'
source_filename = "../data/hip_kernels/5330/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24ca_map_backward_kernel_wPKfS0_S0_Pfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = mul nsw i32 %7, %6
  %27 = add nsw i32 %6, -1
  %28 = add i32 %27, %7
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %30 = icmp slt i32 %17, %7
  %31 = icmp slt i32 %25, %6
  %32 = select i1 %30, i1 %31, i1 false
  %33 = icmp slt i32 %29, %28
  %34 = select i1 %32, i1 %33, i1 false
  %35 = icmp sgt i32 %4, 0
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %162

37:                                               ; preds = %8
  %38 = icmp sgt i32 %5, 0
  %39 = mul nsw i32 %25, %7
  %40 = icmp slt i32 %29, %7
  %41 = sub nsw i32 %29, %7
  %42 = icmp sge i32 %41, %25
  %43 = zext i1 %42 to i32
  %44 = add nsw i32 %41, %43
  %45 = mul nsw i32 %44, %7
  %46 = add i32 %45, %17
  %47 = add i32 %39, %17
  %48 = and i32 %5, 3
  %49 = icmp ult i32 %5, 4
  %50 = and i32 %5, -4
  %51 = icmp eq i32 %48, 0
  br label %52

52:                                               ; preds = %37, %86
  %53 = phi i32 [ 0, %37 ], [ %87, %86 ]
  br i1 %38, label %54, label %86

54:                                               ; preds = %52
  %55 = mul nsw i32 %53, %5
  %56 = mul nsw i32 %53, %28
  %57 = add i32 %56, %29
  %58 = mul nsw i32 %57, %26
  %59 = add i32 %47, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  br i1 %49, label %62, label %89

62:                                               ; preds = %89, %54
  %63 = phi i32 [ 0, %54 ], [ %159, %89 ]
  br i1 %51, label %86, label %64

64:                                               ; preds = %62, %64
  %65 = phi i32 [ %83, %64 ], [ %63, %62 ]
  %66 = phi i32 [ %84, %64 ], [ 0, %62 ]
  %67 = add nsw i32 %65, %55
  %68 = mul nsw i32 %67, %26
  %69 = add nsw i32 %68, %39
  %70 = add nsw i32 %69, %17
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %75 = add i32 %46, %68
  %76 = add nsw i32 %69, %29
  %77 = select i1 %40, i32 %76, i32 %75
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fmul contract float %73, %80
  %82 = fadd contract float %74, %81
  store float %82, float addrspace(1)* %61, align 4, !tbaa !7
  %83 = add nuw nsw i32 %65, 1
  %84 = add i32 %66, 1
  %85 = icmp eq i32 %84, %48
  br i1 %85, label %86, label %64, !llvm.loop !11

86:                                               ; preds = %62, %64, %52
  %87 = add nuw nsw i32 %53, 1
  %88 = icmp eq i32 %87, %4
  br i1 %88, label %162, label %52, !llvm.loop !13

89:                                               ; preds = %54, %89
  %90 = phi i32 [ %159, %89 ], [ 0, %54 ]
  %91 = phi i32 [ %160, %89 ], [ 0, %54 ]
  %92 = add nsw i32 %90, %55
  %93 = mul nsw i32 %92, %26
  %94 = add nsw i32 %93, %39
  %95 = add nsw i32 %94, %17
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %100 = add i32 %46, %93
  %101 = add nsw i32 %94, %29
  %102 = select i1 %40, i32 %101, i32 %100
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = fmul contract float %98, %105
  %107 = fadd contract float %99, %106
  store float %107, float addrspace(1)* %61, align 4, !tbaa !7
  %108 = or i32 %90, 1
  %109 = add nsw i32 %108, %55
  %110 = mul nsw i32 %109, %26
  %111 = add nsw i32 %110, %39
  %112 = add nsw i32 %111, %17
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %117 = add i32 %46, %110
  %118 = add nsw i32 %111, %29
  %119 = select i1 %40, i32 %118, i32 %117
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fmul contract float %115, %122
  %124 = fadd contract float %116, %123
  store float %124, float addrspace(1)* %61, align 4, !tbaa !7
  %125 = or i32 %90, 2
  %126 = add nsw i32 %125, %55
  %127 = mul nsw i32 %126, %26
  %128 = add nsw i32 %127, %39
  %129 = add nsw i32 %128, %17
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %134 = add i32 %46, %127
  %135 = add nsw i32 %128, %29
  %136 = select i1 %40, i32 %135, i32 %134
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %2, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = fmul contract float %132, %139
  %141 = fadd contract float %133, %140
  store float %141, float addrspace(1)* %61, align 4, !tbaa !7
  %142 = or i32 %90, 3
  %143 = add nsw i32 %142, %55
  %144 = mul nsw i32 %143, %26
  %145 = add nsw i32 %144, %39
  %146 = add nsw i32 %145, %17
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %151 = add i32 %46, %144
  %152 = add nsw i32 %145, %29
  %153 = select i1 %40, i32 %152, i32 %151
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %2, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = fmul contract float %149, %156
  %158 = fadd contract float %150, %157
  store float %158, float addrspace(1)* %61, align 4, !tbaa !7
  %159 = add nuw nsw i32 %90, 4
  %160 = add i32 %91, 4
  %161 = icmp eq i32 %160, %50
  br i1 %161, label %62, label %89, !llvm.loop !15

162:                                              ; preds = %86, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
