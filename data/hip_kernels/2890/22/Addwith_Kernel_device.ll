; ModuleID = '../data/hip_kernels/2890/22/main.cu'
source_filename = "../data/hip_kernels/2890/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14Addwith_KernelPfPKffiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp slt i32 %15, %3
  %25 = icmp slt i32 %23, %4
  %26 = select i1 %24, i1 %25, i1 false
  %27 = icmp sgt i32 %5, 0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %131

29:                                               ; preds = %6
  %30 = mul nsw i32 %23, %3
  %31 = add nsw i32 %30, %15
  %32 = mul nsw i32 %31, %5
  %33 = and i32 %5, 7
  %34 = icmp ult i32 %5, 8
  br i1 %34, label %114, label %35

35:                                               ; preds = %29
  %36 = and i32 %5, -8
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i32 [ 0, %35 ], [ %111, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %112, %37 ]
  %40 = add nsw i32 %38, %32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = fmul contract float %43, %2
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fadd contract float %46, %44
  store float %47, float addrspace(1)* %45, align 4, !tbaa !7
  %48 = or i32 %38, 1
  %49 = add nsw i32 %48, %32
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fmul contract float %52, %2
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fadd contract float %55, %53
  store float %56, float addrspace(1)* %54, align 4, !tbaa !7
  %57 = or i32 %38, 2
  %58 = add nsw i32 %57, %32
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fmul contract float %61, %2
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fadd contract float %64, %62
  store float %65, float addrspace(1)* %63, align 4, !tbaa !7
  %66 = or i32 %38, 3
  %67 = add nsw i32 %66, %32
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fmul contract float %70, %2
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = fadd contract float %73, %71
  store float %74, float addrspace(1)* %72, align 4, !tbaa !7
  %75 = or i32 %38, 4
  %76 = add nsw i32 %75, %32
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fmul contract float %79, %2
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fadd contract float %82, %80
  store float %83, float addrspace(1)* %81, align 4, !tbaa !7
  %84 = or i32 %38, 5
  %85 = add nsw i32 %84, %32
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fmul contract float %88, %2
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fadd contract float %91, %89
  store float %92, float addrspace(1)* %90, align 4, !tbaa !7
  %93 = or i32 %38, 6
  %94 = add nsw i32 %93, %32
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = fmul contract float %97, %2
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fadd contract float %100, %98
  store float %101, float addrspace(1)* %99, align 4, !tbaa !7
  %102 = or i32 %38, 7
  %103 = add nsw i32 %102, %32
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fmul contract float %106, %2
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = fadd contract float %109, %107
  store float %110, float addrspace(1)* %108, align 4, !tbaa !7
  %111 = add nuw nsw i32 %38, 8
  %112 = add i32 %39, 8
  %113 = icmp eq i32 %112, %36
  br i1 %113, label %114, label %37, !llvm.loop !11

114:                                              ; preds = %37, %29
  %115 = phi i32 [ 0, %29 ], [ %111, %37 ]
  %116 = icmp eq i32 %33, 0
  br i1 %116, label %131, label %117

117:                                              ; preds = %114, %117
  %118 = phi i32 [ %128, %117 ], [ %115, %114 ]
  %119 = phi i32 [ %129, %117 ], [ 0, %114 ]
  %120 = add nsw i32 %118, %32
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7
  %124 = fmul contract float %123, %2
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = fadd contract float %126, %124
  store float %127, float addrspace(1)* %125, align 4, !tbaa !7
  %128 = add nuw nsw i32 %118, 1
  %129 = add i32 %119, 1
  %130 = icmp eq i32 %129, %33
  br i1 %130, label %131, label %117, !llvm.loop !13

131:                                              ; preds = %114, %117, %6
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
