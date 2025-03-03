; ModuleID = '../data/hip_kernels/580/1/main.cu'
source_filename = "../data/hip_kernels/580/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6sum_ccPfS_S_iiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = add nsw i32 %17, %6
  %19 = icmp slt i32 %18, %5
  %20 = icmp slt i32 %17, %7
  %21 = and i1 %20, %19
  br i1 %21, label %22, label %124

22:                                               ; preds = %8
  %23 = mul i32 %4, %3
  %24 = mul i32 %23, %17
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = icmp sgt i32 %23, 0
  br i1 %27, label %28, label %124

28:                                               ; preds = %22
  %29 = sext i32 %17 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %32 = and i32 %23, 7
  %33 = icmp ult i32 %23, 8
  br i1 %33, label %106, label %34

34:                                               ; preds = %28
  %35 = and i32 %23, -8
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi float [ %31, %34 ], [ %102, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %103, %36 ]
  %39 = phi i32 [ 0, %34 ], [ %104, %36 ]
  %40 = zext i32 %38 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %26, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = fmul contract float %42, %44
  %46 = fadd contract float %37, %45
  store float %46, float addrspace(1)* %30, align 4, !tbaa !7
  %47 = or i32 %38, 1
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %26, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fmul contract float %50, %52
  %54 = fadd contract float %46, %53
  store float %54, float addrspace(1)* %30, align 4, !tbaa !7
  %55 = or i32 %38, 2
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %26, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fmul contract float %58, %60
  %62 = fadd contract float %54, %61
  store float %62, float addrspace(1)* %30, align 4, !tbaa !7
  %63 = or i32 %38, 3
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %26, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fmul contract float %66, %68
  %70 = fadd contract float %62, %69
  store float %70, float addrspace(1)* %30, align 4, !tbaa !7
  %71 = or i32 %38, 4
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %26, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fmul contract float %74, %76
  %78 = fadd contract float %70, %77
  store float %78, float addrspace(1)* %30, align 4, !tbaa !7
  %79 = or i32 %38, 5
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %26, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = fmul contract float %82, %84
  %86 = fadd contract float %78, %85
  store float %86, float addrspace(1)* %30, align 4, !tbaa !7
  %87 = or i32 %38, 6
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %26, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %88
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fmul contract float %90, %92
  %94 = fadd contract float %86, %93
  store float %94, float addrspace(1)* %30, align 4, !tbaa !7
  %95 = or i32 %38, 7
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %26, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %96
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fmul contract float %98, %100
  %102 = fadd contract float %94, %101
  store float %102, float addrspace(1)* %30, align 4, !tbaa !7
  %103 = add nuw nsw i32 %38, 8
  %104 = add i32 %39, 8
  %105 = icmp eq i32 %104, %35
  br i1 %105, label %106, label %36, !llvm.loop !11

106:                                              ; preds = %36, %28
  %107 = phi float [ %31, %28 ], [ %102, %36 ]
  %108 = phi i32 [ 0, %28 ], [ %103, %36 ]
  %109 = icmp eq i32 %32, 0
  br i1 %109, label %124, label %110

110:                                              ; preds = %106, %110
  %111 = phi float [ %120, %110 ], [ %107, %106 ]
  %112 = phi i32 [ %121, %110 ], [ %108, %106 ]
  %113 = phi i32 [ %122, %110 ], [ 0, %106 ]
  %114 = zext i32 %112 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %26, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = fmul contract float %116, %118
  %120 = fadd contract float %111, %119
  store float %120, float addrspace(1)* %30, align 4, !tbaa !7
  %121 = add nuw nsw i32 %112, 1
  %122 = add i32 %113, 1
  %123 = icmp eq i32 %122, %32
  br i1 %123, label %124, label %110, !llvm.loop !13

124:                                              ; preds = %106, %110, %22, %8
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
