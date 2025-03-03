; ModuleID = '../data/hip_kernels/15412/9/main.cu'
source_filename = "../data/hip_kernels/15412/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26assisted_activation_kernelfPfS_S_iii(float %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = freeze i32 %16
  %18 = freeze i32 %4
  %19 = sdiv i32 %17, %18
  %20 = mul i32 %19, %18
  %21 = sub i32 %17, %20
  %22 = icmp slt i32 %19, %6
  %23 = icmp sgt i32 %5, 0
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %107

25:                                               ; preds = %7
  %26 = sext i32 %16 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %28 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %29 = mul nsw i32 %19, %5
  %30 = and i32 %5, 3
  %31 = icmp ult i32 %5, 4
  br i1 %31, label %87, label %32

32:                                               ; preds = %25
  %33 = and i32 %5, -4
  br label %34

34:                                               ; preds = %34, %32
  %35 = phi i32 [ 0, %32 ], [ %84, %34 ]
  %36 = phi i32 [ 0, %32 ], [ %85, %34 ]
  %37 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %38 = fmul contract float %37, %0
  %39 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %40 = fmul contract float %38, %39
  %41 = add nsw i32 %35, %29
  %42 = mul nsw i32 %41, %4
  %43 = add nsw i32 %42, %21
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fadd contract float %46, %40
  store float %47, float addrspace(1)* %45, align 4, !tbaa !7
  %48 = or i32 %35, 1
  %49 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %50 = fmul contract float %49, %0
  %51 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %52 = fmul contract float %50, %51
  %53 = add nsw i32 %48, %29
  %54 = mul nsw i32 %53, %4
  %55 = add nsw i32 %54, %21
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = fadd contract float %58, %52
  store float %59, float addrspace(1)* %57, align 4, !tbaa !7
  %60 = or i32 %35, 2
  %61 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %62 = fmul contract float %61, %0
  %63 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %64 = fmul contract float %62, %63
  %65 = add nsw i32 %60, %29
  %66 = mul nsw i32 %65, %4
  %67 = add nsw i32 %66, %21
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fadd contract float %70, %64
  store float %71, float addrspace(1)* %69, align 4, !tbaa !7
  %72 = or i32 %35, 3
  %73 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %74 = fmul contract float %73, %0
  %75 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %76 = fmul contract float %74, %75
  %77 = add nsw i32 %72, %29
  %78 = mul nsw i32 %77, %4
  %79 = add nsw i32 %78, %21
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fadd contract float %82, %76
  store float %83, float addrspace(1)* %81, align 4, !tbaa !7
  %84 = add nuw nsw i32 %35, 4
  %85 = add i32 %36, 4
  %86 = icmp eq i32 %85, %33
  br i1 %86, label %87, label %34, !llvm.loop !11

87:                                               ; preds = %34, %25
  %88 = phi i32 [ 0, %25 ], [ %84, %34 ]
  %89 = icmp eq i32 %30, 0
  br i1 %89, label %107, label %90

90:                                               ; preds = %87, %90
  %91 = phi i32 [ %104, %90 ], [ %88, %87 ]
  %92 = phi i32 [ %105, %90 ], [ 0, %87 ]
  %93 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %94 = fmul contract float %93, %0
  %95 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %96 = fmul contract float %94, %95
  %97 = add nsw i32 %91, %29
  %98 = mul nsw i32 %97, %4
  %99 = add nsw i32 %98, %21
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %1, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fadd contract float %102, %96
  store float %103, float addrspace(1)* %101, align 4, !tbaa !7
  %104 = add nuw nsw i32 %91, 1
  %105 = add i32 %92, 1
  %106 = icmp eq i32 %105, %30
  br i1 %106, label %107, label %90, !llvm.loop !13

107:                                              ; preds = %87, %90, %7
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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
