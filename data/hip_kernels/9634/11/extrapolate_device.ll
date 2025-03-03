; ModuleID = '../data/hip_kernels/9634/11/main.cu'
source_filename = "../data/hip_kernels/9634/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11extrapolatePfS_S_fiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = add i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = icmp slt i32 %16, %4
  %26 = icmp slt i32 %24, %5
  %27 = select i1 %25, i1 %26, i1 false
  %28 = icmp sgt i32 %6, 0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %123

30:                                               ; preds = %7
  %31 = and i32 %6, 3
  %32 = icmp ult i32 %6, 4
  br i1 %32, label %100, label %33

33:                                               ; preds = %30
  %34 = and i32 %6, -4
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi i32 [ 0, %33 ], [ %97, %35 ]
  %37 = phi i32 [ 0, %33 ], [ %98, %35 ]
  %38 = mul i32 %36, %5
  %39 = add i32 %38, %24
  %40 = mul i32 %39, %4
  %41 = add i32 %40, %16
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fsub contract float %44, %46
  %48 = fmul contract float %47, %3
  %49 = fadd contract float %44, %48
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  store float %49, float addrspace(1)* %50, align 4, !tbaa !7
  %51 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  store float %51, float addrspace(1)* %45, align 4, !tbaa !7
  %52 = or i32 %36, 1
  %53 = mul i32 %52, %5
  %54 = add i32 %53, %24
  %55 = mul i32 %54, %4
  %56 = add i32 %55, %16
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fsub contract float %59, %61
  %63 = fmul contract float %62, %3
  %64 = fadd contract float %59, %63
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  store float %64, float addrspace(1)* %65, align 4, !tbaa !7
  %66 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  store float %66, float addrspace(1)* %60, align 4, !tbaa !7
  %67 = or i32 %36, 2
  %68 = mul i32 %67, %5
  %69 = add i32 %68, %24
  %70 = mul i32 %69, %4
  %71 = add i32 %70, %16
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fsub contract float %74, %76
  %78 = fmul contract float %77, %3
  %79 = fadd contract float %74, %78
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  store float %79, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  store float %81, float addrspace(1)* %75, align 4, !tbaa !7
  %82 = or i32 %36, 3
  %83 = mul i32 %82, %5
  %84 = add i32 %83, %24
  %85 = mul i32 %84, %4
  %86 = add i32 %85, %16
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fsub contract float %89, %91
  %93 = fmul contract float %92, %3
  %94 = fadd contract float %89, %93
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %94, float addrspace(1)* %95, align 4, !tbaa !7
  %96 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  store float %96, float addrspace(1)* %90, align 4, !tbaa !7
  %97 = add nuw nsw i32 %36, 4
  %98 = add i32 %37, 4
  %99 = icmp eq i32 %98, %34
  br i1 %99, label %100, label %35, !llvm.loop !11

100:                                              ; preds = %35, %30
  %101 = phi i32 [ 0, %30 ], [ %97, %35 ]
  %102 = icmp eq i32 %31, 0
  br i1 %102, label %123, label %103

103:                                              ; preds = %100, %103
  %104 = phi i32 [ %120, %103 ], [ %101, %100 ]
  %105 = phi i32 [ %121, %103 ], [ 0, %100 ]
  %106 = mul i32 %104, %5
  %107 = add i32 %106, %24
  %108 = mul i32 %107, %4
  %109 = add i32 %108, %16
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = fsub contract float %112, %114
  %116 = fmul contract float %115, %3
  %117 = fadd contract float %112, %116
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  store float %117, float addrspace(1)* %118, align 4, !tbaa !7
  %119 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  store float %119, float addrspace(1)* %113, align 4, !tbaa !7
  %120 = add nuw nsw i32 %104, 1
  %121 = add i32 %105, 1
  %122 = icmp eq i32 %121, %31
  br i1 %122, label %123, label %103, !llvm.loop !13

123:                                              ; preds = %100, %103, %7
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
