; ModuleID = '../data/hip_kernels/121/169/main.cu'
source_filename = "../data/hip_kernels/121/169/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24kBoundingBoxLogisticGradPfPiS0_S0_S_S_S_iiiiffS_(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, i32 %10, float %11, float %12, float addrspace(1)* nocapture writeonly %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = icmp slt i32 %17, %8
  %20 = icmp slt i32 %18, %9
  %21 = select i1 %19, i1 %20, i1 false
  %22 = icmp slt i32 %16, %7
  %23 = select i1 %21, i1 %22, i1 false
  %24 = icmp slt i32 %15, %10
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %104

26:                                               ; preds = %14
  %27 = zext i32 %16 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %4, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = fptosi float %29 to i32
  %31 = sitofp i32 %17 to float
  %32 = fmul contract float %31, %11
  %33 = fptosi float %32 to i32
  %34 = sitofp i32 %18 to float
  %35 = fmul contract float %34, %12
  %36 = fptosi float %35 to i32
  %37 = sext i32 %30 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %37
  %39 = bitcast i32 addrspace(1)* %38 to <2 x i32> addrspace(1)*
  %40 = load <2 x i32>, <2 x i32> addrspace(1)* %39, align 4, !tbaa !10
  %41 = extractelement <2 x i32> %40, i64 0
  %42 = extractelement <2 x i32> %40, i64 1
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %104

44:                                               ; preds = %26
  %45 = getelementptr inbounds float, float addrspace(1)* %5, i64 %27
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = getelementptr inbounds float, float addrspace(1)* %6, i64 %27
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %49

49:                                               ; preds = %44, %92
  %50 = phi i32 [ 0, %44 ], [ %95, %92 ]
  %51 = phi i32 [ %41, %44 ], [ %102, %92 ]
  %52 = phi i32 [ 0, %44 ], [ %98, %92 ]
  %53 = phi i32 [ 0, %44 ], [ %101, %92 ]
  %54 = sext i32 %51 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !10, !amdgpu.noclobber !9
  %57 = shl i32 %51, 2
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !10, !amdgpu.noclobber !9
  %61 = sitofp i32 %60 to float
  %62 = fsub contract float %61, %46
  %63 = fptosi float %62 to i32
  %64 = icmp slt i32 %33, %63
  br i1 %64, label %92, label %65

65:                                               ; preds = %49
  %66 = add nuw nsw i32 %57, 3
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !10, !amdgpu.noclobber !9
  %70 = sitofp i32 %69 to float
  %71 = fsub contract float %70, %48
  %72 = fptosi float %71 to i32
  %73 = add nuw nsw i32 %57, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !10, !amdgpu.noclobber !9
  %77 = sitofp i32 %76 to float
  %78 = fsub contract float %77, %48
  %79 = fptosi float %78 to i32
  %80 = add nuw nsw i32 %57, 2
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !10, !amdgpu.noclobber !9
  %84 = sitofp i32 %83 to float
  %85 = fsub contract float %84, %46
  %86 = fptosi float %85 to i32
  %87 = icmp sle i32 %33, %86
  %88 = icmp sge i32 %36, %79
  %89 = select i1 %87, i1 %88, i1 false
  %90 = icmp sle i32 %36, %72
  %91 = select i1 %89, i1 %90, i1 false
  br label %92

92:                                               ; preds = %65, %49
  %93 = phi i1 [ false, %49 ], [ %91, %65 ]
  %94 = zext i1 %93 to i32
  %95 = add nuw nsw i32 %50, %94
  %96 = icmp eq i32 %56, %15
  %97 = zext i1 %96 to i32
  %98 = add nuw nsw i32 %52, %97
  %99 = select i1 %93, i1 %96, i1 false
  %100 = zext i1 %99 to i32
  %101 = add nuw nsw i32 %53, %100
  %102 = add nsw i32 %51, 1
  %103 = icmp slt i32 %102, %42
  br i1 %103, label %49, label %104, !llvm.loop !12

104:                                              ; preds = %92, %26, %14
  %105 = phi i32 [ 0, %14 ], [ 0, %26 ], [ %101, %92 ]
  %106 = phi i32 [ 0, %14 ], [ 0, %26 ], [ %98, %92 ]
  %107 = phi i32 [ 0, %14 ], [ 0, %26 ], [ %95, %92 ]
  %108 = mul nsw i32 %15, %9
  %109 = add nsw i32 %108, %18
  %110 = mul nsw i32 %109, %8
  %111 = add nsw i32 %110, %17
  %112 = mul nsw i32 %111, %7
  %113 = add nsw i32 %112, %16
  %114 = sext i32 %113 to i64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %25, label %115, label %131

115:                                              ; preds = %104
  %116 = icmp sgt i32 %107, 0
  br i1 %116, label %117, label %123

117:                                              ; preds = %115
  %118 = icmp sgt i32 %105, 0
  br i1 %118, label %119, label %128

119:                                              ; preds = %117
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = fadd contract float %121, -1.000000e+00
  br label %128

123:                                              ; preds = %115
  %124 = icmp sgt i32 %106, 0
  br i1 %124, label %125, label %128

125:                                              ; preds = %123
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %128

128:                                              ; preds = %125, %123, %119, %117
  %129 = phi float [ %122, %119 ], [ 0.000000e+00, %117 ], [ %127, %125 ], [ 0.000000e+00, %123 ]
  %130 = getelementptr inbounds float, float addrspace(1)* %13, i64 %114
  store float %129, float addrspace(1)* %130, align 4, !tbaa !5
  br label %131

131:                                              ; preds = %128, %104
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
