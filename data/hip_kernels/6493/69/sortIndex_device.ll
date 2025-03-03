; ModuleID = '../data/hip_kernels/6493/69/main.cu'
source_filename = "../data/hip_kernels/6493/69/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9sortIndexiiPKfPiPf(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %14, %0
  %24 = icmp slt i32 %22, %1
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %141

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %0
  %28 = add nsw i32 %27, %14
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = icmp sgt i32 %1, 0
  br i1 %32, label %33, label %71

33:                                               ; preds = %26
  %34 = and i32 %1, 1
  %35 = icmp eq i32 %1, 1
  br i1 %35, label %38, label %36

36:                                               ; preds = %33
  %37 = and i32 %1, -2
  br label %76

38:                                               ; preds = %135, %33
  %39 = phi i32 [ undef, %33 ], [ %136, %135 ]
  %40 = phi float [ undef, %33 ], [ %137, %135 ]
  %41 = phi i32 [ 0, %33 ], [ %138, %135 ]
  %42 = phi float [ %31, %33 ], [ %137, %135 ]
  %43 = phi i32 [ %22, %33 ], [ %136, %135 ]
  %44 = icmp eq i32 %34, 0
  br i1 %44, label %71, label %45

45:                                               ; preds = %38
  %46 = mul nsw i32 %41, %0
  %47 = add nsw i32 %46, %14
  %48 = icmp sgt i32 %41, %22
  br i1 %48, label %61, label %49

49:                                               ; preds = %45
  %50 = icmp slt i32 %41, %22
  br i1 %50, label %51, label %71

51:                                               ; preds = %49
  %52 = sext i32 %47 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = fcmp contract ogt float %54, %42
  %56 = select i1 %55, i32 %41, i32 %43
  %57 = uitofp i1 %55 to float
  %58 = fsub contract float %54, %42
  %59 = fmul contract float %58, %57
  %60 = fadd contract float %42, %59
  br label %71

61:                                               ; preds = %45
  %62 = sext i32 %47 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = fcmp contract olt float %64, %42
  %66 = select i1 %65, i32 %41, i32 %43
  %67 = uitofp i1 %65 to float
  %68 = fsub contract float %64, %42
  %69 = fmul contract float %68, %67
  %70 = fadd contract float %42, %69
  br label %71

71:                                               ; preds = %38, %61, %51, %49, %26
  %72 = phi i32 [ %22, %26 ], [ %39, %38 ], [ %66, %61 ], [ %56, %51 ], [ %43, %49 ]
  %73 = phi float [ %31, %26 ], [ %40, %38 ], [ %70, %61 ], [ %60, %51 ], [ %42, %49 ]
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %29
  store i32 %72, i32 addrspace(1)* %74, align 4, !tbaa !11
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  store float %73, float addrspace(1)* %75, align 4, !tbaa !7
  br label %141

76:                                               ; preds = %135, %36
  %77 = phi i32 [ 0, %36 ], [ %138, %135 ]
  %78 = phi float [ %31, %36 ], [ %137, %135 ]
  %79 = phi i32 [ %22, %36 ], [ %136, %135 ]
  %80 = phi i32 [ 0, %36 ], [ %139, %135 ]
  %81 = mul nsw i32 %77, %0
  %82 = add nsw i32 %81, %14
  %83 = icmp sgt i32 %77, %22
  br i1 %83, label %84, label %94

84:                                               ; preds = %76
  %85 = sext i32 %82 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  %88 = fcmp contract olt float %87, %78
  %89 = select i1 %88, i32 %77, i32 %79
  %90 = uitofp i1 %88 to float
  %91 = fsub contract float %87, %78
  %92 = fmul contract float %91, %90
  %93 = fadd contract float %78, %92
  br label %106

94:                                               ; preds = %76
  %95 = icmp slt i32 %77, %22
  br i1 %95, label %96, label %106

96:                                               ; preds = %94
  %97 = sext i32 %82 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !6
  %100 = fcmp contract ogt float %99, %78
  %101 = select i1 %100, i32 %77, i32 %79
  %102 = uitofp i1 %100 to float
  %103 = fsub contract float %99, %78
  %104 = fmul contract float %103, %102
  %105 = fadd contract float %78, %104
  br label %106

106:                                              ; preds = %84, %96, %94
  %107 = phi i32 [ %89, %84 ], [ %101, %96 ], [ %79, %94 ]
  %108 = phi float [ %93, %84 ], [ %105, %96 ], [ %78, %94 ]
  %109 = or i32 %77, 1
  %110 = mul nsw i32 %109, %0
  %111 = add nsw i32 %110, %14
  %112 = icmp slt i32 %77, %22
  br i1 %112, label %113, label %125

113:                                              ; preds = %106
  %114 = icmp slt i32 %109, %22
  br i1 %114, label %115, label %135

115:                                              ; preds = %113
  %116 = sext i32 %111 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !6
  %119 = fcmp contract ogt float %118, %108
  %120 = select i1 %119, i32 %109, i32 %107
  %121 = uitofp i1 %119 to float
  %122 = fsub contract float %118, %108
  %123 = fmul contract float %122, %121
  %124 = fadd contract float %108, %123
  br label %135

125:                                              ; preds = %106
  %126 = sext i32 %111 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !6
  %129 = fcmp contract olt float %128, %108
  %130 = select i1 %129, i32 %109, i32 %107
  %131 = uitofp i1 %129 to float
  %132 = fsub contract float %128, %108
  %133 = fmul contract float %132, %131
  %134 = fadd contract float %108, %133
  br label %135

135:                                              ; preds = %125, %115, %113
  %136 = phi i32 [ %130, %125 ], [ %120, %115 ], [ %107, %113 ]
  %137 = phi float [ %134, %125 ], [ %124, %115 ], [ %108, %113 ]
  %138 = add nuw nsw i32 %77, 2
  %139 = add i32 %80, 2
  %140 = icmp eq i32 %139, %37
  br i1 %140, label %38, label %76, !llvm.loop !13

141:                                              ; preds = %71, %5
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
