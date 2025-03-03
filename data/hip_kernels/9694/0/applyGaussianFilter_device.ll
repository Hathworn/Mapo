; ModuleID = '../data/hip_kernels/9694/0/main.cu'
source_filename = "../data/hip_kernels/9694/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19applyGaussianFilterPhS_Pfiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = sdiv i32 %5, 2
  %25 = sub nsw i32 0, %24
  %26 = icmp slt i32 %5, -1
  br i1 %26, label %67, label %27

27:                                               ; preds = %6
  %28 = tail call i32 @llvm.abs.i32(i32 %24, i1 true)
  %29 = add i32 %24, %28
  %30 = and i32 %29, 1
  %31 = icmp eq i32 %30, 0
  %32 = sub i32 %15, %24
  %33 = icmp sge i32 %32, %4
  %34 = icmp slt i32 %32, 0
  %35 = or i1 %33, %34
  %36 = sub nsw i32 1, %24
  %37 = icmp eq i32 %29, 0
  br label %38

38:                                               ; preds = %27, %76
  %39 = phi double [ 0.000000e+00, %27 ], [ %77, %76 ]
  %40 = phi i32 [ %25, %27 ], [ %78, %76 ]
  %41 = add nsw i32 %40, %23
  %42 = icmp sge i32 %41, %3
  %43 = icmp slt i32 %41, 0
  %44 = or i1 %42, %43
  %45 = add nsw i32 %40, %24
  %46 = mul nsw i32 %41, %4
  %47 = mul nsw i32 %45, %5
  %48 = add i32 %47, %24
  br i1 %31, label %49, label %63

49:                                               ; preds = %38
  %50 = select i1 %35, i1 true, i1 %44
  br i1 %50, label %63, label %51

51:                                               ; preds = %49
  %52 = add nsw i32 %32, %46
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7, !amdgpu.noclobber !5
  %56 = uitofp i8 %55 to float
  %57 = sext i32 %47 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !10, !amdgpu.noclobber !5
  %60 = fmul contract float %59, %56
  %61 = fpext float %60 to double
  %62 = fadd contract double %39, %61
  br label %63

63:                                               ; preds = %49, %51, %38
  %64 = phi double [ undef, %38 ], [ %62, %51 ], [ %39, %49 ]
  %65 = phi double [ %39, %38 ], [ %62, %51 ], [ %39, %49 ]
  %66 = phi i32 [ %25, %38 ], [ %36, %51 ], [ %36, %49 ]
  br i1 %37, label %76, label %80

67:                                               ; preds = %76, %6
  %68 = phi double [ 0.000000e+00, %6 ], [ %77, %76 ]
  %69 = fcmp contract ogt double %68, 2.550000e+02
  %70 = select i1 %69, double 2.550000e+02, double %68
  %71 = fptoui double %70 to i8
  %72 = mul nsw i32 %23, %4
  %73 = add nsw i32 %72, %15
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %74
  store i8 %71, i8 addrspace(1)* %75, align 1, !tbaa !7
  ret void

76:                                               ; preds = %122, %63
  %77 = phi double [ %64, %63 ], [ %123, %122 ]
  %78 = add i32 %40, 1
  %79 = icmp eq i32 %40, %28
  br i1 %79, label %67, label %38, !llvm.loop !12

80:                                               ; preds = %63, %122
  %81 = phi double [ %123, %122 ], [ %65, %63 ]
  %82 = phi i32 [ %124, %122 ], [ %66, %63 ]
  %83 = add nsw i32 %82, %15
  %84 = icmp sge i32 %83, %4
  %85 = icmp slt i32 %83, 0
  %86 = or i1 %84, %85
  %87 = select i1 %86, i1 true, i1 %44
  br i1 %87, label %101, label %88

88:                                               ; preds = %80
  %89 = add nsw i32 %83, %46
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7, !amdgpu.noclobber !5
  %93 = uitofp i8 %92 to float
  %94 = add i32 %48, %82
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !10, !amdgpu.noclobber !5
  %98 = fmul contract float %97, %93
  %99 = fpext float %98 to double
  %100 = fadd contract double %81, %99
  br label %101

101:                                              ; preds = %80, %88
  %102 = phi double [ %100, %88 ], [ %81, %80 ]
  %103 = add i32 %82, 1
  %104 = add nsw i32 %103, %15
  %105 = icmp sge i32 %104, %4
  %106 = icmp slt i32 %104, 0
  %107 = or i1 %105, %106
  %108 = select i1 %107, i1 true, i1 %44
  br i1 %108, label %122, label %109

109:                                              ; preds = %101
  %110 = add nsw i32 %104, %46
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %111
  %113 = load i8, i8 addrspace(1)* %112, align 1, !tbaa !7, !amdgpu.noclobber !5
  %114 = uitofp i8 %113 to float
  %115 = add i32 %48, %103
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !10, !amdgpu.noclobber !5
  %119 = fmul contract float %118, %114
  %120 = fpext float %119 to double
  %121 = fadd contract double %102, %120
  br label %122

122:                                              ; preds = %109, %101
  %123 = phi double [ %121, %109 ], [ %102, %101 ]
  %124 = add i32 %82, 2
  %125 = icmp eq i32 %103, %28
  br i1 %125, label %76, label %80, !llvm.loop !14
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
