; ModuleID = '../data/hip_kernels/1136/0/main.cu'
source_filename = "../data/hip_kernels/1136/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9kernelGPUPfS_S_S_S_S_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %10
  %19 = mul i32 %7, %6
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %133

21:                                               ; preds = %9
  %22 = sext i32 %18 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  store float 0.000000e+00, float addrspace(1)* %23, align 4, !tbaa !7
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  store float 0.000000e+00, float addrspace(1)* %24, align 4, !tbaa !7
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %22
  store float 0.000000e+00, float addrspace(1)* %25, align 4, !tbaa !7
  %26 = icmp sgt i32 %8, 0
  br i1 %26, label %27, label %125

27:                                               ; preds = %21
  %28 = and i32 %8, 3
  %29 = icmp ult i32 %8, 4
  br i1 %29, label %101, label %30

30:                                               ; preds = %27
  %31 = and i32 %8, -4
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi i32 [ 0, %30 ], [ %98, %32 ]
  %34 = phi i32 [ 0, %30 ], [ %99, %32 ]
  %35 = mul i32 %19, %33
  %36 = add nsw i32 %35, %18
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7
  %40 = load float, float addrspace(1)* %23, align 4, !tbaa !7
  %41 = fadd contract float %39, %40
  store float %41, float addrspace(1)* %23, align 4, !tbaa !7
  %42 = getelementptr inbounds float, float addrspace(1)* %4, i64 %37
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %45 = fadd contract float %43, %44
  store float %45, float addrspace(1)* %24, align 4, !tbaa !7
  %46 = getelementptr inbounds float, float addrspace(1)* %5, i64 %37
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %49 = fadd contract float %47, %48
  store float %49, float addrspace(1)* %25, align 4, !tbaa !7
  %50 = or i32 %33, 1
  %51 = mul i32 %19, %50
  %52 = add nsw i32 %51, %18
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = load float, float addrspace(1)* %23, align 4, !tbaa !7
  %57 = fadd contract float %55, %56
  store float %57, float addrspace(1)* %23, align 4, !tbaa !7
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %53
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(1)* %24, align 4, !tbaa !7
  %62 = getelementptr inbounds float, float addrspace(1)* %5, i64 %53
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %65 = fadd contract float %63, %64
  store float %65, float addrspace(1)* %25, align 4, !tbaa !7
  %66 = or i32 %33, 2
  %67 = mul i32 %19, %66
  %68 = add nsw i32 %67, %18
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %3, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = load float, float addrspace(1)* %23, align 4, !tbaa !7
  %73 = fadd contract float %71, %72
  store float %73, float addrspace(1)* %23, align 4, !tbaa !7
  %74 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %77 = fadd contract float %75, %76
  store float %77, float addrspace(1)* %24, align 4, !tbaa !7
  %78 = getelementptr inbounds float, float addrspace(1)* %5, i64 %69
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %81 = fadd contract float %79, %80
  store float %81, float addrspace(1)* %25, align 4, !tbaa !7
  %82 = or i32 %33, 3
  %83 = mul i32 %19, %82
  %84 = add nsw i32 %83, %18
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %3, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = load float, float addrspace(1)* %23, align 4, !tbaa !7
  %89 = fadd contract float %87, %88
  store float %89, float addrspace(1)* %23, align 4, !tbaa !7
  %90 = getelementptr inbounds float, float addrspace(1)* %4, i64 %85
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %93 = fadd contract float %91, %92
  store float %93, float addrspace(1)* %24, align 4, !tbaa !7
  %94 = getelementptr inbounds float, float addrspace(1)* %5, i64 %85
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %97 = fadd contract float %95, %96
  store float %97, float addrspace(1)* %25, align 4, !tbaa !7
  %98 = add nuw nsw i32 %33, 4
  %99 = add i32 %34, 4
  %100 = icmp eq i32 %99, %31
  br i1 %100, label %101, label %32, !llvm.loop !11

101:                                              ; preds = %32, %27
  %102 = phi i32 [ 0, %27 ], [ %98, %32 ]
  %103 = icmp eq i32 %28, 0
  br i1 %103, label %125, label %104

104:                                              ; preds = %101, %104
  %105 = phi i32 [ %122, %104 ], [ %102, %101 ]
  %106 = phi i32 [ %123, %104 ], [ 0, %101 ]
  %107 = mul i32 %19, %105
  %108 = add nsw i32 %107, %18
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %3, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = load float, float addrspace(1)* %23, align 4, !tbaa !7
  %113 = fadd contract float %111, %112
  store float %113, float addrspace(1)* %23, align 4, !tbaa !7
  %114 = getelementptr inbounds float, float addrspace(1)* %4, i64 %109
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %117 = fadd contract float %115, %116
  store float %117, float addrspace(1)* %24, align 4, !tbaa !7
  %118 = getelementptr inbounds float, float addrspace(1)* %5, i64 %109
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %121 = fadd contract float %119, %120
  store float %121, float addrspace(1)* %25, align 4, !tbaa !7
  %122 = add nuw nsw i32 %105, 1
  %123 = add i32 %106, 1
  %124 = icmp eq i32 %123, %28
  br i1 %124, label %125, label %104, !llvm.loop !13

125:                                              ; preds = %101, %104, %21
  %126 = load float, float addrspace(1)* %23, align 4, !tbaa !7
  %127 = sitofp i32 %8 to float
  %128 = fdiv contract float %126, %127
  store float %128, float addrspace(1)* %23, align 4, !tbaa !7
  %129 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %130 = fdiv contract float %129, %127
  store float %130, float addrspace(1)* %24, align 4, !tbaa !7
  %131 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %132 = fdiv contract float %131, %127
  store float %132, float addrspace(1)* %25, align 4, !tbaa !7
  br label %133

133:                                              ; preds = %125, %9
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
