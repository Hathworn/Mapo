; ModuleID = '../data/hip_kernels/745/5/main.cu'
source_filename = "../data/hip_kernels/745/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23cuda_Shrink_CalU_VectorPfS_S_fS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = icmp ult i32 %17, %6
  %27 = icmp ult i32 %25, %5
  %28 = select i1 %26, i1 %27, i1 false
  %29 = icmp sgt i32 %7, 0
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %124

31:                                               ; preds = %8
  %32 = mul nsw i32 %6, %5
  %33 = sitofp i32 %32 to float
  %34 = and i32 %7, 1
  %35 = icmp eq i32 %7, 1
  br i1 %35, label %95, label %36

36:                                               ; preds = %31
  %37 = and i32 %7, -2
  br label %38

38:                                               ; preds = %38, %36
  %39 = phi i32 [ 0, %36 ], [ %92, %38 ]
  %40 = phi i32 [ 0, %36 ], [ %93, %38 ]
  %41 = mul nsw i32 %39, %5
  %42 = add i32 %41, %25
  %43 = mul i32 %42, %6
  %44 = add i32 %43, %17
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = fdiv contract float %47, %33
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = zext i32 %39 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fmul contract float %53, %3
  %55 = fadd contract float %48, %50
  %56 = tail call float @llvm.fabs.f32(float %55)
  %57 = fsub contract float %56, %54
  %58 = fneg contract float %57
  %59 = bitcast float %58 to i32
  %60 = icmp slt i32 %59, 0
  %61 = uitofp i1 %60 to float
  %62 = tail call float @llvm.copysign.f32(float %57, float %55)
  %63 = fmul contract float %62, %61
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  store float %63, float addrspace(1)* %64, align 4, !tbaa !7
  %65 = fsub contract float %55, %63
  store float %65, float addrspace(1)* %49, align 4, !tbaa !7
  %66 = or i32 %39, 1
  %67 = mul nsw i32 %66, %5
  %68 = add i32 %67, %25
  %69 = mul i32 %68, %6
  %70 = add i32 %69, %17
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = fdiv contract float %73, %33
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = zext i32 %66 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %4, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fmul contract float %79, %3
  %81 = fadd contract float %74, %76
  %82 = tail call float @llvm.fabs.f32(float %81)
  %83 = fsub contract float %82, %80
  %84 = fneg contract float %83
  %85 = bitcast float %84 to i32
  %86 = icmp slt i32 %85, 0
  %87 = uitofp i1 %86 to float
  %88 = tail call float @llvm.copysign.f32(float %83, float %81)
  %89 = fmul contract float %88, %87
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float %89, float addrspace(1)* %90, align 4, !tbaa !7
  %91 = fsub contract float %81, %89
  store float %91, float addrspace(1)* %75, align 4, !tbaa !7
  %92 = add nuw nsw i32 %39, 2
  %93 = add i32 %40, 2
  %94 = icmp eq i32 %93, %37
  br i1 %94, label %95, label %38, !llvm.loop !11

95:                                               ; preds = %38, %31
  %96 = phi i32 [ 0, %31 ], [ %92, %38 ]
  %97 = icmp eq i32 %34, 0
  br i1 %97, label %124, label %98

98:                                               ; preds = %95
  %99 = mul nsw i32 %96, %5
  %100 = add i32 %99, %25
  %101 = mul i32 %100, %6
  %102 = add i32 %101, %17
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = fdiv contract float %105, %33
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = zext i32 %96 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %4, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = fmul contract float %111, %3
  %113 = fadd contract float %106, %108
  %114 = tail call float @llvm.fabs.f32(float %113)
  %115 = fsub contract float %114, %112
  %116 = fneg contract float %115
  %117 = bitcast float %116 to i32
  %118 = icmp slt i32 %117, 0
  %119 = uitofp i1 %118 to float
  %120 = tail call float @llvm.copysign.f32(float %115, float %113)
  %121 = fmul contract float %120, %119
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  store float %121, float addrspace(1)* %122, align 4, !tbaa !7
  %123 = fsub contract float %113, %121
  store float %123, float addrspace(1)* %107, align 4, !tbaa !7
  br label %124

124:                                              ; preds = %98, %95, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
