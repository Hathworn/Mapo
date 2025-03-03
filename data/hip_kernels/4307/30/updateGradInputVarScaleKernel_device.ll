; ModuleID = '../data/hip_kernels/4307/30/main.cu'
source_filename = "../data/hip_kernels/4307/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29updateGradInputVarScaleKernelPfS_iiiS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 2
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = shl i32 %14, 2
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %13, %2
  %19 = icmp slt i32 %17, %3
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %124

21:                                               ; preds = %9
  %22 = icmp sgt i32 %4, 0
  br i1 %22, label %23, label %38

23:                                               ; preds = %21
  %24 = icmp eq i32 %13, 0
  %25 = add nsw i32 %2, -1
  %26 = icmp eq i32 %13, %25
  %27 = add nsw i32 %2, 66
  %28 = icmp eq i32 %17, 0
  %29 = add nsw i32 %3, -1
  %30 = icmp eq i32 %17, %29
  %31 = add nsw i32 %3, 66
  %32 = add nsw i32 %3, 1
  %33 = add nsw i32 %2, 1
  %34 = mul nsw i32 %32, %33
  %35 = sext i32 %34 to i64
  br label %44

36:                                               ; preds = %44
  %37 = fptrunc double %120 to float
  br label %38

38:                                               ; preds = %36, %21
  %39 = phi float [ 0.000000e+00, %21 ], [ %37, %36 ]
  %40 = mul nsw i32 %13, %3
  %41 = add nsw i32 %40, %17
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  store float %39, float addrspace(1)* %43, align 4, !tbaa !5
  br label %124

44:                                               ; preds = %23, %44
  %45 = phi float addrspace(1)* [ %0, %23 ], [ %121, %44 ]
  %46 = phi i32 [ 0, %23 ], [ %122, %44 ]
  %47 = phi double [ 0.000000e+00, %23 ], [ %120, %44 ]
  %48 = zext i32 %46 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %6, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !5, !amdgpu.noclobber !9
  %51 = fneg contract float %50
  %52 = tail call float @llvm.ceil.f32(float %51)
  %53 = fptosi float %52 to i32
  %54 = getelementptr inbounds float, float addrspace(1)* %8, i64 %48
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = fneg contract float %55
  %57 = tail call float @llvm.ceil.f32(float %56)
  %58 = fptosi float %57 to i32
  %59 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = fneg contract float %60
  %62 = tail call float @llvm.floor.f32(float %61)
  %63 = fptosi float %62 to i32
  %64 = add nsw i32 %63, 1
  %65 = getelementptr inbounds float, float addrspace(1)* %7, i64 %48
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5, !amdgpu.noclobber !9
  %67 = fneg contract float %66
  %68 = tail call float @llvm.floor.f32(float %67)
  %69 = fptosi float %68 to i32
  %70 = add nsw i32 %69, 1
  %71 = icmp sgt i32 %63, -2
  %72 = select i1 %24, i1 %71, i1 false
  %73 = icmp slt i32 %53, 1
  %74 = select i1 %26, i1 %73, i1 false
  %75 = select i1 %72, i32 0, i32 %53
  %76 = select i1 %74, i32 %27, i32 %64
  %77 = icmp sgt i32 %69, -2
  %78 = select i1 %28, i1 %77, i1 false
  %79 = icmp slt i32 %58, 1
  %80 = select i1 %30, i1 %79, i1 false
  %81 = select i1 %78, i32 0, i32 %58
  %82 = select i1 %80, i32 %31, i32 %70
  %83 = add nsw i32 %75, %13
  %84 = tail call i32 @llvm.smin.i32(i32 %83, i32 %2)
  %85 = tail call i32 @llvm.smax.i32(i32 %84, i32 0)
  %86 = add nsw i32 %76, %13
  %87 = tail call i32 @llvm.smin.i32(i32 %86, i32 %2)
  %88 = tail call i32 @llvm.smax.i32(i32 %87, i32 0)
  %89 = add nsw i32 %81, %17
  %90 = tail call i32 @llvm.smin.i32(i32 %89, i32 %3)
  %91 = tail call i32 @llvm.smax.i32(i32 %90, i32 0)
  %92 = add nsw i32 %82, %17
  %93 = tail call i32 @llvm.smin.i32(i32 %92, i32 %3)
  %94 = tail call i32 @llvm.smax.i32(i32 %93, i32 0)
  %95 = mul nsw i32 %88, %32
  %96 = add nsw i32 %95, %94
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %45, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !5
  %100 = fpext float %99 to double
  %101 = fadd contract double %47, %100
  %102 = mul nsw i32 %85, %32
  %103 = add nsw i32 %102, %94
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %45, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = fpext float %106 to double
  %108 = fsub contract double %101, %107
  %109 = add nsw i32 %91, %95
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %45, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5
  %113 = fpext float %112 to double
  %114 = fsub contract double %108, %113
  %115 = add nsw i32 %102, %91
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %45, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5
  %119 = fpext float %118 to double
  %120 = fadd contract double %114, %119
  %121 = getelementptr inbounds float, float addrspace(1)* %45, i64 %35
  %122 = add nuw nsw i32 %46, 1
  %123 = icmp eq i32 %122, %4
  br i1 %123, label %36, label %44, !llvm.loop !10

124:                                              ; preds = %38, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
