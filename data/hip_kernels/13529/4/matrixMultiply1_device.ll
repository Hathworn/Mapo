; ModuleID = '../data/hip_kernels/13529/4/main.cu'
source_filename = "../data/hip_kernels/13529/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15matrixMultiply1PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 2, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %22, label %54

22:                                               ; preds = %3
  %23 = mul nsw i32 %20, %2
  %24 = add nsw i32 %23, %12
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %28 = and i32 %2, 7
  %29 = icmp ult i32 %2, 8
  br i1 %29, label %32, label %30

30:                                               ; preds = %22
  %31 = and i32 %2, -8
  br label %55

32:                                               ; preds = %55, %22
  %33 = phi float [ %27, %22 ], [ %153, %55 ]
  %34 = phi i32 [ 0, %22 ], [ %154, %55 ]
  %35 = icmp eq i32 %28, 0
  br i1 %35, label %54, label %36

36:                                               ; preds = %32, %36
  %37 = phi float [ %50, %36 ], [ %33, %32 ]
  %38 = phi i32 [ %51, %36 ], [ %34, %32 ]
  %39 = phi i32 [ %52, %36 ], [ 0, %32 ]
  %40 = mul nsw i32 %38, %2
  %41 = add nsw i32 %40, %20
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = add nsw i32 %40, %12
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = fmul contract float %44, %48
  %50 = fadd contract float %37, %49
  store float %50, float addrspace(1)* %26, align 4, !tbaa !7
  %51 = add nuw nsw i32 %38, 1
  %52 = add i32 %39, 1
  %53 = icmp eq i32 %52, %28
  br i1 %53, label %54, label %36, !llvm.loop !11

54:                                               ; preds = %32, %36, %3
  ret void

55:                                               ; preds = %55, %30
  %56 = phi float [ %27, %30 ], [ %153, %55 ]
  %57 = phi i32 [ 0, %30 ], [ %154, %55 ]
  %58 = phi i32 [ 0, %30 ], [ %155, %55 ]
  %59 = mul nsw i32 %57, %2
  %60 = add nsw i32 %59, %20
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = add nsw i32 %59, %12
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fmul contract float %63, %67
  %69 = fadd contract float %56, %68
  store float %69, float addrspace(1)* %26, align 4, !tbaa !7
  %70 = or i32 %57, 1
  %71 = mul nsw i32 %70, %2
  %72 = add nsw i32 %71, %20
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = add nsw i32 %71, %12
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fmul contract float %75, %79
  %81 = fadd contract float %69, %80
  store float %81, float addrspace(1)* %26, align 4, !tbaa !7
  %82 = or i32 %57, 2
  %83 = mul nsw i32 %82, %2
  %84 = add nsw i32 %83, %20
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = add nsw i32 %83, %12
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fmul contract float %87, %91
  %93 = fadd contract float %81, %92
  store float %93, float addrspace(1)* %26, align 4, !tbaa !7
  %94 = or i32 %57, 3
  %95 = mul nsw i32 %94, %2
  %96 = add nsw i32 %95, %20
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = add nsw i32 %95, %12
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = fmul contract float %99, %103
  %105 = fadd contract float %93, %104
  store float %105, float addrspace(1)* %26, align 4, !tbaa !7
  %106 = or i32 %57, 4
  %107 = mul nsw i32 %106, %2
  %108 = add nsw i32 %107, %20
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = add nsw i32 %107, %12
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = fmul contract float %111, %115
  %117 = fadd contract float %105, %116
  store float %117, float addrspace(1)* %26, align 4, !tbaa !7
  %118 = or i32 %57, 5
  %119 = mul nsw i32 %118, %2
  %120 = add nsw i32 %119, %20
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7
  %124 = add nsw i32 %119, %12
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = fmul contract float %123, %127
  %129 = fadd contract float %117, %128
  store float %129, float addrspace(1)* %26, align 4, !tbaa !7
  %130 = or i32 %57, 6
  %131 = mul nsw i32 %130, %2
  %132 = add nsw i32 %131, %20
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = add nsw i32 %131, %12
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = fmul contract float %135, %139
  %141 = fadd contract float %129, %140
  store float %141, float addrspace(1)* %26, align 4, !tbaa !7
  %142 = or i32 %57, 7
  %143 = mul nsw i32 %142, %2
  %144 = add nsw i32 %143, %20
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = add nsw i32 %143, %12
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = fmul contract float %147, %151
  %153 = fadd contract float %141, %152
  store float %153, float addrspace(1)* %26, align 4, !tbaa !7
  %154 = add nuw nsw i32 %57, 8
  %155 = add i32 %58, 8
  %156 = icmp eq i32 %155, %31
  br i1 %156, label %32, label %55, !llvm.loop !13
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
