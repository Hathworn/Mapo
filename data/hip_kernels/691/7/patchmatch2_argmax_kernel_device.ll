; ModuleID = '../data/hip_kernels/691/7/main.cu'
source_filename = "../data/hip_kernels/691/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25patchmatch2_argmax_kernelPfPiS0_iiii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul nsw i32 %6, %5
  %18 = shl i32 %3, 1
  %19 = add nuw nsw i32 %18, 1
  %20 = icmp slt i32 %16, %17
  br i1 %20, label %21, label %106

21:                                               ; preds = %7
  %22 = shl nsw i32 %16, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = add nuw nsw i32 %22, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = sub i32 0, %3
  %31 = icmp slt i32 %3, 0
  br i1 %31, label %106, label %32

32:                                               ; preds = %21
  %33 = mul i32 %16, %19
  %34 = add i32 %33, %3
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %23
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  %37 = sub i32 %29, %3
  %38 = icmp sgt i32 %37, -1
  %39 = icmp slt i32 %37, %5
  %40 = mul i32 %33, %19
  %41 = sub i32 1, %3
  %42 = icmp eq i32 %18, 0
  br label %43

43:                                               ; preds = %32, %62
  %44 = phi float [ -1.000000e+00, %32 ], [ %63, %62 ]
  %45 = phi i32 [ %30, %32 ], [ %64, %62 ]
  %46 = add nsw i32 %45, %25
  %47 = icmp sgt i32 %46, -1
  %48 = icmp slt i32 %46, %6
  %49 = add i32 %45, %3
  %50 = select i1 %48, i1 %38, i1 false
  %51 = select i1 %50, i1 %39, i1 false
  %52 = select i1 %47, i1 %51, i1 false
  br i1 %52, label %53, label %60

53:                                               ; preds = %43
  %54 = add i32 %49, %40
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11, !amdgpu.noclobber !5
  %58 = fcmp contract ogt float %57, %44
  br i1 %58, label %59, label %60

59:                                               ; preds = %53
  store i32 %46, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %37, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %43, %53, %59
  %61 = phi float [ %44, %43 ], [ %57, %59 ], [ %44, %53 ]
  br i1 %42, label %62, label %66

62:                                               ; preds = %102, %60
  %63 = phi float [ %61, %60 ], [ %103, %102 ]
  %64 = add i32 %45, 1
  %65 = icmp eq i32 %45, %3
  br i1 %65, label %106, label %43, !llvm.loop !13

66:                                               ; preds = %60, %102
  %67 = phi float [ %103, %102 ], [ %61, %60 ]
  %68 = phi i32 [ %104, %102 ], [ %41, %60 ]
  %69 = add nsw i32 %68, %29
  br i1 %47, label %70, label %84

70:                                               ; preds = %66
  %71 = icmp sgt i32 %69, -1
  %72 = select i1 %48, i1 %71, i1 false
  %73 = icmp slt i32 %69, %5
  %74 = select i1 %72, i1 %73, i1 false
  br i1 %74, label %75, label %84

75:                                               ; preds = %70
  %76 = add i32 %34, %68
  %77 = mul i32 %76, %19
  %78 = add i32 %49, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11, !amdgpu.noclobber !5
  %82 = fcmp contract ogt float %81, %67
  br i1 %82, label %83, label %84

83:                                               ; preds = %75
  store i32 %46, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %69, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %75, %83, %70, %66
  %85 = phi float [ %67, %70 ], [ %67, %66 ], [ %81, %83 ], [ %67, %75 ]
  %86 = add i32 %68, 1
  %87 = add nsw i32 %86, %29
  br i1 %47, label %88, label %102

88:                                               ; preds = %84
  %89 = icmp sgt i32 %87, -1
  %90 = select i1 %48, i1 %89, i1 false
  %91 = icmp slt i32 %87, %5
  %92 = select i1 %90, i1 %91, i1 false
  br i1 %92, label %93, label %102

93:                                               ; preds = %88
  %94 = add i32 %34, %86
  %95 = mul i32 %94, %19
  %96 = add i32 %49, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !11, !amdgpu.noclobber !5
  %100 = fcmp contract ogt float %99, %85
  br i1 %100, label %101, label %102

101:                                              ; preds = %93
  store i32 %46, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %87, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %102

102:                                              ; preds = %101, %93, %88, %84
  %103 = phi float [ %85, %88 ], [ %85, %84 ], [ %99, %101 ], [ %85, %93 ]
  %104 = add i32 %68, 2
  %105 = icmp eq i32 %86, %3
  br i1 %105, label %62, label %66, !llvm.loop !15

106:                                              ; preds = %62, %21, %7
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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
