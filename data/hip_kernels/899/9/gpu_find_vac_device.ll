; ModuleID = '../data/hip_kernels/899/9/main.cu'
source_filename = "../data/hip_kernels/899/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12gpu_find_vaciiiPKfS0_S0_S0_S0_S0_PfS1_S1_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture %10, float addrspace(1)* nocapture %11) local_unnamed_addr #0 {
  %13 = mul nsw i32 %0, %0
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %13
  br i1 %23, label %24, label %143

24:                                               ; preds = %12
  %25 = sdiv i32 %22, %0
  %26 = icmp sgt i32 %2, 0
  br i1 %26, label %27, label %143

27:                                               ; preds = %24
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  %30 = getelementptr inbounds float, float addrspace(1)* %4, i64 %28
  %31 = getelementptr inbounds float, float addrspace(1)* %5, i64 %28
  %32 = and i32 %2, 1
  %33 = icmp eq i32 %2, 1
  br i1 %33, label %107, label %34

34:                                               ; preds = %27
  %35 = and i32 %2, -2
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %104, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %105, %36 ]
  %39 = sub nsw i32 %1, %37
  %40 = icmp slt i32 %39, 0
  %41 = select i1 %40, i32 %2, i32 0
  %42 = add nsw i32 %41, %39
  %43 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %44 = sub i32 %37, %25
  %45 = mul i32 %44, %0
  %46 = add i32 %45, %22
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %6, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fmul contract float %43, %49
  %51 = mul nsw i32 %42, %13
  %52 = add nsw i32 %51, %22
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %9, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fadd contract float %55, %50
  store float %56, float addrspace(1)* %54, align 4, !tbaa !7
  %57 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %58 = getelementptr inbounds float, float addrspace(1)* %7, i64 %47
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fmul contract float %57, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %10, i64 %53
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fadd contract float %62, %60
  store float %63, float addrspace(1)* %61, align 4, !tbaa !7
  %64 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %65 = getelementptr inbounds float, float addrspace(1)* %8, i64 %47
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fmul contract float %64, %66
  %68 = getelementptr inbounds float, float addrspace(1)* %11, i64 %53
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fadd contract float %69, %67
  store float %70, float addrspace(1)* %68, align 4, !tbaa !7
  %71 = or i32 %37, 1
  %72 = sub nsw i32 %1, %71
  %73 = icmp slt i32 %72, 0
  %74 = select i1 %73, i32 %2, i32 0
  %75 = add nsw i32 %74, %72
  %76 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %77 = sub i32 %71, %25
  %78 = mul i32 %77, %0
  %79 = add i32 %78, %22
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %6, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fmul contract float %76, %82
  %84 = mul nsw i32 %75, %13
  %85 = add nsw i32 %84, %22
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %9, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fadd contract float %88, %83
  store float %89, float addrspace(1)* %87, align 4, !tbaa !7
  %90 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %91 = getelementptr inbounds float, float addrspace(1)* %7, i64 %80
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fmul contract float %90, %92
  %94 = getelementptr inbounds float, float addrspace(1)* %10, i64 %86
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fadd contract float %95, %93
  store float %96, float addrspace(1)* %94, align 4, !tbaa !7
  %97 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %98 = getelementptr inbounds float, float addrspace(1)* %8, i64 %80
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = fmul contract float %97, %99
  %101 = getelementptr inbounds float, float addrspace(1)* %11, i64 %86
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fadd contract float %102, %100
  store float %103, float addrspace(1)* %101, align 4, !tbaa !7
  %104 = add nuw nsw i32 %37, 2
  %105 = add i32 %38, 2
  %106 = icmp eq i32 %105, %35
  br i1 %106, label %107, label %36, !llvm.loop !11

107:                                              ; preds = %36, %27
  %108 = phi i32 [ 0, %27 ], [ %104, %36 ]
  %109 = icmp eq i32 %32, 0
  br i1 %109, label %143, label %110

110:                                              ; preds = %107
  %111 = sub nsw i32 %1, %108
  %112 = icmp slt i32 %111, 0
  %113 = select i1 %112, i32 %2, i32 0
  %114 = add nsw i32 %113, %111
  %115 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %116 = sub i32 %108, %25
  %117 = mul i32 %116, %0
  %118 = add i32 %117, %22
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %6, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fmul contract float %115, %121
  %123 = mul nsw i32 %114, %13
  %124 = add nsw i32 %123, %22
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %9, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = fadd contract float %127, %122
  store float %128, float addrspace(1)* %126, align 4, !tbaa !7
  %129 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %130 = getelementptr inbounds float, float addrspace(1)* %7, i64 %119
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fmul contract float %129, %131
  %133 = getelementptr inbounds float, float addrspace(1)* %10, i64 %125
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = fadd contract float %134, %132
  store float %135, float addrspace(1)* %133, align 4, !tbaa !7
  %136 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %137 = getelementptr inbounds float, float addrspace(1)* %8, i64 %119
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %139 = fmul contract float %136, %138
  %140 = getelementptr inbounds float, float addrspace(1)* %11, i64 %125
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = fadd contract float %141, %139
  store float %142, float addrspace(1)* %140, align 4, !tbaa !7
  br label %143

143:                                              ; preds = %110, %107, %24, %12
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
