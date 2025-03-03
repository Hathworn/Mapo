; ModuleID = '../data/hip_kernels/9634/7/main.cu'
source_filename = "../data/hip_kernels/9634/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4initPfS_S_S_S_S_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = add i32 %17, %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %19
  %27 = icmp slt i32 %18, %6
  %28 = icmp slt i32 %26, %7
  %29 = select i1 %27, i1 %28, i1 false
  %30 = icmp sgt i32 %8, 0
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %115

32:                                               ; preds = %9
  %33 = and i32 %8, 3
  %34 = icmp ult i32 %8, 4
  br i1 %34, label %94, label %35

35:                                               ; preds = %32
  %36 = and i32 %8, -4
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i32 [ 0, %35 ], [ %91, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %92, %37 ]
  %40 = mul i32 %38, %7
  %41 = add i32 %40, %26
  %42 = mul i32 %41, %6
  %43 = add i32 %42, %18
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %5, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  store float %46, float addrspace(1)* %47, align 4, !tbaa !7
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  store float %46, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  store float %46, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  store float 0.000000e+00, float addrspace(1)* %50, align 4, !tbaa !7
  %51 = getelementptr inbounds float, float addrspace(1)* %4, i64 %44
  store float 0.000000e+00, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = or i32 %38, 1
  %53 = mul i32 %52, %7
  %54 = add i32 %53, %26
  %55 = mul i32 %54, %6
  %56 = add i32 %55, %18
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %5, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  store float %59, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  store float %59, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  store float %59, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %57
  store float 0.000000e+00, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %57
  store float 0.000000e+00, float addrspace(1)* %64, align 4, !tbaa !7
  %65 = or i32 %38, 2
  %66 = mul i32 %65, %7
  %67 = add i32 %66, %26
  %68 = mul i32 %67, %6
  %69 = add i32 %68, %18
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %5, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  store float %72, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  store float %72, float addrspace(1)* %74, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  store float %72, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = getelementptr inbounds float, float addrspace(1)* %3, i64 %70
  store float 0.000000e+00, float addrspace(1)* %76, align 4, !tbaa !7
  %77 = getelementptr inbounds float, float addrspace(1)* %4, i64 %70
  store float 0.000000e+00, float addrspace(1)* %77, align 4, !tbaa !7
  %78 = or i32 %38, 3
  %79 = mul i32 %78, %7
  %80 = add i32 %79, %26
  %81 = mul i32 %80, %6
  %82 = add i32 %81, %18
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %5, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  store float %85, float addrspace(1)* %86, align 4, !tbaa !7
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  store float %85, float addrspace(1)* %87, align 4, !tbaa !7
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  store float %85, float addrspace(1)* %88, align 4, !tbaa !7
  %89 = getelementptr inbounds float, float addrspace(1)* %3, i64 %83
  store float 0.000000e+00, float addrspace(1)* %89, align 4, !tbaa !7
  %90 = getelementptr inbounds float, float addrspace(1)* %4, i64 %83
  store float 0.000000e+00, float addrspace(1)* %90, align 4, !tbaa !7
  %91 = add nuw nsw i32 %38, 4
  %92 = add i32 %39, 4
  %93 = icmp eq i32 %92, %36
  br i1 %93, label %94, label %37, !llvm.loop !11

94:                                               ; preds = %37, %32
  %95 = phi i32 [ 0, %32 ], [ %91, %37 ]
  %96 = icmp eq i32 %33, 0
  br i1 %96, label %115, label %97

97:                                               ; preds = %94, %97
  %98 = phi i32 [ %112, %97 ], [ %95, %94 ]
  %99 = phi i32 [ %113, %97 ], [ 0, %94 ]
  %100 = mul i32 %98, %7
  %101 = add i32 %100, %26
  %102 = mul i32 %101, %6
  %103 = add i32 %102, %18
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %5, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  store float %106, float addrspace(1)* %107, align 4, !tbaa !7
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  store float %106, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  store float %106, float addrspace(1)* %109, align 4, !tbaa !7
  %110 = getelementptr inbounds float, float addrspace(1)* %3, i64 %104
  store float 0.000000e+00, float addrspace(1)* %110, align 4, !tbaa !7
  %111 = getelementptr inbounds float, float addrspace(1)* %4, i64 %104
  store float 0.000000e+00, float addrspace(1)* %111, align 4, !tbaa !7
  %112 = add nuw nsw i32 %98, 1
  %113 = add i32 %99, 1
  %114 = icmp eq i32 %113, %33
  br i1 %114, label %115, label %97, !llvm.loop !13

115:                                              ; preds = %94, %97, %9
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
