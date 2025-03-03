; ModuleID = '../data/hip_kernels/11713/1/main.cu'
source_filename = "../data/hip_kernels/11713/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sArr = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13ShortestPath2PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp slt i32 %4, %2
  %7 = icmp slt i32 %5, %2
  %8 = select i1 %6, i1 %7, i1 false
  br i1 %8, label %9, label %111

9:                                                ; preds = %3
  %10 = mul nsw i32 %4, %2
  %11 = add nsw i32 %10, %5
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = getelementptr inbounds float, float addrspace(1)* %1, i64 %12
  store float %14, float addrspace(1)* %15, align 4, !tbaa !5
  %16 = load float, float addrspace(1)* %13, align 4, !tbaa !5
  %17 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %5
  store float %16, float addrspace(3)* %17, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = add i32 %2, -1
  %19 = and i32 %2, 3
  %20 = icmp ult i32 %18, 3
  br i1 %20, label %88, label %21

21:                                               ; preds = %9
  %22 = and i32 %2, -4
  br label %23

23:                                               ; preds = %84, %21
  %24 = phi i32 [ 0, %21 ], [ %85, %84 ]
  %25 = phi i32 [ 0, %21 ], [ %86, %84 ]
  %26 = icmp eq i32 %24, %5
  br i1 %26, label %39, label %27

27:                                               ; preds = %23
  %28 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %29 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %24
  %30 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %31 = mul i32 %24, %2
  %32 = add i32 %31, %5
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5
  %36 = fadd contract float %30, %35
  %37 = fcmp contract ogt float %28, %36
  br i1 %37, label %38, label %39

38:                                               ; preds = %27
  store float %36, float addrspace(1)* %15, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %27, %38, %23
  %40 = or i32 %24, 1
  %41 = icmp eq i32 %40, %5
  br i1 %41, label %54, label %42

42:                                               ; preds = %39
  %43 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %44 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %40
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %46 = mul i32 %40, %2
  %47 = add i32 %46, %5
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5
  %51 = fadd contract float %45, %50
  %52 = fcmp contract ogt float %43, %51
  br i1 %52, label %53, label %54

53:                                               ; preds = %42
  store float %51, float addrspace(1)* %15, align 4, !tbaa !5
  br label %54

54:                                               ; preds = %53, %42, %39
  %55 = or i32 %24, 2
  %56 = icmp eq i32 %55, %5
  br i1 %56, label %69, label %57

57:                                               ; preds = %54
  %58 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %59 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %55
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !5
  %61 = mul i32 %55, %2
  %62 = add i32 %61, %5
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !5
  %66 = fadd contract float %60, %65
  %67 = fcmp contract ogt float %58, %66
  br i1 %67, label %68, label %69

68:                                               ; preds = %57
  store float %66, float addrspace(1)* %15, align 4, !tbaa !5
  br label %69

69:                                               ; preds = %68, %57, %54
  %70 = or i32 %24, 3
  %71 = icmp eq i32 %70, %5
  br i1 %71, label %84, label %72

72:                                               ; preds = %69
  %73 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %74 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %70
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %76 = mul i32 %70, %2
  %77 = add i32 %76, %5
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5
  %81 = fadd contract float %75, %80
  %82 = fcmp contract ogt float %73, %81
  br i1 %82, label %83, label %84

83:                                               ; preds = %72
  store float %81, float addrspace(1)* %15, align 4, !tbaa !5
  br label %84

84:                                               ; preds = %83, %72, %69
  %85 = add nuw i32 %24, 4
  %86 = add i32 %25, 4
  %87 = icmp eq i32 %86, %22
  br i1 %87, label %88, label %23, !llvm.loop !10

88:                                               ; preds = %84, %9
  %89 = phi i32 [ 0, %9 ], [ %85, %84 ]
  %90 = icmp eq i32 %19, 0
  br i1 %90, label %111, label %91

91:                                               ; preds = %88, %107
  %92 = phi i32 [ %108, %107 ], [ %89, %88 ]
  %93 = phi i32 [ %109, %107 ], [ 0, %88 ]
  %94 = icmp eq i32 %92, %5
  br i1 %94, label %107, label %95

95:                                               ; preds = %91
  %96 = load float, float addrspace(3)* %17, align 4, !tbaa !5
  %97 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sArr, i32 0, i32 %92
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %99 = mul i32 %92, %2
  %100 = add i32 %99, %5
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5
  %104 = fadd contract float %98, %103
  %105 = fcmp contract ogt float %96, %104
  br i1 %105, label %106, label %107

106:                                              ; preds = %95
  store float %104, float addrspace(1)* %15, align 4, !tbaa !5
  br label %107

107:                                              ; preds = %106, %95, %91
  %108 = add nuw i32 %92, 1
  %109 = add i32 %93, 1
  %110 = icmp eq i32 %109, %19
  br i1 %110, label %111, label %91, !llvm.loop !12

111:                                              ; preds = %88, %107, %3
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
