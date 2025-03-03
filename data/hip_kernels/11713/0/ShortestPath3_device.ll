; ModuleID = '../data/hip_kernels/11713/0/main.cu'
source_filename = "../data/hip_kernels/11713/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sArr = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13ShortestPath3PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp slt i32 %4, %2
  %7 = icmp slt i32 %5, %2
  %8 = select i1 %6, i1 %7, i1 false
  br i1 %8, label %9, label %129

9:                                                ; preds = %3
  %10 = mul nsw i32 %4, %2
  %11 = add nsw i32 %10, %5
  %12 = lshr i32 %2, 2
  br label %13

13:                                               ; preds = %9, %17
  %14 = phi i32 [ 0, %9 ], [ %23, %17 ]
  %15 = add nuw i32 %14, %5
  %16 = icmp ugt i32 %15, %2
  br i1 %16, label %25, label %17

17:                                               ; preds = %13
  %18 = add nsw i32 %14, %11
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %15
  store float %21, float addrspace(3)* %22, align 4, !tbaa !5
  %23 = add nuw nsw i32 %14, %12
  %24 = icmp slt i32 %23, %2
  br i1 %24, label %13, label %25, !llvm.loop !10

25:                                               ; preds = %17, %13
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = sdiv i32 %2, 4
  %27 = add i32 %2, -1
  %28 = and i32 %2, 3
  %29 = icmp ult i32 %27, 3
  %30 = and i32 %2, -4
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %25, %126
  %33 = phi i32 [ 0, %25 ], [ %127, %126 ]
  %34 = add i32 %33, %5
  %35 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %34
  %36 = add nsw i32 %33, %11
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  br i1 %29, label %104, label %39

39:                                               ; preds = %32, %100
  %40 = phi i32 [ %101, %100 ], [ 0, %32 ]
  %41 = phi i32 [ %102, %100 ], [ 0, %32 ]
  %42 = icmp eq i32 %40, %34
  br i1 %42, label %55, label %43

43:                                               ; preds = %39
  %44 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %45 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %40
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %47 = mul i32 %40, %2
  %48 = add i32 %34, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5
  %52 = fadd contract float %46, %51
  %53 = fcmp contract ogt float %44, %52
  br i1 %53, label %54, label %55

54:                                               ; preds = %43
  store float %52, float addrspace(1)* %38, align 4, !tbaa !5
  br label %55

55:                                               ; preds = %43, %54, %39
  %56 = or i32 %40, 1
  %57 = icmp eq i32 %56, %34
  br i1 %57, label %70, label %58

58:                                               ; preds = %55
  %59 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %60 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %56
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %62 = mul i32 %56, %2
  %63 = add i32 %34, %62
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = fadd contract float %61, %66
  %68 = fcmp contract ogt float %59, %67
  br i1 %68, label %69, label %70

69:                                               ; preds = %58
  store float %67, float addrspace(1)* %38, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %69, %58, %55
  %71 = or i32 %40, 2
  %72 = icmp eq i32 %71, %34
  br i1 %72, label %85, label %73

73:                                               ; preds = %70
  %74 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %75 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %71
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !5
  %77 = mul i32 %71, %2
  %78 = add i32 %34, %77
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5
  %82 = fadd contract float %76, %81
  %83 = fcmp contract ogt float %74, %82
  br i1 %83, label %84, label %85

84:                                               ; preds = %73
  store float %82, float addrspace(1)* %38, align 4, !tbaa !5
  br label %85

85:                                               ; preds = %84, %73, %70
  %86 = or i32 %40, 3
  %87 = icmp eq i32 %86, %34
  br i1 %87, label %100, label %88

88:                                               ; preds = %85
  %89 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %90 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %86
  %91 = load float, float addrspace(3)* %90, align 4, !tbaa !5
  %92 = mul i32 %86, %2
  %93 = add i32 %34, %92
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5
  %97 = fadd contract float %91, %96
  %98 = fcmp contract ogt float %89, %97
  br i1 %98, label %99, label %100

99:                                               ; preds = %88
  store float %97, float addrspace(1)* %38, align 4, !tbaa !5
  br label %100

100:                                              ; preds = %99, %88, %85
  %101 = add nuw i32 %40, 4
  %102 = add i32 %41, 4
  %103 = icmp eq i32 %102, %30
  br i1 %103, label %104, label %39, !llvm.loop !12

104:                                              ; preds = %100, %32
  %105 = phi i32 [ 0, %32 ], [ %101, %100 ]
  br i1 %31, label %126, label %106

106:                                              ; preds = %104, %122
  %107 = phi i32 [ %123, %122 ], [ %105, %104 ]
  %108 = phi i32 [ %124, %122 ], [ 0, %104 ]
  %109 = icmp eq i32 %107, %34
  br i1 %109, label %122, label %110

110:                                              ; preds = %106
  %111 = load float, float addrspace(3)* %35, align 4, !tbaa !5
  %112 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %107
  %113 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %114 = mul i32 %107, %2
  %115 = add i32 %34, %114
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5
  %119 = fadd contract float %113, %118
  %120 = fcmp contract ogt float %111, %119
  br i1 %120, label %121, label %122

121:                                              ; preds = %110
  store float %119, float addrspace(1)* %38, align 4, !tbaa !5
  br label %122

122:                                              ; preds = %121, %110, %106
  %123 = add nuw i32 %107, 1
  %124 = add i32 %108, 1
  %125 = icmp eq i32 %124, %28
  br i1 %125, label %126, label %106, !llvm.loop !13

126:                                              ; preds = %122, %104
  %127 = add nsw i32 %33, %26
  %128 = icmp slt i32 %127, %2
  br i1 %128, label %32, label %129, !llvm.loop !15

129:                                              ; preds = %126, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !11}
