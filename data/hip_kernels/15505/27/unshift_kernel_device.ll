; ModuleID = '../data/hip_kernels/15505/27/main.cu'
source_filename = "../data/hip_kernels/15505/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14unshift_kernelPKfPfiiiiif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = add i32 %16, %9
  %18 = freeze i32 %17
  %19 = freeze i32 %2
  %20 = sdiv i32 %18, %19
  %21 = mul i32 %20, %19
  %22 = sub i32 %18, %21
  %23 = add nsw i32 %22, %5
  %24 = add nsw i32 %20, %6
  %25 = icmp sgt i32 %2, -1
  %26 = icmp slt i32 %20, %3
  %27 = select i1 %25, i1 %26, i1 false
  %28 = icmp slt i32 %23, %2
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %150

30:                                               ; preds = %8
  %31 = icmp sge i32 %24, %3
  %32 = or i32 %23, %24
  %33 = icmp slt i32 %32, 0
  %34 = select i1 %31, i1 true, i1 %33
  br i1 %34, label %150, label %35

35:                                               ; preds = %30
  %36 = fcmp contract ogt float %7, 0.000000e+00
  %37 = mul nsw i32 %24, %2
  %38 = add nsw i32 %37, %23
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = mul nsw i32 %20, %2
  %42 = add nsw i32 %41, %22
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = icmp eq i32 %4, 0
  br i1 %36, label %46, label %88

46:                                               ; preds = %35
  br i1 %45, label %150, label %47

47:                                               ; preds = %46
  %48 = mul nsw i32 %3, %2
  %49 = sext i32 %48 to i64
  %50 = sext i32 %4 to i64
  %51 = and i64 %50, 3
  %52 = icmp ult i32 %4, 4
  br i1 %52, label %122, label %53

53:                                               ; preds = %47
  %54 = and i64 %50, -4
  br label %55

55:                                               ; preds = %55, %53
  %56 = phi i64 [ 0, %53 ], [ %85, %55 ]
  %57 = phi i64 [ 0, %53 ], [ %86, %55 ]
  %58 = mul i64 %56, %49
  %59 = getelementptr inbounds float, float addrspace(1)* %40, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = getelementptr inbounds float, float addrspace(1)* %44, i64 %58
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fadd contract float %60, %62
  store float %63, float addrspace(1)* %61, align 4, !tbaa !7
  %64 = or i64 %56, 1
  %65 = mul i64 %64, %49
  %66 = getelementptr inbounds float, float addrspace(1)* %40, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = getelementptr inbounds float, float addrspace(1)* %44, i64 %65
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fadd contract float %67, %69
  store float %70, float addrspace(1)* %68, align 4, !tbaa !7
  %71 = or i64 %56, 2
  %72 = mul i64 %71, %49
  %73 = getelementptr inbounds float, float addrspace(1)* %40, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = getelementptr inbounds float, float addrspace(1)* %44, i64 %72
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fadd contract float %74, %76
  store float %77, float addrspace(1)* %75, align 4, !tbaa !7
  %78 = or i64 %56, 3
  %79 = mul i64 %78, %49
  %80 = getelementptr inbounds float, float addrspace(1)* %40, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = getelementptr inbounds float, float addrspace(1)* %44, i64 %79
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = fadd contract float %81, %83
  store float %84, float addrspace(1)* %82, align 4, !tbaa !7
  %85 = add nuw i64 %56, 4
  %86 = add i64 %57, 4
  %87 = icmp eq i64 %86, %54
  br i1 %87, label %122, label %55, !llvm.loop !11

88:                                               ; preds = %35
  br i1 %45, label %150, label %89

89:                                               ; preds = %88
  %90 = mul nsw i32 %3, %2
  %91 = sext i32 %90 to i64
  %92 = sext i32 %4 to i64
  %93 = and i64 %92, 3
  %94 = icmp ult i32 %4, 4
  br i1 %94, label %137, label %95

95:                                               ; preds = %89
  %96 = and i64 %92, -4
  br label %97

97:                                               ; preds = %97, %95
  %98 = phi i64 [ 0, %95 ], [ %119, %97 ]
  %99 = phi i64 [ 0, %95 ], [ %120, %97 ]
  %100 = mul i64 %98, %91
  %101 = getelementptr inbounds float, float addrspace(1)* %40, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = getelementptr inbounds float, float addrspace(1)* %44, i64 %100
  store float %102, float addrspace(1)* %103, align 4, !tbaa !7
  %104 = or i64 %98, 1
  %105 = mul i64 %104, %91
  %106 = getelementptr inbounds float, float addrspace(1)* %40, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = getelementptr inbounds float, float addrspace(1)* %44, i64 %105
  store float %107, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = or i64 %98, 2
  %110 = mul i64 %109, %91
  %111 = getelementptr inbounds float, float addrspace(1)* %40, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = getelementptr inbounds float, float addrspace(1)* %44, i64 %110
  store float %112, float addrspace(1)* %113, align 4, !tbaa !7
  %114 = or i64 %98, 3
  %115 = mul i64 %114, %91
  %116 = getelementptr inbounds float, float addrspace(1)* %40, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = getelementptr inbounds float, float addrspace(1)* %44, i64 %115
  store float %117, float addrspace(1)* %118, align 4, !tbaa !7
  %119 = add nuw i64 %98, 4
  %120 = add i64 %99, 4
  %121 = icmp eq i64 %120, %96
  br i1 %121, label %137, label %97, !llvm.loop !13

122:                                              ; preds = %55, %47
  %123 = phi i64 [ 0, %47 ], [ %85, %55 ]
  %124 = icmp eq i64 %51, 0
  br i1 %124, label %150, label %125

125:                                              ; preds = %122, %125
  %126 = phi i64 [ %134, %125 ], [ %123, %122 ]
  %127 = phi i64 [ %135, %125 ], [ 0, %122 ]
  %128 = mul i64 %126, %49
  %129 = getelementptr inbounds float, float addrspace(1)* %40, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %131 = getelementptr inbounds float, float addrspace(1)* %44, i64 %128
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = fadd contract float %130, %132
  store float %133, float addrspace(1)* %131, align 4, !tbaa !7
  %134 = add nuw i64 %126, 1
  %135 = add i64 %127, 1
  %136 = icmp eq i64 %135, %51
  br i1 %136, label %150, label %125, !llvm.loop !14

137:                                              ; preds = %97, %89
  %138 = phi i64 [ 0, %89 ], [ %119, %97 ]
  %139 = icmp eq i64 %93, 0
  br i1 %139, label %150, label %140

140:                                              ; preds = %137, %140
  %141 = phi i64 [ %147, %140 ], [ %138, %137 ]
  %142 = phi i64 [ %148, %140 ], [ 0, %137 ]
  %143 = mul i64 %141, %91
  %144 = getelementptr inbounds float, float addrspace(1)* %40, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %146 = getelementptr inbounds float, float addrspace(1)* %44, i64 %143
  store float %145, float addrspace(1)* %146, align 4, !tbaa !7
  %147 = add nuw i64 %141, 1
  %148 = add i64 %142, 1
  %149 = icmp eq i64 %148, %93
  br i1 %149, label %150, label %140, !llvm.loop !16

150:                                              ; preds = %137, %140, %122, %125, %88, %46, %8, %30
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
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
