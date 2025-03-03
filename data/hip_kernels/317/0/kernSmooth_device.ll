; ModuleID = '../data/hip_kernels/317/0/main.cu'
source_filename = "../data/hip_kernels/317/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10kernSmoothiiiPhS_PKfi(i32 %0, i32 %1, i32 %2, i8 addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture readonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %1
  %26 = icmp slt i32 %24, %2
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %133

28:                                               ; preds = %7
  %29 = icmp sgt i32 %6, 0
  br i1 %29, label %30, label %38

30:                                               ; preds = %28
  %31 = lshr i32 %6, 1
  %32 = sub i32 %16, %31
  %33 = sub i32 %24, %31
  %34 = and i32 %6, 1
  %35 = icmp eq i32 %6, 1
  %36 = and i32 %6, -2
  %37 = icmp eq i32 %34, 0
  br label %46

38:                                               ; preds = %77, %28
  %39 = phi float [ 0.000000e+00, %28 ], [ %78, %77 ]
  %40 = tail call float @llvm.fabs.f32(float %39)
  %41 = fptoui float %40 to i8
  %42 = mul nsw i32 %24, %1
  %43 = add nsw i32 %42, %16
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %44
  store i8 %41, i8 addrspace(1)* %45, align 1, !tbaa !7
  br label %133

46:                                               ; preds = %30, %77
  %47 = phi float [ 0.000000e+00, %30 ], [ %78, %77 ]
  %48 = phi i32 [ 0, %30 ], [ %79, %77 ]
  %49 = add i32 %32, %48
  %50 = icmp sgt i32 %49, -1
  %51 = icmp slt i32 %49, %1
  br i1 %35, label %52, label %81

52:                                               ; preds = %128, %46
  %53 = phi float [ undef, %46 ], [ %129, %128 ]
  %54 = phi i32 [ 0, %46 ], [ %130, %128 ]
  %55 = phi float [ %47, %46 ], [ %129, %128 ]
  br i1 %37, label %77, label %56

56:                                               ; preds = %52
  %57 = add i32 %33, %54
  %58 = icmp sgt i32 %57, -1
  %59 = select i1 %50, i1 %58, i1 false
  %60 = select i1 %59, i1 %51, i1 false
  %61 = icmp slt i32 %57, %2
  %62 = select i1 %60, i1 %61, i1 false
  br i1 %62, label %63, label %77

63:                                               ; preds = %56
  %64 = mul nsw i32 %57, %1
  %65 = add nsw i32 %64, %49
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7, !amdgpu.noclobber !5
  %69 = uitofp i8 %68 to float
  %70 = mul nsw i32 %54, %6
  %71 = add nsw i32 %70, %48
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %5, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !10, !amdgpu.noclobber !5
  %75 = fmul contract float %74, %69
  %76 = fadd contract float %55, %75
  br label %77

77:                                               ; preds = %56, %63, %52
  %78 = phi float [ %53, %52 ], [ %76, %63 ], [ %55, %56 ]
  %79 = add nuw nsw i32 %48, 1
  %80 = icmp eq i32 %79, %6
  br i1 %80, label %38, label %46, !llvm.loop !12

81:                                               ; preds = %46, %128
  %82 = phi i32 [ %130, %128 ], [ 0, %46 ]
  %83 = phi float [ %129, %128 ], [ %47, %46 ]
  %84 = phi i32 [ %131, %128 ], [ 0, %46 ]
  %85 = add i32 %33, %82
  %86 = icmp sgt i32 %85, -1
  %87 = select i1 %50, i1 %86, i1 false
  %88 = select i1 %87, i1 %51, i1 false
  %89 = icmp slt i32 %85, %2
  %90 = select i1 %88, i1 %89, i1 false
  br i1 %90, label %91, label %105

91:                                               ; preds = %81
  %92 = mul nsw i32 %85, %1
  %93 = add nsw i32 %92, %49
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %94
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !7, !amdgpu.noclobber !5
  %97 = uitofp i8 %96 to float
  %98 = mul nsw i32 %82, %6
  %99 = add nsw i32 %98, %48
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %5, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !10, !amdgpu.noclobber !5
  %103 = fmul contract float %102, %97
  %104 = fadd contract float %83, %103
  br label %105

105:                                              ; preds = %91, %81
  %106 = phi float [ %104, %91 ], [ %83, %81 ]
  %107 = or i32 %82, 1
  %108 = add i32 %33, %107
  %109 = icmp sgt i32 %108, -1
  %110 = select i1 %50, i1 %109, i1 false
  %111 = select i1 %110, i1 %51, i1 false
  %112 = icmp slt i32 %108, %2
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %128

114:                                              ; preds = %105
  %115 = mul nsw i32 %108, %1
  %116 = add nsw i32 %115, %49
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !7, !amdgpu.noclobber !5
  %120 = uitofp i8 %119 to float
  %121 = mul nsw i32 %107, %6
  %122 = add nsw i32 %121, %48
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %5, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !10, !amdgpu.noclobber !5
  %126 = fmul contract float %125, %120
  %127 = fadd contract float %106, %126
  br label %128

128:                                              ; preds = %114, %105
  %129 = phi float [ %127, %114 ], [ %106, %105 ]
  %130 = add nuw nsw i32 %82, 2
  %131 = add i32 %84, 2
  %132 = icmp eq i32 %131, %36
  br i1 %132, label %52, label %81, !llvm.loop !14

133:                                              ; preds = %7, %38
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
