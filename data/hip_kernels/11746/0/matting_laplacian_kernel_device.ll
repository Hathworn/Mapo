; ModuleID = '../data/hip_kernels/11746/0/main.cu'
source_filename = "../data/hip_kernels/11746/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24matting_laplacian_kernelPfS_iiPiS0_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7) local_unnamed_addr #0 {
  %9 = mul nsw i32 %3, %2
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %9
  br i1 %19, label %20, label %130

20:                                               ; preds = %8
  %21 = freeze i32 %18
  %22 = freeze i32 %3
  %23 = sdiv i32 %21, %22
  %24 = mul i32 %23, %22
  %25 = sub i32 %21, %24
  %26 = mul nsw i32 %25, %2
  %27 = add nsw i32 %26, %23
  %28 = add nsw i32 %7, -1
  br label %29

29:                                               ; preds = %41, %20
  %30 = phi i32 [ %28, %20 ], [ %47, %41 ]
  %31 = phi i32 [ %28, %20 ], [ %48, %41 ]
  %32 = phi i32 [ 0, %20 ], [ %49, %41 ]
  %33 = sdiv i32 %30, 2
  %34 = icmp sgt i32 %32, %31
  br i1 %34, label %50, label %35

35:                                               ; preds = %29
  %36 = sext i32 %33 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %38, -1
  %40 = icmp eq i32 %39, %27
  br i1 %40, label %50, label %41

41:                                               ; preds = %35
  %42 = icmp sgt i32 %39, %27
  %43 = add nsw i32 %33, -1
  %44 = add nsw i32 %32, %43
  %45 = add nsw i32 %33, 1
  %46 = add nsw i32 %45, %31
  %47 = select i1 %42, i32 %44, i32 %46
  %48 = select i1 %42, i32 %43, i32 %31
  %49 = select i1 %42, i32 %32, i32 %45
  br label %29

50:                                               ; preds = %29, %35
  %51 = phi i32 [ %33, %35 ], [ -1, %29 ]
  %52 = icmp eq i32 %51, -1
  br i1 %52, label %130, label %53

53:                                               ; preds = %50
  %54 = icmp sgt i32 %51, -1
  br i1 %54, label %55, label %65

55:                                               ; preds = %53, %62
  %56 = phi i32 [ %63, %62 ], [ %51, %53 ]
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = add nsw i32 %59, -1
  %61 = icmp eq i32 %60, %27
  br i1 %61, label %62, label %65

62:                                               ; preds = %55
  %63 = add nsw i32 %56, -1
  %64 = icmp eq i32 %56, 0
  br i1 %64, label %65, label %55, !llvm.loop !11

65:                                               ; preds = %55, %62, %53
  %66 = phi i32 [ %51, %53 ], [ %56, %55 ], [ -1, %62 ]
  %67 = icmp slt i32 %51, %7
  br i1 %67, label %68, label %78

68:                                               ; preds = %65, %75
  %69 = phi i32 [ %76, %75 ], [ %51, %65 ]
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = add nsw i32 %72, -1
  %74 = icmp eq i32 %73, %27
  br i1 %74, label %75, label %78

75:                                               ; preds = %68
  %76 = add nsw i32 %69, 1
  %77 = icmp slt i32 %76, %7
  br i1 %77, label %68, label %78, !llvm.loop !13

78:                                               ; preds = %68, %75, %65
  %79 = phi i32 [ %51, %65 ], [ %69, %68 ], [ %7, %75 ]
  %80 = add nsw i32 %66, 1
  %81 = icmp slt i32 %80, %79
  br i1 %81, label %82, label %130

82:                                               ; preds = %78
  %83 = sext i32 %18 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = add nsw i32 %18, %9
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = shl nsw i32 %9, 1
  %89 = add nsw i32 %18, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  br label %92

92:                                               ; preds = %82, %92
  %93 = phi i32 [ %80, %82 ], [ %128, %92 ]
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = add nsw i32 %96, -1
  %98 = getelementptr inbounds float, float addrspace(1)* %6, i64 %94
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !14
  %100 = freeze i32 %97
  %101 = freeze i32 %2
  %102 = sdiv i32 %100, %101
  %103 = mul i32 %102, %101
  %104 = sub i32 %100, %103
  %105 = mul nsw i32 %104, %3
  %106 = add nsw i32 %105, %102
  %107 = fmul contract float %99, 2.000000e+00
  %108 = sext i32 %106 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !14
  %111 = fmul contract float %107, %110
  %112 = load float, float addrspace(1)* %84, align 4, !tbaa !14
  %113 = fadd contract float %112, %111
  store float %113, float addrspace(1)* %84, align 4, !tbaa !14
  %114 = add nsw i32 %106, %9
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !14
  %118 = fmul contract float %107, %117
  %119 = load float, float addrspace(1)* %87, align 4, !tbaa !14
  %120 = fadd contract float %119, %118
  store float %120, float addrspace(1)* %87, align 4, !tbaa !14
  %121 = add nsw i32 %106, %88
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !14
  %125 = fmul contract float %107, %124
  %126 = load float, float addrspace(1)* %91, align 4, !tbaa !14
  %127 = fadd contract float %126, %125
  store float %127, float addrspace(1)* %91, align 4, !tbaa !14
  %128 = add nsw i32 %93, 1
  %129 = icmp slt i32 %128, %79
  br i1 %129, label %92, label %130, !llvm.loop !16

130:                                              ; preds = %92, %78, %50, %8
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !9, i64 0}
!16 = distinct !{!16, !12}
