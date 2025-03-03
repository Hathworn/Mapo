; ModuleID = '../data/hip_kernels/3474/3/main.cu'
source_filename = "../data/hip_kernels/3474/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9MatrixMulPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp sgt i32 %3, 0
  br i1 %14, label %15, label %55

15:                                               ; preds = %4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %3
  %25 = add nsw i32 %24, %13
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %29 = and i32 %3, 7
  %30 = icmp ult i32 %3, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %15
  %32 = and i32 %3, -8
  br label %56

33:                                               ; preds = %56, %15
  %34 = phi float [ %28, %15 ], [ %154, %56 ]
  %35 = phi i32 [ 0, %15 ], [ %155, %56 ]
  %36 = icmp eq i32 %29, 0
  br i1 %36, label %55, label %37

37:                                               ; preds = %33, %37
  %38 = phi float [ %51, %37 ], [ %34, %33 ]
  %39 = phi i32 [ %52, %37 ], [ %35, %33 ]
  %40 = phi i32 [ %53, %37 ], [ 0, %33 ]
  %41 = add nsw i32 %39, %24
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = mul nsw i32 %39, %3
  %46 = add nsw i32 %45, %13
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fmul contract float %44, %49
  %51 = fadd contract float %38, %50
  store float %51, float addrspace(1)* %27, align 4, !tbaa !7
  %52 = add nuw nsw i32 %39, 1
  %53 = add i32 %40, 1
  %54 = icmp eq i32 %53, %29
  br i1 %54, label %55, label %37, !llvm.loop !11

55:                                               ; preds = %33, %37, %4
  ret void

56:                                               ; preds = %56, %31
  %57 = phi float [ %28, %31 ], [ %154, %56 ]
  %58 = phi i32 [ 0, %31 ], [ %155, %56 ]
  %59 = phi i32 [ 0, %31 ], [ %156, %56 ]
  %60 = add nsw i32 %58, %24
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = mul nsw i32 %58, %3
  %65 = add nsw i32 %64, %13
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fmul contract float %63, %68
  %70 = fadd contract float %57, %69
  store float %70, float addrspace(1)* %27, align 4, !tbaa !7
  %71 = or i32 %58, 1
  %72 = add nsw i32 %71, %24
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = mul nsw i32 %71, %3
  %77 = add nsw i32 %76, %13
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fmul contract float %75, %80
  %82 = fadd contract float %70, %81
  store float %82, float addrspace(1)* %27, align 4, !tbaa !7
  %83 = or i32 %58, 2
  %84 = add nsw i32 %83, %24
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = mul nsw i32 %83, %3
  %89 = add nsw i32 %88, %13
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fmul contract float %87, %92
  %94 = fadd contract float %82, %93
  store float %94, float addrspace(1)* %27, align 4, !tbaa !7
  %95 = or i32 %58, 3
  %96 = add nsw i32 %95, %24
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = mul nsw i32 %95, %3
  %101 = add nsw i32 %100, %13
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = fmul contract float %99, %104
  %106 = fadd contract float %94, %105
  store float %106, float addrspace(1)* %27, align 4, !tbaa !7
  %107 = or i32 %58, 4
  %108 = add nsw i32 %107, %24
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = mul nsw i32 %107, %3
  %113 = add nsw i32 %112, %13
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fmul contract float %111, %116
  %118 = fadd contract float %106, %117
  store float %118, float addrspace(1)* %27, align 4, !tbaa !7
  %119 = or i32 %58, 5
  %120 = add nsw i32 %119, %24
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7
  %124 = mul nsw i32 %119, %3
  %125 = add nsw i32 %124, %13
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = fmul contract float %123, %128
  %130 = fadd contract float %118, %129
  store float %130, float addrspace(1)* %27, align 4, !tbaa !7
  %131 = or i32 %58, 6
  %132 = add nsw i32 %131, %24
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = mul nsw i32 %131, %3
  %137 = add nsw i32 %136, %13
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = fmul contract float %135, %140
  %142 = fadd contract float %130, %141
  store float %142, float addrspace(1)* %27, align 4, !tbaa !7
  %143 = or i32 %58, 7
  %144 = add nsw i32 %143, %24
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = mul nsw i32 %143, %3
  %149 = add nsw i32 %148, %13
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %153 = fmul contract float %147, %152
  %154 = fadd contract float %142, %153
  store float %154, float addrspace(1)* %27, align 4, !tbaa !7
  %155 = add nuw nsw i32 %58, 8
  %156 = add i32 %59, 8
  %157 = icmp eq i32 %156, %32
  br i1 %157, label %33, label %56, !llvm.loop !13
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
